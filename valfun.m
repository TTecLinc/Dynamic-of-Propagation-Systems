function val=valfun(k)
global vlast1 beta delta theta k0 kt
g=interp1(k0,vlast1,k,'linear');
kk=kt.^theta-k+(1-delta).*kt;
if kk <= 0
    val=-1e5.*abs(kk);
else
    val=log(kk)+beta*g;
end
val=-val;