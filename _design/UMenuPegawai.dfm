object FMenuPegawai: TFMenuPegawai
  Left = 261
  Top = 182
  Width = 451
  Height = 251
  Caption = 'FMenuPegawai'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Biodata'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Absensi'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 264
    Top = 48
    Width = 137
    Height = 25
    Caption = 'Kegiatan Harian / SKP'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 104
    Top = 124
    Width = 89
    Height = 65
    Caption = 'Rekap'
    TabOrder = 3
  end
  object Button5: TButton
    Left = 226
    Top = 124
    Width = 89
    Height = 65
    Caption = 'Grafik'
    TabOrder = 4
  end
end
