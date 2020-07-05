package team.toe.rmis.service;

import team.toe.rmis.service.abstr.Evaluate;

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
//        double PCI;
//        double n=4;
//        double m;
//        if(PCI<0)
//            PCI=0;
        return 0;
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
