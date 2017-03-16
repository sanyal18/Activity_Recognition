function Test_Script1()
counter = 0;
label_int = zeros(49,1);
data = zeros(49,4096);
path = 'C:\Users\Anurag\Documents\MATLAB\Test3';
% Get a list of all files and folders in this folder.
files = dir(path);
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];
% Extract only those that are directories.
subFolders = files(dirFlags);
disp(length(subFolders));
% Print folder names to command window.
disp(subFolders);
for k = 1 : length(subFolders)
    folder_path = strcat(path,'\',subFolders(k).name);
    if strcmp(subFolders(k).name,'.')
        continue;
    end;    
    if strcmp(subFolders(k).name,'..')
         continue; 
    end;   
    temp_counter = counter;
   % disp(folder_path);
    %len = length(dir(folder_path));
   % disp(folder_path);
    feat_files = dir([folder_path, '/*.fc6']);
    temp_data =  SvmDataPrepScript(folder_path,feat_files,length(feat_files)); 
    
    for i = 1 : length(feat_files)  
       temp_counter = temp_counter + 1;
       if(strcmp(subFolders(k).name,'PushUps'))
          label_int(temp_counter) = 1;
       end
       if(strcmp(subFolders(k).name,'Javelin'))
           label_int(temp_counter) = 2;
       end
       if(strcmp(subFolders(k).name,'Piano'))
           label_int(temp_counter) = 3;
       end
       if(strcmp(subFolders(k).name,'VolleyBall'))
           label_int(temp_counter) = 4;
       end   
    end  
    
    for i = 1 : length(feat_files)  
        counter = counter + 1;
        data(counter) = temp_data(i);
    end    
    
end
disp(label_int);
%disp(data);
end
