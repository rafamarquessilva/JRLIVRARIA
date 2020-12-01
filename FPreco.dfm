object FormPreco: TFormPreco
  Left = 0
  Top = 0
  Caption = 'Consulta de Pre'#231'o'
  ClientHeight = 574
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 376
    Height = 105
    Align = alTop
    TabOrder = 0
    object lblCodigoBarras: TLabel
      Left = 24
      Top = 8
      Width = 203
      Height = 33
      Caption = 'C'#243'digo de Barras'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 288
      Top = 47
      Width = 81
      Height = 33
      Caption = 'Pesquisar'
      OnClick = SpeedButton1Click
    end
    object EdtCodigoBarras: TEdit
      Left = 29
      Top = 47
      Width = 244
      Height = 41
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = EdtCodigoBarrasKeyDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 376
    Height = 469
    Align = alClient
    TabOrder = 1
    DesignSize = (
      376
      469)
    object imgImagem: TImage
      Left = 27
      Top = 56
      Width = 315
      Height = 410
      Anchors = [akLeft, akTop, akRight, akBottom]
      Center = True
      Proportional = True
      Stretch = True
      ExplicitWidth = 313
    end
    object lblPreco: TLabel
      Left = 27
      Top = 6
      Width = 67
      Height = 29
      Caption = 'Pre'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblValor: TLabel
      Left = 100
      Top = 6
      Width = 8
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object btnLimpar: TSpeedButton
      Left = 288
      Top = 6
      Width = 81
      Height = 33
      Caption = 'Limpar'
      OnClick = btnLimparClick
    end
  end
  object qryConsulta: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 242
    object qryConsultaChave: TAutoIncField
      FieldName = 'Chave'
      ReadOnly = True
    end
    object qryConsultaCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Size = 15
    end
    object qryConsultaValor: TBCDField
      FieldName = 'Valor'
      DisplayFormat = '#,##0.00'
      Precision = 4
      Size = 2
    end
    object qryConsultaArquivo: TStringField
      FieldName = 'Arquivo'
      Size = 500
    end
  end
  object dsConsulta: TDataSource
    DataSet = qryConsulta
    Left = 178
  end
end
