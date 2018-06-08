clear; % ���� �ʱ�ȭ
clc; % ȭ�� ���

predict_No = []; % ������� �ʱ�ȭ
threshold = 560; % correlation���� threshold(����Ѱ���)����

file_name=uigetfile('*.jpg','Open File');
input_image=sum(imread(file_name),3); % �ڵ��� ��ȣ�� �̹����� �о��
input_image=sign(round(input_image/765)-0.5); % correlation�� �ִ밪�� ã�� ����
                                              % �ڵ��� ��ȣ�� �̹����� data�� ���ȭ(1�� -1�θ� ����)
load candy.mat; % �񱳴�� �̹����� mat������ �ҷ���

candy=sign(round(candy/765)-0.5); % correlation�� �ִ밪�� ã�� ����
                                  % �񱳴�� �̹����� data�� ���ȭ(1��-1�θ� ����)
[input_row_size input_column_size]=size(input_image); % �Է¹��� �ڵ��� ��ȣ�� �̹����� ��� ũ�⸦ ����
[candy_row_size candy_column_size,number]=size(candy); % �񱳴�� �̹����� ��� ũ�⸦ ����


for k=1:number
    for n=1:input_row_size - candy_row_size + 1 % �Է¹��� �ڵ��� ��ȣ�� �̹����� �񱳴�� �̹����� correlation�� �࿡ ���� �ݺ���
        for m=1:input_column_size - candy_column_size + 1 % �Է¹��� �ڵ��� ��ȣ�� �̹����� �񱳴�� �̹����� correlation�� ���� ���� �ݺ���
            correlation=sum(sum(candy(:,:,k).*input_image(n:n+candy_row_size-1,m:m+candy_column_size-1))); % �ڵ�����ȣ���� ��ȣ�� �񱳴�� �̹������� correlation
            if correlation > threshold % correlation���� �ִ밪�� threshold������ Ŭ ���
                predict_No=[predict_No [mod(k,10); m]]; % �ĺ��� ���ڸ� ������� ���Ϳ� ����
            end
        end
    end
end

if(length(predict_No)==4) % �ڵ��� ��ȣ�� �̹����κ��� �ĺ��� ��ȣ�� ������ 4�� ��쿡�� ��ȣ�� ��� 
    [column Position]=sort(predict_No(2,:),2); % �� �ĺ��� ��ȣ�� ������� ��ġ
    No=predict_No(1,Position(1))*1000+predict_No(1,Position(2))*100+predict_No(1,Position(3))*10+predict_No(1,Position(4)) % ��ġ�� ��ȣ�� �ڸ����� �°� ����ϱ����� 
else                                                                                                                       % ���ڸ��� �°� �ڸ����� ����  
    fprintf('error!\n'); % �ڵ��� ��ȣ�� �̹����κ��� �ĺ��� ��ȣ�� ������ 4���� �ƴ� ��� error�� ���
end