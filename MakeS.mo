within ;
package MakeS
  model S1
    import Modelica.Utilities.Streams;
    import Modelica.Utilities.Files;
    parameter Integer N = 10;
    parameter String file = "S1_"+String(N)+".mo";
  algorithm
    when initial() then
      Files.removeFile(file);
      Streams.print("model S_"+String(N),file);
      for i in 1:N loop
        Streams.print("  P.M m"+String(i)+"(p = "+String(i)+");",file);
      end for;
      Streams.print("end S1_"+String(N)+";",file);
    end when;
    annotation(uses(Modelica));
  end S1;
end MakeS;
