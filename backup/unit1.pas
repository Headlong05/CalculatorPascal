unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    delBtn: TButton;
    LabelHistory: TLabel;
    minusBtn: TButton;
    multBtn1: TButton;
    multBtn2: TButton;
    multBtn3: TButton;
    multBtn4: TButton;
    Num1: TButton;
    Num0: TButton;
    Num2: TButton;
    Num3: TButton;
    Num4: TButton;
    Num5: TButton;
    Num6: TButton;
    Num7: TButton;
    Num8: TButton;
    Num9: TButton;
    plusBtn: TButton;
    negativeBtn: TButton;
    comBtn: TButton;
    clearBtn: TButton;
    shResBtn: TButton;
    clearAllBtn: TButton;
    divBtn: TButton;
    multBtn: TButton;
    LabelRes: TLabel;
    procedure actBtnClick(Sender: TObject);
    procedure clearAllBtnClick(Sender: TObject);
    procedure clearBtnClick(Sender: TObject);
    procedure delBtnClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FuncBtnClick(Sender: TObject);
    procedure NumBtnClick(Sender: TObject);
    procedure shResBtnClick(Sender: TObject);
  private

  public
    res: Double;
    frstNum: Double;
    scndNum: Double;
    act: String;
    func: String;
    tempString: String;
    a: Int64;
    c : Char;

  end;

var
  Form1: TForm1;

implementation

uses LCLType;

{$R *.lfm}

{ TForm1 }




procedure TForm1.clearBtnClick(Sender: TObject);
begin
  LabelRes.Caption := '0';
  frstNum := 0;
end;

procedure TForm1.clearAllBtnClick(Sender: TObject);
begin
  LabelRes.Caption := '0';
  LabelHistory.Caption := '';
  frstNum := 0;
  scndNum := 0;
  act := '';

end;

procedure TForm1.delBtnClick(Sender: TObject);
begin
  if LabelRes.Caption <> '0' then
     begin
      tempString := LabelRes.Caption;
      Delete(tempString,length(tempString),1);
      LabelRes.Caption := tempString;
     end;
  if length(LabelRes.Caption) = 0 then
     LabelRes.Caption := '0';
end;


procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = VK_F1 then
        ShowMessage('О программе' + #10#13 + 'Смоляков Артем, 2024' + #10#13 + 'Выражаю благодарность Смолякову Дмитрию Геннадьевичу и Смоляковой Ольге Ивановне за воспитание такого прекрасного разработчика.');

  if Chr(Key) in ['0'..'9', ','] then
  begin
     if LabelRes.Caption <> '0' then
        LabelRes.Caption:= LabelRes.Caption + Chr(Key)
     else
         LabelRes.Caption:= Chr(Key);
  end;

  if Key in [43] then
     shResBtnClick(nil);


end;


procedure TForm1.actBtnClick(Sender: TObject);
begin
  If act <> (Sender as TButton).Caption then
     begin
        if (LabelRes.Caption <> '0') and (LabelHistory.Caption = '') then
        begin
           act := (Sender as TButton).Caption;
           frstNum := StrToFloat(LabelRes.Caption);
           LabelHistory.Caption := act + ' ' + LabelRes.Caption;
           LabelRes.Caption := '0';
        end
        else
        begin
          act := (Sender as TButton).Caption;
          LabelHistory.Caption := act + ' ' + frstNum.ToString();
        end;
     end;
end;

procedure TForm1.FuncBtnClick(Sender: TObject);
begin
  func := (Sender as TButton).Caption;
  frstNum := StrToFloat(LabelRes.Caption);
  if func = '%' then
     LabelRes.Caption := (frstNum / 100).ToString()
  else if func = 'x²' then
       LabelRes.Caption := (frstNum * frstNum).ToString()
  else if func = '+/-' then
       LabelRes.Caption := (-1 * frstNum).ToString()
  else if (func = '√') and (frstNum >= 0) then
       LabelRes.Caption := (sqrt(frstNum)).ToString()
  else if func = '1/x' then
       begin
       if LabelRes.Caption <> '0' then
          LabelRes.Caption := (1/frstNum).ToString()
       else
           ShowMessage('На 0 делить нельзя!');
       end;

  frstNum := StrToFloat(LabelRes.Caption);

end;


procedure TForm1.NumBtnClick(Sender: TObject);
begin

  if LabelRes.Caption = '0' then
     LabelRes.Caption := (Sender as TButton).Caption
  else
      if (Sender as TButton).Caption = ',' then
         LabelRes.Caption:= LabelRes.Caption + (Sender as TButton).Caption
      else
          LabelRes.Caption:= LabelRes.Caption + (Sender as TButton).Caption;
end;



procedure TForm1.shResBtnClick(Sender: TObject);
begin
  if LabelHistory.Caption <> '' then
     begin
        scndNum := StrToFloat(LabelRes.Caption);

        if act = '+'then
           res := frstNum + scndNum
        else if act = '-' then
           res := frstNum - scndNum
        else if act = '*' then
           res := frstNum * scndNum
        else if act = '/' then
           begin
           if scndNum <> 0 then
              res := frstNum / scndNum
           else
                ShowMessage('На 0 делить нельзя!');
           end;

        LabelHistory.Caption := '';
        act := '';

        LabelRes.Caption := FloatToStr(res);


     end;
end;

end.

















