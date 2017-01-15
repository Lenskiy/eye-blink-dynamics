% clear all
% close all
% clc

%% reading from txt files
listing=dir('*.TXT');
number_of_files = length(listing);

x=3*ceil(number_of_files/3);
y=3;
data=zeros(x,y);

for i=1:number_of_files 
   file = strsplit(listing(i).name,'.');
   name = strsplit(file{1},'-')
   num = str2num(name{1}); 
   
   patient_id = ceil(num/3)
   patient_name =  name{2}
   patient_session_id = name{3}
   patient_session_name = name{4}
   
   patient(patient_id).name = patient_name %#ok<*PFPIE>
    if(strcmp(patient_session_name,'MATH'))
        patient(patient_id).math = loadeeg(listing(i).name, [22 23]);
    end
    if(strcmp(patient_session_name,'VERBAL'))
        patient(patient_id).verbal = loadeeg(listing(i).name, [22 23]);
    end
    if(strcmp(patient_session_name,'WRITE'))
        patient(patient_id).write = loadeeg(listing(i).name, [22 23]);
    end
end
save patients.mat patient
%% clearing here


%% adjusting to fractal script here
clear all;
clc;
load PLOSpatients.mat 
session_raw = cell(1,3);
num = numel(patient);
len = 10000;
verbal=zeros(num, len);
math=zeros(num, len);
write=zeros(num, len);
for i=1:10%num
    verbal(i,:) = patient(i).verbal(1:len,1)';
    math(i,:) = patient(i).math(1:len,1)';
    write(i,:) = patient(i).write(1:len,1)';
end

session_raw{1}=verbal;
session_raw{2}=math;
session_raw{3}=write;
save PLOSsession_raw.mat session_raw
