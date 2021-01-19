unit CDSUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TCDSForm = class(TForm)
    DBGridCountries: TDBGrid;
    DataSetCountries: TADODataSet;
    DataSourceCountries: TDataSource;
    DataSetCountriesPkCountry: TAutoIncField;
    DataSetCountriesCName: TStringField;
    DataSetDistricts: TADODataSet;
    DataSourceDistricts: TDataSource;
    DataSetDistrictsPkDistrict: TAutoIncField;
    DataSetDistrictsFkCountry: TIntegerField;
    DataSetDistrictsDName: TWideStringField;
    DataSourceSettlements: TDataSource;
    DataSetSettlements: TADODataSet;
    DataSetSettlementsPkSettlement: TAutoIncField;
    DataSetSettlementsFkDistrict: TIntegerField;
    DataSetSettlementsSType: TStringField;
    DataSetSettlementsSName: TStringField;
    DataSetSettlementsZipCode: TIntegerField;
    DBNavigator: TDBNavigator;
    Bevel: TBevel;
    LabelCountries: TLabel;
    LabelDistricts: TLabel;
    LabelSettlements: TLabel;
    DBGridDistricts: TDBGrid;
    DBGridSettlements: TDBGrid;
    BitBtnDeveloper: TBitBtn;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    procedure FormCreate (Sender: TObject);
    procedure BitBtnDeveloperClick(Sender: TObject);
    procedure DBGridCountriesEnter (Sender: TObject);
    procedure DBGridDistrictsEnter (Sender: TObject);
    procedure DBGridSettlementsEnter (Sender: TObject);
    procedure DataSetSettlementsAfterPost(DataSet: TDataSet);
    procedure DataSetSettlementsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CDSForm: TCDSForm;

implementation

{$R *.dfm}

uses DataModuleUnit, DeveloperUnit;

procedure TCDSForm.BitBtnDeveloperClick(Sender: TObject);
begin
  var f: TDeveloperForm := TDeveloperForm.Create (self);
  f.Showmodal ();
  f.Free ();
end;

procedure TCDSForm.FormCreate(Sender: TObject);
begin
  DataSetCountries.Open();
  DataSetDistricts.Open();
  DataSetSettlements.Open();
end;

procedure TCDSForm.DBGridCountriesEnter(Sender: TObject);
begin
  if(DBNavigator.DataSource <> DBGridCountries.DataSource) then
  DBNavigator.DataSource := DBGridCountries.DataSource;
end;

procedure TCDSForm.DBGridDistrictsEnter(Sender: TObject);
begin
  if(DBNavigator.DataSource <> DBGridDistricts.DataSource) then
  DBNavigator.DataSource := DBGridDistricts.DataSource;
end;

procedure TCDSForm.DBGridSettlementsEnter(Sender: TObject);
begin
  if(DBNavigator.DataSource <> DBGridSettlements.DataSource) then
  DBNavigator.DataSource := DBGridSettlements.DataSource;
end;

procedure TCDSForm.DataSetSettlementsAfterPost(DataSet: TDataSet);
begin
BitBtnOK.Enabled := (DataSetSettlementsPkSettlement.AsInteger >0);
end;

procedure TCDSForm.DataSetSettlementsAfterScroll(DataSet: TDataSet);
begin
BitBtnOK.Enabled := (DataSetSettlementsPkSettlement.AsInteger >0);
end;

end.



