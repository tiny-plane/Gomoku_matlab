classdef data_base2<handle&hgsetget     %传递各种参数
    properties
        map;                         %棋盘数据
        nap;                         %扩展棋盘
        n=25;                          %可用的行列数
        len;
        m=1;                           %棋盘边上剪裁掉的部分
        sum=0;                         %总共有sum个
        loc=0;                         %鼠标坐标返回的棋盘坐标
        win=0;                         %胜负判断
        total=0;                       %最多可下的子数
        point10=1000;
        point5;
        point3;
        point1;
        point_10;
        point_5;
        point_3;
        point_1;
        g_point10=1000;     %好的进攻分数
        g_point5=65;
        g_point3=25;
        g_point1=10;
        g_point_10=200;    %好的防御分数
        g_point_5=65;
        g_point_3=25;
        g_point_1=10;
    end
    methods
        function data=data_base2(p2,p3,p4,p5,p6,p7,p8,q2,q3,q4,q5,q6,q7,q8)        %构造函数
            data.len=data.n+2*data.m-1;
            data.total=data.n*data.n;
            data.map=zeros(data.n,data.n);
            data.nap=zeros(data.n+8,data.n+8);
            %后手分数获得
            data.point5=p2;
            data.point3=p3;
            data.point1=p4;
            data.point_10=p5;
            data.point_5=p6;
            data.point_3=p7;
            data.point_1=p8;
            data.g_point5=q2;
            data.g_point3=q3;
            data.g_point1=q4;
            data.g_point_10=q5;
            data.g_point_5=q6;
            data.g_point_3=q7;
            data.g_point_1=q8;
        end
    end
end