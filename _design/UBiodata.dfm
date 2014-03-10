object FBiodata: TFBiodata
  Left = 206
  Top = 99
  Width = 703
  Height = 603
  Caption = 'FBiodata'
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
    Top = 8
    Width = 80
    Height = 13
    Caption = 'Biodata Pegawai'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 32
    Width = 649
    Height = 177
    Caption = 'Data'
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 28
      Height = 13
      Caption = 'Nama'
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 18
      Height = 13
      Caption = 'NIP'
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 34
      Height = 13
      Caption = 'Karpeg'
    end
    object Label5: TLabel
      Left = 8
      Top = 96
      Width = 62
      Height = 13
      Caption = 'Tempat Lahir'
    end
    object Label6: TLabel
      Left = 8
      Top = 120
      Width = 65
      Height = 13
      Caption = 'Tanggal Lahir'
    end
    object Label7: TLabel
      Left = 8
      Top = 144
      Width = 33
      Height = 13
      Caption = 'Agama'
    end
    object Label18: TLabel
      Left = 360
      Top = 24
      Width = 64
      Height = 13
      Caption = 'Jenis Kelamin'
    end
    object Label19: TLabel
      Left = 360
      Top = 48
      Width = 98
      Height = 13
      Caption = 'Status Kepegawaian'
    end
    object Label20: TLabel
      Left = 360
      Top = 72
      Width = 92
      Height = 13
      Caption = 'Jenis Kepegawaian'
    end
    object Label21: TLabel
      Left = 360
      Top = 96
      Width = 89
      Height = 13
      Caption = 'Status Perkawinan'
    end
    object Label22: TLabel
      Left = 360
      Top = 120
      Width = 58
      Height = 13
      Caption = 'Karis/ Karsu'
    end
    object Edit1: TEdit
      Left = 88
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 136
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object Edit3: TEdit
      Left = 264
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
    end
    object Edit4: TEdit
      Left = 88
      Top = 40
      Width = 217
      Height = 21
      TabOrder = 3
      Text = 'Edit1'
    end
    object Edit5: TEdit
      Left = 88
      Top = 64
      Width = 169
      Height = 21
      TabOrder = 4
      Text = 'Edit1'
    end
    object Edit6: TEdit
      Left = 88
      Top = 88
      Width = 217
      Height = 21
      TabOrder = 5
      Text = 'Edit1'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 88
      Top = 112
      Width = 89
      Height = 21
      Date = 41689.886215196760000000
      Time = 41689.886215196760000000
      TabOrder = 6
    end
    object ComboBox1: TComboBox
      Left = 88
      Top = 136
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 7
      Text = 'ComboBox1'
    end
    object ComboBox2: TComboBox
      Left = 464
      Top = 24
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 8
      Text = 'ComboBox1'
      Items.Strings = (
        'Laki-Laki'
        'Perempuan')
    end
    object ComboBox3: TComboBox
      Left = 464
      Top = 48
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 9
      Text = 'ComboBox1'
      Items.Strings = (
        'PNS'
        'CPNS'
        'Kontrak')
    end
    object ComboBox4: TComboBox
      Left = 464
      Top = 72
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 10
      Text = 'ComboBox1'
      Items.Strings = (
        'PNS Pusat'
        'PNS Daerah')
    end
    object ComboBox5: TComboBox
      Left = 464
      Top = 96
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 11
      Text = 'ComboBox1'
      Items.Strings = (
        'Menikah'
        'Belum Menikah'
        'Duda/ Janda')
    end
    object Button1: TButton
      Left = 259
      Top = 64
      Width = 46
      Height = 23
      Caption = 'Browse'
      TabOrder = 12
    end
    object Edit7: TEdit
      Left = 464
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 13
      Text = 'Edit1'
    end
    object Button2: TButton
      Left = 587
      Top = 120
      Width = 46
      Height = 23
      Caption = 'Browse'
      TabOrder = 14
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 216
    Width = 369
    Height = 345
    Caption = 'Riwayat Kepegawaian'
    TabOrder = 1
    object Label8: TLabel
      Left = 8
      Top = 24
      Width = 29
      Height = 13
      Caption = 'CPNS'
    end
    object Label9: TLabel
      Left = 8
      Top = 48
      Width = 22
      Height = 13
      Caption = 'PNS'
    end
    object Label10: TLabel
      Left = 8
      Top = 72
      Width = 45
      Height = 13
      Caption = 'Non PNS'
    end
    object Label11: TLabel
      Left = 8
      Top = 96
      Width = 38
      Height = 13
      Caption = 'Jabatan'
    end
    object Label12: TLabel
      Left = 8
      Top = 120
      Width = 46
      Height = 13
      Caption = 'Unit Kerja'
    end
    object Label13: TLabel
      Left = 8
      Top = 144
      Width = 40
      Height = 13
      Caption = 'Pangkat'
    end
    object Label14: TLabel
      Left = 8
      Top = 168
      Width = 54
      Height = 13
      Caption = 'Gol. Ruang'
    end
    object Label15: TLabel
      Left = 8
      Top = 192
      Width = 66
      Height = 13
      Caption = 'TMT Pangkat'
    end
    object Label16: TLabel
      Left = 24
      Top = 216
      Width = 59
      Height = 13
      Caption = '- Masa Kerja'
    end
    object Label17: TLabel
      Left = 24
      Top = 240
      Width = 33
      Height = 13
      Caption = '- tahun'
    end
    object Label23: TLabel
      Left = 24
      Top = 264
      Width = 33
      Height = 13
      Caption = '- Bulan'
    end
    object Label24: TLabel
      Left = 8
      Top = 288
      Width = 49
      Height = 13
      Caption = 'Nomor HP'
    end
    object Label25: TLabel
      Left = 8
      Top = 312
      Width = 27
      Height = 13
      Caption = 'e-mail'
    end
    object Edit8: TEdit
      Left = 112
      Top = 24
      Width = 137
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button3: TButton
      Left = 251
      Top = 24
      Width = 46
      Height = 23
      Caption = 'Browse'
      TabOrder = 1
    end
    object Edit9: TEdit
      Left = 112
      Top = 48
      Width = 137
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
    end
    object Button4: TButton
      Left = 251
      Top = 48
      Width = 46
      Height = 23
      Caption = 'Browse'
      TabOrder = 3
    end
    object Edit10: TEdit
      Left = 112
      Top = 72
      Width = 137
      Height = 21
      TabOrder = 4
      Text = 'Edit1'
    end
    object Button5: TButton
      Left = 251
      Top = 72
      Width = 46
      Height = 23
      Caption = 'Browse'
      TabOrder = 5
    end
    object Edit11: TEdit
      Left = 112
      Top = 96
      Width = 137
      Height = 21
      TabOrder = 6
      Text = 'Edit1'
    end
    object Edit12: TEdit
      Left = 112
      Top = 120
      Width = 137
      Height = 21
      TabOrder = 7
      Text = 'Edit1'
    end
    object Button6: TButton
      Left = 251
      Top = 120
      Width = 46
      Height = 23
      Caption = 'Pilih'
      TabOrder = 8
    end
    object Edit13: TEdit
      Left = 112
      Top = 144
      Width = 137
      Height = 21
      TabOrder = 9
      Text = 'Edit1'
    end
    object Edit14: TEdit
      Left = 112
      Top = 168
      Width = 137
      Height = 21
      TabOrder = 10
      Text = 'Edit1'
    end
    object Edit15: TEdit
      Left = 112
      Top = 192
      Width = 137
      Height = 21
      TabOrder = 11
      Text = 'Edit1'
    end
    object Edit16: TEdit
      Left = 112
      Top = 216
      Width = 137
      Height = 21
      TabOrder = 12
      Text = 'Edit1'
    end
    object Edit17: TEdit
      Left = 112
      Top = 240
      Width = 137
      Height = 21
      TabOrder = 13
      Text = 'Edit1'
    end
    object Edit18: TEdit
      Left = 112
      Top = 264
      Width = 137
      Height = 21
      TabOrder = 14
      Text = 'Edit1'
    end
    object Edit19: TEdit
      Left = 112
      Top = 288
      Width = 137
      Height = 21
      TabOrder = 15
      Text = 'Edit1'
    end
    object Edit20: TEdit
      Left = 112
      Top = 312
      Width = 137
      Height = 21
      TabOrder = 16
      Text = 'Edit1'
    end
  end
  object GroupBox3: TGroupBox
    Left = 392
    Top = 216
    Width = 273
    Height = 49
    Caption = 'Riwayat Pendidikan'
    TabOrder = 2
    object Button7: TButton
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 0
      OnClick = Button7Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 392
    Top = 272
    Width = 273
    Height = 49
    Caption = 'Riwayat Mutasi'
    TabOrder = 3
    object Button8: TButton
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 0
      OnClick = Button8Click
    end
  end
  object GroupBox5: TGroupBox
    Left = 392
    Top = 328
    Width = 273
    Height = 49
    Caption = 'Riwayat Diklat'
    TabOrder = 4
    object Button9: TButton
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 0
      OnClick = Button9Click
    end
  end
end
