%����ͳ��sigma���ŵ�������Ӱ��
%����ά�Ȳ���
Nu=32;
Na=8;
Nb=8;
Nrf1=4;
Nrf2=4;

%L��·����
L=15; 
%��������
sigmavector=logspace(0,-2.5,6); 
%����p
p=1;
Pmax=1000;
Ni=50;

H1_cell=cell(Ni,6);
H2_cell=cell(Ni,6);
H3_cell=cell(Ni,6);
downlinkrate=zeros(Ni,6);
uplinkrate=zeros(Ni,6);
d2dlinkrate=zeros(Ni,6);
CMdownlinkrate=zeros(Ni,6);
CMuplinkrate=zeros(Ni,6);
CMd2dlinkrate=zeros(Ni,6);
%���������ŵ����������

counter=1;
for sigma=sigmavector
    sigma^2
%     if Nu==40
%         start_point=30;
%     else
%         start_point=1;
%     end
    for i=1:Ni
        %�����ŵ�
        
H1=generateH(Nu,Na,L);
H2=generateH(Nb,Nu,L);
H3=generateH(Nb,Na,L);
H1_cell{i,counter}=H1;
H2_cell{i,counter}=H2;
H3_cell{i,counter}=H3;

[uplinkrate(i,counter),CMuplinkrate(i,counter)]=pcccp_uplink(Nu,Na,Nrf1,H1,sigma);
[downlinkrate(i,counter),CMdownlinkrate(i,counter)]=pcccp_downlink(Nu,Nb,Nrf2,H2,Pmax,sigma);
[d2dlinkrate(i,counter),CMd2dlinkrate(i,counter)]=D2Dlink(Na,Nb,H3,sigma);
    end
    counter=counter+1;
end