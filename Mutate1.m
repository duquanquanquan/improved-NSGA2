function x=Mutate(x,mu,VarRange)

    bd=min(VarRange);
    bu=max(VarRange);

[N,C]=size(x);
eta_m=20;
% if rand<pm
   for j=1:C
        r1=rand;
        if r1<=mu
            y=x(j);
            yd=bd;
            yu=bu;
            if y>yd
                if (y-yd)<(yu-y)
                    delta=(y-yd)/(yu-yd);
                else
                    delta=(yu-y)/(yu-yd);
                end
                r2=rand;
                indi=1/(eta_m+1);
                if r2<=0.5
                    xy=1-delta;
                    val=2*r2+(1-2*r2)*(xy^(eta_m+1));
                    deltaq=val^indi-1;
                else
                    xy=1-delta;
                    val=2*(1-r2)+2*(r2-0.5)*(xy^(eta_m+1));
                    deltaq=1-val^indi;
                end
                y=y+deltaq*(yu-yd);
                x(j)=min(y,yu);
                x(j)=max(y,yd);
            else
                x(j)=rand*(yu-yd)+yd;
            end
        end
    end
end
% end