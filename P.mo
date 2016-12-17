package P
  model M01
  parameter Real p = 3;
  parameter Real q = 10;
  final parameter Real r = 2;
    Real x, y, z;
    Real a, b, c;
    Real d, e, f, g;
  equation
    x = b;
    y = p*x + a;
    z - x = q;
    a = 10;
    b - a = r;
    c + a - 2 = 14;
    d = 40;
    e = 0;
    f = 50;
    c+ d+ e +x +a = 0;
  end M01;
  
  model M1
    parameter Real p = 3;
    M01 m01(p = p);
    M01 m02(p = p);
    M01 m03(p = p);
    M01 m04(p = p);
    M01 m05(p = p);
    M01 m06(p = p);
    M01 m07(p = p);
    M01 m08(p = p);
    M01 m09(p = p);
    M01 m10(p = p);
  end M1;
  
  model S1
    M1 m1(p = 1);
    M1 m2(p = 2);
  end S1;
end P;
