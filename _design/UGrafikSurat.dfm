object FGrafikSurat: TFGrafikSurat
  Left = 356
  Top = 167
  Width = 928
  Height = 480
  Caption = 'FGrafikSurat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 24
    Width = 305
    Height = 41
    Columns = 2
    Items.Strings = (
      'Per Tahun'
      'Per Bulan')
    TabOrder = 0
  end
  object RadioGroup2: TRadioGroup
    Left = 24
    Top = 64
    Width = 305
    Height = 41
    Columns = 2
    Items.Strings = (
      'Surat Masuk'
      'Surat Keluar')
    TabOrder = 1
  end
end
