object FrmContasApagar: TFrmContasApagar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FrmContasApagar'
  ClientHeight = 507
  ClientWidth = 931
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 931
    Height = 507
    ActivePage = TabConsultaConta
    Align = alClient
    TabOrder = 0
    object TabConsultaConta: TTabSheet
      Caption = 'TabConsultaConta'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 923
        Height = 477
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnlHeader: TPanel
          Left = 0
          Top = 0
          Width = 923
          Height = 97
          Align = alTop
          BevelOuter = bvNone
          Color = clTeal
          ParentBackground = False
          TabOrder = 0
          object Label3: TLabel
            Left = 15
            Top = 19
            Width = 42
            Height = 15
            Caption = 'Daata 1'
          end
          object Label4: TLabel
            Left = 267
            Top = 19
            Width = 42
            Height = 15
            Caption = 'Daata 2'
          end
          object edt_chave: TSearchBox
            Left = 15
            Top = 63
            Width = 335
            Height = 23
            CharCase = ecUpperCase
            TabOrder = 0
            OnInvokeSearch = edt_chaveInvokeSearch
          end
          object RadioButton1: TRadioButton
            Left = 387
            Top = 67
            Width = 113
            Height = 17
            Caption = '&Cancelado'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = RadioButton1Click
          end
          object RadioButton2: TRadioButton
            Left = 492
            Top = 66
            Width = 113
            Height = 17
            Caption = 'C&npj/Cpf'
            TabOrder = 2
            OnClick = RadioButton2Click
          end
          object RadioButton3: TRadioButton
            Left = 581
            Top = 66
            Width = 113
            Height = 17
            Caption = '&Atrasado'
            TabOrder = 3
            OnClick = RadioButton3Click
          end
          object data1: TDateTimePicker
            Left = 79
            Top = 15
            Width = 142
            Height = 23
            Date = 44182.000000000000000000
            Time = 0.455749120366817800
            TabOrder = 4
          end
          object data2: TDateTimePicker
            Left = 342
            Top = 15
            Width = 142
            Height = 23
            Date = 44182.000000000000000000
            Time = 0.455749120366817800
            TabOrder = 5
          end
          object pnlfiltrar: TPanel
            Left = 514
            Top = 13
            Width = 75
            Height = 27
            BevelOuter = bvNone
            Color = 13198351
            ParentBackground = False
            TabOrder = 6
            object btn_buscar: TSpeedButton
              Left = 0
              Top = 0
              Width = 75
              Height = 27
              Cursor = crHandPoint
              Align = alClient
              Caption = 'Filtrar'
              Flat = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              Glyph.Data = {
                2E060000424D2E06000000000000360400002800000015000000150000000100
                080000000000F8010000C40E0000C40E00000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFF6FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFF6F6F6FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F6F600
                0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F6F6FF000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFF6F6F6F6F6FFFF000000FFFFFFFFFFFFF6F6F6F6FFFFFFFF
                F6F6F6F6FFFFFF000000FFFFFFFFF6F6F6FFFFF6F6F6F6F6F6F6F6FFFFFFFF00
                0000FFFFF6F6FFFFFFFFFFFFFFFFF6F6F6FFFFFFFFFFFF000000FFFFF6FFFFFF
                FFF6F6FFFFFFFFF6FFFFFFFFFFFFFF000000FFF6F6FFFFF6F6FFFFFFFFFFFFFF
                F6FFFFFFFFFFFF000000FFF6FFFFF6F6FFFFFFFFFFFFFFFFF6FFFFFFFFFFFF00
                0000F6F6FFFFF6FFFFFFFFFFFFFFFFFFF6F6FFFFFFFFFF000000F6F6FFF6FFFF
                FFFFFFFFFFFFFFFFFFF6FFFFFFFFFF000000F6F6FFFFFFFFFFFFFFFFFFFFFFFF
                FFF6FFFFFFFFFF000000F6F6FFFFFFFFFFFFFFFFFFFFFFFFF6F6FFFFFFFFFF00
                0000FFF6FFFFFFFFFFFFFFFFFFFFFFFFF6FFFFFFFFFFFF000000FFF6F6FFFFFF
                FFFFFFFFFFFFFFFFF6FFFFFFFFFFFF000000FFFFF6FFFFFFFFFFFFFFFFFFFFF6
                FFFFFFFFFFFFFF000000FFFFFFF6F6FFFFFFFFFFFFFFF6F6FFFFFFFFFFFFFF00
                0000FFFFFFFFF6F6F6F6F6F6F6F6FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
                F6F6F6F6FFFFFFFFFFFFFFFFFFFFFF000000}
              ParentFont = False
              OnClick = btn_buscarClick
              OnMouseEnter = btn_buscarMouseEnter
              OnMouseLeave = btn_buscarMouseLeave
              ExplicitLeft = 48
              ExplicitWidth = 23
              ExplicitHeight = 22
            end
          end
        end
        object pnlGrid: TPanel
          Left = 0
          Top = 97
          Width = 923
          Height = 329
          Align = alTop
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          Color = clWhite
          Padding.Left = 10
          Padding.Top = 5
          Padding.Right = 10
          Padding.Bottom = 5
          ParentBackground = False
          TabOrder = 1
          object ListView1: TListView
            Left = 10
            Top = 5
            Width = 903
            Height = 319
            Align = alClient
            Columns = <
              item
                Caption = 'Id Conta'
                Width = 80
              end
              item
                Alignment = taRightJustify
                Caption = 'N'#250'mero T'#237'tulo'
                Width = 100
              end
              item
                Caption = 'Fornecedor'
                Width = 300
              end
              item
                Alignment = taRightJustify
                Caption = 'Valor '#224' Pagar'
                Width = 100
              end
              item
                Caption = 'Data Vecimento'
                Width = 120
              end
              item
                Alignment = taRightJustify
                Caption = 'Valor Pago'
                Width = 90
              end
              item
                Alignment = taRightJustify
                Caption = 'Valor Parcela'
                Width = 90
              end
              item
                Caption = 'Status'
                Width = 100
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
            OnAdvancedCustomDrawItem = ListView1AdvancedCustomDrawItem
            OnColumnClick = ListView1ColumnClick
            OnCompare = ListView1Compare
          end
        end
        object pnlfooter: TPanel
          Left = 0
          Top = 419
          Width = 923
          Height = 58
          Align = alBottom
          BevelOuter = bvNone
          Color = clMoneyGreen
          ParentBackground = False
          TabOrder = 2
          object pnlbotoes: TPanel
            Left = 290
            Top = 0
            Width = 633
            Height = 58
            Align = alRight
            BevelOuter = bvNone
            Color = clMoneyGreen
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              633
              58)
            object pnl_lancar: TPanel
              Left = 415
              Top = 4
              Width = 97
              Height = 48
              BevelOuter = bvNone
              Color = 11305310
              ParentBackground = False
              TabOrder = 0
              object btn_lancar: TSpeedButton
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 91
                Height = 42
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Lan'#231'ar'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                OnMouseEnter = btn_lancarMouseEnter
                OnMouseLeave = btn_lancarMouseLeave
                ExplicitLeft = 32
                ExplicitTop = 24
                ExplicitWidth = 23
                ExplicitHeight = 22
              end
            end
            object pnl_editar: TPanel
              Left = 202
              Top = 4
              Width = 97
              Height = 48
              Anchors = [akTop, akRight]
              BevelOuter = bvNone
              Color = 8222060
              ParentBackground = False
              TabOrder = 1
              object btn_editar: TSpeedButton
                Left = 0
                Top = 0
                Width = 97
                Height = 48
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Editar'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = btn_editarClick
                OnMouseEnter = btn_editarMouseEnter
                OnMouseLeave = btn_editarMouseLeave
                ExplicitLeft = 64
                ExplicitTop = 16
                ExplicitWidth = 23
                ExplicitHeight = 22
              end
            end
            object pnl_baixar: TPanel
              Left = 307
              Top = 4
              Width = 97
              Height = 48
              Anchors = [akTop, akRight]
              BevelOuter = bvNone
              Color = 13680776
              ParentBackground = False
              TabOrder = 2
              object btn_baixar: TSpeedButton
                Left = 0
                Top = 0
                Width = 97
                Height = 48
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Baixar'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = btn_baixarClick
                OnMouseEnter = btn_baixarMouseEnter
                OnMouseLeave = btn_baixarMouseLeave
                ExplicitLeft = 48
                ExplicitTop = 24
                ExplicitWidth = 23
                ExplicitHeight = 22
              end
            end
            object pnl_novo: TPanel
              Left = 97
              Top = 4
              Width = 97
              Height = 48
              Anchors = [akTop, akRight]
              BevelOuter = bvNone
              Color = 7065241
              ParentBackground = False
              TabOrder = 3
              object btn_novo: TSpeedButton
                Left = 0
                Top = 0
                Width = 97
                Height = 48
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Novo'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = btn_novoClick
                OnMouseEnter = btn_novoMouseEnter
                OnMouseLeave = btn_novoMouseLeave
                ExplicitTop = 8
                ExplicitHeight = 49
              end
            end
            object pnl_fechar: TPanel
              Left = 520
              Top = 4
              Width = 97
              Height = 48
              Anchors = [akTop, akRight]
              BevelOuter = bvNone
              Color = 8816370
              ParentBackground = False
              TabOrder = 4
              object btn_fechar: TSpeedButton
                Left = 0
                Top = 0
                Width = 97
                Height = 48
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Fechar'
                Flat = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = btn_fecharClick
                OnMouseEnter = btn_fecharMouseEnter
                OnMouseLeave = btn_fecharMouseLeave
                ExplicitLeft = -2
              end
            end
          end
        end
      end
    end
    object TAbBaixarConta: TTabSheet
      Caption = 'TabBaixarConta'
      ImageIndex = 1
      object pnlCadHeader: TPanel
        Left = 0
        Top = 0
        Width = 923
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        Color = clTeal
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 32
          Top = 23
          Width = 294
          Height = 45
          Caption = 'Pagar Conta /Editar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -32
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnl_body_input: TPanel
        Left = 0
        Top = 89
        Width = 923
        Height = 325
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object Label2: TLabel
          Left = 579
          Top = 151
          Width = 58
          Height = 15
          Caption = 'Valor Pago'
        end
        object edt_idconta: TLabeledEdit
          Left = 56
          Top = 56
          Width = 89
          Height = 23
          EditLabel.Width = 49
          EditLabel.Height = 15
          EditLabel.Caption = 'Id  Conta'
          NumbersOnly = True
          TabOrder = 0
        end
        object edt_nomefornecedor: TLabeledEdit
          Left = 224
          Top = 112
          Width = 377
          Height = 23
          EditLabel.Width = 118
          EditLabel.Height = 15
          EditLabel.Caption = 'Nome do Fornecedor'
          TabOrder = 1
        end
        object edt_idFornecedor: TLabeledEdit
          Left = 56
          Top = 112
          Width = 89
          Height = 23
          EditLabel.Width = 71
          EditLabel.Height = 15
          EditLabel.Caption = 'Id Forncedor'
          NumbersOnly = True
          TabOrder = 2
        end
        object edt_numparcela: TLabeledEdit
          Left = 224
          Top = 56
          Width = 153
          Height = 23
          EditLabel.Width = 96
          EditLabel.Height = 15
          EditLabel.Caption = 'N'#250'umero Parcela'
          TabOrder = 3
        end
        object edtdatavencimento: TLabeledEdit
          Left = 408
          Top = 56
          Width = 193
          Height = 23
          EditLabel.Width = 113
          EditLabel.Height = 15
          EditLabel.Caption = 'Data de Vencimento'
          TabOrder = 4
        end
        object edt_valor_parclela: TLabeledEdit
          Left = 775
          Top = 56
          Width = 121
          Height = 23
          EditLabel.Width = 71
          EditLabel.Height = 15
          EditLabel.Caption = 'Valor parcela'
          TabOrder = 5
        end
        object edt_numtitulo: TLabeledEdit
          Left = 632
          Top = 56
          Width = 121
          Height = 23
          EditLabel.Width = 81
          EditLabel.Height = 15
          EditLabel.Caption = 'N'#250'mero T'#237'tulo'
          TabOrder = 6
        end
        object edt_idforma: TLabeledEdit
          Left = 56
          Top = 168
          Width = 89
          Height = 23
          EditLabel.Width = 71
          EditLabel.Height = 15
          EditLabel.Caption = 'Id FornaPgto'
          TabOrder = 7
        end
        object edt_forma: TLabeledEdit
          Left = 224
          Top = 168
          Width = 305
          Height = 23
          EditLabel.Width = 118
          EditLabel.Height = 15
          EditLabel.Caption = 'Forma de Pagamento'
          TabOrder = 8
        end
        object edt_valor_a_pagar: TLabeledEdit
          Left = 776
          Top = 112
          Width = 121
          Height = 23
          EditLabel.Width = 71
          EditLabel.Height = 15
          EditLabel.Caption = 'Valor '#224' Pagar'
          TabOrder = 9
          OnChange = edt_valor_a_pagarChange
        end
        object edt_cnpj: TLabeledEdit
          Left = 632
          Top = 112
          Width = 121
          Height = 23
          EditLabel.Width = 48
          EditLabel.Height = 15
          EditLabel.Caption = 'Cnpj/Cpf'
          TabOrder = 10
        end
        object edt_valorPago: TEdit
          Left = 579
          Top = 172
          Width = 121
          Height = 23
          NumbersOnly = True
          TabOrder = 11
          OnChange = edt_valorPagoChange
        end
        object pnlforma: TPanel
          Left = 159
          Top = 166
          Width = 40
          Height = 26
          BevelOuter = bvNone
          Color = 13198351
          Font.Charset = ANSI_CHARSET
          Font.Color = 13198351
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 12
          object SpeedButton1: TSpeedButton
            Left = 0
            Top = 0
            Width = 40
            Height = 26
            Cursor = crHandPoint
            Align = alClient
            Flat = True
            Glyph.Data = {
              2E060000424D2E06000000000000360400002800000015000000150000000100
              080000000000F8010000C40E0000C40E00000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFF6FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF6F6F6FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F6F600
              0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6F6F6FF000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFF6F6F6F6F6FFFF000000FFFFFFFFFFFFF6F6F6F6FFFFFFFF
              F6F6F6F6FFFFFF000000FFFFFFFFF6F6F6FFFFF6F6F6F6F6F6F6F6FFFFFFFF00
              0000FFFFF6F6FFFFFFFFFFFFFFFFF6F6F6FFFFFFFFFFFF000000FFFFF6FFFFFF
              FFF6F6FFFFFFFFF6FFFFFFFFFFFFFF000000FFF6F6FFFFF6F6FFFFFFFFFFFFFF
              F6FFFFFFFFFFFF000000FFF6FFFFF6F6FFFFFFFFFFFFFFFFF6FFFFFFFFFFFF00
              0000F6F6FFFFF6FFFFFFFFFFFFFFFFFFF6F6FFFFFFFFFF000000F6F6FFF6FFFF
              FFFFFFFFFFFFFFFFFFF6FFFFFFFFFF000000F6F6FFFFFFFFFFFFFFFFFFFFFFFF
              FFF6FFFFFFFFFF000000F6F6FFFFFFFFFFFFFFFFFFFFFFFFF6F6FFFFFFFFFF00
              0000FFF6FFFFFFFFFFFFFFFFFFFFFFFFF6FFFFFFFFFFFF000000FFF6F6FFFFFF
              FFFFFFFFFFFFFFFFF6FFFFFFFFFFFF000000FFFFF6FFFFFFFFFFFFFFFFFFFFF6
              FFFFFFFFFFFFFF000000FFFFFFF6F6FFFFFFFFFFFFFFF6F6FFFFFFFFFFFFFF00
              0000FFFFFFFFF6F6F6F6F6F6F6F6FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
              F6F6F6F6FFFFFFFFFFFFFFFFFFFFFF000000}
            OnClick = SpeedButton1Click
            OnMouseLeave = SpeedButton1MouseLeave
            OnMouseMove = SpeedButton1MouseMove
            ExplicitLeft = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
      end
      object pnlBotaoes: TPanel
        Left = 0
        Top = 414
        Width = 923
        Height = 63
        Align = alBottom
        BevelOuter = bvNone
        Color = clMoneyGreen
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          923
          63)
        object pnl_BaixarConta: TPanel
          Left = 590
          Top = 6
          Width = 97
          Height = 48
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 11305310
          ParentBackground = False
          TabOrder = 0
          object btn_pagar: TSpeedButton
            Left = 0
            Top = 0
            Width = 97
            Height = 48
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Pagar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btn_pagarClick
            OnMouseEnter = btn_pagarMouseEnter
            OnMouseLeave = btn_pagarMouseLeave
            ExplicitLeft = 2
          end
        end
        object pnl_alterar: TPanel
          Left = 695
          Top = 6
          Width = 97
          Height = 48
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 2828067
          ParentBackground = False
          TabOrder = 1
          object btn_alterar: TSpeedButton
            Left = 0
            Top = 0
            Width = 97
            Height = 48
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Editar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnMouseEnter = btn_alterarMouseEnter
            OnMouseLeave = btn_alterarMouseLeave
            ExplicitLeft = 72
            ExplicitTop = 16
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object pnl_voltar: TPanel
          Left = 800
          Top = 6
          Width = 97
          Height = 48
          Anchors = [akTop, akRight]
          BevelOuter = bvNone
          Color = 9161707
          ParentBackground = False
          TabOrder = 2
          object btn_voltar: TSpeedButton
            Left = 0
            Top = 0
            Width = 97
            Height = 48
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Voltar'
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btn_voltarClick
            OnMouseEnter = btn_voltarMouseEnter
            OnMouseLeave = btn_voltarMouseLeave
            ExplicitLeft = -2
          end
        end
      end
    end
    object TabLancarContas: TTabSheet
      Caption = 'TabLancarContas'
      ImageIndex = 2
    end
  end
end
