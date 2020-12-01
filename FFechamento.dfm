object FormFechamento: TFormFechamento
  Left = 0
  Top = 0
  Caption = 'Devolu'#231#227'o de Produto'
  ClientHeight = 269
  ClientWidth = 488
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
    Width = 310
    Height = 269
    Align = alClient
    TabOrder = 0
    object lblCodigoBarras: TLabel
      Left = 72
      Top = 37
      Width = 52
      Height = 16
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 110
      Width = 116
      Height = 16
      Caption = 'Qtde. p/ devolver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnLimpar: TSpeedButton
      Left = 217
      Top = 135
      Width = 81
      Height = 33
      Caption = 'Limpar'
      OnClick = btnLimparClick
    end
    object btnConfirmar: TSpeedButton
      Left = 130
      Top = 135
      Width = 81
      Height = 33
      Caption = 'Confirmar'
      OnClick = btnConfirmarClick
    end
    object Label2: TLabel
      Left = 42
      Top = 62
      Width = 82
      Height = 16
      Caption = 'Estoque Inicial'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 35
      Top = 87
      Width = 89
      Height = 16
      Caption = 'Qtde. Devolvida'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtCodigoBarras: TEdit
      Left = 130
      Top = 34
      Width = 103
      Height = 24
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = EdtCodigoBarrasKeyDown
    end
    object EdtQtdeDevolvido: TEdit
      Left = 130
      Top = 109
      Width = 63
      Height = 24
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 130
      Top = 59
      Width = 63
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'EstoqueInicial'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 130
      Top = 84
      Width = 63
      Height = 24
      TabStop = False
      Color = clBtnFace
      DataField = 'QuantidadeDevolvida'
      DataSource = dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 13
      Top = 185
      Width = 198
      Height = 71
      Caption = '                                         '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object chkAjute: TCheckBox
        Left = 16
        Top = -1
        Width = 163
        Height = 17
        Caption = 'Ajustar Qtde. Devolvida'
        TabOrder = 0
        OnClick = chkAjuteClick
      end
      object EdtAjuste: TEdit
        Left = 32
        Top = 32
        Width = 57
        Height = 24
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 1
      end
      object btnAjuste: TBitBtn
        Left = 95
        Top = 32
        Width = 52
        Height = 25
        Caption = 'OK'
        TabOrder = 2
        OnClick = btnAjusteClick
      end
    end
  end
  object Panel2: TPanel
    Left = 310
    Top = 0
    Width = 178
    Height = 269
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object imgImagem: TImage
      Left = 1
      Top = 1
      Width = 176
      Height = 267
      Align = alClient
      Center = True
      Proportional = True
      Stretch = True
      ExplicitLeft = 38
      ExplicitTop = 34
      ExplicitWidth = 57
      ExplicitHeight = 207
    end
  end
  object qryConsulta: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 50
    Top = 8
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
    object qryConsultaEstoqueInicial: TIntegerField
      DisplayLabel = 'Estoque Inicial'
      FieldName = 'EstoqueInicial'
      ReadOnly = True
    end
    object qryConsultaQuantidadeDevolvida: TIntegerField
      DisplayLabel = 'Qtde. Devolvida'
      FieldName = 'QuantidadeDevolvida'
      ReadOnly = True
    end
  end
  object dsConsulta: TDataSource
    DataSet = qryConsulta
    Left = 8
    Top = 8
  end
end
