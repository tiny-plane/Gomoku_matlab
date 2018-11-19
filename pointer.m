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
            p.location=get(0,'PointerLocation');    %ȡ���λ��
            p.currentwindowhandle=gcf;              %ȡ��ǰ���ھ��
            p.windowposition=get(p.currentwindowhandle,'position');  %
            %�����������λ�ðٷֱ�
            p.position(1)=(p.location(1)-p.windowposition(1))/p.windowposition(3);
            p.position(2)=(p.location(2)-p.windowposition(2))/p.windowposition(4);
        end
     end
    methods %��Ӧrefresh�¼��������������
        function fresh_location(p,data)
            data.p.cac_position;            
        end
    end 
end