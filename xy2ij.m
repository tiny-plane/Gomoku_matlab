function xy2ij(data)            %将坐标（x,y)转换成(i,j)
if data.win==0
    data.p.cac_position;
    data.p.click_position=get(data.p,'position');%由界面返回的鼠标点击坐标
    x=data.p.click_position(1);
    y=data.p.click_position(2);
    data.loc(1)=(data.cut_h-y)*(data.n+2*data.m-1)/data.axes_h+data.n+data.m;  %转换公式
    data.loc(2)=(x-data.cut_w)*(data.n+2*data.m-1)/data.axes_w-data.m+1;
    data.loc(1)=round(data.loc(1));                      %四舍五入取最近整数
    data.loc(2)=round(data.loc(2));
end
data.err=0;
data.err_kind=0;
if data.critic_start==1
    if  data.loc(1)<1||data.loc(1)>data.n||data.loc(2)<1||data.loc(2)>data.n  %判断该位置是否在棋盘内
        data.err=1;
        data.err_kind=1;                                 %错误类型1表示棋子不在棋盘内
        return
    end
    if data.map(data.loc(1),data.loc(2))~=0              %判断该位置是否已有棋子
        data.err=1;
        data.err_kind=2;                                 %错误类型2表示该位置已有棋子
        return
    end
    if mod(data.sum,2)==0                                %总棋子数为偶数时落黑子
        data.map(data.loc(1),data.loc(2))=1;
        data.nap(data.loc(1)+4,data.loc(2)+4)=1;
    else
        data.map(data.loc(1),data.loc(2))=-1;            %总棋子数为奇数时落白子
        data.nap(data.loc(1)+4,data.loc(2)+4)=-1;
    end
    drawing(data);
    data.sum=data.sum+1;                                 %棋盘上总棋子数
    if data.sum==data.total                              %判断棋盘是否已落满棋子
        data.err=1;
        data.err_kind=10;                                %错误类型10表示棋盘已满
    end
end
set(data.hundo,'enable','on');
end