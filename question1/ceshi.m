%% �˳���������õ�һ�ʵ����ŽⲢ����������ͼ
[num1,txt1,raw1] = xlsread('e:\data.xlsx');%��excel��������зɻ��������ݶ�ȡ����
particlesize=10;
f=zeros(1,particlesize);
for i=1:particlesize
    [diedai(i,:)]=shengchenglizi(1);                      
     f(1,i)=fitness(diedai(i,:));  
end
for i=1:particlesize
   if(f(1,i)==max(f))
       a=i;
   end
end
hangbanxulie=diedai(a,:);
x=hangbanxulie;
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
 disp(strcat('�ǻ�����������Ϊ','=',69-num2str(count_xjuzhen)));
%% ��խ����ֱ���״ͼ
huitu_kuan=zeros(1,69);
huitu_zhai=zeros(1,69);
 count_kuan_ji=0;
 count_zhai_ji=0;
for j=1:69
    count_kuan=0;
    count_zhai=0;
    for i=1:303
         if(fangzheng(i,j)==1)
             if(strcmp(raw1{i,13},'W'))
                 count_kuan=count_kuan+1;
             elseif(strcmp(raw1{i,13},'N'))
                 count_zhai=count_zhai+1;
             end
         end
    end
    huitu_kuan(1,j)=count_kuan;
    count_kuan_ji=count_kuan_ji+count_kuan;
    huitu_zhai(1,j)=count_zhai;
    count_zhai_ji=count_zhai_ji+count_zhai;
end
% ������ �ǻ��� 
figure(1)
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
    rectangle('Position',[juzhen(huatu1(i,1),1),huatu1(i,2),juzhen(huatu1(i,1),2)-juzhen(huatu1(i,1),1)+45,1],'Curvature',[1 1],'EdgeColor','b','LineWidth',2);
end
xlabel('����ʱ��');ylabel('�ǻ���');
title('����һ�����λ����ͼ');
grid on;
figure(2)
% x=[1:69,1:69];
% y=[huitu_kuan*2,huitu_zhai*2];
% stairs(x,y);
plot(1:69,huitu_kuan*2,'r-');
hold on;
plot(1:69,huitu_zhai*2,'g-');
legend('�������״ͼ','խ�����״ͼ');
xlabel('�ǻ�λ');ylabel('��������');
title('����һ�ǻ��ڵĿ�խ�����������Ա�');
grid on;
figure(3)
kuanzhaiji_bingtu=[count_kuan_ji*2,count_zhai_ji*2];
labels={'�����','խ���'};
pie(kuanzhaiji_bingtu,labels);
title('����һ�ǻ��ڵĿ�խ��������������ͼ');
 %% ��T S�ǻ��ڵ�ʹ����Ŀ�ͱ�ʹ�õǻ��ڵ�ʹ���ʽ���ͳ��
% A=xlsread('e:\jieguo.xlsx',1,'A2:A304');
% hangbanxulie=A';
 count_T=0;
 count_S=0;
 for i=1:303
     if(hangbanxulie(1,i)>28)%�ж�T S�ķɻ�����
         count_S=count_S+1;
     else
         count_T=count_T+1;
     end
 end
 T_shiyong=zeros(count_T,2);
 S_shiyong=zeros(count_S,2);
 count_t=0;
 count_s=0;
 for i=1:303
     if(hangbanxulie(1,i)>0&&hangbanxulie(1,i)<=28)
         count_t=count_t+1;
         T_shiyong(count_t,1)=i;%���˶�Ӧ�ķɻ�����ۿں�
         T_shiyong(count_t,2)=hangbanxulie(1,i);
     elseif(hangbanxulie(1,i)>28)
         count_s=count_s+1;
         S_shiyong(count_s,1)=i;
         S_shiyong(count_s,2)=hangbanxulie(1,i);
     end
 end
 time_Tshiyong=0;
 time_Sshiyong=0;
for i=1:count_t
    time_Tshiyong= time_Tshiyong+ raw1{T_shiyong(i,1),15}-raw1{T_shiyong(i,1),14};
end
for i=1:count_s
    time_Sshiyong= time_Sshiyong+ raw1{S_shiyong(i,1),15}-raw1{S_shiyong(i,1),14};
end
count_Tshiyong=28;
count_Sshiyong=39;
pinjun_Tshiyonglv=time_Tshiyong/(24*60*count_Tshiyong);
pinjun_Sshiyonglv= time_Sshiyong/(24*60*count_Sshiyong);
y=[count_Tshiyong,count_Sshiyong];
figure(4)
bar(y,0.2);
xlabel('�ǻ���λ��');ylabel('�ǻ�����Ŀ');
title('�����T��S�ǻ���ʹ����Ŀ');
grid on;
figure(5)
pinjun_shiyonglv_bingtu=[pinjun_Tshiyonglv,pinjun_Sshiyonglv];
labels={'T��վ¥','S������'};
legend('T��վ¥','S������');
pie(pinjun_shiyonglv_bingtu);
title('��������ǻ��ڵ�ƽ��ʹ����');