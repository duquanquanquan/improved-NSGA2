function Dtrue=DONtwo(pa1,pa2)
% Authors: Maoguo Gong and Licheng Jiao
% April 7, 2006
% Copyright (C) 2005-2007 Maoguo Gong (e-mail: gongmg@126.com)
%--------------------------------------------------------------------------
[N,C]=size(pa1);
Dtrue=0;
pade=pa1-pa2;
aa=find(pade<=0);
if size(aa,2)==C
    bb=find(pade<0);
    if size(bb,2)>0
        Dtrue=1;
    end
end