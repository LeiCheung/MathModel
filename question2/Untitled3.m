[num1,txt1,raw1] = xlsread('e:\data.xlsx');%��excel��������зɻ��������ݶ�ȡ����
particlesize=10;

hangbanxulie=globalbest_x;
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
figure(1)
% x=[1:69,1:69];
% y=[huitu_kuan*2,huitu_zhai*2];
% stairs(x,y);
plot(1:69,huitu_kuan*2,'r-');
hold on;
plot(1:69,huitu_zhai*2,'g-');
legend('�������״ͼ','խ�����״ͼ');
xlabel('�ǻ�λ');ylabel('��������');
title('������ǻ��ڵĿ�խ�����������Ա�');
grid on;
figure(3)
kuanzhaiji_bingtu=[count_kuan_ji*2,count_zhai_ji*2];
labels={'�����','խ���'};
pie(kuanzhaiji_bingtu,labels);
title('������ǻ��ڵĿ�խ��������������ͼ');