function NE=neighbor(i,j,M,A,d)
                    r=1;
                    m=size(A,1);
                  for t=1:m
                    if((A(j,t)==1)&&(t~=i))
                    r=r*M(t,j,d);
                    endif
                    endfor
                    NE=r;
                    endfunction 