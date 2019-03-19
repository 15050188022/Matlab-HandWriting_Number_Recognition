clc
clear
close all
%�ó�����singleNum_feature_extraction.m�Ļ����ϣ�������ȡTrainSet�ļ�����
%�ĸ����������ֵ�ͼƬ���������е�����ͼƬ���������һ���ṹ����������
%������������һ��mat�ļ���������һ��������ȡ
imgDataPath='TrainSet/';
imgDataDir=dir(imgDataPath);
label_num=0;
for i=1:length(imgDataDir)
    if(isequal(imgDataDir(i).name,'.')||... % ȥ��ϵͳ�Դ����������ļ���
       isequal(imgDataDir(i).name,'..')||...
       ~imgDataDir(i).isdir)                % ȥ�������в����ļ��е�
           continue;
    end
    imgDir=dir([imgDataPath imgDataDir(i).name '/*.jpg']);
    single_feature_struct=cell(length(imgDir),1);
    for j=1:length(imgDir)
        imgPath=[imgDataPath imgDataDir(i).name '/' imgDir(j).name];
        single_feature_struct{j,1}=singleNum_feature_extraction(imgPath);
    end
    label_num=label_num+1;
    featureDataStruct(label_num).label=imgDataDir(i).name;
    featureDataStruct(label_num).feature=single_feature_struct;
end
save featureData.mat   featureDataStruct
    
        
        
        
        
    
