function label=bayesClassifierBulid(img)
%�����Ѿ�����õ�ѵ����������������
load featureData.mat;
test_feature=singleNum_feature_extraction(img);%��ò���ͼƬ����������

%�����������
prior=[];%�洢������ʵľ���
sum=0;
for i=1:size(featureDataStruct,2)
    sum=sum+size(featureDataStruct(i).feature,1);
end
for i=1:size(featureDataStruct,2)
    prior(i)=size(featureDataStruct(i).feature,1)/sum;
end
%��������������
likelihood = [];%����������
pij=[];%i���������j������Ϊ1�ĸ���
for i=1:size(featureDataStruct,2)%����������
    for j=1:100%ÿ������ͼƬ��ȡ������������
        sum=0;
        
        for k=1:size(featureDataStruct(i).feature,1)%ÿ�������ѵ�������ĸ���
            i_feature=featureDataStruct(i).feature(k);
            sum=sum+i_feature{1}(1,j);
        end
        pij(i,j)=(sum+1)/(size(featureDataStruct(i).feature,1)+2);%������ʹ���ֵ��Pj(��i)��ע��������˹ƽ������
    end
end
for i=1:size(featureDataStruct,2)%����������
    multi=1;
    for j=1:100%ÿ������ͼƬ��ȡ������������
        if(test_feature(j)==1)
            multi=multi*pij(i,j);
        else
            multi=multi*(1-pij(i,j));
        end
    end
    likelihood(i)=multi;
end
%����������
p_class=[];%�������
sum=0;
for i=1:size(featureDataStruct,2)%����������
    sum=sum+prior(i)*likelihood(i);
end
for i=1:size(featureDataStruct,2)%����������
    p_class(i)=prior(i)*likelihood(i)/sum;
end
[maxval,maxpos]=max(p_class);
label=maxpos-1;

    
    
        
        


        
        
        
        
    

    

