function Z=bethe(B,BE,A,k,m,W)
                    sum1=0;
                    sum2=0;
                    sum3=0;
                    entr=0;
                    
                    for i=1:m
                      for j=1:k
                        if(B(i,j)~=0)
                        
                        sum1=sum1+B(i,j)*log(B(i,j));
                        endif
                        
                      endfor
                     endfor
                     for i=1:m
                       for j=1:m
                         for c=1:k
                           for d=1:k
                             if(A(i,j)==1&&(j>i))
                            if((B(i,c)~=0)&&(B(j,d)~=0))
                              y=B(i,c)*B(j,d);
                              l=BE(i,j,c,d)/y;
                              if(l!=0)
                              p=BE(i,j,c,d)*log(l);
                              sum2=sum2+p;
                              
                              endif
                              
                              endif
                              endif
                              endfor
                              endfor
                              endfor
                              endfor
                              for i=1:m
                                for c=1:k
                                  sum3=sum3+(B(i,c)*log(exp(W(c))));
                                 endfor
                               endfor
                              
                               entr=-sum1-sum2+sum3;
                              Z=exp(entr);
                           endfunction
