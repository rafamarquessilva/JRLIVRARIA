object FormProduto: TFormProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produto'
  ClientHeight = 292
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 292
    Align = alClient
    TabOrder = 0
    DesignSize = (
      654
      292)
    object Label1: TLabel
      Left = 495
      Top = 17
      Width = 35
      Height = 16
      Caption = 'Chave'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label2: TLabel
      Left = 8
      Top = 33
      Width = 90
      Height = 16
      Caption = 'C'#243'digo Barras'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 35
      Top = 83
      Width = 63
      Height = 16
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 61
      Top = 108
      Width = 37
      Height = 16
      Caption = 'Edi'#231#227'o'
      FocusControl = DBEdit4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 265
      Top = 108
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
    object Label6: TLabel
      Left = 67
      Top = 134
      Width = 31
      Height = 16
      Caption = 'Autor'
      FocusControl = DBEdit6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 64
      Top = 58
      Width = 34
      Height = 16
      Caption = 'Valor'
      FocusControl = DBEdit8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image1: TImage
      Left = 485
      Top = 55
      Width = 159
      Height = 226
      Anchors = [akLeft, akTop, akRight, akBottom]
      Proportional = True
      ExplicitWidth = 148
      ExplicitHeight = 209
    end
    object btnDiretorioArquivos: TSpeedButton
      Left = 456
      Top = 156
      Width = 23
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888800008888888888888888888800008888888888888888888800008888
        8888888888888888000088000000000008888888000088003333333330888888
        0000880B03333333330888880000880FB0333333333088880000880BFB033333
        333308880000880FBFB00000000000880000880BFBFBFBFB088888880000880F
        BFBFBFBF088888880000880BFB00000008888888000088800088888888000888
        0000888888888888888008880000888888888808880808880000888888888880
        0088888800008888888888888888888800008888888888888888888800008888
        88888888888888880000}
      ParentFont = False
      OnClick = btnDiretorioArquivosClick
    end
    object Label7: TLabel
      Left = 55
      Top = 159
      Width = 43
      Height = 16
      Caption = 'Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 304
      Top = 58
      Width = 93
      Height = 16
      Caption = 'Estoque Inicial'
      FocusControl = DBEdit5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 338
      Top = 35
      Width = 62
      Height = 16
      Caption = 'Ano IBDA'
      FocusControl = DBEdit9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 537
      Top = 14
      Width = 64
      Height = 24
      TabStop = False
      DataField = 'Chave'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object DBEdit2: TDBEdit
      Left = 105
      Top = 30
      Width = 144
      Height = 24
      DataField = 'Codigo'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 105
      Top = 80
      Width = 374
      Height = 24
      DataField = 'Descricao'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 105
      Top = 105
      Width = 144
      Height = 24
      DataField = 'Edicao'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DBEdit6: TDBEdit
      Left = 105
      Top = 131
      Width = 374
      Height = 24
      DataField = 'Autor'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object DBEdit8: TDBEdit
      Left = 105
      Top = 55
      Width = 144
      Height = 24
      DataField = 'Valor'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBNavigator1: TDBNavigator
      Left = 105
      Top = 206
      Width = 360
      Height = 49
      DataSource = dsProduto
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel]
      TabOrder = 10
    end
    object DBEdit7: TDBEdit
      Left = 105
      Top = 156
      Width = 348
      Height = 24
      DataField = 'Arquivo'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 317
      Top = 105
      Width = 162
      Height = 24
      DataField = 'Editora'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'Chave'
      ListField = 'Descricao'
      ListSource = dsEditora
      ParentFont = False
      TabOrder = 7
      OnKeyPress = DBLookupComboBox1KeyPress
    end
    object DBEdit5: TDBEdit
      Left = 405
      Top = 55
      Width = 74
      Height = 24
      Hint = 'Campo com estoque inicial do produto'
      DataField = 'EstoqueInicial'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit9: TDBEdit
      Left = 405
      Top = 30
      Width = 74
      Height = 24
      DataField = 'AnoIBDA'
      DataSource = dsProduto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object ADOTableProduto: TADOTable
    CursorType = ctStatic
    BeforePost = ADOTableProdutoBeforePost
    AfterScroll = ADOTableProdutoAfterScroll
    OnPostError = ADOTableProdutoPostError
    TableName = 'Produto'
    Left = 16
    Top = 224
    object ADOTableProdutoChave: TAutoIncField
      FieldName = 'Chave'
      ReadOnly = True
    end
    object ADOTableProdutoCodigo: TStringField
      DisplayLabel = 'C'#243'digo Barras'
      FieldName = 'Codigo'
      Required = True
      Size = 15
    end
    object ADOTableProdutoDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Required = True
      Size = 100
    end
    object ADOTableProdutoEdicao: TStringField
      DisplayLabel = 'Edi'#231#227'o'
      FieldName = 'Edicao'
      Size = 30
    end
    object ADOTableProdutoEditora: TIntegerField
      FieldName = 'Editora'
    end
    object ADOTableProdutoAutor: TStringField
      FieldName = 'Autor'
      Size = 500
    end
    object ADOTableProdutoArquivo: TStringField
      FieldName = 'Arquivo'
      Size = 500
    end
    object ADOTableProdutoValor: TBCDField
      FieldName = 'Valor'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
    object ADOTableProdutoEstoqueInicial: TIntegerField
      DisplayLabel = 'Estoque Inicial'
      FieldName = 'EstoqueInicial'
      Required = True
    end
    object ADOTableProdutoQuantidadeDev: TIntegerField
      DisplayLabel = 'Qtde. Devolvida'
      FieldName = 'QuantidadeDev'
    end
    object ADOTableProdutoAnoIBDA: TIntegerField
      DisplayLabel = 'Ano IBDA'
      FieldName = 'AnoIBDA'
      Required = True
    end
  end
  object dsProduto: TDataSource
    DataSet = ADOTableProduto
    Left = 272
    Top = 8
  end
  object OpenDialog: TOpenPictureDialog
    Filter = 
      'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bi' +
      'tmaps (*.bmp)|*.bmp'
    Left = 489
    Top = 8
  end
  object qryEditora: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Chave, upper(Descricao) as Descricao FROM Editora')
    Left = 8
    Top = 160
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
    Left = 8
    Top = 112
  end
end
