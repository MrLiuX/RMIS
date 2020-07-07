package team.toe.rmis.service;

import team.toe.rmis.service.abstr.Evaluate;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

public class PCIEvaluate extends Evaluate {
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
        double PCI;
        double n=4;
        double m;
        double u=0.33;
        double w=3*u*u*u-5.5*u*u+3.5*u;
        PCI=100-team.toe.rmis.dao.Evaluate.getPCI(roadId,Integer.parseInt(spDate.format(date)))*w;
        if(PCI<0)
            PCI=0;
        return PCI;
    }

    @Override
    public String getTableName() {
        return "路面损坏状况评价";
    }

    @Override
    public String getIndexName() {
        return "PCI";
    }

}
