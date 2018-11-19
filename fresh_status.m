function fresh_status(data,src,evnt)    %每次点击屏幕都会调用该函数
if data.critic_start==0
    return
end
switch(data.critic_mode)                %模式分类
    case(0)                             %0玩家对玩家
        xy2ij(data);
        iswin(data)
    case(1)                             %1玩家对电脑
        xy2ij(data);
        iswin(data)
        if data.critic_start==1
            AI_function(data);
            iswin(data);
        end
        %     case(2)                             %2电脑对电脑
        %         while(data.sum<=data.total&&data.critic_start==1)
        %             AI_function(data);
        %             iswin(data);
        %         end
end
end