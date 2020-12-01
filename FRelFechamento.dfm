object FormRelFechamento: TFormRelFechamento
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Fechamento'
  ClientHeight = 135
  ClientWidth = 387
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
  object btnImprimir: TSpeedButton
    Left = 0
    Top = 1
    Width = 81
    Height = 33
    Caption = 'Imprimir'
    OnClick = btnImprimirClick
  end
  object Label1: TLabel
    Left = 19
    Top = 43
    Width = 80
    Height = 16
    Caption = 'C'#243'digo Barras'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 81
    Top = 1
    Width = 81
    Height = 33
    Caption = 'Limpar'
    OnClick = SpeedButton1Click
  end
  object Label2: TLabel
    Left = 215
    Top = 43
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
  object GroupBox1: TGroupBox
    Left = 105
    Top = 67
    Width = 272
    Height = 60
    Caption = ' Op'#231#245'es '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object chkListarLivrosDev: TCheckBox
      Left = 16
      Top = 24
      Width = 209
      Height = 17
      Caption = 'Listar somente livros devolvidos'
      TabOrder = 0
    end
  end
  object EdtCodigoBarras: TEdit
    Left = 105
    Top = 40
    Width = 104
    Height = 24
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
  end
  object edtIAnoIBDA: TEdit
    Left = 274
    Top = 40
    Width = 56
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
  end
  object stpRel: TADOStoredProc
    CursorType = ctStatic
    ProcedureName = 'FechamentoS'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = 'CodigoBarras'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ApenasDevolvidos'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'AnoIBDA'
        Attributes = [paNullable]
        DataType = ftInteger
        Value = Null
      end>
    Left = 232
    object stpRelChave: TAutoIncField
      FieldName = 'Chave'
      ReadOnly = True
    end
    object stpRelCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object stpRelObra: TStringField
      FieldName = 'Obra'
      Size = 100
    end
    object stpRelEditora: TStringField
      FieldName = 'Editora'
      Size = 100
    end
    object stpRelValor: TBCDField
      FieldName = 'Valor'
      Precision = 10
      Size = 2
    end
    object stpRelEstoqueInicial: TIntegerField
      FieldName = 'EstoqueInicial'
    end
    object stpRelQuantidadeDev: TIntegerField
      FieldName = 'QuantidadeDev'
    end
    object stpRelQuantidadeAtual: TIntegerField
      FieldName = 'QuantidadeAtual'
      ReadOnly = True
    end
  end
end
