package team.toe.rmis.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

public class DamageNotice {
    public void damageNotice(LinkedHashMap<String,String> notice)
    {
        Date date = new Date();
        SimpleDateFormat spDate = new SimpleDateFormat("yyyy-MM-dd");
        notice.put("日期",spDate.format(date));
        team.toe.rmis.dao.DamageNotice.damageNotice(notice);
    }

    public ArrayList<LinkedHashMap<String,String>> getNotice()
    {
        return team.toe.rmis.dao.DamageNotice.getNotice();
    }
}
