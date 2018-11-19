function restart_prepare(data)
set(data.hinfo,'string','»¶Ó­');
data.critic_start=1;
data.map=zeros(data.n,data.n);
data.sum=0;
axes(data.haxes);
cla;
end