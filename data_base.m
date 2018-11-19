classdef data_base<handle&hgsetget     %传递各种参数
    properties %(Hidden)
        map=0;                         %棋盘数据
        nap=0;                         %扩展棋盘
        axes_h=0.902;                  %棋盘高度
        axes_w=0;                      %棋盘宽度
        cut_w=0;                       %棋盘到左侧边距离3
        cut_h=0.05;                    %棋盘到下边界距离
        n=25;                          %可用的行列数
        m=1;                           %棋盘边上剪裁掉的部分
        critic_order=1;                %1玩家先手，0电脑先手
        critic_mode=0;                 %0玩家对玩家，1玩家对电脑，2电脑对电脑
        critic_start=0;                %0未开始，1开始
        critic_undo=0;                 %0不可撤销，且不显示撤销按钮文字，1可以撤销，且可以调用
        len=0;                         %实际棋盘的宽度
        markersize=15;                 %棋子的大小
        sum=0;                         %总共有sum个
        err=0;                         %错误参数  0无错误 1有错误
        err_kind=0;                    %错误类型  0default 1表示棋子不在棋盘内 2表示该位置已有棋子 10表示棋盘已满
        loc=0;                         %鼠标坐标返回的棋盘坐标
        win=0;                         %胜负判断
        total=0;                       %最多可下的子数
        critic_restart=0;              %重新开始的参数,1表示可以重新开始
        %record_mode=0;                 %是否进行结果录制并不更新图像
    end
    properties %(Hidden)                %句柄和对象属性，勿改
        p;                             %pointer类
        hcall;                         %call_fresh类
        hfigure;                       %主界面的句柄
        horder;                        %按钮order的句柄
        hmode;                         %按钮mode的句柄
        haxes;                         %棋盘的句柄
        hstart;                        %开始游戏的句柄
        hundo;                         %撤销一步的句柄
        hinfo;                         %信息的句柄
    end
    properties
        point10=1000;     %进攻分数
        point5=65;
        point3=25;
        point1=10;
        point_10=200;    %防御分数
        point_5=65;
        point_3=25;
        point_1=10;
    end
    methods
        function data=data_base()        %构造函数
            data.len=data.n+2*data.m-1;
            data.total=data.n*data.n;
            data.map=zeros(data.n,data.n);
            data.nap=zeros(data.n+8,data.n+8);
            build_figure(data);
            data.hcall=call_fresh();     %hcall为事件实例
            data.p=pointer();            %p为鼠标类实例
            build_events(data);          %设立事件和听众
        end
    end
end