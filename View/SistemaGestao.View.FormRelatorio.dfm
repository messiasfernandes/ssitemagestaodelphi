object FormRelatorio: TFormRelatorio
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Relato'#243'rios'
  ClientHeight = 309
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 309
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 112
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    object GroupBox1: TGroupBox
      Left = 8
      Top = 16
      Width = 401
      Height = 73
      Caption = 'Estoque Produtos'
      TabOrder = 0
      object btn_relestqqueproduto: TSpeedButton
        Left = 344
        Top = 31
        Width = 41
        Height = 22
        OnClick = btn_relestqqueprodutoClick
      end
      object edtqtde1: TEdit
        Left = 24
        Top = 32
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 0
      end
      object edtqte2: TEdit
        Left = 184
        Top = 32
        Width = 121
        Height = 21
        NumbersOnly = True
        TabOrder = 1
      end
    end
  end
end
