unit ServerConst_PTest;

interface

resourcestring
  sPortInUse = '- Error: Port %s already in use';
  sPortSet = '- Port set to %s';
  sPortNotSet = '- Port could not be set';
  sServerRunning = '- The Server is already running';
  sStartingServer = '- Starting Server';
  sServerIsRunning = '- Server Running';
  sStoppingServer = '- Stopping Server';
  sServerStopped = '- Server Stopped';
  sServerNotRunning = '- The Server is not running';
  sInvalidCommand = '- Error: Invalid Command';
  sIndyVersion = '- Indy Version: ';
  sActive = '- Active: ';
  sTCPIPPort = '- TCP/IP Port: ';
  sHTTPPort = '- HTTP Port: ';
  sHTTPSPort = '- HTTPS Port: ';
  sSessionID = '- Session ID CookieName: ';
  sCommands = 'Enter a Command: ' + slineBreak +
    '   - "start" to start the server' + slineBreak +
    '   - "stop" to stop the server' + slineBreak +
    '   - "set port -t" to change the TCP/IP default port' + slineBreak +
    '   - "set port -h" to change the HTTP default port' + slineBreak +
    '   - "set port -s" to change the HTTPS default port' + slineBreak +
    '   - "status" for Server status' + slineBreak +
    '   - "help" to show commands' + slineBreak +
    '   - "IB" Connetti DB Interbase' + slineBreak +
    '   - "W_MYSQL" Connetti DB MySQL Windows' + slineBreak +
    '   - "C_MYSQL" Connetti DB MySQL Container' + slineBreak +
    '   - "TRACEON" Abilita Trace' + slineBreak +
    '   - "TRACEOFF" Disabilita Trace' + slineBreak +
    '   - "NCON" N. di connessioni attive' + slineBreak +
    '   - "exit" to close the application';

const
  cArrow = '->';
  cCommandStart = 'start';
  cCommandStop = 'stop';
  cCommandStatus = 'status';
  cCommandHelp = 'help';
  cCommandSetTCPIPPort = 'set port -t';
  cCommandSetHTTPPort = 'set port -h';
  cCommandSetHTTPSPort = 'set port -s';
  cCommandIb = 'IB';
  cCommandMySQl = 'W_MYSQL';
  cCommandMySQl_Container = 'C_MYSQL';
  cCommandTrace_True = 'TRACEON';
  cCommandTrace_False = 'TRACEOFF';
  cCommandConn_Attive = 'NCON';
  cCommandExit = 'exit';
  cCommandStartFD = 'startfd';
  cCommandStopFD = 'stopfd';
  cclosedss1 = 'Close dss1';
  cclosedss2 = 'Close dss2';
  cclosedss3 = 'Close dss3';
  cclosedss4 = 'Close dss4';
  cclosedss5 = 'Close dss5';
  cclosedss6 = 'Close Metodi';
  cOpendss1 = 'Open dss1';
  cOpendss2 = 'Open dss2';
  cOpendss3 = 'Open dss3';
  cOpendss4 = 'Open dss4';
  cOpendss5 = 'Open dss5';
  cOpendss6 = 'Open Metodi';
  cErrordss1 = 'Error dss1';
  cErrordss2 = 'Error dss2';
  cErrordss3 = 'Error dss3';
  cErrordss4 = 'Error dss4';
  cErrordss5 = 'Error dss5';
  cErrordss6 = 'Error Metodi';
  cErrorConn = 'Error Connection Principale';
  cErrorConn_method = 'Error Connection Metodi';
  cErrorLost = 'Error Lost Principale';
  cErrorLost_method = 'Error Lost Metodi';
  cErrorRecover = 'Error Recover Principale';
  cErrorRecover_method = 'Error Recover Metodi';
  cDatabase_IB = 'Connesso a un Database Interbase';
  cDatabase_MySQL = 'Connesso a un Database MySql Windows';
  cDatabase_MySQL_Container = 'Connesso a un Database MySql Container';
  cTrace_on = 'Trace attivata';
  cTrace_off = 'Trace disattivata';
  cconn_attive = 'Connessioni Attive';
  sConnOK = ' Connesione attiva SERVER QNC';
  sConnKO = ' Connesione NON attiva SERVER QNC';

{$SCOPEDENUMS ON}

type
  DSProtocol = (TCPIP, HTTP, HTTPS);

{$SCOPEDENUMS OFF}

implementation

end.
