% %
% Mohamed Zayed Ahmed (201800760)
%part 1:
%First Test Case
clear;clc;
theta = unifrnd(0,2*pi,1000);
omega_c = 3/4*pi;A = 4;
t = (-10:0.01:4.99); 
for i =1:1000
X = (A*sin((omega_c *t)+theta(i,:).'))+(0.5*A*cos((2*omega_c *t)+(theta(i,:).'/3)));      
end

save('Yinputs.mat','X','t');
[~,c]=size(X);
 for m = 1 :c
     for n = 1 : c
        ACFM(m,n)=mean(X(:,m).*X(:,n));
     end
 end
lol= 1:1:c;

            s=surf(lol,lol,ACFM);
            s.EdgeColor='none';
            title(' Statistical ACF');xlabel('X(i)');ylabel('X(j)');zlabel('ACF');
            figure('Name','Statistical ACF')
            subplot(1,1,1);


%%
importfile('Sample_Process.mat')
[~,c]=size(X);
 for m = 1 :c
     for n = 1 : c
        ACFM(m,n)=mean(X(:,m).*X(:,n));
     end
 end

 lol= 1:1:c;

            s=surf(lol,lol,ACFM);
            s.EdgeColor='none';
            title(' Statistical ACF');xlabel('X(i)');ylabel('X(j)');zlabel('ACF');
            figure('Name','Statistical ACF')
            subplot(1,1,1);
            s=surf(1:1:c,1:1:c,ACFM);s.EdgeColor='none';
            title(' Statistical ACF');xlabel('X(i)');ylabel('X(j)');zlabel('ACF');