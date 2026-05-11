unit NFE_dll_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 10/05/2010 10:29:58 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Demos\NFE_dll.tlb (1)
// LIBID: {1C81F33C-4A30-4EB0-87C8-C2D2B67D4971}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
//   (2) v2.0 mscorlib, (C:\Windows\Microsoft.NET\Framework\v2.0.50727\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TAssinarXML) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TBuscarCertificado) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TValidarXML) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TTransmissaoXML) : Server mscoree.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  NFE_dllMajorVersion = 1;
  NFE_dllMinorVersion = 0;

  LIBID_NFE_dll: TGUID = '{1C81F33C-4A30-4EB0-87C8-C2D2B67D4971}';

  IID__AssinarXML: TGUID = '{87432223-136D-35AD-94B8-44FA097DCA26}';
  IID__BuscarCertificado: TGUID = '{CF4A0FAA-723F-3DB4-834B-23C488CC0789}';
  IID__ValidarXML: TGUID = '{DF6229BA-DF3E-35D6-AD81-DAED26E31D6C}';
  IID__TransmissaoXML: TGUID = '{825A142A-50BB-3B84-9A38-D5F0175825C1}';
  CLASS_AssinarXML: TGUID = '{B605CC4D-C768-3B78-8B46-9B4C99093B49}';
  CLASS_BuscarCertificado: TGUID = '{B755B5BD-4082-3706-B603-1872D5C81B9C}';
  CLASS_ValidarXML: TGUID = '{41DFE601-4183-31FA-A1A9-CCED8B88B8D8}';
  CLASS_TransmissaoXML: TGUID = '{B5CCBF6F-3095-3849-8D00-1D0B99A01AF7}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _AssinarXML = interface;
  _AssinarXMLDisp = dispinterface;
  _BuscarCertificado = interface;
  _BuscarCertificadoDisp = dispinterface;
  _ValidarXML = interface;
  _ValidarXMLDisp = dispinterface;
  _TransmissaoXML = interface;
  _TransmissaoXMLDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AssinarXML = _AssinarXML;
  BuscarCertificado = _BuscarCertificado;
  ValidarXML = _ValidarXML;
  TransmissaoXML = _TransmissaoXML;


// *********************************************************************//
// Interface: _AssinarXML
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {87432223-136D-35AD-94B8-44FA097DCA26}
// *********************************************************************//
  _AssinarXML = interface(IDispatch)
    ['{87432223-136D-35AD-94B8-44FA097DCA26}']
    function Get_ToString: WideString; safecall;
    function Equals(obj: OleVariant): WordBool; safecall;
    function GetHashCode: Integer; safecall;
    function GetType: _Type; safecall;
    function Get_vResultado: Integer; safecall;
    function Get_vResultadoString: WideString; safecall;
    function Get_vXMLStringAssinado: WideString; safecall;
    procedure Assinar(const pArqXMLAssinar: WideString; const pUri: WideString; 
                      const oCertificado: WideString; out vResultado: Integer; 
                      out vResultadoString: WideString); safecall;
    property ToString: WideString read Get_ToString;
    property vResultado: Integer read Get_vResultado;
    property vResultadoString: WideString read Get_vResultadoString;
    property vXMLStringAssinado: WideString read Get_vXMLStringAssinado;
  end;

// *********************************************************************//
// DispIntf:  _AssinarXMLDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {87432223-136D-35AD-94B8-44FA097DCA26}
// *********************************************************************//
  _AssinarXMLDisp = dispinterface
    ['{87432223-136D-35AD-94B8-44FA097DCA26}']
    property ToString: WideString readonly dispid 0;
    function Equals(obj: OleVariant): WordBool; dispid 1610743809;
    function GetHashCode: Integer; dispid 1610743810;
    function GetType: _Type; dispid 1610743811;
    property vResultado: Integer readonly dispid 1610743812;
    property vResultadoString: WideString readonly dispid 1610743813;
    property vXMLStringAssinado: WideString readonly dispid 1610743814;
    procedure Assinar(const pArqXMLAssinar: WideString; const pUri: WideString; 
                      const oCertificado: WideString; out vResultado: Integer; 
                      out vResultadoString: WideString); dispid 1610743815;
  end;

// *********************************************************************//
// Interface: _BuscarCertificado
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CF4A0FAA-723F-3DB4-834B-23C488CC0789}
// *********************************************************************//
  _BuscarCertificado = interface(IDispatch)
    ['{CF4A0FAA-723F-3DB4-834B-23C488CC0789}']
    function Get_ToString: WideString; safecall;
    function Equals(obj: OleVariant): WordBool; safecall;
    function GetHashCode: Integer; safecall;
    function GetType: _Type; safecall;
    function Get_vResultadoString: WideString; safecall;
    function Get_oCertificado: IUnknown; safecall;
    procedure _Set_oCertificado(const pRetVal: IUnknown); safecall;
    function BuscaNome(out vResultadoString: WideString): WordBool; safecall;
    property ToString: WideString read Get_ToString;
    property vResultadoString: WideString read Get_vResultadoString;
    property oCertificado: IUnknown read Get_oCertificado write _Set_oCertificado;
  end;

// *********************************************************************//
// DispIntf:  _BuscarCertificadoDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CF4A0FAA-723F-3DB4-834B-23C488CC0789}
// *********************************************************************//
  _BuscarCertificadoDisp = dispinterface
    ['{CF4A0FAA-723F-3DB4-834B-23C488CC0789}']
    property ToString: WideString readonly dispid 0;
    function Equals(obj: OleVariant): WordBool; dispid 1610743809;
    function GetHashCode: Integer; dispid 1610743810;
    function GetType: _Type; dispid 1610743811;
    property vResultadoString: WideString readonly dispid 1610743812;
    property oCertificado: IUnknown dispid 1610743813;
    function BuscaNome(out vResultadoString: WideString): WordBool; dispid 1610743815;
  end;

// *********************************************************************//
// Interface: _ValidarXML
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {DF6229BA-DF3E-35D6-AD81-DAED26E31D6C}
// *********************************************************************//
  _ValidarXML = interface(IDispatch)
    ['{DF6229BA-DF3E-35D6-AD81-DAED26E31D6C}']
    function Get_ToString: WideString; safecall;
    function Equals(obj: OleVariant): WordBool; safecall;
    function GetHashCode: Integer; safecall;
    function GetType: _Type; safecall;
    function Get_nRetornoTipoArq: Integer; safecall;
    function Get_cRetornoTipoArq: WideString; safecall;
    function Get_cArquivoSchema: WideString; safecall;
    procedure ValidaXML(const cRotaArqXML: WideString; const cRotaArqSchema: WideString; 
                        out oRetorno: Integer; out oRetornoString: WideString); safecall;
    property ToString: WideString read Get_ToString;
    property nRetornoTipoArq: Integer read Get_nRetornoTipoArq;
    property cRetornoTipoArq: WideString read Get_cRetornoTipoArq;
    property cArquivoSchema: WideString read Get_cArquivoSchema;
  end;

// *********************************************************************//
// DispIntf:  _ValidarXMLDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {DF6229BA-DF3E-35D6-AD81-DAED26E31D6C}
// *********************************************************************//
  _ValidarXMLDisp = dispinterface
    ['{DF6229BA-DF3E-35D6-AD81-DAED26E31D6C}']
    property ToString: WideString readonly dispid 0;
    function Equals(obj: OleVariant): WordBool; dispid 1610743809;
    function GetHashCode: Integer; dispid 1610743810;
    function GetType: _Type; dispid 1610743811;
    property nRetornoTipoArq: Integer readonly dispid 1610743812;
    property cRetornoTipoArq: WideString readonly dispid 1610743813;
    property cArquivoSchema: WideString readonly dispid 1610743814;
    procedure ValidaXML(const cRotaArqXML: WideString; const cRotaArqSchema: WideString; 
                        out oRetorno: Integer; out oRetornoString: WideString); dispid 1610743815;
  end;

// *********************************************************************//
// Interface: _TransmissaoXML
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {825A142A-50BB-3B84-9A38-D5F0175825C1}
// *********************************************************************//
  _TransmissaoXML = interface(IDispatch)
    ['{825A142A-50BB-3B84-9A38-D5F0175825C1}']
    function Get_ToString: WideString; safecall;
    function Equals(obj: OleVariant): WordBool; safecall;
    function GetHashCode: Integer; safecall;
    function GetType: _Type; safecall;
    function Get_MsgRetWS: WideString; safecall;
    function tratarUF(const strUF: WideString): WideString; safecall;
    function cUF(const strUF: WideString): WideString; safecall;
    function NfeConsulta(const verSchema: WideString; const siglaUF: WideString; TipoAmb: Integer; 
                         const TitularCert: WideString; const MsgCabec: WideString; 
                         const MsgDados: WideString; out MsgRetWS: WideString): WordBool; safecall;
    function NfeCancelamento(const verSchema: WideString; const siglaUF: WideString; 
                             TipoAmb: Integer; const TitularCert: WideString; 
                             const MsgCabec: WideString; const MsgDados: WideString; 
                             out MsgRetWS: WideString): WordBool; safecall;
    function NfeInutilizacao(const verSchema: WideString; const siglaUF: WideString; 
                             TipoAmb: Integer; const TitularCert: WideString; 
                             const MsgCabec: WideString; const MsgDados: WideString; 
                             out MsgRetWS: WideString): WordBool; safecall;
    function NfeRecepcao(const verSchema: WideString; const siglaUF: WideString; TipoAmb: Integer; 
                         const TitularCert: WideString; const MsgCabec: WideString; 
                         const MsgDados: WideString; out MsgRetWS: WideString): WordBool; safecall;
    function NfeRetRecepcao(const verSchema: WideString; const siglaUF: WideString; 
                            TipoAmb: Integer; const TitularCert: WideString; 
                            const MsgCabec: WideString; const MsgDados: WideString; 
                            out MsgRetWS: WideString): WordBool; safecall;
    function NfeStatusServico(const verSchema: WideString; const siglaUF: WideString; 
                              TipoAmb: Integer; const TitularCert: WideString; 
                              const MsgCabec: WideString; const MsgDados: WideString; 
                              out MsgRetWS: WideString): WordBool; safecall;
    function CadConsulta(const siglaUF: WideString; TipoAmb: Integer; 
                         const TitularCert: WideString; const MsgCabec: WideString; 
                         const MsgDados: WideString; out MsgRetWS: WideString): WordBool; safecall;
    property ToString: WideString read Get_ToString;
    property MsgRetWS: WideString read Get_MsgRetWS;
  end;

// *********************************************************************//
// DispIntf:  _TransmissaoXMLDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {825A142A-50BB-3B84-9A38-D5F0175825C1}
// *********************************************************************//
  _TransmissaoXMLDisp = dispinterface
    ['{825A142A-50BB-3B84-9A38-D5F0175825C1}']
    property ToString: WideString readonly dispid 0;
    function Equals(obj: OleVariant): WordBool; dispid 1610743809;
    function GetHashCode: Integer; dispid 1610743810;
    function GetType: _Type; dispid 1610743811;
    property MsgRetWS: WideString readonly dispid 1610743812;
    function tratarUF(const strUF: WideString): WideString; dispid 1610743813;
    function cUF(const strUF: WideString): WideString; dispid 1610743814;
    function NfeConsulta(const verSchema: WideString; const siglaUF: WideString; TipoAmb: Integer; 
                         const TitularCert: WideString; const MsgCabec: WideString; 
                         const MsgDados: WideString; out MsgRetWS: WideString): WordBool; dispid 1610743815;
    function NfeCancelamento(const verSchema: WideString; const siglaUF: WideString; 
                             TipoAmb: Integer; const TitularCert: WideString; 
                             const MsgCabec: WideString; const MsgDados: WideString; 
                             out MsgRetWS: WideString): WordBool; dispid 1610743816;
    function NfeInutilizacao(const verSchema: WideString; const siglaUF: WideString; 
                             TipoAmb: Integer; const TitularCert: WideString; 
                             const MsgCabec: WideString; const MsgDados: WideString; 
                             out MsgRetWS: WideString): WordBool; dispid 1610743817;
    function NfeRecepcao(const verSchema: WideString; const siglaUF: WideString; TipoAmb: Integer; 
                         const TitularCert: WideString; const MsgCabec: WideString; 
                         const MsgDados: WideString; out MsgRetWS: WideString): WordBool; dispid 1610743818;
    function NfeRetRecepcao(const verSchema: WideString; const siglaUF: WideString; 
                            TipoAmb: Integer; const TitularCert: WideString; 
                            const MsgCabec: WideString; const MsgDados: WideString; 
                            out MsgRetWS: WideString): WordBool; dispid 1610743819;
    function NfeStatusServico(const verSchema: WideString; const siglaUF: WideString; 
                              TipoAmb: Integer; const TitularCert: WideString; 
                              const MsgCabec: WideString; const MsgDados: WideString; 
                              out MsgRetWS: WideString): WordBool; dispid 1610743820;
    function CadConsulta(const siglaUF: WideString; TipoAmb: Integer; 
                         const TitularCert: WideString; const MsgCabec: WideString; 
                         const MsgDados: WideString; out MsgRetWS: WideString): WordBool; dispid 1610743821;
  end;

// *********************************************************************//
// The Class CoAssinarXML provides a Create and CreateRemote method to          
// create instances of the default interface _AssinarXML exposed by              
// the CoClass AssinarXML. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAssinarXML = class
    class function Create: _AssinarXML;
    class function CreateRemote(const MachineName: string): _AssinarXML;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAssinarXML
// Help String      : 
// Default Interface: _AssinarXML
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAssinarXMLProperties= class;
{$ENDIF}
  TAssinarXML = class(TOleServer)
  private
    FIntf:        _AssinarXML;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TAssinarXMLProperties;
    function      GetServerProperties: TAssinarXMLProperties;
{$ENDIF}
    function      GetDefaultInterface: _AssinarXML;
  protected
    procedure InitServerData; override;
    function Get_ToString: WideString;
    function Get_vResultado: Integer;
    function Get_vResultadoString: WideString;
    function Get_vXMLStringAssinado: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _AssinarXML);
    procedure Disconnect; override;
    function Equals(obj: OleVariant): WordBool;
    function GetHashCode: Integer;
    function GetType: _Type;
    procedure Assinar(const pArqXMLAssinar: WideString; const pUri: WideString; 
                      const oCertificado: WideString; out vResultado: Integer; 
                      out vResultadoString: WideString);
    property DefaultInterface: _AssinarXML read GetDefaultInterface;
    property ToString: WideString read Get_ToString;
    property vResultado: Integer read Get_vResultado;
    property vResultadoString: WideString read Get_vResultadoString;
    property vXMLStringAssinado: WideString read Get_vXMLStringAssinado;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAssinarXMLProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAssinarXML
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAssinarXMLProperties = class(TPersistent)
  private
    FServer:    TAssinarXML;
    function    GetDefaultInterface: _AssinarXML;
    constructor Create(AServer: TAssinarXML);
  protected
    function Get_ToString: WideString;
    function Get_vResultado: Integer;
    function Get_vResultadoString: WideString;
    function Get_vXMLStringAssinado: WideString;
  public
    property DefaultInterface: _AssinarXML read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoBuscarCertificado provides a Create and CreateRemote method to          
// create instances of the default interface _BuscarCertificado exposed by              
// the CoClass BuscarCertificado. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBuscarCertificado = class
    class function Create: _BuscarCertificado;
    class function CreateRemote(const MachineName: string): _BuscarCertificado;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBuscarCertificado
// Help String      : 
// Default Interface: _BuscarCertificado
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBuscarCertificadoProperties= class;
{$ENDIF}
  TBuscarCertificado = class(TOleServer)
  private
    FIntf:        _BuscarCertificado;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TBuscarCertificadoProperties;
    function      GetServerProperties: TBuscarCertificadoProperties;
{$ENDIF}
    function      GetDefaultInterface: _BuscarCertificado;
  protected
    procedure InitServerData; override;
    function Get_ToString: WideString;
    function Get_vResultadoString: WideString;
    function Get_oCertificado: IUnknown;
    procedure _Set_oCertificado(const pRetVal: IUnknown);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _BuscarCertificado);
    procedure Disconnect; override;
    function Equals(obj: OleVariant): WordBool;
    function GetHashCode: Integer;
    function GetType: _Type;
    function BuscaNome(out vResultadoString: WideString): WordBool;
    property DefaultInterface: _BuscarCertificado read GetDefaultInterface;
    property ToString: WideString read Get_ToString;
    property vResultadoString: WideString read Get_vResultadoString;
    property oCertificado: IUnknown read Get_oCertificado write _Set_oCertificado;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBuscarCertificadoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBuscarCertificado
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBuscarCertificadoProperties = class(TPersistent)
  private
    FServer:    TBuscarCertificado;
    function    GetDefaultInterface: _BuscarCertificado;
    constructor Create(AServer: TBuscarCertificado);
  protected
    function Get_ToString: WideString;
    function Get_vResultadoString: WideString;
    function Get_oCertificado: IUnknown;
    procedure _Set_oCertificado(const pRetVal: IUnknown);
  public
    property DefaultInterface: _BuscarCertificado read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoValidarXML provides a Create and CreateRemote method to          
// create instances of the default interface _ValidarXML exposed by              
// the CoClass ValidarXML. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoValidarXML = class
    class function Create: _ValidarXML;
    class function CreateRemote(const MachineName: string): _ValidarXML;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TValidarXML
// Help String      : 
// Default Interface: _ValidarXML
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TValidarXMLProperties= class;
{$ENDIF}
  TValidarXML = class(TOleServer)
  private
    FIntf:        _ValidarXML;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TValidarXMLProperties;
    function      GetServerProperties: TValidarXMLProperties;
{$ENDIF}
    function      GetDefaultInterface: _ValidarXML;
  protected
    procedure InitServerData; override;
    function Get_ToString: WideString;
    function Get_nRetornoTipoArq: Integer;
    function Get_cRetornoTipoArq: WideString;
    function Get_cArquivoSchema: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _ValidarXML);
    procedure Disconnect; override;
    function Equals(obj: OleVariant): WordBool;
    function GetHashCode: Integer;
    function GetType: _Type;
    procedure ValidaXML(const cRotaArqXML: WideString; const cRotaArqSchema: WideString; 
                        out oRetorno: Integer; out oRetornoString: WideString);
    property DefaultInterface: _ValidarXML read GetDefaultInterface;
    property ToString: WideString read Get_ToString;
    property nRetornoTipoArq: Integer read Get_nRetornoTipoArq;
    property cRetornoTipoArq: WideString read Get_cRetornoTipoArq;
    property cArquivoSchema: WideString read Get_cArquivoSchema;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TValidarXMLProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TValidarXML
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TValidarXMLProperties = class(TPersistent)
  private
    FServer:    TValidarXML;
    function    GetDefaultInterface: _ValidarXML;
    constructor Create(AServer: TValidarXML);
  protected
    function Get_ToString: WideString;
    function Get_nRetornoTipoArq: Integer;
    function Get_cRetornoTipoArq: WideString;
    function Get_cArquivoSchema: WideString;
  public
    property DefaultInterface: _ValidarXML read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTransmissaoXML provides a Create and CreateRemote method to          
// create instances of the default interface _TransmissaoXML exposed by              
// the CoClass TransmissaoXML. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTransmissaoXML = class
    class function Create: _TransmissaoXML;
    class function CreateRemote(const MachineName: string): _TransmissaoXML;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTransmissaoXML
// Help String      : 
// Default Interface: _TransmissaoXML
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTransmissaoXMLProperties= class;
{$ENDIF}
  TTransmissaoXML = class(TOleServer)
  private
    FIntf:        _TransmissaoXML;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TTransmissaoXMLProperties;
    function      GetServerProperties: TTransmissaoXMLProperties;
{$ENDIF}
    function      GetDefaultInterface: _TransmissaoXML;
  protected
    procedure InitServerData; override;
    function Get_ToString: WideString;
    function Get_MsgRetWS: WideString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _TransmissaoXML);
    procedure Disconnect; override;
    function Equals(obj: OleVariant): WordBool;
    function GetHashCode: Integer;
    function GetType: _Type;
    function tratarUF(const strUF: WideString): WideString;
    function cUF(const strUF: WideString): WideString;
    function NfeConsulta(const verSchema: WideString; const siglaUF: WideString; TipoAmb: Integer; 
                         const TitularCert: WideString; const MsgCabec: WideString; 
                         const MsgDados: WideString; out MsgRetWS: WideString): WordBool;
    function NfeCancelamento(const verSchema: WideString; const siglaUF: WideString; 
                             TipoAmb: Integer; const TitularCert: WideString; 
                             const MsgCabec: WideString; const MsgDados: WideString; 
                             out MsgRetWS: WideString): WordBool;
    function NfeInutilizacao(const verSchema: WideString; const siglaUF: WideString; 
                             TipoAmb: Integer; const TitularCert: WideString; 
                             const MsgCabec: WideString; const MsgDados: WideString; 
                             out MsgRetWS: WideString): WordBool;
    function NfeRecepcao(const verSchema: WideString; const siglaUF: WideString; TipoAmb: Integer; 
                         const TitularCert: WideString; const MsgCabec: WideString; 
                         const MsgDados: WideString; out MsgRetWS: WideString): WordBool;
    function NfeRetRecepcao(const verSchema: WideString; const siglaUF: WideString; 
                            TipoAmb: Integer; const TitularCert: WideString; 
                            const MsgCabec: WideString; const MsgDados: WideString; 
                            out MsgRetWS: WideString): WordBool;
    function NfeStatusServico(const verSchema: WideString; const siglaUF: WideString; 
                              TipoAmb: Integer; const TitularCert: WideString; 
                              const MsgCabec: WideString; const MsgDados: WideString; 
                              out MsgRetWS: WideString): WordBool;
    function CadConsulta(const siglaUF: WideString; TipoAmb: Integer; 
                         const TitularCert: WideString; const MsgCabec: WideString; 
                         const MsgDados: WideString; out MsgRetWS: WideString): WordBool;
    property DefaultInterface: _TransmissaoXML read GetDefaultInterface;
    property ToString: WideString read Get_ToString;
    property MsgRetWS: WideString read Get_MsgRetWS;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTransmissaoXMLProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTransmissaoXML
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTransmissaoXMLProperties = class(TPersistent)
  private
    FServer:    TTransmissaoXML;
    function    GetDefaultInterface: _TransmissaoXML;
    constructor Create(AServer: TTransmissaoXML);
  protected
    function Get_ToString: WideString;
    function Get_MsgRetWS: WideString;
  public
    property DefaultInterface: _TransmissaoXML read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoAssinarXML.Create: _AssinarXML;
begin
  Result := CreateComObject(CLASS_AssinarXML) as _AssinarXML;
end;

class function CoAssinarXML.CreateRemote(const MachineName: string): _AssinarXML;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AssinarXML) as _AssinarXML;
end;

procedure TAssinarXML.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{B605CC4D-C768-3B78-8B46-9B4C99093B49}';
    IntfIID:   '{87432223-136D-35AD-94B8-44FA097DCA26}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAssinarXML.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _AssinarXML;
  end;
end;

procedure TAssinarXML.ConnectTo(svrIntf: _AssinarXML);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAssinarXML.Disconnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAssinarXML.GetDefaultInterface: _AssinarXML;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAssinarXML.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAssinarXMLProperties.Create(Self);
{$ENDIF}
end;

destructor TAssinarXML.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAssinarXML.GetServerProperties: TAssinarXMLProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TAssinarXML.Get_ToString: WideString;
begin
    Result := DefaultInterface.ToString;
end;

function TAssinarXML.Get_vResultado: Integer;
begin
    Result := DefaultInterface.vResultado;
end;

function TAssinarXML.Get_vResultadoString: WideString;
begin
    Result := DefaultInterface.vResultadoString;
end;

function TAssinarXML.Get_vXMLStringAssinado: WideString;
begin
    Result := DefaultInterface.vXMLStringAssinado;
end;

function TAssinarXML.Equals(obj: OleVariant): WordBool;
begin
  Result := DefaultInterface.Equals(obj);
end;

function TAssinarXML.GetHashCode: Integer;
begin
  Result := DefaultInterface.GetHashCode;
end;

function TAssinarXML.GetType: _Type;
begin
  Result := DefaultInterface.GetType;
end;

procedure TAssinarXML.Assinar(const pArqXMLAssinar: WideString; const pUri: WideString; 
                              const oCertificado: WideString; out vResultado: Integer; 
                              out vResultadoString: WideString);
begin
  DefaultInterface.Assinar(pArqXMLAssinar, pUri, oCertificado, vResultado, vResultadoString);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAssinarXMLProperties.Create(AServer: TAssinarXML);
begin
  inherited Create;
  FServer := AServer;
end;

function TAssinarXMLProperties.GetDefaultInterface: _AssinarXML;
begin
  Result := FServer.DefaultInterface;
end;

function TAssinarXMLProperties.Get_ToString: WideString;
begin
    Result := DefaultInterface.ToString;
end;

function TAssinarXMLProperties.Get_vResultado: Integer;
begin
    Result := DefaultInterface.vResultado;
end;

function TAssinarXMLProperties.Get_vResultadoString: WideString;
begin
    Result := DefaultInterface.vResultadoString;
end;

function TAssinarXMLProperties.Get_vXMLStringAssinado: WideString;
begin
    Result := DefaultInterface.vXMLStringAssinado;
end;

{$ENDIF}

class function CoBuscarCertificado.Create: _BuscarCertificado;
begin
  Result := CreateComObject(CLASS_BuscarCertificado) as _BuscarCertificado;
end;

class function CoBuscarCertificado.CreateRemote(const MachineName: string): _BuscarCertificado;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BuscarCertificado) as _BuscarCertificado;
end;

procedure TBuscarCertificado.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{B755B5BD-4082-3706-B603-1872D5C81B9C}';
    IntfIID:   '{CF4A0FAA-723F-3DB4-834B-23C488CC0789}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBuscarCertificado.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _BuscarCertificado;
  end;
end;

procedure TBuscarCertificado.ConnectTo(svrIntf: _BuscarCertificado);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBuscarCertificado.Disconnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBuscarCertificado.GetDefaultInterface: _BuscarCertificado;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBuscarCertificado.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBuscarCertificadoProperties.Create(Self);
{$ENDIF}
end;

destructor TBuscarCertificado.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBuscarCertificado.GetServerProperties: TBuscarCertificadoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TBuscarCertificado.Get_ToString: WideString;
begin
    Result := DefaultInterface.ToString;
end;

function TBuscarCertificado.Get_vResultadoString: WideString;
begin
    Result := DefaultInterface.vResultadoString;
end;

function TBuscarCertificado.Get_oCertificado: IUnknown;
begin
    Result := DefaultInterface.oCertificado;
end;

procedure TBuscarCertificado._Set_oCertificado(const pRetVal: IUnknown);
  { Warning: The property oCertificado has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.oCertificado := pRetVal;
end;

function TBuscarCertificado.Equals(obj: OleVariant): WordBool;
begin
  Result := DefaultInterface.Equals(obj);
end;

function TBuscarCertificado.GetHashCode: Integer;
begin
  Result := DefaultInterface.GetHashCode;
end;

function TBuscarCertificado.GetType: _Type;
begin
  Result := DefaultInterface.GetType;
end;

function TBuscarCertificado.BuscaNome(out vResultadoString: WideString): WordBool;
begin
  Result := DefaultInterface.BuscaNome(vResultadoString);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBuscarCertificadoProperties.Create(AServer: TBuscarCertificado);
begin
  inherited Create;
  FServer := AServer;
end;

function TBuscarCertificadoProperties.GetDefaultInterface: _BuscarCertificado;
begin
  Result := FServer.DefaultInterface;
end;

function TBuscarCertificadoProperties.Get_ToString: WideString;
begin
    Result := DefaultInterface.ToString;
end;

function TBuscarCertificadoProperties.Get_vResultadoString: WideString;
begin
    Result := DefaultInterface.vResultadoString;
end;

function TBuscarCertificadoProperties.Get_oCertificado: IUnknown;
begin
    Result := DefaultInterface.oCertificado;
end;

procedure TBuscarCertificadoProperties._Set_oCertificado(const pRetVal: IUnknown);
  { Warning: The property oCertificado has a setter and a getter whose
    types do not match. Delphi was unable to generate a property of
    this sort and so is using a Variant as a passthrough. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.oCertificado := pRetVal;
end;

{$ENDIF}

class function CoValidarXML.Create: _ValidarXML;
begin
  Result := CreateComObject(CLASS_ValidarXML) as _ValidarXML;
end;

class function CoValidarXML.CreateRemote(const MachineName: string): _ValidarXML;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ValidarXML) as _ValidarXML;
end;

procedure TValidarXML.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{41DFE601-4183-31FA-A1A9-CCED8B88B8D8}';
    IntfIID:   '{DF6229BA-DF3E-35D6-AD81-DAED26E31D6C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TValidarXML.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _ValidarXML;
  end;
end;

procedure TValidarXML.ConnectTo(svrIntf: _ValidarXML);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TValidarXML.Disconnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TValidarXML.GetDefaultInterface: _ValidarXML;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TValidarXML.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TValidarXMLProperties.Create(Self);
{$ENDIF}
end;

destructor TValidarXML.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TValidarXML.GetServerProperties: TValidarXMLProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TValidarXML.Get_ToString: WideString;
begin
    Result := DefaultInterface.ToString;
end;

function TValidarXML.Get_nRetornoTipoArq: Integer;
begin
    Result := DefaultInterface.nRetornoTipoArq;
end;

function TValidarXML.Get_cRetornoTipoArq: WideString;
begin
    Result := DefaultInterface.cRetornoTipoArq;
end;

function TValidarXML.Get_cArquivoSchema: WideString;
begin
    Result := DefaultInterface.cArquivoSchema;
end;

function TValidarXML.Equals(obj: OleVariant): WordBool;
begin
  Result := DefaultInterface.Equals(obj);
end;

function TValidarXML.GetHashCode: Integer;
begin
  Result := DefaultInterface.GetHashCode;
end;

function TValidarXML.GetType: _Type;
begin
  Result := DefaultInterface.GetType;
end;

procedure TValidarXML.ValidaXML(const cRotaArqXML: WideString; const cRotaArqSchema: WideString; 
                                out oRetorno: Integer; out oRetornoString: WideString);
begin
  DefaultInterface.ValidaXML(cRotaArqXML, cRotaArqSchema, oRetorno, oRetornoString);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TValidarXMLProperties.Create(AServer: TValidarXML);
begin
  inherited Create;
  FServer := AServer;
end;

function TValidarXMLProperties.GetDefaultInterface: _ValidarXML;
begin
  Result := FServer.DefaultInterface;
end;

function TValidarXMLProperties.Get_ToString: WideString;
begin
    Result := DefaultInterface.ToString;
end;

function TValidarXMLProperties.Get_nRetornoTipoArq: Integer;
begin
    Result := DefaultInterface.nRetornoTipoArq;
end;

function TValidarXMLProperties.Get_cRetornoTipoArq: WideString;
begin
    Result := DefaultInterface.cRetornoTipoArq;
end;

function TValidarXMLProperties.Get_cArquivoSchema: WideString;
begin
    Result := DefaultInterface.cArquivoSchema;
end;

{$ENDIF}

class function CoTransmissaoXML.Create: _TransmissaoXML;
begin
  Result := CreateComObject(CLASS_TransmissaoXML) as _TransmissaoXML;
end;

class function CoTransmissaoXML.CreateRemote(const MachineName: string): _TransmissaoXML;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TransmissaoXML) as _TransmissaoXML;
end;

procedure TTransmissaoXML.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{B5CCBF6F-3095-3849-8D00-1D0B99A01AF7}';
    IntfIID:   '{825A142A-50BB-3B84-9A38-D5F0175825C1}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTransmissaoXML.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _TransmissaoXML;
  end;
end;

procedure TTransmissaoXML.ConnectTo(svrIntf: _TransmissaoXML);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTransmissaoXML.Disconnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTransmissaoXML.GetDefaultInterface: _TransmissaoXML;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTransmissaoXML.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTransmissaoXMLProperties.Create(Self);
{$ENDIF}
end;

destructor TTransmissaoXML.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTransmissaoXML.GetServerProperties: TTransmissaoXMLProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TTransmissaoXML.Get_ToString: WideString;
begin
    Result := DefaultInterface.ToString;
end;

function TTransmissaoXML.Get_MsgRetWS: WideString;
begin
    Result := DefaultInterface.MsgRetWS;
end;

function TTransmissaoXML.Equals(obj: OleVariant): WordBool;
begin
  Result := DefaultInterface.Equals(obj);
end;

function TTransmissaoXML.GetHashCode: Integer;
begin
  Result := DefaultInterface.GetHashCode;
end;

function TTransmissaoXML.GetType: _Type;
begin
  Result := DefaultInterface.GetType;
end;

function TTransmissaoXML.tratarUF(const strUF: WideString): WideString;
begin
  Result := DefaultInterface.tratarUF(strUF);
end;

function TTransmissaoXML.cUF(const strUF: WideString): WideString;
begin
  Result := DefaultInterface.cUF(strUF);
end;

function TTransmissaoXML.NfeConsulta(const verSchema: WideString; const siglaUF: WideString; 
                                     TipoAmb: Integer; const TitularCert: WideString; 
                                     const MsgCabec: WideString; const MsgDados: WideString; 
                                     out MsgRetWS: WideString): WordBool;
begin
  Result := DefaultInterface.NfeConsulta(verSchema, siglaUF, TipoAmb, TitularCert, MsgCabec, 
                                         MsgDados, MsgRetWS);
end;

function TTransmissaoXML.NfeCancelamento(const verSchema: WideString; const siglaUF: WideString; 
                                         TipoAmb: Integer; const TitularCert: WideString; 
                                         const MsgCabec: WideString; const MsgDados: WideString; 
                                         out MsgRetWS: WideString): WordBool;
begin
  Result := DefaultInterface.NfeCancelamento(verSchema, siglaUF, TipoAmb, TitularCert, MsgCabec, 
                                             MsgDados, MsgRetWS);
end;

function TTransmissaoXML.NfeInutilizacao(const verSchema: WideString; const siglaUF: WideString; 
                                         TipoAmb: Integer; const TitularCert: WideString; 
                                         const MsgCabec: WideString; const MsgDados: WideString; 
                                         out MsgRetWS: WideString): WordBool;
begin
  Result := DefaultInterface.NfeInutilizacao(verSchema, siglaUF, TipoAmb, TitularCert, MsgCabec, 
                                             MsgDados, MsgRetWS);
end;

function TTransmissaoXML.NfeRecepcao(const verSchema: WideString; const siglaUF: WideString; 
                                     TipoAmb: Integer; const TitularCert: WideString; 
                                     const MsgCabec: WideString; const MsgDados: WideString; 
                                     out MsgRetWS: WideString): WordBool;
begin
  Result := DefaultInterface.NfeRecepcao(verSchema, siglaUF, TipoAmb, TitularCert, MsgCabec, 
                                         MsgDados, MsgRetWS);
end;

function TTransmissaoXML.NfeRetRecepcao(const verSchema: WideString; const siglaUF: WideString; 
                                        TipoAmb: Integer; const TitularCert: WideString; 
                                        const MsgCabec: WideString; const MsgDados: WideString; 
                                        out MsgRetWS: WideString): WordBool;
begin
  Result := DefaultInterface.NfeRetRecepcao(verSchema, siglaUF, TipoAmb, TitularCert, MsgCabec, 
                                            MsgDados, MsgRetWS);
end;

function TTransmissaoXML.NfeStatusServico(const verSchema: WideString; const siglaUF: WideString; 
                                          TipoAmb: Integer; const TitularCert: WideString; 
                                          const MsgCabec: WideString; const MsgDados: WideString; 
                                          out MsgRetWS: WideString): WordBool;
begin
  Result := DefaultInterface.NfeStatusServico(verSchema, siglaUF, TipoAmb, TitularCert, MsgCabec, 
                                              MsgDados, MsgRetWS);
end;

function TTransmissaoXML.CadConsulta(const siglaUF: WideString; TipoAmb: Integer; 
                                     const TitularCert: WideString; const MsgCabec: WideString; 
                                     const MsgDados: WideString; out MsgRetWS: WideString): WordBool;
begin
  Result := DefaultInterface.CadConsulta(siglaUF, TipoAmb, TitularCert, MsgCabec, MsgDados, MsgRetWS);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTransmissaoXMLProperties.Create(AServer: TTransmissaoXML);
begin
  inherited Create;
  FServer := AServer;
end;

function TTransmissaoXMLProperties.GetDefaultInterface: _TransmissaoXML;
begin
  Result := FServer.DefaultInterface;
end;

function TTransmissaoXMLProperties.Get_ToString: WideString;
begin
    Result := DefaultInterface.ToString;
end;

function TTransmissaoXMLProperties.Get_MsgRetWS: WideString;
begin
    Result := DefaultInterface.MsgRetWS;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TAssinarXML, TBuscarCertificado, TValidarXML, TTransmissaoXML]);
end;

end.
