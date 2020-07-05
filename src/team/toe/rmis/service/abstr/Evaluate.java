package team.toe.rmis.service.abstr;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

public abstract class Evaluate implements team.toe.rmis.service.impl.Evaluate {
    @Override
    public void evaluate(int roadId) {
        Date date = new Date();
        SimpleDateFormat spDate = new SimpleDateFormat("yyyy");
        team.toe.rmis.dao.Evaluate.evaluate(
                roadId, Integer.parseInt(spDate.format(date)),
                getResultingIndex(roadId), getLevel(getResultingIndex(roadId)), getTableName(), getIndexName());
    }

    @Override
    public ArrayList<LinkedHashMap<String, String>> getEvaluations(int roadId) {
        return team.toe.rmis.dao.Evaluate.getEvaluations(roadId,getTableName(),getIndexName());
    }

    @Override
    public LinkedHashMap<String, String> getEvaluation(int roadId, int date_year) {
        return team.toe.rmis.dao.Evaluate.getEvaluation(roadId,getTableName(),getIndexName(),date_year);
    }
}
