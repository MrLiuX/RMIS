package team.toe.rmis.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class DamageInspect {
    public static void inspect(LinkedHashMap<String,String> inspection,
                               ArrayList<LinkedHashMap<String,String>> damage) throws SQLException
            //执行检测操作
    {
        team.toe.rmis.dao.DamageInspect.inspect(inspection,damage);
    }
}
