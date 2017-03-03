within ;
package MakeSystem
  model System
    import Modelica.Utilities.Streams;
    import Modelica.Utilities.Files;
    parameter Integer N = 3;
    parameter String file = "System_"+String(N)+".mo";
  algorithm
    when initial() then
      Files.removeFile(file);
      Streams.print("model System_"+String(N),file);
      for i in 1:N loop
        Streams.print("  Networks.NetworkComponent c"+String(i)+"(R = "+String(i)+");",file);
      end for;
      Streams.print("  Networks.Ground ground;",file);
      Streams.print("  Networks.VoltageSource source(v = sin(time));",file);
      Streams.print("equation",file);
      Streams.print("  connect(source.p, c1.p);",file);
      for i in 1:N-1 loop
        Streams.print("  connect(c"+String(i)+".n, c"+String(i+1)+".p);",file);
      end for;
      Streams.print("  connect(c"+String(N)+".n,ground.n);",file);
      Streams.print("end System_"+String(N)+";",file);
    end when;
    annotation(uses(Modelica));
  end System;
end MakeSystem;
