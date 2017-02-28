function ny=edge(i,j,c,d,A,M,W)
                      m=size(A,1);
                      if(c==d)
                      ny=0;
                      else
                      v=1;
                      x=1;
                      for t=1:m
                        if(t~=j&&(A(i,t)==1))
                       v=v*M(t,i,c);
                       endif
                       endfor
                       for t=1:m
                         if(t~=i&&(A(j,t)==1))
                         x=x*M(t,j,d);
                         endif
                         endfor
                         r=v*x*exp(W(c))*exp(W(d));
                         ny=r;
                         endif
                         endfunction
                    