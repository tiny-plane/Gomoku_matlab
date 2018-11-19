function drawing(data)                                %�������ӵĳ���ÿ�θ��������Ժ����
black=[];
white=[];
axes(data.haxes);                                     %��Ҫ�趨�������
cla
[black(1,:),black(2,:)]=find(data.map==1);            %���ӵ�λ��
if ~isempty(find(data.map==-1, 1))                       %���ϰ汾��matlab�в����������ĸ�ֵ���ж�һ�����û�а��Ӿ��������ӻ��ƵĹ���
    [white(1,:),white(2,:)]=find(data.map==-1);           %�˹�������ʱ�䲻�࣬���ܰ��ս����޸Ĵ��룬���޸�
    white(1,:)=data.len-white(1,:)-data.m+1;              %��Ϊ����������ϵ��������Ҫ����������ϵ����ת��
    white(2,:)=data.m+white(2,:)-1;
    plot(white(2,:),white(1,:),'o','markersize',data.markersize,'markeredgecolor',[0,0,0],'markerfacecolor',[0.9,0.9,0.9]);
end
black(1,:)=data.len-black(1,:)-data.m+1;
black(2,:)=data.m+black(2,:)-1;
plot(black(2,:),black(1,:),'.','markersize',3.5*data.markersize,'markerfacecolor',[0,0,0],'markeredgecolor',[0,0,0]);
plot(data.m+data.loc(2)-1,data.len-data.loc(1)-data.m+1,'.','markersize',2*data.markersize,'markerfacecolor',[1,0,0]);
drawnow;
end