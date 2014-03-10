object FRekapSurat: TFRekapSurat
  Left = 452
  Top = 254
  Width = 566
  Height = 249
  Caption = 'FRekapSurat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 57
    Height = 13
    Caption = 'Dari tanggal'
  end
  object Label2: TLabel
    Left = 40
    Top = 56
    Width = 73
    Height = 13
    Caption = 'Sampai tanggal'
  end
  object Label3: TLabel
    Left = 328
    Top = 32
    Width = 190
    Height = 13
    Caption = 'Rekap surat warna berdasarkan validasi'
  end
  object Label4: TLabel
    Left = 328
    Top = 56
    Width = 188
    Height = 13
    Caption = 'Hari Sabtu/minggu dililangkan dr Sistem'
  end
  object Label5: TLabel
    Left = 328
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Surat Masuk'
  end
  object Label6: TLabel
    Left = 328
    Top = 80
    Width = 123
    Height = 13
    Caption = 'Jam otomatis tp bisa diedit'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 128
    Top = 24
    Width = 186
    Height = 21
    Date = 41687.677749351850000000
    Time = 41687.677749351850000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 128
    Top = 56
    Width = 186
    Height = 21
    Date = 41687.677749351850000000
    Time = 41687.677749351850000000
    TabOrder = 1
  end
  object OK: TButton
    Left = 240
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
  end
  object RadioGroup1: TRadioGroup
    Left = 40
    Top = 88
    Width = 273
    Height = 65
    Columns = 2
    Items.Strings = (
      'Surat Masuk'
      'Surat Keluar'
      'Nota Dinas'
      'Agenda')
    TabOrder = 3
  end
end
