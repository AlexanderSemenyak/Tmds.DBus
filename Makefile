all: NDesk.DBus.dll monitor.exe

CSFLAGS=/unsafe
REFS=Mono.Posix

BUS_SOURCES=Address.cs Connection.cs Authentication.cs Protocol.cs Message.cs Transport.cs Wrapper.cs
UNIX_SOURCES=UnixTransport.cs
CLR_SOURCES=DBus.cs IntrospectionSchema.cs DProxy.cs Signature.cs

NDesk.DBus.dll: $(BUS_SOURCES) $(UNIX_SOURCES) $(CLR_SOURCES)

NDesk.DBus.Ssl.dll: REFS = Mono.Security

NDesk.DBus.Ssl.dll: NDesk.DBus.dll SslTransport.cs

test.exe: NDesk.DBus.dll Test.cs

test-sample.exe: NDesk.DBus.dll TestSample.cs

test-export.exe: NDesk.DBus.dll TestExport.cs

monitor.exe: NDesk.DBus.dll Monitor.cs

introspect.exe: NDesk.DBus.dll Introspect.cs

test-notifications.exe: NDesk.DBus.dll Notifications.cs TestNotifications.cs


include ../include.mk