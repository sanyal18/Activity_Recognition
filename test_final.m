function [label, accuracy, predict_prob] = test_final()

label_int = zeros(101, 1);
    
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
    
    for i = 50 : 64
        label_int(i) = 1;
    end
    
    for i = 65 :75
        label_int(i) = 2;
    end
    
    for i = 76:89
        label_int(i) = 3;
    end
    
    for i = 90:101
        label_int(i) = 4;
    end
   disp(size(label_int));
    label_double = double(label_int);
    data =  create_svm_input_data('C:\Users\Anurag\Documents\MATLAB\folder',101);
    training = sparse(data);
    %training = data;
    
    model = train2(label_int, training, '-c 1');
    %disp(model);
    %addpath('C:\Users\Anurag\Desktop\libsvm-3.17\windows'); 
    tested = zeros(33,1);
    for i = 1 : 3
        tested(i) = 1;
    end
    for i = 4 : 7
        tested(i) = 2;
    end
    for i = 8:11
        tested(i) = 3;
    end
    for i = 12:15
        tested(i) = 4;
    end
    
    for i = 16:20
        tested(i) = 1;
    end
    
    for i = 21:24
        tested(i) = 2;
    end
    
    for i = 25:29
        tested(i) = 3;
    end
    
    for i = 30:33
        tested(i) = 4;
    end
    
    test_label = [1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 1 1 1 1 1 2 2 2 2 3 3 3 3 3 4 4 4 4];
    label_double = double(test_label);
    disp(size(label_double));
    test_data_path='C:\Users\Anurag\Documents\MATLAB\TestNew';
    data = create_svm_input_data(test_data_path,33);
    testing = sparse(data);
    data_size = size(data);
   % disp(data);
    [label, accuracy, predict_prob] = predict2(test_label', testing, model);
    disp(accuracy);
    %disp(label);
end