clc;clear all;close all;
tic;                              %�������м�ʱ
E0=0.001;                        %�������
MaxNum=100;                                                     %��������������
narvs=1;                                                               %Ŀ�꺯�����Ա�������
particlesize=30;                                                   %����Ⱥ��ģ
c1=2;                                                                    %ÿ�����ӵĸ���ѧϰ���ӣ�Ҳ��Ϊ���ٳ���
c2=2;                                                                    %ÿ�����ӵ����ѧϰ���ӣ�Ҳ��Ϊ���ٳ���
w=0.6;                                                                   %��������
linjiejuzhen=xlsread('e:\data.xlsx',7);
bianyiquji=xlsread('e:\data.xlsx',6);
% �жϱ���ȡ���ĸ���
countbianyiquji=zeros(1,303);
for i=1:303
    count_bianyiquji=0;
    for j=1:69
        if(bianyiquji(i,j)~=0)
            count_bianyiquji=count_bianyiquji+1;
        end
    end
    countbianyiquji(1,i)=count_bianyiquji;
end

% vmax=0.8;                                                   %���ӵ��������ٶ�
for i=1:particlesize
    [x(i,:)]=shengchenglizi(1);                       %�������ڵ�λ��
end
% v=2*rand(particlesize,303);                               %���ӵķ����ٶ�
%Ŀ�꺯��
for i=1:particlesize
        f(i)=fitness(x(i,:));  
end
personalbest_x=x;
personalbest_faval=f;
[globalbest_faval i]=min(personalbest_faval);
globalbest_x=personalbest_x(i,:);
k=1;
while k<=MaxNum
    for i=1:particlesize
%         for j=1:narvs
            f(i)=fitness(x(i,:));
%         end
        if f(i)<personalbest_faval(i) %�жϵ�ǰλ���Ƿ�����ʷ�����λ��
            personalbest_faval(i)=f(i);
            personalbest_x(i,:)=x(i,:);
        end
    end
    [globalbest_faval i]=min(personalbest_faval);
    globalbest_x=personalbest_x(i,:);
    for i=1:particlesize %��������Ⱥ��ÿ�����������λ��
       feijihao=round(rand(1,1)*(302))+1;%ѡ��һ�������
       select_bianyi=round(rand(1,1)*(countbianyiquji(feijihao)-1))+1;%����ɻ�����Ӧ�ĺ���ۿ�
       bianyi_tihuan=bianyiquji(select_bianyi);
       flag_bianyi_tihuan=true;
       select_jiaocha=round(rand(1,2)*302)+1;%ѡ�����Ƭ�ν����λ�ã�����λ��
       jiaocha_tihuan=zeros(1,2);
       flag_jiaocha_tihuan=true;
       for j=1:303     %�ж��ܷ����
           if(x(i,j)==bianyi_tihuan)
               if(linjiejuzhen(feijihao,j)==1)
                   flag_bianyi_tihuan=false;
                   break;
               else
                   continue;
               end
           else   
               continue;
           end
       end
       if(flag_bianyi_tihuan)
           x(i,feijihao)=bianyi_tihuan;%ִ�б���
       end
       for j=1:2
            jiaocha_tihuan(1,j)=globalbest_x(1, select_jiaocha(1,j));
            for k=1:303     %�ж��ܷ񽻲�
                if(x(i,k)==jiaocha_tihuan(1,j))
                     if(linjiejuzhen(select_jiaocha(1,j),k)==1)
                         flag_jiaocha_tihuan=false;
                         break;
                     else
                         continue;
                     end
                else
                    continue;
                end
            end
       end
        if(flag_jiaocha_tihuan)
            for j=1:2
                x(i,select_jiaocha(1,j))= jiaocha_tihuan(1,j);%ִ�н���
            end
        end
    end
    if 1/abs(globalbest_faval)<E0,break,end%�˴���Ҫע��
    k=k+1;
end
Value1=-globalbest_faval-1; Value1=num2str(Value1);
% strcatָ�����ʵ���ַ���������
disp(strcat('the maximum value','=',Value1));
%������ֵ���ڵĺ�����λ��
Value2=globalbest_x; Value2=num2str(Value2);
disp(strcat('the corresponding coordinate','=',Value2));

x=globalbest_x;
count=0;
fangzheng=zeros(303,69);
for i=1:303
    if(x(1,i)~=0)
        count=count+1;
        fangzheng(i,x(1,i))=1;
    end
end
disp(strcat('�����ŵ���󺽰���','=',num2str(count)));
count_xjuzhen=0;
 for h=1:69
    if(sum(fangzheng(:,h))==0)
        count_xjuzhen=count_xjuzhen+1;
    end
 end
 disp(strcat('�ǻ�����������Ϊ','=',num2str(count_xjuzhen)));

% ������ �ǻ��� 
hangbanxulie=globalbest_x;
figure;
axis([0 4000 0 70]);
juzhen=xlsread('e:\data.xls',1,'N1:O303');
cmd=0;
for i=1:303
    if(hangbanxulie(1,i)~=0)
        cmd=cmd+1;
    end
end
huatu1=zeros(cmd,2);
count=0;
for i=1:303
    if(hangbanxulie(1,i)~=0)
        count=count+1;
        huatu1(count,1)=i;
        huatu1(count,2)=hangbanxulie(1,i);
    end
end
for i=1:cmd
    rectangle('Position',[juzhen(huatu1(i,1),1),huatu1(i,2),juzhen(huatu1(i,1),2)-juzhen(huatu1(i,1),1),1],'Curvature',[1 1],'EdgeColor','b','LineWidth',2);
end
xlabel('����ʱ��');ylabel('�ǻ���');title('�����λ����ͼ');
grid on;toc;