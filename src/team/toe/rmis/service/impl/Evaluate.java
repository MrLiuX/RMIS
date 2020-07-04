package team.toe.rmis.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public interface Evaluate {
    public void evaluate(int roadId,double index);//对道路进行评价

    public ArrayList<LinkedHashMap<String,String>> getEvaluation(int roadId);//获取道路的所有评价信息

    public String getLevel(double resultingIndex);//获取评价等级

    public double getResultingIndex(double index);//计算方法

    public String getTableName();//表名

    public String getIndexName();//评价名
}