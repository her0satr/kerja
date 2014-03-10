object FAbsensi: TFAbsensi
  Left = 348
  Top = 121
  Width = 548
  Height = 554
  Caption = 'FAbsensi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 144
    Top = 240
    Width = 92
    Height = 13
    Caption = 'ADA PERUBAHAN'
  end
  object Button1: TButton
    Left = 168
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Masuk'
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 272
    Width = 497
    Height = 233
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 424
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Tidak Masuk'
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 185
    Caption = 'Masuk'
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 104
      Width = 55
      Height = 13
      Caption = 'Keterangan'
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 16
      Width = 129
      Height = 81
      Items.Strings = (
        'Tepat Waktu'
        'Terlambat')
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 8
      Top = 120
      Width = 217
      Height = 49
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 272
    Top = 8
    Width = 233
    Height = 201
    Caption = 'Tidak Masuk'
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 137
      Width = 55
      Height = 13
      Caption = 'Keterangan'
    end
    object Label3: TLabel
      Left = 16
      Top = 89
      Width = 41
      Height = 13
      Caption = 'Surat Ijin'
    end
    object RadioGroup2: TRadioGroup
      Left = 16
      Top = 16
      Width = 201
      Height = 57
      Columns = 2
      Items.Strings = (
        'Ijin'
        'Sakit'
        'Cuti'
        'Tanpa Keterangan')
      TabOrder = 0
    end
    object Memo2: TMemo
      Left = 8
      Top = 153
      Width = 217
      Height = 41
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
    end
    object Button3: TButton
      Left = 72
      Top = 89
      Width = 57
      Height = 25
      Caption = 'Browse'
      TabOrder = 2
    end
  end
end
