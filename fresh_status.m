function fresh_status(data,src,evnt)    %ÿ�ε����Ļ������øú���
if data.critic_start==0
    return
end
switch(data.critic_mode)                %ģʽ����
    case(0)                             %0��Ҷ����
        xy2ij(data);
        iswin(data)
    case(1)                             %1��ҶԵ���
        xy2ij(data);
        iswin(data)
        if data.critic_start==1
            AI_function(data);
            iswin(data);
        end
        %     case(2)                             %2���ԶԵ���
        %         while(data.sum<=data.total&&data.critic_start==1)
        %             AI_function(data);
        %             iswin(data);
        %         end
end
end