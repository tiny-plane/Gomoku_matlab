function build_events(data)        %�����¼������ڣ����޸�
data.sum=length(find(data.map));
set(data.hfigure,'WindowButtonDownFcn','notify(data.hcall,''fresh_click'')');        %�������㲥fresh_click�¼�
addlistener(data.hcall,'fresh_click',@(src,evnt)fresh_status(data,src,evnt));        %���������Ӧ����ע��Ϊfresh_click������
end