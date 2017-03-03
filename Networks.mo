package Networks
  type Voltage = Real(unit="V");
  type Current = Real(unit="A");
  type Resistance = Real(unit="Ohm");

  connector Pin
    Voltage v;
    flow Current i;
  end Pin;
  
  model Resistor
    Pin p,n;
    Voltage v;
    Current i;
    parameter Resistance R;
  equation
    v = p.v-n.v;
    i = p.i;
    0 = p.i + n.i;
    v = R*i;
  end Resistor;  

  model NetworkComponent
    Pin p,n;
    parameter Resistance R;
    Resistor R1(R = R/4);
    Resistor R2(R = R/4);
    Resistor R3(R = R/4);
    Resistor R4(R = R/4);
  equation
    connect(R1.p, p);
    connect(R1.n, R2.p);
    connect(R2.n, R3.p);
    connect(R3.n, R4.p);
    connect(R4.n, n);
  end NetworkComponent;
  
  model VoltageSource
    Pin p;
    Voltage v = 0;
  equation
    p.v = v;
  end VoltageSource;  
  
  model Ground
    Pin n;
  equation
    n.v = 0;
  end Ground;  
  
  model System
    NetworkComponent c1(R = 0.1);
    NetworkComponent c2(R = 0.2);
    NetworkComponent c3(R = 0.2);
    Ground ground;
    VoltageSource source(v = sin(time));
  equation
    connect(source.p, c1.p);
    connect(c1.n, c2.p);
    connect(c2.n, c3.p);
    connect(c3.n, ground.n);
  end System;
end Networks;