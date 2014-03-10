object FSKP: TFSKP
  Left = 431
  Top = 246
  Width = 510
  Height = 350
  Caption = 'FSKP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 465
    Height = 73
    Caption = 'Kegiatan dari :'
    TabOrder = 0
    object Button1: TButton
      Left = 272
      Top = 24
      Width = 105
      Height = 25
      Caption = 'Kegiatan Lain'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 80
      Top = 24
      Width = 105
      Height = 25
      Caption = 'SKP'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 104
    Width = 465
    Height = 185
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = 'No'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Tanggal'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Kegiatan'
        Width = 150
        Visible = True
      end>
  end
end
