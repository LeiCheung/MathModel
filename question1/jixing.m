%% �жϻ���
[num,txt,raw] = xlsread('e:\data.xls');%��excel������������ݶ�ȡ����
data_jixing=cell(304,1);                    %Ԥ�ڴ��������
data_bianbie=cell(303,1);
data_jixing=raw(:,6);
data_jixing{1,1}=[];
for i=1:303
    switch data_jixing{i+1,1}
        case [332]
            data_bianbie{i,1}='w';
        case [333]
            data_bianbie{i,1}='w';
        case '33E'
            data_bianbie{i,1}='w';
        case '33H'
            data_bianbie{i,1}='w';
        case '33L'
            data_bianbie{i,1}='w';
        case [773]
            data_bianbie{i,1}='w';
        case [319]
            data_bianbie{i,1}='N';
        case [320]
            data_bianbie{i,1}='N';
        case [321]
            data_bianbie{i,1}='N';
        case [323]
            data_bianbie{i,1}='N';
        case [325]
            data_bianbie{i,1}='N';
        case [738]
            data_bianbie{i,1}='N';
        case '73A'
            data_bianbie{i,1}='N';
        case '73E'
            data_bianbie{i,1}='N';
        case '73H'
            data_bianbie{i,1}='N';
        case '73L'
            data_bianbie{i,1}='N';
    end
end
xlswrite('e:\data.xls',data_bianbie,1,'M2:M304');