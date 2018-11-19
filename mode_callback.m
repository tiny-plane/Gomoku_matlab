function mode_callback(data)
if (data.critic_mode==0)
    set(data.hmode,'string','玩家对电脑');
    set(data.horder,'string','玩家先手','enable','on');
    data.critic_order=1;
    data.critic_mode=1;
elseif (data.critic_mode==1)
    set(data.hmode,'string','电脑对电脑');
    set(data.horder,'string','不需规定先后手','enable','off');
    data.critic_mode=2;
else 
    set(data.hmode,'string','玩家对玩家');
    set(data.horder,'string','不需规定先后手','enable','off');
    data.critic_mode=0;
end
end