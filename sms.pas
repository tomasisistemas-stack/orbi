// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.naoligo.com.br/ws/server.php?wsdl
// Encoding : ISO-8859-1
// Version  : 1.0
// (20/7/2011 09:07:05 - 1.33.2.5)
// ************************************************************************ //

unit sms;

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
  // Namespace : urn:ServerSendSMS
  // soapAction: urn:ServerSendSMS#hello
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ServerSendSMSBinding
  // service   : ServerSendSMS
  // port      : ServerSendSMSPort
  // URL       : http://www.naoligo.com.br/ws/server.php
  // ************************************************************************ //
  ServerSendSMSPortType = interface(IInvokable)
  ['{F7691D00-CE8D-60F9-65DD-629275062196}']
    function  hello(const name: WideString): WideString; stdcall;
    function  login(const email: WideString; const senha: WideString): WideString; stdcall;
    function  getContatos(const email: WideString; const senha: WideString): WideString; stdcall;
    function  sendSMS(const email: WideString; const senha: WideString; const ddd: WideString; const telefone: WideString; const texto: WideString): WideString; stdcall;
    function  sendSMSById(const email: WideString; const senha: WideString; const id: WideString; const texto: WideString): WideString; stdcall;
  end;

function GetServerSendSMSPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServerSendSMSPortType;


implementation

function GetServerSendSMSPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServerSendSMSPortType;
const
  defWSDL = 'http://www.naoligo.com.br/ws/server.php?wsdl';
  defURL  = 'http://www.naoligo.com.br/ws/server.php';
  defSvc  = 'ServerSendSMS';
  defPrt  = 'ServerSendSMSPort';
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
    Result := (RIO as ServerSendSMSPortType);
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
  InvRegistry.RegisterInterface(TypeInfo(ServerSendSMSPortType), 'urn:ServerSendSMS', 'ISO-8859-1');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServerSendSMSPortType), 'urn:ServerSendSMS#hello');

end.