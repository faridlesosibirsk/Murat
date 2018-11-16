unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, IniFiles;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    RadioGroup2: TRadioGroup;
    MainMenu1: TMainMenu;
    sdsds1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    title1: string;
    a, b, c, d, img: string;
    quest: integer;
    procedure loadQuest(next: boolean);
    { Private declarations }
  public
    first, last: integer;
    { Public declarations }
  end;

var
  Form1: TForm1;
  OtvetStr: string;

implementation

{$R *.dfm}

uses Unit3;

procedure TForm1.Button1Click(Sender: TObject);
begin
  self.loadQuest(true);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  self.loadQuest(false);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  i: integer;
begin
  quest := 1;
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    self.title1 := Ini.ReadString('Quest1', 'title1', '');
    self.a := Ini.ReadString('Quest' + IntToStr(quest), 'a', '');
    self.b := Ini.ReadString('Quest' + IntToStr(quest), 'b', '');
    self.c := Ini.ReadString('Quest' + IntToStr(quest), 'c', '');
    self.d := Ini.ReadString('Quest' + IntToStr(quest), 'd', '');
    self.img := Ini.ReadString('Quest' + IntToStr(quest), 'img', '');
  finally
    Ini.Free;
  end;
  Label2.Caption := self.title1;
  RadioGroup2.Items.Clear;
  RadioGroup2.Items.Add(self.a);
  RadioGroup2.Items.Add(self.b);
  RadioGroup2.Items.Add(self.c);
  RadioGroup2.Items.Add(self.d);
  Image1.Picture.LoadFromFile(self.img);
end;

procedure TForm1.loadQuest(next: boolean);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));

  try
    if next then
      quest := quest + 1
    else
      quest := quest - 1;
    self.title1 := Ini.ReadString('Quest' + IntToStr(quest), 'title1', '');
    self.a := Ini.ReadString('Quest' + IntToStr(quest), 'a', '');
    self.b := Ini.ReadString('Quest' + IntToStr(quest), 'b', '');
    self.c := Ini.ReadString('Quest' + IntToStr(quest), 'c', '');
    self.d := Ini.ReadString('Quest' + IntToStr(quest), 'd', '');
    self.img := Ini.ReadString('Quest' + IntToStr(quest), 'img', '');
  finally
    Ini.Free;
  end;
  Label2.Caption := self.title1;
  RadioGroup2.Items.Clear;
  RadioGroup2.Items.Add(self.a);
  RadioGroup2.Items.Add(self.b);
  RadioGroup2.Items.Add(self.c);
  RadioGroup2.Items.Add(self.d);
  Image1.Picture.LoadFromFile(self.img);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  Close;
end;

end.
