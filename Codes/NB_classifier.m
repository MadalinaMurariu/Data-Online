 %%Bayes Model classifier
    
    Bayes_Model = fitcnb(data(train,:),cellArray(train), 'Distribution','kernel');
    [Bayes_Predicted] = predict(Bayes_Model,data(train,:));
    [conf, classorder] = confusionmat(cellArray(train),Bayes_Predicted);
    metrics_accuracy_score=round(mean(conf)*100);
    NB_rata_clasificare_nou(i)=cp.CorrectRate;
    NB_sensitivitate_nou(i)=cp.Sensitivity;
    NB_specificitate_nou(i)=cp.Specificity;
    NB_medie_rata_clasificare_test=round(mean(NB_rata_clasificare_nou(:,:),2)*100,2);
	NB_medie_sensitivitate=round(mean(NB_sensitivitate_nou(:,:),2)*100,2);
	NB_medie_specificitate=round(mean(NB_specificitate_nou(:,:),2)*100,2);