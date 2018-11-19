classdef data_base<handle&hgsetget     %���ݸ��ֲ���
    properties %(Hidden)
        map=0;                         %��������
        nap=0;                         %��չ����
        axes_h=0.902;                  %���̸߶�
        axes_w=0;                      %���̿��
        cut_w=0;                       %���̵����߾���3
        cut_h=0.05;                    %���̵��±߽����
        n=25;                          %���õ�������
        m=1;                           %���̱��ϼ��õ��Ĳ���
        critic_order=1;                %1������֣�0��������
        critic_mode=0;                 %0��Ҷ���ң�1��ҶԵ��ԣ�2���ԶԵ���
        critic_start=0;                %0δ��ʼ��1��ʼ
        critic_undo=0;                 %0���ɳ������Ҳ���ʾ������ť���֣�1���Գ������ҿ��Ե���
        len=0;                         %ʵ�����̵Ŀ��
        markersize=15;                 %���ӵĴ�С
        sum=0;                         %�ܹ���sum��
        err=0;                         %�������  0�޴��� 1�д���
        err_kind=0;                    %��������  0default 1��ʾ���Ӳ��������� 2��ʾ��λ���������� 10��ʾ��������
        loc=0;                         %������귵�ص���������
        win=0;                         %ʤ���ж�
        total=0;                       %�����µ�����
        critic_restart=0;              %���¿�ʼ�Ĳ���,1��ʾ�������¿�ʼ
        %record_mode=0;                 %�Ƿ���н��¼�Ʋ�������ͼ��
    end
    properties %(Hidden)                %����Ͷ������ԣ����
        p;                             %pointer��
        hcall;                         %call_fresh��
        hfigure;                       %������ľ��
        horder;                        %��ťorder�ľ��
        hmode;                         %��ťmode�ľ��
        haxes;                         %���̵ľ��
        hstart;                        %��ʼ��Ϸ�ľ��
        hundo;                         %����һ���ľ��
        hinfo;                         %��Ϣ�ľ��
    end
    properties
        point10=1000;     %��������
        point5=65;
        point3=25;
        point1=10;
        point_10=200;    %��������
        point_5=65;
        point_3=25;
        point_1=10;
    end
    methods
        function data=data_base()        %���캯��
            data.len=data.n+2*data.m-1;
            data.total=data.n*data.n;
            data.map=zeros(data.n,data.n);
            data.nap=zeros(data.n+8,data.n+8);
            build_figure(data);
            data.hcall=call_fresh();     %hcallΪ�¼�ʵ��
            data.p=pointer();            %pΪ�����ʵ��
            build_events(data);          %�����¼�������
        end
    end
end