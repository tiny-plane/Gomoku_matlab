function start_callback(data)
if data.critic_restart==0
    data.critic_start=1;
    set(data.hstart,'string','���¿�ʼ');
    data.critic_restart=1;
    set(data.horder,'enable','off');
    set(data.hmode,'enable','off');
    if(data.critic_mode==1)&&(data.critic_order==0)   %���˻��������¾��õ�����һ���ӣ�Ȼ��ʼ�ȴ�������¼�
        AI_function(data);
    end
    if(data.critic_mode==2)     %�ǵ��Զ�ս��ѭ����ֱ����Ϸ����
        while data.win==0
            AI_function(data);
            iswin(data);
        end
    end
elseif data.critic_restart==1
    restart_prepare(data);
end
end