function [label, accuracy, predict_prob] = testing2_ucf101()

label_int = zeros(49, 1);
    
    for i = 1:11
        label_int(i) = 1;
    end
    
    for i = 12:26
        label_int(i) = 2;
    end
    
    for i = 27 : 38
        label_int(i) = 3;
    end
    
    for i = 39: 49
        label_int(i) = 4;
    end
    
   
    label_double = double(label_int);
    data =  create_svm_input_data('C:\Users\Anurag\Documents\MATLAB\Hypo2',49);
    training = sparse(data);
    %training = data;
    
    model = train2(label_int, training, '-c 1');
    %addpath('C:\Users\Anurag\Desktop\libsvm-3.17\windows'); 
    test_label = [1 1 1 2 2 2 2 3 3 3 3 4 4 4 4];
    label_double = double(test_label);
    label_size = size(label_double);
    test_data_path='C:\Users\Anurag\Documents\MATLAB\Test2';
    data = create_svm_input_data(test_data_path,15);
    testing = sparse(data);
    data_size = size(data);
    [label, accuracy, predict_prob] = predict2(label_double', testing, model);
    disp(accuracy);
end