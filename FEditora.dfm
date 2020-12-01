object FormEditora: TFormEditora
  Left = 0
  Top = 0
  Caption = 'Cadastro de Editora'
  ClientHeight = 263
  ClientWidth = 627
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
    Width = 627
    Height = 211
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 625
      Height = 209
      Align = alClient
      DataSource = dsEditora
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Chave'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Width = 500
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 211
    Width = 627
    Height = 52
    Align = alBottom
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 360
      Height = 49
      DataSource = dsEditora
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel]
      TabOrder = 0
    end
  end
  object ADOTableEditora: TADOTable
    CursorType = ctStatic
    TableName = 'Editora'
    Left = 344
    object ADOTableEditoraChave: TAutoIncField
      FieldName = 'Chave'
      ReadOnly = True
    end
    object ADOTableEditoraDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 100
    end
  end
  object dsEditora: TDataSource
    DataSet = ADOTableEditora
    Left = 256
  end
end
