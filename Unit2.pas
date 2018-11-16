unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles;

type
  TForm2 = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button1: TButton;
    Memo1: TMemo;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Quests: TIniFile;
  IntnextQuest: integer;
  OtvetStr: string;
  OtvetUserStr: string;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  case RadioButton1.Checked of
    true:
      begin
        OtvetUserStr := 'A';
      end;
    false:
      begin
        OtvetUserStr := 'B';
      end;
  end;
  if OtvetStr = OtvetUserStr then
  begin
    ShowMessage('Правильно ответили');
  end;

    begin
      IntnextQuest := 1;
      if RadioButton1.Checked = true then
        Inc(IntnextQuest);
        Memo1.Lines.Clear;
        Quests := TIniFile.Create(ExtractFilePath(Application.ExeName) +
          'Quests1.ini');
        Memo1.Lines.Add(Quests.ReadString('Quest' + IntTostr(IntnextQuest),
          'Quest', 'Тест окончен'));
        OtvetStr := (Quests.ReadString('Quest' + IntTostr(IntnextQuest),
          'Otvet', 'Тест окончен'));
      end;
end;

      procedure TForm2.Button2Click(Sender: TObject);
      begin
        Inc(IntnextQuest);
        Memo1.Lines.Clear;
        Quests := TIniFile.Create(ExtractFilePath(Application.ExeName) +
          'Quests1.ini');
        Memo1.Lines.Add(Quests.ReadString('Quest' + IntTostr(IntnextQuest),
          'Quest', 'Тест окончен'));
        OtvetStr := (Quests.ReadString('Quest' + IntTostr(IntnextQuest),
          'Otvet', 'Тест окончен'));
      end;

end.
