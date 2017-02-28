function Z=sumprod(A,W,its)
       
      m=size(A,1);
      M=ones(m,m,size(W,2));
      BE=zeros(m,m,size(W,2),size(W,2));
      SBE=zeros(m,m);
      T=zeros(m,m);
      BV=zeros(m,size(W,2));
      SBV=zeros(m,1);
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
                o=o+h;
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
                  for i=1:m
                    for j=1:m
                       for c=1:size(W,2)
                           for d=1:size(W,2)
                             ny=edge(i,j,c,d,A,M,W);
                             BE(i,j,c,d)=ny;
                             endfor
                        endfor
                     endfor
                  endfor
                  SBE=sum(BE(:,:,:),3);
                  
                  for i=1:size(W,2)
                    for j=1:size(W,2)
                    if (SBE ~=0)
                    BE(:,:,i,j)=BE(:,:,i,j)./SBE;
                    endif
                    endfor
                    endfor
                    its--;
                   endwhile
               
                  
                  Z=bethe(BV,BE,A,size(W,2),m,W);
                  endfunction