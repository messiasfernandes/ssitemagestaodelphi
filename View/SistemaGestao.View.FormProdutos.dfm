inherited FrmProduto: TFrmProduto
  Caption = 'FrmProuto'
  ClientHeight = 533
  ClientWidth = 884
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Segoe UI Black'
  Font.Style = [fsBold]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 884
  ExplicitHeight = 533
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label4: TLabel
    Width = 76
    ExplicitWidth = 76
  end
  inherited Pageprincipal: TPageControl
    Width = 884
    Height = 533
    ExplicitWidth = 884
    ExplicitHeight = 533
    inherited Tabconsulta: TTabSheet
      ExplicitWidth = 876
      ExplicitHeight = 504
      inherited Panel1: TPanel
        Width = 876
        ExplicitWidth = 876
        inherited edt_chave: TSearchBox
          Left = 20
          ExplicitLeft = 20
        end
        inherited rdCodigo: TRadioButton
          Left = 407
          ExplicitLeft = 407
        end
        object RadioButton1: TRadioButton
          Left = 489
          Top = 33
          Width = 113
          Height = 17
          Caption = 'C&ategorias'
          TabOrder = 2
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 592
          Top = 33
          Width = 113
          Height = 17
          Caption = '&QteTenha'
          TabOrder = 3
          OnClick = RadioButton2Click
        end
      end
      inherited Panel2: TPanel
        Top = 439
        Width = 876
        ExplicitTop = 439
        ExplicitWidth = 876
        inherited pnl_fechar: TPanel
          Left = 765
          TabOrder = 1
          ExplicitLeft = 765
        end
        inherited pnnl_excluir: TPanel
          Left = 650
          TabOrder = 0
          ExplicitLeft = 650
          inherited btn_excluir: TSpeedButton
            ExplicitLeft = 41
          end
        end
        inherited pnl_editar: TPanel
          Left = 535
          ExplicitLeft = 535
        end
        inherited pl_novo: TPanel
          Left = 425
          ExplicitLeft = 425
        end
      end
      inherited Panel3: TPanel
        Width = 876
        Height = 358
        Padding.Left = 5
        Padding.Top = 10
        Padding.Right = 5
        Padding.Bottom = 10
        ExplicitWidth = 876
        ExplicitHeight = 358
        object ListView1: TListView
          AlignWithMargins = True
          Left = 8
          Top = 13
          Width = 860
          Height = 332
          Align = alClient
          Columns = <
            item
              Caption = 'C'#243'digo'
              Width = 80
            end
            item
              Caption = 'Descri'#231#227'o Produto'
              Width = 250
            end
            item
              Alignment = taRightJustify
              Caption = 'Pre'#231'o Venda'
              Width = 90
            end
            item
              Alignment = taRightJustify
              Caption = 'Qtde Estoque'
              Width = 100
            end
            item
              Caption = 'Categoria'
              Width = 150
            end
            item
              Caption = 'Marca'
              Width = 100
            end
            item
              Caption = 'Unidade'
              Width = 80
            end>
          FlatScrollBars = True
          GridLines = True
          HotTrack = True
          ReadOnly = True
          RowSelect = True
          ParentColor = True
          SortType = stData
          TabOrder = 0
          ViewStyle = vsReport
          OnAdvancedCustomDrawItem = ListView1AdvancedCustomDrawItem
        end
      end
    end
    inherited tabcadastro: TTabSheet
      ExplicitWidth = 876
      ExplicitHeight = 504
      inherited Panel4: TPanel
        Width = 876
        ExplicitWidth = 876
        object Label16: TLabel
          Left = 39
          Top = 11
          Width = 232
          Height = 32
          Caption = 'Cadastro   Produtos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -24
          Font.Name = 'Segoe UI Black'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      inherited Panel5: TPanel
        Top = 439
        Width = 876
        ExplicitTop = 439
        ExplicitWidth = 876
        inherited pnl_salvar: TPanel
          Left = 656
          ExplicitLeft = 656
          inherited btn_salvar: TSpeedButton
            ExplicitLeft = 611
          end
        end
        inherited pnle_voltar: TPanel
          Left = 766
          ExplicitLeft = 766
        end
      end
      inherited Panel6: TPanel
        Width = 876
        Height = 374
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'Segoe UI'
        ParentFont = False
        ExplicitWidth = 876
        ExplicitHeight = 374
        inherited Label2: TLabel
          Left = 39
          Top = 20
          Width = 44
          Height = 17
          Font.Charset = ANSI_CHARSET
          Font.Height = -13
          Font.Name = 'Segoe UI'
          ParentFont = False
          ExplicitLeft = 39
          ExplicitTop = 20
          ExplicitWidth = 44
          ExplicitHeight = 17
        end
        object Label1: TLabel [1]
          Left = 223
          Top = 17
          Width = 123
          Height = 17
          Caption = 'Descri'#231#227'o Produto *'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel [2]
          Left = 607
          Top = 20
          Width = 92
          Height = 17
          Caption = 'Tipo Produto *'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel [3]
          Left = 751
          Top = 20
          Width = 67
          Height = 17
          Caption = 'Unidades *'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel [4]
          Left = 39
          Top = 84
          Width = 105
          Height = 17
          Caption = 'Pre'#231'o de Compra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel [5]
          Left = 223
          Top = 84
          Width = 105
          Height = 17
          Caption = 'Pre'#231'o de Venda *'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel [6]
          Left = 399
          Top = 84
          Width = 37
          Height = 17
          Caption = 'Marca'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel [7]
          Left = 666
          Top = 84
          Width = 151
          Height = 17
          Caption = 'Data da '#218'tima Compra *'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel [8]
          Left = 39
          Top = 134
          Width = 78
          Height = 17
          Caption = 'Custo M'#233'dio'
        end
        object Label11: TLabel [9]
          Left = 190
          Top = 132
          Width = 105
          Height = 17
          Caption = 'C'#243'digo de Barras'
        end
        object Label12: TLabel [10]
          Left = 406
          Top = 134
          Width = 75
          Height = 17
          Caption = 'Id Categoria'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel [11]
          Left = 565
          Top = 134
          Width = 59
          Height = 17
          Caption = 'Categoria'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel [12]
          Left = 39
          Top = 197
          Width = 83
          Height = 17
          Caption = 'Qtde Estoque'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel [13]
          Left = 190
          Top = 197
          Width = 112
          Height = 17
          Caption = 'C'#243'digo Fabricante'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel [14]
          Left = 406
          Top = 197
          Width = 29
          Height = 17
          Caption = 'Peso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited edt_codigo: TMaskEdit
          Left = 39
          Width = 90
          Height = 25
          ExplicitLeft = 39
          ExplicitWidth = 90
          ExplicitHeight = 25
        end
        object edt_nomeproduto: TEdit
          Tag = 5
          Left = 223
          Top = 40
          Width = 362
          Height = 25
          Hint = 'Descri'#231#227'o Produto'
          TabOrder = 2
        end
        object edt_preco_venda: TEdit
          Tag = 5
          Left = 223
          Top = 104
          Width = 148
          Height = 25
          Hint = 'Pre'#231'o Venda'
          TabOrder = 6
          OnChange = edt_preco_vendaChange
        end
        object chativo: TCheckBox
          Left = 146
          Top = 40
          Width = 63
          Height = 17
          Caption = 'Ativo'
          TabOrder = 1
        end
        object ComboBox1: TComboBox
          Tag = 5
          Left = 607
          Top = 40
          Width = 110
          Height = 25
          Hint = 'Tipo Produto'
          TabOrder = 3
        end
        object edt_precocompra: TEdit
          Left = 36
          Top = 104
          Width = 148
          Height = 25
          TabOrder = 5
          OnChange = edt_precocompraChange
        end
        object edt_codigo_ean: TEdit
          Left = 186
          Top = 154
          Width = 200
          Height = 25
          TabOrder = 10
        end
        object edt_data_ulimacompra: TEdit
          Tag = 5
          Left = 666
          Top = 104
          Width = 158
          Height = 25
          Hint = 'Data '#250'ltma Compra'
          TabOrder = 8
          OnChange = edt_data_ulimacompraChange
        end
        object edt_unidade: TEdit
          Tag = 5
          Left = 751
          Top = 43
          Width = 73
          Height = 25
          Hint = 'Unidade'
          MaxLength = 2
          TabOrder = 4
        end
        object edt_custo_medio: TEdit
          Left = 39
          Top = 154
          Width = 121
          Height = 25
          TabOrder = 9
          OnChange = edt_custo_medioChange
        end
        object edt_marca: TEdit
          Left = 399
          Top = 104
          Width = 242
          Height = 25
          TabOrder = 7
        end
        object edt_categoria: TEdit
          Left = 567
          Top = 154
          Width = 257
          Height = 25
          TabOrder = 11
        end
        object edt_qtde: TEdit
          Left = 39
          Top = 217
          Width = 121
          Height = 25
          TabOrder = 12
          OnChange = edt_qtdeChange
        end
        object edt_codigo_fabrincate: TEdit
          Left = 190
          Top = 217
          Width = 196
          Height = 25
          TabOrder = 13
        end
        object edt_peso: TEdit
          Left = 406
          Top = 217
          Width = 138
          Height = 25
          TabOrder = 14
          OnChange = edt_pesoChange
        end
        object pnlpesquisa: TPanel
          Left = 493
          Top = 154
          Width = 35
          Height = 25
          BevelOuter = bvNone
          Color = 15048259
          ParentBackground = False
          TabOrder = 15
          object btn_pesquisacat: TSpeedButton
            Left = 0
            Top = 0
            Width = 35
            Height = 25
            Cursor = crHandPoint
            Align = alClient
            Flat = True
            OnClick = btn_pesquisacatClick
          end
        end
        object edt_codigo_categoria: TEdit
          Tag = 5
          Left = 404
          Top = 154
          Width = 89
          Height = 25
          Hint = 'id categoria'
          NumbersOnly = True
          TabOrder = 16
          OnKeyPress = edt_codigo_categoriaKeyPress
        end
      end
    end
  end
  inherited Adapter: TAdapterBindSource
    Left = 724
    Top = 57
  end
  inherited lista: TBindingsList
    Left = 804
    Top = 42
  end
  inherited ImageList1: TImageList
    Left = 708
    Top = 17
  end
end
