% ͳ��ÿ�ܷɻ���Ӧ�ĵǻ�λ����
function F=count_feijizhuose(feijizhuose)
countfeijizhuose=zeros(303,1);
 for i=1:303
     count=0;
     for j=1:56
         if(feijizhuose(i,j)~=0)
             count=count+1;
         end
     end
     countfeijizhuose(i,1)=count;
 end
 F=countfeijizhuose;
 