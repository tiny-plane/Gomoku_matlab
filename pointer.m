classdef pointer<handle&hgsetget
    properties
        location=[0,0];
        status=0;
        windowposition=[0,0,0,0];
        position=[0,0];
        click_position=[0,0];
        axes_position=[];
    end
    properties  (Access=private)
        currentwindowhandle=0;
    end
    methods
        function obj=pointer()
            obj.location=get(0,'PointerLocation');
            obj.currentwindowhandle=gcf;
            obj.windowposition=get(obj.currentwindowhandle,'position');
            obj.axes_position=get(gca,'position');
        end
        function cac_position(p)
            p.location=get(0,'PointerLocation');    %取鼠标位置
            p.currentwindowhandle=gcf;              %取当前窗口句柄
            p.windowposition=get(p.currentwindowhandle,'position');  %
            %计算鼠标所在位置百分比
            p.position(1)=(p.location(1)-p.windowposition(1))/p.windowposition(3);
            p.position(2)=(p.location(2)-p.windowposition(2))/p.windowposition(4);
        end
     end
    methods %响应refresh事件，更新鼠标坐标
        function fresh_location(p,data)
            data.p.cac_position;            
        end
    end 
end