function check_centre(data)
if data.win~=0
    if data.win==1
        set(data.hinfo,'string','黑子胜！');
        data.critic_start=0;
        set(data.hundo,'enable','off');
    else
        set(data.hinfo,'string','白子胜！');
        data.critic_start=0;
        set(data.hundo,'enable','off');
    end
end
if data.sum==data.total
    set(data.hinfo,'string','和局！');
    data.critic_start=0;
    set(data.hundo,'enable','off');
end
end