function drawing(data)                                %绘制棋子的程序，每次更新棋盘以后调用
black=[];
white=[];
axes(data.haxes);                                     %先要设定操作句柄
cla
[black(1,:),black(2,:)]=find(data.map==1);            %黑子的位置
if ~isempty(find(data.map==-1, 1))                       %在老版本的matlab中不允许空数组的赋值，判断一下如果没有白子就跳过白子绘制的过程
    [white(1,:),white(2,:)]=find(data.map==-1);           %此过程消耗时间不多，不能按照建议修改代码，勿修改
    white(1,:)=data.len-white(1,:)-data.m+1;              %因为有两套坐标系，这里需要将两个坐标系互相转化
    white(2,:)=data.m+white(2,:)-1;
    plot(white(2,:),white(1,:),'o','markersize',data.markersize,'markeredgecolor',[0,0,0],'markerfacecolor',[0.9,0.9,0.9]);
end
black(1,:)=data.len-black(1,:)-data.m+1;
black(2,:)=data.m+black(2,:)-1;
plot(black(2,:),black(1,:),'.','markersize',3.5*data.markersize,'markerfacecolor',[0,0,0],'markeredgecolor',[0,0,0]);
plot(data.m+data.loc(2)-1,data.len-data.loc(1)-data.m+1,'.','markersize',2*data.markersize,'markerfacecolor',[1,0,0]);
drawnow;
end