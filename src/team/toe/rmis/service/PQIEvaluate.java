package team.toe.rmis.service;

import team.toe.rmis.service.abstr.Evaluate;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

public class PQIEvaluate extends Evaluate {
    @Override
    public String getLevel(double resultingIndex) {
        if(resultingIndex<60)
            return "D";
        else if (resultingIndex<70)
            return "C";
        else if(resultingIndex<85)
            return "B";
        else
            return "A";
    }

    @Override
    public double getResultingIndex(int roadId) {
        Date date = new Date();
        SimpleDateFormat spDate = new SimpleDateFormat("yyyy");
        RQIEvaluate RQIEvaluation=new RQIEvaluate();
        PCIEvaluate PCIEvaluation=new PCIEvaluate();
        return  20*0.6* team.toe.rmis.dao.Evaluate.getRQIAndPCI(roadId,Integer.parseInt(spDate.format(date))).get("RQI")
                +team.toe.rmis.dao.Evaluate.getRQIAndPCI(roadId,Integer.parseInt(spDate.format(date))).get("PCI")*0.4;
    }

    @Override
    public String getTableName() {
        return "道路综合评价表";
    }

    @Override
    public String getIndexName() {
        return "PQI";
    }
}
