clc
clear
      
g_point5=67.351209;
g_point3=28.106790;
g_point1=9.544345;
g_point_10=265.600817;    %好的防御分数
g_point_5=62.181880;
g_point_3=33.713221;
g_point_1=7.915779;
fileID=fopen('data.txt','w');

%保存在工作空间里
result=zeros(15,25,10);
for iterate=1:5
    point5=65+50*(rand(1,1)-0.2);
        point3=30+10*(rand(1,1)-0.5);
        point1=10+5*(rand(1,1)-0.5);
        point_10=250+75*(rand(1,1)-0.5);
        point_5=65+50*(rand(1,1)-0.2);
        point_3=30+10*(rand(1,1)-0.5);
        point_1=10+5*(rand(1,1)-0.5);
    for round=1:25
        tic
        data=data_base2(point5,point3,point1,point_10,point_5,point_3,point_1,g_point5,g_point3,g_point1,g_point_10,g_point_5,g_point_3,g_point_1);
        while data.win==0
            AI_function(data);
            iswin(data);
            if data.win==0
                AI_function_lord(data);
                iswin(data);
            end
        end
        t=toc;
        temp=[data.win,data.g_point5,data.g_point3,data.g_point1,data.g_point_10,data.g_point_5,data.g_point_3,data.g_point_1,t,data.sum];
        result(iterate,round,1:10)=temp;
        fprintf(fileID,'%d %f %f %f %f %f %f %f %f %3d',temp);
        fprintf(fileID,'\r\n');
    end
    if sum(result(iterate,:,1)==1)>=5
        %说明先手技术高,lord数据改变
        g_point5=data.point5;
        g_point3=data.point3;
        g_point1=data.point1;
        g_point_10=data.point_10;    %好的防御分数
        g_point_5=data.point_5;
        g_point_3=data.point_3;
        g_point_1=data.point_1;
    end
end
fclose(fileID);