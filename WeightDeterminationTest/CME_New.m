function [G2 e2 r2 W2] = CME_New(r1,I2,Z2,I3,Z3,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,i)
G2 = G_initial;
e2 = inf;
k = 0;

while 1
    [J2 r2] = ComputeJacobianAndError_New(I2,Z2,I3,Z3,G2,InParas);
    W2 = WeightDetermination(r2,abs(r1-r2),initial_sigma,default_dof,5,100);
    [Je We re num Jn Wn rn] = GetValidJWr(J2,W2,r2);
    e_last = e2;
    e2 = GetError(re,We);
    if e2 > e_last
        break
    else
        d_ksi = Get_dksi(Je,We,re);
        G2 = G2*RBMotion(d_ksi);
    end
    k=k+1;   
    ee = e_last-e2;
    if abs(ee) < epsilon || kmax < k
        break;
    end
end
    

