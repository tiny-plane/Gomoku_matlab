function xy2ij(data)            %�����꣨x,y)ת����(i,j)
if data.win==0
    data.p.cac_position;
    data.p.click_position=get(data.p,'position');%�ɽ��淵�ص����������
    x=data.p.click_position(1);
    y=data.p.click_position(2);
    data.loc(1)=(data.cut_h-y)*(data.n+2*data.m-1)/data.axes_h+data.n+data.m;  %ת����ʽ
    data.loc(2)=(x-data.cut_w)*(data.n+2*data.m-1)/data.axes_w-data.m+1;
    data.loc(1)=round(data.loc(1));                      %��������ȡ�������
    data.loc(2)=round(data.loc(2));
end
data.err=0;
data.err_kind=0;
if data.critic_start==1
    if  data.loc(1)<1||data.loc(1)>data.n||data.loc(2)<1||data.loc(2)>data.n  %�жϸ�λ���Ƿ���������
        data.err=1;
        data.err_kind=1;                                 %��������1��ʾ���Ӳ���������
        return
    end
    if data.map(data.loc(1),data.loc(2))~=0              %�жϸ�λ���Ƿ���������
        data.err=1;
        data.err_kind=2;                                 %��������2��ʾ��λ����������
        return
    end
    if mod(data.sum,2)==0                                %��������Ϊż��ʱ�����
        data.map(data.loc(1),data.loc(2))=1;
        data.nap(data.loc(1)+4,data.loc(2)+4)=1;
    else
        data.map(data.loc(1),data.loc(2))=-1;            %��������Ϊ����ʱ�����
        data.nap(data.loc(1)+4,data.loc(2)+4)=-1;
    end
    drawing(data);
    data.sum=data.sum+1;                                 %��������������
    if data.sum==data.total                              %�ж������Ƿ�����������
        data.err=1;
        data.err_kind=10;                                %��������10��ʾ��������
    end
end
set(data.hundo,'enable','on');
end