package team.toe.rmis.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public interface Evaluate {
    void evaluate(int roadId);//对道路进行评价

    ArrayList<LinkedHashMap<String,String>> getEvaluations(int roadId);//获取道路的所有评价信息

    LinkedHashMap<String,String> getEvaluation(int roadId,int date_year);

    String getLevel(double resultingIndex);//获取评价等级

    double getResultingIndex(int roadId);//计算方法

    String getTableName();//表名

    String getIndexName();//评价名
}