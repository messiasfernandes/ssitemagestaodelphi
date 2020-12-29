unit SistemaGestao.Model.ServicodeRelatorio;

interface
         uses RESTRequest4D.Request, DataSet.Serialize,Vcl.Dialogs,
         SistemaGestao.Model.DmConexaoEventos,SistemaGestao.Model.EntidadeUsuarioComToken;
         type
         TServiceRelatorio = class(TObject)
         private
            dm:TDataEventos;
         protected

         public
           constructor Create;
           destructor Destroy; override;

         published
           procedure relatorioEstque(pqte1,pqte2: string;usuario:TUsuarioComToken);

         end;
implementation

{ TServiceRelatorio }



constructor TServiceRelatorio.Create;
begin
   dm:=TDataEventos.Create(nil);
end;

destructor TServiceRelatorio.Destroy;
begin
   dm.Free;
  inherited;
end;

procedure TServiceRelatorio.relatorioEstque(pqte1, pqte2: string; usuario:TUsuarioComToken);
begin
ShowMessage(pqte1+' - '+pqte2);
    TRequest.New.BaseURL('http://192.168.1.3:8080/' ).
     AcceptCharset ('application/json').
     Resource( 'relatorios/estoques?').
     BasicAuthentication(usuario.funcionario.email,usuario.senha).
     AddParam('pqtde1',pqte1).
     AddParam('pqtde2',pqte2).
     DataSetAdapter(dm.FDMemTabEstoque).Get;
     dm.frxReportEstqoue.ShowReport();
end;

end.
