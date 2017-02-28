function X=maxprod(A,W,its)
       
      m=size(A,1);
      M=ones(m,m,size(W,2));
      BE=zeros(m,m,size(W,2),size(W,2));
      SBE=zeros(m,m);
      T=zeros(m,m);
      BV=zeros(m,size(W,2));
      SBV=zeros(m,1);
      X=zeros(m,1);
      while its>=0
        for i=1:m
          for j=1:m
            if(A(i,j)==1)
            for c=1:size(W,2)
              o=0;
              for d=1:size(W,2)
                if(c==d)
                pot=0;
                else
                pot=1;
                endif
                NE=neighbor(i,j,M,A,d);
                h=NE*pot*exp(W(d));
                if(h>o)
                o=h;
                endif
                endfor
                M(j,i,c)=o;
                endfor
                endif
                endfor
                endfor
                T=sum(M(:,:,:),3);
                for i=1:size(W,2)
                  if(T ~=0)
                  M(:,:,i)=M(:,:,i)./T;
                  endif
                  endfor
                  for i=1:m
                    for c=1:size(W,2)
                        pro=1;
                         for j=1:m
                           if(A(i,j)==1)
                           pro=pro*M(j,i,c);
                           endif
                              endfor
                                BV(i,c)=exp(W(c))*pro;
                    endfor
                  endfor
                  SBV=sum(BV,2);
                  if (SBV ~=0)
                  BV=BV./SBV;
                  endif
                   its--;
                   endwhile
                   for i=1:m
                     max=0;
                     max1=0;
                     maxi=0;
                     for j=1:size(W,2)
                       if(BV(i,j)>max)
                         max=BV(i,j);
                         maxi=j;
                         elseif(BV(i,j)==max)
                          max1=max;
                          max=0;
                          maxi=0;
                          endif
                          endfor
                          if(max>max1)
                          X(i)=maxi;
                          endif
                          endfor
                          
                         
                  
                  
                  endfunction