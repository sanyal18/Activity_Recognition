function [label, accuracy, predict_prob] = test_final1()

label_int = zeros(204, 1);
    
    for i = 1:22
        label_int(i) = 1;
    end
    
    for i = 23:52
        label_int(i) = 2;
    end
    
    for i = 53 : 76
        label_int(i) = 3;
    end
    
    for i = 77: 98
        label_int(i) = 4;
    end
    
    for i = 99 : 128
        label_int(i) = 1;
    end
    
    for i = 129 : 150
        label_int(i) = 2;
    end
    
    for i = 151 : 180
        label_int(i) = 3;
    end
    
    for i = 181 : 204 
        label_int(i) = 4;
    end
   disp(size(label_int));
    label_double = double(label_int);
    data =  create_svm_input_data('C:\Users\Anurag\Documents\MATLAB\Hypo2',204);
    training = sparse(data);
    %training = data;
    
    model = train2(label_int, training, '-c 1');
    %disp(model);
    %addpath('C:\Users\Anurag\Desktop\libsvm-3.17\windows'); 
    test_label = zeros(66,1);
    
    for i = 1: 6
        test_label(i) = 1;
    end;
    
     for i = 7: 14
        test_label(i) = 2;
    end;
     for i = 15: 22
        test_label(i) = 3;
    end;
     for i = 23: 30
        test_label(i) = 4;
    end;
     for i = 31: 40
        test_label(i) = 1;
     end;
     
     for i = 41: 48
        test_label(i) = 2;
     end;
    
    for i = 49: 58
        test_label(i) = 3;
    end;
    
    for i = 59: 66
        test_label(i) = 4;
    end;
    %test_label = [1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 1 1 1 1 1 2 2 2 2 3 3 3 3 3 4 4 4 4];
    label_double = double(test_label);
    disp(size(label_double));
    test_data_path='C:\Users\Anurag\Documents\MATLAB\Test2';
    data = create_svm_input_data(test_data_path,66);
    testing = sparse(data);
    data_size = size(data);
   % disp(data);
    [label, accuracy, predict_prob] = predict2(test_label, testing, model);
    disp(accuracy);
    %disp(label);
    c = confusionmat(test_label,label);
    disp(c);
    new_label = zeros(33,1);
 
    j = 1;
    i = 1;
    
    for k = 1:33
        new_label(j) = test_label(i);
        j = j + 1;
        i = i + 2;
    end
    
    prediction = zeros(33,1);
    j = 1;
    i = 1;
    
    for k = 1: 33
        if label(i) == label(i+1)
            prediction(j) = label(i);
            j = j + 1;
            i = i + 2;
        else
            prediction(j) = 7;
            j = j + 1;
            i = i + 2;
        end
    end
    disp('@@@@@@@@@@');
    disp(prediction);
    
    correct = 0;
    
    for i = 1 : 33
        if new_label(i) == prediction(i);
            correct = correct + 1;
        end
    end
    disp(correct/33);
    disp(size(new_label));
    disp(size(prediction));
    c = confusionmat(new_label,prediction);
    disp(c);
    
    
end