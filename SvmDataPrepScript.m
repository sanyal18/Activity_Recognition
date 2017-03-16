% create_svm_input_data.m

function[data_matrix] = create_data1(dir_str,feat_files,num_train_video)
% read the c3d feature(fc6) for each video, construct libsvm format data.

    dim_feat = 4096;
    % dir_list = importdata(output_list_train);
    %num_train_video = 63;
   % dir_str = 'C:\Users\Anurag\Documents\MATLAB\scripted';
    data_matrix = zeros(num_train_video, dim_feat);
    % feat_files = dir([dir_str, '/*.fc6']);
 %   prompt = 'What is the original value1? ';
%    x = input(prompt);

    for i = 1 : num_train_video
        feat_path = strcat(dir_str,'/',feat_files(i).name);
        % prompt = 'What is the original value2? ';
         %x = input(prompt);

        % feat_path = strcat(char(dir_list(i)), '/c3d.fc6');
        fid = fopen(feat_path, 'r');
        data = fread(fid, 'double');
        fclose(fid);
        % prompt = 'What is the original value3? ';
        % x = input(prompt);
        normed_data = data / norm(data);
        data_matrix(i, :) = normed_data;
    end
     disp(size(data_matrix));
  %   prompt = 'What is the original value4? ';
   % x = input(prompt);
end   
    