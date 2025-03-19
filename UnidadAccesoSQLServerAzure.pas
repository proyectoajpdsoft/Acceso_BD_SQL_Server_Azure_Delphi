unit UnidadAccesoSQLServerAzure;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.DBCGrids, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.DBCtrls;

type
  TformMSSQLAzure = class(TForm)
    BdproyectoaConnection: TFDConnection;
    FacturasTable: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMSSQLAzure: TformMSSQLAzure;

implementation

{$R *.dfm}

procedure TformMSSQLAzure.FormCreate(Sender: TObject);
begin
  try
    BdproyectoaConnection.connected := false;
    BdproyectoaConnection.Params.Clear;
    BdproyectoaConnection.DriverName := 'MSSQL';
    BdproyectoaConnection.Params.Database := 'bdproyectoa';
    BdproyectoaConnection.Params.DriverID := 'MSSQL';
    BdproyectoaConnection.Params.UserName := 'alonso';
    // La contraseña la obtendremos de una fuente cifrada
    // En este estudio de caso la establecemos en texto plano (NO es un mecanismo seguro)
    BdproyectoaConnection.Params.Password := 'MiContraseña2025';
    BdproyectoaConnection.Params.Add('Server=srvproyectoa.database.windows.net');
    BdproyectoaConnection.Connected := true;
    FacturasTable.Active := true;
  except on E: Exception do
    MessageDlg('Error al conectar al servidor de BD SQL de Azure: ' + #13#10 + #13#10 +
      E.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
  end;
end;

end.
