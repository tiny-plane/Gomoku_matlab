function order_callback(data)
if(data.critic_mode==1)
if(data.critic_order==1)
    set(data.horder,'string','电脑先手');
    data.critic_order=0;
else
    set(data.horder,'string','玩家先手');
    data.critic_order=1;
end
end
end