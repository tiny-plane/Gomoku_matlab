function order_callback(data)
if(data.critic_mode==1)
if(data.critic_order==1)
    set(data.horder,'string','��������');
    data.critic_order=0;
else
    set(data.horder,'string','�������');
    data.critic_order=1;
end
end
end