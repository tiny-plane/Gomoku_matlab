function start_callback(data)
if data.critic_restart==0
    data.critic_start=1;
    set(data.hstart,'string','重新开始');
    data.critic_restart=1;
    set(data.horder,'enable','off');
    set(data.hmode,'enable','off');
    if(data.critic_mode==1)&&(data.critic_order==0)   %是人机电脑先下就让电脑下一个子，然后开始等待鼠标点击事件
        AI_function(data);
    end
    if(data.critic_mode==2)     %是电脑对战就循环下直到游戏结束
        while data.win==0
            AI_function(data);
            iswin(data);
        end
    end
elseif data.critic_restart==1
    restart_prepare(data);
end
end