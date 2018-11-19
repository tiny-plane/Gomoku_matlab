function build_events(data)        %设立事件和听众，勿修改
data.sum=length(find(data.map));
set(data.hfigure,'WindowButtonDownFcn','notify(data.hcall,''fresh_click'')');        %按下鼠标广播fresh_click事件
addlistener(data.hcall,'fresh_click',@(src,evnt)fresh_status(data,src,evnt));        %将鼠标点击响应函数注册为fresh_click的听众
end