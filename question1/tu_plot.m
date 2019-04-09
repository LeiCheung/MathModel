function tu_plot(rel,control)
%���ڽӾ���ͼ
%����Ϊ�ڽӾ��󣬱���Ϊ����
%�ڶ�������Ϊ��������0��ʾ����ͼ��1��ʾ����ͼ��Ĭ��ֵΪ0
 
r_size=size(rel);
if nargin<2
    control=0;
end
if r_size(1)~=r_size(2)
    disp('Wrong Input! The input must be a square matrix!');
    return;
end
len=r_size(1);
 
rho=10;%����ͼ�ߴ�Ĵ�С
r=2/1.05^len;%��İ뾶
theta=0:(2*pi/len):2*pi*(1-1/len);
[pointx,pointy]=pol2cart(theta',rho);
theta=0:pi/36:2*pi;
[tempx,tempy]=pol2cart(theta',r);
point=[pointx,pointy];
hold on
for i=1:len
    temp=[tempx,tempy]+[point(i,1)*ones(length(tempx),1),point(i,2)*ones(length(tempx),1)];
    plot(temp(:,1),temp(:,2),'r');
    text(point(i,1)-0.3,point(i,2),num2str(i));
    %����
end
for i=1:len
    for j=1:len
        if rel(i,j)
            link_plot(point(i,:),point(j,:),r,control);
            %�����й�ϵ�ĵ�
        end
    end
end
set(gca,'XLim',[-rho-r,rho+r],'YLim',[-rho-r,rho+r]);
axis off