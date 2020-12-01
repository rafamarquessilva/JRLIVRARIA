object FormPesquisa: TFormPesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Produto'
  ClientHeight = 424
  ClientWidth = 986
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 986
    Height = 99
    Align = alTop
    TabOrder = 0
    DesignSize = (
      986
      99)
    object btnPesquisar: TSpeedButton
      Left = 834
      Top = 21
      Width = 68
      Height = 34
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnPesquisarClick
      ExplicitLeft = 479
    end
    object lblObra: TLabel
      Left = 358
      Top = 9
      Width = 28
      Height = 16
      Caption = 'Obra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblAutor: TLabel
      Left = 16
      Top = 34
      Width = 31
      Height = 16
      Caption = 'Autor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnLimpar: TSpeedButton
      Left = 908
      Top = 21
      Width = 68
      Height = 34
      Anchors = [akTop, akRight]
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnLimparClick
      ExplicitLeft = 553
    end
    object lblEditora: TLabel
      Left = 7
      Top = 59
      Width = 40
      Height = 16
      Caption = 'Editora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 699
      Top = 59
      Width = 53
      Height = 16
      Caption = 'Ano IBDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 9
      Width = 39
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtObra: TEdit
      Left = 392
      Top = 6
      Width = 412
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtAutor: TEdit
      Left = 53
      Top = 31
      Width = 751
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cmbEditora: TDBComboBox
      Left = 53
      Top = 56
      Width = 603
      Height = 24
      AutoDropDown = True
      CharCase = ecUpperCase
      DataField = 'Descricao'
      DataSource = dsEditora
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtCodigo: TEdit
      Left = 53
      Top = 6
      Width = 284
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtIAnoIBDA: TEdit
      Left = 760
      Top = 56
      Width = 44
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 99
    Width = 986
    Height = 325
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object grdProdutos: TDBGrid
      Left = 1
      Top = 1
      Width = 799
      Height = 323
      Align = alClient
      DataSource = dsProdutos
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = grdProdutosDrawColumnCell
      OnDblClick = grdProdutosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Obra'
          Width = 310
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Editora'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Edicao'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AnoIBDA'
          Width = 60
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 800
      Top = 1
      Width = 185
      Height = 323
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object imgImagem: TImage
        Left = 1
        Top = 1
        Width = 183
        Height = 321
        Align = alClient
        Center = True
        Proportional = True
        Stretch = True
        ExplicitLeft = 6
        ExplicitTop = 5
        ExplicitWidth = 213
        ExplicitHeight = 316
      end
    end
  end
  object qryProdutos: TADOQuery
    CursorType = ctStatic
    AfterScroll = qryProdutosAfterScroll
    Parameters = <>
    Left = 448
    Top = 136
    object qryProdutosChave: TAutoIncField
      FieldName = 'Chave'
      ReadOnly = True
    end
    object qryProdutosCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Size = 15
    end
    object qryProdutosObra: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Obra'
      Size = 100
    end
    object qryProdutosEdicao: TStringField
      DisplayLabel = 'Edi'#231#227'o'
      FieldName = 'Edicao'
      Size = 30
    end
    object qryProdutosEditora: TStringField
      FieldName = 'Editora'
      Size = 100
    end
    object qryProdutosValor: TBCDField
      FieldName = 'Valor'
      DisplayFormat = '#,##0.00'
      Precision = 4
      Size = 2
    end
    object qryProdutosArquivo: TStringField
      FieldName = 'Arquivo'
      Size = 500
    end
    object qryProdutosAnoIBDA: TIntegerField
      DisplayLabel = 'Ano IBDA'
      FieldName = 'AnoIBDA'
    end
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 504
    Top = 136
  end
  object qryEditora: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Chave, Descricao FROM Editora')
    Left = 504
    Top = 184
    object qryEditoraChave: TAutoIncField
      FieldName = 'Chave'
      ReadOnly = True
    end
    object qryEditoraDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 100
    end
  end
  object dsEditora: TDataSource
    DataSet = qryEditora
    Left = 448
    Top = 176
  end
end
