unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, DateUtils, System.Generics.Collections,
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
    N3: TMenuItem;
    Label1: TLabel;
    Timer1: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    count1, count2: string;
    ItemIndex: integer;
    List: array [1 .. 100] of integer;
    q: array [1 .. 100] of integer;
    sum: array [1 .. 100] of integer;
    Res: integer;
    title1: string;
    a, b, c, d, img: string;
    quest: integer;
    procedure loadQuest(next: boolean);
    procedure resulte;
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
var
  variant: integer;
begin

  variant := ItemIndex;

  List[quest] := variant;
  Label5.Caption := INTTOStr(variant);

  if q[quest] = List[quest] then
  begin
    sum[quest-1] := 1;
    Label6.Caption := 'правильно';
  end
  else
  begin
    sum[quest] := -1;
    Label6.Caption := 'не правильно';
  end;
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
  Res := 10;
  Timer1.Interval := 1000;
  Timer1.Enabled := true;
  quest := 1;
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    self.count1 := INTTOStr(quest);
    self.count2 := Ini.ReadString('Form', 'count', '');

    self.title1 := Ini.ReadString('Quest1', 'title1', '');
    self.a := Ini.ReadString('Quest' + INTTOStr(quest), 'a', '');
    self.b := Ini.ReadString('Quest' + INTTOStr(quest), 'b', '');
    self.c := Ini.ReadString('Quest' + INTTOStr(quest), 'c', '');
    self.d := Ini.ReadString('Quest' + INTTOStr(quest), 'd', '');
    self.img := Ini.ReadString('Quest' + INTTOStr(quest), 'img', '');
    self.q[quest] := STRTOINT(Ini.ReadString('Quest' + INTTOStr(quest),
      'q', ''));
  finally
    Ini.Free;

  end;
  Label7.Caption := self.count1 + ' из ' + self.count2;
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
    if Quest<=STRTOINT(self.count2) then

  begin
    self.count1 := INTTOStr(quest);
    self.count2 := Ini.ReadString('Form', 'count', '');
    self.title1 := Ini.ReadString('Quest' + INTTOStr(quest), 'title1', '');
    self.a := Ini.ReadString('Quest' + INTTOStr(quest), 'a', '');
    self.b := Ini.ReadString('Quest' + INTTOStr(quest), 'b', '');
    self.c := Ini.ReadString('Quest' + INTTOStr(quest), 'c', '');
    self.d := Ini.ReadString('Quest' + INTTOStr(quest), 'd', '');
    self.img := Ini.ReadString('Quest' + INTTOStr(quest), 'img', '');
    self.q[quest] := STRTOINT(Ini.ReadString('Quest' + INTTOStr(quest),
      'q', ''));
     end;
  finally ;

    if (Ini.ReadString('Quest' + INTTOStr(quest), 'title1', '') = '') then
      self.resulte;
    Ini.Free;
  end;
  Label7.Caption := self.count1 + ' из ' + self.count2;
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

procedure TForm1.N3Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);

begin
  Label4.Caption := INTTOStr(RadioGroup2.ItemIndex);
  ItemIndex := RadioGroup2.ItemIndex;
end;

procedure TForm1.resulte;
var
  s, i, c: integer;

begin
s:=0;
  self.Button1.Visible := false;
  self.Button2.Visible := false;
  self.RadioGroup2.Visible := false;
  self.Image1.Visible := false;
  self.Label1.Visible := true;
  Label3.Caption := 'тест завершен';
  c := STRTOINT(self.count2);
  for i := 1 to c do
    s := s + sum[i];

  Label8.Caption := INTTOStr(s)+' правильных ответов из ' +INTTOStr(c);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Res > 0 then
    Label3.Caption := 'осталось - ' + INTTOStr(Res) + ' секунд'
  else
  begin
    resulte;
    timer1.Enabled:=false;
  end;
  dec(Res);
  //Label3.Caption := TimeToStr(Now);
end;

end.
