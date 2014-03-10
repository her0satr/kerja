object FSuratMasuk: TFSuratMasuk
  Left = 258
  Top = 130
  Width = 795
  Height = 572
  Caption = 'FSuratMasuk'
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
    Left = 16
    Top = 336
    Width = 37
    Height = 13
    Caption = 'No Urut'
  end
  object Label2: TLabel
    Left = 16
    Top = 360
    Width = 59
    Height = 13
    Caption = 'Nomor Surat'
  end
  object Label3: TLabel
    Left = 16
    Top = 384
    Width = 45
    Height = 13
    Caption = 'Surat dari'
  end
  object Label4: TLabel
    Left = 16
    Top = 408
    Width = 67
    Height = 13
    Caption = 'Tanggal Surat'
  end
  object Label5: TLabel
    Left = 16
    Top = 432
    Width = 32
    Height = 13
    Caption = 'Perihal'
  end
  object Label6: TLabel
    Left = 16
    Top = 456
    Width = 74
    Height = 13
    Caption = 'Tanggal Terima'
  end
  object Label7: TLabel
    Left = 16
    Top = 480
    Width = 46
    Height = 13
    Caption = 'Letak File'
  end
  object Label8: TLabel
    Left = 416
    Top = 336
    Width = 49
    Height = 13
    Caption = 'Sifat Surat'
  end
  object Label9: TLabel
    Left = 416
    Top = 384
    Width = 62
    Height = 13
    Caption = 'Disposisi kpd'
  end
  object Label10: TLabel
    Left = 416
    Top = 408
    Width = 59
    Height = 13
    Caption = 'Tgl Disposisi'
  end
  object Label11: TLabel
    Left = 416
    Top = 432
    Width = 27
    Height = 13
    Caption = 'Posisi'
  end
  object Label12: TLabel
    Left = 416
    Top = 456
    Width = 37
    Height = 13
    Caption = 'Catatan'
  end
  object Label13: TLabel
    Left = 24
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Pencarian'
  end
  object Label14: TLabel
    Left = 344
    Top = 8
    Width = 19
    Height = 13
    Caption = 'Dari'
  end
  object Label15: TLabel
    Left = 472
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Sampai'
  end
  object Label16: TLabel
    Left = 232
    Top = 464
    Width = 19
    Height = 13
    Caption = 'Jam'
  end
  object Label17: TLabel
    Left = 624
    Top = 384
    Width = 111
    Height = 13
    Caption = 'Disposisi kpd, tgl, posisi'
  end
  object Label18: TLabel
    Left = 624
    Top = 400
    Width = 88
    Height = 13
    Caption = 'bisa diisi bbrp kali, '
  end
  object Label19: TLabel
    Left = 624
    Top = 416
    Width = 129
    Height = 13
    Caption = 'tak jelaskan klo nnti ketmu '
  end
  object Label20: TLabel
    Left = 416
    Top = 360
    Width = 47
    Height = 13
    Caption = 'Sifat Arsip'
  end
  object Label21: TLabel
    Left = 256
    Top = 432
    Width = 137
    Height = 13
    Caption = 'Jam otomatis pada saat entry'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 40
    Width = 721
    Height = 281
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 104
    Top = 336
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 104
    Top = 360
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
  end
  object Button1: TButton
    Left = 416
    Top = 488
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 3
  end
  object Button2: TButton
    Left = 496
    Top = 488
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 4
  end
  object Button3: TButton
    Left = 576
    Top = 488
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 5
  end
  object Button4: TButton
    Left = 656
    Top = 488
    Width = 89
    Height = 25
    Caption = 'Print Disposisi'
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 104
    Top = 384
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Edit2'
  end
  object Edit4: TEdit
    Left = 104
    Top = 408
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'Edit2'
  end
  object Edit5: TEdit
    Left = 104
    Top = 432
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'Edit2'
  end
  object Edit6: TEdit
    Left = 104
    Top = 456
    Width = 121
    Height = 21
    TabOrder = 10
    Text = 'Edit2'
  end
  object Edit7: TEdit
    Left = 104
    Top = 480
    Width = 121
    Height = 21
    TabOrder = 11
    Text = 'Edit2'
  end
  object Edit9: TEdit
    Left = 488
    Top = 384
    Width = 121
    Height = 21
    TabOrder = 12
    Text = 'Edit2'
  end
  object Edit10: TEdit
    Left = 488
    Top = 408
    Width = 121
    Height = 21
    TabOrder = 13
    Text = 'Edit2'
  end
  object Edit11: TEdit
    Left = 488
    Top = 432
    Width = 121
    Height = 21
    TabOrder = 14
    Text = 'Edit2'
  end
  object Edit12: TEdit
    Left = 488
    Top = 456
    Width = 121
    Height = 21
    TabOrder = 15
    Text = 'Edit2'
  end
  object Edit13: TEdit
    Left = 80
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 16
    Text = 'Edit13'
  end
  object ComboBox1: TComboBox
    Left = 216
    Top = 8
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 17
    Text = 'Berdasarkan'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 376
    Top = 8
    Width = 89
    Height = 21
    Date = 41693.718402002310000000
    Time = 41693.718402002310000000
    TabOrder = 18
  end
  object DateTimePicker2: TDateTimePicker
    Left = 512
    Top = 8
    Width = 89
    Height = 21
    Date = 41693.718402002310000000
    Time = 41693.718402002310000000
    TabOrder = 19
  end
  object Button5: TButton
    Left = 616
    Top = 8
    Width = 57
    Height = 25
    Caption = 'Cari'
    TabOrder = 20
  end
  object Button6: TButton
    Left = 680
    Top = 8
    Width = 57
    Height = 25
    Caption = 'Refresh'
    TabOrder = 21
  end
  object Button7: TButton
    Left = 232
    Top = 480
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 22
  end
  object ComboBox2: TComboBox
    Left = 488
    Top = 336
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 23
    Text = 'Sifat'
    Items.Strings = (
      'Penting'
      'Segera'
      'Rahasia'
      'Biasa')
  end
  object Edit8: TEdit
    Left = 256
    Top = 456
    Width = 73
    Height = 21
    TabOrder = 24
    Text = 'Edit2'
  end
  object ComboBox3: TComboBox
    Left = 488
    Top = 360
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 25
    Text = 'Sifat'
    Items.Strings = (
      'Statis'
      'Dinamis')
  end
end
