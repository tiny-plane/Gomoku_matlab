function AI_function(data)
if data.sum==0            %第一个子比较特殊，需要单独判断，对性能影响不大
    t=round(data.n/2);
    data.map(t,t)=1;
    data.loc=[t,t];
    data.nap(t+4,t+4)=1;
    data.sum=1;
    return
end
%data.nap向四周扩展了四个空白的区域，防止搜索的时候数组越界，这种方法可以节省判断语句
%总棋盘--->白棋盘（1）玩家  黑棋盘（-1)电脑

P=zeros(data.n+8,data.n+8);              %总评分数组
P1=P;                                    %防御评分数组
P2=P;                                    %进攻评分数组
%判断下一个子谁下
temp=-2*mod(data.sum,2)+1;
%%
for i=5:data.n+4
    for j=5:data.n+4
        if  data.nap(i,j)~=0
            continue          %对棋盘剩余的位置进行枚举
        else
            HE=zeros(1,9);
            HE(1,1)=data.nap(i-4,j);
            HE(1,2)=data.nap(i-3,j);
            HE(1,3)=data.nap(i-2,j);
            HE(1,4)=data.nap(i-1,j);
            HE(1,5)=data.nap(i,j);
            HE(1,6)=data.nap(i+1,j);
            HE(1,7)=data.nap(i+2,j);
            HE(1,8)=data.nap(i+3,j);
            HE(1,9)=data.nap(i+4,j);
            ZO=zeros(1,9);
            ZO(1,1)=data.nap(i,j-4);
            ZO(1,2)=data.nap(i,j-3);
            ZO(1,3)=data.nap(i,j-2);
            ZO(1,4)=data.nap(i,j-1);
            ZO(1,5)=data.nap(i,j);
            ZO(1,6)=data.nap(i,j+1);
            ZO(1,7)=data.nap(i,j+2);
            ZO(1,8)=data.nap(i,j+3);
            ZO(1,9)=data.nap(i,j+4);
            XIL=zeros(1,9);
            XIL(1,1)=data.nap(i-4,j-4);
            XIL(1,2)=data.nap(i-3,j-3);
            XIL(1,3)=data.nap(i-2,j-2);
            XIL(1,4)=data.nap(i-1,j-1);
            XIL(1,5)=data.nap(i,j);
            XIL(1,6)=data.nap(i+1,j+1);
            XIL(1,7)=data.nap(i+2,j+2);
            XIL(1,8)=data.nap(i+3,j+3);
            XIL(1,9)=data.nap(i+4,j+4);
            XIR=zeros(1,9);
            XIR(1,1)=data.nap(i-4,j+4);
            XIR(1,2)=data.nap(i-3,j+3);
            XIR(1,3)=data.nap(i-2,j+2);
            XIR(1,4)=data.nap(i-1,j+1);
            XIR(1,5)=data.nap(i,j);
            XIR(1,6)=data.nap(i+1,j-1);
            XIR(1,7)=data.nap(i+2,j-2);
            XIR(1,8)=data.nap(i+3,j-3);
            XIR(1,9)=data.nap(i+4,j-4);
            %对方情况
            M1=[-temp,-temp,-temp,-temp,0];
            M2=[-temp,-temp,-temp,0,-temp];
            M3=[-temp,-temp,0,-temp,-temp];
            M4=[-temp,0,-temp,-temp,-temp];
            M5=[0,-temp,-temp,-temp,-temp];
            M6=[-temp,-temp,-temp,0];
            M7=[-temp,-temp,0,-temp];
            M8=[-temp,0,-temp,-temp];
            M9=[0,-temp,-temp,-temp];
            M10=[-temp,-temp,0];
            M11=[-temp,0,-temp];
            M12=[0,-temp,-temp];
            M13=[-temp,0];
            M14=[0,-temp];
            %对方情况，考虑防守
            if all(HE(1,1:5)==M1) || all(HE(1,2:6)==M2) || all(HE(1,3:7)==M3) || all(HE(1,4:8)==M4) || all(HE(1,5:9)==M5)
                P1(i,j)=P1(i,j)+data.point_10;
            elseif all(HE(1,2:5)==M6) || all(HE(1,3:6)==M7) || all(HE(1,4:7)==M8) || all(HE(1,5:8)==M9)
                P1(i,j)=P1(i,j)+data.point_5;
            elseif all(HE(1,3:5)==M10) ||  all(HE(1,4:6)==M11) || all(HE(1,5:7)==M12)
                P1(i,j)=P1(i,j)+data.point_3;
            elseif all(HE(1,4:5)==M13) || all(HE(1,5:6)==M14)
                P1(i,j)=P1(i,j)+data.point_1;                               %纵
            end
            if all(ZO(1,1:5)==M1) || all(ZO(1,2:6)==M2)|| all(ZO(1,3:7)==M3) || all(ZO(1,4:8)==M4)|| all(ZO(1,5:9)==M5)
                P1(i,j)=P1(i,j)+data.point_10;
            elseif all(ZO(1,2:5)==M6) || all(ZO(1,3:6)==M7) || all(ZO(1,4:7)==M8) || all(ZO(1,5:8)==M9)
                P1(i,j)=P1(i,j)+data.point_5;
            elseif all(ZO(1,3:5)==M10)|| all(ZO(1,4:6)==M11)|| all(ZO(1,5:7)==M12)
                P1(i,j)=P1(i,j)+data.point_3;
            elseif all(ZO(1,4:5)==M13)  || all(ZO(1,5:6)==M14)
                P1(i,j)=P1(i,j)+data.point_1;                             %恒
            end
            if all(XIL(1,1:5)==M1) || all(XIL(1,2:6)==M2)|| all(XIL(1,3:7)==M3) || all(XIL(1,4:8)==M4)|| all(XIL(1,5:9)==M5)
                P1(i,j)=P1(i,j)+data.point_10;
            elseif all(XIL(1,2:5)==M6) || all(XIL(1,3:6)==M7) || all(XIL(1,4:7)==M8) || all(XIL(1,5:8)==M9)
                P1(i,j)=P1(i,j)+data.point_5;
            elseif all(XIL(1,3:5)==M10)|| all(XIL(1,4:6)==M11)|| all(XIL(1,5:7)==M12)
                P1(i,j)=P1(i,j)+data.point_3;
            elseif all(XIL(1,4:5)==M13)  || all(XIL(1,5:6)==M14)
                P1(i,j)=P1(i,j)+data.point_1;                 %左斜
            end
            if all(XIR(1,1:5)==M1) || all(XIR(1,2:6)==M2)|| all(XIR(1,3:7)==M3) || all(XIR(1,4:8)==M4)|| all(XIR(1,5:9)==M5)
                P1(i,j)=P1(i,j)+data.point_10;
            elseif all(XIR(1,2:5)==M6) || all(XIR(1,3:6)==M7) || all(XIR(1,4:7)==M8) || all(XIR(1,5:8)==M9)
                P1(i,j)=P1(i,j)+data.point_5;
            elseif all(XIR(1,3:5)==M10)|| all(XIR(1,4:6)==M11)|| all(XIR(1,5:7)==M12)
                P1(i,j)=P1(i,j)+data.point_3;
            elseif all(XIR(1,4:5)==M13)  || all(XIR(1,5:6)==M14)
                P1(i,j)=P1(i,j)+data.point_1;                 %右斜
            end
            
            %己方情况，考虑进攻
            
            if all(HE(1,1:5)==-M1) || all(HE(1,2:6)==-M2) || all(HE(1,3:7)==-M3) || all(HE(1,4:8)==-M4) || all(HE(1,5:9)==-M5)
                P2(i,j)=P2(i,j)+data.point10;
            elseif all(HE(1,2:5)==-M6) || all(HE(1,3:6)==-M7) || all(HE(1,4:7)==-M8) || all(HE(1,5:8)==-M9)
                P2(i,j)=P2(i,j)+data.point5;
            elseif all(HE(1,3:5)==-M10) ||  all(HE(1,4:6)==-M11) || all(HE(1,5:7)==-M12)
                P2(i,j)=P2(i,j)+data.point3;
            elseif all(HE(1,4:5)==-M13) || all(HE(1,5:6)==-M14)
                P2(i,j)=P2(i,j)+data.point1;%纵
            end
            if all(ZO(1,1:5)==-M1) || all(ZO(1,2:6)==-M2)|| all(ZO(1,3:7)==-M3) || all(ZO(1,4:8)==-M4)|| all(ZO(1,5:9)==-M5)
                P2(i,j)=P2(i,j)+data.point10;
            elseif all(ZO(1,2:5)==-M6) || all(ZO(1,3:6)==-M7) || all(ZO(1,4:7)==-M8) || all(ZO(1,5:8)==-M9)
                P2(i,j)=P2(i,j)+data.point5;
            elseif all(ZO(1,3:5)==-M10)|| all(ZO(1,4:6)==-M11)|| all(ZO(1,5:7)==-M12)
                P2(i,j)=P2(i,j)+data.point3;
            elseif all(ZO(1,4:5)==-M13)  || all(ZO(1,5:6)==-M14)
                P2(i,j)=P2(i,j)+data.point1;%恒
            end
            if all(XIL(1,1:5)==-M1) || all(XIL(1,2:6)==-M2)|| all(XIL(1,3:7)==-M3) || all(XIL(1,4:8)==-M4)|| all(XIL(1,5:9)==-M5)
                P2(i,j)=P2(i,j)+data.point10;
            elseif all(XIL(1,2:5)==-M6) || all(XIL(1,3:6)==-M7) || all(XIL(1,4:7)==-M8) || all(XIL(1,5:8)==-M9)
                P2(i,j)=P2(i,j)+data.point5;
            elseif all(XIL(1,3:5)==-M10)|| all(XIL(1,4:6)==-M11)|| all(XIL(1,5:7)==-M12)
                P2(i,j)=P2(i,j)+data.point3;
            elseif all(XIL(1,4:5)==-M13)  || all(XIL(1,5:6)==-M14)
                P2(i,j)=P2(i,j)+data.point_1;                 %左斜
                if all(XIR(1,1:5)==-M1) || all(XIR(1,2:6)==-M2)|| all(XIR(1,3:7)==-M3) || all(XIR(1,4:8)==-M4)|| all(XIR(1,5:9)==-M5)
                    P2(i,j)=P2(i,j)+data.point10;
                elseif all(XIR(1,2:5)==-M6) || all(XIR(1,3:6)==-M7) || all(XIR(1,4:7)==-M8) || all(XIR(1,5:8)==-M9)
                    P2(i,j)=P2(i,j)+data.point5;
                elseif all(XIR(1,3:5)==-M10)|| all(XIR(1,4:6)==-M11)|| all(XIR(1,5:7)==-M12)
                    P2(i,j)=P2(i,j)+data.point3;
                elseif all(XIR(1,4:5)==-M13)  || all(XIR(1,5:6)==-M14)
                    P2(i,j)=P2(i,j)+data.point_1;                 %右斜
                end
            end
        end
    end
end
P=P1+P2;           %对于坐标（i，j）的总评分
[p,q]=find(P==max(max(P)));
p=p-4;
q=q-4;
ran=randperm(length(p),1); %从Y中任取一个坐标
if isnan(ran)
   data.win=inf;
   return
end
data.map(p(ran),q(ran))=temp;
data.nap(p(ran)+4,q(ran)+4)=temp;
data.sum=data.sum+1;
data.loc(1)=p(ran);
data.loc(2)=q(ran);

end