clc
clear all


% inData = 'abcdaabbccaaabbbcfaaaabbbccdffeeeaaabbbcccdefabcde';  %�����ı�
inData = 'i am a student i study iot subject in guangzhou university i like the subject and will work hard and do my best to achieve a high score in final examination'
% size(inData)
% double(inData)
% % find(inData==' ')



%%%�ַ�Ƶ��ͳ��
uniqueCharacter=unique(inData);%�����ж��ٸ����ظ����ַ���
for i=1:length(uniqueCharacter)
uniqueCharacter_num(i)=length(strfind(inData,uniqueCharacter(i))); %ͳ���ַ�����Ŀ
uniqueCharacter_p(i) = uniqueCharacter_num(i)/length(inData);%��ͬ�ַ����ֵĸ���
end

%%������������
%���ַ����ֵĸ��ʰ��մӵ͵�������
p = uniqueCharacter_p
[a,b]=sort(p); %��p���ʾ����������
m(1,:) = b;
for i = 1:length(a)
    c(i) = uniqueCharacter(b(i));%�����ַ����е�����
end
q = sort(p); %���¸���˳��
n = length(uniqueCharacter_p);
for i = 2:n
    matrix(i-1,2,:) = c(1);   %��matrix�м�¼����
    matrix(i-1,3,:) = c(2);   %��matrux�м�¼�Һ���
    matrix(i-1,1,:) = double(i-1);                %��matrix�м�¼���ڵ�
    c(2) = double(i-1);%�˴�������ֵ1��Ŀ����Ϊ���Ժ������λ����������󣬲�������
    q(2) = q(1) + q(2);     %���¸��ڵ���ֵ
    q(1) = 1;
    %���µĸ�����Ͻ�������   
    [a,b]=sort(q);
    [a1,b1] = sort(b); 
    m(i,:)=b1; %%��������sort�ż�¼��¼���ʶ�Ӧ��λ��
    temp_c = c;  %�����м����
    temp_q = q;
    for i = 1:length(a1)
         c(i) = temp_c(b(i));%�����ַ����е�����
         q(i) = temp_q(b(i));
         
    end
end



%������������
disp('�����������')
code = uniqueCharacter';
for i = 1:n
    [temp_code,n] = Coding(matrix,uniqueCharacter(i));
    code(i,3:n+2) = temp_code
    len(i) = n;
end

disp('����ѹ��Ч��:')
e = (sum(uniqueCharacter_num)*8)/sum(len.*uniqueCharacter_num)

function [code,n] = Coding(matrix,character)
    [a,b] = size(matrix);
    for i = 1:a
        [row,col] = find(matrix(:,2:3)==character);
        character = matrix(row,1);
        if col == 1
            temp_code(i) = '0';
        else
            temp_code(i) = '1';
        end
        code(i) = temp_code(i);
        if row == a
            break
        end
    end
    %�˿���Ҫ����������ת
    temp_code = code;
    n = length(code);
    for i = 1:n
        code(i) = temp_code(length(code)-i+1) ;
    end
end





