    %% clasificare KNN cu fitcknn
    cp = classperf(cellArray);
    % Perform the classification using the k-nearest neighbor classifier. 
    % Cross-validate the model 10 times. After each cross-validation run, update the classifier performance object with the results.
for i = 1:10
        test = (indici== i); train= ~test;
        mdl = fitcknn(data(train,:),cellArray(train),'NumNeighbors',5);
        predictions = predict(mdl,data(test,:));
        classperf(cp,predictions,test);
        KNN_rata_clasificare_nou(i)=cp.CorrectRate;
        KNN_sensitivitate_nou(i)=cp.Sensitivity;
        KNN_specificitate_nou(i)=cp.Specificity;
        
    %end
end
KNN_medie_rata_clasificare_test=round(mean(KNN_rata_clasificare_nou(:,:),2)*100,2);
KNN_medie_sensitivitate=round(mean(KNN_sensitivitate_nou(:,:),2)*100,2);
KNN_medie_specificitate=round(mean(KNN_specificitate_nou(:,:),2)*100,2);
