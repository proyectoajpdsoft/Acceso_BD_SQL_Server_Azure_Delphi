program ProyectoAAccesoSQLServerAzure;

uses
  Vcl.Forms,
  UnidadAccesoSQLServerAzure in 'UnidadAccesoSQLServerAzure.pas' {formMSSQLAzure};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMSSQLAzure, formMSSQLAzure);
  Application.Run;
end.
