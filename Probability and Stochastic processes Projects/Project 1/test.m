 %%
clear;clc;
fid= fopen('Sample Text.txt','rt');
filename= 'sample Text.txt';
 chars_read= fileread(filename);X=zeros(1,26);
 char_read2=convertCharsToStrings(chars_read);
 char_read3=lower(char_read2);
 max5_ind=[];
 for i = 1 : 26
             X(i)= count(char_read3,char(96+i));
 end
 fclose(fid);
 %%
              [D,PD]=allfitdist(X,'NLogL','DISCRETE','PDF');
D(1).DistName
D(1).ParamNames
D(1).Params
D(1).NLogL
msg=('dist name:  %s \n dist pramaters:  %s %s \n paramters values: \n  %s %s \n NLogL Value: %s \n');
s=sprintf(msg,string(D(1).DistName),string(D(1).ParamNames(:,:)),string(D(1).Params()),string(D(1).NLogL))
%%
F= fitmethis(X);

%%
F(1).name
F(1).par
F(1).LL
msg=('dist name:  %s \n dist pramaters:  %s %s  \n NLogL Value: %s \n');
z=sprintf(msg,string(F(1).name),string(F(1).par),string(F(1).LL))
 %%

  maxchars= maxk(X,5);
  for i= 1:length(X)
                for j = 1:length(maxchars)
                   if (X(i) == maxchars(j))
                           max5_ind= [max5_ind, i];
                   end
                end
  end    
   max5_ind= sort(  max5_ind,'descend');
   y_ax=zeros(1,26);
            for i = 1 :26
              y_ax(i)= X(i);
            end
   %% 

fid= fopen('Sample Text.txt','rt');
filename= 'sample Text.t    xt';
if fid >0 && ischar('A')
    k=0;
    oneread = lower(fgets(fid));
    while ischar(oneread)
        k = k + count(oneread,char(96+5));
        oneread = fgets(fid);
    end
end
trial= X(:,1).';
z=sum(X);
y_ax2=zeros(1,26);
        for i = 1 :26
            
            y_ax2(i)= (X(i)/ z);
        end

         for i = 1 :length(X)
             
             x(i)=convertCharsToStrings(char(96+i));
         end
         %%
         zX=zeros(1,26);meanX=0;EX_2=0;skewnessX=0;kurtosisX=0;
         for i=1:26
                 meanX= meanX + (i *  X(i));   
         end          
         for i=1:26
               EX_2= EX_2 + ((i^2) *  X(i)); % Expectation of X Squared (X^2)
         end    
             varX= EX_2 - ( meanX)^2;  stdX=sqrt( varX);
         for i =1:26
                 zX(i)=((i- meanX)/ stdX);
                 skewnessX=  skewnessX + (( zX(i) ^ 3) *  X(i));
         end
         for i =1:26
                 kurtosisX=  kurtosisX + (( zX(i) ^ 4) *  X(i));
         end
         %%
          probx=zeros(1,26);
          for i =1: 26
          probx(i)= (X(i) / z);
          end
          y_ax(1)=probx(1);
          for i = 2: 26
             for j= 1: 26
                 if (i > j )
                 y_ax2(i)=probx(i)+probx(j);
                 end

             end  
          end

%%

[D, PD] = allfitdist(X,'NLogL','DISCRETE');
disp(D(1))
disp(PD{1})


%%
	x= gamrnd(5,0.5,1000,1);
	y= normrnd(5,0.3,80,1);
	F= fitmethis([x; y],'pdist',3);
    F(1).name
F(1).par
F(1).ci
F(1).LL
F(1).aic