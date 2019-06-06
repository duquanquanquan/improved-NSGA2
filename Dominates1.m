function flag=Dominates1(x,y)

    flag=all(x<=y) && any(x<y);

end