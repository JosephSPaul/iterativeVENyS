function[y]=VENyS(theta)
% VENyS algorithm with one virual sample
siz=size(theta);
x=theta;

diffxy = theta(:,:,2)-theta(:,:,1); 

ind1=find(diffxy>pi);
ind2=find(diffxy<-pi);
y = zeros(siz(1),siz(2));

for i=1:size(x,1)
    for j=1:size(x,2)
        if abs(diffxy(i,j))<pi
            if theta(i,j,1)>0
                
               if theta(i,j,2)>theta(i,j,1)
                  y(i,j)=theta(i,j,2);
               else
                    if abs(theta(i,j,2)-theta(i,j,1)) <(pi/2)
                       y(i,j)=theta(i,j,2);
                    else
                       y(i,j)=theta(i,j,2)+2*pi;
                    end
               end
            else
                if theta(i,j,2)<theta(i,j,1)
                         y(i,j)=theta(i,j,2);
                else
                   if diffxy(i,j) <(pi/2)
                       y(i,j)=theta(i,j,2);
                   else
                       y(i,j)=theta(i,j,2)-2*pi;
                   end
                end
            end
        end
    end
end
theta2=theta(:,:,2);
y(ind1)=theta2(ind1)-2*pi;
y(ind2)=theta2(ind2)+2*pi;