function iswin(data)
data.win=0;                               %为0则未能连成五子，为1时黑子胜，为-1时白子胜                                
left=data.loc(2)-4;                       %判断落子是否能使其所在行连成五子
right=data.loc(2);
if  data.loc(2)<5
    left=1;
end
if  data.loc(2)>data.n-4
        right=data.n-4;
end
if  left<=right
    for  j=left:right                    
       lianxu_sum1=data.map(data.loc(1),j)+data.map(data.loc(1),j+1)+data.map(data.loc(1),j+2)...
            +data.map(data.loc(1),j+3)+data.map(data.loc(1),j+4);
        if  lianxu_sum1==5*data.map(data.loc(1),data.loc(2))
            data.win=data.map(data.loc(1),data.loc(2));
            check_centre(data);
            return
        end
    end
else  
    data.win=0;
end
%lianxu_sum2=0;                            %判断落子是否能使其所在列连成五子
up=data.loc(1)-4;
low=data.loc(1);
if  data.loc(1)<5
    up=1;
end
if  data.loc(1)>data.n-4
    low=data.n-4;
end
if  up<=low
   for  i=up:low
 lianxu_sum2=data.map(i,data.loc(2))+data.map(i+1,data.loc(2))+data.map(i+2,data.loc(2))...
            +data.map(i+3,data.loc(2))+data.map(i+4,data.loc(2));
            if  lianxu_sum2==5*data.map(data.loc(1),data.loc(2))
                data.win=data.map(data.loc(1),data.loc(2));
                check_centre(data);
                return
            end
   end
else
    data.win=0;
end
%lianxu_sum3=0;                      %判断落子是否能使其所在左上斜线连成五子
if data.loc(1)<=data.loc(2)
    cha=data.loc(2)-data.loc(1); 
    left_up=data.loc(1)-4;
    right_low=data.loc(1);
    if data.loc(1)<5
       left_up=1;
    end
    if data.loc(2)>data.n-4
        right_low=data.n-4-cha;
    end
    if left_up<=right_low
       for k=left_up:right_low
        lianxu_sum3=data.map(k,k+cha)+data.map(k+1,k+1+cha)+data.map(k+2,k+2+cha)...
                +data.map(k+3,k+3+cha)+data.map(k+4,k+4+cha);
            if  lianxu_sum3==5*data.map(data.loc(1),data.loc(2))
                data.win=data.map(data.loc(1),data.loc(2));
                check_centre(data);
                return
            end
        end
    else
        data.win=0;
    end
else
    cha2=data.loc(1)-data.loc(2); 
    left_up=data.loc(2)-4;
    right_low=data.loc(2);
    if data.loc(2)<5
       left_up=1;
    end  
    if data.loc(1)>data.n-4
        right_low=data.n-4-cha2;
    end
    if left_up<=right_low
       for k=left_up:right_low
         lianxu_sum3=data.map(k+cha2,k)+data.map(k+1+cha2,k+1)+data.map(k+2+cha2,k+2)...
                +data.map(k+3+cha2,k+3)+data.map(k+4+cha2,k+4);
            if  lianxu_sum3==5*data.map(data.loc(1),data.loc(2))
                data.win=data.map(data.loc(1),data.loc(2));
                check_centre(data);
                return
            end
       end
    else
        data.win=0;
    end
end

%lianxu_sum4=0;                     %判断落子是否能使其所在右上斜线连成五子
he=data.loc(1)+data.loc(2);        %坐标下标之和不变
if he<=data.n+1
    right_up=data.loc(1)-4;
    left_low=data.loc(1);
    if data.loc(1)<5
        right_up=1;
    end
    if data.loc(2)<5
        left_low=he-5;
    end
    if right_up<=left_low
       for k=right_up:left_low
        lianxu_sum4=data.map(k,he-k)+data.map(k+1,he-k-1)+data.map(k+2,he-k-2)...
            +data.map(k+3,he-k-3)+data.map(k+4,he-k-4);
        if lianxu_sum4==5*data.map(data.loc(1),data.loc(2))
           data.win=data.map(data.loc(1),data.loc(2));
           check_centre(data);
           return
        end
       end
    else
        data.win=0;
    end
else
    right_up=data.loc(1)-4;
    left_low=data.loc(1);
    if data.loc(2)>data.n-4
        right_up=he-data.n;
    end
    if data.loc(1)>data.n-4
        left_low=data.n-4;
    end
    if right_up<=left_low
      for k=right_up:left_low
        lianxu_sum4=data.map(k,he-k)+data.map(k+1,he-k-1)+data.map(k+2,he-k-2)...
            +data.map(k+3,he-k-3)+data.map(k+4,he-k-4);
        if  lianxu_sum4==5*data.map(data.loc(1),data.loc(2)) 
            data.win=data.map(data.loc(1),data.loc(2));
            check_centre(data);
            return
        end
      end
    else
        data.win=0;
    end
end
end