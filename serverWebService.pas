// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.toolsweb.com.br/webservice/serverWebService.php?wsdl
// Encoding : ISO-8859-1
// Version  : 1.0
// (18/11/2011 15:52:48 - 1.33.2.5)
// ************************************************************************ //

unit serverWebService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Name      : server.consultaCEPPortType
  // Namespace : urn:server.consultaCEP
  // soapAction: urn:server.consultaCEP#consultacep
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : server.consultaCEPBinding
  // service   : server.consultaCEP
  // port      : server.consultaCEPPort
  // URL       : http://www.toolsweb.com.br/webservice/serverWebService.php
  // ************************************************************************ //
  server_consultaCEPPortType = interface(IInvokable)
  ['{714645F1-6198-BB0D-D6E9-16E4F1AD3D83}']
    function  consultaCEP(const cep: WideString): WideString; stdcall;
  end;

function Getserver_consultaCEPPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): server_consultaCEPPortType;


implementation

function Getserver_consultaCEPPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): server_consultaCEPPortType;
const
  defWSDL = 'http://www.toolsweb.com.br/webservice/serverWebService.php?wsdl';
  defURL  = 'http://www.toolsweb.com.br/webservice/serverWebService.php';
  defSvc  = 'server.consultaCEP';
  defPrt  = 'server.consultaCEPPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as server_consultaCEPPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(server_consultaCEPPortType), 'urn:server.consultaCEP', 'ISO-8859-1', '', 'server.consultaCEPPortType');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(server_consultaCEPPortType), 'urn:server.consultaCEP#consultacep');

end. 