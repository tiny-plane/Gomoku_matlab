function mode_callback(data)
if (data.critic_mode==0)
    set(data.hmode,'string','��ҶԵ���');
    set(data.horder,'string','�������','enable','on');
    data.critic_order=1;
    data.critic_mode=1;
elseif (data.critic_mode==1)
    set(data.hmode,'string','���ԶԵ���');
    set(data.horder,'string','����涨�Ⱥ���','enable','off');
    data.critic_mode=2;
else 
    set(data.hmode,'string','��Ҷ����');
    set(data.horder,'string','����涨�Ⱥ���','enable','off');
    data.critic_mode=0;
end
end