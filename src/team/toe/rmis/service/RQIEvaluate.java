package team.toe.rmis.service;

import team.toe.rmis.service.abstr.Evaluate;

public class RQIEvaluate extends Evaluate {
    @Override
    public String getLevel(double resultingIndex) {
        if(resultingIndex<2.4)
            return "D";
        else if (resultingIndex<3)
            return "C";
        else if(resultingIndex<3.6)
            return "B";
        else
            return "A";
    }

    @Override
    public double getResultingIndex(double index) {
        double RQI=4.98-0.34*index;
        if(RQI<0)
        {
            RQI = 0;
        }
        return RQI;
    }

    @Override
    public String getTableName() {
        return "路面行驶质量评价";
    }

    @Override
    public String getIndexName() {
        return "RQI";
    }

}
