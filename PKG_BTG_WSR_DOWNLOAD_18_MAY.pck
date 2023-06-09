create or replace package PKG_BTG_WSR_DOWNLOAD is

  PROCEDURE SP_WSR_TOP_PANEL(I_EMP_ID      IN NUMBER,
                             I_CORP_ID     IN NUMBER,
                             I_BU_ID       IN NUMBER,
                             I_ISU_ID      IN NUMBER,
                             I_CLUS_ID     IN NUMBER,
                             I_ACC_ID      IN NUMBER,
                             I_GC_ID       IN NUMBER,
                             O_CUR_CORP    OUT SYS_REFCURSOR,
                             O_CUR_BG      OUT SYS_REFCURSOR,
                             O_CUR_ISU     OUT SYS_REFCURSOR,
                             O_CUR_CLUS    OUT SYS_REFCURSOR,
                             O_CUR_ACCOUNT OUT SYS_REFCURSOR,
                             O_CUR_GC      OUT SYS_REFCURSOR,
                             O_UPLOAD_FLAG OUT VARCHAR2,
                             O_WEEK        OUT VARCHAR2,
                             O_DATE        OUT VARCHAR2);

  PROCEDURE SP_WSR_REFERENCE_SHEET(I_EMP_ID      IN NUMBER,
                                   I_CORP_ID     IN NUMBER,
                                   I_BG_ID       IN VARCHAR2,
                                   I_ISU_ID      IN VARCHAR2,
                                   I_CLUS_ID     IN VARCHAR2,
                                   I_ACC_ID      IN VARCHAR2,
                                   I_FILE_DATE   IN VARCHAR2, ---==//File Date
                                   I_REPORT_NAME IN VARCHAR2, --===//Report Name
                                   I_SHEET_NAME  IN VARCHAR2, --== // Sheet Name
                                   I_OTHERS      IN VARCHAR2, --== // extra input
                                   O_CUR_OU      OUT SYS_REFCURSOR,
                                   O_CUR_ACC     OUT SYS_REFCURSOR,
                                   O_CUR_P_GRP   OUT SYS_REFCURSOR,
                                   O_CUR_ROLE    OUT SYS_REFCURSOR,
                                   O_CUR_STAGE   OUT SYS_REFCURSOR,
                                   O_CUR_TYPE    OUT SYS_REFCURSOR);


PROCEDURE SP_WKLY_GRID_BTG(I_LOGGED_EMP_ID IN NUMBER,
                       I_COORPORATE    IN VARCHAR2,
                       I_BU            IN VARCHAR2,
                       I_ISU           IN NUMBER,
                       I_CLUS_ID         IN NUMBER,
                       I_ACC            IN NUMBER,
                       I_DATE          IN  VARCHAR2,
                       O_HEADER        OUT SYS_REFCURSOR,
                       O_DATA          OUT SYS_REFCURSOR,
                       O_VAR_DATA      OUT VARCHAR2);
  

  PROCEDURE SP_WSR_SHEET_NAMES(I_EMP_ID      IN NUMBER,
                               I_CORP_ID     IN NUMBER,
                               I_BU_ID       IN VARCHAR2,
                               I_ISU_ID      IN VARCHAR2,
                               I_CLUS_ID     IN VARCHAR2,
                               I_ACC_ID      IN VARCHAR2,
                               I_FILE_DATE   IN VARCHAR2, ---==//File Date
                               I_REPORT_NAME IN VARCHAR2, --===//Report Name
                               I_OTHERS      IN VARCHAR2,
                               O_COUNT       OUT NUMBER,
                               O_CUR_SHEETS  OUT SYS_REFCURSOR,
                               O_FILE_NAME   OUT VARCHAR);
                               
                               
  PROCEDURE SP_BTG_SUBMISSION_MAIL(I_EMP_ID  IN NUMBER,
                              I_ISU_ID  IN NUMBER,                                                        
                             
                              I_OTHERS  IN VARCHAR2,
                              I_ALERT#  IN NUMBER,----613(LOCAL)
                              O_MESSAGE OUT VARCHAR2) ;
                              
 procedure SP_BTG_DEFAULTER_MAIL(I_EMP_ID  IN NUMBER,
                              I_ISU_ID  IN NUMBER,                                                        
                             
                              I_OTHERS  IN VARCHAR2,
                              I_ALERT#  IN NUMBER,----612(LOCAL)
                              O_MESSAGE OUT VARCHAR2);  
                              
                              
procedure SP_UPLOAD_STATUS_MAIL_BTG(I_EMP_ID  IN NUMBER,
                              I_ISU_ID  IN NUMBER,
                              I_OTHERS  IN VARCHAR2,
                              I_ALERT#  IN NUMBER,----468---422(PROD)
                              O_MESSAGE OUT VARCHAR2);                                                                                   
                               

  PROCEDURE SP_WSR_TEMPLATE(I_EMP_ID        IN NUMBER,
                            I_CORP_ID       IN NUMBER,
                            I_BG_ID         IN VARCHAR2,
                            I_ISU_ID        IN VARCHAR2,
                            I_CLUS_ID       IN VARCHAR2,
                            I_ACC_ID        IN VARCHAR2,
                            I_FILE_DATE     IN VARCHAR2, ---==//File Date
                            I_REPORT_NAME   IN VARCHAR2, --===//Report Name
                            I_SHEET_NAME    IN VARCHAR2, --== // Sheet Name
                            I_GRID_COUNT    IN NUMBER, --== // Grid count in a sheet
                            I_OTHERS        IN VARCHAR2, --== // extra input
                            O_CUR_HDR       OUT SYS_REFCURSOR, --==// Header cursor
                            O_CUR_DATA_TYPE OUT SYS_REFCURSOR, --==// Data Type cursor
                            O_CUR_VAL       OUT SYS_REFCURSOR, --==// Values Cursor
                            O_MSG           OUT VARCHAR2, --==/ success / Failure Msg
                            O_NO_OF_INDEX   OUT NUMBER,O_TCV_COL OUT VARCHAR2);

  PROCEDURE SP_WEEKLY_FILE_DATE(I_DATE      IN DATE,
                                O_CUR_WEEK  OUT DATE,
                                O_CUR_MONTH OUT DATE,
                                O_CUR_QTR   OUT VARCHAR2);
                                
                             
                                
   PROCEDURE SP_WEEKLY_UPLOAD(I_LOGGED_EMP_ID IN NUMBER,
                             I_CORP          IN NUMBER,
                             I_BU            IN NUMBER,
                             I_ISU           IN NUMBER,
                             I_CLUS_ID       IN NUMBER,
                             I_ACC_ID        IN NUMBER,
                             I_FILE_NAME     IN VARCHAR2,
                             I_DATE          IN VARCHAR2,
                           
                             O_MSG           OUT VARCHAR2);

  PROCEDURE SP_WEEKLY_UPLOAD_STG(I_LOGGED_EMP_ID IN NUMBER,
                                 I_COORPORATE    IN VARCHAR2,
                                 I_BU            IN VARCHAR2,
                                 I_ISU_ID        IN NUMBER,
                                 I_CLUS_ID       IN NUMBER,
                                 I_ACC_ID        IN NUMBER,
                                 I_SHEET_NAME    IN VARCHAR2,
                                 I_DATE          IN VARCHAR2,
                                 O_INSERT_QRY    OUT VARCHAR2,
                                 O_DELETE_QRY    OUT VARCHAR2);

  PROCEDURE SP_WEEKLY_UPLOAD_ERR_CHK(I_LOGGED_EMP_ID IN NUMBER,
                                     I_COORPORATE    IN VARCHAR2,
                                     I_BU            IN VARCHAR2,
                                     I_ISU_ID        IN NUMBER,
                                     I_CLUS_ID       IN NUMBER,
                                     I_ACC_ID        IN NUMBER,
                                     I_SHEET_NAME    IN VARCHAR2,
                                     I_DATE          IN VARCHAR2,
                                     O_ERROR_CUR     OUT SYS_REFCURSOR,
                                     O_MSG           OUT VARCHAR2);

  PROCEDURE SP_WEEKLY_STG_TO_TGT(I_LOGGED_EMP_ID IN NUMBER,
                                 I_COORPORATE    IN VARCHAR2,
                                 I_BU            IN VARCHAR2,
                                 I_ISU_ID        IN NUMBER,
                                 I_CLUS_ID       IN NUMBER,
                                 I_ACC_ID        IN NUMBER,
                                 I_SHEET_NAME    IN VARCHAR2,
                                 I_DATE          IN VARCHAR2,
                                 I_SUBMIT_FLAG   IN VARCHAR2,
                                 O_MSG           OUT VARCHAR2,
                                 O_USER_DATA     OUT SYS_REFCURSOR);

  PROCEDURE SP_WEEKLY_SCHEDULER;
   PROCEDURE SP_DECK_WSR_GRID_CNT(I_LOGGED_EMP_ID IN NUMBER,
                               I_COORPORATE    IN NUMBER,
                               I_BU            IN NUMBER,
                               I_ISU           IN NUMBER,
                               I_FILE_DATE     IN VARCHAR2,
                               I_SHEET_NAME    IN VARCHAR2,
                               I_FLAG          IN VARCHAR2, ---===EXCEL/PPT
                               O_GRID_COUNT  OUT NUMBER,
                               O_GROUP OUT VARCHAR2);
                               
 PROCEDURE SP_WSR_PPT_ATTACHMENT(I_LOGGED_EMP_ID IN NUMBER,
                               I_COORPORATE    IN NUMBER,
                               I_BU            IN NUMBER,
                               I_ISU           IN NUMBER,
                               I_FILE_DATE     IN VARCHAR2,
                               I_SHEET_NAME    IN VARCHAR2,
                               I_FLAG          IN VARCHAR2, ---===EXCEL/PPT
                               I_GRID_COUNT  IN NUMBER,
                               O_SHEET_HEADER  OUT SYS_REFCURSOR,
                               O_SHEET_DATA    OUT SYS_REFCURSOR,
                               O_DATA_TYPE     OUT SYS_REFCURSOR,
                               O_SLIDE_TITLE   OUT VARCHAR2,
                               O_SLIDE_FOOTER  OUT VARCHAR2,
                               O_WEEK          OUT VARCHAR2);
                               
 PROCEDURE SP_TGT_DATE_CHECK(I_LOGGED_EMP_ID IN NUMBER,
                            I_COORPORATE    IN NUMBER,
                            I_BU            IN NUMBER,
                            I_ISU           IN VARCHAR2,
                            I_SUB_ISU       IN VARCHAR2,
                            I_ACC             IN VARCHAR2,
                            I_DATE          IN VARCHAR2,
                            O_MSG           OUT VARCHAR2) ;     
                            
  PROCEDURE SP_HC_STATUS_FRZ_UNFRZ(I_LOGGED_EMP_ID   IN NUMBER,
                                I_COORPORATE  IN NUMBER,
                                I_BU    IN NUMBER,
                                I_ISU  IN VARCHAR2,
                                I_CLUS IN VARCHAR2,
                                I_ACC_ID   IN VARCHAR2,
                                I_DATE   IN VARCHAR2,
                                O_MSG      OUT VARCHAR2);                          
                                                             
 PROCEDURE SP_WEEKLY_SCHEDULER_FREEZE;      
   
   PROCEDURE SP_WEEKLY_TEMPLATE_HC(I_EMP_ID        IN NUMBER,
                            I_CORP_ID       IN NUMBER,
                            I_BG_ID         IN VARCHAR2,
                            I_ISU_ID        IN VARCHAR2,
                            I_CLUS_ID       IN VARCHAR2,
                            I_ACC_ID        IN VARCHAR2,
                            I_FILE_DATE     IN VARCHAR2, ---==//File Date
                            I_REPORT_NAME   IN VARCHAR2, --===//Report Name
                            I_SHEET_NAME    IN VARCHAR2, --== // Sheet Name
                            I_GRID_COUNT    IN NUMBER, --== // Grid count in a sheet
                            I_OTHERS        IN VARCHAR2, --== // extra input
                            O_CUR_HDR       OUT SYS_REFCURSOR, --==// Header cursor
                            O_CUR_DATA_TYPE OUT SYS_REFCURSOR, --==// Data Type cursor
                            O_CUR_VAL       OUT SYS_REFCURSOR, --==// Values Cursor
                            O_MSG           OUT VARCHAR2, --==/ success / Failure Msg
                            O_NO_OF_INDEX   OUT NUMBER,
                            O_TCV_COL OUT VARCHAR2);      
                            
                            
  PROCEDURE SP_WKLY_MONTHLY_GRID_BTG(I_LOGGED_EMP_ID IN NUMBER,
                                                     I_COORPORATE    IN VARCHAR2,
                                                     I_BU            IN VARCHAR2,
                                                     I_ISU           IN NUMBER,
                                                     I_CLUS_ID       IN NUMBER,
                                                     I_ACC           IN NUMBER,
                                                     I_DATE          IN VARCHAR2,
                                                     O_HEADER        OUT SYS_REFCURSOR,
                                                     O_DATA          OUT SYS_REFCURSOR,
                                                     O_VAR_DATA      OUT VARCHAR2);   
  
  PROCEDURE SP_WEEKLY_REPORT_HC(I_EMP_ID        IN NUMBER,
                                I_CORP_ID       IN NUMBER,
                                I_BG_ID         IN VARCHAR2,
                                I_ISU_ID        IN VARCHAR2,
                                I_CLUS_ID       IN VARCHAR2,
                                I_ACC_ID        IN VARCHAR2,
                                I_FILE_DATE     IN VARCHAR2, ---==//File Date
                                I_REPORT_NAME   IN VARCHAR2, --===//Report Name
                                I_SHEET_NAME    IN VARCHAR2, --== // Sheet Name
                                I_GRID_COUNT    IN NUMBER, --== // Grid count in a sheet
                                I_OTHERS        IN VARCHAR2, --== // extra input
                                O_CUR_HDR       OUT SYS_REFCURSOR, --==// Header cursor
                                O_CUR_DATA_TYPE OUT SYS_REFCURSOR, --==// Data Type cursor
                                O_CUR_VAL       OUT SYS_REFCURSOR, --==// Values Cursor
                                O_MSG           OUT VARCHAR2, --==/ success / Failure Msg
                                O_NO_OF_INDEX   OUT NUMBER,
                                O_TCV_COL       OUT VARCHAR2);     
                                
  procedure sp_iou (O_IOU OUT SYS_REFCURSOR) ;                                                                                                                                                                          

end PKG_BTG_WSR_DOWNLOAD;
/
create or replace package body PKG_BTG_WSR_DOWNLOAD is

  PROCEDURE SP_WSR_TOP_PANEL(I_EMP_ID      IN NUMBER,
                             I_CORP_ID     IN NUMBER,
                             I_BU_ID       IN NUMBER,
                             I_ISU_ID      IN NUMBER,
                             I_CLUS_ID     IN NUMBER,
                             I_ACC_ID      IN NUMBER,
                             I_GC_ID       IN NUMBER,
                             O_CUR_CORP    OUT SYS_REFCURSOR,
                             O_CUR_BG      OUT SYS_REFCURSOR,
                             O_CUR_ISU     OUT SYS_REFCURSOR,
                             O_CUR_CLUS    OUT SYS_REFCURSOR,
                             O_CUR_ACCOUNT OUT SYS_REFCURSOR,
                             O_CUR_GC      OUT SYS_REFCURSOR,
                             O_UPLOAD_FLAG OUT VARCHAR2,
                             O_WEEK        OUT VARCHAR2,
                             O_DATE        OUT VARCHAR2) IS
    QRY        CLOB;
    V_APPEND_QRY  VARCHAR2(1000);
    V_ISU_CHK VARCHAR2(1000);
    V_GROUP_ID VARCHAR2(1000);
    V_SUB_ISU_CHK VARCHAR2(100);
    V_LEVEL_ID VARCHAR2(1000);
    V_ACC_CHK VARCHAR2(1000);
    V_FIRST    VARCHAR2(1000);
    V_LAST     VARCHAR2(1000);
    V_ISU_NAME VARCHAR2(2000);
    V_UNIT_ID  NUMBER;
    V_CNT NUMBER;
  BEGIN
    BEGIN
      IF I_EMP_ID IS NULL THEN
        O_UPLOAD_FLAG := 'Please Provide Employee ID';
        RETURN;
      END IF;
    
      QRY := 'SELECT TRUNC(NEXT_DAY(SYSDATE, ''TUE'')) - INTERVAL ''7'' DAY AS PREV_MONDAY,
                    TRUNC(NEXT_DAY(SYSDATE, ''TUE'')) - INTERVAL ''1'' DAY AS NEXT_FRIDAY
               FROM DUAL';
    
      EXECUTE IMMEDIATE QRY
        INTO V_FIRST, V_LAST;
    
      --TO CHECK WHETHER THE INPUT LOGIN ID IS AN ISU HEAD('Y')
      IF I_EMP_ID IN (271042,
                      117477,
                      121910,
                      104105,
                      119060,
                      1349644,
                      998643,
                      751676,
                      1720779,
                      974742,
                      116821) THEN
        --bg level
      
        O_UPLOAD_FLAG := 'Y#Y'; ---DELEGATE ACCESSS#wEEKLY STATUS DASHBOARD
      
      ELSIF I_EMP_ID IN /*(V_EMP_IDS)*/
            (145720,
             81566,
             102996,
             92304,
             106407,
             125849,
             110114,
             104210,
             104705,
             103640,
             800670) THEN
        O_UPLOAD_FLAG := 'Y#N';
      ELSE
        O_UPLOAD_FLAG := 'N#N';
      END IF;
      /*
      SELECT DISTINCT W.LEVEL_ID,W.UNIT_ID
        INTO V_LEVEL_ID,V_GROUP_ID
        FROM WEEKLY_REPORT_USER_DETAILS_BTG W
       WHERE W.EMP_ID = I_EMP_ID;*/
    
      SELECT DISTINCT W.LEVEL_ID,
                      listagg(w.unit_id, ',') within group(order by unit_id)
        INTO V_LEVEL_ID, V_GROUP_ID
        FROM WEEKLY_REPORT_USER_DETAILS_BTG W
       WHERE W.EMP_ID = I_EMP_ID
       group by level_id;
    
      O_WEEK := 'Weekly Report status for the week: ' || V_FIRST || ' to  ' ||
                V_LAST || ' ';
      --O_WEEK := 'Weekly Report status for the week: 29-Mar-2022 to  04-Apr-2022';
    
      SELECT TO_CHAR(TO_DATE(V_FIRST, 'DD-MON-RRRR'), 'DD-MM-RRRR'),
             TO_CHAR(TO_DATE(V_LAST, 'DD-MON-RRRR'), 'DD-MM-RRRR')
        INTO V_FIRST, V_LAST
        FROM DUAL;
    
      O_DATE := V_FIRST || ' to ' || V_LAST;
    
      INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
      VALUES
        (I_EMP_ID,
         SYSDATE,
         'PKG_WSR_UPLOAD_DOWNLOAD.SP_WSR_TOP_PANEL',
         I_EMP_ID,
         '',
         '',
         V_LEVEL_ID);
      COMMIT;
    
      QRY := 'SELECT 1, ''CORPORATE'' FROM DUAL';
      OPEN O_CUR_CORP FOR QRY;
    
      --- IF I_BU_ID = 0 AND I_ISU_ID = 0 THEN
      OPEN O_CUR_GC FOR
        SELECT '' FROM DUAL;
    
      IF V_LEVEL_ID IN (-2, -1) THEN
      
        IF I_BU_ID = 0 AND I_ISU_ID = 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0 THEN
        
          QRY := '
             SELECT * FROM
            (SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# IN (21)
               ORDER BY M.BU# ASC)';
        
          OPEN O_CUR_BG FOR QRY; ---GROUP
        
          OPEN O_CUR_ISU FOR
            SELECT 0, 'ALL' FROM DUAL;
        
          OPEN O_CUR_CLUS FOR
            SELECT 0, 'ALL' FROM DUAL;
        
          OPEN O_CUR_ACCOUNT FOR ---
          
            SELECT 0, 'ALL' FROM DUAL;
        
        ELSIF I_BU_ID <> 0 AND I_ISU_ID = 0 AND I_CLUS_ID = 0 AND
              I_ACC_ID = 0 THEN
        
          QRY := 'SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# = ' || I_BU_ID || '
         ';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT 0 ID, ''ALL'' FROM DUAL UNION ALL
               SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                  WHERE UPPER(T.ACTIVE)=''YES'' 
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
        
          /* QRY := ' SELECT 0 ID, ''ALL'' FROM DUAL UNION ALL
                SELECT * FROM 
                (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                   FROM NEW_BTG_ACCOUNT_MAPPING T
                   WHERE UPPER(T.ACTIVE)=''YES'' 
                  ORDER BY T.SUB_IOU_ID)';
                  
          OPEN O_CUR_CLUS FOR QRY;  
          
          QRY := ' SELECT 0 ID, ''ALL'' FROM DUAL UNION ALL
                SELECT * FROM 
                (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                   FROM NEW_BTG_ACCOUNT_MAPPING T
                   WHERE UPPER(T.ACTIVE)=''YES'' 
                  ORDER BY T.ACCOUNT_ID)';
                  
          OPEN O_CUR_ACCOUNT FOR QRY;*/
          OPEN O_CUR_CLUS FOR
            SELECT 0, 'ALL' FROM DUAL;
        
          OPEN O_CUR_ACCOUNT FOR ---
          
            SELECT 0, 'ALL' FROM DUAL;
        
        ELSIF I_BU_ID <> 0 AND I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND
              I_ACC_ID = 0 THEN
        
          QRY := 'SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# = ' || I_BU_ID || ' ';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     SELECT 0 ID, ''ALL'' FROM DUAL
     UNION ALL
     SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID <> ' || I_ISU_ID || '
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
          
          SELECT COUNT(SUB_IOU) INTO V_CNT FROM (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                  WHERE T.IOU_ID = I_ISU_ID
                  AND UPPER(T.ACTIVE)='YES'
                 ORDER BY T.SUB_IOU_ID);
                 
                 IF V_CNT > 1 THEN
                   V_APPEND_QRY:= 'SELECT 0 ID, ''ALL'' FROM DUAL UNION ALL';
                   ELSE 
                     V_APPEND_QRY := '';
                   END IF;
                 
                 
          QRY := V_APPEND_QRY || '
               SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                  WHERE T.IOU_ID = ' || I_ISU_ID || '
                  AND UPPER(T.ACTIVE)=''YES'' 
                 ORDER BY T.SUB_IOU_ID)';
        
          OPEN O_CUR_CLUS FOR QRY;
        
          /* QRY := ' SELECT 0 ID, ''ALL'' FROM DUAL UNION ALL
                SELECT * FROM 
                (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                   FROM NEW_BTG_ACCOUNT_MAPPING T
                   WHERE T.IOU_ID = '||I_ISU_ID||' AND
                   UPPER(T.ACTIVE)=''YES'' 
                  ORDER BY T.ACCOUNT_ID)';
                  
          OPEN O_CUR_ACCOUNT FOR QRY;*/
        IF V_CNT > 1 THEN
          OPEN O_CUR_ACCOUNT FOR ---
            SELECT 0, 'ALL' FROM DUAL;
        ELSE
          OPEN O_CUR_ACCOUNT FOR
          SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                  WHERE  T.IOU_ID =  I_ISU_ID AND
                  UPPER(T.ACTIVE)='YES'
                 ORDER BY T.ACCOUNT_ID);
            END IF;
        
        ELSIF I_BU_ID <> 0 AND I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND
              I_ACC_ID = 0 THEN
        
          QRY := 'SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# = ' || I_BU_ID || ' ';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     SELECT 0 ID, ''ALL'' FROM DUAL
     UNION ALL
     SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID <> ' || I_ISU_ID || '
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
          
          SELECT COUNT(SUB_IOU) INTO V_CNT FROM (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE (T.IOU_ID =  I_ISU_ID )
                  AND UPPER(T.ACTIVE)='YES'
                 ORDER BY T.SUB_IOU_ID);
                 
                 IF V_CNT > 1 THEN
                   V_APPEND_QRY:= 'SELECT 0 ID, ''ALL'' FROM DUAL UNION ALL';
                   ELSE 
                     V_APPEND_QRY := '';
                   END IF;
          
          
          QRY := 'SELECT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE  T.IOU_ID = ' || I_ISU_ID ||
                 ' AND 
                 T.SUB_IOU_ID = ' || I_CLUS_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     ' || V_APPEND_QRY || '
     SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE (T.IOU_ID = ' || I_ISU_ID ||
                 ' AND T.SUB_IOU_ID <> ' || I_CLUS_ID || ')
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.SUB_IOU_ID)';
        
          OPEN O_CUR_CLUS FOR QRY;
        
     SELECT COUNT(ACCOUNT_ID) INTO V_CNT FROM (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                  WHERE  T.IOU_ID = I_ISU_ID  AND 
                 T.SUB_IOU_ID =  I_CLUS_ID AND
                  UPPER(T.ACTIVE)='YES');
     IF V_CNT > 1 THEN 
       V_APPEND_QRY := 'SELECT 0 ID, ''ALL'' FROM DUAL UNION ALL';
     ELSE
       V_APPEND_QRY := '';
     END IF;
          QRY := ' 
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                  WHERE  T.IOU_ID = ' || I_ISU_ID ||
                 ' AND 
                 T.SUB_IOU_ID = ' || I_CLUS_ID ||
                 ' AND
                  UPPER(T.ACTIVE)=''YES'' 
                 ORDER BY T.ACCOUNT_ID)';
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        ELSIF I_BU_ID <> 0 AND I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND
              I_ACC_ID <> 0 THEN
        
          QRY := 'SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# = ' || I_BU_ID || ' ';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     SELECT 0 ID, ''ALL'' FROM DUAL
     UNION ALL
     SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID <> ' || I_ISU_ID || '
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
        
          QRY := 'SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE  T.IOU_ID = ' || I_ISU_ID ||
                 ' AND 
                 T.SUB_IOU_ID = ' || I_CLUS_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     SELECT 0 ID, ''ALL'' FROM DUAL
     UNION ALL
     SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE (T.IOU_ID = ' || I_ISU_ID ||
                 ' AND T.SUB_IOU_ID <> ' || I_CLUS_ID || ')
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.SUB_IOU_ID)';
        
          OPEN O_CUR_CLUS FOR QRY;
        
          QRY := 'SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE  T.IOU_ID = ' || I_ISU_ID ||
                 ' AND 
                 T.SUB_IOU_ID = ' || I_CLUS_ID ||
                 ' AND
                 T.ACCOUNT_ID = ' || I_ACC_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     SELECT 0 ID, ''ALL'' FROM DUAL
      UNION ALL
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.ACCOUNT_ID <> ' || I_ACC_ID || '
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.ACCOUNT_ID)';
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        END IF;
      
        -- ELSIF V_LEVEL_ID = -1 THEN
      
      ELSIF V_LEVEL_ID IN (6, 7) THEN
        
      
        
      SELECT COUNT(1) INTO V_CNT FROM WEEKLY_REPORT_USER_DETAILS_BTG T WHERE T.EMP_ID=I_EMP_ID;
      
      IF V_LEVEL_ID = 6 THEN
        
      IF V_CNT = 1 THEN
        
       V_APPEND_QRY := '';
        
      ELSE
        
      V_APPEND_QRY := 'SELECT 0 ID, ''ALL'' FROM DUAL
               UNION ALL';
               END IF;
        
      ELSIF V_LEVEL_ID = 7 THEN
      
      IF V_CNT = 1 THEN
        
       V_APPEND_QRY := '';
        
      ELSE
        
      V_APPEND_QRY := 'SELECT 0 ID, ''ALL'' FROM DUAL
               UNION ALL';
               END IF;
        
      ---- V_APPEND_QRY := '';
      END IF;
      
      IF V_CNT = 1 THEN
        
      IF I_ISU_ID = 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0 THEN
          QRY := '
             SELECT * FROM
            (SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# IN (21)
               ORDER BY M.BU# ASC)';
        
          OPEN O_CUR_BG FOR QRY;
          QRY := ' '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
          QRY := ' '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.SUB_IOU_ID)';
                 
                   EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_SUB_ISU_CHK;
        
        IF V_SUB_ISU_CHK = 'Y' THEN
          
         QRY := ' 
               SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.SUB_IOU_ID)';
          
        END IF;
        
        
          OPEN O_CUR_CLUS FOR QRY;
        
          QRY := ' '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        ELSIF I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0 THEN
        
          QRY := '
             SELECT * FROM
            (SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# IN (21)
               ORDER BY M.BU# ASC)';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
   '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID <> ' || I_ISU_ID || '
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
          QRY := ''||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.SUB_IOU_ID)';
                 
                   EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_SUB_ISU_CHK;
        
        IF V_SUB_ISU_CHK = 'Y' THEN
          
         QRY := ' 
               SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.SUB_IOU_ID)';
          
        END IF;
        
                 
        
          OPEN O_CUR_CLUS FOR QRY;
        
          QRY := ' '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.IOU_ID = ' || I_ISU_ID || '
                 AND T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
                 
                   EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_ACC_CHK;
        
        IF V_ACC_CHK = 'Y' THEN
         QRY := ' 
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.IOU_ID = ' || I_ISU_ID || '
                 AND T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
                 
        END IF;
                 
                 
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        ELSIF I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0 THEN
        
          QRY := '
             SELECT * FROM
            (SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# IN (21)
               ORDER BY M.BU# ASC)';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID <> ' || I_ISU_ID || '
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
          QRY := 'SELECT DISTINCT T.sub_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.SUB_IOU_ID = ' || I_CLUS_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE (T.IOU_ID = ' || I_ISU_ID ||
                 ' AND T.SUB_IOU_ID <> ' || I_CLUS_ID || ')
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.SUB_IOU_ID)';
        
          OPEN O_CUR_CLUS FOR QRY;
        
          QRY := ' SELECT 0 ID, ''ALL'' FROM DUAL
               UNION ALL
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.IOU_ID = ' || I_ISU_ID || '
                 AND T.SUB_IOU_ID = ' || I_CLUS_ID ||
                 ' AND
                 T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
                 
                    EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_ACC_CHK;
        
        IF V_ACC_CHK = 'Y' THEN
        
          QRY := '
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.IOU_ID = ' || I_ISU_ID || '
                 AND T.SUB_IOU_ID = ' || I_CLUS_ID ||
                 ' AND
                 T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
                 
        
        END IF;
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        ELSIF I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID <> 0 THEN
        
          QRY := '
             SELECT * FROM
            (SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# IN (21)
               ORDER BY M.BU# ASC)';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
    '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID <> ' || I_ISU_ID || '
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
          QRY := 'SELECT DISTINCT T.sub_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.SUB_IOU_ID = ' || I_CLUS_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
    '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_SIOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE (T.IOU_ID = ' || I_ISU_ID ||
                 ' AND T.SUB_IOU_ID <> ' || I_CLUS_ID || ')
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.SUB_IOU_ID)';
        
          OPEN O_CUR_CLUS FOR QRY;
        
          QRY := 'SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.ACCOUNT_ID = ' || I_ACC_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
    '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.ACCOUNT_ID <> ' || I_ACC_ID || '
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.ACCOUNT_ID)';
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        END IF;
      
      
      ELSE
      
      
        IF I_ISU_ID = 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0 THEN
          QRY := '
             SELECT * FROM
            (SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# IN (21)
               ORDER BY M.BU# ASC)';
        
          OPEN O_CUR_BG FOR QRY;
          
          
          QRY := ' '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.IOU_ID)';
                 
                   EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_ISU_CHK;
        
        IF V_ISU_CHK = 'Y' THEN
          
          QRY := ' 
               SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.IOU_ID)';
          
        END IF;
                 
                 
        
          OPEN O_CUR_ISU FOR QRY;
          
          
         QRY := ' '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.SUB_IOU_ID)';
                 
                   EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_SUB_ISU_CHK;
        
        IF V_ISU_CHK = 'Y' AND V_SUB_ISU_CHK = 'Y' THEN
          
         QRY := ' 
               SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.SUB_IOU_ID)';
                 
           ELSIF V_ISU_CHK = 'N' AND V_SUB_ISU_CHK = 'Y' THEN
             
           QRY := 'SELECT 0, ''ALL'' FROM DUAL';
          
             
            ELSIF V_ISU_CHK = 'N' AND V_SUB_ISU_CHK = 'N' THEN
               QRY := 'SELECT 0, ''ALL'' FROM DUAL';
          
        END IF;
        
        
          OPEN O_CUR_CLUS FOR  QRY;
        
          QRY := ' '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
                   EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_ACC_CHK;
        IF V_SUB_ISU_CHK = 'Y' AND V_ACC_CHK = 'Y' THEN
            QRY := ' 
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
                 
          ELSIF  V_SUB_ISU_CHK  = 'N' AND V_ACC_CHK = 'Y' THEN  
          
          QRY := 'SELECT 0,''ALL'' FROM DUAL';
          
          ELSIF V_SUB_ISU_CHK = 'N' AND V_ACC_CHK = 'N' THEN
               QRY := 'SELECT 0, ''ALL'' FROM DUAL';
          
        END IF;
                 
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        ELSIF I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0 THEN
        
          QRY := '
             SELECT * FROM
            (SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# IN (21)
               ORDER BY M.BU# ASC)';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
   '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID <> ' || I_ISU_ID || '
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
          
          
          QRY := ''||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.SUB_IOU_ID)';
                 
                   EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_SUB_ISU_CHK;
        
        IF V_SUB_ISU_CHK = 'Y' THEN
          
         QRY := ' 
               SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.SUB_IOU_ID)';
          
        END IF;
        
                 
        
          OPEN O_CUR_CLUS FOR QRY;
        
        QRY := ' '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.IOU_ID = ' || I_ISU_ID || '
                 AND T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
                 
                   EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_ACC_CHK;
        
        IF V_SUB_ISU_CHK = 'Y' AND V_ACC_CHK = 'Y' THEN
         QRY := ' 
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.IOU_ID = ' || I_ISU_ID || '
                 AND T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
           ELSIF  V_SUB_ISU_CHK  = 'N' AND V_ACC_CHK = 'Y' THEN  
          
          QRY := 'SELECT 0,''ALL'' FROM DUAL';
          
          ELSIF V_SUB_ISU_CHK = 'N' AND V_ACC_CHK = 'N' THEN
               QRY := 'SELECT 0, ''ALL'' FROM DUAL';
                 
                 
        END IF;
                 
                 
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        ELSIF I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0 THEN
        
          QRY := '
             SELECT * FROM
            (SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# IN (21)
               ORDER BY M.BU# ASC)';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID <> ' || I_ISU_ID || '
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
          QRY := 'SELECT DISTINCT T.sub_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.SUB_IOU_ID = ' || I_CLUS_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
     '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE (T.IOU_ID = ' || I_ISU_ID ||
                 ' AND T.SUB_IOU_ID <> ' || I_CLUS_ID || ')
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.SUB_IOU_ID)';
        
          OPEN O_CUR_CLUS FOR QRY;
        
          QRY := ' SELECT 0 ID, ''ALL'' FROM DUAL
               UNION ALL
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.IOU_ID = ' || I_ISU_ID || '
                 AND T.SUB_IOU_ID = ' || I_CLUS_ID ||
                 ' AND
                 T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
                 
                    EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 2, ' || '''Y''' || ', ' ||
                        '''N''' || ') FROM(' || QRY || ')'
        INTO V_ACC_CHK;
        
        IF V_ACC_CHK = 'Y' THEN
        
          QRY := '
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T 
                 WHERE  T.IOU_ID = ' || I_ISU_ID || '
                 AND T.SUB_IOU_ID = ' || I_CLUS_ID ||
                 ' AND
                 T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                 ORDER BY T.ACCOUNT_ID)';
                 
        
        END IF;
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        ELSIF I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID <> 0 THEN
        
          QRY := '
             SELECT * FROM
            (SELECT DISTINCT M.BU#,M.BU_NAME 
               FROM BU_MASTER M
               WHERE M.BU# IN (21)
               ORDER BY M.BU# ASC)';
        
          OPEN O_CUR_BG FOR QRY;
        
          QRY := ' SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID = ' || I_ISU_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
    '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.IOU_ID,T.IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.IOU_ID <> ' || I_ISU_ID || '
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.IOU_ID)';
        
          OPEN O_CUR_ISU FOR QRY;
          QRY := 'SELECT DISTINCT T.sub_IOU_ID,T.SUB_IOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.SUB_IOU_ID = ' || I_CLUS_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
    '||V_APPEND_QRY||'
     SELECT * FROM 
               (SELECT DISTINCT T.SUB_IOU_ID,T.SUB_SIOU 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE (T.IOU_ID = ' || I_ISU_ID ||
                 ' AND T.SUB_IOU_ID <> ' || I_CLUS_ID || ')
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.SUB_IOU_ID)';
        
          OPEN O_CUR_CLUS FOR QRY;
        
          QRY := 'SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.ACCOUNT_ID = ' || I_ACC_ID || '
                 AND UPPER(T.ACTIVE)=''YES''
     UNION ALL
    '||V_APPEND_QRY||'
               SELECT * FROM 
               (SELECT DISTINCT T.ACCOUNT_ID,T.SHORT_NAME 
                  FROM NEW_BTG_ACCOUNT_MAPPING T
                 WHERE T.ACCOUNT_ID <> ' || I_ACC_ID || '
                 AND  T.ACCOUNT_ID IN ( ' || V_GROUP_ID || ' )
                  AND UPPER(T.ACTIVE)=''YES''
                 ORDER BY T.ACCOUNT_ID)';
        
          OPEN O_CUR_ACCOUNT FOR QRY;
        
        END IF;
        END IF;
      END IF;
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        OPEN O_CUR_ACCOUNT FOR
          SELECT 'NO DATA FOUND' FROM DUAL;
      WHEN OTHERS THEN
        OPEN O_CUR_ACCOUNT FOR
          SELECT 'FAILED' FROM DUAL;
    END;
  END SP_WSR_TOP_PANEL;
PROCEDURE SP_WSR_SHEET_NAMES(I_EMP_ID      IN NUMBER,
                               I_CORP_ID     IN NUMBER,
                               I_BU_ID       IN VARCHAR2,
                               I_ISU_ID      IN VARCHAR2,
                               I_CLUS_ID     IN VARCHAR2,
                               I_ACC_ID      IN VARCHAR2,
                               I_FILE_DATE   IN VARCHAR2, ---==//File Date
                               I_REPORT_NAME IN VARCHAR2, --===//Report Name
                               I_OTHERS      IN VARCHAR2,
                               O_COUNT       OUT NUMBER,
                               O_CUR_SHEETS  OUT SYS_REFCURSOR,
                               O_FILE_NAME   OUT VARCHAR) IS
  
    QRY        CLOB;
    V_COND     VARCHAR2(4000);
    V_PERIOD   DATE;
    V_LVL_COND VARCHAR2(4000);
    V_CUR1     VARCHAR2(4000);
    V_CUR2     VARCHAR2(4000);
    V_LEVEL_ID VARCHAR2(4000);
    V_SHORT    VARCHAR2(4000);
  BEGIN
    INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
    VALUES
      (I_EMP_ID,
       SYSDATE,
       'PKG_BTG_WSR_DOWNLOAD.SP_WSR_SHEET_NAMES',
       I_EMP_ID || '-' || I_CORP_ID || '-' || I_BU_ID || '-' ||
       I_ISU_ID || '-' ||I_CLUS_ID||'-'||I_ACC_ID||'-'|| I_REPORT_NAME || '-' || I_FILE_DATE,
       '',
       I_ISU_ID,
       '');
       COMMIT;  
  
    V_PERIOD := TO_DATE(I_FILE_DATE, 'DD-MM-RRRR');
     if I_ISU_ID = 0 and I_CLUS_ID = 0 aNd I_ACC_ID = 0 then
       
     V_SHORT := 'BTG';
    
    elsif I_ISU_ID <> 0 and I_CLUS_ID = 0 aNd I_ACC_ID = 0 then
    SELECT DISTINCT IOU_SHORT_NAME INTO V_SHORT FROM NEW_BTG_ACCOUNT_MAPPING T
     WHERE T.IOU_ID=I_ISU_ID;
      elsif I_ISU_ID <> 0 and I_CLUS_ID <> 0 aNd I_ACC_ID = 0 then
        
         SELECT DISTINCT t.sub_iou INTO V_SHORT FROM NEW_BTG_ACCOUNT_MAPPING T
     WHERE T.IOU_ID=I_ISU_ID
     and t.sub_iou_id = I_CLUS_ID;
     
           elsif I_ISU_ID <> 0 and I_CLUS_ID <> 0 aNd I_ACC_ID <> 0 then
               
         SELECT DISTINCT t.short_name INTO V_SHORT FROM NEW_BTG_ACCOUNT_MAPPING T
     WHERE T.IOU_ID=I_ISU_ID
     and t.sub_iou_id = I_CLUS_ID
     and t.account_id = I_ACC_ID;

     
  end if;
    --IF I_BU_ID = 22 THEN 
  
    /*IF I_ISU_ID IN (247,248,249,0) THEN 
      V_COND := 'AND GRID_ID NOT IN (2,3)';
    ELSE
      V_COND := '';
    END IF;*/
  
    /*IF I_ISU_ID IS NULL OR I_ISU_ID = '0' THEN
      --==BG Level
      V_LVL_COND := 'AND LEVEL_ID IN (-2,1,2)';
    ELSE
      --== IOU Level
      V_LVL_COND := 'AND LEVEL_ID IN (1,2)';
    END IF;   
    
    QRY := 'SELECT SHEET_NAME,GRID_ID
               FROM(SELECT SHEET_ID,SHEET_NAME,MAX(GRID_ID) GRID_ID  
                      FROM WSR_TEMPLATE_HDR T
                     WHERE REPLACE(TRIM(UPPER(T.REPORT_NAME)),'' '','''') = 
                           REPLACE(TRIM(UPPER(''' || I_REPORT_NAME || ''')),'' '','''')
                       AND T.SHEET_ID NOT IN (106)
                      '||V_COND||'
                      '||V_LVL_COND||'
                     GROUP BY SHEET_ID,SHEET_NAME
                     ORDER BY T.SHEET_ID)';
    
    OPEN O_CUR_SHEETS FOR QRY;    
    
    EXECUTE IMMEDIATE 'SELECT COUNT(1) FROM ('||QRY||')' INTO O_COUNT;*/
  
    /* PKG_WSR_UPLOAD.SP_WEEKLY_FILE_DATE(V_PERIOD,
    V_PERIOD,
    V_CUR1,
    V_CUR2);*/
  
    /* IF I_ISU_ID IS NULL OR I_ISU_ID = '0' THEN
      --==BG Level
      IF I_BU_ID IS NULL OR I_BU_ID = '0' THEN
        O_FILE_NAME :=   'RCNT_BG_Report_' || TO_CHAR(V_PERIOD, 'DD_Mon_RRRR');
      ELSE
        SELECT REPLACE(REPLACE(B.BU_NAME, '-', '_'), '&', 'and') || '_Report_' ||
               TO_CHAR(V_PERIOD, 'DD_Mon_RRRR') FILE_NAME
          INTO O_FILE_NAME
          FROM BU_MASTER B
         WHERE B.BU# = I_BU_ID;
      END IF;
        
    ELSE
      --== IOU Level
      SELECT REPLACE(REPLACE(ISU_NAME, '-', '_'), '&', 'and') || '_'||INITCAP(I_REPORT_NAME)||'_' ||
             TO_CHAR(V_PERIOD, 'DD_Mon_RRRR') FILE_NAME
        INTO O_FILE_NAME
        FROM ISU_MSTR_NEW I
       WHERE I.ISU_ID = I_ISU_ID;
     
    END IF; 
    */
    --    ELSE
      SELECT DISTINCT W.LEVEL_ID
        INTO V_LEVEL_ID
        FROM WEEKLY_REPORT_USER_DETAILS_BTG W
       WHERE W.EMP_ID = I_EMP_ID;
  IF UPPER(I_REPORT_NAME) = 'REPORT' OR UPPER(I_REPORT_NAME) = 'MAIL' THEN
    OPEN O_CUR_SHEETS FOR
      SELECT 'Executive Summary', '1'
        FROM DUAL
      UNION ALL
      SELECT 'P&L', '1'
        FROM DUAL
      UNION ALL
      SELECT 'HC', '1'
        FROM DUAL
      UNION ALL
      SELECT 'Wins', '1'
        FROM DUAL
      UNION ALL
      SELECT 'Closed', '1'
        FROM DUAL
      UNION ALL
      SELECT 'Pipeline', '1'
        FROM DUAL
      UNION ALL
      SELECT 'TCVOutlook', '1'
        FROM DUAL
      UNION ALL
      SELECT 'C-connects or Customer visit', '1'
        FROM DUAL
       UNION ALL
      SELECT 'ITG or Sales','1'
        FROM DUAL;
  
    O_COUNT := 9;
    ----ADDED FOR HEAD COUNT 
    ELSIF UPPER(I_REPORT_NAME) = 'HC' THEN 
     OPEN O_CUR_SHEETS FOR
      
     
      SELECT 'P&L', '1'
        FROM DUAL
      UNION ALL
      SELECT 'HC', '1'
        FROM DUAL ;
       O_COUNT := 2;  
       
       ELSIF UPPER(I_REPORT_NAME)  like '%CONNECTS%' THEN 
         OPEN O_CUR_SHEETS FOR 
         
         SELECT 'C-connects or Customer visit', '1'
        FROM DUAL;
        O_COUNT := 1;
        
        ELSIF UPPER(I_REPORT_NAME)  LIKE '%TCVOUTLOOK%' THEN 
          
        OPEN O_CUR_SHEETS FOR 
            SELECT 'Wins', '1'
        FROM DUAL
      UNION ALL
      SELECT 'Closed', '1'
        FROM DUAL
      UNION ALL
      SELECT 'Pipeline', '1'
        FROM DUAL
      UNION ALL
      SELECT 'TCVOutlook', '1'
        FROM DUAL;
        O_COUNT := 4;
        
          
    
    ELSE
    OPEN O_CUR_SHEETS FOR
      SELECT 'ReadMe', '1'
        FROM DUAL
      UNION ALL
      SELECT 'Executive Summary', '1'
        FROM DUAL
      UNION ALL
      SELECT 'P&L', '1'
        FROM DUAL
      UNION ALL
      SELECT 'HC', '1'
        FROM DUAL
      UNION ALL
      SELECT 'Wins', '1'
        FROM DUAL
      UNION ALL
      SELECT 'Closed', '1'
        FROM DUAL
      UNION ALL
      SELECT 'Pipeline', '1'
        FROM DUAL
      UNION ALL
      SELECT 'TCVOutlook', '1'
        FROM DUAL
      UNION ALL
      SELECT 'C-connects or Customer visit', '1'
        FROM DUAL
         UNION ALL
      SELECT 'ITG or Sales','1'
        FROM DUAL;
  
    O_COUNT := 9;
  END IF;
    IF I_ISU_ID IS NULL OR I_ISU_ID = '0' THEN
      --==BG Level
      IF I_BU_ID IS NULL OR I_BU_ID = '0' THEN
        O_FILE_NAME := 'RCNT_BG_Report_' ||
                       TO_CHAR(V_PERIOD, 'DD_Mon_RRRR');
      ELSE
        SELECT REPLACE(REPLACE(B.BU_NAME, '-', '_'), '&', 'and') ||
               '_Report_' || TO_CHAR(V_PERIOD, 'DD_Mon_RRRR') FILE_NAME
          INTO O_FILE_NAME
          FROM BU_MASTER B
         WHERE B.BU# = I_BU_ID;
      END IF;
      
   ELSIF (TRIM(UPPER(I_REPORT_NAME)) = 'MAIL') AND I_ISU_ID <> '0' THEN
           V_COND := 'AND IOU_ID = ' || i_isu_id || '';
    
    ELSE
      IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
        IF V_LEVEL_ID IN (-2, 6) THEN
        
          V_COND := 'AND IOU_ID = ' || i_isu_id || '';
        
        ELSIF V_LEVEL_ID = 7 THEN
        
          V_COND := 'AND IOU_ID = ' || i_isu_id || '
 AND SUB_IOU_ID = ' || i_CLUS_id || '
 AND ACCOUNT_ID = ' || I_ACC_ID || '';
        
        END IF;
        ELSE
        V_COND := 'AND IOU_ID = ' || i_isu_id || '
 AND SUB_IOU_ID = ' || i_CLUS_id || '
 AND ACCOUNT_ID = ' || I_ACC_ID || '';
      
      END IF;
      --== IOU Level
      QRY := 'SELECT DISTINCT REPLACE(REPLACE('''||V_SHORT||''', ''-'', ''_''), ''&'', ''and'') || ''_'' ||
             INITCAP('''||I_REPORT_NAME||''') || ''_'' ||
             TO_CHAR(TO_DATE('''||V_PERIOD||''',''DD-MON-YY''), ''DD_Mon_RRRR'') FILE_NAME
        FROM NEW_BTG_ACCOUNT_MAPPING I
       WHERE 1=1 ' || V_COND||'';
        DELETE FROM X_TST_6;
      COMMIT;
      INSERT INto X_TST_6 VALUES (QRY);
      COMMIT;
       EXECUTE IMMEDIATE QRY INTO O_FILE_NAME;
       
    END IF;
    
    IF upper(I_REPORT_NAME) = 'MAIL' OR  upper(I_REPORT_NAME) = 'REPORT'  THEN
      
      QRY := 'SELECT DISTINCT REPLACE(REPLACE('''||V_SHORT||''', ''-'', ''_''), ''&'', ''and'') || ''_'' ||
             INITCAP(''Report'') || ''_'' ||
             TO_CHAR(TO_DATE('''||V_PERIOD||''',''DD-MON-YY''), ''DD_Mon_RRRR'') FILE_NAME
        FROM NEW_BTG_ACCOUNT_MAPPING I
       WHERE 1=1 ' || V_COND||'';
       
       
      -----------------FOR HC SHEET 
       ELSIF upper(I_REPORT_NAME) = 'HC' THEN
         QRY := 'SELECT  DISTINCT ''BTG_HC'' || ''_'' ||
             INITCAP(''Report'') || ''_'' ||
              TO_CHAR(TO_DATE('''||V_PERIOD||''',''DD-MON-YY''), ''DD_Mon_RRRR'') FILE_NAME
        FROM NEW_BTG_ACCOUNT_MAPPING I
       WHERE 1=1 ';--' || V_COND||'';
       
       ELSIF UPPER(I_REPORT_NAME) LIKE '%CONNECTS%' THEN 
         QRY := 'SELECT  DISTINCT ''BTG_C-CONNECTSorCUSTOMER VISIT'' || ''_'' ||
             INITCAP(''Report'') || ''_'' ||
              TO_CHAR(TO_DATE('''||V_PERIOD||''',''DD-MON-YY''), ''DD_Mon_RRRR'') FILE_NAME
        FROM NEW_BTG_ACCOUNT_MAPPING I
       WHERE 1=1 ';
        ELSIF UPPER(I_REPORT_NAME) LIKE '%TCVOUTLOOK%' THEN 
         QRY := 'SELECT  DISTINCT ''BTG_TCVOUTLOOK'' || ''_'' ||
             INITCAP(''Report'') || ''_'' ||
              TO_CHAR(TO_DATE('''||V_PERIOD||''',''DD-MON-YY''), ''DD_Mon_RRRR'') FILE_NAME
        FROM NEW_BTG_ACCOUNT_MAPPING I
       WHERE 1=1 ';
         END IF;
         
         --'SELECT ''BTG_HC_REPORT_REPORT_'''||V_HC_DATE||'''  ;
        -- */
        DELETE FROM X_TST_6;
      COMMIT;
      INSERT INto X_TST_6 VALUES (QRY);
      COMMIT;
       EXECUTE IMMEDIATE QRY INTO O_FILE_NAME;
      
   -- END IF;
  
    --END IF ;
  
  END SP_WSR_SHEET_NAMES;

  

  PROCEDURE SP_WSR_REFERENCE_SHEET(I_EMP_ID      IN NUMBER,
                                   I_CORP_ID     IN NUMBER,
                                   I_BG_ID       IN VARCHAR2,
                                   I_ISU_ID      IN VARCHAR2,
                                   I_CLUS_ID     IN VARCHAR2,
                                   I_ACC_ID      IN VARCHAR2,
                                   I_FILE_DATE   IN VARCHAR2, ---==//File Date
                                   I_REPORT_NAME IN VARCHAR2, --===//Report Name
                                   I_SHEET_NAME  IN VARCHAR2, --== // Sheet Name
                                   I_OTHERS      IN VARCHAR2, --== // extra input
                                   O_CUR_OU      OUT SYS_REFCURSOR,
                                   O_CUR_ACC     OUT SYS_REFCURSOR,
                                   O_CUR_P_GRP   OUT SYS_REFCURSOR,
                                   O_CUR_ROLE    OUT SYS_REFCURSOR,
                                   O_CUR_STAGE   OUT SYS_REFCURSOR,
                                   O_CUR_TYPE    OUT SYS_REFCURSOR
                                   ) IS
  
  BEGIN
    
    /*OPEN O_CUR_ACC FOR
      SELECT 'Operating Unit', 'Account'
        FROM DUAL
      UNION ALL
      SELECT ISU_NAME, null col
        FROM ISU_MSTR_NEW I
       WHERE I.ISU_ID = I_ISU_ID;
  */
  
 
    OPEN O_CUR_ACC FOR
      SELECT 'Sub IOU' SUB_IOU, 'Account' Account
        FROM DUAL
      UNION ALL
      SELECT *
        FROM (SELECT DISTINCT T.SUB_IOU, T.SHORT_NAME Account
                FROM NEW_BTG_ACCOUNT_MAPPING T
                WHERE T.IOU_ID = I_ISU_ID
                 AND T.SUB_IOU_ID = I_CLUS_ID 
              
               ORDER BY T.SUB_IOU, T.SHORT_NAME);
  
   /* OPEN O_CUR_P_GRP FOR
      SELECT 'Potential Group' P_GROUP
        from DUAL
      UNION ALL
      SELECT *
        FROM (SELECT DISTINCT CASE
                                WHEN T.NEW_GROUP LIKE 'BTG%' THEN
                                 'BTG'
                                WHEN T.NEW_GROUP LIKE 'EGG%' THEN
                                 'EGG'
                                WHEN T.NEW_GROUP LIKE 'RIG%' THEN
                                 'RIG'
                                ELSE
                                 T.NEW_GROUP
                              END NEW_GROUP
                FROM WSR_NEW_ORG_MAPPING T
               WHERE T.NEW_SUB_GROUP IN
                     (SELECT ISU_NAME
                        FROM ISU_MSTR_NEW I
                       WHERE I.ISU_ID = I_ISU_ID)
               ORDER BY NEW_GROUP);
  */
   /* OPEN O_CUR_TYPE FOR
      SELECT 'Type'
        FROM DUAL
      UNION ALL
      SELECT 'C-CONNECTS'
        FROM DUAL
      UNION ALL
      SELECT 'CUSTOMER VISIT'
        FROM DUAL;*/
        
   ------FOR    SENTIMENTS
   
   --IF UPPER(I_SHEET_NAME) = 'ITG' THEN
      OPEN O_CUR_OU FOR 
        SELECT 'Role' from dual
        union all
        SELECT 'BDM' from dual
        union all
        select 'BRM' from dual
        union all 
        select 'Client Partner' from dual
        union all
        select 'Sales Director' from dual
        ;
        
      OPEN O_CUR_P_GRP FOR
      
       SELECT 'Sales/ITG' from dual
        union all
        SELECT 'Sales' from dual
        union all
        select 'ITG' from dual;
        
          OPEN O_CUR_STAGE FOR
          
      SELECT 'Active in role at FY22(Y/N)' from dual
        union all
        SELECT 'Yes' from dual
        union all
        select 'No' from dual;   
        
     
  -- ELSE
  

     
      
        OPEN O_CUR_TYPE FOR 
        SELECT 'Visit / Connect Sentiment (Customers perspective)' from dual
        union all
        SELECT '1 - Poor' from dual
        union all
        select '2 - Below Expectation' from dual
        union all 
        select '3 - Average' from dual
        union all
        select '4 - Very good' from dual
        union all
        select '5 - Excellent' from dual;
        
   --end if;     
        
  
    IF (TRIM(I_BG_ID) = 21) THEN
    ------for new requriment 
    
    open O_CUR_ROLE for 
    SELECT  'Category' from dual 
    union all
    select 'CEO/Board member visits' from dual 
    union all
    select 'CIO Visits' from dual
     union all
     select 'CXO Visits' from dual 
     union all
     select 'CXO Direct Report Visits' from dual 
     union all
     select 'CEO/Board Members Connect' from dual 
     union all
      select 'CIO Connect' from dual
     union all
     select 'CXO Connect' from dual 
     union all
     select 'CXO Direct Report Connect' from dual; 
     
    
      /*OPEN O_CUR_ROLE FOR
        SELECT 'Customer Role'
          FROM DUAL
        UNION ALL
        SELECT 'CEO'
          FROM DUAL
        UNION ALL
        SELECT 'CCO'
          FROM DUAL
        UNION ALL
        SELECT 'CPO'
          FROM DUAL
        UNION ALL
        SELECT 'CKO'
          FROM DUAL
        UNION ALL
        SELECT 'CTO'
          FROM DUAL
        UNION ALL
        SELECT 'CFO'
          FROM DUAL
        UNION ALL
        SELECT 'CIO'
          FROM DUAL
        UNION ALL
        SELECT 'CDO'
          FROM DUAL
        UNION ALL
        SELECT 'COO'
          FROM DUAL
        UNION ALL
        SELECT 'CMO'
          FROM DUAL
        UNION ALL
        SELECT 'CSO'
          FROM DUAL
        UNION ALL
        SELECT 'CNSO'
          FROM DUAL
        UNION ALL
        SELECT 'CCSO'
          FROM DUAL
        UNION ALL
        SELECT 'Dir'
          FROM DUAL
        UNION ALL
        SELECT 'SDir'
          FROM DUAL
        UNION ALL
        SELECT 'VP'
          FROM DUAL
        UNION ALL
        SELECT 'SVP'
          FROM DUAL;*/
    
    /*else
    
      OPEN O_CUR_ROLE FOR
        SELECT 'Role'
          FROM DUAL
        UNION ALL
        SELECT 'CEO'
          FROM DUAL
        UNION ALL
        SELECT 'CFO'
          FROM DUAL
        UNION ALL
        SELECT 'CIO'
          FROM DUAL
        UNION ALL
        SELECT 'CDO'
          FROM DUAL
        UNION ALL
        SELECT 'COO'
          FROM DUAL
        UNION ALL
        SELECT 'CMO'
          FROM DUAL
        UNION ALL
        SELECT 'CSO'
          FROM DUAL
        UNION ALL
        SELECT 'NON CXO'
          FROM DUAL
        UNION ALL
        SELECT 'Others'
          FROM DUAL;*/
    End if;
  
    /*OPEN O_CUR_STAGE FOR
    
      SELECT 'Sales Stage'
        FROM DUAL
      UNION ALL
      SELECT '00 - Suspecting'
        FROM DUAL
      UNION ALL
      SELECT '01 - Prospecting'
        FROM DUAL
      UNION ALL
      SELECT '02 - EOI/RFI in progress'
        FROM DUAL
      UNION ALL
      SELECT '03 - EOI/RFI Submitted'
        FROM DUAL
      UNION ALL
      SELECT '04 - RFP/Proposal in progress'
        FROM DUAL
      UNION ALL
      SELECT '05 - RFP Submitted'
        FROM DUAL
      UNION ALL
      SELECT '06 - Short Listed'
        FROM DUAL
      UNION ALL
      SELECT '07 - Selected'
        FROM DUAL
      UNION ALL
      SELECT '08 - Contract Negotiation'
        FROM DUAL
      UNION ALL
      SELECT '09 - Closed/WON'
        FROM DUAL;*/
  
  END;
 procedure SP_UPLOAD_STATUS_MAIL_BTG(I_EMP_ID  IN NUMBER,
                                        I_ISU_ID  IN NUMBER,
                                        I_OTHERS  IN VARCHAR2, ---week/month#date
                                        I_ALERT#  IN NUMBER, ----468---422(PROD) 
                                        O_MESSAGE OUT VARCHAR2) IS
  V_ISU_CNT     NUMBER;
  V_SYSDATE     DATE;
  V_SUBJECT     VARCHAR2(1000);
  V_BODY        VARCHAR2(1000);
  V_DEAR        VARCHAR2(200);
  V_MAIN_BODY   CLOB;
  V_THANKS      VARCHAR2(2000);
  V_FILE_DATE   VARCHAR2(200);
  V_SYS_DATE    VARCHAR2(1000);
  V_CURR_QTR    VARCHAR2(1000);
  V_CURR_MONTH  DATE;
  V_SYSDATE     varchar2(400); --DATE;
  V_LAST_WEEK   varchar2(400); --DATE;
  V_GRID_HEADER CLOB;
  V_WHOLE_GRID  CLOB;
  V_GRID_DATA   CLOB;
  V_GRID        CLOB;
  V_DATA_CUR    SYS_REFCURSOR;
  V_REP_DATA    VARCHAR2(4000);
  V_COL1        VARCHAR2(4000);
  V_COL2        VARCHAR2(4000);
  V_COL3        VARCHAR2(4000);
  V_COL4        VARCHAR2(4000);
  V_COL5        VARCHAR2(4000);
  V_COL6        VARCHAR2(4000);
  V_COL7        VARCHAR2(4000);
  V_COL8        VARCHAR2(4000);
  V_COL9        VARCHAR2(4000);
  V_COL10       VARCHAR2(4000);
  V_COL11       VARCHAR2(4000);
  V_COL12       VARCHAR2(4000);
  V_COL13       VARCHAR2(4000);
  V_COL14       VARCHAR2(4000);

  QRY           LONG;
  V_LP          NUMBER;
  V_MONDAY_DATE VARCHAR2(1000);
  V_TIME        NUMBER;
  V_TO          VARCHAR2(4000);
  V_CC          VARCHAR2(4000);
  V_FROM        VARCHAR2(4000);
  V_CNT         NUMBER;
  V_ALERT_CNT   NUMBER;

  V_ISU_COND VARCHAR2(4000);

  V_OH_NAME     VARCHAR2(4000);
  V_PL_NAME     VARCHAR2(4000);
  V_FILE_DATE_1 VARCHAR2(100);
  V_EXTRA       VARCHAR2(100);

  V_SMP_MAIL       VARCHAR2(4000);
  V_OH_MAIL        VARCHAR2(4000);
  V_PL_HEAD_EMAIL  VARCHAR2(4000);
  V_PL_HEAD_NAME   VARCHAR2(4000);
  V_PL_HEAD_NAME_1 VARCHAR2(4000);
  V_ISU_ID         NUMBER;
  V_OTHERS         VARCHAR2(1000);

  V_FIRST_5 varchar2(1000);
  V_FIRST_4 varchar2(1000);
  V_FIRST_3 varchar2(1000);
  V_FIRST_2 varchar2(1000);
  V_FIRST_1 varchar2(1000);
  V_last_5  varchar2(1000);
  V_LAST_4  varchar2(1000);
  V_LAST_3  varchar2(1000);
  V_LAST_2  varchar2(1000);
  V_LAST_1  varchar2(1000);
  V_COND    VARCHAR2(1000);
  V_COND_1  VARCHAR2(1000);
  QRY_1     VARCHAR2(1000);
  V_DATE_5  VARCHAR2(1000);
  V_DATE_1  VARCHAR2(1000);

  V_DATE_2 VARCHAR2(1000);
  V_DATE_3 VARCHAR2(1000);
  V_DATE_4 VARCHAR2(1000);
  V_COND_2 VARCHAR2(1000);
  V_CUR_1  SYS_REFCURSOR;
  v_month  varchar2(1000);
  V_COND_6 varchar2(1000);
  V_COND_7 varchar2(1000);
  V_COND_8 varchar2(1000);
  V_COL_12_1  varchar2(1000);
  V_COL_5_1 varchar2(1000);
  
  V_DATE_11 VARCHAR2(1000);
  V_DATE_12 VARCHAR2(1000);
  V_DATE_13 VARCHAR2(1000);
  V_DATE_14 VARCHAR2(1000);
  V_DATE_15 VARCHAR2(1000);
  

BEGIN
  IF I_ALERT# = 468 THEN
  
    DELETE FROM ALERT_EMAIL_OUTBOX
     WHERE ALERT_ID = I_ALERT#
       AND STATUS = 'NEW';
    COMMIT;
  
    SELECT Q'<'>' || REPLACE(I_OTHERS, '#', Q'<'>' || ',' || Q'<'>') ||
            Q'<'>'
      INTO V_OTHERS
      FROM DUAL;
  
    QRY := 'SELECT  ' || V_OTHERS || ' FROM DUAL';
  
    EXECUTE IMMEDIATE QRY
      INTO v_extra, V_FILE_DATE_1;
      
      
      
      
      INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
      VALUES
        (I_EMP_ID,
         SYSDATE,
         'PKG_BTG_WSR_DOWNLOAD.SP_BTG_DEFAULTER_MAIL',
         I_EMP_ID||'-'||I_ISU_ID||'-'||I_OTHERS||'-'||I_ALERT#,
         '',
         I_ISU_ID,
         '');
    
      COMMIT;
  
    IF I_ISU_ID <> 0 THEN
      V_ISU_COND := 'in ( select distinct ACCOUNT_ID from NEW_BTG_ACCOUNT_MAPPING where iou_id =  ' ||
                    I_ISU_ID || ')';
      select OH_EMAIL, SMP_EMAIL, PL_HEAD_EMAIL
        into V_TO, V_SMP_MAIL, V_PL_HEAD_EMAIL
        from mapping_mail_details_wsr_btg
       where iou_id = I_ISU_ID;
    
      select OH_NAME, PL_HEAD_NAME
        into V_OH_NAME, V_PL_HEAD_NAME
        from mapping_mail_details_wsr_btg
       where iou_id = I_ISU_ID;
      V_DEAR := '<HTML><BODY><FONT face="Calibri" > Dear ' || V_OH_NAME ||
                V_PL_HEAD_NAME_1 || ',' || '<BR><BR>';
    ELSE
    
      V_DEAR     := '<HTML><BODY><FONT face="Calibri" > Dear All ,<BR><BR>';
      V_ISU_COND := '= T.ACCOUNT_ID';
    END IF;
  
    PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(V_FILE_DATE_1,
                                                     'DD/MM/RRRR'),
                                             V_FILE_DATE,
                                             V_CURR_MONTH,
                                             V_CURR_QTR);
  
    ---------Interval changed on 15/07/2019 by 974742-------------
    SELECT TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE, 'DD-MON-RR')) - INTERVAL '3' DAY,
                   'dd-Mon-YYYY') AS PREV_THURSDAY,
           TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE, 'DD-MON-RR')) + INTERVAL '3' DAY,
                   'dd-Mon-YYYY') AS NEXT_WED
      INTO V_LAST_WEEK, V_SYS_DATE
      FROM DUAL;
  
    QRY := 'SELECT TO_DATE(''' || V_FILE_DATE ||
           ''',''DD-MON-RRRR'')+1||'' 08.00.00.000000 PM'' FROM DUAL';
    EXECUTE IMMEDIATE QRY
      INTO V_MONDAY_DATE;
  
    IF V_PL_HEAD_EMAIL IS NOT NULL THEN
      V_TO := V_TO || ',' || V_PL_HEAD_EMAIL;
    END IF;
  
    if V_PL_HEAD_NAME is NULL then
      V_OH_NAME        := V_OH_NAME || ',';
      V_PL_HEAD_NAME_1 := ' ';
    else
      V_PL_HEAD_NAME_1 := '/' || V_PL_HEAD_NAME || ',';
      V_OH_NAME        := V_OH_NAME;
    end if;
  
    IF I_ISU_ID <> 0 THEN
    
      V_DEAR := '<HTML><BODY><FONT face="Calibri" > Dear ' || V_OH_NAME ||
                V_PL_HEAD_NAME_1 || '<BR><BR>';
    ELSE
    
      V_DEAR := '<HTML><BODY><FONT face="Calibri" > Dear All ,<BR><BR>';
    
    END IF;
  
    IF upper(V_EXTRA) = 'WEEK' THEN
    
      V_SUBJECT := 'WSR Submission status: Week of <DATE1> to <DATE>';
    
      V_SUBJECT := FN_MULTIPLE_REPLACE(V_SUBJECT,
                                       NEW T_TEXT('<DATE>', '<DATE1>'),
                                       NEW T_TEXT(V_SYS_DATE, V_LAST_WEEK));
    
      v_BODY := 'Please find the attached WSR Submission status for the week of ' ||
                V_LAST_WEEK || ' to ' || V_SYS_DATE || ' <br>

<CENTER><BR><BR>';
      IF I_ISU_ID = 0 THEN
        V_GRID_HEADER := '<div style="">
   <table style=" border-collapse:collapse;">
  <tr style=''color:WHITE ; background: #5898D0;''>
               
               <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>File Uploaded Status</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Uploaded Date</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Submitted Status</th>
                <TH colspan="1" style="background:white" ></TH>
                <TH colspan="1" style="background:white" ></TH>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>File Uploaded Status</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Uploaded Date</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Submitted Status</th>
            </tr>';
      ELSIF I_ISU_ID <> 0 THEN
        V_GRID_HEADER := '<div style="">
   <table style=" border-collapse:collapse;">
  <tr style=''color:WHITE ; background: #5898D0;''>
               
               <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>File Uploaded Status</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Uploaded Date</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Submitted Status</th>
              
             </tr>';
      END IF;
    
      QRY := 'select a.short_name, a.status,a.uploaded_date,a.cn,a.freeze,'','','','',b.short_name,b.status,b.uploaded_date,b.cn,b.freeze from
(( select * from (select  rownum rn , short_name, status,uploaded_date,cn,freeze from (SELECT  
           distinct A.short_name,
           DECODE(T.file_uploaded,''N'',''Not Uploaded'',''Y'',''Uploaded'') status,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-Mon-RRRR'')uploaded_date,
           ''&#9873;'' cn,
          CASE WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE <=''' ||
             V_MONDAY_DATE ||
             ''' THEN
                          ''GREEN''
                          WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE >=''' ||
             V_MONDAY_DATE || ''' THEN
                          ''GREEN''
                          ELSE
                           ''RED''
           END FREEZE
  FROM WKLY_REP_FRZ_UNFRZ_BTG T,NEW_BTG_ACCOUNT_MAPPING A
 WHERE T.FILE_DATE = ''' || V_FILE_DATE || '''
 --AND T.ISU_ID <> 263
 AND A.IOU_ID = T.ISU_ID
 AND A.SUB_IOU_ID = T.SUB_ISU_ID
 AND A.ACCOUNT_ID ' || V_ISU_COND || '
 
 --AND A.ACCOUNT_ID  in ( select distinct ACCOUNT_ID from WKLY_REP_FRZ_UNFRZ_BTG where iou_id =  ''' ||
             I_ISU_ID || ''')
  ORDER BY short_name asc)) where rn <= 15 )a
 full outer join
 
 (select rn - 15 rn , short_name, status,uploaded_date,cn,freeze from (select  rownum rn , short_name, status,uploaded_date,cn,freeze from (SELECT  
           distinct A.short_name,
           DECODE(T.file_uploaded,''N'',''Not Uploaded'',''Y'',''Uploaded'') status,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-Mon-RRRR'')uploaded_date,
           ''&#9873;'' cn,
          CASE WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE <=''' ||
             V_MONDAY_DATE ||
             ''' THEN
                          ''GREEN''
                          WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE >=''' ||
             V_MONDAY_DATE || ''' THEN
                          ''GREEN''
                          ELSE
                           ''RED''
           END FREEZE
  FROM WKLY_REP_FRZ_UNFRZ_BTG T,NEW_BTG_ACCOUNT_MAPPING A
 WHERE T.FILE_DATE = ''' || V_FILE_DATE || '''
 --AND T.ISU_ID <> 263
 AND A.IOU_ID = T.ISU_ID
 AND A.SUB_IOU_ID = T.SUB_ISU_ID
 AND A.ACCOUNT_ID ' || V_ISU_COND || '
 --AND A.ACCOUNT_ID in ( select distinct ACCOUNT_ID from WKLY_REP_FRZ_UNFRZ_BTG where iou_id = ' ||
             I_ISU_ID || ')
  ORDER BY short_name asc)) where rn >= 16 )b
  on a.rn = b.rn
) 
   ';
    
      /*  QRY:='select  short_name, status,uploaded_date,cn,freeze from (SELECT  
                distinct A.short_name,
                DECODE(T.file_uploaded,''N'',''Not Uploaded'',''Y'',''Uploaded'') status,
                TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-Mon-RRRR'')uploaded_date,
                ''&#9873;'' cn,
               CASE WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE <='''||V_MONDAY_DATE||''' THEN
                               ''GREEN''
                               WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE >='''||V_MONDAY_DATE||''' THEN
                               ''GREEN''
                               ELSE
                                ''RED''
                END FREEZE
       FROM WKLY_REP_FRZ_UNFRZ_BTG T,NEW_BTG_ACCOUNT_MAPPING A
      WHERE T.FILE_DATE = '''||V_FILE_DATE||'''
      AND T.ISU_ID <> 263
      AND T.ACCOUNT_ID IN (5587,5600,5601,5602,5603,5698,5699,5592)
      AND A.IOU_ID = T.ISU_ID
      AND A.SUB_IOU_ID = T.SUB_ISU_ID
      AND A.ACCOUNT_ID = T.ACCOUNT_ID
      )
       ORDER BY short_name asc';*/
    
      delete from hd_dummy;
      insert into hd_dummy values (qry);
      commit;
    
      OPEN V_DATA_CUR FOR QRY;
    
      --  V_LP:=0; 
    
      LOOP
      
        FETCH V_DATA_CUR
          INTO V_COL1,
               V_COL2,
               V_COL3,
               V_COL4,
               V_COL5,
               V_COl6,
               V_COl7,
               V_COl8,
               V_COL9,
               V_COL10,
               V_COL11,
               V_COL12;
        EXIT WHEN V_DATA_CUR%NOTFOUND;
      
        /* IF V_LP=0 THEN
        
        V_GRID_DATA := '<tr style=''color:black;''>
                     <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||V_COL1|| '</td>
                     <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||V_COL2 || '</td>
                     <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||V_COL3 || '</td>
                     <td ALIGN=''CENTER'' style=''color:'||V_COL5||';font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''><b>' ||V_COL4 || '</b></td>
                     </tr>';
        V_whole_grid:=V_GRID_DATA;
        
        ELSE*/
      
        V_GRID_DATA  := '<tr style=''color:black;''>
                        <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||
                        V_COL1 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||
                        V_COL2 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||
                        V_COL3 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                        V_COL5 ||
                        ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                        V_COL4 ||
                        '</b></td>
                        <td colspan="1" ></td>
                        <td colspan="1" ></td>
                        <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||
                        V_COL8 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||
                        V_COL9 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||
                        V_COL10 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                        V_COL12 ||
                        ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                        V_COL11 || '</b></td>
                        
                        </tr>';
        V_whole_grid := V_whole_grid || V_GRID_DATA;
      
        --END IF;
      
        --V_LP:=V_LP+1;
      
      END LOOP;
      CLOSE V_DATA_CUR;
      DELETE FROM X_TST;
      COMMIT;
      INSERT INTO X_TST VALUES (V_whole_grid);
      COMMIT;
    
      -- V_REGARDS:='ISU HEAD';
      V_THANKS := '<br></center><font face="Calibri" style=''font-size: 15px;''>Best Regards <BR>
                      ISOMetrix
                      <BR><br>
                      <I> *This is a system generated m
                      ail. Do not reply to this mail.</I>
                      <br></body></font></html>';
    
      -----DEAR + BODY + THANKS
      --V_MAIN_BODY := V_DEAR || V_BODY || V_THANKS;
    
      V_GRID := '<!DOCTYPE html>
               <html>
               <head>
               <meta charset="UTF-8">
                </head>
               <style>
              
                    .space {
                        width: 1px !important;
                    }
                </style>
            <body>    
            <font style="font-family:Cambria;" size="1">
             <table style=''width:550px; height:0px;'' cellspacing=0>
                  <tr>
                  <td style=''color:green;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">Submitted On Time</font></td>
                 <!-- <td style=''color:orange;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">Submitted after Monday 06.00 PM</font></td>-->
                  <td style=''color:red;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">Not Submitted</font></td>
                  </tr>
                  </table><br><br>
                    <!--<table style=''width:650px; height:0px;'' cellspacing=0>-->
                ' || V_GRID_HEADER || '
                ' || V_WHOLE_GRID || '
              </table><br>';
    
      ----------------------------------------------------------------------------------------
    
      V_MAIN_BODY := V_DEAR || V_BODY || V_GRID || V_THANKS;
    
      SELECT SUBSTR(to_char(sysdate, 'hh24:mi:ss'), 1, 2)
        INTO V_TIME
        from dual;
    
      V_CC := 'sameer.asiddiqui@tcs.com,mayur.mahajan@tcs.com' || ',' ||
              V_SMP_MAIL;
    
      IF I_ISU_ID IS NULL OR I_ISU_ID = 0 THEN
        V_TO := 'd.chopra@tcs.com,mayur.mahajan@tcs.com';
        V_CC := 'mathews.koshy@tcs.com,alex.duraisamy@tcs.com';
      END IF;
    
      V_TO := 'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com';
      V_CC := 'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com';
      ------------------------------     
    ELSIF UPPER(V_EXTRA) = 'MONTH' THEN
      V_TO := 'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com';
      V_CC := 'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com';
    
      SELECT count(week_id)
        INTO V_CNT
        FROM WSR_CALENDAR
      
       where to_char(to_date(V_FILE_DATE_1, 'dd/mM/yyyy'), 'mm') = month;
    
      IF V_CNT = 5 THEN
        V_COND_2 := ' IN (1,2,3,4,5)';
      ELSIF V_CNT = 4 THEN
        V_COND_2 := ' IN (1,2,3,4)';
      END IF;
    
      QRY_1 := 'SELECT *  FROM (SELECT FILE_DATE,ROWNUM RN FROM
  (SELECT FILE_DATE FROM (SELECT DISTINCT  FILE_DATE,WEEK_ID 
 FROM  WSR_CALENDAR where 
to_char(to_date(''' || V_FILE_DATE_1 || ''',''DD/MM/YYYY''),''mm'') = month ) ORDER BY WEEK_ID)) PIVOT(MAX(FILE_DATE)
 FOR RN ' || V_COND_2 || ')';
    
      IF V_CNT = 5 THEN
        OPEN V_CUR_1 FOR QRY_1;
      
        LOOP
          FETCH V_CUR_1
            INTO V_DATE_1, V_DATE_2, V_DATE_3, V_DATE_4, V_DATE_5;
          EXIT WHEN V_CUR_1% NOTFOUND;
        
        END LOOP;
        CLOSE V_CUR_1;
      ELSIF V_CNT = 4 THEN
      
        OPEN V_CUR_1 FOR QRY_1;
      
        LOOP
          FETCH V_CUR_1
            INTO V_DATE_1, V_DATE_2, V_DATE_3, V_DATE_4;
        
          EXIT WHEN V_CUR_1% NOTFOUND;
        
        END LOOP;
        CLOSE V_CUR_1;
      END IF;
      
    -- V_DATE_11 = 
SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_1, 'DD-MON-RR')) + INTERVAL '7' DAY,
                   'dd-Mon-YYYY') AS PREV_THURSDAY INTO V_DATE_11 FROM DUAL;
                   
 SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_2, 'DD-MON-RR')) + INTERVAL '7' DAY,
                   'dd-Mon-YYYY') AS PREV_THURSDAY INTO V_DATE_12 FROM DUAL;                  
                   
                   
                   
                   
SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_3, 'DD-MON-RR')) + INTERVAL '7' DAY,
                   'dd-Mon-YYYY') AS PREV_THURSDAY INTO V_DATE_13 FROM DUAL;
SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_4, 'DD-MON-RR')) + INTERVAL '7' DAY,
                   'dd-Mon-YYYY') AS PREV_THURSDAY INTO V_DATE_14 FROM DUAL;
SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_5, 'DD-MON-RR')) + INTERVAL '7' DAY,
                   'dd-Mon-YYYY') AS PREV_THURSDAY INTO V_DATE_15 FROM DUAL;     
      
    
      IF V_CNT = 5 THEN
      
        V_COND := ' (SELECT DISTINCT ACCOUNT_ID,Case 
  WHEN m_freeze_flag = ''N'' THEN ''RED''
    
    when m_freeze_flag = ''Y'' AND FREEZED_DATE >=''' || V_DATE_15 || ''' THEN   ''orange''
      when m_freeze_flag =''Y'' THEN ''GREEN''
       ELSE 
        ''GREY''
    END M_FREEZE_FLAG FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_5 || ''')s
  
  
  on k.account_id = s.account_id ';
      
        V_COND_1 := ',s.m_freeze_flag week5';
        V_COND_6 := ',WEEK5';
        V_COND_7 := ',Z.WEEK5';
        V_COND_8 := ',Y.WEEK5';
      
      ELSIF V_CNT = 4 THEN
        V_COND := '';
      
        V_COND_1 := '';
      END IF;
      
    
      select SUBSTR(TO_CHAR(TO_DATE(V_FILE_DATE_1, 'DD/MM/YYYY'), 'MONTH'),
                    1,
                    3)
        INTO V_MONTH
        from dual;
    
      SELECT WEEK_START, WEEK_END
        INTO V_FIRST_1, V_LAST_1
        FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
                FROM WSR_CALENDAR
               where to_char(to_date(V_FILE_DATE_1, 'DD/MM/YYYY'), 'mm') =
                     month)
       WHERE WEEK_ID = 1;
    
      SELECT WEEK_START, WEEK_END
        INTO V_FIRST_2, V_LAST_2
        FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
                FROM WSR_CALENDAR
               where to_char(to_date(V_FILE_DATE_1, 'DD/MM/YYYY'), 'mm') =
                     month)
       WHERE WEEK_ID = 2;
    
      SELECT WEEK_START, WEEK_END
        INTO V_FIRST_3, V_LAST_3
        FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
                FROM WSR_CALENDAR
               where to_char(to_date(V_FILE_DATE_1, 'DD/MM/YYYY'), 'mm') =
                     month)
       WHERE WEEK_ID = 3;
    
      SELECT WEEK_START, WEEK_END
        INTO V_FIRST_4, V_LAST_4
        FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
                FROM WSR_CALENDAR
               where to_char(to_date(V_FILE_DATE_1, 'DD/MM/YYYY'), 'mm') =
                     month)
       WHERE WEEK_ID = 4;
    
      IF V_CNT = 5 THEN
      
        SELECT WEEK_START, WEEK_END
          INTO V_FIRST_5, V_LAST_5
          FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
                  FROM WSR_CALENDAR
                 where to_char(to_date(V_FILE_DATE_1, 'DD/MM/YYYY'), 'mm') =
                       month)
         WHERE WEEK_ID = 5;
      END IF;
    
      v_BODY    := 'Please find the attached WSR Submission status for the month of ' ||
                   v_month || ' <br>
      <CENTER><BR><BR>';
      V_SUBJECT := 'WSR Submission status: Month  of <MONTH> ';
    
      --   V_SUBJECT := 'WSR Submission status: Week of <DATE1> to <DATE>';
    
      V_SUBJECT := FN_MULTIPLE_REPLACE(V_SUBJECT,
                                       NEW T_TEXT('<MONTH>'),
                                       NEW T_TEXT(V_MONTH));
    
      IF V_CNT = 4 THEN
        V_GRID_HEADER := '<div style="">
   <table style=" border-collapse:collapse;">
  <tr style=''color:WHITE ; background: #5898D0;''>
               
               <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK1(' || CHR(13) || v_first_1 || ' to ' ||
                         V_LAST_1 || ')' ||
                         '</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK2(' || CHR(13) || v_first_2 || ' to ' ||
                         V_LAST_2 || ')' ||
                         '</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK3(' || CHR(13) || v_first_3 || ' to ' ||
                         V_LAST_3 || ')' ||
                         '</th>
              <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK3(' || CHR(13) || v_first_4 || ' to ' ||
                         V_LAST_3 || ')' ||
                         '</th>

                <TH colspan="1" style="background:white" ></TH>
                <TH colspan="1" style="background:white" ></TH>
                 <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK1(' || CHR(13) || v_first_1 || ' to ' ||
                         V_LAST_1 || ')' ||
                         '</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK2(' || CHR(13) || v_first_2 || ' to ' ||
                         V_LAST_2 || ')' ||
                         '</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK3(' || CHR(13) || v_first_3 || ' to ' ||
                         V_LAST_3 || ')' ||
                         '</th>
              <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK4(' || CHR(13) || v_first_4 || ' to ' ||
                         V_LAST_4 || ')' || '</th>
            </tr>';
      
      ELSIF V_CNT = 5 THEN
        V_GRID_HEADER := '<div style="">
   <table style=" border-collapse:collapse;">
  <tr style=''color:WHITE ; background: #5898D0;''>
               
               <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK1(' || CHR(13) || v_first_1 || ' to ' ||
                         V_LAST_1 || ')' ||
                         '</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK2(' || CHR(13) || v_first_2 || ' to ' ||
                         V_LAST_2 || ')' ||
                         '</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK3(' || CHR(13) || v_first_3 || ' to ' ||
                         V_LAST_3 || ')' ||
                         '</th>
              <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK4(' || CHR(13) || v_first_4 || ' to ' ||
                         V_LAST_4 || ')' ||
                         '</th>
             <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK5(' || CHR(13) || v_first_5 || ' to ' ||
                         V_LAST_5 || ')' ||
                         '</th>


                <TH colspan="1" style="background:white" ></TH>
                <TH colspan="1" style="background:white" ></TH>
                 <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK1(' || CHR(13) || v_first_1 || ' to ' ||
                         V_LAST_1 || ')' ||
                         '</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK2(' || CHR(13) || v_first_2 || ' to ' ||
                         V_LAST_2 || ')' ||
                         '</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK3(' || CHR(13) || v_first_3 || ' to ' ||
                         V_LAST_3 || ')' ||
                         '</th>
              <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK4(' || CHR(13) || v_first_4 || ' to ' ||
                         V_LAST_4 || ')' ||
                         '</th>
             <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>' ||
                         'WEEK5(' || CHR(13) || v_first_5 || ' to ' ||
                         V_LAST_5 || ')' || '</th>

            </tr>';
      
      END IF;
    
      QRY := '



SELECT  Y.SHORT_NAME,Y.week1,Y.week2 ,Y.week3,
 Y.week4,Y.CN,'','','','', Z.SHORT_NAME,Z.week1,Z.week2 ,Z.week3,
 Z.week4,Z.CN FROM (SELECT * FROM (
SELECT rownum rn ,short_name, week1,week2 ,week3,
 week4,CN FROM (
select distinct  K.ACCOUNT_ID,
k.short_name SHORT_NAME ,

    a.m_freeze_flag WEEK1
 ,
   B.m_freeze_flag week2 ,
   D.m_freeze_flag week3,
   
f.m_freeze_flag week4   ,''&#9873;'' cn



  from 
new_btg_account_mapping k
left outer   join 
(SELECT DISTINCT ACCOUNT_ID,Case 
  WHEN m_freeze_flag = ''N'' THEN ''RED''
    when m_freeze_flag = ''Y'' AND FREEZED_DATE >='''||V_DATE_11||''' THEN   ''orange''
      when m_freeze_flag =''Y'' THEN ''GREEN''
       ELSE 
        ''GREY''
    END M_FREEZE_FLAG FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_1 || ''') a on 
  a.account_id = k.account_id
  
  left outer join 
  
  (SELECT DISTINCT ACCOUNT_ID,Case 
  WHEN m_freeze_flag = ''N'' THEN ''RED''
    when m_freeze_flag = ''Y'' AND FREEZED_DATE >=''' || V_DATE_12 || ''' THEN   ''orange''  
      when m_freeze_flag =''Y'' THEN ''GREEN''
    
      ELSE 
        ''GREY''
    END M_FREEZE_FLAG FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_2 || ''') b
   on k.account_id = b.account_id
   left outer join 
    (SELECT DISTINCT ACCOUNT_ID,Case 
  WHEN m_freeze_flag = ''N'' THEN ''RED''
    when m_freeze_flag = ''Y'' AND FREEZED_DATE >=''' || V_DATE_13 || ''' THEN   ''orange''
      when m_freeze_flag =''Y'' THEN ''GREEN''
       ELSE 
        ''GREY''
    END M_FREEZE_FLAG FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_3 || ''') d
  on k.account_id = d.account_id
  left outer join 
  (SELECT  DISTINCT ACCOUNT_ID,Case 
  WHEN m_freeze_flag = ''N'' THEN ''RED''
    when m_freeze_flag = ''Y'' AND FREEZED_DATE >=''' || V_DATE_14 || ''' THEN   ''orange''
      when m_freeze_flag =''Y'' THEN ''GREEN''
       ELSE 
        ''GREY''
    END M_FREEZE_FLAG FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_4 || ''') f 
  ON  k.account_id = F.account_id 
  
  
 
  order by short_name ASC )) WHERE rn <= 15 ) Y
  
  FULL OUTER JOIN 
 (SELECT  rn - 15 rn , short_name, week1,week2 ,week3,
 week4 ,CN FROM (
SELECT rownum rn ,short_name, week1,week2 ,week3,
 week4 ,CN FROM (
select distinct  K.ACCOUNT_ID,k.short_name SHORT_NAME ,
 a.m_freeze_flag WEEK1
 ,
   B.m_freeze_flag week2 ,
   D.m_freeze_flag week3,
   
f.m_freeze_flag week4  ,''&#9873;'' cn



  from 
new_btg_account_mapping k
left outer   join 
(SELECT DISTINCT ACCOUNT_ID,Case 
  WHEN m_freeze_flag = ''N'' THEN ''RED''
    when m_freeze_flag = ''Y'' AND FREEZED_DATE >='''||V_DATE_11||''' THEN   ''orange''
      when m_freeze_flag =''Y'' THEN ''GREEN''
       ELSE 
        ''GREY''
    END M_FREEZE_FLAG FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_1 || ''')  a on 
  a.account_id = k.account_id
  
  left outer join 
  
  (SELECT DISTINCT ACCOUNT_ID,Case 
  WHEN m_freeze_flag = ''N'' THEN ''RED''
    when m_freeze_flag = ''Y'' AND FREEZED_DATE >=''' || V_DATE_12 || ''' THEN   ''orange''
      when m_freeze_flag =''Y'' THEN ''GREEN''
       ELSE 
        ''GREY''
    END M_FREEZE_FLAG FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_2 || ''') b
   on k.account_id = b.account_id
   left outer join 
    (SELECT DISTINCT ACCOUNT_ID,Case 
  WHEN m_freeze_flag = ''N'' THEN ''RED''
    
    when m_freeze_flag = ''Y'' AND FREEZED_DATE >=''' || V_DATE_13 || ''' THEN   ''orange''
      when m_freeze_flag =''Y'' THEN ''GREEN''
       ELSE 
        ''GREY''
    END M_FREEZE_FLAG FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_3 || ''') d
  on k.account_id = d.account_id
  left outer join 
  (SELECT  DISTINCT ACCOUNT_ID,Case 
  WHEN m_freeze_flag = ''N'' THEN ''RED''
    when m_freeze_flag = ''Y'' AND FREEZED_DATE >=''' || V_DATE_14 || ''' THEN   ''orange''
      when m_freeze_flag =''Y'' THEN ''GREEN''
       ELSE 
        ''GREY''
    END M_FREEZE_FLAG FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_4 || ''') f 
  ON  k.account_id = F.account_id 
  
  
  
 
  order by short_name))  where rn >= 16 )Z
   on Y.rn = Z.rn 
  

  


  
';
    
      delete from hd_dummy;
      insert into hd_dummy values (qry);
      commit;
    
      IF V_CNT = 4 THEN
      
        OPEN V_DATA_CUR FOR QRY;
      
        --  V_LP:=0; 
        LOOP
        
          FETCH V_DATA_CUR
            INTO V_COL1,
                 V_COL2,
                 V_COL3,
                 V_COL4,
                 V_COL5,
                 V_COL_5_1,
                 V_COl6,
                 V_COl7,
                 V_COl8,
                 V_COL9,
                 V_COL10,
                 V_COL11,
                 V_COL12,
                 V_COL_12_1;
          EXIT WHEN V_DATA_CUR%NOTFOUND;
        
        
          V_GRID_DATA  := ' <tr style=''color:black;''>
          <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||
                        V_COL1 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL2 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_5_1 ||
                          '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL3 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_5_1 ||
                          '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL4 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_5_1 ||
                          '</td>

                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL5 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_5_1 ||
                          '</b></td>
                        <td colspan="1" ></td>
                        <td colspan="1" ></td>
                        
                        <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||
                        V_COL8 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL9 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_12_1 ||
                          '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL10 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_12_1 ||
                          '</td>
                      <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL11 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_12_1 ||
                          '</td>

                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL12 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_12_1 || '</b></td>
                        
                        </tr>';
          V_whole_grid := V_whole_grid || V_GRID_DATA;
        END LOOP;
        CLOSE V_DATA_CUR;
      
      ELSIF V_CNT = 5 THEN
        OPEN V_DATA_CUR FOR QRY;
      
        --  V_LP:=0; 
        LOOP
        
          FETCH V_DATA_CUR
            INTO V_COL1,
                 V_COL2,
                 V_COL3,
                 V_COL4,
                 V_COL5,
                 V_COl6,
                 V_COL_5_1,
                 V_COl7,
                 V_COl8,
                 V_COL9,
                 V_COL10,
                 V_COL11,
                 V_COL12,
                 V_COL13,
                 V_COL14,
                 V_COL_12_1;
          EXIT WHEN V_DATA_CUR%NOTFOUND;
        
          V_GRID_DATA  := ' <tr style=''color:black;''>
          <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||
                        V_COL1 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL2 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_5_1 ||
                          '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL3 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_5_1 ||
                          '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL4 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_5_1 ||
                          '</td>
                           <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL5 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_5_1 ||
                          '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL6 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_5_1 ||
                          '</b></td>
                          

                        <td colspan="1" ></td>
                        <td colspan="1" ></td>
                        <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||
                        V_COL9 ||
                        '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL10 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_12_1 ||
                          '</td>
                       <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL11 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_12_1 ||
                          '</td>
                      <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL12 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_12_1 ||
                          '</td>

                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL13 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_12_1 ||
                          '</td>
                        <td ALIGN=''CENTER'' style=''color:' ||
                          V_COL14 ||
                          ';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||
                          V_COL_12_1 || '</b></td>

                        
                        </tr>';
          V_whole_grid := V_whole_grid || V_GRID_DATA;
        END LOOP;
        CLOSE V_DATA_CUR;
      END IF;
    
      DELETE FROM X_TST;
      COMMIT;
      INSERT INTO X_TST VALUES (V_whole_grid);
      COMMIT;
    
      V_THANKS := '<br></center><font face="Calibri" style=''font-size: 15px;''>Best Regards <BR>
                      ISOMetrix
                      <BR><br>
                      <I> *This is a system generated m
                      ail. Do not reply to this mail.</I>
                      <br></body></font></html>';
    
      -----DEAR + BODY + THANKS
      --V_MAIN_BODY := V_DEAR || V_BODY || V_THANKS;
    
      V_GRID := '<!DOCTYPE html>
               <html>
               <head>
               <meta charset="UTF-8">
                </head>
               <style>
              
                    .space {
                        width: 1px !important;
                    }
                </style>
            <body>    
            <font style="font-family:Cambria;" size="1">
             <table style=''width:550px; height:0px;'' cellspacing=0>
                  <tr>
                  <td style=''color:green;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">Submitted On Time</font></td>
                  <td style=''color:orange;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">Submitted after sunday 06.00 AM</font></td>
                  <td style=''color:red;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">Not Submitted</font></td>
                    <td style=''color:grey;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">week yet to start</font></td>

                  </tr>
                  </table><br><br>
                    <!--<table style=''width:650px; height:0px;'' cellspacing=0>-->
                ' || V_GRID_HEADER || '
                ' || V_WHOLE_GRID || '
              </table><br>';
    
      ----------------------------------------------------------------------------------------
    
      V_MAIN_BODY := V_DEAR || V_BODY || V_GRID || V_THANKS;
    
    END IF;
    
    v_to := 'sokitha.k5@tcs.com,gopivenkatarajareddy.gundareedy@tcs.com';
    v_cc := 'sokitha.k5@tcs.com,gopivenkatarajareddy.gundareedy@tcs.com';
  
    INSERT INTO ALERT_EMAIL_OUTBOX
    VALUES
      (SEQ_EMAIL_OUTBOX.NEXTVAL,
       SYSDATE,
       I_ALERT#,
       'WSR Status',
       V_TO, -- '998643,1187385,485680',--'alex.duraisamy@tcs.com,mathews.koshy@tcs.com,hemanth.kumar@tcs.com,sreejith.pn@tcs.com',-- '145720,81566,102996,92304,106407,125849,110114,104210,104705,103640,800670',-- ,mathews.koshy@tcs.com,hemanth.kumar@tcs.com,sreejith.pn@tcs.com   'lawanya.3@tcs.com,lakshmi.eswaran1@tcs.com,prasad.hari4@tcs.com',--'1349644', --271042,--PRATHEEK 
       '', --V_EMAIL_ID,
       V_CC, -- 'alex.duraisamy@tcs.com', --V_CC_EMP_LIST
       '', --'', --'119060', --V_CC_EMAIL_ID
       'sokitha.k5@tcs.com,gopivenkatarajareddy.gundareedy@tcs.com', --V_BCC_EMP_LIST
       '', --V_BCC_EMAIL_ID
       V_SUBJECT,
       V_MAIN_BODY,
       '',
       'NEW',
       '',
       I_ISU_ID);
    COMMIT;
  
    O_MESSAGE := 'All Mail Sent';
  
  END IF;
end SP_UPLOAD_STATUS_MAIL_BTG;


  
 /*procedure SP_UPLOAD_STATUS_MAIL_BTG(I_EMP_ID  IN NUMBER,
                              I_ISU_ID  IN NUMBER,
                              I_OTHERS  IN VARCHAR2,
                              I_ALERT#  IN NUMBER,----468---422(PROD)
                              O_MESSAGE OUT VARCHAR2) IS
   V_ISU_CNT        NUMBER;
  V_SYSDATE          DATE;
  V_SUBJECT          VARCHAR2(1000);
  V_BODY             VARCHAR2(1000);
  V_DEAR             VARCHAR2(200);
  V_MAIN_BODY        CLOB;
  V_THANKS           VARCHAR2(2000);
  V_FILE_DATE        VARCHAR2(200);
  V_SYS_DATE         VARCHAR2(1000);
  V_CURR_QTR         VARCHAR2(1000);
  V_CURR_MONTH       DATE;
  V_SYSDATE          varchar2(400);--DATE;
  V_LAST_WEEK        varchar2(400);--DATE;
   V_GRID_HEADER      CLOB;
  V_WHOLE_GRID       CLOB;
  V_GRID_DATA        CLOB;
  V_GRID             CLOB;
   V_DATA_CUR         SYS_REFCURSOR;
  V_REP_DATA         VARCHAR2(4000);
  V_COL1             VARCHAR2(4000);
  V_COL2             VARCHAR2(4000);
  V_COL3             VARCHAR2(4000);
  V_COL4             VARCHAR2(4000);
  V_COL5             VARCHAR2(4000);
  V_COL6             VARCHAR2(4000);
  V_COL7             VARCHAR2(4000);
  V_COL8             VARCHAR2(4000);
  V_COL9             VARCHAR2(4000);
  V_COL10             VARCHAR2(4000);
  V_COL11             VARCHAR2(4000);
  V_COL12             VARCHAR2(4000);
  
  QRY                LONG;
  V_LP               NUMBER;
  V_MONDAY_DATE      VARCHAR2(1000);
  V_TIME             NUMBER;
  V_TO               VARCHAR2(4000);
  V_CC               VARCHAR2(4000);
  V_FROM             VARCHAR2(4000);
  V_CNT              NUMBER;
  V_ALERT_CNT        NUMBER;
  
  V_ISU_COND VARCHAR2(4000);
  
   V_OH_NAME  VARCHAR2(4000);
   V_PL_NAME VARCHAR2(4000);
  
  
  V_SMP_MAIL VARCHAR2(4000);
   V_OH_MAIL VARCHAR2(4000);
   V_PL_HEAD_EMAIL VARCHAR2(4000);
   V_PL_HEAD_NAME VARCHAR2(4000);
   V_PL_HEAD_NAME_1 VARCHAR2(4000);
   V_ISU_ID NUMBER;
BEGIN
  IF I_ALERT# = 468 THEN
  
    DELETE FROM ALERT_EMAIL_OUTBOX
     WHERE ALERT_ID = I_ALERT#
       AND STATUS = 'NEW';
    COMMIT;
    
   
    
    IF I_ISU_ID <>  0 
      THEN 
        V_ISU_COND := 'in ( select distinct ACCOUNT_ID from NEW_BTG_ACCOUNT_MAPPING where iou_id =  '||I_ISU_ID||')';
         select OH_EMAIL,SMP_EMAIL,PL_HEAD_EMAIL into V_TO,V_SMP_MAIL,V_PL_HEAD_EMAIL  from mapping_mail_details_wsr_btg  where iou_id = I_ISU_ID ;
     
       select OH_NAME,PL_HEAD_NAME into V_OH_NAME,V_PL_HEAD_NAME from mapping_mail_details_wsr_btg  where iou_id =I_ISU_ID ;
         V_DEAR := '<HTML><BODY><FONT face="Calibri" > Dear '||V_OH_NAME||V_PL_HEAD_NAME_1||','||'<BR><BR>';  
       ELSE
       
          V_DEAR := '<HTML><BODY><FONT face="Calibri" > Dear All ,<BR><BR>'; 
         V_ISU_COND := '= T.ACCOUNT_ID';
         END IF; 
    
    
 

  
  
      PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(I_OTHERS,'DD/MM/RRRR'),
                                               V_FILE_DATE,
                                               V_CURR_MONTH,
                                               V_CURR_QTR);
 
 ---------Interval changed on 15/07/2019 by 974742-------------
    SELECT TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE,'DD-MON-RR')) - INTERVAL '3' DAY,'dd-Mon-YYYY') AS PREV_THURSDAY,
                 TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE,'DD-MON-RR')) + INTERVAL '3' DAY,'dd-Mon-YYYY') AS NEXT_WED
       INTO V_LAST_WEEK,V_SYS_DATE
  FROM DUAL;
    
   QRY:='SELECT TO_DATE('''||V_FILE_DATE||''',''DD-MON-RRRR'')+1||'' 08.00.00.000000 PM'' FROM DUAL';
    EXECUTE IMMEDIATE QRY INTO V_MONDAY_DATE;
    
   
    
   IF V_PL_HEAD_EMAIL IS NOT NULL THEN
    V_TO:=V_TO||','||V_PL_HEAD_EMAIL;
    END IF;
    
    
    if V_PL_HEAD_NAME is  NULL 
      then 
        V_OH_NAME:= V_OH_NAME||',';
        V_PL_HEAD_NAME_1 :=' ';
        else 
   V_PL_HEAD_NAME_1 := '/'||V_PL_HEAD_NAME||',';
   V_OH_NAME := V_OH_NAME;
   end if;
   
    IF I_ISU_ID <>  0 
      THEN 
        
         V_DEAR := '<HTML><BODY><FONT face="Calibri" > Dear '||V_OH_NAME||V_PL_HEAD_NAME_1||'<BR><BR>';  
       ELSE
       
          V_DEAR := '<HTML><BODY><FONT face="Calibri" > Dear All ,<BR><BR>'; 
        
         END IF;
    
    V_SUBJECT := 'WSR Submission status: Week of <DATE1> to <DATE>';
  
    V_SUBJECT := FN_MULTIPLE_REPLACE(V_SUBJECT,
                                     NEW T_TEXT( '<DATE>','<DATE1>'),
                                     NEW T_TEXT(V_SYS_DATE,V_LAST_WEEK));
                                     
 
   
  
 
   
   
   
    v_BODY := 'Please find the attached WSR Submission status for the week of '||V_LAST_WEEK||' to '||V_SYS_DATE||' <br>

<CENTER><BR><BR>';
IF I_ISU_ID = 0 THEN 
  V_GRID_HEADER :='<div style="">
   <table style=" border-collapse:collapse;">
  <tr style=''color:WHITE ; background: #5898D0;''>
               
               <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>File Uploaded Status</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Uploaded Date</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Submitted Status</th>
                <TH colspan="1" style="background:white" ></TH>
                <TH colspan="1" style="background:white" ></TH>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>File Uploaded Status</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Uploaded Date</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Submitted Status</th>
            </tr>';
       ELSIF 
         I_ISU_ID <>0 THEN 
         V_GRID_HEADER :='<div style="">
   <table style=" border-collapse:collapse;">
  <tr style=''color:WHITE ; background: #5898D0;''>
               
               <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Account</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>File Uploaded Status</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Uploaded Date</th>
                <th  ALIGN=''CENTER'' style=''width: 150px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Submitted Status</th>
              
             </tr>';
             END IF;
            
            
    QRY:= 'select a.short_name, a.status,a.uploaded_date,a.cn,a.freeze,'','','','',b.short_name,b.status,b.uploaded_date,b.cn,b.freeze from
(( select * from (select  rownum rn , short_name, status,uploaded_date,cn,freeze from (SELECT  
           distinct A.short_name,
           DECODE(T.file_uploaded,''N'',''Not Uploaded'',''Y'',''Uploaded'') status,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-Mon-RRRR'')uploaded_date,
           ''&#9873;'' cn,
          CASE WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE <='''||V_MONDAY_DATE||''' THEN
                          ''GREEN''
                          WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE >='''||V_MONDAY_DATE||''' THEN
                          ''GREEN''
                          ELSE
                           ''RED''
           END FREEZE
  FROM WKLY_REP_FRZ_UNFRZ_BTG T,NEW_BTG_ACCOUNT_MAPPING A
 WHERE T.FILE_DATE = '''||V_FILE_DATE||'''
 --AND T.ISU_ID <> 263
 AND A.IOU_ID = T.ISU_ID
 AND A.SUB_IOU_ID = T.SUB_ISU_ID
 AND A.ACCOUNT_ID '||V_ISU_COND||'
 
 --AND A.ACCOUNT_ID  in ( select distinct ACCOUNT_ID from WKLY_REP_FRZ_UNFRZ_BTG where iou_id =  '''||I_ISU_ID||''')
  ORDER BY short_name asc)) where rn <= 15 )a
 full outer join
 
 (select rn - 15 rn , short_name, status,uploaded_date,cn,freeze from (select  rownum rn , short_name, status,uploaded_date,cn,freeze from (SELECT  
           distinct A.short_name,
           DECODE(T.file_uploaded,''N'',''Not Uploaded'',''Y'',''Uploaded'') status,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-Mon-RRRR'')uploaded_date,
           ''&#9873;'' cn,
          CASE WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE <='''||V_MONDAY_DATE||''' THEN
                          ''GREEN''
                          WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE >='''||V_MONDAY_DATE||''' THEN
                          ''GREEN''
                          ELSE
                           ''RED''
           END FREEZE
  FROM WKLY_REP_FRZ_UNFRZ_BTG T,NEW_BTG_ACCOUNT_MAPPING A
 WHERE T.FILE_DATE = '''||V_FILE_DATE||'''
 --AND T.ISU_ID <> 263
 AND A.IOU_ID = T.ISU_ID
 AND A.SUB_IOU_ID = T.SUB_ISU_ID
 AND A.ACCOUNT_ID '||V_ISU_COND||'
 --AND A.ACCOUNT_ID in ( select distinct ACCOUNT_ID from WKLY_REP_FRZ_UNFRZ_BTG where iou_id = '||I_ISU_ID||')
  ORDER BY short_name asc)) where rn >= 16 )b
  on a.rn = b.rn
) 
   ';        
            
            
            
            
            
  
 \*  QRY:='select  short_name, status,uploaded_date,cn,freeze from (SELECT  
           distinct A.short_name,
           DECODE(T.file_uploaded,''N'',''Not Uploaded'',''Y'',''Uploaded'') status,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-Mon-RRRR'')uploaded_date,
           ''&#9873;'' cn,
          CASE WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE <='''||V_MONDAY_DATE||''' THEN
                          ''GREEN''
                          WHEN T.FREEZE_FLAG =''Y'' AND T.FREEZED_DATE >='''||V_MONDAY_DATE||''' THEN
                          ''GREEN''
                          ELSE
                           ''RED''
           END FREEZE
  FROM WKLY_REP_FRZ_UNFRZ_BTG T,NEW_BTG_ACCOUNT_MAPPING A
 WHERE T.FILE_DATE = '''||V_FILE_DATE||'''
 AND T.ISU_ID <> 263
 AND T.ACCOUNT_ID IN (5587,5600,5601,5602,5603,5698,5699,5592)
 AND A.IOU_ID = T.ISU_ID
 AND A.SUB_IOU_ID = T.SUB_ISU_ID
 AND A.ACCOUNT_ID = T.ACCOUNT_ID
 )
  ORDER BY short_name asc';*\
   
   
    
   delete from hd_dummy;
   insert into hd_dummy values(qry);commit; 
   
  OPEN V_DATA_CUR FOR QRY;
       
  --  V_LP:=0; 
       
     LOOP
        
        FETCH V_DATA_CUR
          INTO V_COL1,V_COL2,V_COL3,
          V_COL4,V_COL5,V_COl6,V_COl7,V_COl8,V_COL9,V_COL10,V_COL11,V_COL12;
        EXIT WHEN V_DATA_CUR%NOTFOUND;
   
         \* IF V_LP=0 THEN
           
           V_GRID_DATA := '<tr style=''color:black;''>
                        <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||V_COL1|| '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||V_COL2 || '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||V_COL3 || '</td>
                        <td ALIGN=''CENTER'' style=''color:'||V_COL5||';font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''><b>' ||V_COL4 || '</b></td>
                        </tr>';
           V_whole_grid:=V_GRID_DATA;
           
           ELSE*\
           
          V_GRID_DATA :=  '<tr style=''color:black;''>
                        <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||V_COL1|| '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||V_COL2 || '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||V_COL3 || '</td>
                        <td ALIGN=''CENTER'' style=''color:'||V_COL5||';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||V_COL4 || '</b></td>
                        <td colspan="1" ></td>
                        <td colspan="1" ></td>
                        <td ALIGN=''LEFT'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>' ||V_COL8|| '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||V_COL9 || '</td>
                        <td ALIGN=''CENTER'' style=''font-size: 12px; height:25px; font-family: Calibri;font-weight: 300;''>' ||V_COL10 || '</td>
                        <td ALIGN=''CENTER'' style=''color:'||V_COL12||';height:25px; font-size: 12px;font-family: Calibri;font-weight: 300;''><b>' ||V_COL11 || '</b></td>
                        
                        </tr>';
           V_whole_grid:=V_whole_grid||V_GRID_DATA;
                           
           --END IF;
           
           --V_LP:=V_LP+1;
           
    END LOOP;
 CLOSE V_DATA_CUR;
    DELETE FROM X_TST;
    COMMIT;
    INSERT INTO X_TST VALUES (V_whole_grid);
    COMMIT;
  
    -- V_REGARDS:='ISU HEAD';
    V_THANKS := '<br></center><font face="Calibri" style=''font-size: 15px;''>Best Regards <BR>
                      ISOMetrix
                      <BR><br>
                      <I> *This is a system generated m
                      ail. Do not reply to this mail.</I>
                      <br></body></font></html>';
  
  
    -----DEAR + BODY + THANKS
    --V_MAIN_BODY := V_DEAR || V_BODY || V_THANKS;
    
     V_GRID := '<!DOCTYPE html>
               <html>
               <head>
               <meta charset="UTF-8">
                </head>
               <style>
              
                    .space {
                        width: 1px !important;
                    }
                </style>
            <body>    
            <font style="font-family:Cambria;" size="1">
             <table style=''width:550px; height:0px;'' cellspacing=0>
                  <tr>
                  <td style=''color:green;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">Submitted On Time</font></td>
                 <!-- <td style=''color:orange;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">Submitted after Monday 06.00 PM</font></td>-->
                  <td style=''color:red;font-size: 20px;font-family: Cambria, serif, EmojiFont;font-weight: 100;font-size: 15px;''>&#9873;&nbsp;&nbsp;<font color="black">Not Submitted</font></td>
                  </tr>
                  </table><br><br>
                    <!--<table style=''width:650px; height:0px;'' cellspacing=0>-->
                '|| V_GRID_HEADER ||'
                '|| V_WHOLE_GRID ||'
              </table><br>';
    
    ----------------------------------------------------------------------------------------
    --== PATCH
   -- V_GRID := '<br><img src=''cid:WSR''/><br>';
  
    -----DEAR + BODY + THANKS
  V_MAIN_BODY := V_DEAR || V_BODY  ||V_GRID || V_THANKS;
    
     SELECT SUBSTR(to_char(sysdate, 'hh24:mi:ss'),1,2) INTO V_TIME from dual;
 
 
\*SELECT COUNT(1) INTO V_ISU_CNT FROM (SELECT DISTINCT T.ISU_ID
FROM Wkly_Rep_Frz_Unfrz T WHERE T.FILE_DATE=V_FILE_DATE
AND T.FILE_UPLOADED='Y' AND T.FREEZE_FLAG='Y'); 



SELECT COUNT(1) INTO V_ALERT_CNT FROM ALERT_EMAIL_OUTBOX_HISTORY M WHERE M.ALERT_ID=422
AND Trunc(M.DATESTAMP)=Trunc(SYSDATE) AND Replace(M.SENDER_EMPLOYEE_ID,' ','')='Alex' AND M.STATUS='DELIVERED';

IF V_ALERT_CNT = 0 THEN

IF V_ISU_CNT<11 THEN  
     
IF V_TIME >= 15 AND V_TIME < 20 THEN
      
  
      
        V_TO   := 'premcharan.s@tcs.com,nandhini.thangavel1@tcs.com,nandhini.thangavel1@tcs.com';
        V_CC   := 'nandhini.thangavel1@tcs.com';
        V_FROM := 'WSR Status';
        
         
      
      
ELSIF V_TIME >= 20 and V_TIME <= 24 THEN

  \* V_TO :='ganesasubramanian.v@tcs.com,a.srivastava@tcs.com,abhijit.niyogi@tcs.com,cs.krishnan@tcs.com,r.reddy@tcs.com,ashish.khurana@tcs.com,pc.thomas@tcs.com,sowmya.rajagopalan@tcs.com,s.pradeep@tcs.com,rajesh.kannan@tcs.com,sudhakar.gudala@tcs.com';
    V_CC :='shankar.ns@tcs.com,mathews.koshy@tcs.com,hemanth.kumar@tcs.com,alex.duraisamy@tcs.com';
     V_FROM :='alex.duraisamy@tcs.com'; *\
     
        V_TO   := 'premcharan.s@tcs.com,nandhini.thangavel1@tcs.com';
        V_CC   := 'lakshmi.eswaran1@tcs.com,sruthi.balasubramanian@tcs.com';
        V_FROM := 'Alex';
        
ELSE
      
      \* V_TO :='alex.duraisamy@tcs.com,mathews.koshy@tcs.com,hemanth.kumar@tcs.com,sreejith.pn@tcs.com';
      V_CC:='';
      V_FROM :='WSR Status';*\
      
        V_TO   := 'premcharan.s@tcs.com,nandhini.thangavel1@tcs.com';
      
        V_FROM := 'TESTING'; 
END IF; 
            
      
ELSE
   
       V_TO   := 'premcharan.s@tcs.com,nandhini.thangavel1@tcs.com';
      
        V_FROM := 'Alex'; 
      
        
      
      END IF;
ELSE
        V_TO   := 'premcharan.s@tcs.com,nandhini.thangavel1@tcs.com';
      
        V_FROM := 'TESTING';
        
END IF;
  *\
  
    
   
      
 \*DELETE FROM ALERT_EMAIL_OUTBOX
     WHERE ALERT_ID = I_ALERT# 
       AND STATUS = 'NEW';
    COMMIT;
      
      SELECT COUNT(*)
      INTO V_CNT
      FROM ALERT_EMAIL_OUTBOX_HISTORY A
     WHERE A.ALERT_ID = 422
       AND A.STATUS = 'DELIVERED'
       AND TRUNC(A.DATESTAMP)=TRUNC(SYSDATE);*\
       
  V_CC:='sameer.asiddiqui@tcs.com,mayur.mahajan@tcs.com'||','||V_SMP_MAIL;
  
  IF I_ISU_ID IS NULL OR I_ISU_ID = 0 THEN
      V_TO:='d.chopra@tcs.com,mayur.mahajan@tcs.com';
         V_CC:='mathews.koshy@tcs.com,alex.duraisamy@tcs.com';
         END IF;
         
         
        V_TO := 'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com';
        V_CC := 'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com';
  
  
   
   INSERT INTO ALERT_EMAIL_OUTBOX
    VALUES
      (SEQ_EMAIL_OUTBOX.NEXTVAL,
       SYSDATE,
       I_ALERT#,
      'WSR Status',
    V_TO, -- '998643,1187385,485680',--'alex.duraisamy@tcs.com,mathews.koshy@tcs.com,hemanth.kumar@tcs.com,sreejith.pn@tcs.com',-- '145720,81566,102996,92304,106407,125849,110114,104210,104705,103640,800670',-- ,mathews.koshy@tcs.com,hemanth.kumar@tcs.com,sreejith.pn@tcs.com   'lawanya.3@tcs.com,lakshmi.eswaran1@tcs.com,prasad.hari4@tcs.com',--'1349644', --271042,--PRATHEEK 
       '', --V_EMAIL_ID,
   V_CC,  -- 'alex.duraisamy@tcs.com', --V_CC_EMP_LIST
       '',--'', --'119060', --V_CC_EMAIL_ID
     'g.nishashanthi@tcs.com,sruthi.balasubramanian@tcs.com,nandhini.thangavel1@tcs.com,gopivenkatarajareddy.gundareedy@tcs.com', --V_BCC_EMP_LIST
       '', --V_BCC_EMAIL_ID
       V_SUBJECT,
       V_MAIN_BODY,
       '',
       'NEW',
       '',
       I_ISU_ID);
    COMMIT;
  

    O_MESSAGE := 'All Mail Sent';
  
  END IF;
END SP_UPLOAD_STATUS_MAIL_BTG;*/ 

 
  
  
 procedure SP_BTG_DEFAULTER_MAIL(I_EMP_ID  IN NUMBER,
                              I_ISU_ID  IN NUMBER,                                                        
                             
                              I_OTHERS  IN VARCHAR2,
                              I_ALERT#  IN NUMBER,----612(LOCAL)
                              O_MESSAGE OUT VARCHAR2) IS

  V_SUBJECT          VARCHAR2(1000);
  V_BODY             VARCHAR2(1000);
  v_accnt_name varchar2(1000);
  V_DEAR             VARCHAR2(200);
  V_MAIN_BODY        LONG;
  V_THANKS           VARCHAR2(2000);
  V_FILE_DATE        VARCHAR2(200);
  V_SYS_DATE         VARCHAR2(1000);
  V_CURR_QTR         VARCHAR2(1000);
  V_CURR_MONTH       DATE;
  V_LAST_WEEK        VARCHAR2(400);--DATE;
  
  V_DATA_CUR         SYS_REFCURSOR;
  V_COL1             NUMBER;
  V_COL2             NUMBER;
  V_COL3             NUMBER;
  QRY                LONG;
  
  V_ISU_HEAD_NAME    VARCHAR2(4000);
  V_ISU_HEAD_ID      VARCHAR2(4000);
  V_CC               VARCHAR2(4000);
 /* V_ISU_HEAD_ID      NUMBER;
  V_CC               NUMBER;*/
  V_CNT              NUMBER;
  
BEGIN
  
INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
      VALUES
        (I_EMP_ID,
         SYSDATE,
         'PKG_BTG_WSR_DOWNLOAD.SP_BTG_DEFAULTER_MAIL',
         I_EMP_ID||'-'||I_ISU_ID||'-'||I_OTHERS||'-'||I_ALERT#,
         '',
         I_ISU_ID,
         '');
    
      COMMIT;
  
  IF I_ALERT# = 612 THEN
  
    DELETE FROM ALERT_EMAIL_OUTBOX
     WHERE ALERT_ID = I_ALERT#
       AND STATUS = 'NEW';
    COMMIT;
  
    PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(I_OTHERS,'DD/MM/RRRR'),
                                               V_FILE_DATE,
                                               V_CURR_MONTH,
                                               V_CURR_QTR);
 
 
    SELECT TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE,'DD-MON-RR')) - INTERVAL '3' DAY,'dd-Mon-YYYY') AS PREV_MONDAY,
                 TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE,'DD-MON-RR')) + INTERVAL '3' DAY,'dd-Mon-YYYY') AS NEXT_MON
       INTO V_LAST_WEEK,V_SYS_DATE
    FROM DUAL;
    
  
    V_SUBJECT := 'WSR Report Submission for the week <DATE1> to <DATE>';
  
    V_SUBJECT := FN_MULTIPLE_REPLACE(V_SUBJECT,
                                     NEW T_TEXT( '<DATE>','<DATE1>'),
                                     NEW T_TEXT(V_SYS_DATE,V_LAST_WEEK));
            
    QRY:= 'SELECT  DISTINCT T.ACCOUNT_ID
    FROM WKLY_REP_FRZ_UNFRZ_BTG T
   WHERE T.FILE_DATE = '''||V_FILE_DATE||'''
         AND T.FREEZE_FLAG = ''N'' 
         --AND T.FILE_UPLOADED = ''N''
        -- and t.isu_id <> 263
        ';
   
  OPEN V_DATA_CUR FOR QRY;
       
     LOOP
        
        FETCH V_DATA_CUR
          INTO V_COL1;
        EXIT WHEN V_DATA_CUR%NOTFOUND;
   
       V_CC:='';
       
  if V_COL1 <> 5592 then
              
    QRY := 'SELECT DISTINCT   listagg(INITCAP(T.EMP_NAME),''/'') within group (order by null)EMP_NAME,
listagg(INITCAP(T.email_address),'','') within group (order by null)email_address,unit_name
    FROM weekly_report_user_details_btg T 
              WHERE 
               T.UNIT_ID =(' || V_COL1 || ')
            and t.level_id = 7 
            and t.unit_id <> 5592  
            group by unit_name';      
            elsif V_COL1 = 5592 then
               QRY := 'SELECT DISTINCT   listagg(INITCAP(T.EMP_NAME),''/'') within group (order by null)EMP_NAME,
listagg(INITCAP(T.email_address),'','') within group (order by null)email_address,unit_name
    FROM weekly_report_user_details_btg T 
              WHERE 
               T.UNIT_ID =(' || V_COL1 || ')
            --and t.level_id = 6
           --and t.primary_secondary_flag = ''Y'' 
            group by unit_name';    
              
            
              end if;     
  
    EXECUTE IMMEDIATE QRY
      INTO V_ISU_HEAD_NAME,V_ISU_HEAD_ID,v_accnt_name;
      
   
     
     ---------------------------------------------------------
     
     ---------------------------------------------------------
     
  
     V_DEAR := '<html><body><font face="Calibri" >Dear '||V_ISU_HEAD_NAME||', <br><br>';
   
     V_BODY := 'We find that you have not yet submitted the WSR report for '||v_accnt_name||' for the current week <DATE1> to <DATE>.<br><br>
              Please submit it as soon as possible.<br> <br>';
     
     V_BODY := FN_MULTIPLE_REPLACE(V_BODY,
                                     NEW T_TEXT( '<DATE>','<DATE1>'),
                                     NEW T_TEXT(V_SYS_DATE,V_LAST_WEEK));
          
     V_THANKS := '<br>Best Regards<br>
                           BTG Operations.
                      <br><br>
                      <I> *This is a system generated mail. Do not reply to this mail.</I>
                      <br></font></body></html>';
  
     V_MAIN_BODY := V_DEAR || V_BODY || V_THANKS;
    
   
   
    INSERT INTO ALERT_EMAIL_OUTBOX
       VALUES
      (SEQ_EMAIL_OUTBOX.NEXTVAL,
       SYSDATE,
       I_ALERT#,
      'BTG Operations',
      'sokitha.k5@tcs.com,gopivenkatarajareddy.gundareedy@tcs.com,nandhini.thangavel1@tcs.com',
      --V_ISU_HEAD_ID,--'premcharan.s@tcs.com',-- V_ISU_HEAD_ID,--'premcharan.s@tcs.com,nandhini.thangavel1@tcs.com', 
       '', 
     '',--'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com',-- V_CC,--'sruthi.balasubramanian@tcs.com,lakshmi.eswaran1@tcs.com',
       '',
      'sokitha.k5@tcs.com,gopivenkatarajareddy.gundareedy@tcs.com', 
   --'g.nishashanthi@tcs.com,sruthi.balasubramanian@tcs.com,sokitha.k5@tcs.com,gopivenkatarajareddy.gundareedy@tcs.com,nandhini.thangavel1@tcs.com', --V_BCC_EMP_LIST
       '',
       V_SUBJECT,
       V_MAIN_BODY,
       '',
       'NEW',
       '',
       I_ISU_ID);
      COMMIT;
   
     --END IF;
     END LOOP;
     CLOSE V_DATA_CUR;
    
    O_MESSAGE := 'All Mail Sent';
    
    
  
  END IF;


  
end sp_btg_defaulter_mail;


 PROCEDURE SP_WKLY_GRID_BTG(I_LOGGED_EMP_ID IN NUMBER,
                       I_COORPORATE    IN VARCHAR2,
                       I_BU            IN VARCHAR2,
                       I_ISU           IN NUMBER,
                       I_CLUS_ID         IN NUMBER,
                       I_ACC            IN NUMBER,
                       I_DATE          IN  VARCHAR2,
                       O_HEADER        OUT SYS_REFCURSOR,
                       O_DATA          OUT SYS_REFCURSOR,
                       O_VAR_DATA      OUT VARCHAR2)
  IS
  QRY           CLOB;
  V_FILE_DATE   DATE;
  V_CURR_WEEK      VARCHAR2(1000);
  V_CURR_MONTH     VARCHAR2(1000);
 -- V_BU  VARCHAR2(1000);
 -- v_isu varchar2(1000);
  V_CURR_QTR       VARCHAR2(1000);
  V_SYS_DATE          varchar2(400);--DATE;
  V_LAST_WEEK        varchar2(400);--DATE;         
  V_W_START VARCHAR2(100);
  V_W_END VARCHAR2(1000);
  BEGIN
  
    INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
      VALUES
        (I_LOGGED_EMP_ID,
         SYSDATE,
         'PKG_WSR_UPLOAD.SP_WKLY_GRID',
         I_LOGGED_EMP_ID||'-I_LOGGED_EMP_ID '||I_COORPORATE||' -I_COORPORATE '||I_BU||'-I_BU '||I_ISU||'-I_ISU '||I_DATE||' -I_DATE',
         '',
         '',
         '');
    
      COMMIT;
      
    PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(I_DATE,'DD/MM/RRRR'),
                                               V_FILE_DATE,
                                               V_CURR_MONTH,
                                               V_CURR_QTR);

   
  PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TRIM(SYSDATE),
                                               V_CURR_WEEK,
                                               V_CURR_MONTH,
                                               V_CURR_QTR);
    
    
  
 
   SELECT TO_CHAR(TRUNC(NEXT_DAY(TO_DATE(V_FILE_DATE,'DD-MON-RR'), 'THU')) - INTERVAL '7' DAY,'DD/MM') AS PREV_MONDAY,
                 TO_CHAR(TRUNC(NEXT_DAY(TO_DATE(V_FILE_DATE,'DD-MON-RR'), 'THU')) - INTERVAL '1' DAY,'DD/MM') AS NEXT_MON
       INTO V_LAST_WEEK,V_SYS_DATE
  FROM DUAL;
    /*SELECT TO_CHAR(TRUNC(NEXT_DAY(TO_DATE(V_FILE_DATE,'DD-MON-RR'), 'TUE')) - INTERVAL '7' DAY,'DD/MM') AS PREV_MONDAY,
                 TO_CHAR(TRUNC(NEXT_DAY(TO_DATE(V_FILE_DATE,'DD-MON-RR'), 'TUE')) - INTERVAL '1' DAY,'DD/MM') AS NEXT_MON
       INTO V_LAST_WEEK,V_SYS_DATE
  FROM DUAL;*/
  
  
  SELECT TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE, 'DD-MON-RR')) + INTERVAL '2' DAY,
                 'dd-Mon-YYYY') AS PREV_THURSDAY
    INTO V_W_START
    FROM DUAL;

SELECT TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE, 'DD-MON-RR')) + INTERVAL '8' DAY,
                 'dd-Mon-YYYY') AS PREV_THURSDAY
    INTO V_W_END
    FROM DUAL;

   

     OPEN O_HEADER FOR
     select 'ACCOUNT ID' FROM DUAL 
     UNION ALL
    SELECT 'FREEZE/UNFREEZE' FROM DUAL
     UNION ALL
     SELECT 'Account Name' FROM DUAL
     UNION ALL
     SELECT 'File Uploaded Status' FROM DUAL
     UNION ALL
      SELECT 'Uploaded Date' FROM DUAL
     UNION ALL
      SELECT 'Submitted Status' FROM DUAL
      UNION ALL
      SELECT 'MAIL STATUS' FROM DUAL;
    /* UNION ALL
     SELECT 'ISU ID' FROM DUAL;*/
     
     /*IF I_BU = 0 and I_ISU = 0 THEN
       V_BU := '';
        v_isu := '';
    ELSIF I_BU = 0 and I_ISU <> 0 THEN  
        V_BU := '';
       v_isu := 'and I.ISU_ID = '''||i_isu||'''';  
     ELSIF I_BU IN (21,22) then
        if i_isu = 0  THEN
       V_BU := 'and I.BU# = '''||I_BU||'''';
       v_isu := '';
       elsif i_isu <> 0 then
          V_BU := 'and I.BU# = '''||I_BU||'''';
       v_isu := 'and I.ISU_ID = '''||i_isu||'''';
       end if;
     END IF;*/
    
   
     
 /*QRY :=' SELECT  DISTINCT  S.ACCOUNT_ID,T.FREEZE_FLAG,
          S.SHORT_NAME,
           DECODE(T.FILE_UPLOADED,''N'',''NOT UPLOADED'',''Y'',''UPLOADED''),
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-MON-RRRR''),
           T.FREEZE_FLAG,
           decode(A.STATUS,''DELIVERED'',''Y'',''N'')
       
  FROM WKLY_REP_FRZ_UNFRZ_BTG T, NEW_BTG_ACCOUNT_MAPPING S,alert_email_outbox A
 WHERE T.FILE_DATE = '''||V_FILE_DATE||'''
--    AND T.ISU_ID <> 263
     AND  T.ACCOUNT_ID = S.ACCOUNT_ID 
     AND S.ACCOUNT_ID = A.ISU_ID
     AND A.ALERT_ID = 613
     ORDER BY S.SHORT_NAME ASC ';*/
/* 
QRY := 'select * from (SELECT  DISTINCT  S.ACCOUNT_ID, T.FREEZE_FLAG,
         S.SHORT_NAME,
            DECODE(T.FILE_UPLOADED,''N'',''NOT UPLOADED'',''Y'',''UPLOADED'') FILE_UPLOADED,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-MON-RRRR'')   UPLOADED_DATE,
            T.FREEZE_FLAG Submitted_Status,
          
           decode(A.STATUS,''DELIVERED'',''Y'') MAIL_STATUS
          --''Y''
       
  FROM WKLY_REP_FRZ_UNFRZ_BTG T, NEW_BTG_ACCOUNT_MAPPING S,alert_email_outbox A
 WHERE T.FILE_DATE = '''||V_FILE_DATE||'''

     AND  T.ACCOUNT_ID = S.ACCOUNT_ID 
     AND S.ACCOUNT_ID = A.ISU_ID
   AND A.ALERT_ID = 613
    --AND DATESTAMP  >= '''||V_W_START||'''  AND  DATESTAMP <=  '''||V_W_END||''' 
  --   ORDER BY S.SHORT_NAME ASC 
     union all 
     
   select   DISTINCT  S.ACCOUNT_ID, T.FREEZE_FLAG,
          S.SHORT_NAME,
            DECODE(T.FILE_UPLOADED,''N'',''NOT UPLOADED'',''Y'',''UPLOADED'') FILE_UPLOADED,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-MON-RRRR'') UPLOADED_DATE,
            T.FREEZE_FLAG Submitted_Status,
          
          -- decode(A.STATUS,''DELIVERED'',''Y'',''N'')
         ''N'' MAIL_STATUS
       
  FROM WKLY_REP_FRZ_UNFRZ_BTG T, NEW_BTG_ACCOUNT_MAPPING S,alert_email_outbox A
 WHERE T.FILE_DATE = '''||V_FILE_DATE||'''

     AND  T.ACCOUNT_ID = S.ACCOUNT_ID 
     AND A.ISU_ID <> T.ACCOUNT_ID 
    AND S.ACCOUNT_ID NOT IN (SELECT  DISTINCT A.ISU_ID FROM alert_email_outbox A WHERE ALERT_ID = 613)
   AND A.ALERT_ID = 613)
   
     ORDER BY SHORT_NAME ASC';*/
     
     
     
     QRY := 'select * from (SELECT  DISTINCT  S.ACCOUNT_ID, T.FREEZE_FLAG,
         S.SHORT_NAME,
            DECODE(T.FILE_UPLOADED,''N'',''NOT UPLOADED'',''Y'',''UPLOADED'') FILE_UPLOADED,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-MON-RRRR'')   UPLOADED_DATE,
            T.FREEZE_FLAG Submitted_Status,
          
            decode(A.STATUS,''DELIVERED'',''Y'',''NEW'',''N'',''N'')  MAIL_STATUS
          --''Y''
       
  FROM WKLY_REP_FRZ_UNFRZ_BTG T, NEW_BTG_ACCOUNT_MAPPING S,(SELECT z.status,trim(REGEXP_SUBSTR( SUBSTR(MAIL_SUBJECT,16) 
, ''[^:]+'', 1, 1)) aC FROM
 ALERT_EMAIL_OUTBOX z WHERE ALERT_ID = 613 AND DATESTAMP  >= '''||V_W_START||'''  AND  DATESTAMP <=  '''||V_W_END||'''
  ) a 
 
  --alert_email_outbox A
 WHERE T.FILE_DATE = '''||V_FILE_DATE||'''
 
AND  T.ACCOUNT_ID = S.ACCOUNT_ID 
   AND S.short_name   = a.ac
   
   
   UNION ALL
   
   
   SELECT  DISTINCT  S.ACCOUNT_ID, T.FREEZE_FLAG,
         S.SHORT_NAME,
            DECODE(T.FILE_UPLOADED,''N'',''NOT UPLOADED'',''Y'',''UPLOADED'') FILE_UPLOADED,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-MON-RRRR'')   UPLOADED_DATE,
            T.FREEZE_FLAG Submitted_Status,
          
            decode(A.STATUS,''DELIVERED'',''Y'',''NEW'',''N'')  MAIL_STATUS
          --''Y''
       
  FROM WKLY_REP_FRZ_UNFRZ_BTG T, NEW_BTG_ACCOUNT_MAPPING S,(SELECT z.status,trim(REGEXP_SUBSTR( SUBSTR(MAIL_SUBJECT,16) 
, ''[^:]+'', 1, 1)) ac FROM
 ALERT_EMAIL_OUTBOX_HISTORY z WHERE ALERT_ID = 613 AND DATESTAMP  >= '''||V_W_START||'''  AND  DATESTAMP <=  '''||V_W_END||'''
  ) a 
 
  --alert_email_outbox A
 WHERE T.FILE_DATE = '''||V_FILE_DATE||'''
 
AND  T.ACCOUNT_ID = S.ACCOUNT_ID 
   AND S.short_name   = a.ac
   
   UNION ALL
     
   select   DISTINCT  S.ACCOUNT_ID, T.FREEZE_FLAG,
          S.SHORT_NAME,
            DECODE(T.FILE_UPLOADED,''N'',''NOT UPLOADED'',''Y'',''UPLOADED'') FILE_UPLOADED,
           TO_CHAR(TO_DATE(TRUNC(T.UPLOADED_DATE), ''DD-MON-RRRR''), ''DD-MON-RRRR'') UPLOADED_DATE,
            T.FREEZE_FLAG Submitted_Status,
          
        
         ''N'' MAIL_STATUS
       
  FROM WKLY_REP_FRZ_UNFRZ_BTG T, NEW_BTG_ACCOUNT_MAPPING S,alert_email_outbox A,alert_email_outbox_HISTORY T 
 WHERE T.FILE_DATE = '''||V_FILE_DATE||'''

     AND  T.ACCOUNT_ID = S.ACCOUNT_ID 
    
    AND S.SHORT_NAME  NOT IN (SELECT  DISTINCT trim(REGEXP_SUBSTR( SUBSTR(MAIL_SUBJECT,16) 
, ''[^:]+'', 1, 1)) FROM alert_email_outbox A WHERE ALERT_ID = 613
    AND  DATESTAMP  >= '''||V_W_START||'''  AND  DATESTAMP <=  '''||V_W_END||''')
    AND S.SHORT_NAME  NOT IN  (SELECT  DISTINCT trim(REGEXP_SUBSTR( SUBSTR(MAIL_SUBJECT,16) 
, ''[^:]+'', 1, 1)) FROM alert_email_outbox_HISTORY  A WHERE ALERT_ID = 613
  AND  DATESTAMP  >= '''||V_W_START||'''  AND  DATESTAMP <=  '''||V_W_END||''')
   AND A.ALERT_ID = 613)
   ORDER BY SHORT_NAME ASC 
   
   
  
  ';
  
     DELETE FROM X_TST_1; COMMIT;
     INSERT INTO X_TST_1 VALUES (QRY);
     COMMIT;

 OPEN O_DATA FOR QRY;

 O_VAR_DATA:='WSR Status Dashboard for the week of '||V_LAST_WEEK||' to '||V_SYS_DATE||'';
 
  END SP_WKLY_GRID_BTG;

PROCEDURE SP_BTG_SUBMISSION_MAIL(I_EMP_ID  IN NUMBER,
                              I_ISU_ID  IN NUMBER,                                                        
                             
                              I_OTHERS  IN VARCHAR2,
                              I_ALERT#  IN NUMBER,----613(LOCAL)
                              O_MESSAGE OUT VARCHAR2) is


   V_SUBJECT          VARCHAR2(1000);
   V_OPP               VARCHAR2(1000);
   V_DEL_EMAIL          VARCHAR2(1000);
    V_UNIT_CHK        NUMBER;
    V_COL_FORMULA_SUMMARY VARCHAR2(4000);
  V_BODY             VARCHAR2(1000);
  V_DEAR             VARCHAR2(200);
  V_SAL              VARCHAR2(600);
  V_C8               VARCHAR2(500);
  
  V_MAIN_BODY        clob;
  V_THANKS           VARCHAR2(2000);
  V_FILE_DATE        VARCHAR2(200);
  V_FILE_DATE1       VARCHAR2(400);
  V_SYS_DATE         VARCHAR2(1000);
  V_CURR_QTR         VARCHAR2(1000);
  V_EMP_NAME        VARCHAR2(1000);
  V_CURR_MONTH       DATE;
  V_LAST_WEEK        VARCHAR2(400);--DATE;
  V_CLUS_ID          NUMBER;
  V_ACCOUNT          NUMBER;
    V_DEL_CNT        NUMBER;
  V_DATA_CUR         SYS_REFCURSOR;
  V_TO              VARCHAR2(4000);
  V_SMP_EMAIL        VARCHAR2(4000);
  V_SMP_NAME           VARCHAR2(4000);
  V_CC_MAIL            VARCHAR2(4000);
   V_COL1             VARCHAR2(4000);
  V_COL2             VARCHAR2(4000);
  V_COL3              VARCHAR2(4000);
  V_COL4              VARCHAR2(4000);
  V_COL5              VARCHAR2(4000);
  V_COL6              VARCHAR2(4000);
  V_COL7              VARCHAR2(4000);
  V_COL8              VARCHAR2(4000);
  V_COL9              VARCHAR2(4000);
  V_COL10             VARCHAR2(4000);
  V_COL11             VARCHAR2(4000);
  V_OTHERS           VARCHAR2(4000);
   V_CURR_QTR1        VARCHAR2(4000);
     V_FREEZE             NUMBER;
  QRY                LONG;
  v_extra            VARCHAR2(4000);
  V_ISU_HEAD_NAME    VARCHAR2(4000);
   V_ACC_HEAD   VARCHAR2(4000);
    V_ACCOUNT_NAME    VARCHAR2(4000);
  V_ISU_HEAD_ID      VARCHAR2(4000);
  V_CC               VARCHAR2(4000);
  V_CNT              NUMBER;
  V_GRID_HEADER   LONG;
   V_CUR_QTR_PL    VARCHAR2(4000);
   V_PRV_QTR_PL    VARCHAR2(4000);
    
   V_CUR_QTR1       VARCHAR2(4000);
   V_PRV_QTR1       VARCHAR2(4000);
    V_PERIOD    DATE ;
     V_CNT1 NUMBER;
     V_CNT2 NUMBER;
  
   V_CUR_HDR  SYS_REFCURSOR ;
  V_CUR_DATA_TYPE SYS_REFCURSOR ;
  V_MSG  VARCHAR2(100);
  V_NO_OF_INDEX NUMBER ; 
  V_CUR_VAL   SYS_REFCURSOR;
  V_LP                 NUMBER;
  V_GRID_DATA  CLOB;
  V_PUTTING    VARCHAR2(4000);
  V_WHOLE_GRID  CLOB;
  V_TCV_COL  VARCHAR2(4000);
  V_GRID  CLOB;
  V_EXECUTIVE  VARCHAR2(4000);
    V_REP_DATA         CLOB;
      V_DATA             CLOB;
      V_LIST CLOB;
      V_CUR_DATA SYS_REFCURSOR;
      V_TABLE_CONTENT CLOB;
      V_COUNT  NUMBER;
      V_CUR_DATA1   SYS_REFCURSOR;
       v_bullet clob; 
       V_CUR_DATA_WINS SYS_REFCURSOR;
       V_CUR_DATA_LOSS  SYS_REFCURSOR;
        V_TABLE_CONTENT1 CLOB; v_bullet1 clob; 
            V_TABLE_CONTENT2 CLOB; v_bullet2 clob; 
            V_CUR_DATA_PIPE   SYS_REFCURSOR;
            
              V_TABLE_CONTENT3 CLOB; v_bullet3 clob; 
        
       
        V_C1             VARCHAR2(4000);
         V_C2             VARCHAR2(4000);
          V_C3             VARCHAR2(4000);
           V_C4             VARCHAR2(4000);
            V_C5             VARCHAR2(4000);
             V_C6             VARCHAR2(4000);
             V_C7             VARCHAR2(4000);
             V_CUR_DATA_SUMMARY   SYS_REFCURSOR;
             V_GC1    VARCHAR2(4000);
             V_ACCOUNT_USED  VARCHAR2(4000);
             V_SHORT  VARCHAR2(4000);
             V_FILE_PERIOD  DATE;
             O_FILE_NAME  VARCHAR2(4000);
             
             -------------------------------------
             V_PIPE_HTML_CHCK NUMBER ;
             V_WINS_HTML_CHCK NUMBER;
             V_LOSS_HTML_CHCK  NUMBER;
               V_DEAR_DYN   VARCHAR2(4000);
               V_SIGNATURE_EMP    VARCHAR2(4000);
              V_FROM_ID_SEND VARCHAR2(4000);
              V_WFP CLOB;
             
BEGIN
  
INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
      VALUES
        (I_EMP_ID,
         SYSDATE,
         ' PKG_BTG_WSR_DOWNLOAD.SP_BTG_REMAINDER_MAIL',
         I_EMP_ID||'-'||I_ISU_ID||'-'||I_OTHERS||'-'||I_ALERT#,
         '',
         I_ISU_ID,
         '');
    
      COMMIT;
  
  IF I_ALERT# = 613  THEN
  
    DELETE FROM ALERT_EMAIL_OUTBOX
     WHERE ALERT_ID = I_ALERT#
       AND STATUS = 'NEW';
    COMMIT;
    
     
    
     SELECT Q'<'>' || REPLACE(I_OTHERS, '#', Q'<'>' || ',' || Q'<'>') || Q'<'>'
      INTO V_OTHERS
      FROM DUAL;
  
    QRY := 'SELECT  ' || V_OTHERS || ' FROM DUAL';
  
    EXECUTE IMMEDIATE QRY
      INTO V_FILE_DATE1, V_CLUS_ID,V_ACCOUNT, v_extra;
      
       V_FILE_PERIOD := TO_DATE(V_FILE_DATE1, 'DD-MM-RRRR');
      
       
    PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(V_FILE_DATE1,'DD/MM/RRRR'),
                                               V_FILE_DATE,
                                               V_CURR_MONTH,
                                               V_CURR_QTR);
                                               
                                               
     SELECT TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE,'DD-MON-RR')) - INTERVAL '3' DAY,'dd-Mon-YYYY') AS PREV_MONDAY,
                 TO_CHAR(TRUNC(TO_DATE(V_FILE_DATE,'DD-MON-RR')) + INTERVAL '3' DAY,'dd-Mon-YYYY') AS NEXT_MON
       INTO V_LAST_WEEK,V_SYS_DATE
    FROM DUAL;                                            
                                               
                                               
   V_PERIOD  := TO_DATE(V_FILE_DATE,'DD-MM-RRRR');
  V_CURR_QTR1 := FN_FETCH_QTR(IN_DATE => V_PERIOD);
  V_PRV_QTR1 := FN_FETCH_PRV_QTR(IN_DATE => V_PERIOD);
  
    select SUBSTR(V_CURR_QTR1,1,2)||'-'||SUBSTR(V_CURR_QTR1,6,7)
      INTO V_PRV_QTR_PL  FROM DUAL ; 
  
  
      V_COL_FORMULA_SUMMARY  := 'FN_MULTIPLE_REPLACE(SUMMARY,
                                          NEW T_TEXT(''.'' || CHR(9),
                                                    CHR(149) || CHR(9),
                                                      chr(10),
                                                     Chr(13),
                                                     chr(9),
                                                     CHR(146),
                                                     CHR(149),
                                                     ''`'',
                                                     ''â€œ'',
                                                     ''â€'',
                                                     CHR(149),
                                                     ''“'',
                                                     CHR(208),
                                                     
                                                     ''”'',
                                                    
                                                     ''~'',
                                                     ''’'',
                                                     ''?''),
                                          NEW T_TEXT(''.'',
                                          '''',
                                          ''<br>'',
                                            ''<br>'',
                                            ''<br>'',
                                            CHR(39),
                                            '''',
                                          Q''<''>'',
                                                  '''',
                                                  '''',
                                                  '''',
                                                  '''',
                                                  '''',
                                                  
                                                  '''',
                                                 
                                                  '''',
                                                  '''''''',
                                                  ''''
                                                  
                                                  ))';

 
   
     QRY := 'SELECT  REPLACE(REPLACE(REPLACE(REPLACE(T.SUMMARY,''`'',Q''<''>''),''â€œ'',''''),''â€'',''''),''“'','''')   FROM BTG_EXECUTIVE_SUMMARY_TGT T WHERE T.FILE_DATE=''' ||V_FILE_DATE|| '''
       AND  T.IOU_ID IN (' ||I_ISU_ID || ')
      AND T.SUB_IOU_ID = '||V_CLUS_ID||'
     AND T.ACCOUNT_ID = '||V_ACCOUNT||'
      AND T.SUMMARY IS NOT NULL 
      AND T.SUMMARY <> ''-'' 
      ORDER BY ORDER_ID';
   
    EXECUTE IMMEDIATE 'SELECT COUNT(1) FROM (' || QRY || ')'
      INTO V_CNT;
    IF V_CNT <> 0 THEN
    
     OPEN  V_CUR_DATA_SUMMARY FOR 
    
     SELECT distinct (SELECT DISTINCT (SHORT_NAME) SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING M WHERE M.ACCOUNT_ID=T.ACCOUNT_ID) ACCOUNT_NAME,ACCOUNT_ID FROM BTG_EXECUTIVE_SUMMARY_TGT T WHERE T.FILE_DATE = V_FILE_DATE
     AND T.ACCOUNT_ID = V_ACCOUNT;
     V_WFP := '<font style="font-family:Cambria;font-size: 16px;"size="2";> <p>*WFP is only for incr HC <p> <br><br>';
          V_TABLE_CONTENT3:= '<font style="font-family:Cambria;font-size: 16px;"size="2";><b><u>Executive Summary:</u></b><br><br>';
          LOOP
            FETCH V_CUR_DATA_SUMMARY
              INTO V_C1,V_C2;
                
            V_COUNT := V_CUR_DATA_SUMMARY%ROWCOUNT;
             
            EXIT WHEN V_CUR_DATA_SUMMARY% NOTFOUND;
                      
             /* V_TABLE_CONTENT3 := V_TABLE_CONTENT3 || ' ----- For no need account name
              <ul><b>'||V_C1||'</b>
              <ul>';*/
    
            V_TABLE_CONTENT3 := V_TABLE_CONTENT3 || '
              <b></b>
             ';
    
     QRY := 'SELECT  '||V_COL_FORMULA_SUMMARY||'   FROM BTG_EXECUTIVE_SUMMARY_TGT T WHERE T.FILE_DATE=''' ||V_FILE_DATE|| '''
       AND  T.IOU_ID IN (' ||I_ISU_ID || ')
      AND T.SUB_IOU_ID = '||V_CLUS_ID||'
     AND T.ACCOUNT_ID = '||V_ACCOUNT||'
      AND T.SUMMARY IS NOT NULL 
      AND T.SUMMARY <> ''-'' 
      ORDER BY ORDER_ID';
      DELETE FROM X_TST_1;
      COMMIT;
      INSERT INTO X_TST_1 VALUES(QRY);
      COMMIT;
      OPEN V_DATA_CUR FOR qry;
    
      LOOP
        FETCH V_DATA_CUR
          INTO V_REP_DATA;
        EXIT WHEN V_DATA_CUR%NOTFOUND;
      
      
 select '<li>'||REPLACE(replace(replace(replace(replace(V_REP_DATA,chr(10),'<br>'),Chr(13),'<br>'),chr(9),'<br>'),CHR(146),CHR(39)),CHR(150),'-')||'</li>' INTO V_REP_DATA from DUAL;            
       ---HERE REMOVED ONE BR BECAUSE OF THE USER'S CONFIRMATION   
        V_DATA := V_DATA || '<report><br>';
        V_DATA := FN_MULTIPLE_REPLACE(v_data,
                                      NEW T_TEXT('<report>'),
                                      NEW T_TEXT(V_REP_DATA));
      END LOOP;
      CLOSE V_DATA_CUR;
      END LOOP;
      CLOSE V_CUR_DATA_SUMMARY;
      
      V_LIST := '</ul></ul>';
    
    ELSE
    
    V_TABLE_CONTENT3 := '';
    

    
      V_DATA := '';
    
      V_LIST := '';
      V_TABLE_CONTENT3 := '';
     
    
    END IF;
    
  
  
   QRY:='SELECT distinct t.SHORT_NAME  FROM new_btg_account_mapping T 
              WHERE 
               T.ACCOUNT_ID =(' || V_ACCOUNT|| ')'; 
     EXECUTE IMMEDIATE QRY
      INTO V_ACCOUNT_NAME; 
      
    BEGIN   
  
   SELECT T.EMP_NAME,T.EMAIL_ADDRESS INTO V_SMP_NAME,V_SMP_EMAIL FROM WEEKLY_REPORT_USER_DETAILS_BTG T 
      WHERE T.UNIT_NAME = 
      ( SELECT DISTINCT SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING M WHERE M.SHORT_NAME = V_ACCOUNT_NAME)
      AND T.LEVEL_ID=6;
     ---------------------------------------------------------
      SELECT NVL(T.NO_OF_FREEZE,0) INTO V_FREEZE FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE T.ACCOUNT_ID=V_ACCOUNT 
    AND T.FILE_DATE=V_FILE_DATE;
    
    EXCEPTION WHEN NO_DATA_FOUND THEN 
      V_SMP_NAME := '';
      V_SMP_EMAIL := '';
    END ;
    IF V_FREEZE = 0 or V_FREEZE is NULL THEN
      
    V_SUBJECT := ''||V_CURR_QTR1||': WSR : '||V_ACCOUNT_NAME||' : Week of <DATE1> to <DATE>';
    
    ELSE
      
    V_SUBJECT := ''||V_CURR_QTR1||': WSR : '||V_ACCOUNT_NAME||' : Week of <DATE1> to <DATE> - Updated';
      
    END IF;
  
    V_SUBJECT := FN_MULTIPLE_REPLACE(V_SUBJECT,
                                     NEW T_TEXT( '<DATE>','<DATE1>'),
                                     NEW T_TEXT(V_SYS_DATE,V_LAST_WEEK));
                                     
                                        IF V_SMP_NAME IS NULL THEN 
                V_DEAR_DYN := 'Dear Dinesh';
                V_TO:= 'd.chopra@tcs.com';
                ELSE 
                  V_DEAR_DYN := 'Dear '||V_SMP_NAME||' & Dinesh';
                  V_TO:= V_SMP_EMAIL||',d.chopra@tcs.com';
                  END IF;             
      
          
       V_DEAR := '<html><head>';
       
       
        V_BODY := 'Please find the attached weekly status report of '||V_ACCOUNT_NAME||'.<br> <br>';
     
     V_BODY := FN_MULTIPLE_REPLACE(V_BODY,
                                     NEW T_TEXT( '<DATE>','<DATE1>'),
                                     NEW T_TEXT(V_SYS_DATE,V_LAST_WEEK));
                              ----CHECKING DELEGATE ACCESS------
                                      
                                  
                                     SELECT L.EMP_NAME INTO
                                      V_ACC_HEAD  FROM  WEEKLY_REPORT_USER_DETAILS_BTG L 
                       WHERE  L.PRIMARY_SECONDARY_FLAG = 'Y' AND  L.UNIT_ID = V_ACCOUNT ; 
                      
                      SELECT L.EMP_NAME INTO V_EMP_NAME
                      FROM  WEEKLY_REPORT_USER_DETAILS_BTG L 
                       WHERE  L.EMP_ID = I_EMP_ID AND L.UNIT_ID = V_ACCOUNT ; 
      ----delegate email id----                 
            BEGIN
            
                    SELECT L.EMAIL_ADDRESS INTO
                                      V_DEL_EMAIL  FROM  WEEKLY_REPORT_USER_DETAILS_BTG L 
                       WHERE   L.EMP_ID = I_EMP_ID AND  L.UNIT_ID = V_ACCOUNT ;      
                       
                       
                       
      
                                  
                      EXCEPTION WHEN NO_DATA_FOUND 
                         THEN 
                           V_DEL_EMAIL := ''; 
                           END ;
          SELECT T.UNIT_ID INTO V_UNIT_CHK FROM 
          WEEKLY_REPORT_USER_DETAILS_BTG T WHERE T.EMP_ID =I_EMP_ID AND T.UNIT_ID = V_ACCOUNT;              
                           
           SELECT L.EMAIL_ADDRESS INTO V_FROM_ID_SEND
                      FROM  WEEKLY_REPORT_USER_DETAILS_BTG L 
                       WHERE  L.PRIMARY_SECONDARY_FLAG = 'Y' AND L.UNIT_ID = V_ACCOUNT  ; 
      
 
                          
   IF   V_UNIT_CHK <> 21 THEN                      
                           
   IF  V_ACC_HEAD = V_EMP_NAME THEN
     
    --V_FROM_ID_SEND:= V_ACC_HEAD;
                       
      
     V_THANKS := '<br>Warm Regards <br>
                      <REGARDS>
                      
                      <br><I> *This is a system generated mail. Do not reply to this mail.</I></font><br>
                      <br></body></html>';
  
    V_THANKS := FN_MULTIPLE_REPLACE(V_THANKS,
                                    NEW T_TEXT('<REGARDS>'),
                                    NEW T_TEXT(V_ACC_HEAD));
  
    ELSE
      
       
                                     SELECT L.EMP_NAME INTO
                                     V_SIGNATURE_EMP  FROM  WEEKLY_REPORT_USER_DETAILS_BTG L 
                       WHERE  L.UNIT_ID = V_ACCOUNT AND L.EMP_ID = I_EMP_ID ; 
                       
         --V_FROM_ID_SEND:=V_EMP_NAME;             
                       
      
    V_THANKS := '<br>Warm Regards <br>
                      <REGARDS><br>
                      (Uploaded by <DELEGATE>)
                      <br><I> *This is a system generated mail. Do not reply to this mail.</I></font><br>
                      <br></body></html>';
  
    V_THANKS := FN_MULTIPLE_REPLACE(V_THANKS,
                                    NEW T_TEXT('<REGARDS>', '<DELEGATE>'),
                                    NEW T_TEXT(V_ACC_HEAD,V_SIGNATURE_EMP));
                                    
    END IF; 
    
    
    ELSE
      
    
     V_THANKS := '<br>Warm Regards <br>
                      <REGARDS><br>
                     
                      <br><I> *This is a system generated mail. Do not reply to this mail.</I></font><br>
                      <br></body></html>';
  
     V_THANKS := FN_MULTIPLE_REPLACE(V_THANKS,
                                    NEW T_TEXT('<REGARDS>'),
                                    NEW T_TEXT(V_EMP_NAME));
                                    
                                    
    END IF;                                
                                                             
                           
    /*      
     V_THANKS := '<br>Best Regards<br>
                          '||V_SIGNATURE_EMP||'
                      <br><br>
                      <I> *This is a system generated mail. Do not reply to this mail.</I></font>
                      <br></body></html>';*/
  
                                             
      
      
      /* V_GRID_HEADER :=' 
 <tr style=''color:BLACK ; background: #fee699;''>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''> </th>
                <th  colspan="5" ALIGN=''CENTER'' style=''width: 300px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Revenue (in B Mn USD)</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>HC</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Margin</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>BOC - Cost</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>TCV</th>
                <th rowspan = "2"   ALIGN=''CENTER'' style=''width: 360px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Remarks </th>
            </tr>

 <tr style=''color:BLACK ; background:#fee699;''>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Period</th>
                <th  ALIGN=''CENTER'' style=''width: 55px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Services</th>
                <th  ALIGN=''CENTER'' style=''width: 40px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>BO</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Sub Con</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>TCS License</th>
                <th  ALIGN=''CENTER'' style=''width: 45px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Total</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Incr</th>
  <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>GM %</th>
  <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>B Mn USD</th>
  <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;''>Mn USD</th>
            </tr>';*/
              
      V_GRID_HEADER :=' 
 <tr style=''color:BLACK ; background: #fee699;''>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''> </th>
                <th  colspan="5" ALIGN=''CENTER'' style=''width: 300px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>Revenue (in B Mn USD)</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>HC</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>Margin</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>BOC - Cost</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>TCV</th>
                <th rowspan = "2"   ALIGN=''CENTER'' style=''width: 360px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>Remarks </th>
            </tr>

 <tr style=''color:BLACK ; background:#fee699;''>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>Period</th>
                <th  ALIGN=''CENTER'' style=''width: 55px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>Services</th>
                <th  ALIGN=''CENTER'' style=''width: 40px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>BO</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>Sub Con</th>
                <th  ALIGN=''CENTER'' style=''width: 100px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>TCS License</th>
                <th  ALIGN=''CENTER'' style=''width: 45px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid red;border-bottom : 1px solid black;''>Total</th>
                <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>Incr</th>
  <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>GM %</th>
  <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>B Mn USD</th>
  <th  ALIGN=''CENTER'' style=''width: 60px;vertical-align:center;font-size: 13px; font-family: Cambria, serif, EmojiFont;border: solid black 1px;''>Mn USD</th>
            </tr>';
            
            
             BEGIN 
   
  SELECT 
                                                DISTINCT   FN_MULTIPLE_REPLACE(REMARKS,
                                          NEW T_TEXT(chr(10),
                                                     Chr(13),
                                                     chr(9),
                                                     CHR(146),
                                                    CHR(149), 
                                                     '`',
                                                     'â€œ',
                                                     'â€',
                                                     
                                                     '“',
                                                     CHR(208),
                                                     '-',
                                                     '–',
                                                     '”',
                                                     '–',
                                                     '~',
                                                     '’',
                                                     '?'),
                                          NEW T_TEXT('<br>',
                                            '<br>',
                                            '<br>',
                                            CHR(39),
                                            '',
                                          Q'<'>',
                                                  '',
                                                  '',
                                                 
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '''',
                                                  ''
                                                  
                                                  )) INTO V_PUTTING 
                                            FROM BTG_WKLY_PL_TGT T
                                           WHERE T.QUARTER =  V_CURR_QTR1
                                             AND (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID ,T.FILE_DATE) IN
                                                 (SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
                                                    FROM BTG_WKLY_PL_TGT S
                                                    WHERE S.IOU_ID IN  (I_ISU_ID)
                                                    AND S.SUB_IOU_ID = V_CLUS_ID
                                                    AND S.ACCOUNT_ID =  V_ACCOUNT
                                                      AND S.QUARTER = V_CURR_QTR1
                                                      AND S.FILE_DATE = V_FILE_DATE
                                                   GROUP BY  IOU_ID,SUB_IOU_ID,ACCOUNT_ID,FILE_DATE)
                                             AND REPLACE(T.PERIOD,' ','') =  REPLACE(V_PRV_QTR_PL||'Outlook',' ','');
                                             
        
                                             
        EXCEPTION WHEN NO_DATA_FOUND THEN 
        V_PUTTING := '';
        END ; 
                                             
                                               
                                             
                                        
   
   V_LP:=0;
            
            
            
            
       PKG_BTG_WSR_DOWNLOAD.SP_WSR_TEMPLATE(I_EMP_ID,
       1,21,I_ISU_ID,V_CLUS_ID,V_ACCOUNT,V_FILE_DATE1,'TEMPLATE','P&L',1,'',V_CUR_HDR,V_CUR_DATA_TYPE,V_CUR_VAL,V_MSG,V_NO_OF_INDEX,V_TCV_COL ) ;
       
       
    LOOP
        FETCH V_CUR_VAL
          INTO 
          V_COL1,
          V_COL2,
          V_COL3,
          V_COL4,
          V_COL5,
          V_COL6,
          V_COL7,
          V_COL8,
          V_COL9,
          V_COL10
          ,V_COL11;
        EXIT WHEN V_CUR_VAL%NOTFOUND;    
        
        
        
       IF V_LP=0 THEN ---TO ADD ROWSPAN TO FIRST ROW ONLY
   
   /*V_GRID_DATA := '<tr style=''color:black;''>
                <td ALIGN=''LEFT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>&nbsp ' ||V_COL1|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL2,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL3,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL4,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL5,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL6,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL7,'WSHC')|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL8,'P') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;  font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL9,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL10,'V') || '</td>
                <td rowspan="4"  ALIGN=''LEFT'' style=''font-size: 12px;  font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>'||V_PUTTING||'</td>
                </tr>';*/
   
    V_GRID_DATA := '<tr style=''color:black;''>
                <td ALIGN=''LEFT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>&nbsp ' ||V_COL1|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL2,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL3,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL4,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL5,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;border-left: solid red;border-right: solid red;''>' ||F_PPT(V_COL6,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL7,'WSHC')|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL8,'P') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;  font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL9,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL10,'COMMA') || '</td>
                <td rowspan="4"  ALIGN=''LEFT'' style=''font-size: 12px;  font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>'||V_PUTTING||'</td>
                </tr>';
   
   V_WHOLE_GRID:=V_WHOLE_GRID||V_GRID_DATA;
   
     
   ELSif REPLACE(V_COL1,' ','') =  REPLACE(V_PRV_QTR_PL||'Outlook',' ','') then
   
    V_GRID_DATA := '<tr style=''color:black;''>
                <td ALIGN=''LEFT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>&nbsp ' ||V_COL1|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; background-color:#938886 ;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||V_COL2 || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; background-color:#938886 ;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||V_COL3 || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; background-color:#938886 ;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||V_COL4|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; background-color:#938886 ; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||V_COL5 || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; background-color:#938886 ;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;border-left: solid red;border-bottom: solid red;border-right: solid red;''>' ||V_COL6|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL7,'WSHC')|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL8,'P') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;  font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL9,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL10,'COMMA') || '</td>
                </tr>';
   
   V_WHOLE_GRID:=V_WHOLE_GRID||V_GRID_DATA;
   
   
   
   ELSE
   
    /*V_GRID_DATA := '<tr style=''color:black;''>
                <td ALIGN=''LEFT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>&nbsp ' ||V_COL1|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL2,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL3,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL4,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL5,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL6,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL7,'WSHC')|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL8,'P') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;  font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL9,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL10,'V') || '</td>
                </tr>';*/
                
          V_GRID_DATA := '<tr style=''color:black;''>
                <td ALIGN=''LEFT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;white-space: nowrap; font-family: Cambria, serif, EmojiFont; ''>&nbsp ' ||V_COL1|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL2,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL3,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL4,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL5,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;border-left: solid red;border-right: solid red;''>' ||F_PPT(V_COL6,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL7,'WSHC')|| '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px; font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL8,'P') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;  font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL9,'V') || '</td>
                <td ALIGN=''RIGHT'' style=''font-size: 12px;font-family: Cambria, serif, EmojiFont;font-weight: 300;padding-right:3px;''>' ||F_PPT(V_COL10,'COMMA') || '</td>
                </tr>';        
                
   
   V_WHOLE_GRID:=V_WHOLE_GRID||V_GRID_DATA;
   
   END IF;
   V_LP:=V_LP+1;
   
   END LOOP;
   CLOSE V_CUR_VAL; 
   
  
   --------------------------------key wins--------------------
    OPEN  V_CUR_DATA_WINS FOR 


SELECT distinct    
/*(select distinct substr(h.group_customer,16) from new_btg_account_mapping h
where h.account_id = V_ACCOUNT)grp,*/OPP_ID, Group_Customer GC ,account_id,Group_Customer FROM WKLY_WINS_TGT T WHERE T.FILE_DATE= V_FILE_DATE
AND T.ACCOUNT_ID = V_ACCOUNT AND T.Opp_Id NOT IN 
 (SELECT  DISTINCT T.Opp_Id FROM WKLY_WINS_TGT T 
 WHERE T.FILE_DATE = TO_CHAR(TO_DATE(V_FILE_DATE,'DD-MON-RR') - 7,'DD-MON-RR') 
 AND T.ACCOUNT_ID = V_ACCOUNT)
order by group_customer;

select count(*) into V_CNT2 from (SELECT distinct    
/*(select distinct substr(h.group_customer,16) from new_btg_account_mapping h
where h.account_id = V_ACCOUNT)grp,*/OPP_ID, Group_Customer GC ,account_id,Group_Customer FROM WKLY_WINS_TGT T WHERE T.FILE_DATE= V_FILE_DATE
AND T.ACCOUNT_ID = V_ACCOUNT AND T.Opp_Id NOT IN 
 (SELECT  DISTINCT T.Opp_Id FROM WKLY_WINS_TGT T 
 WHERE T.FILE_DATE = TO_CHAR(TO_DATE(V_FILE_DATE,'DD-MON-RR') - 7,'DD-MON-RR') 
 AND T.ACCOUNT_ID = V_ACCOUNT)
order by group_customer);


  IF V_CNT2 <> 0 THEN
                V_TABLE_CONTENT:= '<b><u>Key Wins for the reporting week are as follows:</u></b><br><br><ul>';
            ELSE
                V_TABLE_CONTENT:='';
                END IF;
              
   
          LOOP
            FETCH V_CUR_DATA_WINS
              INTO V_OPP,V_C1,V_C2,V_GC1;
                   
                 
            
                   
                   
              
            V_COUNT := V_CUR_DATA_WINS%ROWCOUNT;
              EXIT WHEN V_CUR_DATA_WINS% NOTFOUND;
           /* 
            IF V_COUNT <> 0 THEN
                V_TABLE_CONTENT:= '<b><u>Key Wins for the reporting week are as follows:</u></b><br><br><ul>';
            ELSE
                V_TABLE_CONTENT:='';
                END IF;
          */
         
          
            
       V_TABLE_CONTENT := V_TABLE_CONTENT || '
              <b></b>
             ';
         

            
            /*  V_TABLE_CONTENT := V_TABLE_CONTENT || '
              <b>'||V_C1||'</b>';*/
              
              OPEN  V_CUR_DATA1 FOR
                SELECT OPP_NAME,T.TOTAL_OF_CON_VALUE,FN_MULTIPLE_REPLACE(REASON_FOR_LOSS_WIN,
                                          NEW T_TEXT(chr(10),
                                                     Chr(13),
                                                     chr(9),
                                                     CHR(146),
                                                     CHR(149),
                                                     '`',
                                                     'â€œ',
                                                     'â€',
                                                     CHR(149),
                                                     '“',
                                                     CHR(208),
                                                     '-',
                                                     '–',
                                                     '”',
                                                     '–',
                                                     '~',
                                                     '’',
                                                     '?'),
                                          NEW T_TEXT('<br>',
                                            '<br>',
                                            '<br>',
                                            CHR(39),
                                            '&#x2022;&nbsp',
                                          Q'<'>',
                                                  '',
                                                  '',
                                                  CHR(32),
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '''',
                                                  ''
                                                  
                                                  ))  FROM WKLY_WINS_TGT T WHERE T.FILE_DATE= V_FILE_DATE AND T.ACCOUNT_ID= V_C2
              AND T.GROUP_CUSTOMER = V_GC1 AND T.Opp_Id = V_OPP;
     
     LOOP
       FETCH V_CUR_DATA1 INTO V_C3,V_C4,V_C6;
              
       EXIT WHEN V_CUR_DATA1% NOTFOUND;
       
       V_BULLET:= '<ul><li>'||V_C3||' | '||V_C4||' | '||V_C6||'</li></ul>';     
         V_TABLE_CONTENT:= V_TABLE_CONTENT || V_BULLET ;    
         
          END LOOP;
            CLOSE V_CUR_DATA1;
          
     
             
          END LOOP;
        
        
         
            V_TABLE_CONTENT := V_TABLE_CONTENT || '</li></ul>';
             CLOSE V_CUR_DATA_WINS;
        

        
        
         
         
 -------------------------------------key wins------------------------- 
 
 
 ------------------------key lossses----------------------
 
  V_C1 := '';

      V_C2 := '';
      V_GC1 := '';
     
     OPEN  V_CUR_DATA_LOSS FOR 
     
  SELECT distinct

  OPP_ID,GROUP_CUSTOMER GC,account_id,GROUP_CUSTOMER  
    FROM WKLY_LOSSES_TGT T WHERE T.FILE_DATE= V_FILE_DATE
     AND T.ACCOUNT_ID = V_ACCOUNT AND T.OPP_ID NOT IN 
 (SELECT  DISTINCT T.OPP_ID FROM WKLY_LOSSES_TGT T 
 WHERE T.FILE_DATE = TO_CHAR(TO_DATE(V_FILE_DATE,'DD-MON-RR') - 7,'DD-MON-RR') 
 AND T.ACCOUNT_ID = V_ACCOUNT)
     order by GROUP_CUSTOMER;

     
      select count(*) into V_CNT1  from (SELECT distinct
  OPP_ID,GROUP_CUSTOMER GC,account_id,GROUP_CUSTOMER  
   FROM WKLY_LOSSES_TGT T WHERE T.FILE_DATE= V_FILE_DATE
     AND T.ACCOUNT_ID = V_ACCOUNT AND T.OPP_ID NOT IN 
 (SELECT  DISTINCT T.OPP_ID FROM WKLY_LOSSES_TGT T 
 WHERE T.FILE_DATE = TO_CHAR(TO_DATE(V_FILE_DATE,'DD-MON-RR') - 7,'DD-MON-RR') 
 AND T.ACCOUNT_ID = V_ACCOUNT)
     order by GROUP_CUSTOMER);
     
       IF V_CNT1 <> 0 THEN
                V_TABLE_CONTENT1:= '<b><u>Key Closed / Shelved / Disqualified Deals for the reporting week are as follows:</u></b><br><br><ul>';
            ELSE
                V_TABLE_CONTENT1:='';
                END IF;
                
    
     
      ----  V_TABLE_CONTENT1:= '<b><u>Key Losses for the reporting week are as follows:</u></b><br><br><ul>';
          LOOP
            FETCH V_CUR_DATA_LOSS
              INTO V_OPP,V_C1,V_C2,V_GC1;
                      
            V_COUNT := V_CUR_DATA_LOSS%ROWCOUNT;
            EXIT WHEN V_CUR_DATA_LOSS% NOTFOUND;
              
          
               V_TABLE_CONTENT1 := V_TABLE_CONTENT1 || '
              <b></b>
             ';  
           
                         
             /* V_TABLE_CONTENT1 := V_TABLE_CONTENT1 || '
              <b>'||V_C1||'</b>';*/
              
              OPEN  V_CUR_DATA1 FOR
             SELECT OPP_NAME,T.OPP_VALUE,T.SALES_STAGE,  FN_MULTIPLE_REPLACE(REASON_FOR_LOSS_WIN,
                                          NEW T_TEXT(chr(10),
                                                     Chr(13),
                                                     chr(9),
                                                     CHR(146),
                                                     CHR(149),
                                                     '`',
                                                     'â€œ',
                                                     'â€',
                                                     CHR(149),
                                                     '“',
                                                     CHR(208),
                                                     '-',
                                                     '–',
                                                     '”',
                                                     '–',
                                                     '~',
                                                     '’',
                                                     '?'),
                                          NEW T_TEXT('<br>',
                                            '<br>',
                                            '<br>',
                                            CHR(39),
                                            '&#x2022;&nbsp',
                                          Q'<'>',
                                                  '',
                                                  '',
                                                  CHR(32),
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '''',
                                                  ''
                                                  
                                                  ))
     FROM WKLY_LOSSES_TGT T 
     WHERE T.FILE_DATE= V_FILE_DATE
      AND T.ACCOUNT_ID= V_C2
     AND T.GROUP_CUSTOMER = V_GC1 
     AND T.Opp_Id = V_OPP;
     
     LOOP
       FETCH V_CUR_DATA1 INTO V_C3,V_C4,V_C5,V_C6;
              
       EXIT WHEN V_CUR_DATA1% NOTFOUND;
       
       V_BULLET1:= '<ul><li>'||V_C3||' | '||V_C4||' | '||V_C5||' | '||V_C6||'</li></ul>';     
          
          V_TABLE_CONTENT1:= V_TABLE_CONTENT1 || V_BULLET1 ;   
          END LOOP;
          
       CLOSE V_CUR_DATA1;
          END LOOP;
          V_TABLE_CONTENT1 := V_TABLE_CONTENT1|| '</li></ul>';
        
        
        
      CLOSE V_CUR_DATA_LOSS;

        
         
         
        ---------------key losses-------------------------  
        
        
        
        
     -------------PIPELINE-----------------------
     
       V_C1 := '';

      V_C2 := '';
      V_GC1 := '';
     
     
     OPEN  V_CUR_DATA_PIPE FOR     
     
         SELECT  DISTINCT CRM_ID, group_client GC,
   ACCOUNT_ID, group_client,sales_stage FROM WKLY_BTG_PIPELINE_TGT T WHERE T.FILE_DATE =V_FILE_DATE
     AND T.ACCOUNT_ID = V_ACCOUNT  
     and substr(t.sales_stage,1,2) in (0,1,2,3,4,5,6,7,8) 

     order by Group_Client;
         V_TABLE_CONTENT2:= '<b><u>The top opportunities (in pipeline) as follows :</u></b><br><br><ul>';
          
          LOOP
            FETCH V_CUR_DATA_PIPE
              INTO V_OPP,V_C1,V_C2,V_GC1,V_SAl
                  
                   ;
                
            V_COUNT := V_CUR_DATA_PIPE%ROWCOUNT;
            EXIT WHEN V_CUR_DATA_PIPE% NOTFOUND; 
            
            
             V_TABLE_CONTENT2 := V_TABLE_CONTENT2 || '
              <b></b>
             ';
          
             /* V_TABLE_CONTENT2 := V_TABLE_CONTENT2 || '
              <b>'||V_C1||'</b>';*/
              
              OPEN  V_CUR_DATA1 FOR
               SELECT 
   T.OPPORTUNITY_NAME,
   T.OPP_DESCRIPTION,ROUND(T.DEAL_VALUE,2),
     T.CLOSURE_MONTH,SUBSTR(SALES_STAGE,1,2),FN_MULTIPLE_REPLACE(Status_update,
                                          NEW T_TEXT(chr(10),
                                                     Chr(13),
                                                     chr(9),
                                                     CHR(146),
                                                     CHR(149),
                                                     '`',
                                                     'â€œ',
                                                     'â€',
                                                     CHR(149),
                                                     '“',
                                                     CHR(208),
                                                     '-',
                                                     '–',
                                                     '”',
                                                     '–',
                                                     '~',
                                                     '’',
                                                     '?'),
                                          NEW T_TEXT('<br>',
                                            '<br>',
                                            '<br>',
                                            CHR(39),
                                            '&#x2022;&nbsp',
                                          Q'<'>',
                                                  '',
                                                  '',
                                                  CHR(32),
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '''',
                                                  ''
                                                  
                                                  )) FROM WKLY_BTG_PIPELINE_TGT T WHERE T.FILE_DATE = V_FILE_DATE
      AND T.ACCOUNT_ID= V_C2
     AND T.GROUP_CLIENT = V_GC1
     AND T.SALES_STAGE=V_SAL
     AND T.CRM_ID = V_OPP;
     
     LOOP
       FETCH V_CUR_DATA1 INTO V_C3,V_C4,V_C5,V_C6,V_C8,V_C7;
              
       EXIT WHEN V_CUR_DATA1% NOTFOUND;
       
      V_BULLET2:= '<ul><li>'||V_C3||' | '||V_C4||' | ' ||V_C5||' | '||V_C6||' | '||V_C8||' | '||V_C7||'</li></ul>';    
         V_TABLE_CONTENT2:= V_TABLE_CONTENT2 || V_BULLET2 ;     
         
          END LOOP;
           CLOSE V_CUR_DATA1;   
          
    
             
          END LOOP;
          V_TABLE_CONTENT2 := V_TABLE_CONTENT2 || '</li></ul>';
          
          CLOSE V_CUR_DATA_PIPE;
        
         
           
 -----------------------------------------------------------             
   
       
    V_GRID := '
               <style>
        
        td {
           border-bottom: 1px solid black;
             border-right: 1px solid black;
             border:1px solid black;
             
        }
        .space {
            width: 1px !important;
        }
    </style></head>
<body>    
<font style="font-family:Cambria;font-size: 16px;" size="2";>'||V_DEAR_DYN||', <br><br>'||V_BODY||' </font>
        <table style=''width:1000px; height:0px;border-collapse:collapse'' cellspacing=0>
    '|| V_GRID_HEADER ||'
    '|| V_WHOLE_GRID ||'</table><BR>
    ';
----------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_PIPE_HTML_CHCK FROM WKLY_BTG_PIPELINE_TGT N
WHERE N.IOU_ID = I_ISU_ID 
AND  N.SUB_IOU_ID = V_CLUS_ID 
AND N.ACCOUNT_ID = V_ACCOUNT 
AND N.FILE_DATE = V_FILE_DATE;


IF V_PIPE_HTML_CHCK = 0 THEN 
  V_TABLE_CONTENT2  := '';
  ELSE 
    V_TABLE_CONTENT2 :=V_TABLE_CONTENT2;
    END IF;
    
    SELECT COUNT(*) INTO V_WINS_HTML_CHCK FROM WKLY_WINS_TGT N
WHERE N.IOU_ID = I_ISU_ID 
AND  N.SUB_IOU_ID = V_CLUS_ID 
AND N.ACCOUNT_ID = V_ACCOUNT
and N.FILE_DATE = V_FILE_DATE ;

IF V_WINS_HTML_CHCK = 0 THEN 
  V_TABLE_CONTENT  := '';
  ELSE 
    V_TABLE_CONTENT :=V_TABLE_CONTENT;
    END IF;
    
    
      SELECT COUNT(*) INTO V_LOSS_HTML_CHCK FROM WKLY_LOSSES_TGT N
WHERE N.IOU_ID = I_ISU_ID 
AND  N.SUB_IOU_ID = V_CLUS_ID 
AND N.ACCOUNT_ID = V_ACCOUNT
and n.file_date = V_FILE_DATE ;

IF V_LOSS_HTML_CHCK = 0 THEN 
  V_TABLE_CONTENT1  := '';
  ELSE 
    V_TABLE_CONTENT1 :=V_TABLE_CONTENT1;
    END IF;

    
  
  V_MAIN_BODY := V_DEAR  ||V_GRID||V_WFP||V_TABLE_CONTENT3 || v_data || V_LIST|| V_TABLE_CONTENT||V_TABLE_CONTENT1||V_TABLE_CONTENT2||V_THANKS; 
    SELECT DISTINCT t.short_name INTO V_SHORT FROM NEW_BTG_ACCOUNT_MAPPING T
     WHERE T.IOU_ID= I_ISU_ID
     and t.sub_iou_id = V_CLUS_ID
     and t.account_id = V_ACCOUNT;
     
       QRY := 'SELECT DISTINCT REPLACE(REPLACE('''||V_SHORT||''', ''-'', ''_''), ''&'', ''and'') || ''_'' ||
             INITCAP(''Report'') || ''_'' ||
             TO_CHAR(TO_DATE('''||V_FILE_PERIOD||''',''DD-MON-YY''), ''DD_Mon_RRRR'') FILE_NAME
        FROM NEW_BTG_ACCOUNT_MAPPING I
        where I.iou_id = '||I_ISU_ID||'
AND I.SUB_IOU_ID = '||V_CLUS_ID||'
AND I.ACCOUNT_ID = '||V_ACCOUNT||'
        ';
        DELETE FROM X_TST_6;
      COMMIT;
      INSERT INto X_TST_6 VALUES (QRY);
      COMMIT;
       EXECUTE IMMEDIATE QRY INTO O_FILE_NAME;
       IF V_ACCOUNT IN (5699,5698) THEN
       
          V_CC:=V_FROM_ID_SEND||',alex.duraisamy@tcs.com,mathews.koshy@tcs.com,mayur.mahajan@tcs.com,gopalakrishnan.balakrishnan@tcs.com,'||V_DEL_EMAIL;
          
          ELSE
       
       V_CC:=V_FROM_ID_SEND||',alex.duraisamy@tcs.com,mathews.koshy@tcs.com,mayur.mahajan@tcs.com,'||V_DEL_EMAIL;
       
       END IF;
     /*SELECT L.EMAIL_ADDRESS INTO V_FROM_ID_SEND    FROM  WEEKLY_REPORT_USER_DETAILS_BTG L
      WHERE L.EMP_ID = I_EMP_ID ;  */
   V_TO := 'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com';
    INSERT INTO ALERT_EMAIL_OUTBOX
       VALUES
      (SEQ_EMAIL_OUTBOX.NEXTVAL,
       SYSDATE,
       I_ALERT#,
       V_FROM_ID_SEND,
       V_TO,---'mathews.koshy@tcs.com,thulasiraman.j@tcs.com',---
       '', 
       'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com,nandhini.thangavel1@tcs.com,gopivenkatarajareddy.gundareedy@tcs.com',--- 'siddharth.jain8@tcs.com,premcharan.s@tcs.com',
       '',
       'sruthi.balasubramanian@tcs.com,g.nishashanthi@tcs.com,nandhini.thangavel1@tcs.com,gopivenkatarajareddy.gundareedy@tcs.com',
       '',
       V_SUBJECT,
       V_MAIN_BODY,
       'D:\\PMOUxData\\WeeklyStatusReport\\'||I_EMP_ID||'\\'||O_FILE_NAME||'.xlsx',
       'NEW',
       '',
       I_ISU_ID);
      COMMIT;
      --
    -----,
      UPDATE WKLY_REP_FRZ_UNFRZ_BTG T SET T.FREEZE_FLAG='Y',
       T.FREEZED_DATE=SYSDATE 
      WHERE 
      T.ACCOUNT_ID =V_ACCOUNT
      AND T.FILE_DATE=V_FILE_DATE;
      COMMIT;
      
      --UPDATING FOR MONTHLY STATUS 
      
      UPDATE WKLY_REP_FRZ_UNFRZ_BTG T SET T.M_FREEZE_FLAG='Y',
       T.M_FREEZED_DATE=SYSDATE 
      WHERE 
      T.ACCOUNT_ID =V_ACCOUNT
      AND T.FILE_DATE=V_FILE_DATE;
      COMMIT;
    
            
  O_MESSAGE := 'ALL MAIL SENT';
 
    
  END IF;


  
end SP_BTG_SUBMISSION_MAIL; 

PROCEDURE SP_WSR_TEMPLATE(I_EMP_ID        IN NUMBER,
                            I_CORP_ID       IN NUMBER,
                            I_BG_ID         IN VARCHAR2,
                            I_ISU_ID        IN VARCHAR2,
                            I_CLUS_ID       IN VARCHAR2,
                            I_ACC_ID        IN VARCHAR2,
                            I_FILE_DATE     IN VARCHAR2, ---==//File Date
                            I_REPORT_NAME   IN VARCHAR2, --===//Report Name
                            I_SHEET_NAME    IN VARCHAR2, --== // Sheet Name
                            I_GRID_COUNT    IN NUMBER, --== // Grid count in a sheet
                            I_OTHERS        IN VARCHAR2, --== // extra input
                            O_CUR_HDR       OUT SYS_REFCURSOR, --==// Header cursor
                            O_CUR_DATA_TYPE OUT SYS_REFCURSOR, --==// Data Type cursor
                            O_CUR_VAL       OUT SYS_REFCURSOR, --==// Values Cursor
                            O_MSG           OUT VARCHAR2, --==/ success / Failure Msg
                            O_NO_OF_INDEX   OUT NUMBER,
                            O_TCV_COL OUT VARCHAR2) IS
    QRY CLOB;
  
    V_CUR_QTR     VARCHAR2(4000);
    v_cur_tcv  VARCHAR2(4000);
     V_COL_FORMULA_SUMMARY VARCHAR2(4000);
    V_PRV_QTR     VARCHAR2(4000);
    V_CUT         NUMBER;
     V_REPORT      VARCHAR2(4000);
    V_GC           VARCHAR2(4000);
    V_FROM_DATE   DATE;
    V_TO_DATE     DATE;
    V_MEET_RES VARCHAR2(1000);
    V_LEVEL_ID    VARCHAR2(4000);
    V_CUR_QTR_HDR VARCHAR2(4000);
    V_PRV_QTR_HDR VARCHAR2(4000);
    V_TCV_COL VARCHAR2(1000);
    V_APPEND_QRY  VARCHAR2(4000);
    V_REPORT_COL  VARCHAR2(4000);
    V_REPORT_UNION VARCHAR2(4000);
    V_CUR_QTR_PL VARCHAR2(4000);
    V_PRV_QTR_PL VARCHAR2(4000);
  
    V_LVL_COND    VARCHAR2(4000);
    V_COL_FORMULA VARCHAR2(4000);
  
    V_CUR_QTR_HDR_SRT VARCHAR2(4000);
    V_PRV_QTR_HDR_SRT VARCHAR2(4000);
    V_SELECT          VARCHAR2(4000);
    V_PERIOD          DATE;
    V_MON1_ST_DATE DATE;
    V_MON2_ST_DATE DATE;
    V_MON3_ST_DATE DATE;
    V_COL_ADD         VARCHAR2(4000);
    V_HDR_COND        VARCHAR2(4000);
    V_ORDER_BY        VARCHAR2(4000);
    V_BU_COND         VARCHAR2(4000);
    V_BU_COND_NEW     VARCHAR2(4000);
    V_COND            VARCHAR2(4000);
    V_ISU_COND        VARCHAR2(4000);
  
    V_FILTER_COND VARCHAR2(4000);
    V_BG_NAME     VARCHAR2(4000);
    V_ACTUAL_HDR  VARCHAR2(4000);
    V_CUR1        VARCHAR2(4000);
    V_CUR2        VARCHAR2(4000);
    V_LAST_MON    DATE;
    V_SECOND_MON  DATE;
    V_FIRST_MON   DATE;
  
    V_LAST_MON1   VARCHAR2(100);
    V_SECOND_MON1 VARCHAR2(100);
    V_FIRST_MON1  VARCHAR2(100);
    V_WINS_CHECK   VARCHAR(100);
    V_LOSS_CHECK   VARCHAR2(100);
    V_PIPE_CHECK   VARCHAR2(100);
    V_HC_TOTAL_APPEND   VARCHAR2(4000);
    V_TCV_TOTAL_APPEND  VARCHAR2(4000);
    V_HC_DOWN_APPEND  VARCHAR2(4000);
    V_HC_SELECT   VARCHAR2(4000);
    V_HC_GROUP_BY   VARCHAR2(4000);
    V_BRACK_VAL    VARCHAR2(4000);
    V_CUR_QTR_HC_HDR   VARCHAR2(4000);
    V_PRV_QTR_HC_HDR  VARCHAR2(4000);
    ------------------------------------HC(HEADER)VAR
    V_PRO1  NUMBER;
    V_PRO2 NUMBER;
    V_PRO3   NUMBER;
    V_YEAR    VARCHAR2(100);
      V_YEAR1    VARCHAR2(100);
    V_PR1_APP  VARCHAR2(100);
     V_PR2_APP  VARCHAR2(100);
      V_PR3_APP  VARCHAR2(100);
      V_GRT_COND   VARCHAR2(100);
      
      V_STAR NUMBER;
      V_LAST_WEEK_PERIOD VARCHAR2(1000);
    
    V_GRT_COND1 VARCHAR2(1000);
    
    V_NEXT_QTR VARCHAR2(1000);
  V_CHK_SEN_1 NUMBER;
  V_CHK_SEN_2 NUMBER; 
  V_VISIT_PRE VARCHAR2(100);
  V_CAT_CHK VARCHAR2(100);
  V_VISIT_QTR VARCHAR2(100);
  
  V_CHK_SEN_3 varchar2(100);
  V_CHK_SEN_4 varchar2(100);
  
  v_visit_end_DATE DATE;
  V_CUR_QTR_5 VARCHAR2(1000);
  V_CUR_2 sys_refcursor;
  V_DATE_10 DATE;
      V_PRE VARCHAR2(1000);
      
      
      V_COL_ADD_1 VARCHAR2(1000);
      
      v_col_add_2 varchar2(1000);
      V_COL_ADD_6 VARCHAR2(1000);
     V_FY_ITG NUMBER;
     V_COND_8 VARCHAR2(1000);
      V_COND_9 VARCHAR2(1000);
      v_dist varchar2(1000);
     
     
     V_QTR_CHK varchar2(100);
     v_fy varchar2(100);
     V_TCV1_HDR varchar2(100);
      V_TCV2_HDR varchar2(100);
       V_TCV3_HDR varchar2(100);
       V_TCV_HDR1 varchar2(100);
       V_TCV_HDR2 varchar2(100);
       V_TCV_HDR3 varchar2(100);
       V_TCV_HDR4 varchar2(100);
       V_Q1 VARCHAR2(1000);
        V_Q2 VARCHAR2(1000);
         V_Q3 VARCHAR2(1000);
          V_Q4 VARCHAR2(1000);
          V_TCV_PREV_QTR VARCHAR2(1000);
       V_TCV_FINAL  varchar2(1000);
       
       V_PIPELINE_COND LONG;
     V_PIPELINE_COND_2 varchar2(1000);
  
  BEGIN
    BEGIN
      V_PERIOD  := TO_DATE(I_FILE_DATE, 'DD-MM-RRRR');
     /* V_LAST_WEEK_PERIOD := TO_CHAR(TO_DATE(V_PERIOD,'DD-MON-RR') - 7,'DD-MON-RR');*/
  
      V_PRV_QTR := FN_FETCH_PRV_QTR(IN_DATE => V_PERIOD);
      
      SELECT 'Q2'||SUBSTR(V_PRV_QTR,3) INTO V_TCV_PREV_QTR FROM DUAL;

    
      PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(V_PERIOD,
                                               V_PERIOD,
                                               V_CUR1,
                                               V_CUR2);
      
      SELECT  TO_CHAR(TO_DATE(V_PERIOD,'DD-MON-RR') - 7,'DD-MON-RR') INTO   V_LAST_WEEK_PERIOD FROM DUAL;                                  
            V_CUR_QTR := FN_FETCH_QTR(IN_DATE => V_PERIOD);                                       
                                               
    V_CUR_QTR_HC_HDR  := FN_FETCH_QTR(IN_DATE => V_PERIOD);
    V_PRV_QTR_HC_HDR  := FN_FETCH_PRV_QTR(IN_DATE => V_PERIOD);
    
    
    
   ---------- YEAR START DATE AND END DATE CHECKING--------
   /*SELECT TO_CHAR( TRUNC (SYSDATE, 'YEAR') ,'DD-MOM-YYYY') 
 AS first_day,ADD_MONTHS (TO_CHAR(( TRUNC (SYSDATE, 'YEAR') , 12 ) - 1),'DD-MOM-YYYY') AS last_day INTO V_FIRST ,V_LAST  FROM    dual;
    
    */
    
    
                                               
    /*
      V_CUR_QTR_HDR := SUBSTR(V_CUR_QTR, 1, 2) || Q'< ''>' ||
                       SUBSTR(V_CUR_QTR, -2, 2);*/
      ----------------------------------
      V_CUR_QTR_HDR := SUBSTR(V_CUR_QTR_HC_HDR, 1, 2) || Q'< ''>' ||
                       SUBSTR(V_CUR_QTR_HC_HDR, -2, 2);
   ------------------------------                    
                                        
   /*   V_PRV_QTR_HDR := SUBSTR(V_PRV_QTR, 1, 2) || Q'< ''>' ||
                       SUBSTR(V_PRV_QTR, -2, 2);*/
         --------------------------------------------------------              
           V_PRV_QTR_HDR := SUBSTR(V_PRV_QTR_HC_HDR, 1, 2) || Q'< ''>' ||
                       SUBSTR(V_PRV_QTR_HC_HDR, -2, 2);
        -----------------------------------------------------------------                           
    
      /*V_CUR_QTR_PL := SUBSTR(V_CUR_QTR, 1, 2) || Q'< ->' ||
                      SUBSTR(V_CUR_QTR, -2, 2);
      V_PRV_QTR_PL := SUBSTR(V_PRV_QTR, 1, 2) || Q'< ->' ||
                      SUBSTR(V_PRV_QTR, -2, 2);
                      */
                      
    ---------------------------------------------------                  
           V_CUR_QTR_PL := SUBSTR(V_CUR_QTR_HC_HDR, 1, 2) || Q'< ->' ||
                      SUBSTR(V_CUR_QTR_HC_HDR, -2, 2);
           --- FOR ITG FINANCILA YEAR            
            /*SELECT SUBSTR(V_CUR_QTR_PL,-2,2) INTO            
                      V_FY_ITG FROM DUAL;*/
      V_PRV_QTR_PL := SUBSTR(V_PRV_QTR_HC_HDR, 1, 2) || Q'< ->' ||
                      SUBSTR(V_PRV_QTR_HC_HDR, -2, 2);     
   -------------------------------------------------------                           
                      
                      
    
   /*   V_CUR_QTR_HDR_SRT := SUBSTR(V_CUR_QTR, 1, 2);
      V_PRV_QTR_HDR_SRT := SUBSTR(V_PRV_QTR, 1, 2);*/
      
      
     ---------------------------------------------------
     
      V_CUR_QTR_HDR_SRT := SUBSTR(V_CUR_QTR_HC_HDR, 1, 2);
      V_PRV_QTR_HDR_SRT := SUBSTR(V_PRV_QTR_HC_HDR, 1, 2); 
      ----------------------------------------------------
    
    /*  V_FROM_DATE := FN_FETCH_FIRST_QTR_DAY(V_CUR_QTR);
      V_TO_DATE   := FN_FETCH_LAST_DAY_QTR(V_CUR_QTR);*/
      
      -------------------------------------
        V_FROM_DATE := FN_FETCH_FIRST_QTR_DAY(V_CUR_QTR_HC_HDR);
      V_TO_DATE   := FN_FETCH_LAST_DAY_QTR(V_CUR_QTR_HC_HDR);
      ---------------------------------------------------
      
      
    
      V_LAST_MON := FN_FETCH_LAST_MON_QTR_DAY(I_QUARTERSTAMP => V_CUR_QTR_HC_HDR);
      
      select to_char(trunc(TO_DATE(V_PERIOD,'DD-MON-RR'),'Q'),'DD-MON-RR') , 
TO_CHAR(last_day(TRUNC(TO_DATE(V_PERIOD,'DD-MON-RR'),'Q'))+1,'DD-MON-RR') ,
TO_CHAR(last_day(last_day(TRUNC(TO_DATE(V_PERIOD,'DD-MON-RR'),'Q'))+1)+1,'DD-MON-RR') 
INTO V_MON1_ST_DATE,V_MON2_ST_DATE,V_MON3_ST_DATE
from dual;



    
      QRY := 'SELECT ADD_MONTHS(TO_DATE(''' || V_LAST_MON ||
             ''', ''DD-MON-RRRR''), -2) FROM DUAL';
    
      EXECUTE IMMEDIATE QRY
        INTO V_FIRST_MON;
    
      QRY := 'SELECT ADD_MONTHS(TO_DATE(''' || V_LAST_MON ||
             ''', ''DD-MON-RRRR''), -1) FROM DUAL';
    
      EXECUTE IMMEDIATE QRY
        INTO V_SECOND_MON;
        
             select SUM(T.EMPLOYEE_COUNT) INTO V_PRO1 from HC_DSBD_EMPLOYEE_DTS_BTG_AGG T
 WHERE T.PERIOD_FREQUENCY = 'M-O-M'
  AND T.PERIOD =  V_MON2_ST_DATE ;
  
    select SUM(T.EMPLOYEE_COUNT) INTO V_PRO2 from HC_DSBD_EMPLOYEE_DTS_BTG_AGG T
 WHERE T.PERIOD_FREQUENCY = 'M-O-M'
  AND T.PERIOD = V_MON3_ST_DATE ;
  
    /*select COUNT(T.EMPLOYEE_NUMBER) INTO V_PRO3 from HC_DSBD_EMPLOYEE_DTS_BTG_TGT t
 WHERE T.PERIOD_FREQUENCY = 'M-O-M'
  AND T.PERIOD =  V_MON3_ST_DATE ;
  */
  
  V_PRO3 := 0;
  IF V_PRO1 = 0 THEN
    V_PR1_APP := '(P)';
    ELSE 
       V_PR1_APP := '(A)';
       
          update WKLY_HC_BTG_TGT T SET T.Mon1_Exit = (select sum(employee_count) from HC_DSBD_EMPLOYEE_DTS_BTG_AGG t
 WHERE T.PERIOD_FREQUENCY = 'M-O-M'
  AND T.PERIOD = V_MON2_ST_DATE
 
 AND (T.IOU,REPLACE(REPLACE(T.SUB_IOU,'-',' '),' ',''),T.LARGE_CUSTOMER) IN (SELECT DISTINCT M.IOU,REPLACE(REPLACE(M.SUB_IOU,'-',' '),' ',''),M.GROUP_CUSTOMER FROM NEW_BTG_ACCOUNT_MAPPING M 
                                             WHERE 1=1 AND M.iou_id = I_ISU_ID
                                             AND M.SUB_IOU_ID = I_CLUS_ID
                                             AND M.Account_Id=I_ACC_ID)) 
                                             Where t.file_date=(select max(t.file_date) from WKLY_HC_BTG_TGT T where t.account_id=I_ACC_ID)
                                             AND t.iou_id= I_ISU_ID
                                             AND t.sub_iou_id= I_CLUS_ID
                                             AND t.account_id=I_ACC_ID;
       COMMIT;
       END IF; 
       
        IF V_PRO2 = 0 THEN
    V_PR2_APP := '(P)'; 
    ELSE 
       V_PR2_APP := '(A)';
        
       update WKLY_HC_BTG_TGT T SET T.Mon2_Exit = (select sum(employee_count) from HC_DSBD_EMPLOYEE_DTS_BTG_AGG t
 WHERE T.PERIOD_FREQUENCY = 'M-O-M'
  AND T.PERIOD = V_MON3_ST_DATE
 
 AND (T.IOU,T.SUB_IOU,T.LARGE_CUSTOMER) IN (SELECT DISTINCT M.IOU,M.SUB_IOU,M.GROUP_CUSTOMER FROM NEW_BTG_ACCOUNT_MAPPING M 
                                             WHERE 1=1 AND M.iou_id = I_ISU_ID
                                             AND M.SUB_IOU_ID = I_CLUS_ID
                                             AND M.Account_Id=I_ACC_ID)) 
                                             Where t.file_date=(select max(t.file_date) from WKLY_HC_BTG_TGT T where t.account_id=I_ACC_ID)
                                             AND t.iou_id= I_ISU_ID
                                             AND t.sub_iou_id= I_CLUS_ID
                                             AND t.account_id=I_ACC_ID;
       COMMIT; 
       END IF; 
       
        IF V_PRO3 = 0 THEN
    V_PR3_APP := '(P)'; 
    ELSE 
       V_PR3_APP := '(A)';
       END IF; 
        -----Tcvoutlook header dynamic change---------   
      
 
   -- select SUBSTR(sysdate,8,2)+1 into V_FY from dual;
    select substr(V_CUR_QTR,1,2) into V_QTR_CHK FROM DUAL;
    select substr(V_CUR_QTR,-2,2) into v_fy from dual;
   -- select substr(V_CUR_QTR,1,2)||'FY'||substr(V_CUR_QTR,-2,2) into v_fy from dual;
    
    IF V_QTR_CHK = 'Q1' THEN
      V_TCV1_HDR:='Projection';
       V_TCV2_HDR:='Projection';
        V_TCV3_HDR:='Projection'; 
      --  V_Q1_ := '(SELECT to_char(round(TCV_BMN_USD)) FROM BTG_WKLY_PL_PMO_TGT 
       -- where period = 'Q1 -23 Actual' and QUATER = 'Q2-2023' and)

        
        
        ELSIF V_QTR_CHK = 'Q2' THEN
          
          V_TCV1_HDR:='Actual';
       V_TCV2_HDR:='Projection';
        V_TCV3_HDR:='Projection'; 
        ELSIF V_QTR_CHK = 'Q3' THEN
          
          V_TCV1_HDR:='Actual';
          V_TCV2_HDR:='Actual';
         V_TCV3_HDR:='Projection';
        
        ELSIF V_QTR_CHK = 'Q4' THEN
          
          V_TCV1_HDR:='Actual';
       V_TCV2_HDR:='Actual';
        V_TCV3_HDR:='Actual';
        END IF; 
       
    
      
      V_TCV_HDR1:= 'Q1FY'||v_fy ||V_TCV1_HDR;
      V_TCV_HDR2:='Q2FY'|| V_FY || V_TCV2_HDR;
      V_TCV_HDR3:='Q3FY'|| V_FY ||V_TCV3_HDR;
      V_TCV_HDR4:='Q4FY'||V_FY || 'Projection';
      
      
      V_TCV_FINAL := 'FY'||V_FY||'Total';
    
    
    
    
    
    
    
 
    
      V_LAST_MON1 := TO_CHAR(V_LAST_MON, 'MON')||' Exit HC'||V_PR3_APP;
    
      V_SECOND_MON1 := TO_CHAR(V_SECOND_MON, 'MON')||' Exit HC'||V_PR2_APP;
      V_FIRST_MON1  := TO_CHAR(V_FIRST_MON, 'MON')||' Exit HC'||V_PR1_APP;
    
      INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
      VALUES
        (I_EMP_ID,
         SYSDATE,
         'PKG_WSR_UPLOAD_DOWNLOAD.SP_WSR_TEMPLATE',
         I_EMP_ID || '-' || I_CORP_ID || '-' || I_BG_ID || '-' || I_ISU_ID || '-' ||
         I_SHEET_NAME || '-' || I_REPORT_NAME || '-' || I_GRID_COUNT || '-' ||
         I_FILE_DATE,
         '',
         I_ISU_ID,
         '');
      COMMIT;
    
      IF I_ISU_ID IS NULL OR I_ISU_ID = '0' THEN
        --==BG Level
        V_LVL_COND := 'AND LEVEL_ID IN (-2,1,2)';
      ELSE
        IF I_CLUS_ID IS NULL OR I_CLUS_ID = '0' THEN
          --== IOU Level
          V_LVL_COND := 'AND LEVEL_ID IN (1,2)';
        ELSE
          ---== Sub IOU level
          V_LVL_COND := 'AND LEVEL_ID IN (1,2)';
        END IF;
      END IF;
    
      /* IF I_ISU_ID IS NULL OR I_ISU_ID = '0' THEN
        --== BG Level
        IF I_BG_ID IS NULL OR I_BG_ID = '0' THEN
          V_COND     := 'AND ISU_ID IN (247,248,249,250,251,218,232,239,240)';
          V_ISU_COND := 'AND NVL(NEW_SUB_GROUP,''-'') IN (SELECT ISU_NAME 
                                                            FROM ISU_MSTR_NEW I 
                                                           WHERE I.ISU_ID IN (247,248,249,250,251,218,232,239,240))';
          V_BG_NAME := 'Total Revenue';
          
       
            
        ELSE
          V_COND     := 'AND ISU_ID IN (247,248,249,250,251,218,232,239,240)
                         AND ISU_ID IN (SELECT ISU_ID
                                          FROM ISU_MSTR_NEW I 
                                         WHERE I.BU# = '||I_BG_ID||')';
          IF I_BG_ID  <> 22 THEN 
          V_ISU_COND := 'AND NVL(NEW_SUB_GROUP,''-'') IN (SELECT ISU_NAME 
                                                            FROM ISU_MSTR_NEW I 
                                                           WHERE I.ISU_ID IN (247,248,249,250,251,218,232,239,240)
                                                             AND I.BU# = '||I_BG_ID||')
                         AND NVL(NEW_GROUP,''-'') IN (SELECT BU_NAME
                                                        FROM BU_MASTER B
                                                       WHERE B.BU# IN ('||I_BG_ID||'))';
          V_BG_NAME := 'Business Transformation Group';
         ELSE
         V_ISU_COND := 'AND NVL(NEW_SUB_GROUP,''-'') IN (SELECT ISU_NAME 
                                                            FROM ISU_MSTR_NEW I 
                                                           WHERE I.ISU_ID IN (247,248,249,250,251,218,232,239,240)
                                                             AND I.BU# = '||I_BG_ID||')
                         AND NVL(NEW_GROUP,''-'') IN (SELECT BU_NAME
                                                        FROM BU_MASTER B
                                                       WHERE B.BU# IN ('||I_BG_ID||')
                                                       UNION ALL
                                                       SELECT ''RIG'' FROM DUAL)';                                                   
          V_BG_NAME := 'Enterprise Growth Group';
         END IF;
        END IF;
      ELSE
        --== ISU Level
        V_COND     := 'AND ISU_ID IN (' || I_ISU_ID || ')';
        V_ISU_COND := 'AND NVL(NEW_SUB_GROUP,''-'') IN (SELECT ISU_NAME 
                                                          FROM ISU_MSTR_NEW I 
                                                         WHERE I.ISU_ID = ' ||I_ISU_ID || ')';
      END IF;
      
      IF I_ISU_ID IN (247,248,249) OR I_BG_ID = 21 THEN 
        V_BU_COND := 'AND NEW_GROUP LIKE ''BTG%''';
        V_BG_NAME := 'Business Transformation Group';
      ELSE
        V_BU_COND := 'AND (NEW_GROUP LIKE ''EGG%'' OR NEW_GROUP LIKE ''RIG%'')';
        V_BG_NAME := 'Enterprise Growth Group';
      END IF;*/
    
      V_COND := 'AND IOU_ID IN (' || I_ISU_ID || ')
                   AND SUB_IOU_ID IN (' || I_CLUS_ID || ')
                   AND ACCOUNT_ID IN (' || I_ACC_ID || ')';
    
      -----Dynamic header change based on cut-----
    
     SELECT H.CUTS
        INTO V_CUT
        FROM QUARTER_CUTS H
       WHERE H.QUARTER = V_CUR_QTR;
    
      IF V_CUT = 1 THEN
      
        V_ACTUAL_HDR := '1st Cut';
      
      ELSIF V_CUT = 2 THEN
      
        V_ACTUAL_HDR := '2nd Cut';
      
      ELSIF V_CUT = 3 THEN
      
        V_ACTUAL_HDR := 'Actual';
      
      END IF; --THIS SHOULD BE UNCOMMENTED WHEN P&L IS DONE
      
    -------changed year-------
    
    select to_char(sysdate, 'YY') INTO V_YEAR from dual;  
      select to_char(sysdate, 'YY')+1 INTO V_YEAR1 from dual; 
      
      
      
        
      --V_ACTUAL_HDR := 'Actual';
      
       IF (TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE') THEN
         V_GRT_COND := '<';
         V_GRT_COND1 :='';
         
         ELSE 
           V_GRT_COND := '';
           V_GRT_COND1 :='<';
           END IF;
    
      SELECT DISTINCT W.LEVEL_ID
        INTO V_LEVEL_ID
        FROM WEEKLY_REPORT_USER_DETAILS_BTG W
       WHERE W.EMP_ID = I_EMP_ID;
      IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
        
      IF  V_LEVEL_ID IN (-2) AND 
        (I_ISU_ID =  0 AND I_CLUS_ID =0 AND I_ACC_ID =0)
        THEN 
          V_COND := '';
          ELSE 
        IF V_LEVEL_ID IN (-2, 6) THEN
         
         IF I_ISU_ID <> 0 AND I_CLUS_ID =0 AND I_ACC_ID =0 THEN
          V_COND := 'AND IOU_ID = ' || i_isu_id || '';
          
          ELSIF I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID =0 THEN
        V_COND := 'AND IOU_ID = ' || i_isu_id || '
               AND SUB_IOU_ID = ' || i_CLUS_id || '';
               
          ELSIF I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID <>0 THEN
          V_COND := 'AND IOU_ID = ' || i_isu_id || '
                     AND SUB_IOU_ID = ' || i_CLUS_id || '
                     AND ACCOUNT_ID = ' || I_ACC_ID || ''; 
                     END IF;  
        ELSIF V_LEVEL_ID = 7 THEN
        
          V_COND := 'AND IOU_ID = ' || i_isu_id || '
 AND SUB_IOU_ID = ' || i_CLUS_id || '
 AND ACCOUNT_ID = ' || I_ACC_ID || '';
         END IF;
        END IF;
        ELSE
        V_COND := 'AND IOU_ID = ' || i_isu_id || '
 AND SUB_IOU_ID = ' || i_CLUS_id || '
 AND ACCOUNT_ID = ' || I_ACC_ID || '';
      
      END IF;
      
      
   /*   SELECT COUNT(1) INTO V_STAR FROM WKLY_REP_FRZ_UNFRZ_BTG M WHERE M.ACCOUNT_ID IN  
              (SELECT DISTINCT T.ACCOUNT_ID 
              FROM NEW_BTG_ACCOUNT_MAPPING T WHERE  V_COND 
              AND M.FILE_UPLOADED='N'  AND M.FILE_DATE=V_FILE_DATE;
*/
    
      IF TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE' THEN
        V_COL_FORMULA := 'FN_MULTIPLE_REPLACE(COLUMN_FORMULA,
                                          NEW T_TEXT(''Current Quarter'',
                                                     ''Previous Quarter'',
                                                     ''Cur Qtr'',
                                                     ''Prv Qtr'',
                                                     ''File Date'',
                                                     ''BG Name'',
                                                     ''<Actual Period>''),
                                          NEW T_TEXT(''' ||
                         V_CUR_QTR_HDR || ''',
                                                     ''' ||
                         V_PRV_QTR_HDR || ''',
                                                     ''' ||
                         V_CUR_QTR_HDR_SRT || ''',
                                                     ''' ||
                         V_PRV_QTR_HDR_SRT || ''',
                                                     ''' ||
                         I_FILE_DATE || ''',
                                                     ''' ||
                         V_BG_NAME || ''',
                                                     ''' ||
                         V_ACTUAL_HDR || ''')) ';
      ELSE
        V_COL_FORMULA := 'NULL ';
      
      END IF;
      
      IF TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE' OR  TRIM(UPPER(I_REPORT_NAME)) = 'REPORT' THEN  
        V_COL_FORMULA_SUMMARY  := 'FN_MULTIPLE_REPLACE(REMARKS,
                                          NEW T_TEXT(''`'',
                                                     ''â€œ'',
                                                     ''â€'',
                                                     CHR(149),
                                                     ''“'',
                                                     CHR(208),
                                                     ''-'',
                                                     ''–'',
                                                     ''”'',
                                                     ''–'',
                                                     ''~'',
                                                     ''’'',
                                                     ''?''),
                                          NEW T_TEXT(Q''<''>'',
                                                  '''',
                                                  '''',
                                                  CHR(32),
                                                  '''',
                                                  '''',
                                                  '''',
                                                  '''',
                                                  '''',
                                                  '''',
                                                  '''',
                                                  '''''''',
                                                  ''''
                                                  
                                                  ))';
      ELSE
        V_COL_FORMULA_SUMMARY := 'NULL ';
      
      END IF;
      
    
      IF (TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE') OR
         (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
        IF TRIM(UPPER(I_SHEET_NAME)) LIKE '%EXECUTIVE SUMMARY%' THEN
        
          V_SELECT      := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1';
          O_NO_OF_INDEX := 0;
          --- IF I_ISU_ID IS NULL OR I_ISU_ID = '0' THEN 
          IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
              V_GC:='GC,';
             
            IF V_LEVEL_ID IN (-2, 6) THEN
            IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
              OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
              V_COL_ADD  := 'ISU_NAME,';
               V_REPORT:='GROUP BY GC,ISU_NAME';
              V_ORDER_BY := 'ORDER BY ISU_NAME,ORDER_ID';
              ELSE
                V_COL_ADD  := '';
              V_ORDER_BY := 'ORDER BY ORDER_ID';
                 V_REPORT:='GROUP BY GC';
              END IF;
            ELSE
              V_COL_ADD  := '';
              V_ORDER_BY := 'ORDER BY ORDER_ID';
               V_REPORT:='GROUP BY GC';
            END IF;
            ELSE
                V_GC:='';
                 V_REPORT:='';
          END IF;
          QRY := ' select '||V_COL_ADD||''||V_GC||' SUMMARY_VAL  from (SELECT '||V_COL_ADD||' '||V_GC||' SUMMARY_VAL FROM ( SELECT ' || V_COL_ADD || ' gc,SUMMARY_VAL
          FROM (SELECT (SELECT DISTINCT iou_short_name FROM new_btg_account_mapping I 
          WHERE I.Iou_ID = T.IoU_ID
      AND I.ACTIVE=''Yes'') ISU_NAME,
            (select distinct M.SHORT_NAME from new_btg_account_mapping M
             WHERE M.SHORT_NAME = T.GROUP_CUSTOMER AND ACTIVE=''Yes'' /*and m.iou_id <>263*/)gc,
                   NVL(T.SUMMARY,''-'')  SUMMARY_VAL
              FROM BTG_EXECUTIVE_SUMMARY_TGT T 
             WHERE 1=1
             ' || V_COND || '
             and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                       (SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
                          FROM BTG_WKLY_PL_TGT S
                          WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                              ' || V_COND || '
                            AND S.FILE_DATE '||V_GRT_COND1||' = ''' ||
                 V_PERIOD || '''
                         GROUP BY IoU_ID,sub_iou_id,account_id)
              )


               union all

               SELECT ' || V_COL_ADD || ' gc,SUMMARY_VAL
          FROM (select distinct iou_short_name isu_name, M.SHORT_NAME gc,'' '' SUMMARY_VAL 
          from new_btg_account_mapping M
           WHERE 1=1 AND ACTIVE=''Yes''/*AND M.IOU_ID<>263*/
             ' || V_COND || '
           and M.SHORT_NAME
                  NOT IN (SELECT GROUP_CUSTOMER  FROM BTG_EXECUTIVE_SUMMARY_TGT T 
             WHERE (T.IoU_ID,t.sub_iou_id,t.account_id,T.FILE_DATE) IN
                       (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                          FROM BTG_WKLY_PL_TGT S
                          WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                        ' || V_COND || '
                            AND S.FILE_DATE = ''' ||
                 V_PERIOD || '''
                         GROUP BY IoU_ID,sub_iou_id,account_id)

              ))
              order by gc asc))';
        
        ELSIF TRIM(UPPER(I_SHEET_NAME)) LIKE '%README%' THEN
        
          V_SELECT      := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1';
          O_NO_OF_INDEX := 0;
        
          QRY := 'select SECTION,REMARKS from readme order by s_no';
          
        ELSIF TRIM(UPPER(I_SHEET_NAME)) LIKE '%ITG%' THEN
          
           V_SELECT      := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1';
           
           
           IF UPPER(I_REPORT_NAME) = 'TEMPLATE' THEN 
             
           
             QRY := 'select emp_id, 
emp_name, 
sales_itg, 
itg_role, 
active_role
 from wkly_itg_sales_tgt t where 
             t.file_date = (select max(file_date) from wkly_itg_sales_tgt WHERE 1=1
              ' || V_COND || '  ) 
             ' || V_COND || ' ';
             END IF;
  IF UPPER(I_REPORT_NAME) = 'REPORT'
    THEN 
    
                V_COL_ADD_6  := 'distinct(SELECT DISTINCT SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING K WHERE  K.ACCOUNT_ID = T.ACCOUNT_ID)ACCOUNT,';
              --  '';
           ---   V_ORDER_BY := 'ORDER BY 1';
            --  END IF;
   -- V_COL_ADD_6 := '(SELECT DISTINCT IOU_SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING K WHERE K.IOU_ID = T.IOU_ID ) IOU_NAME,';
    
                
       QRY := 'select '||V_COL_ADD_6||'
       emp_id, 
emp_name, 
sales_itg, 
itg_role, 
active_role
 from wkly_itg_sales_tgt t where 
             t.file_date = (select max(file_date) from wkly_itg_sales_tgt WHERE 1=1
              ' || V_COND || '  ) 
             ' || V_COND || ' 
             
             UNION ALL
             
             
             
             select '||V_COL_ADD_6||'
  TO_NUMBER(''''),
  TO_CHAR(''-''),
   TO_CHAR(''-''),
    TO_CHAR(''-''),
    TO_CHAR(''-'')
 from NEW_BTG_ACCOUNT_MAPPING t where  1=1 '||V_COND||'/* AND IOU_ID <>263 */ AND 
            ACCOUNT_ID NOT IN   (select DISTINCT ACCOUNT_ID  from wkly_itg_sales_tgt T WHERE 1=1 AND
             T.file_date =(select max(file_date) from wkly_itg_sales_tgt WHERE 1=1 '||V_COND||'
              
            ))';
            
            END IF; 
             
             
   
    
    
    
    
    
    
    
     
        
        ELSIF  (TRIM(UPPER(I_SHEET_NAME)) LIKE '%HC%' AND I_GRID_COUNT IN (1,2)) THEN
        
          V_SELECT      := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1,
                   LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2,
                   LEVEL_3_HDR||''$$''||LEVEL_3_HDR_COLOR COL3';
          
        
        
        IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
             OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
              V_COL_ADD  := '(SELECT DISTINCT iou_short_name FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID /*AND K.IOU_ID<>263 */) ISU_NAME,';
              V_ORDER_BY := 'ORDER BY GROUP_CLIENT';
                O_NO_OF_INDEX := 2;
              ELSE
                V_COL_ADD  := '';
              V_ORDER_BY := '';
                O_NO_OF_INDEX := 1;
              END IF;
            ELSE
              V_COL_ADD  := '';
              V_ORDER_BY := '';
                O_NO_OF_INDEX := 1;
            END IF;
          END IF;
 IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT')
               AND ((I_ISU_ID =  0 AND I_CLUS_ID =0 AND I_ACC_ID =0) OR
               (I_ISU_ID <>  0 AND I_CLUS_ID =0 AND I_ACC_ID =0) OR
               (I_ISU_ID <>  0 AND I_CLUS_ID <>0 AND I_ACC_ID =0)  ) THEN
              
    /*V_HC_TOTAL_APPEND  := 'SELECT ''Total^2'',''Total'',SUM(wfp_net_off),
SUM(wfp_net_on),
SUM(Wfp_net_tot),
SUM(Net_won_gr_off),
SUM(net_won_gr_onn),
SUM(pa_off),
SUM(pa_onn),
SUM(net_won_growth_off),
SUM(net_won_growth_onn),
SUM(net_won_growth_tot),
SUM(mon1_exit),
SUM(mon2_exit),
SUM(mon3_exit),
SUM(emp), 
SUM(tr), 
SUM(ep), 
SUM(ba), 
SUM(intern)
FROM WKLY_HC_BTG_TGT T
WHERE  T.FILE_DATE  <= ''' || V_PERIOD || '''
'||V_COND||' 
UNION ALL ' ;*/

/*V_HC_TOTAL_APPEND := '   SELECT ''Total^2'',''Total'',SUM(wfp_net_off),
SUM(wfp_net_on),
SUM(Wfp_net_tot),
SUM(Net_won_gr_off),
SUM(net_won_gr_onn),
SUM(pa_off),
SUM(pa_onn),
SUM(net_won_growth_off),
SUM(net_won_growth_onn),
SUM(net_won_growth_tot),
mon1_exit,
mon2_exit,
SUM(mon3_exit),
SUM(emp), 
SUM(tr), 
SUM(ep), 
SUM(ba), 
SUM(intern)
FROM 
(SELECT wfp_net_off,
wfp_net_on,
Wfp_net_tot,
Net_won_gr_off,
net_won_gr_onn,
pa_off,
pa_onn,
net_won_growth_off,
net_won_growth_onn,
net_won_growth_tot,
(select count(M.EMPLOYEE_NUMBER) from HC_DSBD_EMPLOYEE_DTS_BTG_TGT M where M.period_frequency = ''M-O-M'' AND M.PERIOD = ''01-MAY-22'')mon1_exit,
(select count(M.EMPLOYEE_NUMBER) from HC_DSBD_EMPLOYEE_DTS_BTG_TGT M where M.period_frequency = ''M-O-M'' AND M.PERIOD = ''01-JUN-22'')mon2_exit,
mon3_exit,
emp, 
tr, 
ep, 
ba, 
intern
FROM WKLY_HC_BTG_TGT T
WHERE  T.FILE_DATE  <= ''' || V_PERIOD || '''
'||V_COND||' )D
GROUP BY MON1_EXIT,MON2_EXIT UNION ALL';*/

 IF (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID <> 0) 
  THEN 
    V_HC_SELECT := 'SELECT ZZ.* FROM(select CASE WHEN GROUP_CLIENT IS NULL  THEN ''Total^2'' ELSE GROUP_CLIENT END GROUP_CLIENT,
          CASE WHEN   GROUP_CLIENT IS NULL THEN ''Total^2''
             ELSE GROUP_CLIENT 
               END GROUP_CLIENT1,';
               
      V_HC_GROUP_BY := '
        GROUP BY  ROLLUP(GROUP_CLIENT))ZZ
WHERE ZZ.GROUP_CLIENT <> ''0''
      ORDER BY (CASE WHEN GROUP_CLIENT1 LIKE ''Total%'' THEN ''1''
 ELSE ''2''
    END )ASC,GROUP_CLIENT1 ASC ';         
    ELSE 
      V_HC_SELECT := '
       SELECT ZZ.* FROM(select CASE WHEN ISU_NAME IS NULL AND GROUP_CLIENT IS NULL THEN ''Total^2'' ELSE ISU_NAME END ISU_NAME,
          CASE WHEN  ISU_NAME IS NULL AND GROUP_CLIENT IS NULL THEN ''Total^2''
             WHEN ISU_NAME IS NOT NULL AND GROUP_CLIENT IS NULL THEN ''0''
             ELSE GROUP_CLIENT 
               END GROUP_CLIENT,';
               
       V_HC_GROUP_BY := '  GROUP BY  ROLLUP(ISU_NAME,GROUP_CLIENT))ZZ
WHERE ZZ.GROUP_CLIENT <> ''0''
       ORDER BY (CASE WHEN GROUP_CLIENT LIKE ''Total%'' THEN ''1''
 ELSE ''2''
    END )ASC,GROUP_CLIENT ASC';        
               
               END IF;


V_HC_TOTAL_APPEND := '
  
          '||V_HC_SELECT||'SUM(wfp_net_off),
           SUM(wfp_net_on), 
SUM(Wfp_net_tot), 
SUM(Net_won_gr_off), 
SUM(net_won_gr_onn), 
SUM(pa_off), 
SUM(pa_onn), 
----pa_tot, 
SUM(net_won_growth_off), 
SUM(net_won_growth_onn), 
SUM(net_won_growth_tot), 
SUM(mon1_exit), 
SUM(mon2_exit), 
SUM(mon3_exit), 
SUM(emp), 
SUM(tr), 
SUM(ep), 
SUM(ba), 
SUM(intern)
           from ';
           V_BRACK_VAL := 'Z';
           
           
       
 
 ELSE 
   
 V_HC_TOTAL_APPEND := '';
  V_HC_GROUP_BY := '';
  V_BRACK_VAL := '';
 END IF ;
   


          /*IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
              V_COL_ADD := '(SELECT DISTINCT IOU FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
        V_ORDER_BY := 'ORDER BY 1,2';
            ELSE
              V_COL_ADD := '';
              V_ORDER_BY := 'ORDER BY 1';
            END IF;
          END IF;*/
        
          QRY := '  '||V_HC_TOTAL_APPEND||'
            (SELECT  ' || V_COL_ADD || ' GROUP_CLIENT,----SHORT_ACC,
           wfp_net_off, 
           wfp_net_on, 
Wfp_net_tot, 
Net_won_gr_off, 
net_won_gr_onn, 
pa_off, 
pa_onn, 
----pa_tot, 
net_won_growth_off, 
net_won_growth_onn, 
net_won_growth_tot, 
mon1_exit, 
mon2_exit, 
mon3_exit, 
emp, 
tr, 
ep, 
ba, 
intern FROM (SELECT 
        (select distinct M.SHORT_NAME from NEW_BTG_ACCOUNT_MAPPING M
             WHERE 1=1 '||V_COND||
                 ' and UPPER(M.Active) =''YES'' /*AND M.IOU_ID <> 263*/   AND M.SHORT_NAME=T.GROUP_CUSTOMER) GROUP_CLIENT,
                /*(select distinct M.REPORTING_ACCOUNT_NAME from NEW_BTG_ACCOUNT_MAPPING M
             WHERE 1=1 '||V_COND||
                 ' and UPPER(M.Active) =''YES''  AND M.GROUP_CUSTOMER=T.GROUP_CUSTOMER ) SHORT_ACC,*/
                 IOU_ID,
       

T.wfp_net_on, 
T.wfp_net_off, 
T.wfp_net_tot, 
T.net_won_gr_off, 
T.net_won_gr_onn, 
T.pa_off, 
T.pa_onn, 
T.pa_tot, 
T.net_won_growth_off, 
T.net_won_growth_onn, 
T.net_won_growth_tot, 
TO_CHAR(T.mon1_exit)mon1_exit, 
TO_CHAR(T.mon2_exit)mon2_exit, 
TO_CHAR(T.mon3_exit)mon3_exit, 
T.emp, 
T.tr, 
T.ep, 
T.ba, 
T.intern 

      
      

                  FROM WKLY_HC_BTG_TGT T
                  WHERE T.FILE_DATE '||V_GRT_COND1||V_GRT_COND||'= ''' || V_PERIOD || '''
              ' || V_COND || '
                 and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = /*''' || V_CUR_QTR || '''*/'''||V_CUR_QTR_HC_HDR||'''
 ' || V_COND || '
AND 
S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
 GROUP BY IoU_ID,sub_iou_id,account_id)
 
 
 UNION ALL
 
 SELECT SHORT_NAME,IOU_ID,SUM(A),
SUM(B),SUM(C),SUM(D),SUM(E),SUM(F),SUM(G),SUM(H),
SUM(I),SUM(J),SUM(K),TO_CHAR(SUM(MON1_EXIT)),TO_CHAR(SUM(MON2_EXIT)),TO_CHAR(SUM(MON3_EXIT)),
SUM(L),SUM(M),SUM(N),SUM(O),SUM(P)
FROM 
 
 (Select distinct M.SHORT_NAME,----M.REPORTING_ACCOUNT_NAME,
 IOU_ID,
  TO_NUMBER('''')A,
  TO_NUMBER('''')B,
   TO_NUMBER('''')C,
    TO_NUMBER('''')D,
     TO_NUMBER('''')E,
      TO_NUMBER('''')F,
       TO_NUMBER('''')G,
        TO_NUMBER('''')H,
         TO_NUMBER('''')I,
          TO_NUMBER('''')J,
           TO_NUMBER('''')K,
            ---TO_NUMBER(''''),
              ( select sum(employee_count) from HC_DSBD_EMPLOYEE_DTS_BTG_AGG t
 WHERE T.PERIOD_FREQUENCY = ''M-O-M''
  AND T.PERIOD = '''||V_MON2_ST_DATE||'''
 AND (T.IOU,REPLACE(REPLACE(T.SUB_IOU,''-'','' ''),'' '',''''),T.LARGE_CUSTOMER) IN (SELECT DISTINCT M.IOU,REPLACE(REPLACE(M.SUB_IOU,''-'','' ''),'' '',''''),M.GROUP_CUSTOMER FROM NEW_BTG_ACCOUNT_MAPPING M 
                                            WHERE 1=1 '||V_COND||'
                                             AND t.iou = m.iou
 and t.sub_iou = m.sub_iou
 and t.large_customer = m.group_customer)
                                            
    
                  '||V_COND||' 
 )MON1_EXIT,
            ---- TO_NUMBER(''''),
              ( select count(T.EMPLOYEE_NUMBER)  from HC_DSBD_EMPLOYEE_DTS_BTG_TGT t
 WHERE T.PERIOD_FREQUENCY = ''M-O-M''
  AND T.PERIOD = '''||V_MON3_ST_DATE||'''
 AND (T.IOU,T.SUB_IOU,T.LARGE_CUSTOMER) IN (SELECT DISTINCT M.IOU,M.SUB_IOU,M.GROUP_CUSTOMER FROM NEW_BTG_ACCOUNT_MAPPING M 
                                             WHERE 1=1 '||V_COND||'
                                              AND t.iou = m.iou
 and t.sub_iou = m.sub_iou
 and t.large_customer = m.group_customer)
         
                  '||V_COND||'                                        
                                             
 AND T.EMPLOYEE_NUMBER IS NOT NULL)MON2_EXIT,
            ---  TO_NUMBER(''''),
            /* ( select REPLACE(COUNT(T.EMPLOYEE_NUMBER),0,'''')  from HC_DSBD_EMPLOYEE_DTS_BTG_TGT t
 WHERE T.PERIOD_FREQUENCY = ''M-O-M''
  AND T.PERIOD = '''||V_MON3_ST_DATE||'''
\* AND (T.IOU,T.SUB_IOU,T.LARGE_CUSTOMER) IN (SELECT DISTINCT M.IOU,M.SUB_IOU,M.GROUP_CUSTOMER FROM NEW_BTG_ACCOUNT_MAPPING M 
                                             WHERE 1=1 '||V_COND||')*\
          AND t.iou = m.iou
 and t.sub_iou = m.sub_iou
 and t.large_customer = m.group_customer
                  '||V_COND||'                                        
                                             
 AND T.EMPLOYEE_NUMBER IS NOT NULL)MON3_EXIT*/TO_NUMBER('''')MON3_EXIT,
                  TO_NUMBER('''')L,
                TO_NUMBER('''')M,
                 TO_NUMBER('''')N,
                  TO_NUMBER('''')O,
                   TO_NUMBER('''')P    from NEW_BTG_ACCOUNT_MAPPING M
WHERE 1 = 1
              ' || V_COND || 
                 '  and UPPER(M.Active) =''YES''
                  /* and  M.IOU_ID <> 263 */
and m.account_id not in (select t.account_id FROM WKLY_HC_BTG_TGT T
WHERE T.FILE_DATE '||V_GRT_COND1||V_GRT_COND||'=  ''' || V_PERIOD || ''' 
and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = /* ''' || V_CUR_QTR || '''*/'''||V_CUR_QTR_HC_HDR||'''
  ' || V_COND || '
AND 
S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || ''' 
 GROUP BY IoU_ID,sub_iou_id,account_id) ))  GROUP BY SHORT_NAME,IOU_ID

 ) D
'||V_ORDER_BY||' )'||V_BRACK_VAL||'
'||V_HC_GROUP_BY||' ';
        
        ELSIF (TRIM(UPPER(I_SHEET_NAME)) LIKE '%P' || '&' || 'L%' AND I_GRID_COUNT =1)THEN
        
          /*IF I_ISU_ID IS NULL OR I_ISU_ID = '0' THEN 
            --== BG Level
             V_COL_ADD := 'ISU_NAME,';
             O_NO_OF_INDEX := 2;
             V_ORDER_BY := '';
          ELSE
              V_COL_ADD := '';
              O_NO_OF_INDEX := 1;
              V_ORDER_BY := '';
          END IF;  */
           --- REPORT ACC LEVEL HANDLING
          /*IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            
              --== BG Level
              V_COL_ADD     := 'ISU_NAME,';
              O_NO_OF_INDEX := 2;
              V_ORDER_BY    := '';
            ELSE
              V_COL_ADD     := '';
              O_NO_OF_INDEX := 1;
              V_ORDER_BY    := '';
            END IF;
            ELSE 
              V_COL_ADD     := '';
          O_NO_OF_INDEX := 1;
          V_ORDER_BY    := '';
          END IF;*/
          
           V_TCV_COL := '/*NVL(TCV_BMN_USD,0)*/ TCV_BMN_USD';
        IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
               OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
              V_COL_ADD  := 'ISU_NAME,';
               O_NO_OF_INDEX := 2;
              ELSE
                V_COL_ADD  := '';
                            O_NO_OF_INDEX := 1;
              END IF;
            ELSE
              V_COL_ADD  := '';
                            O_NO_OF_INDEX := 1;
            END IF;
            V_TCV_COL := 'ROUND(TCV_BMN_USD) TCV_BMN_USD';
          END IF;
          
        
          IF I_BG_ID = 21 THEN
            V_SELECT := 'LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2,
                   LEVEL_3_HDR||''$$''||LEVEL_3_HDR_COLOR COL3';
          ELSIF I_BG_ID = 22 THEN
            V_SELECT := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1,
                   LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2,
                   LEVEL_3_HDR||''$$''||LEVEL_3_HDR_COLOR COL3';
          END IF;
          
          
            IF (V_LEVEL_ID = 7 AND (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT'
            OR TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE' )) OR 
            (V_LEVEL_ID IN (-2,6) AND TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE') 
            or (V_LEVEL_ID IN (-2,6) AND TRIM(UPPER(I_REPORT_NAME)) = 'REPORT' AND (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID <>0))
            THEN 
        
          QRY := 'SELECT 
          --' || V_COL_ADD || '
                       PERIOD,
                    /*   NVL(SERVICES_REV,0) */ SERVICES_REV,
                      /* NVL(BOC_REV,0)*/ BOC_REV,
                      /* NVL(SUB_CON_REV,0)*/ SUB_CON_REV,
                     /*  NVL(TCS_LICENSE_REV,0)*/ TCS_LICENSE_REV,
                     /*  NVL(TOTAL_REV,0)*/ TOTAL_REV,
                      /* NVL(INCR_HC,0)*/ INCR_HC,
                       /*NVL(CM_MARGIN,0)*/ CM_MARGIN,
                    /*   NVL(BOC_COST_BMN_USD,0)*/ BOC_COST_BMN_USD,
                       '||V_TCV_COL||',
                       /*NVL(REMARKS,''-'')*/ 
                       '||V_COL_FORMULA_SUMMARY||' REMARKS
            FROM (SELECT M.ISU_NAME,
                       M.PERIOD,
                       M.ID,
                       N.SERVICES_REV,
                       N.BOC_REV,
                       N.SUB_CON_REV,
                       N.TCS_LICENSE_REV,
                       N.TOTAL_REV,
                       N.INCR_HC,
                       N.CM_MARGIN,
                       N.BOC_COST_BMN_USD,
                       N.TCV_BMN_USD,
                       N.REMARKS
              FROM (SELECT ISU_NAME,
                           ID,
                           PERIOD
                     FROM (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          ' || V_COND || '
            
                          ) 
                 CROSS JOIN
               (SELECT 1 ID, ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD FROM DUAL
                UNION ALL
                SELECT 2 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' FROM DUAL
                UNION ALL
                SELECT 3 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' FROM DUAL
                UNION ALL
                SELECT 4 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' FROM DUAL))M
                LEFT OUTER JOIN
                (SELECT *
                  FROM (/*SELECT (SELECT ISU_NAME FROM ISU_MSTR_NEW I WHERE I.ISU_ID = T.ISU_ID) NEW_SUB_GROUP,
                               ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD,
                               SERVICES_REV,
                               BOC_REV,
                               SUB_CON_REV,
                               TCS_LICENSE_REV,
                               TOTAL_REV,
                               INCR_HC,
                               CM_MARGIN,
                               BOC_COST_BMN_USD,
                               TCV_BMN_USD,
                               NULL REMARKS
                          FROM WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' || V_CUR_QTR || '''
                          ' || V_COND || '
                           AND REGEXP_LIKE(PERIOD, ''Actual'')*/
                    SELECT DISTINCT (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          ' || V_COND || ') NEW_SUB_GROUP,
                           ''' || V_PRV_QTR_PL ||
                 ''' || '' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD,
                            TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                               TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                               TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                            (SELECT DISTINCT T.REMARKS
                                FROM btg_WKLY_PL_TGT T
                               WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                 AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                     (SELECT iou_id,sub_iou_id,account_id, MAX(FILE_DATE)
                                        FROM btg_WKLY_PL_TGT S
                                        WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                          ' || V_COND || '
                                          AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                       GROUP BY IoU_ID,sub_iou_id,account_id)
                                 AND UPPER(T.PERIOD) = ''' ||
                 V_CUR_QTR_PL ||
                 '''||'' OUTLOOK''
                                 AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                               /* AND S.ISU_ID = T.ISU_ID*/) REMARKS
                       FROM BTG_WKLY_PL_PMO_TGT t
                        WHERE t.QUATER = ''' || V_CUR_QTR || '''
                      AND UPPER(T.PERIOD) LIKE ''%ACTUAL%''
                        ' || V_COND || '
                       
           --AND t.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                                       
                              
                     
                       
                        UNION ALL
                        SELECT (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          ' || V_COND || ') NEW_SUB_GROUP,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' PERIOD,
                             TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                               TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                               TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                               '''' REMARKS
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' || V_CUR_QTR || '''
                            ' || V_COND || '
                           AND REGEXP_LIKE(UPPER(PERIOD), ''AOP'')
                            AND UPPER(T.PERIOD) NOT LIKE ''%REVISED%''
                            
                        UNION ALL
                        SELECT (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          ' || V_COND || ') NEW_SUB_GROUP,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' PERIOD,
                              TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                               TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                               TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                               '''' REMARKS
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' || V_CUR_QTR || '''
                            ' || V_COND || '
                           AND REGEXP_LIKE(UPPER(PERIOD), ''REVISED TARGET'')
                             
                        UNION ALL
                        SELECT B.IOU,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD,
                              '''' SERV_CUR_OUT_REV,-- TO_CHAR(B.SERV_CUR_OUT_REV),
                             '''' BOC_CUR_OUT_REV,-- TO_CHAR(B.BOC_CUR_OUT_REV),
                              '''' SUB_CON_CUR_OUT_REV,-- TO_cHAR(B.SUB_CON_CUR_OUT_REV),
                              '''' TCS_LICENSE_CUR_OUT_REV,--TO_CHAR(B.TCS_LICENSE_CUR_OUT_REV),
                              '''' TOTAL_CUR_OUT_REV,--TO_CHAR(B.TOTAL_CUR_OUT_REV),
                               TO_CHAR(B.CUR_HC_INCR),
                               TO_cHAR(B.CM_MARGIN),
                               TO_CHAR(B.CUR_COST),
                               TO_CHAR(B.TCV_BMN_USD),
                               B.REMARKS
                          FROM(SELECT (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
           ' || V_COND ||
                 ') IOU,
                                                 T.PERIOD,
                                                 T.SERVICES_REV SERV_CUR_OUT_REV,
                                                 NVL(T.BOC_REV,0) BOC_CUR_OUT_REV,
                                                 NVL(T.SUB_CON_REV,0) SUB_CON_CUR_OUT_REV,
                                                 NVL(T.TCS_LICENSE_REV,0) TCS_LICENSE_CUR_OUT_REV,
                                                 (SERVICES_REV +  BOC_REV + SUB_CON_REV + TCS_LICENSE_REV) TOTAL_CUR_OUT_REV,
                                                 T.INCR_HC CUR_HC_INCR,
                                                 T.BOC_COST_BMN_USD CUR_COST,
                                                 TO_NUMBER(CM_MARGIN) CM_MARGIN,
                                                 T.TCV_BMN_USD,
                                                 null REMARKS
                                            FROM btg_WKLY_PL_TGT T
                                           WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                            ' ||
                 V_COND || '
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(T.PERIOD) = UPPER(''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook'')
                                             AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                                                ) B
                           )) N
                            ON M.ISU_NAME = N.NEW_SUB_GROUP
                            AND M.PERIOD = N.PERIOD
                            ORDER BY M.ISU_NAME,ID)';
             ELSIF (V_LEVEL_ID IN (-2)) AND (I_ISU_ID = 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) 
               
             THEN 
               
              QRY := '
             SELECT Z.TOT,Z.TOT1,
   TO_CHAR(Z.SERVICES_REV),
   TO_CHAR(Z.BOC_REV),
   TO_CHAR(Z.SUB_CON_REV),
  TO_CHAR(Z.TCS_LICENSE_REV),
   TO_CHAR(Z.TOTAL_REV),
   TO_CHAR(Z.INCR_HC),
 ''-'' CM_MARGIN,--TO_CHAR (((Z.TOTAL_REV - Z.CM_MARGIN)/Z.TOTAL_REV)*100),
   TO_CHAR(Z.BOC_COST_BMN_USD),
  TO_CHAR(Z.TCV_BMN_USD) ,
  ''''
   FROM (SELECT ''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook ''||''Total^2'' TOT,''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook ''||''Total'' TOT1,
                SUM(SERVICES_REV) SERVICES_REV,
SUM(BOC_REV) BOC_REV,
SUM(SUB_CON_REV) SUB_CON_REV,
SUM(TCS_LICENSE_REV) TCS_LICENSE_REV,
SUM(TOTAL_REV) TOTAL_REV,
SUM(INCR_HC) INCR_HC,
sum((1- (CM_MARGIN/100))*TOTAL_REV) CM_MARGIN,
SUM(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
ROUND(SUM(TCV_BMN_USD))TCV_BMN_USD,
TO_CHAR('''')
FROM btg_WKLY_PL_TGT S
     WHERE s.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (s.IoU_ID,s.sub_iou_id,s.account_id, s.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT o
                                                    WHERE o.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND o.FILE_DATE '||V_GRT_COND||'= ''' ||
                                                      
                 V_PERIOD || '''
               /*   and  o.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*/
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(s.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(s.PERIOD) NOT LIKE ''%CORP%'')Z
UNION ALL
              
                    
              SELECT ISU_NAME,
                       PERIOD,
                       NVL(SERVICES_REV,''-'')  SERVICES_REV,
                       NVL(BOC_REV,''-'') BOC_REV,
                       NVL(SUB_CON_REV,''-'') SUB_CON_REV,
                       NVL(TCS_LICENSE_REV,''-'') TCS_LICENSE_REV,
                       NVL(TOTAL_REV,''-'') TOTAL_REV,
                       NVL(INCR_HC,''-'') INCR_HC,
                       NVL(CM_MARGIN,''-'') CM_MARGIN,
                       NVL(BOC_COST_BMN_USD,''-'') BOC_COST_BMN_USD,
                       NVL(TO_CHAR(ROUND(TCV_BMN_USD)),''-'') TCV_BMN_USD,
                       NVL(REMARKS,''-'') REMARKS--- '||V_REPORT_COL||'
            FROM (SELECT M.ISU_NAME,
                       M.PERIOD,
                       M.ID,
                       N.SERVICES_REV,
                       N.BOC_REV,
                       N.SUB_CON_REV,
                       N.TCS_LICENSE_REV,
                       N.TOTAL_REV,
                       N.INCR_HC,
                       N.CM_MARGIN,
                       N.BOC_COST_BMN_USD,
                       N.TCV_BMN_USD,
                       N.REMARKS
              FROM (SELECT ISU_NAME,
                           ID,
                           PERIOD
                     FROM (SELECT DISTINCT I.SHORT_NAME ISU_NAME
                             FROM new_btg_account_mapping I 
                             
                            WHERE 1=1
                            AND I.ACTIVE = ''Yes'' /*AND I.IOU_ID <>263*/
                        /*   and I.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*/
                           
                   
                          ) 
                 CROSS JOIN
               (SELECT 1 ID, ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD FROM DUAL
                UNION ALL
                SELECT 2 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' FROM DUAL
                UNION ALL
                SELECT 3 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' FROM DUAL
                UNION ALL
                SELECT 4 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' FROM DUAL))M
                LEFT OUTER JOIN
                (SELECT *
                  FROM (
          SELECT   X.NEW_SUB_GROUP,X.PERIOD,
TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                              TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                              TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                             


TO_CHAR(Z.REMARKS) REMARKS FROM 
(          SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
     
        
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                           ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD ,
                            SERVICES_REV,
                            BOC_REV,
                           SUB_CON_REV,
                            TCS_LICENSE_REV,
                             TOTAL_REV,
                              INCR_HC,
                           CM_MARGIN, ----==//Gross Margin Calculation
                          BOC_COST_BMN_USD,
                             TCV_BMN_USD,IOU_ID,ACCOUNT_ID
                        
                       FROM  BTG_WKLY_PL_PMO_TGT T /*BTG_WKLY_PL_PMO_TGT t*/--- WKLY_ACCT_PMO_TGT S
                        WHERE t.QUATER = ''' ||
                 V_CUR_QTR || '''
                      AND UPPER(T.PERIOD) LIKE ''%ACTUAL%''
                      
                      AND T.ACCOUNT_ID  IN (SELECT DISTINCT B.ACCOUNT_ID FROM btg_WKLY_PL_PMO_TGT B /*  where  
                      b.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*/
                      /*(SELECT DISTINCT B.ACCOUNT_ID FROM btg_WKLY_PL_TGT B
                                           
                                         
                                            WHERE  B.ACCOUNT_ID = T.ACCOUNT_ID 
                                            AND B.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                  AND (B.IoU_ID,B.sub_iou_id,B.account_id, B.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                            ' ||
                 V_COND || '
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id) ))*/))X
                                            
                                            LEFT OUTER JOIN 
                                            
                                            
                                             (SELECT DISTINCT T.IOU_ID,T.ACCOUNT_ID, T.REMARKS
                                FROM btg_WKLY_PL_TGT T
                               WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                 AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                     (SELECT iou_id,sub_iou_id,account_id, MAX(FILE_DATE)
                                        FROM btg_WKLY_PL_TGT S
                                        WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                         
                                          AND S.ACCOUNT_ID = T.ACCOUNT_ID
                                          AND S.FILE_DATE <= ''' ||
                 V_PERIOD || '''
                                       GROUP BY IoU_ID,sub_iou_id,account_id)
                                 AND UPPER(T.PERIOD) = '''||V_CUR_QTR_PL||' OUTLOOK''
                                 AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                                )Z
                                
                                ON X.IOU_ID = Z.IOU_ID
                                AND X.ACCOUNT_ID = Z.ACCOUNT_ID 
                
                        UNION ALL
                        SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1 
          
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                                ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' PERIOD,
                              TO_CHAR(SERVICES_REV),
                                TO_CHAR(BOC_REV),
                                TO_CHAR(SUB_CON_REV),
                                TO_CHAR(TCS_LICENSE_REV),
                              TO_CHAR(TOTAL_REV),
                               TO_CHAR(INCR_HC),
                                TO_CHAR(CM_MARGIN),
                               TO_CHAR(BOC_COST_BMN_USD),
                              TO_CHAR(TCV_BMN_USD),
                              
                               '''' REMARKS----,TO_NUMBER('''') UPLOADED_BY,TO_NUMBER('''') UPDATED_BY
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' ||
                 V_CUR_QTR || '''
                           AND REGEXP_LIKE(UPPER(PERIOD), ''AOP'')
                              AND UPPER(T.PERIOD) NOT LIKE ''%REVISED%''
                            /*   and T.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*/   
                        UNION ALL
                        SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
        
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' PERIOD,
                               TO_CHAR(SERVICES_REV),
                                TO_CHAR(BOC_REV),
                                TO_CHAR(SUB_CON_REV),
                                TO_CHAR(TCS_LICENSE_REV),
                              TO_CHAR(TOTAL_REV),
                               TO_CHAR(INCR_HC),
                                TO_CHAR(CM_MARGIN),
                               TO_CHAR(BOC_COST_BMN_USD),
                              TO_CHAR(TCV_BMN_USD),
                                
                               '''' REMARKS----,TO_NUMBER('''') UPLOADED_BY,TO_NUMBER('''') UPDATED_BY
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' ||
                 V_CUR_QTR || '''
                           AND REGEXP_LIKE(UPPER(PERIOD), ''REVISED TARGET'')
                          /*  and T.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*/   
                        UNION ALL
                        SELECT B.IOU,
                              ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD,
                                '''' SERV_CUR_OUT_REV,-- TO_CHAR(B.SERV_CUR_OUT_REV),
                             '''' BOC_CUR_OUT_REV,-- TO_CHAR(B.BOC_CUR_OUT_REV),
                              '''' SUB_CON_CUR_OUT_REV,-- TO_cHAR(B.SUB_CON_CUR_OUT_REV),
                              '''' TCS_LICENSE_CUR_OUT_REV,--TO_CHAR(B.TCS_LICENSE_CUR_OUT_REV),
                              '''' TOTAL_CUR_OUT_REV,--TO_CHAR(B.TOTAL_CUR_OUT_REV),
                               TO_CHAR(B.CUR_HC_INCR),
                               TO_cHAR(B.CM_MARGIN),
                               TO_CHAR(B.CUR_COST),
                               TO_CHAR(B.TCV_BMN_USD),
                               B.REMARKS
                          FROM(SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
         
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) IOU,
                                                 T.PERIOD,
                                                 T.SERVICES_REV SERV_CUR_OUT_REV,
                                                 T.BOC_REV BOC_CUR_OUT_REV,
                                                 T.SUB_CON_REV SUB_CON_CUR_OUT_REV,
                                                 T.TCS_LICENSE_REV TCS_LICENSE_CUR_OUT_REV,
                                                 (SERVICES_REV +  BOC_REV + SUB_CON_REV + TCS_LICENSE_REV) TOTAL_CUR_OUT_REV,
                                                 T.INCR_HC CUR_HC_INCR,
                                                 T.BOC_COST_BMN_USD CUR_COST,
                                                 TO_NUMBER(CM_MARGIN) CM_MARGIN,
                                                 T.TCV_BMN_USD,
                                                 null REMARKS
                                            FROM btg_WKLY_PL_TGT T
                                           WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(T.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                                            /*  and T.account_id in (5601,5699,5587,5603,5600,5602,5698,5592) */  ) B
                                            
                                            
                                        ----ADDING FOR PREPAOPULATION 
                                        UNION ALL
                                         SELECT B.IOU,
                              ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD,
                                '''' SERV_CUR_OUT_REV,-- TO_CHAR(B.SERV_CUR_OUT_REV),
                             '''' BOC_CUR_OUT_REV,-- TO_CHAR(B.BOC_CUR_OUT_REV),
                              '''' SUB_CON_CUR_OUT_REV,-- TO_cHAR(B.SUB_CON_CUR_OUT_REV),
                              '''' TCS_LICENSE_CUR_OUT_REV,--TO_CHAR(B.TCS_LICENSE_CUR_OUT_REV),
                              '''' TOTAL_CUR_OUT_REV,--TO_CHAR(B.TOTAL_CUR_OUT_REV),
                               TO_CHAR(B.CUR_HC_INCR),
                               TO_cHAR(B.CM_MARGIN),
                               TO_CHAR(B.CUR_COST),
                               TO_CHAR(B.TCV_BMN_USD),
                               B.REMARKS
                          FROM(SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
         
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) IOU,
                                                 T.PERIOD,
                                                 T.SERVICES_REV SERV_CUR_OUT_REV,
                                                 T.BOC_REV BOC_CUR_OUT_REV,
                                                 T.SUB_CON_REV SUB_CON_CUR_OUT_REV,
                                                 T.TCS_LICENSE_REV TCS_LICENSE_CUR_OUT_REV,
                                                 (SERVICES_REV +  BOC_REV + SUB_CON_REV + TCS_LICENSE_REV) TOTAL_CUR_OUT_REV,
                                                 T.INCR_HC CUR_HC_INCR,
                                                 T.BOC_COST_BMN_USD CUR_COST,
                                                 TO_NUMBER(CM_MARGIN) CM_MARGIN,
                                                 T.TCV_BMN_USD,
                                                 null REMARKS
                                            FROM btg_WKLY_PL_TGT T
                                           WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_LAST_WEEK_PERIOD || '''
      AND (IoU_ID,sub_iou_id,account_id)
                                                   NOT IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER =''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND S.FILE_DATE = '''||V_PERIOD||'''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(T.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(T.PERIOD) NOT LIKE ''%CORP%'')B
    
                                            
                           )) N
                            ON M.ISU_NAME = N.NEW_SUB_GROUP
                            AND M.PERIOD = N.PERIOD
                            ORDER BY M.ISU_NAME,ID)';             
                            
                            ELSE 
                            IF I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0 THEN
                              V_APPEND_QRY:= 'AND SUB_IOU_ID = '||I_CLUS_ID;
                             ELSE
                               V_APPEND_QRY := '';
                              END IF;
                            
                            QRY := '
                                    SELECT Z.TOT,Z.TOT1,
   TO_CHAR(Z.SERVICES_REV),
   TO_CHAR(Z.BOC_REV),
   TO_CHAR(Z.SUB_CON_REV),
  TO_CHAR(Z.TCS_LICENSE_REV),
   TO_CHAR(Z.TOTAL_REV),
   TO_CHAR(Z.INCR_HC),
 TO_CHAR (((Z.TOTAL_REV - Z.CM_MARGIN)/Z.TOTAL_REV)*100),
   TO_CHAR(Z.BOC_COST_BMN_USD),
 TO_CHAR( Z.TCV_BMN_USD) ,
  ''''
   FROM ( SELECT ''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook ''||''Total^2'' TOT,
                 ''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook ''||''Total'' TOT1,
                 SUM(SERVICES_REV) SERVICES_REV,

SUM(BOC_REV) BOC_REV,
SUM(SUB_CON_REV) SUB_CON_REV,
SUM(TCS_LICENSE_REV) TCS_LICENSE_REV,
SUM(TOTAL_REV) TOTAL_REV,
SUM(INCR_HC) INCR_HC,
sum((1- (CM_MARGIN/100))*TOTAL_REV) CM_MARGIN,
SUM(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
ROUND(SUM(TCV_BMN_USD))TCV_BMN_USD,
TO_CHAR('''')
FROM btg_WKLY_PL_TGT S
  WHERE s.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (s.IoU_ID,s.sub_iou_id,s.account_id, s.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT o
                                                    WHERE o.QUARTER = ''' ||
                 V_CUR_QTR || '''
                 
                 AND IOU_ID = '||I_ISU_ID||'
                                '||V_APPEND_QRY||'
                                                         
                                                      AND o.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(s.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(s.PERIOD) NOT LIKE ''%CORP%'')Z

                            
                UNION ALL               
                            
                            
                        SELECT ISU_NAME,
                       PERIOD,
                       NVL(SERVICES_REV,''-'')  SERVICES_REV,
                       NVL(BOC_REV,''-'') BOC_REV,
                       NVL(SUB_CON_REV,''-'') SUB_CON_REV,
                       NVL(TCS_LICENSE_REV,''-'') TCS_LICENSE_REV,
                       NVL(TOTAL_REV,''-'') TOTAL_REV,
                       NVL(INCR_HC,''-'') INCR_HC,
                       NVL(CM_MARGIN,''-'') CM_MARGIN,
                       NVL(BOC_COST_BMN_USD,''-'') BOC_COST_BMN_USD,
                       NVL(TO_CHAR(ROUND(TCV_BMN_USD)),''-'') TCV_BMN_USD,
                       NVL(REMARKS,''-'') REMARKS
            FROM (SELECT M.ISU_NAME,
                       M.PERIOD,
                       M.ID,
                       N.SERVICES_REV,
                       N.BOC_REV,
                       N.SUB_CON_REV,
                       N.TCS_LICENSE_REV,
                       N.TOTAL_REV,
                       N.INCR_HC,
                       N.CM_MARGIN,
                       N.BOC_COST_BMN_USD,
                       N.TCV_BMN_USD,
                       N.REMARKS
              FROM (SELECT ISU_NAME,
                           ID,
                           PERIOD
                     FROM (SELECT DISTINCT I.SHORT_NAME ISU_NAME
                             FROM new_btg_account_mapping I 
                            WHERE 1=1
                          
                     AND I.ACCOUNT_ID IN (SELECT ACCOUNT_ID
                                      FROM new_btg_account_mapping I 
                                     WHERE I.IOU_ID =  '||I_ISU_ID||'
                                     '||V_APPEND_QRY||')
                          ) 
                 CROSS JOIN
               (SELECT 1 ID, ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD FROM DUAL
                UNION ALL
                SELECT 2 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' FROM DUAL
                UNION ALL
                SELECT 3 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' FROM DUAL
                UNION ALL
                SELECT 4 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' FROM DUAL))M
                LEFT OUTER JOIN
                (SELECT *
                  FROM (
          SELECT   X.NEW_SUB_GROUP,X.PERIOD,
TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                              TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                              TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                             


TO_CHAR(Z.REMARKS) REMARKS   FROM 
(          SELECT DISTINCT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          AND I.IOU_ID = '||I_ISU_ID||'
          '||V_APPEND_QRY||'
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                           ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD ,
                            SERVICES_REV,
                            BOC_REV,
                           SUB_CON_REV,
                            TCS_LICENSE_REV,
                             TOTAL_REV,
                              INCR_HC,
                           CM_MARGIN, ----==//Gross Margin Calculation
                          BOC_COST_BMN_USD,
                             TCV_BMN_USD,IOU_ID,ACCOUNT_ID
                        
                       FROM  BTG_WKLY_PL_PMO_TGT  T /*BTG_WKLY_PL_PMO_TGT t*/--- WKLY_ACCT_PMO_TGT S
                        WHERE t.QUATER = ''' ||
                 V_CUR_QTR || '''
                      AND UPPER(T.PERIOD) LIKE ''%ACTUAL%''
                        AND T.IOU_ID = '||I_ISU_ID||'
                        '||V_APPEND_QRY||'
                      AND T.ACCOUNT_ID  IN  (SELECT DISTINCT B.ACCOUNT_ID FROM BTG_WKLY_PL_PMO_TGT B
                                            WHERE  B.IOU_ID =  '||I_ISU_ID||'
                                         /*  '||V_APPEND_QRY||'
                                            AND B.ACCOUNT_ID = T.ACCOUNT_ID 
                                            AND B.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || ''' */
                ))X
                                            
                                            LEFT OUTER JOIN 
                                            
                                            
                                             (SELECT DISTINCT T.IOU_ID,T.ACCOUNT_ID, T.REMARKS
                                FROM btg_WKLY_PL_TGT T
                               WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                 AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                     (SELECT iou_id,sub_iou_id,account_id, MAX(FILE_DATE)
                                        FROM btg_WKLY_PL_TGT S
                                        WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                          AND IOU_ID = '||I_ISU_ID||'
                                          '||V_APPEND_QRY||'
                                          AND S.ACCOUNT_ID = T.ACCOUNT_ID
                                          AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                       GROUP BY IoU_ID,sub_iou_id,account_id)
                                 AND UPPER(T.PERIOD) = '''||V_CUR_QTR_PL||' OUTLOOK''
                                 AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                                )Z
                                
                                ON X.IOU_ID = Z.IOU_ID
                                AND X.ACCOUNT_ID = Z.ACCOUNT_ID 
                
                        UNION ALL
                        SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1 
           AND IOU_ID = '||I_ISU_ID||'
           '||V_APPEND_QRY||'
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                                ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' PERIOD,
                 TO_CHAR(SERVICES_REV)SERVICES_REV,
                            TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                              TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                              TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                               '''' REMARKS
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' ||
                 V_CUR_QTR || '''
                           AND REGEXP_LIKE(UPPER(PERIOD), ''AOP'')
                             AND UPPER(T.PERIOD) NOT LIKE ''%REVISED%''
                        UNION ALL
                        SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          AND IOU_ID = '||I_ISU_ID||'
           '||V_APPEND_QRY||'
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' PERIOD,
                 TO_CHAR(SERVICES_REV)SERVICES_REV,
                               TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                              TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                              TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                               '''' REMARKS
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' ||
                 V_CUR_QTR || '''
                           AND REGEXP_LIKE(UPPER(PERIOD), ''REVISED TARGET'')
                        UNION ALL
                        SELECT B.IOU,
                              ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD,
                               '''' SERV_CUR_OUT_REV,--TO_CHAR(B.SERV_CUR_OUT_REV),
                               '''' BOC_CUR_OUT_REV,--TO_CHAR(B.BOC_CUR_OUT_REV),
                               '''' SUB_CON_CUR_OUT_REV,--TO_cHAR(B.SUB_CON_CUR_OUT_REV),
                               '''' TCS_LICENSE_CUR_OUT_REV,--TO_CHAR(B.TCS_LICENSE_CUR_OUT_REV),
                               '''' TOTAL_CUR_OUT_REV,--TO_CHAR(B.TOTAL_CUR_OUT_REV),
                               TO_CHAR(B.CUR_HC_INCR),
                               TO_cHAR(B.CM_MARGIN),
                               TO_CHAR(B.CUR_COST),
                               TO_CHAR(B.TCV_BMN_USD),
                               B.REMARKS
                          FROM(SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          AND IOU_ID = '||I_ISU_ID||'
           '||V_APPEND_QRY||'
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) IOU,
                                                 T.PERIOD,
                                                 T.SERVICES_REV SERV_CUR_OUT_REV,
                                                 T.BOC_REV BOC_CUR_OUT_REV,
                                                 T.SUB_CON_REV SUB_CON_CUR_OUT_REV,
                                                 T.TCS_LICENSE_REV TCS_LICENSE_CUR_OUT_REV,
                                                 (SERVICES_REV +  BOC_REV + SUB_CON_REV + TCS_LICENSE_REV) TOTAL_CUR_OUT_REV,
                                                 T.INCR_HC CUR_HC_INCR,
                                                 T.BOC_COST_BMN_USD CUR_COST,
                                                 TO_NUMBER(CM_MARGIN) CM_MARGIN,
                                                 T.TCV_BMN_USD,
                                                 null REMARKS
                                            FROM btg_WKLY_PL_TGT T
                                           WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                            AND IOU_ID = '||I_ISU_ID||'
                                                                       '||V_APPEND_QRY||'
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(T.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(T.PERIOD) NOT LIKE ''%CORP%'') B
              ---adding for prepoulation 
               UNION ALL
                                         SELECT B.IOU,
                              ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD,
                                '''' SERV_CUR_OUT_REV,-- TO_CHAR(B.SERV_CUR_OUT_REV),
                             '''' BOC_CUR_OUT_REV,-- TO_CHAR(B.BOC_CUR_OUT_REV),
                              '''' SUB_CON_CUR_OUT_REV,-- TO_cHAR(B.SUB_CON_CUR_OUT_REV),
                              '''' TCS_LICENSE_CUR_OUT_REV,--TO_CHAR(B.TCS_LICENSE_CUR_OUT_REV),
                              '''' TOTAL_CUR_OUT_REV,--TO_CHAR(B.TOTAL_CUR_OUT_REV),
                               TO_CHAR(B.CUR_HC_INCR),
                               TO_cHAR(B.CM_MARGIN),
                               TO_CHAR(B.CUR_COST),
                               TO_CHAR(B.TCV_BMN_USD),
                               B.REMARKS
                          FROM(SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
         
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) IOU,
                                                 T.PERIOD,
                                                 T.SERVICES_REV SERV_CUR_OUT_REV,
                                                 T.BOC_REV BOC_CUR_OUT_REV,
                                                 T.SUB_CON_REV SUB_CON_CUR_OUT_REV,
                                                 T.TCS_LICENSE_REV TCS_LICENSE_CUR_OUT_REV,
                                                 (SERVICES_REV +  BOC_REV + SUB_CON_REV + TCS_LICENSE_REV) TOTAL_CUR_OUT_REV,
                                                 T.INCR_HC CUR_HC_INCR,
                                                 T.BOC_COST_BMN_USD CUR_COST,
                                                 TO_NUMBER(CM_MARGIN) CM_MARGIN,
                                                 T.TCV_BMN_USD,
                                                 null REMARKS
                                            FROM btg_WKLY_PL_TGT T
                                           WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_LAST_WEEK_PERIOD || '''
      AND (IoU_ID,sub_iou_id,account_id)
                                                   NOT IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER =''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND S.FILE_DATE = '''||V_PERIOD||'''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(T.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(T.PERIOD) NOT LIKE ''%CORP%'')B                               
                                             
                                             
                                             
                                             
                                             
                           )) N
                            ON M.ISU_NAME = N.NEW_SUB_GROUP
                            AND M.PERIOD = N.PERIOD
                            ORDER BY M.ISU_NAME,ID)';
                            END IF;
        
        ELSIF REPLACE(UPPER(I_SHEET_NAME),' ','') LIKE 'C-CONNECTSORCUSTOMERVISIT'  AND (I_GRID_COUNT = 3 OR I_GRID_COUNT = 1 )THEN
          V_SELECT      := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1
                   --LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2';
          O_NO_OF_INDEX := 0;
         
          IF UPPER(I_REPORT_NAME) = 'REPORT' THEN
          V_MEET_RES := '';
          ELSE
              V_MEET_RES := 'AND T.meeting_date > TRUNC(SYSDATE)';
            END IF;
        
          /*IF I_ISU_ID IS NULL OR I_ISU_ID = '0' THEN 
            V_COL_ADD := '(SELECT DISTINCT ISU_NAME FROM ISU_MSTR_NEW I WHERE I.ISU_ID = T.ISU_ID) ISU_NAME,';  
            V_ORDER_BY := 'ORDER BY 1,2';
          ELSE
            V_COL_ADD := '';
            V_ORDER_BY := 'ORDER BY 1';
          END IF;*/
        
         /* IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
              V_COL_ADD := '(SELECT DISTINCT IOU FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
              V_ORDER_BY := 'ORDER BY 1,2';
            ELSE
              V_COL_ADD  := '';
              V_ORDER_BY := 'ORDER BY 1';
            END IF;
          END IF;*/
          
          IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
               OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
              V_COL_ADD  := '(SELECT DISTINCT iou_short_name FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
              V_ORDER_BY := 'ORDER BY ACCOUNT ASC';
              ELSE
                V_COL_ADD  := '';
                v_dist := 'distinct';
              V_ORDER_BY := 'ORDER BY 1';
              END IF;
            ELSE
              V_COL_ADD  := '';
              V_ORDER_BY := 'ORDER BY 1';
              
            END IF;
          END IF;
 ----THIS CODE FOR NEW CHANGES 
 -----  
 
 IF UPPER(I_REPORT_NAME) = 'TEMPLATE' THEN  
   
open v_cur_2 for



 
  SELECT DISTINCT S.CATEGORY 
    
      FROM 
       WKLY_CUSTOMER_VISIT_TGT_NAME S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') <=  TO_DATE(V_PERIOD, 'DD/MM/RRRR')
               --TO_DATE(I_DATE, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) ;
               
         LOOP FETCH 
          V_CUR_2 INTO 
          V_CAT_CHK;
EXIT WHEN V_CUR_2% NOTFOUND;   
    
               
               
                --- FOR CHECKING THE SENTIMENT IS ENTERED IF THE DATES ARE IN PAST DATES
                
        IF UPPER(V_CAT_CHK) LIKE '%VISITS%' THEN        
        SELECT COUNT(1)
          INTO V_CHK_SEN_1
          FROM WKLY_CUSTOMER_VISIT_TGT_NAME S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') <= TO_DATE(V_PERIOD, 'DD/MM/RRRR')
               --TO_DATE(i_date, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
              
              (TO_DATE(S.VISIT_START_DATE, 'DD/MM/RRRR') <= TO_DATE(SYSDATE, 'DD/MM/RRRR')
              or TO_DATE( S.VISIT_END_DATE, 'DD/MM/RRRR') <= TO_DATE(SYSDATE, 'DD/MM/RRRR'))
              AND S.SENTIMENTS IS NULL
              
              and upper(s.CATEGORY) = upper(v_cat_chk) 
               
               ;
               
               
               END IF;
               
               
         IF UPPER(V_CAT_CHK) LIKE '%CONNECT%' THEN        
        SELECT COUNT(1)
          INTO V_CHK_SEN_2
          FROM WKLY_CUSTOMER_VISIT_TGT_NAME S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') <=TO_DATE(V_PERIOD, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
              S.MEETING_DATE <= TO_DATE(SYSDATE, 'DD/MM/RRRR') 
              AND S.SENTIMENTS IS NULL 
              and upper(s.CATEGORY) = upper(v_cat_chk) 
             
               ;
                
           END IF;       
           
           
           IF (V_CHK_SEN_1 <>0 OR V_CHK_SEN_2  <>0) AND UPPER(I_REPORT_NAME) = 'TEMPLATE'
             THEN 
              
                 V_VISIT_PRE :='<';
                   ELSE
                  V_VISIT_PRE := '';
             
                
                END IF;
                
                
                
                
                 V_CUR_QTR := FN_FETCH_QTR(IN_DATE => V_PERIOD);
          --  V_NEXT_QTR := fn_fetch_nxt_qtr(IN_DATE => V_PERIOD);
          
          
           
           
           -------checking for future dates 
              IF UPPER(V_CAT_CHK) LIKE '%VISITS%' THEN        
        SELECT COUNT(1)
          INTO V_CHK_SEN_3
          FROM WKLY_CUSTOMER_VISIT_TGT_NAME S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') <= TO_DATE(V_PERIOD, 'DD/MM/RRRR')
             --  V_PERIOD
               --TO_DATE(i_date, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
              
              (TO_DATE(S.VISIT_START_DATE, 'DD/MM/RRRR') >= TO_DATE(SYSDATE, 'DD/MM/RRRR')
              or TO_DATE( S.VISIT_END_DATE, 'DD/MM/RRRR') >= TO_DATE(SYSDATE, 'DD/MM/RRRR'))
               and upper(s.CATEGORY) = upper(v_cat_chk)
             AND S.SENTIMENTS IS NULL
               
               ;
               
               if V_CHK_SEN_3 <>0 then 
               
               select distinct MIN(s.visit_end_date) into v_visit_end_DATE  
               FROM WKLY_CUSTOMER_VISIT_TGT_NAME S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') <= TO_DATE(V_PERIOD, 'DD/MM/RRRR')
            
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
                 
             /* (TO_DATE(S.VISIT_START_DATE, 'DD/MM/RRRR') >= TO_DATE(SYSDATE, 'DD/MM/RRRR')
              or*/ TO_DATE( S.VISIT_END_DATE, 'DD/MM/RRRR') >= TO_DATE(SYSDATE, 'DD/MM/RRRR')
               and upper(s.CATEGORY) = upper(v_cat_chk)  ;
               
               
            V_CUR_QTR_5 := FN_FETCH_QTR(IN_DATE => v_visit_end_DATE);   
            
            end if;
               
               END IF;
               
         IF UPPER(V_CAT_CHK) LIKE '%CONNECT%' THEN        
        SELECT COUNT(1)
          INTO V_CHK_SEN_4
          FROM WKLY_CUSTOMER_VISIT_TGT_NAME S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') <= TO_DATE(V_PERIOD, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
              S.MEETING_DATE >= TO_DATE(SYSDATE, 'DD/MM/RRRR') 
               and upper(s.CATEGORY) = upper(v_cat_chk)
              AND S.SENTIMENTS  IS NULL 
             
               ;
               
               if V_CHK_SEN_4 <>0 then 
                 
               
               
                select DISTINCT S.MEETING_DATE into v_visit_end_DATE  
               FROM WKLY_CUSTOMER_VISIT_TGT_NAME S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') <= TO_DATE(V_PERIOD, 'DD/MM/RRRR')
            
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
                 
             S.MEETING_DATE >= TO_DATE(SYSDATE, 'DD/MM/RRRR')
             and upper(s.CATEGORY) = upper(v_cat_chk)  ;
             
               
            V_CUR_QTR_5 := FN_FETCH_QTR(IN_DATE => v_visit_end_DATE);   
              
            end if;  
           END IF;   
              END LOOP;

 


      CLOSE V_CUR_2;  
            
           END IF;   
            
          
                
         IF (V_CHK_SEN_3 <> 0 OR V_CHK_SEN_4  <> 0) AND UPPER(I_REPORT_NAME) = 'TEMPLATE'  
       THEN    
         
       --V_VISIT_QTR := CONCAT(V_CUR_QTR,CONCAT(',',V_CUR_QTR_5)); 
       --V_VISIT_QTR := CONCAT(V_CUR_QTR,CONCAT(char(39),CONCAT(',',CONCAT(char(39),V_CUR_QTR_5)))); 
         V_VISIT_QTR := V_CUR_QTR||''','''||V_CUR_QTR_5 ;
         V_VISIT_PRE :='<';
                 
       ELSE   
          V_VISIT_QTR := V_CUR_QTR; 
        --   V_VISIT_PRE :='<';
          END IF;
           
     IF UPPER(I_REPORT_NAME) = 'TEMPLATE'  THEN       
   SELECT MAX(FILE_DATE) INTO V_DATE_10  FROM WKLY_CUSTOMER_VISIT_TGT_NAME
               WHERE 1=1  
                  AND IOU_ID = IOU_ID AND SUB_IOU_ID =  I_CLUS_ID  AND ACCOUNT_ID = I_ACC_ID ;   
                  
                  IF V_DATE_10 =  V_PERIOD  THEN 
                    V_PRE := '';
                    ELSE
                      
                      V_PRE := 'AND SENTIMENTS IS NULL';
                      END IF; 
              ELSE 
                SELECT MAX(FILE_DATE) INTO V_DATE_10  FROM WKLY_CUSTOMER_VISIT_TGT_NAME
               WHERE 1=1  
                  AND IOU_ID = IOU_ID AND SUB_IOU_ID =  I_CLUS_ID  AND ACCOUNT_ID = I_ACC_ID ;   
                  
                 -- IF V_DATE_10 =  V_PERIOD  THEN 
                    V_PRE := '';
                 --  END IF;  
                      END IF;  
                  
               IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
              OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
                v_col_add_2 := 'distinct M.IOU_SHORT_NAME,';
                ELSE
                  V_COL_ADD_2 := '';
                  END IF;
               
                  --END IF;
                 -- V_PRE := 'AND SENTIMENTS IS NULL';
                
       IF UPPER(I_REPORT_NAME) = 'TEMPLATE' AND I_GRID_COUNT = 1 THEN  
--------------------------------------------------
       QRY := 'SELECT ' || V_COL_ADD || ' ACCOUNT,
            cust_name, 
category, 
tcs_partcipants_name, 
sentiments, 
 TO_CHAR(MEETING_DATE,''DD-MON-YYYY''), 
 TO_CHAR(visit_start_date,''DD-MON-YYYY''), 
 TO_CHAR(visit_end_date,''DD-MON-YYYY''), 
visit_location, 
objective, 
outcome FROM (SELECT
                    (select distinct M.SHORT_NAME 
                    from NEW_BTG_ACCOUNT_MAPPING M
             WHERE 1=1               ' || V_COND || 
                 '
                  AND M.SHORT_NAME = T.ACCOUNT  
                 and UPPER(M.Active) =''YES'' /* AND M.IOU_ID <>263*/ )Account,
                      T.cust_name, 
T.category, 
T.tcs_partcipants_name, 
T.sentiments, 
 T.MEETING_DATE,
T.visit_start_date, 
T.visit_end_date, 
T.visit_location, 
T.objective, 
T.outcome,
                    IOU_ID
                    
                FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
               WHERE T.FILE_DATE = (SELECT MAX(FILE_DATE) FROM WKLY_CUSTOMER_VISIT_TGT_NAME
               WHERE 1=1  
                  '||V_COND||') '||V_PRE||' 
                 ' || V_COND || ') ';
   END IF;              
                 
                 
                 
 IF UPPER(I_REPORT_NAME) = 'REPORT'    THEN  
                   
                   
                   
                 QRY := 'SELECT  '||V_COL_ADD||V_dist||' ACCOUNT,
            cust_name, 
category, 
tcs_partcipants_name, 
sentiments, 
 TO_CHAR(MEETING_DATE,''DD-MON-YYYY''), 
 TO_CHAR(visit_start_date,''DD-MON-YYYY''), 
 TO_CHAR(visit_end_date,''DD-MON-YYYY''), 
visit_location, 
objective, 
outcome FROM (SELECT
                    (select distinct M.SHORT_NAME 
                    from NEW_BTG_ACCOUNT_MAPPING M
             WHERE 1=1               ' || V_COND || 
                 '
                  AND M.SHORT_NAME = T.ACCOUNT  
                 and UPPER(M.Active) =''YES'' /* AND M.IOU_ID <>263 */)Account,
                      T.cust_name, 
T.category, 
T.tcs_partcipants_name, 
T.sentiments, 
T.MEETING_DATE, 
T.visit_start_date, 
T.visit_end_date, 
T.visit_location, 
T.objective, 
T.outcome,
                    IOU_ID
                    
                FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
                WHERE TO_DATE(T.FILE_DATE, ''DD/MM/RRRR'') = TO_DATE('''||V_PERIOD||''', ''DD/MM/RRRR'')
            
               /*(SELECT MAX(FILE_DATE) FROM WKLY_CUSTOMER_VISIT_TGT_NAME
               WHERE 1=1  
                  '||V_COND||V_PRE||')*/ 
                  '||V_COND || ') D
                 
                 
                 UNION ALL 
                 
                 select '||v_col_add_2||V_dist||'  M.SHORT_NAME,''-'',
''-'' a ,
''-'' b ,
''-'',
TO_CHAR(''-'') c ,

TO_CHAR(''-'') d ,
TO_CHAR(''-'') e,''-'' F,''-'' G,''-'' H from NEW_BTG_ACCOUNT_MAPPING M
WHERE 1=1           
                  '||V_COND||' and UPPER(M.Active) =''YES'' /*AND M.IOU_ID <>263*/
                     
                     
                     
 and m.account_id not in (select t.account_id FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
WHERE 

 TO_DATE(T.FILE_DATE, ''DD/MM/RRRR'') = TO_DATE('''||V_PERIOD||''', ''DD/MM/RRRR'')
/*(SELECT MAX(FILE_DATE)  FROM  WKLY_CUSTOMER_VISIT_TGT_NAME 
          WHERE 1=1           
                  '||V_COND||')*/ )';
                 
     END IF;            
                 
                 
              --  '||V_MEET_RES||'
  -- END IF;         
           
/*IF UPPER(I_REPORT_NAME) = 'REPORT' THEN 



QRY := 'SELECT ' || V_COL_ADD || ' ACCOUNT,
            cust_name, 
category, 
tcs_partcipants_name, 
sentiments, 
 TO_CHAR(MEETING_DATE,''DD-MON-YYYY''), 
 TO_CHAR(visit_start_date,''DD-MON-YYYY''), 
 TO_CHAR(visit_end_date,''DD-MON-YYYY''), 
visit_location, 
objective, 
outcome FROM (SELECT
                    (select distinct M.SHORT_NAME 
                    from NEW_BTG_ACCOUNT_MAPPING M
             WHERE 1=1               ' || V_COND || 
                 '
                  AND M.SHORT_NAME = T.ACCOUNT  
                 and UPPER(M.Active) =''YES''  AND M.IOU_ID <>263 )Account,
                      T.cust_name, 
T.category, 
T.tcs_partcipants_name, 
T.sentiments, 
 T.MEETING_DATE,
T.visit_start_date, 
T.visit_end_date, 
T.visit_location, 
T.objective, 
T.outcome,
                    IOU_ID
                    
                FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
               WHERE T.FILE_DATE = '''||V_PERIOD||''' '||V_PRE||' 
                 '|| V_COND || ') ';
              --  '||V_MEET_RES||'
            

        
          
   END IF;       
          */
          
          
        ---- TO_CHAR(MEETING_DATE,''DD-MON-YYYY''),
        ----CHANGES CODE
        
       /*       QRY := 'SELECT ' || V_COL_ADD || ' ACCOUNT,
            cust_name, 
category, 
tcs_partcipants_name, 
sentiments, 
 TO_CHAR(MEETING_DATE,''DD-MON-YYYY''), 
 TO_CHAR(visit_start_date,''DD-MON-YYYY''), 
 TO_CHAR(visit_end_date,''DD-MON-YYYY''), 
visit_location, 
objective, 
outcome FROM (SELECT
                    (select distinct M.SHORT_NAME 
                    from NEW_BTG_ACCOUNT_MAPPING M
             WHERE 1=1               ' || V_COND || 
                 '
                  AND M.SHORT_NAME = T.ACCOUNT  
                 and UPPER(M.Active) =''YES''  AND M.IOU_ID <>263 )Account,
                      T.cust_name, 
T.category, 
T.tcs_partcipants_name, 
T.sentiments, 
 T.MEETING_DATE,
T.visit_start_date, 
T.visit_end_date, 
T.visit_location, 
T.objective, 
T.outcome,
                    IOU_ID
                    
                FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
               WHERE T.FILE_DATE '||V_GRT_COND1||V_VISIT_PRE||'= ''' || V_PERIOD || '''
                 ' || V_COND || '
              --  '||V_MEET_RES||'
             and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER IN (''' || V_VISIT_QTR || ''')
              ' || V_COND || '
AND S.FILE_DATE '||V_GRT_COND1||V_VISIT_PRE||'= ''' || V_PERIOD || '''
 GROUP BY IoU_ID,sub_iou_id,account_id)
           
          UNION ALL
select distinct M.SHORT_NAME,'''',
'''' a ,
'''' b ,
'''',
TO_DATE('''') c ,

TO_DATE('''') d ,
TO_DATE('''') e,'''' F,'''' G,'''' H,IOU_ID from NEW_BTG_ACCOUNT_MAPPING M
WHERE 1=1               ' || V_COND || 
                 ' and UPPER(M.Active) =''YES'' AND M.IOU_ID <>263
and m.account_id not in (select t.account_id FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
WHERE T.FILE_DATE '||V_VISIT_PRE||'= ''' || V_PERIOD || '''

 and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER IN ( ''' || V_VISIT_QTR || ''')
              ' || V_COND || '
AND S.FILE_DATE '||V_VISIT_PRE||'= ''' || V_PERIOD || '''
 GROUP BY IoU_ID,sub_iou_id,account_id))) D
'||V_ORDER_BY||'';


*/

-----
        
        
        
        /*  QRY := 'SELECT ' || V_COL_ADD || ' ACCOUNT,
            cust_name, 
category, 
tcs_partcipants_name, 
sentiments, 
 TO_CHAR(MEETING_DATE,''DD-MON-YYYY''), 
 TO_CHAR(visit_start_date,''DD-MON-YYYY''), 
 TO_CHAR(visit_end_date,''DD-MON-YYYY''), 
visit_location, 
objective, 
outcome FROM (SELECT
                    (select distinct M.SHORT_NAME 
                    from NEW_BTG_ACCOUNT_MAPPING M
             WHERE 1=1               ' || V_COND || 
                 '
                  AND M.SHORT_NAME = T.ACCOUNT  
                 and UPPER(M.Active) =''YES''  AND M.IOU_ID <>263 )Account,
                      T.cust_name, 
T.category, 
T.tcs_partcipants_name, 
T.sentiments, 
 T.MEETING_DATE,
T.visit_start_date, 
T.visit_end_date, 
T.visit_location, 
T.objective, 
T.outcome,
                    IOU_ID
                    
                FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
               WHERE T.FILE_DATE '||V_GRT_COND1||V_GRT_COND||'= ''' || V_PERIOD || '''
                 ' || V_COND || '
                '||V_MEET_RES||'
             and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE '||V_GRT_COND1||V_GRT_COND||'= ''' || V_PERIOD || '''
 GROUP BY IoU_ID,sub_iou_id,account_id)
           
          UNION ALL
select distinct M.SHORT_NAME,'''',
'''' a ,
'''' b ,
'''',
TO_DATE('''') c ,

TO_DATE('''') d ,
TO_DATE('''') e,'''' F,'''' G,'''' H,IOU_ID from NEW_BTG_ACCOUNT_MAPPING M
WHERE 1=1               ' || V_COND || 
                 ' and UPPER(M.Active) =''YES'' AND M.IOU_ID <>263
and m.account_id not in (select t.account_id FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
WHERE T.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
'||V_MEET_RES||'
 and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
 GROUP BY IoU_ID,sub_iou_id,account_id))) D
'||V_ORDER_BY||'';
        */
        ELSIF TRIM(UPPER(I_SHEET_NAME)) LIKE 'CLOSED' 
           AND (I_GRID_COUNT = 1 OR I_GRID_COUNT = 4)  THEN
        
          V_SELECT      := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1
                   --LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2';
          O_NO_OF_INDEX := 0;
          /*IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
              V_COL_ADD := '(SELECT DISTINCT IOU FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
            ELSE
              V_COL_ADD := '';
            END IF;
          END IF;
        */
        
        IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
               OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
              V_COL_ADD  := '(SELECT DISTINCT IOU_SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
               V_ORDER_BY := 'ORDER BY GROUP_CLIENT ASC';
              
              ELSE
                V_COL_ADD  := '';
                V_ORDER_BY := '';

              END IF;
            ELSE
              V_COL_ADD  := '';
             V_ORDER_BY := '';
            END IF;
          END IF;
          
         /* QRY := 'SELECT ' || V_COL_ADD ||
                 'GROUP_CLIENT,opp_id,
       opp_name,
       opp_value,
       renew_opp_value,
       closure_month,
       Competitors,
       sales_stage,
       reason_for_loss_win FROM 
       (SELECT
        (select distinct M.GROUP_CUSTOMER from NEW_BTG_ACCOUNT_MAPPING M
             WHERE 1=1               ' || V_COND || ' 
              AND M.GROUP_CUSTOMER = T.GROUP_CUSTOMER
              and UPPER(M.Active) =''YES'' ) GROUP_CLIENT,
       t.opp_id,
       t.opp_name,
       t.opp_value,
       t.renew_opp_value,
       t.closure_month,
       t.competitors,
       t.sales_stage,
       t.reason_for_loss_win,
       iOU_ID      
      
      

                  FROM WKLY_LOSSES_TGT T
                  WHERE T.FILE_DATE = ''' || V_PERIOD || '''
                 ' || V_COND || '
                 and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE <= ''' || V_PERIOD || '''
 GROUP BY IoU_ID,sub_iou_id,account_id)
                 UNION ALL
select distinct M.GROUP_CUSTOMER,'''',
'''' a ,
'''' b ,
''''c ,



'''' d ,
''''e,
'''' f ,
'''' g,
IOU_ID
 from NEW_BTG_ACCOUNT_MAPPING M
WHERE 1=1               ' || V_COND || ' and UPPER(M.Active) =''YES''
and m.account_id not in (select t.account_id FROM WKLY_LOSSES_TGT T
WHERE T.FILE_DATE = ''' || V_PERIOD || ''')) D';*/

QRY := 'SELECT '||V_COL_ADD||' GROUP_CLIENT,
       OPPORTUNITY_ID,
       OPPORTUNITY_NAME,
        CONTRACT_VAL,
        RENEWAL_VALUE,
         CLOSE_DATE,
          PRIMARY_COMPETITOR,
           SALES_STAGE,

      REASON_FOR_LOSS_WIN 

  FROM (SELECT DISTINCT SUBSTR(GROUP_CLIENT,16)GROUP_CLIENT,
                        OPPORTUNITY_ID,
                        OPPORTUNITY_NAME,
                        OPP_DESCRIPTION,
                        REPLACE(PRIMARY_COMPETITOR, ''#'', '','') PRIMARY_COMPETITOR,
                        SALES_STAGE,
                        F_PPT(CONTRACT_VAL, ''V12'') CONTRACT_VAL,
                        F_PPT(RENEWAL_VALUE, ''V12'') RENEWAL_VALUE,
                       REASON_FOR_LOSS_WIN,
                        CLOSE_DATE,
                        DECODE(INSTR(BUYING_STAKEHOLDER, ''(''),
                               0,
                               BUYING_STAKEHOLDER,
                               SUBSTR(BUYING_STAKEHOLDER,
                                      0,
                                      INSTR(BUYING_STAKEHOLDER, ''('') - 1)) BUYING_STAKEHOLDER,
                        SP,
                        DECODE(PRIMARY_FOCUS,
                               ''Cost & Optimization'',
                               ''Cu Cost & Optimization'',
                               ''Growth & Transformation'',
                               ''G Growth & Transformation'',
                               PRIMARY_FOCUS) PRIMARY_FOCUS,
                               IOU_ID
          FROM (SELECT DISTINCT O.OPPORTUNITY_ID,
                                O.GROUP_CLIENT,
                                O.OPPORTUNITY_NAME,
                                O.SALES_STAGE,
                                (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000) CONTRACT_VAL,
                                TO_CHAR(TO_DATE(O.ACTUAL_CLOSE_DATE, ''DD-MON-YY''),
                                        ''DD-MON-YYYY'') CLOSE_DATE,
                                O.service_practices SP,
                                O.COMPETITORS PRIMARY_COMPETITOR,
                                O.BUYING_STAKEHOLDER,
                                O.PRIMARY_FOCUS,
                                (to_number(decode(O.renewal_portion_of_tocv_usd,''null'',0,renewal_portion_of_tocv_usd)/ 1000000)) RENEWAL_VALUE,
                                O.OPPORTUNITY_DESCRIPTION OPP_DESCRIPTION,
                                T.REASON_FOR_LOSS_WIN,
                                O.IOU_ID
                  FROM WKLY_losses_TGT T,
                   OPPORTUNITY_BTG_WSR O
                 WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID, T.FILE_DATE) IN
                       (SELECT S.IOU_ID,S.SUB_IOU_ID,S.ACCOUNT_ID, MAX(FILE_DATE)
                          FROM BTG_WKLY_PL_TGT S
                         WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                         ' || V_COND || '
                         AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                        GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID)
                   AND T.IOU_ID = O.IOU_ID
                   AND T.SUB_IOU_ID = O.SUB_IOU_ID
                   AND T.ACCOUNT_ID = O.ACCOUNT_ID
                   AND T.OPP_ID = O.OPPORTUNITY_ID
                   AND O.DATESTAMP =
                       (SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR)
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN (10,11,12,13)
                   AND NOT ACTUAL_CLOSE_DATE = ''null''                   
                   AND TO_DATE(O.ACTUAL_CLOSE_DATE,''DD-MON-YYYY'') >= TO_DATE('''||V_FROM_DATE||''',''DD-MON-YYYY'') 
                    AND TO_DATE(O.ACTUAL_CLOSE_DATE,''DD-MON-YYYY'') <=  TO_DATE('''||V_TO_DATE||''',''DD-MON-YYYY'') 
                UNION ALL
                SELECT DISTINCT O.OPPORTUNITY_ID,
                                O.GROUP_CLIENT,
                                O.OPPORTUNITY_NAME,
                                O.SALES_STAGE,
                                (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000) CONTRACT_VAL,
                                TO_CHAR(TO_DATE(O.ACTUAL_CLOSE_DATE, ''DD-MON-YY''),
                                        ''DD-MON-YYYY'') CLOSE_DATE,
                                O.service_practices ,
                                O.COMPETITORS,
                                O.BUYING_STAKEHOLDER,
                                O.PRIMARY_FOCUS,
                                (to_number(decode(O.renewal_portion_of_tocv_usd,''null'',0,renewal_portion_of_tocv_usd)/ 1000000)) RENEWAL_VALUE,
                                O.OPPORTUNITY_DESCRIPTION,
                                '''' REASON_FOR_LOSS_WIN,
                                O.IOU_ID
                  FROM OPPORTUNITY_BTG_WSR O
                 WHERE O.DATESTAMP =
                       (SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR)
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN (10,11,12,13)
                   AND NOT ACTUAL_CLOSE_DATE = ''null''
                   AND TO_DATE(O.ACTUAL_CLOSE_DATE,''DD-MON-YYYY'') >=  TO_DATE('''||V_FROM_DATE||''',''DD-MON-YYYY'') 
                    AND TO_DATE(O.ACTUAL_CLOSE_DATE,''DD-MON-YYYY'') <=  TO_DATE('''||V_TO_DATE||''',''DD-MON-YYYY'')
                   ' || V_COND || '
                     AND O.ACCOUNT_ID IN (select distinct t.account_id from new_btg_account_mapping t /*WHERE  T.IOU_ID <>263*/)
                   AND O.OPPORTUNITY_ID NOT IN
                       (SELECT T.OPP_ID
                          FROM WKLY_losses_TGT T
                         WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID,T.FILE_DATE) IN
                               (SELECT S.IOU_ID,S.SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
                                  FROM BTG_WKLY_PL_TGT S
                                 WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                                 ' || V_COND || '
                                 AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                                 GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID)))
         WHERE CONTRACT_VAL > 1
         ORDER BY CONTRACT_VAL DESC)D
         '||V_ORDER_BY||'';
         
         DELETE FROM X_TST_1;
         COMMIT;
         INSERT INTO X_TST_1 VALUES(QRY);
         COMMIT;
         
           EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 0, ' || '''N''' || ', ' ||
                        '''Y''' || ') FROM(' || QRY || ')'
        INTO V_LOSS_CHECK;
         
            IF (V_LOSS_CHECK ='N')/* AND (TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE')*/
        THEN 
        
       /* QRY:= '
        SELECT ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'' ,
          ''-''
             FROM DUAL';
        END IF;*/
        
        QRY := '
            SELECT DISTINCT '||V_COL_ADD||' SUBSTR(GROUP_CUSTOMER,16),
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'' ,
         ''-''
             FROM  NEW_BTG_ACCOUNT_MAPPING D 
               WHERE 1= 1 /*AND D.IOU_ID <>263*/
            '||V_COND||' ';
             END IF;

        
        ELSIF TRIM(UPPER(I_SHEET_NAME)) LIKE 'WINS'  AND (I_GRID_COUNT = 1 OR I_GRID_COUNT = 4) THEN 
        
        
          V_SELECT      := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1
                   --LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2';
          O_NO_OF_INDEX := 0;
          /*IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
              V_COL_ADD := '(SELECT DISTINCT IOU FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
            ELSE
              V_COL_ADD := '';
            END IF;
          END IF;*/
          
          IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
               OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
              V_COL_ADD  := '(SELECT DISTINCT IOU_SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
        V_ORDER_BY := 'ORDER BY GROUP_CLIENT ASC';
              
              ELSE
                V_COL_ADD  := '';
                 V_ORDER_BY :='';

              END IF;
            ELSE
              V_COL_ADD  := '';
                V_ORDER_BY :='';

            END IF;
          END IF;
        
     /*     QRY := 'SELECT ' || V_COL_ADD ||
                 ' GROUP_CLIENT ,opp_id,
       opp_name,
       total_of_con_value,
       renew_portion_toc,
       closure_month,
       competitors,
       reason_for_loss_win  FROM (SELECT 
        (select distinct M.GROUP_CUSTOMER from NEW_BTG_ACCOUNT_MAPPING M
             WHERE         1=1       ' || V_COND || ' 
              AND M.GROUP_CUSTOMER = T.GROUP_CUSTOMER
              and UPPER(M.Active) =''YES'' ) GROUP_CLIENT,
       t.opp_id,
       t.opp_name,
       t.total_of_con_value,
       t.renew_portion_toc,
       t.closure_month,
       t.competitors,
       t.reason_for_loss_win,
       T.IOU_ID
      

                  FROM WKLY_WINS_TGT T
                  WHERE T.FILE_DATE = ''' || V_PERIOD || '''
                 ' || V_COND || '
                 and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE <= ''' || V_PERIOD || '''
 GROUP BY IoU_ID,sub_iou_id,account_id)
                 UNION ALL
select distinct M.GROUP_CUSTOMER,'''',
'''' a ,
'''' b ,
''''c ,



'''' d ,
''''e,
'''' f ,
IOU_ID  from NEW_BTG_ACCOUNT_MAPPING M
WHERE        1=1        ' || V_COND || ' and UPPER(M.Active) =''YES''
and m.account_id not in (select t.account_id FROM WKLY_WINS_TGT T
WHERE T.FILE_DATE = ''' || V_PERIOD || ''')) D';*/


  QRY := 'SELECT '||V_COL_ADD||' GROUP_CLIENT,
       OPPORTUNITY_ID,
       OPPORTUNITY_NAME,
        CONTRACT_VAL,
        RENEWAL_VALUE,
         CLOSE_DATE,
          PRIMARY_COMPETITOR,

      REASON_FOR_LOSS_WIN 

  FROM (SELECT DISTINCT SUBSTR(GROUP_CLIENT,16)GROUP_CLIENT,
                        OPPORTUNITY_ID,
                        OPPORTUNITY_NAME,
                        OPP_DESCRIPTION,
                        REPLACE(PRIMARY_COMPETITOR, ''#'', '','') PRIMARY_COMPETITOR,
                        SALES_STAGE,
                        F_PPT(CONTRACT_VAL, ''V12'') CONTRACT_VAL,
                        F_PPT(RENEWAL_VALUE, ''V12'') RENEWAL_VALUE,
                       REASON_FOR_LOSS_WIN,
                        CLOSE_DATE,
                        DECODE(INSTR(BUYING_STAKEHOLDER, ''(''),
                               0,
                               BUYING_STAKEHOLDER,
                               SUBSTR(BUYING_STAKEHOLDER,
                                      0,
                                      INSTR(BUYING_STAKEHOLDER, ''('') - 1)) BUYING_STAKEHOLDER,
                        SP,
                        DECODE(PRIMARY_FOCUS,
                               ''Cost & Optimization'',
                               ''Cu Cost & Optimization'',
                               ''Growth & Transformation'',
                               ''G Growth & Transformation'',
                               PRIMARY_FOCUS) PRIMARY_FOCUS,
                               IOU_ID
          FROM (SELECT DISTINCT O.OPPORTUNITY_ID,
                                O.GROUP_CLIENT,
                                O.OPPORTUNITY_NAME,
                                O.SALES_STAGE,
                                (to_number(decode(O.TOTAL_OFF_CONTRACT_VAL_USD,''null'',0,TOTAL_OFF_CONTRACT_VAL_USD)) / 1000000) CONTRACT_VAL,
                                TO_CHAR(TO_DATE(O.ACTUAL_CLOSE_DATE, ''DD-MON-YY''),
                                        ''DD-MON-YYYY'') CLOSE_DATE,
                                O.service_practices SP,
                                O.COMPETITORS PRIMARY_COMPETITOR,
                                O.BUYING_STAKEHOLDER,
                                O.PRIMARY_FOCUS,
                                (to_number(decode(O.renewal_portion_of_tocv_usd,''null'',0,renewal_portion_of_tocv_usd)/ 1000000)) RENEWAL_VALUE,
                                O.OPPORTUNITY_DESCRIPTION OPP_DESCRIPTION,
                                T.REASON_FOR_LOSS_WIN,O.IOU_ID
                  FROM WKLY_WINS_TGT T,
                   OPPORTUNITY_BTG_WSR O
                 WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID, T.FILE_DATE) IN
                       (SELECT S.IOU_ID,S.SUB_IOU_ID,S.ACCOUNT_ID, MAX(FILE_DATE)
                          FROM BTG_WKLY_PL_TGT S
                         WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                         ' || V_COND || '
                         AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                        GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID)
                   AND T.IOU_ID = O.IOU_ID
                   AND T.SUB_IOU_ID = O.SUB_IOU_ID
                   AND T.ACCOUNT_ID = O.ACCOUNT_ID
                   AND T.OPP_ID = O.OPPORTUNITY_ID
                     /* AND  T.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*/
                   AND O.DATESTAMP =
                       (SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR)
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN (9)
                   AND TO_DATE(O.ACTUAL_CLOSE_DATE,''DD-MON-YYYY'') >= TO_DATE('''||V_FROM_DATE||''',''DD-MON-YYYY'') 
                    AND TO_DATE(O.ACTUAL_CLOSE_DATE,''DD-MON-YYYY'') <=  TO_DATE('''||V_TO_DATE||''',''DD-MON-YYYY'') 
                UNION ALL
                SELECT DISTINCT O.OPPORTUNITY_ID,
                                O.GROUP_CLIENT,
                                O.OPPORTUNITY_NAME,
                                O.SALES_STAGE,
                                (to_number(decode(O.TOTAL_OFF_CONTRACT_VAL_USD,''null'',0,TOTAL_OFF_CONTRACT_VAL_USD)) / 1000000) CONTRACT_VAL,
                                TO_CHAR(TO_DATE(O.ACTUAL_CLOSE_DATE, ''DD-MON-YY''),
                                        ''DD-MON-YYYY'') CLOSE_DATE,
                                O.service_practices ,
                                O.COMPETITORS,
                                O.BUYING_STAKEHOLDER,
                                O.PRIMARY_FOCUS,
                                (to_number(decode(O.renewal_portion_of_tocv_usd,''null'',0,renewal_portion_of_tocv_usd)/ 1000000)) RENEWAL_VALUE,
                                O.OPPORTUNITY_DESCRIPTION,
                                '''' REASON_FOR_LOSS_WIN,O.IOU_ID
                  FROM OPPORTUNITY_BTG_WSR O
                 WHERE O.DATESTAMP =
                       (SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR)
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN (9)
                   AND TO_DATE(O.ACTUAL_CLOSE_DATE,''DD-MON-YYYY'') >=  TO_DATE('''||V_FROM_DATE||''',''DD-MON-YYYY'') 
                    AND TO_DATE(O.ACTUAL_CLOSE_DATE,''DD-MON-YYYY'') <=  TO_DATE('''||V_TO_DATE||''',''DD-MON-YYYY'')
                   ' || V_COND || '
                     AND O.ACCOUNT_ID IN (select distinct t.account_id from new_btg_account_mapping t /*WHERE  T.IOU_ID <>263*/)
                   
                    /*  AND  O.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*/
                   AND O.OPPORTUNITY_ID NOT IN
                       (SELECT T.OPP_ID
                          FROM WKLY_WINS_TGT T
                         WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID,T.FILE_DATE) IN
                               (SELECT S.IOU_ID,S.SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
                                  FROM BTG_WKLY_PL_TGT S
                                 WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                                 ' || V_COND || '
                                 AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                                 GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID)))
         WHERE CONTRACT_VAL > 1
         ORDER BY CONTRACT_VAL DESC)D
        '|| V_ORDER_BY||'';
        
        DELETE FROM HD_DUMMY;
        COMMIT;
        INSERT INTO HD_DUMMY VALUES(QRY);
        COMMIT;

         
          EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 0, ' || '''N''' || ', ' ||
                        '''Y''' || ') FROM(' || QRY || ')'
        INTO V_WINS_CHECK;
        
        IF (V_WINS_CHECK ='N')/* AND (TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE')*/
        THEN 
        
      /*  QRY:= '
        SELECT ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'' FROM DUAL';
        END IF;*/
       -----ADDED V_COL_ADD HERE IN ORDER TO HANDLE IOU AND WHOLE BG REPORT  
           QRY := '
            SELECT DISTINCT '||V_COL_ADD||' SUBSTR(GROUP_CUSTOMER,16),
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-''
        
             FROM  NEW_BTG_ACCOUNT_MAPPING D 
               WHERE 1= 1 /*AND D.IOU_ID <>263*/
            '||V_COND||' ';
             END IF;
         
        


        
       ELSIF TRIM(UPPER(I_SHEET_NAME)) LIKE 'PIPELINE' 
          AND (I_GRID_COUNT = 1 OR I_GRID_COUNT = 4)  THEN
        
          V_SELECT      := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1
                   --LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2';
          O_NO_OF_INDEX := 0;
          /*IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
              V_COL_ADD := '(SELECT DISTINCT IOU FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
            ELSE
              V_COL_ADD := '';
            END IF;
          END IF;*/
          
          IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
               OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
              V_COL_ADD  := '(SELECT DISTINCT iou_short_name FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
             V_ORDER_BY := 'ORDER BY GROUP_CLIENT ASC';
              ELSE
                V_COL_ADD  := '';
                 V_ORDER_BY := '';

              END IF;
            ELSE
              V_COL_ADD  := '';
               V_ORDER_BY := '';
            END IF;
          END IF;
          
      if I_ISU_Id = 0 then  --OR I_ISU_ID= 263 THEN 
        
      v_pipeline_cond := ' UNION ALL
                SELECT DISTINCT O.OPPORTUNITY_ID,
                                O.GROUP_CLIENT,
                                O.OPPORTUNITY_NAME,
                                O.SALES_STAGE,
                                (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000) CONTRACT_VAL,
                                TO_CHAR(TO_DATE(O.EXPECTED_CLOSE_DATE, ''DD-MON-YY''),
                                        ''DD-MON-YYYY'') CLOSE_DATE,
                                O.service_practices ,
                                O.COMPETITORS,
                                O.BUYING_STAKEHOLDER,
                                O.PRIMARY_FOCUS,
                                (to_number(decode(O.renewal_portion_of_tocv_usd,''null'',0,renewal_portion_of_tocv_usd)/ 1000000)) RENEWAL_VALUE,
                                O.OPPORTUNITY_DESCRIPTION,
                                '''' STATUS_UPDATE,
                                TO_NUMBER(O.IOU_ID)
                  FROM OPPORTUNITY_BTG_WSR O
                 WHERE O.DATESTAMP =
                       (SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR)
                   AND UPPER(CONFIDENTIAL_FLAG) = ''N''
                      AND (( (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000)  > 49
              
                
                
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN (2,3,4, 5, 6, 7, 8)) OR 
                 (   (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000)  >= 5
                
                
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN ( 4, 5, 6, 7, 8))) 
                   and IOU_ID = 263 
                  
                   ' || V_COND || '
                     AND O.ACCOUNT_ID IN (select distinct t.account_id from new_btg_account_mapping t )
                   AND O.OPPORTUNITY_ID NOT IN
                       (SELECT T.CRM_ID
                          FROM WKLY_BTG_PIPELINE_TGT T
                         WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID,T.FILE_DATE) IN
                               (SELECT S.IOU_ID,S.SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
                                  FROM BTG_WKLY_PL_TGT S
                                 WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                                 ' || V_COND || '
                                 AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                                 GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID))
                                 
                                
                                 
      ';
                   
                   V_PIPELINE_COND_2 := 'AND IOU_ID <>  263 AND (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000)  > 49
                
                
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN ( 2,3,4, 5, 6, 7, 8) ';
                   
                   
                   ELSif i_isu_id <> 263 then  
                     
                      v_pipeline_cond_2 := ' AND (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000)  > 49
                
                
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN ( 2,3,4, 5, 6, 7, 8)
                  ';
                  ELSE 
                    V_PIPELINE_COND_2 := ' AND (( (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000)  > 49
              
                
                
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN (2,3,4, 5, 6, 7, 8)) OR 
                 (   (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000)  >= 5
                
                
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN ( 4, 5, 6, 7, 8)))';
                   
                   --  V_PIPELINE_COND_2 :=' and iou_id <> 263 ';
                     END IF; 
        
   
 ------Line No:6254 Added by Sruthi on 26/01/2023-----------
QRY := 'SELECT '||V_COL_ADD||' GROUP_CLIENT,
       OPPORTUNITY_ID,
       OPPORTUNITY_NAME,
       OPP_DESCRIPTION,
       SALES_STAGE,
       CONTRACT_VAL,
       RENEWAL_VALUE,
       CLOSE_DATE,
       BUYING_STAKEHOLDER,
       SP,
       PRIMARY_FOCUS,
       PRIMARY_COMPETITOR,
       STATUS_UPDATE  
  FROM (SELECT DISTINCT SUBSTR(GROUP_CLIENT,16)GROUP_CLIENT,
                        OPPORTUNITY_ID,
                        OPPORTUNITY_NAME,
                        OPP_DESCRIPTION,
                        REPLACE(PRIMARY_COMPETITOR, ''#'', '','') PRIMARY_COMPETITOR,
                        SALES_STAGE,
                        F_PPT(CONTRACT_VAL, ''V12'') CONTRACT_VAL,
                        F_PPT(RENEWAL_VALUE, ''V12'') RENEWAL_VALUE,
                        STATUS_UPDATE,
                        CLOSE_DATE,
                        DECODE(INSTR(BUYING_STAKEHOLDER, ''(''),
                               0,
                               BUYING_STAKEHOLDER,
                               SUBSTR(BUYING_STAKEHOLDER,
                                      0,
                                      INSTR(BUYING_STAKEHOLDER, ''('') - 1)) BUYING_STAKEHOLDER,
                        SP,
                        DECODE(PRIMARY_FOCUS,
                               ''Cost & Optimization'',
                               ''C&O Cost & Optimization'',
                               ''Growth & Transformation'',
                               ''G&T Growth & Transformation'',
                               PRIMARY_FOCUS) PRIMARY_FOCUS,
                               IOU_ID
          FROM (SELECT DISTINCT T.CRM_ID  OPPORTUNITY_ID,
                                T.GROUP_CLIENT,
                                T.OPPORTUNITY_NAME,
                                T.SALES_STAGE,
                                TO_NUMBER(T.DEAL_VALUE) CONTRACT_VAL,
                                T.CLOSURE_MONTH  CLOSE_DATE,
                                T.SP,
                                T.PRIMARY_COMPETITORS PRIMARY_COMPETITOR,
                                T.BUYING_STAKEHOLDER,
                                T.PRIMARY_FOCUS,
                                T.RENEWAL_VALUE,
                                T.OPP_DESCRIPTION,
                                T.STATUS_UPDATE,
                                T.IOU_ID
                  FROM WKLY_BTG_PIPELINE_TGT T
                 
                 
                 WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID, T.FILE_DATE) IN
                       (SELECT S.IOU_ID,S.SUB_IOU_ID,S.ACCOUNT_ID, MAX(FILE_DATE)
                          FROM BTG_WKLY_PL_TGT S
                         WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                         
                         ' || V_COND || '
                         AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                        GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID)
                       
                    AND SUBSTR(T.SALES_STAGE, 1, 2) IN (0,1,2, 3, 4, 5, 6, 7, 8)
                    
                    
                     UNION ALL
                SELECT DISTINCT O.OPPORTUNITY_ID,
                                O.GROUP_CLIENT,
                                O.OPPORTUNITY_NAME,
                                O.SALES_STAGE,
                                (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000) CONTRACT_VAL,
                                TO_CHAR(TO_DATE(O.EXPECTED_CLOSE_DATE, ''DD-MON-YY''),
                                        ''DD-MON-YYYY'') CLOSE_DATE,
                                O.service_practices ,
                                O.COMPETITORS,
                                O.BUYING_STAKEHOLDER,
                                O.PRIMARY_FOCUS,
                                (to_number(decode(O.renewal_portion_of_tocv_usd,''null'',0,renewal_portion_of_tocv_usd)/ 1000000)) RENEWAL_VALUE,
                                O.OPPORTUNITY_DESCRIPTION,
                                '''' STATUS_UPDATE,
                                TO_NUMBER(O.IOU_ID)
                  FROM OPPORTUNITY_BTG_WSR O
                 WHERE O.DATESTAMP =
                       (SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR)
                  
                '||v_pipeline_cond_2||'
               
                
                  
                  
                   ' || V_COND || '
                     AND O.ACCOUNT_ID IN (select distinct t.account_id from new_btg_account_mapping t )
                   AND O.OPPORTUNITY_ID NOT IN
                       (SELECT T.CRM_ID
                          FROM WKLY_BTG_PIPELINE_TGT T
                         WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID,T.FILE_DATE) IN
                               (SELECT S.IOU_ID,S.SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
                                  FROM BTG_WKLY_PL_TGT S
                                 WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                                 ' || V_COND || '
                                 AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                                 GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID))
                                 '||V_PIPELINE_COND||'
              
            )
        
         ORDER BY CONTRACT_VAL DESC)D
         '||V_ORDER_BY||'';
/*
QRY := 'SELECT '||V_COL_ADD||' GROUP_CLIENT,
       OPPORTUNITY_ID,
       OPPORTUNITY_NAME,
       OPP_DESCRIPTION,
       SALES_STAGE,
       CONTRACT_VAL,
       RENEWAL_VALUE,
       CLOSE_DATE,
       BUYING_STAKEHOLDER,
       SP,
       PRIMARY_FOCUS,
       PRIMARY_COMPETITOR,
       STATUS_UPDATE  
  FROM (SELECT DISTINCT SUBSTR(GROUP_CLIENT,16)GROUP_CLIENT,
                        OPPORTUNITY_ID,
                        OPPORTUNITY_NAME,
                        OPP_DESCRIPTION,
                        REPLACE(PRIMARY_COMPETITOR, ''#'', '','') PRIMARY_COMPETITOR,
                        SALES_STAGE,
                        F_PPT(CONTRACT_VAL, ''V12'') CONTRACT_VAL,
                        F_PPT(RENEWAL_VALUE, ''V12'') RENEWAL_VALUE,
                        STATUS_UPDATE,
                        CLOSE_DATE,
                        DECODE(INSTR(BUYING_STAKEHOLDER, ''(''),
                               0,
                               BUYING_STAKEHOLDER,
                               SUBSTR(BUYING_STAKEHOLDER,
                                      0,
                                      INSTR(BUYING_STAKEHOLDER, ''('') - 1)) BUYING_STAKEHOLDER,
                        SP,
                        DECODE(PRIMARY_FOCUS,
                               ''Cost & Optimization'',
                               ''C&O Cost & Optimization'',
                               ''Growth & Transformation'',
                               ''G&T Growth & Transformation'',
                               PRIMARY_FOCUS) PRIMARY_FOCUS,
                               IOU_ID
          FROM (SELECT DISTINCT T.CRM_ID  OPPORTUNITY_ID,
                                T.GROUP_CLIENT,
                                T.OPPORTUNITY_NAME,
                                T.SALES_STAGE,
                                TO_NUMBER(T.DEAL_VALUE) CONTRACT_VAL,
                                T.CLOSURE_MONTH  CLOSE_DATE,
                                T.SP,
                                T.PRIMARY_COMPETITORS PRIMARY_COMPETITOR,
                                T.BUYING_STAKEHOLDER,
                                T.PRIMARY_FOCUS,
                                T.RENEWAL_VALUE,
                                T.OPP_DESCRIPTION,
                                T.STATUS_UPDATE,
                                T.IOU_ID
                  FROM WKLY_BTG_PIPELINE_TGT T
                 
                 
                 WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID, T.FILE_DATE) IN
                       (SELECT S.IOU_ID,S.SUB_IOU_ID,S.ACCOUNT_ID, MAX(FILE_DATE)
                          FROM BTG_WKLY_PL_TGT S
                         WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                         ' || V_COND || '
                         AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                        GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID)
              
                 
                  
                UNION ALL
                SELECT DISTINCT O.OPPORTUNITY_ID,
                                O.GROUP_CLIENT,
                                O.OPPORTUNITY_NAME,
                                O.SALES_STAGE,
                                (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000) CONTRACT_VAL,
                                TO_CHAR(TO_DATE(O.EXPECTED_CLOSE_DATE, ''DD-MON-YY''),
                                        ''DD-MON-YYYY'') CLOSE_DATE,
                                O.service_practices ,
                                O.COMPETITORS,
                                O.BUYING_STAKEHOLDER,
                                O.PRIMARY_FOCUS,
                                (to_number(decode(O.renewal_portion_of_tocv_usd,''null'',0,renewal_portion_of_tocv_usd)/ 1000000)) RENEWAL_VALUE,
                                O.OPPORTUNITY_DESCRIPTION,
                                '''' STATUS_UPDATE,
                                TO_NUMBER(O.IOU_ID)
                  FROM OPPORTUNITY_BTG_WSR O
                 WHERE O.DATESTAMP =
                       (SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR)
                AND  (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000)  > 49
                   AND SUBSTR(O.SALES_STAGE, 1, 2) IN (2, 3, 4, 5, 6, 7, 8)
                   ' || V_COND || '
                     AND O.ACCOUNT_ID IN (select distinct t.account_id from new_btg_account_mapping t\* WHERE T.IOU_ID <>263*\)
                   AND O.OPPORTUNITY_ID NOT IN
                       (SELECT T.CRM_ID
                          FROM WKLY_BTG_PIPELINE_TGT T
                         WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID,T.FILE_DATE) IN
                               (SELECT S.IOU_ID,S.SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
                                  FROM BTG_WKLY_PL_TGT S
                                 WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                                 ' || V_COND || '
                                 AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                                 GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID)))
        
         ORDER BY CONTRACT_VAL DESC)D
         '||V_ORDER_BY||'';*/
         -- WRITTEN SEPERATE CODE FOR REPORT 
      /*   ELSE
           
         QRY := 'SELECT '||V_COL_ADD||' GROUP_CLIENT,
       OPPORTUNITY_ID,
       OPPORTUNITY_NAME,
       OPP_DESCRIPTION,
       SALES_STAGE,
       CONTRACT_VAL,
       RENEWAL_VALUE,
       CLOSE_DATE,
       BUYING_STAKEHOLDER,
       SP,
       PRIMARY_FOCUS,
       PRIMARY_COMPETITOR,
       STATUS_UPDATE  
  FROM (SELECT DISTINCT SUBSTR(GROUP_CLIENT,16)GROUP_CLIENT,
                        OPPORTUNITY_ID,
                        OPPORTUNITY_NAME,
                        OPP_DESCRIPTION,
                        REPLACE(PRIMARY_COMPETITOR, ''#'', '','') PRIMARY_COMPETITOR,
                        SALES_STAGE,
                        F_PPT(CONTRACT_VAL, ''V12'') CONTRACT_VAL,
                        F_PPT(RENEWAL_VALUE, ''V12'') RENEWAL_VALUE,
                        STATUS_UPDATE,
                        CLOSE_DATE,
                        DECODE(INSTR(BUYING_STAKEHOLDER, ''(''),
                               0,
                               BUYING_STAKEHOLDER,
                               SUBSTR(BUYING_STAKEHOLDER,
                                      0,
                                      INSTR(BUYING_STAKEHOLDER, ''('') - 1)) BUYING_STAKEHOLDER,
                        SP,
                        DECODE(PRIMARY_FOCUS,
                               ''Cost & Optimization'',
                               ''C&O Cost & Optimization'',
                               ''Growth & Transformation'',
                               ''G&T Growth & Transformation'',
                               PRIMARY_FOCUS) PRIMARY_FOCUS,
                               IOU_ID
          FROM (SELECT DISTINCT O.OPPORTUNITY_ID,
                                O.GROUP_CLIENT,
                                O.OPPORTUNITY_NAME,
                                O.SALES_STAGE,
                                (to_number(decode(O.OPPORTUNITY_VALUE_USD,''null'',0,OPPORTUNITY_VALUE_USD)) / 1000000) CONTRACT_VAL,
                                TO_CHAR(TO_DATE(O.EXPECTED_CLOSE_DATE, ''DD-MON-YY''),
                                        ''DD-MON-YYYY'') CLOSE_DATE,
                                O.service_practices SP,
                                O.COMPETITORS PRIMARY_COMPETITOR,
                                O.BUYING_STAKEHOLDER,
                                O.PRIMARY_FOCUS,
                                (to_number(decode(O.renewal_portion_of_tocv_usd,''null'',0,renewal_portion_of_tocv_usd)/ 1000000)) RENEWAL_VALUE,
                                O.OPPORTUNITY_DESCRIPTION OPP_DESCRIPTION,
                                T.STATUS_UPDATE,
                                O.IOU_ID
                  FROM WKLY_BTG_PIPELINE_TGT T,
                   OPPORTUNITY_BTG_WSR O
                 WHERE (T.IOU_ID,T.SUB_IOU_ID,T.ACCOUNT_ID, T.FILE_DATE) IN
                       (SELECT S.IOU_ID,S.SUB_IOU_ID,S.ACCOUNT_ID, MAX(FILE_DATE)
                          FROM BTG_WKLY_PL_TGT S
                         WHERE S.QUARTER = ''' || V_CUR_QTR || '''
                         ' || V_COND || '
                         AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                        GROUP BY IOU_ID,SUB_IOU_ID,ACCOUNT_ID)
                   AND T.IOU_ID = O.IOU_ID
                   AND T.SUB_IOU_ID = O.SUB_IOU_ID
                   AND T.ACCOUNT_ID = O.ACCOUNT_ID
                   AND T.CRM_ID = O.OPPORTUNITY_ID
                  \*and  T.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*\
                   AND O.DATESTAMP =
                       (SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR)
                 ))';
                   END IF;
           */
         
       
           
         
         
         DELETE FROM X_TST_BA ;
         COMMIT ;
         INSERT INTO X_TST_BA VALUES(QRY);
         COMMIT;
         
           EXECUTE IMMEDIATE 'SELECT DECODE(COUNT(1), 0, ' || '''N''' || ', ' ||
                        '''Y''' || ') FROM(' || QRY || ')'
        INTO V_PIPE_CHECK;
        
        IF (V_PIPE_CHECK ='N') /*AND (TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE')*/
        THEN 
        
     /*   QRY:= '
        SELECT ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'' ,
          ''-'',
            ''-'',
              ''-'',
                ''-'',
                  ''-'' FROM DUAL';
        END IF;*/
        
         QRY := '
            SELECT DISTINCT '||V_COL_ADD||'  SUBSTR(GROUP_CUSTOMER,16),
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
        ''-'',
         ''-'',
          ''-'',
           ''-'',
            ''-'',
             ''-''
        
             FROM  NEW_BTG_ACCOUNT_MAPPING D 
             WHERE 1= 1 /*AND D.IOU_ID <>263*/
            '||V_COND||' ';
             END IF;
         
        
        
        ELSIF TRIM(UPPER(I_SHEET_NAME)) LIKE 'TCVOUTLOOK' 
           AND (I_GRID_COUNT = 1 OR I_GRID_COUNT = 4) THEN
        
          V_SELECT      := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1
--LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2';
          O_NO_OF_INDEX := 0;
          
           
          
          
          
          IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
               OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
              V_COL_ADD  := '(SELECT DISTINCT iou_short_name FROM NEW_BTG_ACCOUNT_MAPPING K WHERE 
        K.IOU_ID=D.IOU_ID) ISU_NAME,';
             V_ORDER_BY := 'ORDER BY ACCOUNT ASC'; 
              ELSE
                V_COL_ADD  := '';
                  V_ORDER_BY := '';

              END IF;
            ELSE
              V_COL_ADD  := '';
                V_ORDER_BY := '';

            END IF;
          END IF;
          
          
           IF V_QTR_CHK = 'Q1' THEN
     V_Q1 := 'TO_CHAR(t.Q1fy_projection)';
        
       V_Q2 := 'TO_CHAR(t.Q2fy_projection)';
       V_Q3 := 'TO_CHAR(t.Q3fy_projection)';
       V_Q4 := 'TO_CHAR(t.Q4fy_projection)';
       
        update WSR_TEMPLATE_HDR_BTG 
    set column_editable = 'TRUE'
    WHERE header_id IN (84,83,85) and sheet_id = 107  and report_id = 1;
    COMMIT;
       
       
       
       
       
       ELSIF  V_QTR_CHK = 'Q2' THEN
          V_Q1 := '(SELECT to_char(round(TCV_BMN_USD)) FROM BTG_WKLY_PL_PMO_TGT 
       where  period like ''%Actual%'' and QUATER = '''||V_CUR_QTR||''' '||V_COND||')';
        V_Q2 := 'TO_CHAR(t.Q2fy_projection)';
       V_Q3 := 'TO_CHAR(t.Q3fy_projection)';
       V_Q4 := 'TO_CHAR(t.Q4fy_projection)';
       update WSR_TEMPLATE_HDR_BTG 
    set column_editable = 'FALSE'
    WHERE header_id = 83 and sheet_id = 107  and report_id = 1;
    COMMIT;
   
       ELSIF V_QTR_CHK = 'Q3' THEN
          V_Q1 := '(SELECT to_char(TCV_BMN_USD) FROM BTG_WKLY_PL_PMO_TGT 
       where period like ''%Actual%'' and QUATER = '''||V_PRV_QTR||''' '||V_COND||')';

       
       V_Q2 := '(SELECT to_char(TCV_BMN_USD) FROM BTG_WKLY_PL_PMO_TGT 
       where period like ''%Actual%'' and QUATER = '''||V_CUR_QTR||''' '||V_COND||')';
        V_Q3 := 'TO_CHAR(t.Q3fy_projection)';
       V_Q4 := 'TO_CHAR(t.Q4fy_projection)';
       update WSR_TEMPLATE_HDR_BTG 
    set column_editable = 'FALSE'
    WHERE header_id IN (84,83) and sheet_id = 107  and report_id = 1;
    COMMIT; 
       
       
       
       ELSIF V_QTR_CHK = 'Q4' THEN
          V_Q1 := '(SELECT to_char(TCV_BMN_USD) FROM BTG_WKLY_PL_PMO_TGT 
       where  period like ''%Actual%'' and QUATER = '''||V_TCV_PREV_QTR||''' '||V_COND||')';
       
       V_Q2 := '(SELECT to_char(TCV_BMN_USD) FROM BTG_WKLY_PL_PMO_TGT 
       where period like ''%Actual%'' and QUATER = '''||V_PRV_QTR||''' '||V_COND||')';
       V_Q3 := '(SELECT to_char(TCV_BMN_USD) FROM BTG_WKLY_PL_PMO_TGT 
       where  period like ''%Actual%'' and QUATER = '''||V_CUR_QTR||''' '||V_COND||')';
     V_Q4 := 'TO_CHAR(t.Q4fy_projection)';
       update WSR_TEMPLATE_HDR_BTG 
    set column_editable = 'FALSE'
    WHERE header_id IN (84,83,85) and sheet_id = 107  and report_id = 1;
    COMMIT;
       
       END IF;
       
       update WSR_TEMPLATE_HDR_BTG 
    set column_formula = 'SUM##'||V_TCV_HDR1||','||V_TCV_HDR2||','||V_TCV_HDR3||','||V_TCV_HDR4
    WHERE header_id IN (87) and sheet_id = 107  and report_id = 1;
    COMMIT;
       
       
       
          
          
          
            IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT')
                AND ((I_ISU_ID =  0 AND I_CLUS_ID =0 AND I_ACC_ID =0) OR
               (I_ISU_ID <>  0 AND I_CLUS_ID =0 AND I_ACC_ID =0) OR
               (I_ISU_ID <>  0 AND I_CLUS_ID <>0 AND I_ACC_ID =0)  ) THEN
              
    V_TCV_TOTAL_APPEND  := 'SELECT ''Total^2'',''Total'',
TO_CHAR(SUM(q1fy_projection)),
TO_CHAR(SUM(Q2fy_projection)),
TO_CHAR(SUM(q3fy_projection)),
TO_CHAR(SUM(q4fy_projection)),
TO_CHAR(SUM(fy_projection))
 
FROM WKLY_TCV_OUTLOOK_TGT T
WHERE  T.FILE_DATE  '||V_GRT_COND||'= ''' || V_PERIOD || ''' 
'||V_COND||' 
UNION ALL ' ;
 
 ELSE 
   
 V_TCV_TOTAL_APPEND := '';
 END IF ;
   
 if (TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE')  THEN 
        
          QRY := ' '||V_TCV_TOTAL_APPEND||' SELECT * FROM (SELECT ' || V_COL_ADD || 'account,
TO_CHAR(q1fy_projection)'||V_TCV_HDR1||' ,
TO_CHAR(Q2fy_projection)'||V_TCV_HDR2||',
TO_CHAR(q3fy_projection)'||V_TCV_HDR3||',
TO_CHAR(q4fy_projection)'||V_TCV_HDR4||',
TO_CHAR(q1fy_projection+Q2fy_projection+Q3fy_projection+q4fy_projection) fy_projection  
--TO_CHAR(fy_projection) 
FROM 
(SELECT t.account,
'||V_Q1||' q1fy_projection,
'||V_Q2||' Q2fy_projection,
'||V_Q3||' Q3fy_projection,
'||V_Q4||' q4fy_projection,
TO_CHAR(t.fy_projection) fy_projection,
IOU_ID

FROM WKLY_TCV_OUTLOOK_TGT T
WHERE  T.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
' || V_COND || '
and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE '||V_GRT_COND1||V_GRT_COND||'= ''' || V_PERIOD || '''
group by iou_id,sub_iou_id,account_id)

UNION ALL 
SELECT DISTINCT SHORT_NAME,'''' A,'''' B,'''' C,'''' D,'''' E,IOU_ID 
FROM NEW_BTG_ACCOUNT_MAPPING M
WHERE   1=1    ' || V_COND || ' and UPPER(M.Active) =''YES''/* AND M.IOU_ID <>263*/
and m.account_id not in (select t.account_id FROM WKLY_TCV_OUTLOOK_TGT T
WHERE T.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
group by iou_id,sub_iou_id,account_id)))D
'||V_ORDER_BY||')';
else 

/*ELSIF UPPER(I_REPORT_NAME) = 'REPORT' THEN 
  IF I_ACC_ID <> 0 THEN 
    QRY := 'SELECT * FROM (SELECT  IOU,ACCOUNT,TO_CHAR(Q1) Q1,TO_CHAR(Q2) Q2,TO_CHAR(Q3),TO_CHAR(Q4) Q4,TO_CHAR(FY_PROJECTION) FROM (
  SELECT (SELECT DISTINCT iou_short_name FROM NEW_BTG_ACCOUNT_MAPPING K WHERE  K.IOU_ID=D.IOU_ID) IOU,
(SELECT DISTINCT short_name FROM NEW_BTG_ACCOUNT_MAPPING K WHERE  K.account_id=D.account_id ) ACCOUNT,
SUM(Q1_PROJECTION) Q1,SUM(Q2_PROJECTION) Q2, SUM(Q3_PROJECTION) Q3,SUM(Q4FY_PROJECTION) Q4,
SUM(Q1_PROJECTION+Q2_PROJECTION
+Q3_PROJECTION+Q4FY_PROJECTION) FY_PROJECTION  FROM
(SELECT  A.ACCOUNT_ID,B.IOU_ID,Q1_PROJECTION,Q2_PROJECTION,Q3_PROJECTION,Q4FY_PROJECTION, fy_projection FROM
((SELECT QUATER,ACCOUNT_id,IOU_ID,SUM(TCV_BMN_USD) TCV_BMN_USD FROM BTG_WKLY_PL_PMO_TGT  where 1=1  '||v_cond||'
       and   period like ''%Actual%'' 
       GROUP BY QUATER,ACCOUNT_id,IOU_ID)
       PIVOT(SUM(TCV_BMN_USD) FOR QUATER IN ('''||V_TCV_PREV_QTR||''' AS Q1_PROJECTION,'''|| ||''' AS Q2_PROJECTION,'''||V_CUR_QTR||''' AS Q3_PROJECTION))) b
       
       left outer join 
       (select account_id,sum(Q4FY_PROJECTION) Q4FY_PROJECTION ,sum(fy_projection) fy_projection  from  wkly_tcv_outlook_tgt t where 
         T.FILE_DATE = '''||V_PERIOD||''' AND  (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
 WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              '|| V_COND ||'
AND S.FILE_DATE '||V_GRT_COND1||V_GRT_COND||'= ''' || V_PERIOD || '''
group by iou_id,sub_iou_id,account_id)
 group by account_id  ) a
on b.account_id  = a.account_id  
where b.account_id  = a.account_id  
 ) D
--GROUP BY GROUPING SETS ((IOU_ID,ACCOUNT_ID),())
GROUP BY IOU_ID,ACCOUNT_ID 
order by case when IOU = ''Total'' then ''AAAAAA'' else IOU end)
UNION ALL 
SELECT DISTINCT IOU_SHORT_NAME,SHORT_NAME,'''' A,'''' B,'''' C,'''' D ,'''' E 
FROM NEW_BTG_ACCOUNT_MAPPING M
WHERE   1=1    ' || V_COND || ' and UPPER(M.Active) =''YES''
and m.account_id not in (select t.account_id FROM WKLY_TCV_OUTLOOK_TGT T
WHERE T.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
group by iou_id,sub_iou_id,account_id)))
ORDER BY CASE WHEN IOU LIKE ''%Total^2%'' THEN ''AAA''
ELSE
  IOU END

';
ELSE 
 

  

----CODE FOR I WRITTEN 
 QRY := 'SELECT * FROM (SELECT  IOU,ACCOUNT,TO_CHAR(Q1) Q1,TO_CHAR(Q2) Q2,TO_CHAR(Q3),TO_CHAR(Q4) Q4,TO_CHAR(FY_PROJECTION) FROM (
  SELECT nvl((SELECT DISTINCT iou_short_name FROM NEW_BTG_ACCOUNT_MAPPING K WHERE  K.IOU_ID=D.IOU_ID),''Total^2'') IOU,
NVL((SELECT DISTINCT short_name FROM NEW_BTG_ACCOUNT_MAPPING K WHERE  K.account_id=D.account_id ),''Total'') ACCOUNT,
SUM(Q1_PROJECTION) Q1,SUM(Q2_PROJECTION) Q2, SUM(Q3_PROJECTION) Q3,SUM(Q4FY_PROJECTION) Q4,
SUM(Q1_PROJECTION+Q2_PROJECTION
+Q3_PROJECTION+Q4FY_PROJECTION) FY_PROJECTION
 FROM
(SELECT  A.ACCOUNT_ID,B.IOU_ID,Q1_PROJECTION,Q2_PROJECTION,Q3_PROJECTION,Q4FY_PROJECTION, fy_projection FROM
((SELECT QUATER,ACCOUNT_id,IOU_ID,SUM(TCV_BMN_USD) TCV_BMN_USD FROM BTG_WKLY_PL_PMO_TGT  where 1=1  '||v_cond||'
       and   period like ''%Actual%'' 
       GROUP BY QUATER,ACCOUNT_id,IOU_ID)
       PIVOT(SUM(TCV_BMN_USD) FOR QUATER IN ('''||V_TCV_PREV_QTR||''' AS Q1_PROJECTION,'''||V_PRV_QTR||''' AS Q2_PROJECTION,'''||V_CUR_QTR||''' AS Q3_PROJECTION))) b
       
       left outer join 
       (select account_id,sum(Q4FY_PROJECTION) Q4FY_PROJECTION ,sum(fy_projection) fy_projection  from  wkly_tcv_outlook_tgt t where 
         T.FILE_DATE = '''||V_PERIOD||''' AND  (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
 WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              '|| V_COND ||'
AND S.FILE_DATE '||V_GRT_COND1||V_GRT_COND||'= ''' || V_PERIOD || '''
group by iou_id,sub_iou_id,account_id)
 group by account_id  ) a
on b.account_id  = a.account_id  
where b.account_id  = a.account_id  
 ) D
GROUP BY GROUPING SETS ((IOU_ID,ACCOUNT_ID),())
order by case when IOU = ''Total'' then ''AAAAAA'' else IOU end)
UNION ALL 
SELECT DISTINCT IOU_SHORT_NAME,SHORT_NAME,'''' A,'''' B,'''' C,'''' D ,'''' E
FROM NEW_BTG_ACCOUNT_MAPPING M
WHERE   1=1    ' || V_COND || ' and UPPER(M.Active) =''YES''
and m.account_id not in (select t.account_id FROM WKLY_TCV_OUTLOOK_TGT T
WHERE T.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
group by iou_id,sub_iou_id,account_id)))
ORDER BY CASE WHEN IOU LIKE ''%Total^2%'' THEN ''AAA''
ELSE
  IOU END

';
END IF;*/

------ IF ABLE TO EDIT THE PROTECTED SHEET AT THAT TIME WE  NEED TO TAK EFORM SYSDTEM ACCCORING TO QUATRER 

/*if V_QTR_CHK = 'Q4' THEN 
merge into (select * from wkly_tcv_outlook_tgt where file_Date = V_PERIOD) A
USING (SELECT * FROM BTG_WKLY_PL_PMO_TGT where  period like '%Actual%' and QUATER = V_TCV_PREV_QTR) B
ON (A.ACCOUNT_ID = B.ACCOUNT_ID) 
WHEN  MATCHED  THEN 
UPDATE SET  A.Q1FY_PROJECTION = (B.TCV_BMN_USD);
COMMIT;




merge into (select * from wkly_tcv_outlook_tgt where file_Date = V_PERIOD ) A
USING (SELECT * FROM BTG_WKLY_PL_PMO_TGT where  period like '%Actual%' and QUATER = V_PRV_QTR) B
ON (A.ACCOUNT_ID = B.ACCOUNT_ID) 
WHEN  MATCHED  THEN 
UPDATE SET  A.Q2FY_PROJECTION = (B.TCV_BMN_USD);
COMMIT;

merge into (select * from wkly_tcv_outlook_tgt where file_Date = V_PERIOD) A
USING (SELECT * FROM BTG_WKLY_PL_PMO_TGT where  period like '%Actual%' and QUATER = V_CUR_QTR) B
ON (A.ACCOUNT_ID = B.ACCOUNT_ID) 
WHEN  MATCHED  THEN 
UPDATE SET  A.Q3FY_PROJECTION = (B.TCV_BMN_USD);
COMMIT;

ELSIF V_QTR_CHK = 'Q3' THEN 
 

merge into (select * from wkly_tcv_outlook_tgt where file_Date = V_PERIOD ) A
USING (SELECT * FROM BTG_WKLY_PL_PMO_TGT where  period like '%Actual%' and QUATER = V_PRV_QTR) B
ON (A.ACCOUNT_ID = B.ACCOUNT_ID) 
WHEN  MATCHED  THEN 
UPDATE SET  A.Q2FY_PROJECTION = (B.TCV_BMN_USD);
COMMIT;

merge into (select * from wkly_tcv_outlook_tgt where file_Date = V_PERIOD ) A
USING (SELECT * FROM BTG_WKLY_PL_PMO_TGT where  period like '%Actual%' and QUATER = V_CUR_QTR) B
ON (A.ACCOUNT_ID = B.ACCOUNT_ID) 
WHEN  MATCHED  THEN 
UPDATE SET  A.Q3FY_PROJECTION = (B.TCV_BMN_USD);
COMMIT;

ELSIF V_QTR_CHK = 'Q2' THEN 
  
  merge into (select * from wkly_tcv_outlook_tgt where file_Date = V_PERIOD ) A
USING (SELECT * FROM BTG_WKLY_PL_PMO_TGT where  period like '%Actual%' and QUATER = V_CUR_QTR) B
ON (A.ACCOUNT_ID = B.ACCOUNT_ID) 
WHEN  MATCHED  THEN 
UPDATE SET  A.Q3FY_PROJECTION = (B.TCV_BMN_USD);
COMMIT;
END IF; */
  




QRY := ' '||V_TCV_TOTAL_APPEND||' SELECT * FROM (SELECT ' || V_COL_ADD || 'account,
TO_CHAR(q1fy_projection),
TO_CHAR(Q2fy_projection),
TO_CHAR(q3fy_projection),
TO_CHAR(q4fy_projection),
TO_CHAR(fy_projection) FROM 
(SELECT t.account,
TO_CHAR(t.q1fy_projection) q1fy_projection ,
TO_CHAR(t.Q2fy_projection) Q2fy_projection,
TO_CHAR(t.q3fy_projection) Q3fy_projection,
TO_CHAR(t.q4fy_projection) q4fy_projection,
TO_CHAR(t.fy_projection) fy_projection,
IOU_ID

FROM WKLY_TCV_OUTLOOK_TGT T
WHERE  T.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
' || V_COND || '
and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE '||V_GRT_COND1||V_GRT_COND||'= ''' || V_PERIOD || '''
group by iou_id,sub_iou_id,account_id)

UNION ALL 
SELECT DISTINCT SHORT_NAME,'''' A,'''' B,'''' C,'''' D,'''' E,IOU_ID 
FROM NEW_BTG_ACCOUNT_MAPPING M
WHERE   1=1    ' || V_COND || ' and UPPER(M.Active) =''YES''
and m.account_id not in (select t.account_id FROM WKLY_TCV_OUTLOOK_TGT T
WHERE T.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
and (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
(SELECT IOU_ID,SUB_IOU_ID,ACCOUNT_ID, MAX(FILE_DATE)
FROM BTG_WKLY_PL_TGT S
WHERE S.QUARTER = ''' || V_CUR_QTR || '''
              ' || V_COND || '
AND S.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
group by iou_id,sub_iou_id,account_id)))D
'||V_ORDER_BY||')';
end if; 

    --   ORDER BY account_id 
      
       
       
     
      
       
       
     


        
       -- END IF;
    
         ELSIF  ((TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') -- THEN
         AND  (I_GRID_COUNT = 6) AND TRIM(UPPER(I_SHEET_NAME)) LIKE '%P' || '&' || 'L%') THEN 
       --TRIM(UPPER(I_SHEET_NAME)) LIKE '%EXECUTIVE SUMMARY%' 
       -- IF TRIM(UPPER(I_SHEET_NAME)) LIKE '%P' || '&' || 'L%' THEN
        
          IF I_ISU_ID IS NULL OR I_ISU_ID = '0' THEN 
            --== BG Level
             V_COL_ADD := 'ISU_NAME,';
             O_NO_OF_INDEX := 2;
             V_ORDER_BY := '';
          ELSE
              V_COL_ADD := '';
              O_NO_OF_INDEX := 1;
              V_ORDER_BY := '';
          END IF; 
           --- REPORT ACC LEVEL HANDLING
          IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            
              --== BG Level
              V_COL_ADD     := 'ISU_NAME,';
              O_NO_OF_INDEX := 2;
              V_ORDER_BY    := '';
            ELSE
              V_COL_ADD     := '';
              O_NO_OF_INDEX := 1;
              V_ORDER_BY    := '';
            END IF;
            ELSE 
              V_COL_ADD     := '';
          O_NO_OF_INDEX := 1;
          V_ORDER_BY    := '';
          END IF;
          
           V_TCV_COL := '\*NVL(TCV_BMN_USD,0)*\ TCV_BMN_USD';
        IF (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') THEN
            IF V_LEVEL_ID IN (-2, 6) THEN
            IF (I_ISU_ID <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) OR (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0)
               OR (I_ISU_ID =  0 AND I_CLUS_ID =  0 AND I_ACC_ID = 0) THEN
              V_COL_ADD  := 'ISU_NAME,';
               O_NO_OF_INDEX := 2;
              ELSE
                V_COL_ADD  := '';
                            O_NO_OF_INDEX := 1;
              END IF;
            ELSE
              V_COL_ADD  := '';
                            O_NO_OF_INDEX := 1;
            END IF;
            V_TCV_COL := 'ROUND(TCV_BMN_USD) TCV_BMN_USD';
          END IF;
          
        
          IF I_BG_ID = 21 THEN
            V_SELECT := 'LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2,
                   LEVEL_3_HDR||''$$''||LEVEL_3_HDR_COLOR COL3';
          ELSIF I_BG_ID = 22 THEN
            V_SELECT := 'LEVEL_1_HDR||''$$''||LEVEL_1_HDR_COLOR COL1,
                   LEVEL_2_HDR||''$$''||LEVEL_2_HDR_COLOR COL2,
                   LEVEL_3_HDR||''$$''||LEVEL_3_HDR_COLOR COL3';
          END IF;
          
          
            IF (V_LEVEL_ID = 7 AND (TRIM(UPPER(I_REPORT_NAME)) = 'REPORT'
            OR TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE' )) OR 
            (V_LEVEL_ID IN (-2,6) AND TRIM(UPPER(I_REPORT_NAME)) = 'TEMPLATE') 
            or (V_LEVEL_ID IN (-2,6) AND TRIM(UPPER(I_REPORT_NAME)) = 'REPORT' AND (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID <>0))
            THEN 
        
          QRY := 'SELECT 
          --' || V_COL_ADD || '
                   ISU_NAME,--    PERIOD,
                --    \*   NVL(SERVICES_REV,0) *\SERVICES_REV,
                  --    \* NVL(BOC_REV,0)*\ BOC_REV,
                 --     \* NVL(SUB_CON_REV,0)*\ SUB_CON_REV,
                 --    \*  NVL(TCS_LICENSE_REV,0)*\TCS_LICENSE_REV,
                  --   \*  NVL(TOTAL_REV,0)*\  TOTAL_REV,
                      \* NVL(INCR_HC,0)*\ INCR_HC
                  --     \*NVL(CM_MARGIN,0)*\ CM_MARGIN,
                  --  \*   NVL(BOC_COST_BMN_USD,0)*\ BOC_COST_BMN_USD,
                    --   '||V_TCV_COL||',
                     --  \*NVL(REMARKS,''-'')*\ 
                     
            FROM (SELECT M.ISU_NAME,
                       M.PERIOD,
                       M.ID,
                       N.SERVICES_REV,
                       N.BOC_REV,
                       N.SUB_CON_REV,
                       N.TCS_LICENSE_REV,
                       N.TOTAL_REV,
                       N.INCR_HC,
                       N.CM_MARGIN,
                       N.BOC_COST_BMN_USD,
                       N.TCV_BMN_USD,
                       N.REMARKS
              FROM (SELECT ISU_NAME,
                           ID,
                           PERIOD
                     FROM (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          ' || V_COND || '
            
                          ) 
                 CROSS JOIN
               (\*SELECT 1 ID, ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD FROM DUAL
                UNION ALL
                SELECT 2 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' FROM DUAL
                UNION ALL
                SELECT 3 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target'' FROM DUAL
                UNION ALL*\
                SELECT 4 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD FROM DUAL))M
                LEFT OUTER JOIN
                (SELECT *
                  FROM (\*SELECT (SELECT ISU_NAME FROM ISU_MSTR_NEW I WHERE I.ISU_ID = T.ISU_ID) NEW_SUB_GROUP,
                               ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD,
                               SERVICES_REV,
                               BOC_REV,
                               SUB_CON_REV,
                               TCS_LICENSE_REV,
                               TOTAL_REV,
                               INCR_HC,
                               CM_MARGIN,
                               BOC_COST_BMN_USD,
                               TCV_BMN_USD,
                               NULL REMARKS
                          FROM WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' || V_CUR_QTR || '''
                          ' || V_COND || '
                           AND REGEXP_LIKE(PERIOD, ''Actual'')*\
                    SELECT DISTINCT (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          ' || V_COND || ') NEW_SUB_GROUP,
                           ''' || V_PRV_QTR_PL ||
                 ''' || '' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD,
                            TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                               TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                               TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                            (SELECT DISTINCT T.REMARKS
                                FROM btg_WKLY_PL_TGT T
                               WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                 AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                     (SELECT iou_id,sub_iou_id,account_id, MAX(FILE_DATE)
                                        FROM btg_WKLY_PL_TGT S
                                        WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                          ' || V_COND || '
                                          AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                       GROUP BY IoU_ID,sub_iou_id,account_id)
                                 AND UPPER(T.PERIOD) = ''' ||
                 V_CUR_QTR_PL ||
                 '''||'' OUTLOOK''
                                 AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                               \* AND S.ISU_ID = T.ISU_ID*\) REMARKS
                       FROM BTG_WKLY_PL_PMO_TGT t
                        WHERE t.QUATER = ''' || V_CUR_QTR || '''
                      AND UPPER(T.PERIOD) LIKE ''%ACTUAL%''
                        ' || V_COND || '
                       
           --AND t.FILE_DATE '||V_GRT_COND||'= ''' || V_PERIOD || '''
                                       
                              
                     
                       
                        UNION ALL
                        SELECT (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          ' || V_COND || ') NEW_SUB_GROUP,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' PERIOD,
                             TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                               TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                               TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                               '''' REMARKS
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' || V_CUR_QTR || '''
                            ' || V_COND || '
                           AND REGEXP_LIKE(UPPER(PERIOD), ''AOP'')
                            AND UPPER(T.PERIOD) NOT LIKE ''%REVISED%''
                            
                        UNION ALL
                        SELECT (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          ' || V_COND || ') NEW_SUB_GROUP,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' PERIOD,
                              TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                               TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                               TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                               '''' REMARKS
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' || V_CUR_QTR || '''
                            ' || V_COND || '
                           AND REGEXP_LIKE(UPPER(PERIOD), ''REVISED TARGET'')
                             
                        UNION ALL
                        SELECT B.IOU,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD,
                              '''' SERV_CUR_OUT_REV,-- TO_CHAR(B.SERV_CUR_OUT_REV),
                              '''' BOC_CUR_OUT_REV,-- TO_CHAR(B.BOC_CUR_OUT_REV),
                              '''' SUB_CON_CUR_OUT_REV,-- TO_cHAR(B.SUB_CON_CUR_OUT_REV),
                              '''' TCS_LICENSE_CUR_OUT_REV,-- TO_CHAR(B.TCS_LICENSE_CUR_OUT_REV),
                              '''' TOTAL_CUR_OUT_REV,-- TO_CHAR(B.TOTAL_CUR_OUT_REV),
                               TO_CHAR(B.CUR_HC_INCR),
                               TO_cHAR(B.CM_MARGIN),
                               TO_CHAR(B.CUR_COST),
                               TO_CHAR(B.TCV_BMN_USD),
                               B.REMARKS
                          FROM(SELECT (SELECT DISTINCT iou_short_name isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
           ' || V_COND ||
                 ') IOU,
                                                 T.PERIOD,
                                                 T.SERVICES_REV SERV_CUR_OUT_REV,
                                                 NVL(T.BOC_REV,0) BOC_CUR_OUT_REV,
                                                 NVL(T.SUB_CON_REV,0) SUB_CON_CUR_OUT_REV,
                                                 NVL(T.TCS_LICENSE_REV,0) TCS_LICENSE_CUR_OUT_REV,
                                                 (SERVICES_REV +  BOC_REV + SUB_CON_REV + TCS_LICENSE_REV) TOTAL_CUR_OUT_REV,
                                                 T.INCR_HC CUR_HC_INCR,
                                                 T.BOC_COST_BMN_USD CUR_COST,
                                                 TO_NUMBER(CM_MARGIN) CM_MARGIN,
                                                 T.TCV_BMN_USD,
                                                 null REMARKS
                                            FROM btg_WKLY_PL_TGT T
                                           WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                            ' ||
                 V_COND || '
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(T.PERIOD) = UPPER(''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook'')
                                             AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                                                ) B
                           )) N
                            ON M.ISU_NAME = N.NEW_SUB_GROUP
                            AND M.PERIOD = N.PERIOD
                            ORDER BY M.ISU_NAME,ID)';
             ELSIF (V_LEVEL_ID IN (-2)) AND (I_ISU_ID = 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0) 
               
             THEN 
               
              QRY := '
             SELECT Z.TOT,--Z.TOT1,
  /*\* TO_CHAR(Z.SERVICES_REV),
   TO_CHAR(Z.BOC_REV),
   TO_CHAR(Z.SUB_CON_REV),
  TO_CHAR(Z.TCS_LICENSE_REV),
   TO_CHAR(Z.TOTAL_REV),*\*/
   TO_CHAR(Z.INCR_HC)
/*\* TO_CHAR (((Z.TOTAL_REV - Z.CM_MARGIN)/Z.TOTAL_REV)*100),
   TO_CHAR(Z.BOC_COST_BMN_USD),
  TO_CHAR(Z.TCV_BMN_USD) ,
  ''''*\*/
   FROM (SELECT ''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook ''||''Total'' TOT,''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook ''||''Total'' TOT1,
                SUM(SERVICES_REV) SERVICES_REV,
SUM(BOC_REV) BOC_REV,
SUM(SUB_CON_REV) SUB_CON_REV,
SUM(TCS_LICENSE_REV) TCS_LICENSE_REV,
SUM(TOTAL_REV) TOTAL_REV,
SUM(INCR_HC) INCR_HC,
sum((1- (CM_MARGIN/100))*TOTAL_REV) CM_MARGIN,
SUM(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
ROUND(SUM(TCV_BMN_USD))TCV_BMN_USD,
TO_CHAR('''')
FROM btg_WKLY_PL_TGT S
     WHERE s.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (s.IoU_ID,s.sub_iou_id,s.account_id, s.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT o
                                                    WHERE o.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND (o.FILE_DATE '||V_GRT_COND||'= ''' ||
                                                      
                 V_PERIOD || ''' or O.FILE_DATE ='''||V_LAST_WEEK_PERIOD||''')
             --  \*   and  o.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*\
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(s.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(s.PERIOD) NOT LIKE ''%CORP%'')Z
UNION ALL
              
                    
              SELECT ISU_NAME,
                     /*  \*PERIOD,
                       NVL(SERVICES_REV,''-'')  SERVICES_REV,
                       NVL(BOC_REV,''-'') BOC_REV,
                       NVL(SUB_CON_REV,''-'') SUB_CON_REV,
                       NVL(TCS_LICENSE_REV,''-'') TCS_LICENSE_REV,
                       NVL(TOTAL_REV,''-'') TOTAL_REV,*\*/
                       NVL(INCR_HC,''-'') INCR_HC
                      /*\* NVL(CM_MARGIN,''-'') CM_MARGIN,
                       NVL(BOC_COST_BMN_USD,''-'') BOC_COST_BMN_USD,
                       NVL(TO_CHAR(ROUND(TCV_BMN_USD)),''-'') TCV_BMN_USD,
                       NVL(REMARKS,''-'') REMARKS--- '||V_REPORT_COL||'*\*/
            FROM (SELECT M.ISU_NAME,
                       M.PERIOD,
                       M.ID,
                       N.SERVICES_REV,
                       N.BOC_REV,
                       N.SUB_CON_REV,
                       N.TCS_LICENSE_REV,
                       N.TOTAL_REV,
                       N.INCR_HC,
                       N.CM_MARGIN,
                       N.BOC_COST_BMN_USD,
                       N.TCV_BMN_USD,
                       N.REMARKS
              FROM (SELECT ISU_NAME,
                           ID,
                           PERIOD
                     FROM (SELECT DISTINCT I.SHORT_NAME ISU_NAME
                             FROM new_btg_account_mapping I 
                             
                            WHERE 1=1
                            AND I.ACTIVE = ''Yes'' /*AND I.IOU_ID <>263*/
                       -- \*   and I.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*\
                           
                   
                          ) 
                 CROSS JOIN
               (/*\*SELECT 1 ID, ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD FROM DUAL
                UNION ALL
                SELECT 2 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' FROM DUAL
                UNION ALL
                SELECT 3 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' FROM DUAL
                UNION ALL*\*/
                SELECT 4 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD  FROM DUAL))M
                LEFT OUTER JOIN
                (SELECT *
                  FROM (
          SELECT   X.NEW_SUB_GROUP,X.PERIOD,
TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                              TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                              TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                             


TO_CHAR(Z.REMARKS) REMARKS FROM 
(          SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
     
        
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                           ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD ,
                            SERVICES_REV,
                            BOC_REV,
                           SUB_CON_REV,
                            TCS_LICENSE_REV,
                             TOTAL_REV,
                              INCR_HC,
                           CM_MARGIN, ----==//Gross Margin Calculation
                          BOC_COST_BMN_USD,
                             TCV_BMN_USD,IOU_ID,ACCOUNT_ID
                        
                       FROM  BTG_WKLY_PL_PMO_TGT T /*\*BTG_WKLY_PL_PMO_TGT t*\-*/-- WKLY_ACCT_PMO_TGT S
                        WHERE t.QUATER = ''' ||
                 V_CUR_QTR || '''
                      AND UPPER(T.PERIOD) LIKE ''%ACTUAL%''
                      
                      AND T.ACCOUNT_ID  IN (SELECT DISTINCT B.ACCOUNT_ID FROM btg_WKLY_PL_PMO_TGT B/* \*  where  
                      b.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*\*/
                     /* \*(SELECT DISTINCT B.ACCOUNT_ID FROM btg_WKLY_PL_TGT B
                                           
                                         
                                            WHERE  B.ACCOUNT_ID = T.ACCOUNT_ID 
                                            AND B.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                  AND (B.IoU_ID,B.sub_iou_id,B.account_id, B.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                            ' ||
                 V_COND || '
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id) ))*\*/))X
                                            
                                            LEFT OUTER JOIN 
                                            
                                            
                                             (SELECT DISTINCT T.IOU_ID,T.ACCOUNT_ID, T.REMARKS
                                FROM btg_WKLY_PL_TGT T
                               WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                 AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                     (SELECT iou_id,sub_iou_id,account_id, MAX(FILE_DATE)
                                        FROM btg_WKLY_PL_TGT S
                                        WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                         
                                          AND S.ACCOUNT_ID = T.ACCOUNT_ID
                                          AND S.FILE_DATE <= ''' ||
                 V_PERIOD || '''
                                       GROUP BY IoU_ID,sub_iou_id,account_id)
                                 AND UPPER(T.PERIOD) = '''||V_CUR_QTR_PL||' OUTLOOK''
                                 AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                                )Z
                                
                                ON X.IOU_ID = Z.IOU_ID
                                AND X.ACCOUNT_ID = Z.ACCOUNT_ID 
                
                        UNION ALL
                        SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1 
          
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                                ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' PERIOD,
                              TO_CHAR(SERVICES_REV),
                                TO_CHAR(BOC_REV),
                                TO_CHAR(SUB_CON_REV),
                                TO_CHAR(TCS_LICENSE_REV),
                              TO_CHAR(TOTAL_REV),
                               TO_CHAR(INCR_HC),
                                TO_CHAR(CM_MARGIN),
                               TO_CHAR(BOC_COST_BMN_USD),
                              TO_CHAR(TCV_BMN_USD),
                              
                               '''' REMARKS----,TO_NUMBER('''') UPLOADED_BY,TO_NUMBER('''') UPDATED_BY
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' ||
                 V_CUR_QTR || '''
                           AND REGEXP_LIKE(UPPER(PERIOD), ''AOP'')
                              AND UPPER(T.PERIOD) NOT LIKE ''%REVISED%''
                          --  \*   and T.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*\   
                        UNION ALL
                        SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
        
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' PERIOD,
                               TO_CHAR(SERVICES_REV),
                                TO_CHAR(BOC_REV),
                                TO_CHAR(SUB_CON_REV),
                                TO_CHAR(TCS_LICENSE_REV),
                              TO_CHAR(TOTAL_REV),
                               TO_CHAR(INCR_HC),
                                TO_CHAR(CM_MARGIN),
                               TO_CHAR(BOC_COST_BMN_USD),
                              TO_CHAR(TCV_BMN_USD),
                                
                               '''' REMARKS----,TO_NUMBER('''') UPLOADED_BY,TO_NUMBER('''') UPDATED_BY
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' ||
                 V_CUR_QTR || '''
                           AND REGEXP_LIKE(UPPER(PERIOD), ''REVISED TARGET'')
                        --  \*  and T.account_id in (5601,5699,5587,5603,5600,5602,5698,5592)*\   
                        UNION ALL
                        SELECT B.IOU,
                              ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD,
                                '''' SERV_CUR_OUT_REV,-- TO_CHAR(B.SERV_CUR_OUT_REV),
                              '''' BOC_CUR_OUT_REV,-- TO_CHAR(B.BOC_CUR_OUT_REV),
                              '''' SUB_CON_CUR_OUT_REV,-- TO_cHAR(B.SUB_CON_CUR_OUT_REV),
                              '''' TCS_LICENSE_CUR_OUT_REV,-- TO_CHAR(B.TCS_LICENSE_CUR_OUT_REV),
                              '''' TOTAL_CUR_OUT_REV,-- TO_CHAR(B.TOTAL_CUR_OUT_REV),
                               TO_CHAR(B.CUR_HC_INCR),
                               TO_cHAR(B.CM_MARGIN),
                               TO_CHAR(B.CUR_COST),
                               TO_CHAR(B.TCV_BMN_USD),
                               B.REMARKS
                          FROM(SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
         
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) IOU,
                                                 T.PERIOD,
                                                 T.SERVICES_REV SERV_CUR_OUT_REV,
                                                 T.BOC_REV BOC_CUR_OUT_REV,
                                                 T.SUB_CON_REV SUB_CON_CUR_OUT_REV,
                                                 T.TCS_LICENSE_REV TCS_LICENSE_CUR_OUT_REV,
                                                 (SERVICES_REV +  BOC_REV + SUB_CON_REV + TCS_LICENSE_REV) TOTAL_CUR_OUT_REV,
                                                 T.INCR_HC CUR_HC_INCR,
                                                 T.BOC_COST_BMN_USD CUR_COST,
                                                 TO_NUMBER(CM_MARGIN) CM_MARGIN,
                                                 T.TCV_BMN_USD,
                                                 null REMARKS
                                            FROM btg_WKLY_PL_TGT T
                                           WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(T.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                                           /* \*  and T.account_id in (5601,5699,5587,5603,5600,5602,5698,5592) *\ */ ) B
                                           
                                           
                                      ---adding for prepoulation 
               UNION ALL
                                         SELECT B.IOU,
                              ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD,
                                '''' SERV_CUR_OUT_REV,-- TO_CHAR(B.SERV_CUR_OUT_REV),
                             '''' BOC_CUR_OUT_REV,-- TO_CHAR(B.BOC_CUR_OUT_REV),
                              '''' SUB_CON_CUR_OUT_REV,-- TO_cHAR(B.SUB_CON_CUR_OUT_REV),
                              '''' TCS_LICENSE_CUR_OUT_REV,--TO_CHAR(B.TCS_LICENSE_CUR_OUT_REV),
                              '''' TOTAL_CUR_OUT_REV,--TO_CHAR(B.TOTAL_CUR_OUT_REV),
                               TO_CHAR(B.CUR_HC_INCR),
                               TO_cHAR(B.CM_MARGIN),
                               TO_CHAR(B.CUR_COST),
                               TO_CHAR(B.TCV_BMN_USD),
                               B.REMARKS
                          FROM(SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
         
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) IOU,
                                                 T.PERIOD,
                                                 T.SERVICES_REV SERV_CUR_OUT_REV,
                                                 T.BOC_REV BOC_CUR_OUT_REV,
                                                 T.SUB_CON_REV SUB_CON_CUR_OUT_REV,
                                                 T.TCS_LICENSE_REV TCS_LICENSE_CUR_OUT_REV,
                                                 (SERVICES_REV +  BOC_REV + SUB_CON_REV + TCS_LICENSE_REV) TOTAL_CUR_OUT_REV,
                                                 T.INCR_HC CUR_HC_INCR,
                                                 T.BOC_COST_BMN_USD CUR_COST,
                                                 TO_NUMBER(CM_MARGIN) CM_MARGIN,
                                                 T.TCV_BMN_USD,
                                                 null REMARKS
                                            FROM btg_WKLY_PL_TGT T
                                           WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_LAST_WEEK_PERIOD || '''
      AND (IoU_ID,sub_iou_id,account_id)
                                                   NOT IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER =''' ||
                 V_CUR_QTR || '''
                                                         
                                                      AND S.FILE_DATE = '''||V_PERIOD||'''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(T.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(T.PERIOD) NOT LIKE ''%CORP%'')B         
                                           
                                           
                                           
                                           
                                           
                           )) N
                            ON M.ISU_NAME = N.NEW_SUB_GROUP
                            AND M.PERIOD = N.PERIOD
                            ORDER BY M.ISU_NAME,ID)';             
                            
                            ELSE 
                            IF I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0 THEN
                              V_APPEND_QRY:= 'AND SUB_IOU_ID = '||I_CLUS_ID;
                             ELSE
                               V_APPEND_QRY := '';
                              END IF;
                            
                            QRY := '
                                    SELECT Z.TOT,--Z.TOT1,
  \* TO_CHAR(Z.SERVICES_REV),
   TO_CHAR(Z.BOC_REV),
   TO_CHAR(Z.SUB_CON_REV),
  TO_CHAR(Z.TCS_LICENSE_REV),
   TO_CHAR(Z.TOTAL_REV),*\
   TO_CHAR(Z.INCR_HC)
 \*TO_CHAR (((Z.TOTAL_REV - Z.CM_MARGIN)/Z.TOTAL_REV)*100),
   TO_CHAR(Z.BOC_COST_BMN_USD),
 TO_CHAR( Z.TCV_BMN_USD) ,
  ''''*\
   FROM ( SELECT ''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook ''||''Total^2'' TOT,
                 ''' ||
                 V_CUR_QTR_PL ||
                 '''||'' Outlook ''||''Total'' TOT1,
                 SUM(SERVICES_REV) SERVICES_REV,

SUM(BOC_REV) BOC_REV,
SUM(SUB_CON_REV) SUB_CON_REV,
SUM(TCS_LICENSE_REV) TCS_LICENSE_REV,
SUM(TOTAL_REV) TOTAL_REV,
SUM(INCR_HC) INCR_HC,
sum((1- (CM_MARGIN/100))*TOTAL_REV) CM_MARGIN,
SUM(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
ROUND(SUM(TCV_BMN_USD))TCV_BMN_USD,
TO_CHAR('''')
FROM btg_WKLY_PL_TGT S
  WHERE s.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (s.IoU_ID,s.sub_iou_id,s.account_id, s.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT o
                                                    WHERE o.QUARTER = ''' ||
                 V_CUR_QTR || '''
                 
                 AND IOU_ID = '||I_ISU_ID||'
                                '||V_APPEND_QRY||'
                                                         
                                                      AND o.FILE_DATE '||V_GRT_COND||V_GRT_COND1||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(s.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(s.PERIOD) NOT LIKE ''%CORP%'')Z

                            
                UNION ALL               
                            
                            
                        SELECT ISU_NAME,
                      \* PERIOD,
                       NVL(SERVICES_REV,''-'')  SERVICES_REV,
                       NVL(BOC_REV,''-'') BOC_REV,
                       NVL(SUB_CON_REV,''-'') SUB_CON_REV,
                       NVL(TCS_LICENSE_REV,''-'') TCS_LICENSE_REV,
                       NVL(TOTAL_REV,''-'') TOTAL_REV,*\
                       NVL(INCR_HC,''-'') INCR_HC
                       \*NVL(CM_MARGIN,''-'') CM_MARGIN,
                       NVL(BOC_COST_BMN_USD,''-'') BOC_COST_BMN_USD,
                       NVL(TO_CHAR(ROUND(TCV_BMN_USD)),''-'') TCV_BMN_USD,
                       NVL(REMARKS,''-'') REMARKS*\
            FROM (SELECT M.ISU_NAME,
                       M.PERIOD,
                       M.ID,
                       N.SERVICES_REV,
                       N.BOC_REV,
                       N.SUB_CON_REV,
                       N.TCS_LICENSE_REV,
                       N.TOTAL_REV,
                       N.INCR_HC,
                       N.CM_MARGIN,
                       N.BOC_COST_BMN_USD,
                       N.TCV_BMN_USD,
                       N.REMARKS
              FROM (SELECT ISU_NAME,
                           ID,
                           PERIOD
                     FROM (SELECT DISTINCT I.SHORT_NAME ISU_NAME
                             FROM new_btg_account_mapping I 
                            WHERE 1=1
                          
                     AND I.ACCOUNT_ID IN (SELECT ACCOUNT_ID
                                      FROM new_btg_account_mapping I 
                                     WHERE I.IOU_ID =  '||I_ISU_ID||'
                                     '||V_APPEND_QRY||')
                          ) 
                 CROSS JOIN
               (\*SELECT 1 ID, ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD FROM DUAL
                UNION ALL
                SELECT 2 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' FROM DUAL
                UNION ALL
                SELECT 3 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' FROM DUAL
                UNION ALL*\
                SELECT 4 ID, ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD  FROM DUAL))M
                LEFT OUTER JOIN
                (SELECT *
                  FROM (
          SELECT   X.NEW_SUB_GROUP,X.PERIOD,
TO_CHAR(SERVICES_REV)SERVICES_REV,
                                TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                              TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                              TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                             


TO_CHAR(Z.REMARKS) REMARKS   FROM 
(          SELECT DISTINCT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          AND I.IOU_ID = '||I_ISU_ID||'
          '||V_APPEND_QRY||'
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                           ''' || V_PRV_QTR_PL ||
                 '''||'' ''||''' || V_ACTUAL_HDR ||
                 ''' PERIOD ,
                            SERVICES_REV,
                            BOC_REV,
                           SUB_CON_REV,
                            TCS_LICENSE_REV,
                             TOTAL_REV,
                              INCR_HC,
                           CM_MARGIN, ----==//Gross Margin Calculation
                          BOC_COST_BMN_USD,
                             TCV_BMN_USD,IOU_ID,ACCOUNT_ID
                        
                       FROM  BTG_WKLY_PL_PMO_TGT  T \*BTG_WKLY_PL_PMO_TGT t*\--- WKLY_ACCT_PMO_TGT S
                        WHERE t.QUATER = ''' ||
                 V_CUR_QTR || '''
                      AND UPPER(T.PERIOD) LIKE ''%ACTUAL%''
                        AND T.IOU_ID = '||I_ISU_ID||'
                        '||V_APPEND_QRY||'
                      AND T.ACCOUNT_ID  IN  (SELECT DISTINCT B.ACCOUNT_ID FROM BTG_WKLY_PL_PMO_TGT B
                                            WHERE  B.IOU_ID =  '||I_ISU_ID||'
                                         \*  '||V_APPEND_QRY||'
                                            AND B.ACCOUNT_ID = T.ACCOUNT_ID 
                                            AND B.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || ''' *\
                ))X
                                            
                                            LEFT OUTER JOIN 
                                            
                                            
                                             (SELECT DISTINCT T.IOU_ID,T.ACCOUNT_ID, T.REMARKS
                                FROM btg_WKLY_PL_TGT T
                               WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                 AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                     (SELECT iou_id,sub_iou_id,account_id, MAX(FILE_DATE)
                                        FROM btg_WKLY_PL_TGT S
                                        WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                          AND IOU_ID = '||I_ISU_ID||'
                                          '||V_APPEND_QRY||'
                                          AND S.ACCOUNT_ID = T.ACCOUNT_ID
                                          AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                       GROUP BY IoU_ID,sub_iou_id,account_id)
                                 AND UPPER(T.PERIOD) = '''||V_CUR_QTR_PL||' OUTLOOK''
                                 AND UPPER(T.PERIOD) NOT LIKE ''%CORP%''
                                )Z
                                
                                ON X.IOU_ID = Z.IOU_ID
                                AND X.ACCOUNT_ID = Z.ACCOUNT_ID 
                
                        UNION ALL
                        SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1 
           AND IOU_ID = '||I_ISU_ID||'
           '||V_APPEND_QRY||'
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                                ''' || V_CUR_QTR_PL ||
                 '''||'' AOP'' PERIOD,
                 TO_CHAR(SERVICES_REV)SERVICES_REV,
                            TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                              TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                              TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                               '''' REMARKS
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' ||
                 V_CUR_QTR || '''
                           AND REGEXP_LIKE(UPPER(PERIOD), ''AOP'')
                             AND UPPER(T.PERIOD) NOT LIKE ''%REVISED%''
                        UNION ALL
                        SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          AND IOU_ID = '||I_ISU_ID||'
           '||V_APPEND_QRY||'
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) NEW_SUB_GROUP,
                               ''' || V_CUR_QTR_PL ||
                 '''||'' Revised Target/WFP*'' PERIOD,
                 TO_CHAR(SERVICES_REV)SERVICES_REV,
                               TO_CHAR(BOC_REV)BOC_REV,
                                TO_CHAR(SUB_CON_REV)SUB_CON_REV,
                                TO_CHAR(TCS_LICENSE_REV)TCS_LICENSE_REV,
                              TO_CHAR(TOTAL_REV)TOTAL_REV,
                               TO_CHAR(INCR_HC)INCR_HC,
                                TO_CHAR(CM_MARGIN)CM_MARGIN,
                               TO_CHAR(BOC_COST_BMN_USD)BOC_COST_BMN_USD,
                              TO_CHAR(TCV_BMN_USD)TCV_BMN_USD,
                               '''' REMARKS
                          FROM BTG_WKLY_PL_PMO_TGT T
                         WHERE T.QUATER = ''' ||
                 V_CUR_QTR || '''
                           AND REGEXP_LIKE(UPPER(PERIOD), ''REVISED TARGET'')
                        UNION ALL
                        SELECT B.IOU,
                              ''' || V_CUR_QTR_PL ||
                 '''||'' Outlook'' PERIOD,
                               '''' SERV_CUR_OUT_REV,-- TO_CHAR(B.SERV_CUR_OUT_REV),
                              '''' BOC_CUR_OUT_REV,-- TO_CHAR(B.BOC_CUR_OUT_REV),
                              '''' SUB_CON_CUR_OUT_REV,-- TO_cHAR(B.SUB_CON_CUR_OUT_REV),
                              '''' TCS_LICENSE_CUR_OUT_REV,-- TO_CHAR(B.TCS_LICENSE_CUR_OUT_REV),
                              '''' TOTAL_CUR_OUT_REV,-- TO_CHAR(B.TOTAL_CUR_OUT_REV),
                               TO_CHAR(B.CUR_HC_INCR),
                               TO_cHAR(B.CM_MARGIN),
                               TO_CHAR(B.CUR_COST),
                               TO_CHAR(B.TCV_BMN_USD),
                               B.REMARKS
                          FROM(SELECT (SELECT DISTINCT I.SHORT_NAME isu_name FROM new_btg_account_mapping I 
          WHERE 1=1
          AND IOU_ID = '||I_ISU_ID||'
           '||V_APPEND_QRY||'
          AND I.ACCOUNT_ID = T.ACCOUNT_ID) IOU,
                                                 T.PERIOD,
                                                 T.SERVICES_REV SERV_CUR_OUT_REV,
                                                 T.BOC_REV BOC_CUR_OUT_REV,
                                                 T.SUB_CON_REV SUB_CON_CUR_OUT_REV,
                                                 T.TCS_LICENSE_REV TCS_LICENSE_CUR_OUT_REV,
                                                 (SERVICES_REV +  BOC_REV + SUB_CON_REV + TCS_LICENSE_REV) TOTAL_CUR_OUT_REV,
                                                 T.INCR_HC CUR_HC_INCR,
                                                 T.BOC_COST_BMN_USD CUR_COST,
                                                 TO_NUMBER(CM_MARGIN) CM_MARGIN,
                                                 T.TCV_BMN_USD,
                                                 null REMARKS
                                            FROM btg_WKLY_PL_TGT T
                                           WHERE T.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                             AND (T.IoU_ID,t.sub_iou_id,t.account_id, T.FILE_DATE) IN
                                                 (SELECT IoU_ID,sub_iou_id,account_id, MAX(FILE_DATE)
                                                    FROM btg_WKLY_PL_TGT S
                                                    WHERE S.QUARTER = ''' ||
                 V_CUR_QTR || '''
                                                            AND IOU_ID = '||I_ISU_ID||'
                                                                       '||V_APPEND_QRY||'
                                                      AND S.FILE_DATE '||V_GRT_COND||'= ''' ||
                 V_PERIOD || '''
                                                   GROUP BY IoU_ID,sub_iou_id,account_id)
                                             AND UPPER(T.PERIOD) = UPPER('''||V_CUR_QTR_PL||' Outlook'')
                                             AND UPPER(T.PERIOD) NOT LIKE ''%CORP%'') B
                           )) N
                            ON M.ISU_NAME = N.NEW_SUB_GROUP
                            AND M.PERIOD = N.PERIOD
                            ORDER BY M.ISU_NAME,ID)';
                            end if;     
      END IF;
      END IF;
    
      DELETE FROM SD_DUMMY;
      COMMIT;
      INSERT INTO SD_DUMMY VALUES (QRY);
      COMMIT;
    
      OPEN O_CUR_VAL FOR QRY;
    IF UPPER(I_REPORT_NAME) = 'REPORT' AND (I_ISU_ID <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID <> 0 ) THEN
      V_HDR_COND:='and HEADER_ID NOT IN (1
,4
,16
,41
,51
,60
,74
,81
)';
      ELSE 
        V_HDR_COND := '';
     END IF;
     --ADDED FOR ONLY HC 
     IF   ((TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') -- THEN
         AND  (I_GRID_COUNT = 6) AND TRIM(UPPER(I_SHEET_NAME)) LIKE '%P' || '&' || 'L%') THEN 
       QRY := 'SELECT ''Account$$0,125,197$$FFFFFF'',''Account$$0,125,197$$FFFFFF'' FROM  DUAL
       UNION ALL
       SELECT '''||V_CUR_QTR || '  Outlook $$0,125,197$$FFFFFF  '',''Incr HC$$0,125,197$$FFFFFF'' FROM DUAL';
     --  SELECT '''||V_CUR_QTR ||''' OUTLOKK ''INC HC'' FROM DUAL';
       ELSE 
        
      QRY := 'SELECT ' || V_SELECT || '
          FROM (SELECT FN_MULTIPLE_REPLACE(LEVEL_1_HDR,
                                          NEW T_TEXT(''Current Quarter'',
                                                     ''Previous Quarter'',
                                                     ''Cur Qtr'',
                                                     ''Prv Qtr'',
                                                     ''File Date'',
                                                     ''BG Name'',
                                                     ''<Actual Period>'',
                                                      ''Q1FY23 Projection'',
                                                     ''Q2FY23 Projection'',
                                                     ''Q3FY23 Projection'',
                                                     ''Q4FY23 Projection'',
                                                     ''FY23 Projection''
                                                     ),
                                          NEW T_TEXT(''' ||
             V_CUR_QTR_HDR || ''',
                                                     ''' ||
             V_PRV_QTR_HDR || ''',
                                                     ''' ||
             V_CUR_QTR_HDR_SRT || ''',
                                                     ''' ||
             V_PRV_QTR_HDR_SRT || ''',
                                                     ''' ||
             V_PERIOD || ''',
                                                     ''' ||
             V_BG_NAME || ''',
                                                     ''' ||
             V_ACTUAL_HDR ||
             ''',
                                                        ''' ||
             V_TCV_HDR1 ||
             ''',
                                                        ''' ||
             V_TCV_HDR2 ||
             ''', ''' ||
             V_TCV_HDR3 ||
             ''',
             ''' ||
             V_TCV_HDR4 ||
             ''',
             ''' ||
             V_TCV_FINAL ||
             '''
             
             )) LEVEL_1_HDR,
                     FN_MULTIPLE_REPLACE(LEVEL_2_HDR,
                                          NEW T_TEXT(''Current Quarter'',
                                                     ''Previous Quarter'',
                                                     ''Cur Qtr'',
                                                     ''Prv Qtr'',
                                                     ''File Date'',
                                                     ''BG Name'',
                                                     ''<Actual Period>'',
                                                     ''MON1'',
                                                     ''MON2'',
                                                      ''MON3''),
                                          NEW T_TEXT(''' ||
             V_CUR_QTR_HDR || ''',
                                                     ''' ||
             V_PRV_QTR_HDR || ''',
                                                     ''' ||
             V_CUR_QTR_HDR_SRT || ''',
                                                     ''' ||
             V_PRV_QTR_HDR_SRT || ''',
                                                     ''' ||
             V_PERIOD || ''',
                                                     ''' ||
             V_BG_NAME || ''',
                                                     ''' ||
             V_ACTUAL_HDR || ''',
                                                     ''' ||
             V_FIRST_MON1 || ''',
                                                     ''' ||
             V_SECOND_MON1 || ''',
                                                     ''' ||
             V_LAST_MON1 ||
             ''')) LEVEL_2_HDR,
                    FN_MULTIPLE_REPLACE(LEVEL_3_HDR,
                                          NEW T_TEXT(''Current Quarter'',
                                                     ''Previous Quarter'',
                                                     ''Cur Qtr'',
                                                     ''Prv Qtr'',
                                                     ''File Date'',
                                                     ''BG Name'',
                                                     ''<Actual Period>'',
                                                     ''MON1'',
                                                     ''MON2'',
                                                      ''MON3''),
                                          NEW T_TEXT(''' ||
             V_CUR_QTR_HDR || ''',
                                                     ''' ||
             V_PRV_QTR_HDR || ''',
                                                     ''' ||
             V_CUR_QTR_HDR_SRT || ''',
                                                     ''' ||
             V_PRV_QTR_HDR_SRT || ''',
                                                     ''' ||
             V_PERIOD || ''',
                                                     ''' ||
             V_BG_NAME || ''',
                                                     ''' ||
             V_ACTUAL_HDR || ''',
                                                       ''' ||
             V_FIRST_MON1 || ''',
                                                     ''' ||
             V_SECOND_MON1 || ''',
                                                     ''' ||
             V_LAST_MON1 ||
             ''')) LEVEL_3_HDR,
                     LEVEL_1_HDR_COLOR,
                     LEVEL_2_HDR_COLOR,
                     LEVEL_3_HDR_COLOR,
                     HEADER_ID                                               
                FROM WSR_TEMPLATE_HDR_BTG T
               WHERE TRIM(UPPER(T.REPORT_NAME)) =  TRIM(UPPER(''' ||
             I_REPORT_NAME ||
             '''))
                 AND TRIM(UPPER(SHEET_NAME)) =  TRIM(UPPER(''' ||
             I_SHEET_NAME || '''))
                -- AND T.GRID_ID = ' || I_GRID_COUNT || '
                       AND T.HEADER_ID NOT IN (3.1,3.2,15.1,15.2,80.1,80.2,73.1,73.2,88.1,88.2,40.1,40.2,59.1,59.2,49.1,49.2,18.1,23.2,28.1,23.93)
                 ' || V_HDR_COND || '
                 ' || V_LVL_COND || '
               ORDER BY HEADER_ID)';
    END IF;
      DELETE FROM X_TST_6;
      COMMIT;
      INSERT INto X_TST_6 VALUES (QRY);
      COMMIT;
    
      OPEN O_CUR_HDR FOR QRY;
      
       IF UPPER(I_REPORT_NAME) = 'TEMPLATE'  THEN 
    
      QRY := 'SELECT COLUMN_DATATYPE,
                     COLUMN_WIDTH,
                     COLUMN_COLOR,
                   /*  COLUMN_EDITABLE,*/
                      DECODE(LEVEL_2_HDR,''MON1'', 
                                                       DECODE('''||V_PR1_APP||''',''(P)'',''TRUE'',''FALSE''),
                                                       ''MON2'', 
                                                       DECODE('''||V_PR2_APP||''',''(P)'',''TRUE'',''FALSE''),
                                                       ''MON3'', 
                                                       DECODE('''||V_PR3_APP||''',''(P)'',''TRUE'',''FALSE''),COLUMN_EDITABLE),
                     ' || V_COL_FORMULA ||
             '  COLUMN_FORMULA,
                     COLUMN_WRAP_TEXT
               FROM (SELECT *
                       FROM WSR_TEMPLATE_HDR_BTG T
                      WHERE TRIM(UPPER(T.REPORT_NAME)) = TRIM(UPPER(''' ||
             I_REPORT_NAME ||
             '''))
                        AND TRIM(UPPER(T.SHEET_NAME)) = TRIM(UPPER(''' ||
             I_SHEET_NAME || '''))
                        AND T.GRID_ID = ' || I_GRID_COUNT || '
                       AND T.HEADER_ID NOT IN (3.1,3.2,15.1,15.2,80.1,80.2,73.1,73.2,88.1,88.2,40.1,40.2,59.1,59.2,49.1,49.2,18.1,23.2,28.1,23.93)
                        ' || V_HDR_COND || '
                        ' || V_LVL_COND || '
                       ORDER BY HEADER_ID)';
       ---------FOR HC WE CREATED FOR ONLY P&L SHEEET , THIS SHEET HAVE ONLY 2 COLUMNS 
        ELSIF   ((TRIM(UPPER(I_REPORT_NAME)) = 'REPORT') -- THEN
         AND  (I_GRID_COUNT = 2) AND TRIM(UPPER(I_SHEET_NAME)) LIKE '%P' || '&' || 'L%') THEN 
         
         QRY := 'SELECT COLUMN_DATATYPE,
                     COLUMN_WIDTH,
                     COLUMN_COLOR,
                     COLUMN_EDITABLE,
                    
                     ' || V_COL_FORMULA ||
             '  COLUMN_FORMULA,
                     COLUMN_WRAP_TEXT
               FROM (SELECT *
                       FROM WSR_TEMPLATE_HDR_BTG T
                      WHERE TRIM(UPPER(T.REPORT_NAME)) = TRIM(UPPER(''' ||
             I_REPORT_NAME ||
             '''))
                        AND TRIM(UPPER(T.SHEET_NAME)) = TRIM(UPPER(''' ||
             I_SHEET_NAME || '''))
                     --   AND T.GRID_ID = ' || I_GRID_COUNT || '
                       AND T.HEADER_ID  IN (4,11)
                        ' || V_HDR_COND || '
                        ' || V_LVL_COND || '
                       ORDER BY HEADER_ID)';               
         ---------------------------------              
     ELSE 
       
     
      QRY := 'SELECT COLUMN_DATATYPE,
                     COLUMN_WIDTH,
                     COLUMN_COLOR,
                     COLUMN_EDITABLE,
                    
                     ' || V_COL_FORMULA ||
             '  COLUMN_FORMULA,
                     COLUMN_WRAP_TEXT
               FROM (SELECT *
                       FROM WSR_TEMPLATE_HDR_BTG T
                      WHERE TRIM(UPPER(T.REPORT_NAME)) = TRIM(UPPER(''' ||
             I_REPORT_NAME ||
             '''))
                        AND TRIM(UPPER(T.SHEET_NAME)) = TRIM(UPPER(''' ||
             I_SHEET_NAME || '''))
                      --  AND T.GRID_ID = ' || I_GRID_COUNT || '
                       AND T.HEADER_ID NOT IN (3.1,3.2,15.1,15.2,80.1,80.2,73.1,73.2,88.1,88.2,40.1,40.2,59.1,59.2,49.1,49.2,18.1,23.2,28.1,23.93)
                        ' || V_HDR_COND || '
                        ' || V_LVL_COND || '
                       ORDER BY HEADER_ID)';
                       
                       END IF;
                        
                       
           DELETE FROM   X_TST_CPG ;
           COMMIT;
           INSERT INTO X_TST_CPG VALUES(QRY);
           COMMIT;             
    
      OPEN O_CUR_DATA_TYPE FOR QRY;
      
      select substr(fn_fetch_qtr(V_PERIOD),2,1)  into O_TCV_COL from dual;
      
      
    
      O_MSG := 'Success';
    
   /* EXCEPTION
      WHEN OTHERS THEN
        O_MSG := 'Failure';*/
    END;
  
  end SP_WSR_TEMPLATE; 
  

  
  

  

  PROCEDURE SP_WEEKLY_FILE_DATE(I_DATE      IN DATE,
                                O_CUR_WEEK  OUT DATE,
                                O_CUR_MONTH OUT DATE,
                                O_CUR_QTR   OUT VARCHAR2) IS
    V_CUR_WEEK_DATE DATE;
    V_TODAY         VARCHAR2(1000);
    V_CUR_QTR       VARCHAR2(1000);
    V_CUR_MONTH     VARCHAR2(1000);
    QRY             LONG;
  BEGIN
  
    SELECT TRIM(TO_CHAR(I_DATE, 'Day')) INTO V_TODAY FROM DUAL;
  
    ----CONSIDERING SUNDAY AS THE FILE_DATE WHILE UPLOADING
  
    IF V_TODAY = 'Friday' THEN
      V_CUR_WEEK_DATE := I_DATE - 5;
    ELSIF V_TODAY = 'Saturday' THEN
      V_CUR_WEEK_DATE := I_DATE - 6;
    ELSIF V_TODAY = 'Sunday' THEN
      V_CUR_WEEK_DATE := I_DATE - 7;
    ELSIF V_TODAY = 'Monday' THEN
      V_CUR_WEEK_DATE := I_DATE - 8;
    ELSIF V_TODAY = 'Tuesday' THEN
      V_CUR_WEEK_DATE := I_DATE - 2;--- 5; ---=== +5
    ELSIF V_TODAY = 'Wednesday' THEN
      V_CUR_WEEK_DATE := I_DATE - 3;--- 4;
    ELSIF V_TODAY = 'Thursday' THEN
      V_CUR_WEEK_DATE := I_DATE - 4;
    END IF;
  
    --== CUR WEEK PLAN QTR
    V_CUR_QTR := FN_FETCH_QTR(IN_DATE => V_CUR_WEEK_DATE);
    --== CUR WEEK PLAN MONTH
    SELECT TO_DATE(TO_CHAR('01-' || TO_CHAR(V_CUR_WEEK_DATE, 'MON-RRRR')),
                   'DD-MON-RRRR')
      INTO V_CUR_MONTH
      FROM DUAL;
    --== CUR WEEK PLAN DATE
    O_CUR_WEEK  := TRIM(V_CUR_WEEK_DATE);
    O_CUR_QTR   := V_CUR_QTR;
    O_CUR_MONTH := V_CUR_MONTH;
  
  END SP_WEEKLY_FILE_DATE;
  PROCEDURE SP_WEEKLY_UPLOAD(I_LOGGED_EMP_ID IN NUMBER,
                             I_CORP          IN NUMBER,
                             I_BU            IN NUMBER,
                             I_ISU           IN NUMBER,
                             I_CLUS_ID       IN NUMBER,
                             I_ACC_ID        IN NUMBER,
                             I_FILE_NAME     IN VARCHAR2,
                             I_DATE          IN VARCHAR2,
                          
                             O_MSG           OUT VARCHAR2) IS
  
    V_SEQ_ID           VARCHAR2(2000);
    V_FIRST            VARCHAR2(4000);
    V_WEEK             VARCHAR2(4000);
    V_LEVEL_ID         VARCHAR2(4000);
    V_LAST             VARCHAR2(4000);
    V_COUNT            NUMBER;
    QRY                LONG;
    v_msg_cnt NUMBER;
    V_FILE_DATE        DATE;
    V_MAX_DATE         DATE;
    V_VAR              VARCHAR2(100);
    V_FLAG             VARCHAR2(1000);
    V_CURR_MONTH       VARCHAR2(1000);
    V_CURR_QTR         VARCHAR2(1000);
    V_C1               NUMBER;
    V_C2               NUMBER;
    V_C3               NUMBER;
    V_C4               NUMBER;
    V_C5               NUMBER;
    V_C6               NUMBER;
    V_SUB_ISU_CNT      NUMBER;
    V_VAR_CUR          VARCHAR2(1000);
    V_CURR_MONTH_SYS   VARCHAR2(1000);
    V_MAX_UPLOAED_DATE DATE;
    V_FUTURE_CUR       VARCHAR2(100);
    V_FALG             VARCHAR2(100);
    V_ACT_CNT          NUMBER;
    V_REPORT_FLAG   VARCHAR2(100);
    
  BEGIN
  BEGIN
    IF I_LOGGED_EMP_ID IS NULL OR I_ISU IS NULL OR I_BU IS NULL OR
       I_CORP IS NULL OR I_DATE IS NULL THEN
    
      O_MSG := 'Please Provide required details';
    
      RETURN;
    END IF;
  
    INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
    VALUES
      (I_LOGGED_EMP_ID,
       SYSDATE,
       'PKG_WEEKLY_REPORT.SP_WEEKLY_UPLOAD',
       I_LOGGED_EMP_ID || ',' || I_CORP || ',' || I_BU || ',' || I_ISU || ',' || ',' ||
       I_DATE,
       I_DATE,
       I_ISU,
       '');
  
    COMMIT;
    PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(I_DATE, 'DD/MM/RRRR'),
                                             V_FILE_DATE,
                                             V_CURR_MONTH,
                                             V_CURR_QTR);
  
    QRY := 'SELECT TRUNC(NEXT_DAY(''' || V_FILE_DATE ||
           ''', ''THU'')) - INTERVAL ''7'' DAY AS PREV_MONDAY,
                    TRUNC(NEXT_DAY(''' || V_FILE_DATE ||
           ''', ''THU'')) - INTERVAL ''1'' DAY AS NEXT_FRIDAY
               FROM DUAL';
  
    EXECUTE IMMEDIATE QRY
      INTO V_FIRST, V_LAST;
  
    V_WEEK := '#Weekly Report status for the week: ' || V_FIRST || ' to  ' ||
              V_LAST || ' ';
  
    SELECT DISTINCT LEVEL_ID
      INTO V_LEVEL_ID
      FROM WEEKLY_REPORT_USER_DETAILS_BTG
     WHERE EMP_ID = I_LOGGED_EMP_ID;
    IF V_LEVEL_ID = 6 THEN
      O_MSG := 'Y' || '#' || 'N' || '#' || 'NOSHOW' || V_WEEK;
    ELSE
      QRY := 'SELECT MAX(T.FILE_DATE) FROM WKLY_REP_FRZ_UNFRZ_BTG T ';
    
      EXECUTE IMMEDIATE QRY
        INTO V_MAX_DATE; --PRESENT SUNDAY
    
      /*QRY := 'SELECT TRUNC(NEXT_DAY(TO_DATE(''' || I_DATE ||
             ''',''DD/MM/RRRR''), ''MON'')) - INTERVAL ''1'' DAY AS NEXT_SUNDAY
                   FROM DUAL';
      
      EXECUTE IMMEDIATE QRY
        INTO V_FILE_DATE;---INPUT SUNDAY DATE*/
      PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(I_DATE,
                                                       'DD/MM/RRRR'),
                                               V_FILE_DATE,
                                               V_CURR_MONTH,
                                               V_CURR_QTR);
    
      SELECT TO_DATE(TO_CHAR('01-' || TO_CHAR(SYSDATE, 'MON-RRRR')),
                     'DD-MON-RRRR')
        INTO V_CURR_MONTH_SYS
        FROM DUAL;
    
 
      
        QRY := 'SELECT TRUNC(NEXT_DAY(''' || V_FILE_DATE ||
               ''', ''THU'')) - INTERVAL ''7'' DAY AS PREV_MONDAY,
                    TRUNC(NEXT_DAY(''' || V_FILE_DATE ||
               ''', ''THU'')) - INTERVAL ''1'' DAY AS NEXT_FRIDAY
               FROM DUAL';
      
        EXECUTE IMMEDIATE QRY
          INTO V_FIRST, V_LAST;
      
        V_WEEK := '#Weekly Report status for the week: ' || V_FIRST ||
                  ' to  ' || V_LAST || ' ';
      
        IF ((V_C1 = 0 OR V_C2 = 0 OR V_C4 = 0) AND
           (V_C3 = 0 OR V_C2 = 0 OR V_C4 = 0)) THEN
        
          V_FLAG := 'NOSHOW';
        
        ELSE
        
          BEGIN
            SELECT CASE
                     WHEN (T.FREEZE_FLAG = 'N' AND T.FILE_UPLOADED = 'Y') THEN
                      'SHOW'
                     WHEN (T.FREEZE_FLAG = 'N' AND T.FILE_UPLOADED = 'N') THEN
                      'NOSHOW'
                     ELSE
                      'NOSHOW'
                   END,T.FILE_UPLOADED
              INTO V_FLAG,V_REPORT_FLAG
              FROM WKLY_REP_FRZ_UNFRZ_BTG T
             WHERE T.ISU_ID = I_ISU
               AND T.SUB_ISU_ID = I_CLUS_ID
               AND T.ACCOUNT_ID = I_ACC_ID
               AND T.FILE_DATE = V_FILE_DATE;
          
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              SELECT 'NOSHOW','N' INTO V_FLAG,
              V_REPORT_FLAG FROM DUAL;
          END;
        END IF;
        
         IF I_BU <> 0 AND I_ISU = 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0 THEN
           V_REPORT_FLAG := 'Y';
          ELSIF I_BU <> 0 AND I_ISU <> 0 AND I_CLUS_ID = 0 AND I_ACC_ID = 0 THEN
             V_REPORT_FLAG := 'Y';
           ELSIF I_BU <> 0 AND I_ISU <> 0 AND I_CLUS_ID <> 0 AND I_ACC_ID = 0 THEN
             V_REPORT_FLAG := 'Y';   
           
         END IF;
        
        IF V_REPORT_FLAG = 'Y' THEN 
        V_REPORT_FLAG := 'N' ;
        ELSIF V_REPORT_FLAG = 'N' 
        THEN  V_REPORT_FLAG := 'Y' ;
        END IF;
    /*  END IF;*/
    
    
    ---SELECT WKLY_REP_FRZ_UNFRZ_BTG H 
    
      IF I_ISU <> 0 THEN
      
        IF V_FILE_DATE < V_MAX_DATE THEN
        
          -- O_MSG :='Y'|| '#' || 'N' ||'#' || V_FLAG;
        
          SELECT MAX(TRUNC(T.FILE_DATE))
            INTO V_MAX_UPLOAED_DATE
            FROM WKLY_REP_FRZ_UNFRZ_BTG T
           WHERE T.ISU_ID = I_ISU
             AND T.SUB_ISU_ID = I_CLUS_ID
             AND T.ACCOUNT_ID = I_ACC_ID
             AND T.FILE_UPLOADED = 'Y';
        
          IF V_MAX_UPLOAED_DATE < V_FILE_DATE /* AND  V_CURR_MONTH=V_CURR_MONTH_SYS*/
           THEN
          
            O_MSG := 'N' || '#' || V_REPORT_FLAG || '#' || V_FLAG || V_WEEK;
          
          ELSIF V_MAX_UPLOAED_DATE > V_FILE_DATE /*AND  V_CURR_MONTH=V_CURR_MONTH_SYS*/
           THEN
          
            O_MSG := 'Y' || '#' || V_REPORT_FLAG || '#' || V_FLAG || V_WEEK;
            
          
          ELSIF V_MAX_UPLOAED_DATE = V_FILE_DATE OR
                V_MAX_UPLOAED_DATE IS NULL THEN
          
            SELECT T.FREEZE_FLAG
              INTO V_VAR
              FROM WKLY_REP_FRZ_UNFRZ_BTG T
             WHERE T.ISU_ID = I_ISU
               AND T.SUB_ISU_ID = I_CLUS_ID
               AND T.ACCOUNT_ID = I_ACC_ID
               AND T.FILE_DATE = V_FILE_DATE;
          
            IF V_VAR = 'Y' THEN
            
              O_MSG := 'Y' || '#' || V_REPORT_FLAG || '#' || V_FLAG || V_WEEK;
            
            ELSE
              O_MSG := 'N' || '#' || V_REPORT_FLAG || '#' || V_FLAG || V_WEEK;
            
            END IF;
          
          ELSE
          
            O_MSG := 'Y' || '#' || V_REPORT_FLAG || '#' || V_FLAG || V_WEEK;
          
          END IF;
        ELSIF V_FILE_DATE = V_MAX_DATE THEN
        
          SELECT T.FREEZE_FLAG
            INTO V_VAR
            FROM WKLY_REP_FRZ_UNFRZ_BTG T
           WHERE T.ISU_ID = I_ISU
             AND T.SUB_ISU_ID = I_CLUS_ID
             AND T.ACCOUNT_ID = I_ACC_ID
             AND T.FILE_DATE = V_FILE_DATE;
        
          IF V_VAR = 'Y' THEN
          
            O_MSG := 'Y' || '#' || V_REPORT_FLAG || '#' || V_FLAG || V_WEEK;
          
          ELSE
            O_MSG := 'N' || '#' || V_REPORT_FLAG || '#' || V_FLAG || V_WEEK;
          
          END IF;
        
        ELSE
        
          O_MSG := 'Y' || '#' || V_REPORT_FLAG || '#' || V_FLAG || V_WEEK;
        END IF;
      
      ELSE
      
        O_MSG := 'Y' || '#' || V_REPORT_FLAG || '#' || 'NOSHOW' || V_WEEK;
      
      END IF;
    END IF;
    IF I_ISU = 0 OR I_CLUS_ID = 0 OR I_ACC_ID = 0 THEN
      O_MSG := 'Y' || '#' || V_REPORT_FLAG || '#' || 'NOSHOW' || V_WEEK;
    END IF;
    
   /* IF V_LEVEL_ID IN (-2,6) 
    THEN 
     SELECT 'Weekly Status IOU Download Report' INTO V_REPORT_FLAG
     FROM DUAL; 
     ELSE 
     V_REPORT_FLAG := 'Weekly Status Download Report';
     END IF;
     
     O_REPORT_FLAG := V_REPORT_FLAG;*/
  
    /* IF I_ISU=240 AND V_FILE_DATE='18-Aug-2019' THEN
    
    O_MSG :='N'|| '#' || 'N'||'#' ||'SHOW';
    
    END IF;*/
  
    ---- O_MSG :='N'|| '#' || 'N'||'#' ||'SHOW';
    select count(*) into v_msg_cnt
     from wkly_rep_frz_unfrz_btg t where t.file_date = V_FILE_DATE;
     if v_msg_cnt = 0 then
               O_MSG := 'D' || '#' || 'Y' || '#' || 'NOSHOW' || V_WEEK;

     end if;
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        O_MSG := 'Y' || '#' || V_REPORT_FLAG || '#' || 'NOSHOW' || V_WEEK;
    END;
  
  END SP_WEEKLY_UPLOAD;

  PROCEDURE SP_WEEKLY_UPLOAD_STG(I_LOGGED_EMP_ID IN NUMBER,
                                 I_COORPORATE    IN VARCHAR2,
                                 I_BU            IN VARCHAR2,
                                 I_ISU_ID        IN NUMBER,
                                 I_CLUS_ID       IN NUMBER,
                                 I_ACC_ID        IN NUMBER,
                                 I_SHEET_NAME    IN VARCHAR2,
                                 I_DATE     IN VARCHAR2,
                                 O_INSERT_QRY    OUT VARCHAR2,
                                 O_DELETE_QRY    OUT VARCHAR2) IS
                                 
                                 
                       
  
  BEGIN
  
    INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
    VALUES
      (I_LOGGED_EMP_ID,
       SYSDATE,
       'PKG_WSR_UPLOAD.SP_WEEKLY_UPLOAD_STG',
       I_LOGGED_EMP_ID || '-' || I_COORPORATE || '-' || I_BU || '-' ||
       I_ISU_ID || '-' || I_SHEET_NAME || '-' || I_DATE,
       '',
       I_ISU_ID,
       '');
  
    COMMIT;
    
 
  
    IF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'EXECUTIVESUMMARY' THEN
    
      O_INSERT_QRY := 'INSERT INTO BTG_EXECUTIVE_SUMMARY_STG VALUES('' '',?,' ||
                      I_ISU_ID || ',' || I_LOGGED_EMP_ID || ',''' || I_DATE ||
                      ''',?,' || I_CLUS_ID || ',' || I_ACC_ID || ')';
      O_DELETE_QRY := 'DELETE FROM BTG_EXECUTIVE_SUMMARY_STG S 
   WHERE S.IOU_ID = ' || I_ISU_ID || ' 
   AND S.SUB_IOU_ID = ' || I_CLUS_ID || '
   AND S.ACCOUNT_ID = ' || I_ACC_ID || '';
   
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') like '%ITG%' THEN 
      
    
    O_INSERT_QRY := 'INSERT INTO WKLY_ITG_SALES_STG VALUES(?,?,?,?,?,' ||
                      I_ISU_ID || ',' || I_CLUS_ID || ',' || I_ACC_ID || ','' '',' || I_LOGGED_EMP_ID || ',''' || I_DATE ||''')';
     O_DELETE_QRY := 'DELETE FROM WKLY_ITG_SALES_STG S 
   WHERE S.IOU_ID = ' || I_ISU_ID || ' 
   AND S.SUB_IOU_ID = ' || I_CLUS_ID || '
   AND S.ACCOUNT_ID = ' || I_ACC_ID || '';
    ELSIF REPLACE(REPLACE(UPPER(I_SHEET_NAME), ' ', ''), '&', '') = 'PL' THEN
    
      O_INSERT_QRY := 'INSERT INTO BTG_WKLY_PL_STG 
   (period, 
services_rev, 
boc_rev, 
sub_con_rev, 
tcs_license_rev, 
total_rev, 
incr_hc, 
cm_margin, 
boc_cost_bmn_usd, 
tcv_bmn_usd, 
remarks, 
iOu_id, 
login_id, 
file_date, 
new_group, 
new_sub_group,
SUB_IOU_ID,
ACCOUNT_ID
) 
VALUES(?,?,?,?,?,?,?,?,?,?,?,' || I_ISU_ID || ',' ||
                      I_LOGGED_EMP_ID || ',''' || I_DATE || ''','''','''',' ||
                      I_CLUS_ID || ',' || I_ACC_ID || ')';
      O_DELETE_QRY := 'DELETE FROM BTG_WKLY_PL_STG S
     WHERE S.IOU_ID = ' || I_ISU_ID || ' 
   AND S.SUB_IOU_ID = ' || I_CLUS_ID || '
   AND S.ACCOUNT_ID = ' || I_ACC_ID || '
   '  ;
    
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') LIKE '%PIPELINE%' THEN
    
      ----STAGING INSERT
    
      O_INSERT_QRY := 'INSERT INTO WKLY_BTG_PIPELINE_STG(
       GROUP_CLIENT,
       CRM_ID,
       OPPORTUNITY_NAME,
       OPP_DESCRIPTION,
       SALES_STAGE,
       DEAL_VALUE,
       RENEWAL_VALUE,
       CLOSURE_MONTH,
       BUYING_STAKEHOLDER,
       SP,
       PRIMARY_FOCUS,
       PRIMARY_COMPETITORS,
       STATUS_UPDATE,
       IOU_ID,
       SUB_IOU_ID,
       ACCOUNT_ID,
       LOGIN_ID,
       FILE_DATE
) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,' || I_ISU_ID || ',' ||
                      I_CLUS_ID || ',' || I_ACC_ID || ',' ||
                      I_LOGGED_EMP_ID || ','''|| I_DATE ||''')';
    
      O_DELETE_QRY := 'DELETE FROM WKLY_BTG_PIPELINE_STG T WHERE T.IOU_ID= ' ||
                      I_ISU_ID || ' AND T.SUB_IOU_ID = ' || I_CLUS_ID ||
                      'AND T.ACCOUNT_ID = ' || I_ACC_ID ||' ';
    
     ELSIF REPLACE(UPPER(I_SHEET_NAME),' ','') LIKE 'C-CONNECTSORCUSTOMERVISIT' THEN
    
      O_INSERT_QRY := 'INSERT INTO WKLY_CUSTOMER_VISIT_STG 
   (
sub_iou_id, 
account, 
account_id, 
cust_name, 
category, 
tcs_partcipants_name, 
sentiments, 
meeting_date, 
visit_start_date, 
visit_end_date, 
visit_location, 
objective, 
outcome, 
iou_id, 
login_id, 
file_date



)
   VALUES (' || I_CLUS_ID || ',?,' || I_ACC_ID || ',
             ?,
             ?,
             ?,?,?,?,?,?,?,?,' || I_ISU_ID || ',' ||
                      I_LOGGED_EMP_ID || ',''' || I_DATE || ''')';
    
      O_DELETE_QRY := 'DELETE FROM WKLY_CUSTOMER_VISIT_STG S Where S.IOU_ID = TRIM ('||I_ISU_ID||')
AND S.SUB_IOU_ID = TRIM('||I_CLUS_ID||')
AND S.ACCOUNT_ID = TRIM('||I_ACC_ID||')
   ';
    
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'CLOSED' THEN
    
      O_INSERT_QRY := 'INSERT INTO WKLY_LOSSES_STG 
   (

group_customer, 
opp_id, 
opp_name, 
opp_value, 
renew_opp_value, 
closure_month, 
competitors, 
SALES_STAGE,
reason_for_loss_win,
iou_id, 
login_id, 
file_date, 
uploaded_date, 
updated_date, 
renewal_value, 
status_update,
sub_iou_id, 
account_id 


)
   VALUES (?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?,
             ?,' || I_ISU_ID || ',' ||
                      I_LOGGED_EMP_ID || ',''' || I_DATE ||
                      ''','''','''','''','''',' || I_CLUS_ID || ',' || I_ACC_ID || ')';
    
      O_DELETE_QRY := 'DELETE FROM WKLY_LOSSES_STG S Where S.IOU_ID = TRIM ('||I_ISU_ID||')
AND S.SUB_IOU_ID = TRIM('||I_CLUS_ID||')
AND S.ACCOUNT_ID = TRIM('||I_ACC_ID||')
   ';
    
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'WINS' THEN
    
      O_INSERT_QRY := 'INSERT INTO WKLY_WINS_STG 
   (
group_customer, 
opp_id, 
opp_name, 
total_of_con_value, 
renew_portion_toc, 
closure_month, 
competitors, 
reason_for_loss_win, 
iou_id, 
login_id, 
file_date, 
uploaded_date, 
updated_date, 
renewal_value, 
status_update,
sub_iou_id, 
account_id)
   VALUES (?,
             ?,
             ?,
             ?,?,?,?,?,' || I_ISU_ID || ',
                      ' ||I_LOGGED_EMP_ID || ','''|| I_DATE ||''','''','''','''','''',' || I_CLUS_ID || ',' || I_ACC_ID || ')';
    
      O_DELETE_QRY := 'DELETE FROM WKLY_WINS_STG S Where S.IOU_ID = TRIM ('||I_ISU_ID||')
AND S.SUB_IOU_ID = TRIM('||I_CLUS_ID||')
AND S.ACCOUNT_ID = TRIM('||I_ACC_ID||')

   ';
    
   /* ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'HC' THEN
    
      O_INSERT_QRY := 'INSERT INTO WKLY_HC_BTG_STG
      ( 
      
group_customer, 
\*GROUP_CUST_MAPPED, *\
wfp_net_off,
wfp_net_on, 
wfp_net_tot, 
net_won_gr_off, 
net_won_gr_onn, 
pa_off, 
pa_onn, 
\*pa_tot, *\
net_won_growth_off, 
net_won_growth_onn, 
net_won_growth_tot, 
mon1_exit, 
mon2_exit, 
mon3_exit, 
emp, 
tr, 
ep, 
ba, 
intern, 
file_date, 
uploaded_date, 
updated_date, 
iou_id,
login_id,
sub_iou_id, 
account_id,group_customer_id
)
VALUES
(?,
?,
\*?,
?,*\
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
?,
''' || I_DATE || ''',
'''',
'''',
'||I_ISU_ID||',
'||I_LOGGED_EMP_ID||','|| I_CLUS_ID ||' ,
'|| I_ACC_ID ||',0)';
    
      O_DELETE_QRY := 'DELETE FROM WKLY_HC_BTG_STG S Where S.IOU_ID = TRIM ('||I_ISU_ID||')
AND S.SUB_IOU_ID = TRIM('||I_CLUS_ID||')
AND S.ACCOUNT_ID = TRIM('||I_ACC_ID||')
 ';*/
      ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'HC' THEN
     
     O_DELETE_QRY := 'DELETE FROM BTG_WSR_HC_STG S Where s.ACCOUNT_ID='''||I_ACC_ID||'''';
                        
     O_INSERT_QRY := 'INSERT INTO BTG_WSR_HC_STG(iou_id, 
                            account, 
                            on_off, 
                            person_type, 
                            prev_qtr_exit, 
                            mon1_exit, 
                            mon2_exit, 
                            mon3_exit, 
                            prev_qtr_inc, 
                            mon1_inc, 
                            mon2_inc, 
                            mon3_inc, 
                            cur_qtr_inc, 
                            login_emp_id, 
                            datestamp, 
                            period,
                            account_id)
                            VALUES('||I_ISU_ID||',?,?,?,?,?,?,?,?,?,?,?,?,'||I_LOGGED_EMP_ID||',SYSDATE'||','''||I_DATE||''','||I_ACC_ID||')';
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'TCVOUTLOOK' THEN
    O_DELETE_QRY := 'DELETE FROM wkly_tcv_outlook_stg S Where S.IOU_ID = TRIM ('||I_ISU_ID||')
AND S.SUB_IOU_ID = TRIM('||I_CLUS_ID||')
AND S.ACCOUNT_ID = TRIM('||I_ACC_ID||')
 ';
    
      o_insert_qry := 'INSERT INTO  wkly_tcv_outlook_stg 
    (
    account,
    q1fy_projection,
    q2fy_projection,
    q3fy_projection,
    q4fy_projection,
    fy_projection,
    iou_id,
    sub_iou_id,
    account_id,
    uploaded_date,
    uploaded_by,
    FILE_DATE
       
    )
    values(?,?,?,?,?,?,' || i_isu_id || ', ' ||
                      i_clus_id || ' ,' || i_acc_id || ', SYSDATE, ' ||
                      I_LOGGED_EMP_ID || ','''|| I_DATE ||''')';
    
    END IF;
    
    
  
  END SP_WEEKLY_UPLOAD_STG;

  PROCEDURE SP_WEEKLY_UPLOAD_ERR_CHK(I_LOGGED_EMP_ID IN NUMBER,
                                     I_COORPORATE    IN VARCHAR2,
                                     I_BU            IN VARCHAR2,
                                     I_ISU_ID        IN NUMBER,
                                     I_CLUS_ID       IN NUMBER,
                                     I_ACC_ID        IN NUMBER,
                                     I_SHEET_NAME    IN VARCHAR2,
                                     I_DATE          IN VARCHAR2,
                                     O_ERROR_CUR     OUT SYS_REFCURSOR,
                                     O_MSG           OUT VARCHAR2)
  
   is
    QRY                  LONG;
    v_pl_rem_cnt number;
    v_exe_rem_cnt number;
  ---  v_loss_rem_cnt number;
    v_wins_rem_cnt number;
    V_COUNT1 number;
    V_EXE_CNT            number;
    V_CURR_QTR           VARCHAR2(1000);
    V_CURR_MONTH         DATE;
    V_CLOSURE_MONTH      VARCHAR2(1000);
    v_pip_rem_cnt number;
    V_DATE               DATE;
    v_loss_rem_cnt number;
    V_PLAN               VARCHAR2(2000);
    V_ISU#               NUMBER;
    V_PL_CNT             NUMBER;
    V_ISU                VARCHAR2(4000);
    V_CURSOR             SYS_REFCURSOR;
    V_CURSOR_1           SYS_REFCURSOR;
    V_SUB_ISU#           NUMBER;
    V_REL#               NUMBER;
    V_SUB_ISU            VARCHAR2(4000);
    V_REL                VARCHAR2(4000);
    V_CNT                NUMBER;
    V_CRM                VARCHAR2(1000);
    V_CRM_ID             VARCHAR2(1000);
    V_EXE_CNT1           NUMBER;
    V_SER_REV            VARCHAR2(1000);
    V_BOC_REV            VARCHAR2(1000);
    V_SUB_CON_REV        VARCHAR2(1000);
    V_LIC_REV            VARCHAR2(1000);
    V_TOTAL_REV          VARCHAR2(1000);
    V_INCR_HC            VARCHAR2(1000);
    V_CM                 VARCHAR2(1000);
    V_BOC_COST           VARCHAR2(1000);
    V_TCV                VARCHAR2(1000);
    V_COLUMN             VARCHAR2(1000);
    V_SER_PLAN           VARCHAR2(1000);
    V_BOC_PLAN           VARCHAR2(1000);
    V_SUB_CON_PLAN       VARCHAR2(1000);
    V_LIC_PLAN           VARCHAR2(1000);
    V_TOTAL_PLAN         VARCHAR2(1000);
    V_CUR_HC             VARCHAR2(1000);
    V_CUR_COST           VARCHAR2(1000);
    V_DEAL_VALUE         VARCHAR2(1000);
    V_REV_CONSIDER       VARCHAR2(1000);
    V_MEETING_DATE_CHECK DATE;
    V_PREV_REV           VARCHAR2(1000);
    V_CUR_AOP            VARCHAR2(1000);
    V_CUR_PLAN           VARCHAR2(1000);
    V_PREV_TCV           VARCHAR2(1000);
    V_CUR_TCV            VARCHAR2(1000);
    V_NO_OF_ACCCOUNT     VARCHAR2(1000);
    V_NO_OF_OPP          VARCHAR2(1000);
    V_OPP_VALUE          VARCHAR2(1000);
    V_PERIOD             DATE;
    V_QUALIFIED_OPP_VAL  VARCHAR2(1000);
    V_COLUMN1            VARCHAR2(1000);
    V_MON1               VARCHAR2(1000);
    V_MON3               VARCHAR2(1000);
    V_HC_1               VARCHAR2(1000);
    V_HC_2               VARCHAR2(1000);
    V_HC_3               VARCHAR2(1000);
    V_STG                VARCHAR2(1000);
    V_DUPLCT_COUNT       NUMBER;
    V_COUNT              NUMBER;
    CUR_DATA             SYS_REFCURSOR;
    V_SALES              VARCHAR2(500);
    V_CLOSE_DATE_CHECK   VARCHAR2(500);
    V_MON1_ST_DATE DATE;
    V_LAST_MON1   VARCHAR2(100);
    V_SECOND_MON1 VARCHAR2(100);
    V_FIRST_MON1  VARCHAR2(100);
    V_MON2_ST_DATE DATE;
    V_MON3_ST_DATE DATE;
  V_LAST_MON    DATE;
    V_SECOND_MON  DATE;
    V_FIRST_MON   DATE;
    V_CLOSE_DATE_CHECK1 DATE;
    V_FROM_DATE         DATE;
    V_TO_DATE           DATE;
    V_FROM_DATE1        VARCHAR2(500);
    V_CUR_QTR_HC_HDR   VARCHAR2(4000);
    V_TO_DATE1          VARCHAR2(500);
    V_HC_ERR_COUNT      NUMBER;
    V_CUR_1     SYS_REFCURSOR;
    V_STR        VARCHAR2(4000);
     V_PRO1  NUMBER;
    V_PRO2 NUMBER;
    V_PRO3   NUMBER;
    V_PR1_APP  VARCHAR2(100);
     V_PR2_APP  VARCHAR2(100);
      V_PR3_APP  VARCHAR2(100);
      
      v_category varchar2(100);
      v_count_5 number;
      v_count_6 NUMBER;
      V_CNT_NULL number;
      
      V_CAT_CHK VARCHAR2(100);
   V_ERR VARCHAR(100);
      V_CUR_2 SYS_REFCURSOR;
      V_MON2 VARCHAR2(100);
      V_CUR_QTR VARCHAR2(1000);
 
  begin
  
    INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
    VALUES
      (I_LOGGED_EMP_ID,
       SYSDATE,
       'PKG_WSR_UPLOAD.SP_WEEKLY_UPLOAD_ERR_CHK',
       I_LOGGED_EMP_ID || '-' || I_COORPORATE || '-' || I_BU || '-' ||
       I_ISU_ID || '-' || I_SHEET_NAME || '-' || I_DATE,
       '',
       I_ISU_ID,
       '');
  
    COMMIT;
  
    PKG_BTG_WSR_DOWNLOAD .SP_WEEKLY_FILE_DATE(TO_DATE(I_DATE, 'DD/MM/RRRR'),
                                              V_DATE,
                                              V_CURR_MONTH,
                                              V_CURR_QTR);
                                              
       V_CUR_QTR_HC_HDR  := FN_FETCH_QTR(IN_DATE => v_date);
                             
           V_LAST_MON := FN_FETCH_LAST_MON_QTR_DAY(I_QUARTERSTAMP => V_CUR_QTR_HC_HDR);
      
      select to_char(trunc(TO_DATE(V_PERIOD,'DD-MON-RR'),'Q'),'DD-MON-RR') , 
TO_CHAR(last_day(TRUNC(TO_DATE(V_PERIOD,'DD-MON-RR'),'Q'))+1,'DD-MON-RR') ,
TO_CHAR(last_day(last_day(TRUNC(TO_DATE(V_PERIOD,'DD-MON-RR'),'Q'))+1)+1,'DD-MON-RR') 
INTO V_MON1_ST_DATE,V_MON2_ST_DATE,V_MON3_ST_DATE
from dual;


    
      QRY := 'SELECT ADD_MONTHS(TO_DATE(''' || V_LAST_MON ||
             ''', ''DD-MON-RRRR''), -2) FROM DUAL';
    
      EXECUTE IMMEDIATE QRY
        INTO V_FIRST_MON;
    
      QRY := 'SELECT ADD_MONTHS(TO_DATE(''' || V_LAST_MON ||
             ''', ''DD-MON-RRRR''), -1) FROM DUAL';
    
      EXECUTE IMMEDIATE QRY
        INTO V_SECOND_MON;
        
           select COUNT(T.EMPLOYEE_NUMBER) INTO V_PRO1 from HC_DSBD_EMPLOYEE_DTS_BTG_TGT t
 WHERE T.PERIOD_FREQUENCY = 'M-O-M'
  AND T.PERIOD =  V_MON1_ST_DATE ;
  
    select COUNT(T.EMPLOYEE_NUMBER) INTO V_PRO2 from HC_DSBD_EMPLOYEE_DTS_BTG_TGT t
 WHERE T.PERIOD_FREQUENCY = 'M-O-M'
  AND T.PERIOD = V_MON2_ST_DATE ;
  
    select COUNT(T.EMPLOYEE_NUMBER) INTO V_PRO3 from HC_DSBD_EMPLOYEE_DTS_BTG_TGT t
 WHERE T.PERIOD_FREQUENCY = 'M-O-M'
  AND T.PERIOD =  V_MON3_ST_DATE ;
  
  IF V_PRO1 = 0 THEN
    V_PR1_APP := '(P)';
    ELSE 
       V_PR1_APP := '(A)';
       END IF; 
       
        IF V_PRO2 = 0 THEN
    V_PR2_APP := '(P)'; 
    ELSE 
       V_PR2_APP := '(A)';
       END IF; 
       
        IF V_PRO3 = 0 THEN
    V_PR3_APP := '(P)'; 
    ELSE 
       V_PR3_APP := '(A)';
       END IF; 
      
 
    
      V_LAST_MON1 := TO_CHAR(V_LAST_MON, 'MON')||' Exit HC'||V_PR3_APP;
    
      V_SECOND_MON1 := TO_CHAR(V_SECOND_MON, 'MON')||' Exit HC'||V_PR2_APP;
      V_FIRST_MON1  := TO_CHAR(V_FIRST_MON, 'MON')||' Exit HC'||V_PR1_APP;                                        
  
    V_MON1 := TO_CHAR(FN_FETCH_FIRST_MONTH(V_CURR_QTR), 'DD-MON-RRRR');
    V_MON3 := TO_CHAR(FN_FETCH_LAST_MONTH(V_CURR_QTR), 'DD-MON-RRRR');
  
    DELETE FROM BTG_WKLY_REP_UPLOAD_ERROR T
     WHERE REPLACE(REPLACE(LOWER(T.SHEET_NAME), ' ', ''), '&', '') =
           REPLACE(REPLACE(LOWER(I_SHEET_NAME), ' ', ''), '&', '')
       AND T.IOU_ID = I_ISU_ID
       AND T.SUB_IOU_ID = I_CLUS_ID
       AND T.ACCOUNT_ID = I_ACC_ID /*AND T.DATESTAMP= TRIM(SYSDATE)*/
    ;
  
    COMMIT;
  
    /*SELECT I.ISU_NAME INTO V_ISU FROM isu_mstr_new I WHERE I.ISU_ID = I_ISU
    AND I.BU# = I_BU;*/
  
    IF REPLACE(REPLACE(LOWER(I_SHEET_NAME), ' ', ''), '&', '') = 'pl' THEN
      V_COLUMN := '';
    
    /*  SELECT COUNT(*)
        INTO V_PL_CNT
        FROM BTG_WKLY_PL_STG S
       WHERE UPPER(S.PERIOD) LIKE '%OUTLOOK%'
         AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID
         AND (S.SERVICES_REV = 0 OR
          S.BOC_REV = 0 OR
           S.SUB_CON_REV = 0 OR
           
              --S.TCS_LICENSE_REV = 0 OR
               S.TOTAL_REV = 0 OR S.INCR_HC = 0 OR
              S.CM_MARGIN = 0 OR S.BOC_COST_BMN_USD = 0 OR
              S.TCV_BMN_USD = 0);
    
      IF V_PL_CNT <> 0 THEN
      
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          SELECT UPPER(I_SHEET_NAME),
                 'P&L should not be empty',
                 TRIM(SYSDATE),
                 I_ISU_ID,
                 I_CLUS_ID,
                 I_ACC_ID
            FROM DUAL;
        commit;
      
      END IF;*/
      
     /* select count(*) into v_pl_rem_cnt
      from BTG_WKLY_PL_STG s
      where length(s.remarks) > 200
       AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID ;*/
         /*  select count(*) into v_pl_rem_cnt
      from BTG_WKLY_PL_STG s
      where (regexp_count(regexp_replace(s.remarks,'(*[[:punct:]])',''),' ')+1) > 200
       AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID ;*/
         
         OPEN V_CUR_1 FOR 
SELECT 
replace(regexp_replace(S.remarks,'(*[[:punct:]])',' '),' ','##') FROM BTG_WKLY_PL_STG S 
where  S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID
         AND ROWNUM = 1;
         
        LOOP FETCH 
          V_CUR_1 INTO 
          V_STR; 
          
          EXIT WHEN V_CUR_1% NOTFOUND;
          
      SELECT COUNT(*) INTO v_pl_rem_cnt FROM  (SELECT REGEXP_SUBSTR(V_STR, '[^##]+', 1, LEVEL)
              FROM DUAL
                    CONNECT BY LEVEL <= REGEXP_COUNT(V_STR, '[^##]+', 1));
                    
              
         IF v_pl_rem_cnt > 200 THEN
      
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          SELECT UPPER(I_SHEET_NAME),
                 'Remarks should not exceed  more than 200 Words',
                 TRIM(SYSDATE),
                 I_ISU_ID,
                 I_CLUS_ID,
                 I_ACC_ID
            FROM DUAL;
        commit;
      
      END IF;         
                    
                    
      
      END LOOP;
      CLOSE V_CUR_1;
      
         
         
         
         
    
      SELECT /*IS_NUMBER(services_rev) services_rev,
             IS_NUMBER(boc_rev) boc_rev,
             IS_NUMBER(sub_con_rev) sub_con_rev,
             IS_NUMBER(tcs_license_rev) tcs_license_rev,
             IS_NUMBER(total_rev) total_rev,*/
             IS_NUMBER(incr_hc) incr_hc,
             IS_NUMBER(cm_margin) cm_margin,
             IS_NUMBER(boc_cost_bmn_usd) boc_cost_bmn_usd,
             IS_NUMBER(tcv_bmn_usd) tcv_bmn_usd
        INTO /*V_SER_REV,
             V_BOC_REV,
             V_SUB_CON_REV,
             V_LIC_REV,
             V_TOTAL_REV,*/
             V_INCR_HC,
             V_CM,
             V_BOC_COST,
             V_TCV
        FROM (SELECT ROWNUM RN, S.*
                FROM BTG_WKLY_PL_STG S
               WHERE S.IOU_ID = I_ISU_ID
                 AND S.SUB_IOU_ID = I_CLUS_ID
                 AND S.ACCOUNT_ID = I_ACC_ID)
       WHERE RN = 4;
    /*  IF V_SER_REV <> 'Y' THEN
      
        V_COLUMN := V_COLUMN || 'Services column contains alphabet';
      
      ELSE
        V_COLUMN := V_COLUMN || '';
      
      END IF;
    
      IF V_BOC_REV <> 'Y' THEN
      
        V_COLUMN := V_COLUMN || ' BOC(Revenue) column contains alphabet';
      ELSE
        V_COLUMN := V_COLUMN || '';
      
      END IF;
    
      IF V_SUB_CON_REV <> 'Y' THEN
      
        V_COLUMN := V_COLUMN ||
                    ' Sub Con(Revenue) column contains alphabet';
      
      ELSE
        V_COLUMN := V_COLUMN || '';
      
      END IF;
    
      IF V_LIC_REV <> 'Y' THEN
      
        V_COLUMN := V_COLUMN ||
                    ' TCS License(with no Cost) column contains alphabet';
      
      ELSE
        V_COLUMN := V_COLUMN || '';
      
      END IF;
    
      IF V_TOTAL_REV <> 'Y' THEN
      
        V_COLUMN := V_COLUMN || ' Total(Revenue) column contains alphabet';
      
      ELSE
        V_COLUMN := V_COLUMN || '';
      
      END IF;
*/    
      IF V_INCR_HC <> 'Y' THEN
      
        V_COLUMN := V_COLUMN || ' Increment HC column contains alphabet';
      
      ELSE
        V_COLUMN := V_COLUMN || '';
      
      END IF;
    
      IF V_CM <> 'Y' THEN
      
        V_COLUMN := V_COLUMN || ' Cross Margin column contains alphabet';
      
      ELSE
        V_COLUMN := V_COLUMN || '';
      
      END IF;
    
      IF V_BOC_COST <> 'Y' THEN
      
        V_COLUMN := V_COLUMN || ' BOC Cost column contains alphabet';
      
      ELSE
        V_COLUMN := V_COLUMN || '';
      
      END IF;
    
      IF V_TCV <> 'Y' THEN
      
        V_COLUMN := V_COLUMN || ' TCV column contains alphabet';
      
      ELSE
        V_COLUMN := V_COLUMN || '';
      
      END IF;
    
      IF V_COLUMN IS NOT NULL THEN
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          SELECT UPPER(I_SHEET_NAME),
                 
                 V_COLUMN,
                 TRIM(SYSDATE),
                 I_ISU_ID,
                 I_CLUS_ID,
                 I_ACC_ID
            FROM DUAL;
        commit;
      
      END IF;
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') LIKE 'EXECUTIVE%' THEN
      
     /* select count(*) into v_exe_rem_cnt
      from BTG_EXECUTIVE_SUMMARY_STG s
      where length(s.summary) > 200
       AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID ;
         */
         
           /*select count(*) into v_exe_rem_cnt
      from BTG_EXECUTIVE_SUMMARY_STG s
      where (regexp_count(regexp_replace(s.summary,'(*[[:punct:]])',''),' ')+1) > 200
       AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID ;
         IF v_exe_rem_cnt <> 0 THEN*/
           
           OPEN V_CUR_1 FOR 
SELECT 
replace(regexp_replace(S.summary,'(*[[:punct:]])',' '),' ','##') FROM BTG_EXECUTIVE_SUMMARY_STG S 
where  S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID;
         
        LOOP FETCH 
          V_CUR_1 INTO 
          V_STR; 
          
          EXIT WHEN V_CUR_1% NOTFOUND;
          
      SELECT COUNT(*) INTO v_exe_rem_cnt FROM  (SELECT REGEXP_SUBSTR(V_STR, '[^##]+', 1, LEVEL)
              FROM DUAL
                    CONNECT BY LEVEL <= REGEXP_COUNT(V_STR, '[^##]+', 1));
                    
              
         IF v_exe_rem_cnt > 600 THEN
       INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          SELECT UPPER(I_SHEET_NAME),
                 'Key Message, Issues or Concerns and its impact  should not exceed  more than 400 words',
                 TRIM(SYSDATE),
                 I_ISU_ID,
                 I_CLUS_ID,
                 I_ACC_ID
            FROM DUAL;
        commit;
      
      END IF;       
                    
                    
      
      END LOOP;
      CLOSE V_CUR_1;
      
       
    
      SELECT COUNT(*)
        INTO V_EXE_CNT
        FROM BTG_EXECUTIVE_SUMMARY_STG S
       where s.summary is NOT  null
         --AND S.ACCNT IS NOT NULL
         AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID;
     /* SELECT COUNT(*)
        INTO V_EXE_CNT1
        FROM BTG_EXECUTIVE_SUMMARY_STG S
       where s.accnt is NOT null
         AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID;*/
    
      IF V_EXE_CNT = 0 THEN
      
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          SELECT UPPER(I_SHEET_NAME),
                 'Executive Summary should not be empty',
                 TRIM(SYSDATE),
                 I_ISU_ID,
                 I_CLUS_ID,
                 I_ACC_ID
            FROM DUAL;
        commit;
      
      END IF;
    
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') LIKE 'HC%' THEN
    
    
     /*V_LAST_MON1 := TO_CHAR(V_LAST_MON, 'MON')||' Exit HC'||V_PR3_APP;
    
      V_SECOND_MON1 := TO_CHAR(V_SECOND_MON, 'MON')||' Exit HC'||V_PR2_APP;
      V_FIRST_MON1  := TO_CHAR(V_FIRST_MON, 'MON')||' Exit HC'||V_PR1_APP;
    
    
      SELECT COUNT(*)
        INTO V_HC_ERR_COUNT
        FROM WKLY_HC_BTG_STG S 
       WHERE LOGIN_ID = I_LOGGED_EMP_ID
       AND S.IOU_ID = I_ISU_ID
       AND S.SUB_IOU_ID = I_CLUS_ID
       AND S.ACCOUNT_ID = I_ACC_ID
         AND (group_customer IS NULL
             
             OR wfp_net_on IS NULL OR wfp_net_off IS NULL OR
             wfp_net_tot IS NULL OR net_won_gr_off IS NULL OR
             net_won_gr_onn IS NULL OR pa_off IS NULL OR pa_onn IS NULL OR
             net_won_growth_off IS NULL OR
             net_won_growth_onn IS NULL OR net_won_growth_tot IS NULL OR
             mon1_exit IS NULL OR mon2_exit IS NULL OR mon3_exit IS NULL OR
             emp IS NULL OR tr IS NULL OR ep IS NULL OR ba IS NULL OR
             intern IS NULL);
    
      IF V_HC_ERR_COUNT > 0 THEN
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          ('HC',
           'WFP Net Demand/Net Won Growth (Sys)/Pending Allocation/
           Net Won Growth (Sys+Proj)/'||V_FIRST_MON1||'/'||V_SECOND_MON1||'/'||V_LAST_MON1||' /Emp/Tr/EP/BA/Intern Should not be empty',
           SYSDATE,
           I_ISU_ID,
          I_CLUS_ID,
           I_ACC_ID);
        COMMIT;
      END IF;*/
      
       V_PERIOD := TO_DATE(I_DATE, 'DD-MM-RRRR');

  

  --V_CUR_MON := TO_CHAR(V_PERIOD, 'MM');

  V_CUR_QTR := FN_FETCH_QTR(IN_DATE => V_PERIOD);
 -- SELECT INITCAP(SUBSTR(V_PERIOD, 4, 3)) INTO V_CURR_MONTH FROM DUAL;

  V_MON1 := INITCAP(SUBSTR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 4, 3));
  V_MON2 := INITCAP(SUBSTR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 4, 3));
  V_MON3 := INITCAP(SUBSTR(FN_FETCH_LAST_MONTH(V_CUR_QTR), 4, 3));

      
      SELECT COUNT(1) INTO V_HC_1 FROM BTG_WSR_HC_STG T WHERE  T.ACCOUNT_ID=I_ACC_ID
      AND T.MON1_INC IS NULL AND T.ON_OFF IS NOT NULL AND T.ON_OFF NOT LIKE '%Total%';
      
      SELECT COUNT(1) INTO V_HC_2 FROM BTG_WSR_HC_STG T WHERE  T.ACCOUNT_ID=I_ACC_ID
      AND T.MON2_INC IS NULL AND T.ON_OFF IS NOT NULL AND T.ON_OFF NOT LIKE '%Total%';
      
      SELECT COUNT(1) INTO V_HC_3 FROM BTG_WSR_HC_STG T WHERE  T.ACCOUNT_ID=I_ACC_ID

      AND T.MON3_INC IS NULL AND T.ON_OFF IS NOT NULL AND T.ON_OFF NOT LIKE '%Total%';
      
      
         
                  
      
      IF V_HC_1 >= 9 AND  V_HC_2 >= 9 AND V_HC_3 >=9 THEN
        
      V_ERR := V_MON1||V_MON2||V_MON3 ||' Incremental HC should be filled';
      ELSIF 
         V_HC_1 >= 9 AND V_HC_2 >= 9  THEN 
          V_ERR := V_MON1||','||V_MON2||' Incremental HC should be filled';
        ELSIF  V_HC_1 >= 9 AND V_HC_3 >= 9  THEN 
          V_ERR := V_MON1||','||V_MON3||' Incremental HC should be filled';
          ELSIF V_HC_2 >= 9 AND V_HC_3 >= 9  THEN 
          V_ERR :=  V_MON2||','||V_MON3||' Incremental HC should be filled';
          
           ELSIF V_HC_2 >= 9  THEN 
          V_ERR := V_MON2||' Incremental HC should be filled';
           ELSIF  V_HC_3 >= 9  THEN 
          V_ERR := V_MON3||' Incremental HC should be filled';
          ELSIF  V_HC_1 >= 9  THEN 
          V_ERR := V_MON1||' Incremental HC should be filled';
          END IF;
          
              IF V_HC_1 >= 9 OR  V_HC_2 >= 9 OR V_HC_3 >=9 THEN
  
          
          
       
      /*SELECT COUNT(1) INTO V_COUNT FROM BTG_WSR_HC_STG T WHERE  T.ACCOUNT_ID=I_ACC_ID
      AND T.ON_OFF IS NULL AND T.PERSON_TYPE IS NULL AND (T.MON1_INC = 0 OR T.MON2_INC = 0 OR T.MON3_INC = 0);
      
      IF V_COUNT <> 0 THEN */
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          ('HC',
          V_ERR,
           --'Incremental HC should be filled',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
      
        COMMIT;
      END IF;
      
      
      ELSIF UPPER(I_SHEET_NAME) LIKE '%ITG%' THEN
        
      select count(1)  into v_count from WKLY_ITG_SALES_STG t
      where (t.emp_id is not null) and (t.emp_name is  null or t.sales_itg is  null or 
      t.itg_role is null or t.active_role is  null) and 
       T.IOU_ID=I_ISU_ID
         AND T.SUB_IOU_ID = I_CLUS_ID
          AND T.ACCOUNT_ID = I_ACC_ID ;
          
          
       IF V_COUNT > 0 THEN
        ----ERROR
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          ('ITGor Sales',
           'All fields need to be filled',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
      
        COMMIT;
      END IF;   
          
    
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') LIKE 'PIPELINE%' THEN
    
      SELECT COUNT(1)
        INTO V_COUNT
        FROM WKLY_BTG_PIPELINE_STG T
       WHERE (T.STATUS_UPDATE = '-' OR  T.STATUS_UPDATE  IS NULL)
        AND T.IOU_ID=I_ISU_ID
         AND T.SUB_IOU_ID = I_CLUS_ID
          AND T.ACCOUNT_ID = I_ACC_ID 
          AND T.LOGIN_ID=I_LOGGED_EMP_ID
          AND T.CRM_ID NOT IN ('-');
      IF V_COUNT > 0 THEN
        ----ERROR
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          ('Pipeline',
           'Status update should not be empty for all records',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
      
        COMMIT;
      END IF;
      
     /* select count(*) into v_pip_rem_cnt
      from WKLY_BTG_PIPELINE_STG s
      where length(s.opp_description) > 150
       AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID ;
         
         IF v_pip_rem_cnt <> 0 THEN
      
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          SELECT UPPER(I_SHEET_NAME),
                 'Opportunity Description  should not exceed  more than 150 characters',
                 TRIM(SYSDATE),
                 I_ISU_ID,
                 I_CLUS_ID,
                 I_ACC_ID
            FROM DUAL;
        commit;
      
      END IF;*/
       --checking whether any crm id is null or not    
     SELECT COUNT(*) INTO V_CNT_NULL FROM WKLY_BTG_PIPELINE_STG  T
      WHERE T.CRM_ID IS NULL  AND  
      
       -- FROM WKLY_LOSSES_STG T
          T.SUB_IOU_ID = TRIM(I_CLUS_ID)
           AND T.ACCOUNT_ID = TRIM(I_ACC_ID)
           AND T.IOU_ID = TRIM(I_ISU_ID);
           
           IF V_CNT_NULL <> 0
             THEN
               
               INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          (I_SHEET_NAME,
           'CRM ID should not be empty',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
           COMMIT;
           
           end if;  
      
      
      
      
      
    
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'CLOSED' THEN
    
      UPDATE WKLY_LOSSES_TGT G 
      SET  G.CLOSURE_MONTH = ''
      WHERE G.CLOSURE_MONTH = '-';
      COMMIT;
      
    /* select count(*) into v_loss_rem_cnt
      from wkly_losses_stg s
      where length(s.reason_for_loss_win) > 150
       AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID ;*/
         
         /*  select count(*) into v_loss_rem_cnt
      from wkly_losses_stg s
      where (regexp_count(regexp_replace(s.reason_for_loss_win,'(*[[:punct:]])',''),' ')+1) > 150
       AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID ;*/
         
          OPEN V_CUR_1 FOR 
SELECT 
replace(regexp_replace(S.reason_for_loss_win,'(*[[:punct:]])',' '),' ','##') FROM wkly_losses_stg S 
where  S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID;
         
        LOOP FETCH 
          V_CUR_1 INTO 
          V_STR; 
          
          EXIT WHEN V_CUR_1% NOTFOUND;
          
      SELECT COUNT(*) INTO v_loss_rem_cnt FROM  (SELECT REGEXP_SUBSTR(V_STR, '[^##]+', 1, LEVEL)
              FROM DUAL
                    CONNECT BY LEVEL <= REGEXP_COUNT(V_STR, '[^##]+', 1));
                    
                      
         IF v_loss_rem_cnt > 150 THEN
      
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          SELECT UPPER(I_SHEET_NAME),
                 'Reason for Loss and Winning Competition  should not exceed  more than 150 Words',
                 TRIM(SYSDATE),
                 I_ISU_ID,
                 I_CLUS_ID,
                 I_ACC_ID
            FROM DUAL;
        commit;
      
      END IF;
                    
              
        
                    
                    
      
      END LOOP;
      CLOSE V_CUR_1;
      
       
    
    
    
      select count(*)
        into v_count
        from wkly_losses_stg t
       WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
         and t.account_id = TRIM(I_ACC_ID)
         and t.iou_id = TRIM(I_ISU_ID)
         AND (T.OPP_ID <> '-' AND (t.reason_for_loss_win = '-' OR T.REASON_FOR_LOSS_WIN IS NULL));
    
      OPEN CUR_DATA FOR
      
        select SUBSTR(t.sales_stage,1,2)
          from wkly_losses_stg t
         WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
           and t.account_id = TRIM(I_ACC_ID)
           and t.iou_id = TRIM(I_ISU_ID)
           AND T.SALES_STAGE <> '-';
    
      LOOP
        FETCH CUR_DATA
          INTO V_SALES;
        EXIT WHEN CUR_DATA% NOTFOUND;
      
        IF V_SALES NOT in ('10', '11', '12', '13') THEN
          ----ERROR
          INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          VALUES
            (I_SHEET_NAME,
             'sales stage should be in (10,11,12,13)',
             SYsdate,
             I_ISU_ID,
             I_CLUS_ID,
             I_ACC_ID);
          COMMIT;
        
        END IF;
      
      END LOOP;
      CLOSE CUR_DATA;
    
      OPEN CUR_DATA FOR
        selecT T.CLOSURE_MONTH
          from wkly_losses_stg t
         WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
           and t.account_id = TRIM(I_ACC_ID)
           and t.iou_id = TRIM(I_ISU_ID);
    
      LOOP
        FETCH CUR_DATA
          INTO V_CLOSE_DATE_CHECK;
           EXIT WHEN CUR_DATA% NOTFOUND;
      
     SELECT TO_DATE(DECODE(V_CLOSE_DATE_CHECK,'-','',V_CLOSE_DATE_CHECK), 'DD/MM/YYYY')
     INTO V_CLOSE_DATE_CHECK1
     FROM DUAL;
        IF (V_CLOSE_DATE_CHECK1 NOT BETWEEN V_FROM_DATE AND V_TO_DATE)
        AND (V_CLOSE_DATE_CHECK1 IS NOT NULL ) THEN
          INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          VALUES
            (I_SHEET_NAME,
             'check the closure dates ',
             SYsdate,
             I_ISU_ID,
             I_CLUS_ID,
             I_ACC_ID);
          COMMIT;
        
        END IF;
      
       
      
      END LOOP;
    
      IF V_COUNT > 0 THEN
        ----ERROR
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          (I_SHEET_NAME,
           'Null Value is not allowed for ''Reason for Loss and Winning Competition'' ',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
           COMMIT;
      
      END IF;
    --error checking for wheather any  crm id is null or not  
      SELECT COUNT(*) INTO V_CNT_NULL FROM WKLY_LOSSES_STG  T
      WHERE T.OPP_ID IS NULL  AND  
      
       -- FROM WKLY_LOSSES_STG T
          T.SUB_IOU_ID = TRIM(I_CLUS_ID)
           AND T.ACCOUNT_ID = TRIM(I_ACC_ID)
           AND T.IOU_ID = TRIM(I_ISU_ID);
           
           IF V_CNT_NULL <> 0
             THEN
               
               INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          (I_SHEET_NAME,
           'CRM ID should not be empty',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
           COMMIT;
           
           end if;
               
           
      
      
      
    
    ELSIF REPLACE(UPPER(I_SHEET_NAME),' ','') LIKE 'C-CONNECTSORCUSTOMERVISIT' THEN 
      
    
     
      
    
      select count(*)
        into v_count
        from wkly_customer_visit_stg t
       WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
         and t.account_id = TRIM(I_ACC_ID)
         and t.iou_id = TRIM(I_ISU_ID)
         AND (t.CUST_NAME is null or t.CATEGORY is null or
             t.TCS_PARTCIPANTS_NAME is null 
             
             );
             
             
         select count(*)
        into v_count1
        from wkly_customer_visit_stg t
       WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
         and t.account_id = TRIM(I_ACC_ID)
         and t.iou_id = TRIM(I_ISU_ID)
         AND t.category not in ('CEO/Board member visits',    
      'CIO Visits',     
       'CXO Visits',     
       'CXO Direct Report Visits',     
       'CEO/Board Members Connect',     
        'CIO Connect',
       'CXO Connect',     
       'CXO Direct Report Connect');
     
     IF V_COUNT1 > 0 THEN
        ----ERROR
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          (I_SHEET_NAME,
           'Please select given category in c-connects sheet',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
           COMMIT;
      
      END IF;
      
    
    
    
      IF V_COUNT > 0 THEN
        ----ERROR
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          (I_SHEET_NAME,
           'Customer Name/CATEGORY/TCS_PARTCIPANTS_NAME should not be empty',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
           COMMIT;
      
      END IF;
      
      V_PERIOD := TO_DATE(I_DATE, 'DD/MM/RRRR');
   ---error for visit or connect 
   
    open v_cur_2 for 
   select distinct  CATEGORY  from wkly_customer_visit_stg t
         WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
           and t.account_id = TRIM(I_ACC_ID)
           and t.iou_id = TRIM(I_ISU_ID)
           and TO_DATE(t.FILE_DATE , 'DD/MM/RRRR') = V_PERIOD ;   
           
 LOOP FETCH 
          V_CUR_2 INTO 
          V_CAT_CHK; 
          
          EXIT WHEN V_CUR_2% NOTFOUND;    
           
           
      
   if upper(V_CAT_CHK) like '%VISITS%' THEN 
      select count(*)
        into v_count_5
        from wkly_customer_visit_stg t
      WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
           and t.account_id = TRIM(I_ACC_ID)
           and t.iou_id = TRIM(I_ISU_ID)
           and TO_DATE(t.FILE_DATE , 'DD/MM/RRRR') = TO_DATE( V_PERIOD, 'DD/MM/RRRR') 
         AND (t.VISIT_START_DATE is null or t.VISIT_END_DATE is null or
             t.VISIT_LOCATION is null 
             
             
             ) AND UPPER(T.CATEGORY) = UPPER(V_CAT_CHK);
   
    IF v_count_5 > 0 THEN
        ----ERROR
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          (I_SHEET_NAME,
           'VISIT_START_DATE /VISIT_END_DATE/VISIT_LOCATION should not be empty',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
           COMMIT;
           end if;
           
           ELSIF upper(V_CAT_CHK) like '%CONNECT%' THEN 
      select count(*)
        into v_count_6
        from wkly_customer_visit_stg t
      WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
           and t.account_id = TRIM(I_ACC_ID)
           and t.iou_id = TRIM(I_ISU_ID)
           and TO_DATE(t.FILE_DATE , 'DD/MM/RRRR') = TO_DATE( V_PERIOD, 'DD/MM/RRRR') 
         AND (t.MEETING_DATE is null 
             
             )  AND UPPER(T.CATEGORY) = UPPER(V_CAT_CHK);
   
    IF v_count_6 > 0 THEN
        ----ERROR
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          (I_SHEET_NAME,
           'MEETING_DATE should not be empty',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
           COMMIT;
           end if;
           end if;  
           
           
           
            END LOOP;


      CLOSE V_CUR_2;   
           
           
      
      
      
    /*  V_PERIOD := TO_DATE(I_DATE, 'DD/MM/RRRR');
      
      OPEN CUR_DATA FOR
        selecT T.MEETING_DATE
          from wkly_customer_visit_stg t
         WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
           and t.account_id = TRIM(I_ACC_ID)
           and t.iou_id = TRIM(I_ISU_ID);
      LOOP
        FETCH CUR_DATA
          INTO V_MEETING_DATE_CHECK;
            EXIT WHEN CUR_DATA% NOTFOUND;
         
       --- V_MEETING_DATE_CHECK := TO_DATE(V_MEETING_DATE_CHECK, 'DD/MM/YYYY');
        IF V_MEETING_DATE_CHECK < V_PERIOD THEN
          INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          VALUES
            (I_SHEET_NAME,
             'Meeting date should be in future date',
             SYsdate,
             I_ISU_ID,
             I_CLUS_ID,
             I_ACC_ID);
          COMMIT;
        END IF;
        
       
      END LOOP;*/
    
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'TCVOUTLOOK' THEN
    
      select count(1)
        into v_count
        from wkly_tcv_outlook_stg
       where fy_projection = '0.0'
         and iou_id = i_iSU_id
         and sub_iou_id = i_clus_id
         and account_id = i_acc_id;
    
      if v_count > 0 then
        insert into btg_wkly_rep_upload_error
        values
          ('TCVOutlook',
           'FY23 Projection Should not be 0.0',
           sysdate,
           i_isu_id,
           i_clus_id,
           i_acc_id);
      
        commit;
      end if;
    
    ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'WINS' THEN
    
    
     UPDATE wkly_wins_stg G 
      SET  G.CLOSURE_MONTH = ''
      WHERE G.CLOSURE_MONTH = '-';
      COMMIT;
      
      
    
     /*select count(*) into v_wins_rem_cnt
      from wkly_wins_stg s
      where length(s.reason_for_loss_win) > 150
       AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID ;*/
         
           
          /* select count(*) into v_wins_rem_cnt
      from wkly_wins_stg s
      where (regexp_count(regexp_replace(s.reason_for_loss_win,'(*[[:punct:]])',''),' ')+1)> 150
       AND S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID ;*/
         
           OPEN V_CUR_1 FOR 
SELECT 
replace(regexp_replace(S.reason_for_loss_win,'(*[[:punct:]])',' '),' ','##') FROM wkly_wins_stg S 
where  S.IOU_ID = I_ISU_ID
         AND S.SUB_IOU_ID = I_CLUS_ID
         AND S.ACCOUNT_ID = I_ACC_ID;
         
        LOOP FETCH 
          V_CUR_1 INTO 
          V_STR; 
          
          EXIT WHEN V_CUR_1% NOTFOUND;
          
      SELECT COUNT(*) INTO v_wins_rem_cnt FROM  (SELECT REGEXP_SUBSTR(V_STR, '[^##]+', 1, LEVEL)
              FROM DUAL
                    CONNECT BY LEVEL <= REGEXP_COUNT(V_STR, '[^##]+', 1));
                    
         IF v_wins_rem_cnt > 150 THEN
      
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          SELECT UPPER(I_SHEET_NAME),
                 'One Liner Reason for Win should not exceed  more than 150 Words',
                 TRIM(SYSDATE),
                 I_ISU_ID,
                 I_CLUS_ID,
                 I_ACC_ID
            FROM DUAL;
        commit;
      
      END IF;
      
                    
              
        
                    
                    
      
      END LOOP;
      CLOSE V_CUR_1;
         
        
    
    
      select count(*)
        into v_count
        from wkly_wins_stg t
       WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
         and t.account_id = TRIM(I_ACC_ID)
         and t.iou_id = TRIM(I_ISU_ID)
         AND (T.OPP_ID <> '-' AND (t.reason_for_loss_win is null or t.reason_for_loss_win = '-'));
    
      OPEN CUR_DATA FOR
        selecT T.CLOSURE_MONTH
          from wkly_wins_stg t
         WHERE t.sub_iou_id = TRIM(I_CLUS_ID)
           and t.account_id = TRIM(I_ACC_ID)
           and t.iou_id = TRIM(I_ISU_ID);
    
      LOOP
        FETCH CUR_DATA
          INTO V_CLOSE_DATE_CHECK;
            EXIT WHEN CUR_DATA% NOTFOUND;
      
        V_CLOSE_DATE_CHECK1 := TO_DATE(V_CLOSE_DATE_CHECK, 'DD/MM/YYYY');
        IF (V_CLOSE_DATE_CHECK1 NOT BETWEEN V_FROM_DATE AND V_TO_DATE)
        AND (V_CLOSE_DATE_CHECK1 IS NOT NULL) THEN
          INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
          VALUES
            (I_SHEET_NAME,
             'check the closure dates ',
             SYsdate,
             I_ISU_ID,
             I_CLUS_ID,
             I_ACC_ID);
          COMMIT;
        
        END IF;
      
      
      
      END LOOP;
    
      IF V_COUNT > 0 THEN
        ----ERROR
        INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          (I_SHEET_NAME,
           'Null Value is not allowed for ''One Liner Reason for Win'' Column',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
           COMMIT;
      
      END IF;
   --CHECKING WHETHER ANY CRM ID IS NULL OR NOT    
     SELECT COUNT(*) INTO V_CNT_NULL FROM WKLY_WINS_STG  T
      WHERE T.OPP_ID IS NULL  AND  
      
       -- FROM WKLY_LOSSES_STG T
          T.SUB_IOU_ID = TRIM(I_CLUS_ID)
           AND T.ACCOUNT_ID = TRIM(I_ACC_ID)
           AND T.IOU_ID = TRIM(I_ISU_ID);
           
           IF V_CNT_NULL <>0
             THEN
               
               INSERT INTO BTG_WKLY_REP_UPLOAD_ERROR
        VALUES
          (I_SHEET_NAME,
           'CRM ID should not be empty',
           SYsdate,
           I_ISU_ID,
           I_CLUS_ID,
           I_ACC_ID);
           COMMIT;
           
           end if;  
      
      
    
    END IF;
  
    SELECT COUNT(1)
      INTO V_CNT
      FROM BTG_WKLY_REP_UPLOAD_ERROR T
     WHERE TRUNC(T.DATESTAMP) = TRIM(TRUNC(SYSDATE))
       AND T.IOU_ID = I_ISU_ID
       AND T.SUB_IOU_ID = I_CLUS_ID
       AND T.ACCOUNT_ID = I_ACC_ID
       AND REPLACE(REPLACE(LOWER(T.SHEET_NAME), ' ', ''), '&', '') =
           REPLACE(REPLACE(LOWER(I_SHEET_NAME), ' ', ''), '&', '');
  
    IF V_CNT = 0 THEN
      O_MSG := 'N';
      OPEN O_ERROR_CUR FOR 
       
      SELECT 'X' FROM DUAL;
    ELSE
    
      O_MSG := 'Y';
    
      OPEN O_ERROR_CUR FOR
      
        SELECT DISTINCT T.SHEET_NAME || ' - ' || T.ERROR_DESCR
          FROM BTG_WKLY_REP_UPLOAD_ERROR T
         WHERE TRUNC(T.DATESTAMP) = TRIM(TRUNC(SYSDATE))
           AND REPLACE(REPLACE(LOWER(T.SHEET_NAME), ' ', ''), '&', '') =
               REPLACE(REPLACE(LOWER(I_SHEET_NAME), ' ', ''), '&', '')
           AND T.IOU_ID = I_ISU_ID
           AND T.SUB_IOU_ID = I_CLUS_ID
           AND T.ACCOUNT_ID = I_ACC_ID;
    
    END IF;
  
  end SP_WEEKLY_UPLOAD_ERR_CHK;

  
  PROCEDURE SP_WEEKLY_STG_TO_TGT(I_LOGGED_EMP_ID IN NUMBER,
                                 I_COORPORATE    IN VARCHAR2,
                                 I_BU            IN VARCHAR2,
                                 I_ISU_ID        IN NUMBER,
                                 I_CLUS_ID       IN NUMBER,
                                 I_ACC_ID        IN NUMBER,
                                 I_SHEET_NAME    IN VARCHAR2,
                                 I_DATE          IN VARCHAR2,
                                 I_SUBMIT_FLAG   IN VARCHAR2,
                                 O_MSG           OUT VARCHAR2,
                                 O_USER_DATA     OUT SYS_REFCURSOR) IS
    V_KEYDATE      DATE;
    V_CNT1 NUMBER;
    V_ERROR NUMBER;
    V_MISMATCH_CNT NUMBER;
    V_CURR_WEEK    DATE;
    V_CURR_QTR     VARCHAR2(1000);
    V_CURR_QTR1    VARCHAR2(1000);
    V_CURR_MONTH   DATE;
    V_FRZ          VARCHAR2(1000);
    V_CUR_MONTH    VARCHAR2(4000);
    V_VAR          VARCHAR2(100);
    V_CNT          NUMBER;
    V_CNT_NAME     NUMBER;
    QRY            LONG;
    V_HC_ACC       VARCHAR2(4000);
    V_DATE         DATE;
    V_PLAN         VARCHAR2(500);
    V_MON1         VARCHAR2(4000);
    V_MON2         VARCHAR2(4000);
    V_MON3         VARCHAR2(4000);
    V_COL          VARCHAR2(4000);
    V_PLAN1        VARCHAR2(500);
    V_CORP_PLAN    VARCHAR2(500);
    V_AOP          VARCHAR2(500);
    V_ACTUAL       VARCHAR(500);
    v_tgt_table    VARCHAR2(1000);
    v_STG_table    VARCHAR2(1000);
    v_HIS_table    VARCHAR2(1000);
    V_PRV_QTR      VARCHAR2(500);
    V_PLAN_VAR     VARCHAR2(500);
    V_FROM_DATE    DATE;
    V_TO_DATE      DATE;
    V_CNT_KEY      NUMBER;
    V_WINS_TGT_CHCK    NUMBER;
    V_LOSS_TGT_CHCK  NUMBER;
    V_PIPE_TGT_CHCK NUMBER;
    V_CHK_SEN_1 NUMBER;
    V_CHK_SEN_2 NUMBER;
    V_CAT_CHK VARCHAR2(1000);
    V_CUR_QTR VARCHAR2(4000);
    
    V_CUR_1 sys_refcursor;
    
    V_MSG_1 VARCHAR2(300);
    v_cur_2 sys_refcursor;
    v_date_10 date;
    V_VAR_1 varchar2(100);
    V_CNT_6 number;
    V_CUR_3 SYS_REFCURSOR;
  BEGIN
  
    INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
    VALUES
      (I_LOGGED_EMP_ID,
       SYSDATE,
       'PKG_WSR_UPLOAD.SP_WEEKLY_STG_TO_TGT',
       I_LOGGED_EMP_ID || '-' || I_COORPORATE || '-' || I_BU || '-' ||
       I_ISU_ID || '-' || I_SHEET_NAME || '-' || I_DATE,
       '',
       I_ISU_ID,
       '');
  
    COMMIT;
     DELETE FROM MSG_EXEP T
     WHERE REPLACE(REPLACE(LOWER(T.SHEET_NAME), ' ', ''), '&', '') =
           REPLACE(REPLACE(LOWER(I_SHEET_NAME), ' ', ''), '&', '')
       AND T.I_ISU_ID = I_ISU_ID
       AND T.I_CLUS_ID = I_CLUS_ID
       AND T.I_ACCOUNT_ID = I_ACC_ID  /*AND T.DATESTAMP= TRIM(SYSDATE)*/
    ;
  
    COMMIT;
  
    PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(I_DATE, 'DD/MM/RRRR'),
                                             V_DATE,
                                             V_CURR_MONTH,
                                             V_CURR_QTR);
  
    PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TRIM(SYSDATE),
                                             V_CURR_WEEK,
                                             V_CURR_MONTH,
                                             V_CURR_QTR1);
  
    V_PRV_QTR := FN_FETCH_PRV_QTR(TRIM(SYSDATE));
  
    V_FROM_DATE := FN_FETCH_FIRST_QTR_DAY(V_CURR_QTR);
    V_TO_DATE   := FN_FETCH_LAST_DAY_QTR(V_CURR_QTR);
    
    SELECT INITCAP(SUBSTR(V_DATE, 4, 3)) INTO V_CUR_MONTH FROM DUAL;

  V_MON1 := INITCAP(SUBSTR(FN_FETCH_FIRST_MONTH(V_CURR_QTR), 4, 3));
  V_MON2 := INITCAP(SUBSTR(FN_FETCH_SECOND_MONTH(V_CURR_QTR), 4, 3));
  V_MON3 := INITCAP(SUBSTR(FN_FETCH_LAST_MONTH(V_CURR_QTR), 4, 3));
    
  
    V_MISMATCH_CNT := 0;
  
    QRY := 'SELECT SUBSTR(''' || V_CURR_QTR ||
           ''',1,2)||'' ''||Q''<''>''||SUBSTR(''' || V_CURR_QTR ||
           ''',-2,2)||'' Outlook'' FROM DUAL';
    EXECUTE IMMEDIATE QRY
      INTO V_PLAN;
  
    QRY := 'SELECT SUBSTR(''' || V_CURR_QTR ||
           ''',1,2)||'' ''||Q''<->''||SUBSTR(''' || V_CURR_QTR ||
           ''',-2,2)||'' Outlook'' FROM DUAL';
    EXECUTE IMMEDIATE QRY
      INTO V_PLAN1;
  
    SELECT REPLACE(V_PLAN, '''', '''') INTO V_PLAN_VAR FROM DUAL;
  
    QRY := 'SELECT SUBSTR(''' || V_CURR_QTR ||
           ''',1,2)||'' ''||Q''<->''||SUBSTR(''' || V_CURR_QTR ||
           ''',-2,2)||'' Corp Plan'' FROM DUAL';
    EXECUTE IMMEDIATE QRY
      INTO V_CORP_PLAN;
  
    QRY := 'SELECT SUBSTR(''' || V_CURR_QTR ||
           ''',1,2)||'' ''||Q''<->''||SUBSTR(''' || V_CURR_QTR ||
           ''',-2,2)||'' AOP/Target'' FROM DUAL';
    EXECUTE IMMEDIATE QRY
      INTO V_AOP;
  
    QRY := 'SELECT SUBSTR(''' || V_PRV_QTR ||
           ''',1,2)||'' ''||Q''<->''||SUBSTR(''' || V_PRV_QTR ||
           ''',-2,2)||'' Actual'' FROM DUAL';
    EXECUTE IMMEDIATE QRY
      INTO V_ACTUAL;
  
    SELECT REPLACE(V_ACTUAL, '-', '''') INTO V_ACTUAL FROM DUAL;
  
    BEGIN
    
      SELECT DISTINCT LISTAGG(T.FREEZE_FLAG, ',') WITHIN GROUP(ORDER BY NULL)
        INTO V_FRZ
        FROM WKLY_REP_FRZ_UNFRZ_BTG T
       WHERE T.FILE_DATE = V_CURR_WEEK ---USING SYSDATE TO CALCULATE SUNDAY--1597908
         AND T.ISU_ID = TRIM(I_ISU_ID)
         AND T.SUB_ISU_ID = TRIM(I_CLUS_ID)
         AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
    
      IF REPLACE(LOWER(I_SHEET_NAME), ' ', '') = 'executivesummary' THEN
      
       
        
          SELECT COUNT(1)
            INTO V_CNT
            FROM BTG_EXECUTIVE_SUMMARY_TGT T
           WHERE T.FILE_DATE = V_DATE
             AND T.IOU_ID = TRIM(I_ISU_ID)
             AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          IF V_CNT = 0 THEN
            --NO FILES UPLOADED FOR THAT ISU FOR CURRNT WEEK
          
            INSERT INTO BTG_EXECUTIVE_SUMMARY_TGT
              SELECT (select distinct t.short_name from new_btg_account_mapping t where t.account_id=I_ACC_ID)ACCNT,
                      SUMMARY,
                      '',
                     LOGIN_ID,                   
                     

                     V_DATE,
                     SYSDATE,
                     '',
                     ORDER_ID,
                     S.ACCOUNT_ID,
                     S.SUB_IOU_ID,
                     S.IOU_ID
                FROM BTG_EXECUTIVE_SUMMARY_STG S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = I_DATE
                 and s.summary is not null
                 and s.summary <> '-';
            COMMIT;
          
          
            SELECT COUNT(*) INTO V_ERROR 
                FROM BTG_EXECUTIVE_SUMMARY_TGT S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = V_DATE;
                 
                 
              IF V_ERROR =0 THEN 
              O_MSG:='Error';
              else              
                O_MSG := 'SUCCESS';            
             END IF;
             
              INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
          
          ELSE
            ------ALREADY FILE UPLOADED
            INSERT INTO BTG_EXECUTIVE_SUMMARY_TGT_HIS
              SELECT GROUP_CUSTOMER,
                     SUMMARY,
                     T.IOU_ID,
                     LOGIN_ID,
                     FILE_DATE,
                     UPLOADED_DATE,
                     SYSDATE,
                     I_CLUS_ID,
                     I_ACC_ID,'',''
                FROM BTG_EXECUTIVE_SUMMARY_TGT T
               WHERE T.FILE_DATE = V_DATE
                 AND T.IOU_ID = TRIM(I_ISU_ID)
                 AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
            COMMIT;
          
            DELETE FROM BTG_EXECUTIVE_SUMMARY_TGT T
             WHERE T.FILE_DATE = V_DATE
               AND T.IOU_ID = TRIM(I_ISU_ID)
               AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
            COMMIT;
            
           
          
           
            INSERT INTO BTG_EXECUTIVE_SUMMARY_TGT
              SELECT (select distinct t.short_name from new_btg_account_mapping t where t.account_id=I_ACC_ID)ACCNT,
                      SUMMARY,
                      '',
                     LOGIN_ID,                   
                     

                     V_DATE,
                     SYSDATE,
                     '',
                     ORDER_ID,
                     S.ACCOUNT_ID,
                     S.SUB_IOU_ID,
                     S.IOU_ID
                FROM BTG_EXECUTIVE_SUMMARY_STG S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = I_DATE
                 and s.summary is not null
                 and s.summary <> '-';
            COMMIT;
          
            
             SELECT COUNT(*) INTO V_ERROR 
                FROM BTG_EXECUTIVE_SUMMARY_TGT S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = V_DATE;
                 
                 
              IF V_ERROR =0 THEN 
              O_MSG:='Error';
              else              
                O_MSG := 'SUCCESS';            
             END IF;
           
            
            INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
          
          END IF;
        
          ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') LIKE '%ITG%' THEN 
      
       
        
          SELECT COUNT(1)
            INTO V_CNT
            FROM WKLY_ITG_SALES_TGT T
           WHERE T.FILE_DATE = V_DATE
             AND T.IOU_ID = TRIM(I_ISU_ID)
             AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          IF V_CNT = 0 THEN
            --NO FILES UPLOADED FOR THAT ISU FOR CURRNT WEEK
          
            INSERT INTO  WKLY_ITG_SALES_TGT
             SELECT  S.EMP_ID, 
S.EMP_NAME, 
S.SALES_ITG, 
S.ITG_ROLE, 
S.ACTIVE_ROLE, 
S.IOU_ID, 
S.SUB_IOU_ID, 
S.ACCOUNT_ID, 
sysdate, 
S.UPLOADED_BY, 
V_DATE

                FROM  WKLY_ITG_SALES_stg S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                -- AND to_date(S.FILE_DATE = I_DATE
             --   and  TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') = TO_DATE(I_DATE, 'DD/MM/RRRR')
                ;
            COMMIT;
          
          
            SELECT COUNT(*) INTO V_ERROR 
                FROM  WKLY_ITG_SALES_TGT S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                    and TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') = TO_DATE(V_DATE, 'DD/MM/RRRR');
               --  AND S.FILE_DATE = V_DATE;
                 
                 
              IF V_ERROR =1 THEN 
                        
                O_MSG := 'SUCCESS';            
             END IF;
             
              INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
          
          ELSE
            ------ALREADY FILE UPLOADED
           INSERT INTO  WKLY_ITG_SALES_TGT_HIS
             SELECT  S.EMP_ID, 
S.EMP_NAME, 
S.SALES_ITG, 
S.ITG_ROLE, 
S.ACTIVE_ROLE, 
S.IOU_ID, 
S.SUB_IOU_ID, 
S.ACCOUNT_ID, 
S.UPLOADED_DATE, 
S.UPLOADED_BY, 
sysdate

                FROM  WKLY_ITG_SALES_TGT S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
              --   AND S.FILE_DATE = V_DATE
              and    TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') = TO_DATE(V_DATE, 'DD/MM/RRRR')
                ;
            COMMIT;
          
            DELETE FROM WKLY_ITG_SALES_TGT T
             WHERE TO_DATE(t.FILE_DATE, 'DD/MM/RRRR') = TO_DATE(V_DATE, 'DD/MM/RRRR')
            -- T.FILE_DATE = V_DATE
               AND T.IOU_ID = TRIM(I_ISU_ID)
               AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
            COMMIT;
            
           
           INSERT INTO  WKLY_ITG_SALES_TGT
             SELECT  S.EMP_ID, 
S.EMP_NAME, 
S.SALES_ITG, 
S.ITG_ROLE, 
S.ACTIVE_ROLE, 
S.IOU_ID, 
S.SUB_IOU_ID, 
S.ACCOUNT_ID, 
SYSDATE, 
S.UPLOADED_BY, 
V_DATE

                FROM  WKLY_ITG_SALES_STG S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                  AND  TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') = TO_DATE(i_date, 'DD/MM/RRRR')
                -- AND S.FILE_DATE = I_DATE
                ;
            COMMIT;
          
           
          
            
             SELECT COUNT(*) INTO V_ERROR 
                FROM WKLY_ITG_SALES_TGT S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = V_DATE;
                 
                 
              IF V_ERROR <> 0
                THEN 
                     
                O_MSG := 'SUCCESS';            
             END IF;
           
            
            INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
          
          END IF;   
      
      ELSIF REPLACE(REPLACE(LOWER(I_SHEET_NAME), ' ', ''), '&', '') = 'pl' THEN
      
        QRY := ' SELECT COUNT(1)
            FROM BTG_WKLY_PL_TGT T
           WHERE T.FILE_DATE = ''' || V_DATE || '''
             AND T.IOU_ID = TRIM(' || I_ISU_ID || ')
             AND T.SUB_IOU_ID = TRIM(' || I_CLUS_ID || ')
             AND T.ACCOUNT_ID = TRIM(' || I_ACC_ID || ')';
        EXECUTE IMMEDIATE QRY
          INTO V_CNT;
      
        IF V_CNT = 0 THEN
          --NO FILES UPLOADED FOR THAT ISU FOR CURRNT WEEK
        
          /*  INSERT INTO BTG_WKLY_PL_TGT
                        SELECT REPLACE(PERIOD,'''','-'),
                               SERVICES_REV,
                               BOC_REV,
                               SUB_CON_REV,
                               TCS_LICENSE_REV,
                               TOTAL_REV,
                               INCR_HC,
                               CM_MARGIN,
                               BOC_COST_BMN_USD,
                               TCV_BMN_USD,
                               CASE WHEN S.PERIOD IN (V_ACTUAL) THEN
                               (SELECT DISTINCT REMARKS FROM BTG_WKLY_PL_STG
                                 WHERE FILE_DATE =I_DATE
                                  AND REMARKS <> '-' AND IOU_ID=I_ISU_ID)
                               ELSE
                                ''
                                END REMARKS,
                               ISU_ID,
                               I_LOGGED_EMP_ID,
                               V_DATE,
                               CURRENT_TIMESTAMP,
                               '',
                               V_CURR_QTR,
                            -- new_grOUp ,
                            (SELECT DISTINCT substr(W.NEW_GROUP,1,3) from WSR_NEW_ORG_MAPPING W
          WHERE W.NEW_SUB_GROUP = S.NEW_SUB_GROUP
          AND substr(W.NEW_GROUP,1,3) IN ('BTG','EGG')
          AND W.BU = I_BU)new_group,
                               New_Sub_Group,''
                          FROM BTG_WKLY_PL_PMO_TGT S
                         WHERE S.ISU_ID = TRIM(I_ISU)
                           AND S.QUATER= V_CURR_QTR
                           AND S.PERIOD NOT IN(V_PLAN_VAR);
                          
                      COMMIT;*/
          INSERT INTO BTG_WKLY_PL_TGT
            SELECT REPLACE(PERIOD, '''', '-'),
                 NULL,--  SERVICES_REV,
                 NULL,--  BOC_REV,
                 NULL,--  SUB_CON_REV,
                 NULL,--  TCS_LICENSE_REV,
                   NULL,--TOTAL_REV,
                   INCR_HC,
                   CM_MARGIN,
                   BOC_COST_BMN_USD,
                  TCV_BMN_USD,
                   REMARKS,
                   IOU_ID,
                   LOGIN_ID,
                   V_DATE,
                   CURRENT_TIMESTAMP,
                   '',
                   V_CURR_QTR,
                   '',
                   '',
                   S.SUB_IOU_ID,
                   S.ACCOUNT_ID,
                   ''
              FROM BTG_WKLY_PL_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
            --AND S.FILE_DATE =I_DATE
            /* AND S.PERIOD IN (V_PLAN1)*/
            ; ---COMMENTED AS OF NOW
          COMMIT;
        
          UPDATE BTG_WKLY_PL_TGT S
             SET S.REMARKS = NULL
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
             AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
             AND S.QUARTER = V_CURR_QTR
             AND S.PERIOD NOT IN (V_PLAN_VAR)
             AND S.FILE_DATE = V_DATE;
        
          UPDATE BTG_WKLY_PL_TGT T
             SET T.REMARKS =
                 (SELECT DISTINCT REMARKS
                    FROM BTG_WKLY_PL_STG S
                   WHERE FILE_DATE = I_DATE
                     AND REMARKS <> '-'
                     AND S.IOU_ID = TRIM(I_ISU_ID)
                     AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                     AND S.ACCOUNT_ID = TRIM(I_ACC_ID))
           WHERE T.IOU_ID = TRIM(I_ISU_ID)
             AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND T.ACCOUNT_ID = TRIM(I_ACC_ID)
             AND T.QUARTER = V_CURR_QTR
             AND T.PERIOD NOT IN (V_PLAN_VAR)
             AND T.FILE_DATE = V_DATE;
             
              SELECT COUNT(*) INTO V_ERROR  
                FROM BTG_WKLY_PL_TGT S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = V_DATE;
                 
                 
              IF V_ERROR =0 THEN 
              O_MSG:='Error';
              else              
                O_MSG := 'SUCCESS';            
             END IF;
        
         
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
        
        ELSE
          ------ALREADY FILE UPLOADED
          INSERT INTO BTG_WKLY_PL_TGT_HIS
            SELECT PERIOD,
                   NULL,--  SERVICES_REV,
                 NULL,--  BOC_REV,
                 NULL,--  SUB_CON_REV,
                 NULL,--  TCS_LICENSE_REV,
                   NULL,--TOTAL_REV,
                   INCR_HC,
                   CM_MARGIN,
                   BOC_COST_BMN_USD,
                   TCV_BMN_USD,
                   REMARKS,
                   IOU_ID,
                   LOGIN_ID,
                   FILE_DATE,
                   UPLOADED_DATE,
                   SYSDATE,
                   '',
                   '',
                   T.SUB_IOU_ID,
                   T.ACCOUNT_ID,'',''
              FROM BTG_WKLY_PL_TGT T
             WHERE T.FILE_DATE = V_DATE
               AND T.IOU_ID = TRIM(I_ISU_ID)
               AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
          COMMIT;
        ------------------------------------------------------
         DELETE FROM BTG_WKLY_PL_TGT T
           WHERE T.FILE_DATE = V_DATE
             AND T.IOU_ID = TRIM(I_ISU_ID)
             AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
          COMMIT;
          
    
   ----------------------------------------     
          /*INSERT INTO BTG_WKLY_PL_TGT
                        SELECT REPLACE(PERIOD,'''','-'),
                               SERVICES_REV,
                               BOC_REV,
                               SUB_CON_REV,
                               TCS_LICENSE_REV,
                               TOTAL_REV,
                               INCR_HC,
                               CM_MARGIN,
                               BOC_COST_BMN_USD,
                               TCV_BMN_USD,
                               CASE WHEN S.PERIOD IN (V_ACTUAL) THEN
                               (SELECT DISTINCT REMARKS FROM WKLY_PL_STG  WHERE FILE_DATE =I_DATE AND REMARKS <> '-' AND ISU_ID=I_ISU)
                               ELSE
                                ''
                                END REMARKS,
                               ISU_ID,
                               I_LOGGED_EMP_ID,
                               V_DATE,
                               (SELECT MAX(H.UPLOADED_DATE) FROM WKLY_PL_TGT_HIS H),
                               SYSDATE,
                               V_CURR_QTR,
                               (SELECT DISTINCT substr(W.NEW_GROUP,1,3) from WSR_NEW_ORG_MAPPING W
          WHERE W.NEW_SUB_GROUP = S.NEW_SUB_GROUP
          AND substr(W.NEW_GROUP,1,3) IN ('BTG','EGG')
          AND W.BU = I_BU)new_group,
                               New_Sub_Group,''
                          FROM WKLY_PL_PMO_TGT S
                         WHERE S.ISU_ID = TRIM(I_ISU)
                           AND S.QUATER= V_CURR_QTR
                           AND S.PERIOD NOT IN(V_PLAN_VAR);
                          
                      COMMIT;*/
          INSERT INTO BTG_WKLY_PL_TGT
            SELECT REPLACE(PERIOD, '''', '-'),
                    NULL,--  SERVICES_REV,
                 NULL,--  BOC_REV,
                 NULL,--  SUB_CON_REV,
                 NULL,--  TCS_LICENSE_REV,
                   NULL,--TOTAL_REV,
                   INCR_HC,
                   CM_MARGIN,
                   BOC_COST_BMN_USD,
                  TCV_BMN_USD,
                   REMARKS,
                   IOU_ID,
                   LOGIN_ID,
                   V_DATE,
                   CURRENT_TIMESTAMP,
                   '',
                   V_CURR_QTR,
                   '',
                   '',
                   S.SUB_IOU_ID,
                   S.ACCOUNT_ID,
                   ''
              FROM BTG_WKLY_PL_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
            --AND S.FILE_DATE =I_DATE
            /* AND S.PERIOD IN (V_PLAN1)*/
            ; ---COMMENTED AS OF NOW
          COMMIT;
        
          UPDATE BTG_WKLY_PL_TGT S
             SET S.REMARKS = NULL
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
             AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
             AND S.QUARTER = V_CURR_QTR
             AND S.PERIOD NOT IN (V_PLAN_VAR)
             AND S.FILE_DATE = V_DATE;
        
          UPDATE BTG_WKLY_PL_TGT T
             SET T.REMARKS =
                 (SELECT DISTINCT REMARKS
                    FROM BTG_WKLY_PL_STG S
                   WHERE FILE_DATE = I_DATE
                     AND REMARKS <> '-'
                     AND S.IOU_ID = TRIM(I_ISU_ID)
                     AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                     AND S.ACCOUNT_ID = TRIM(I_ACC_ID))
           WHERE T.IOU_ID = TRIM(I_ISU_ID)
             AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND T.ACCOUNT_ID = TRIM(I_ACC_ID)
             AND T.QUARTER = V_CURR_QTR
             AND T.PERIOD NOT IN (V_PLAN_VAR)
             AND T.FILE_DATE = V_DATE;
        
          SELECT COUNT(*) INTO V_ERROR  
                FROM BTG_WKLY_PL_TGT S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = V_DATE;
                 
                 
              IF V_ERROR =0 THEN 
              O_MSG:='Error';
              else              
                O_MSG := 'SUCCESS';            
             END IF;
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
        
        END IF;
      
      ELSIF REPLACE(REPLACE(LOWER(I_SHEET_NAME), ' ', ''), '&', '') =
            'pipeline' THEN
            
             SELECT COUNT(*) INTO V_PIPE_TGT_CHCK 
      FROM WKLY_BTG_PIPELINE_STG S 
      WHERE S.CRM_ID <> '-'
       AND S.IOU_ID = I_ISU_ID
      AND S.SUB_IOU_ID = I_CLUS_ID
      AND S.ACCOUNT_ID = I_ACC_ID;
      
      IF V_PIPE_TGT_CHCK <> 0 THEN 
      
      
      ----------------------------------------------------------
      /*  DELETE FROM WKLY_BTG_PIPELINE_TGT T
         WHERE ((T.IOU_ID, T.SUB_IOU_ID, T.ACCOUNT_ID) IN
               (SELECT IOU_ID, SUB_IOU_ID, ACCOUNT_ID
                  FROM WKLY_BTG_PIPELINE_STG))
                    AND T.FILE_DATE = V_DATE;
        COMMIT;*/
      
      
      DELETE FROM WKLY_BTG_PIPELINE_TGT G 
        WHERE  G.IOU_ID = I_ISU_ID 
      AND G.SUB_IOU_ID = I_CLUS_ID 
      AND G.ACCOUNT_ID = I_ACC_ID 
      AND  G.FILE_DATE = V_DATE;
      COMMIT;
      
       DELETE FROM WKLY_BTG_PIPELINE_USER_DATA T
        WHERE  T.FILE_DATE = V_DATE
        AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
        COMMIT; 
      
      
      
      
        INSERT INTO WKLY_BTG_PIPELINE_TGT
          (GROUP_CLIENT,
           CRM_ID,
           OPPORTUNITY_NAME,
           OPP_DESCRIPTION,
           SALES_STAGE,
           DEAL_VALUE,
           RENEWAL_VALUE,
           CLOSURE_MONTH,
           BUYING_STAKEHOLDER,
           SP,
           PRIMARY_FOCUS,
           PRIMARY_COMPETITORS,
           STATUS_UPDATE,
           IOU_ID,
           SUB_IOU_ID,
           ACCOUNT_ID,
           LOGIN_ID,
           FILE_DATE)
          SELECT O.GROUP_CLIENT,
                 O.OPPORTUNITY_ID,--TO_NUMBER(O.OPPORTUNITY_ID),
                 O.OPPORTUNITY_NAME,
                 O.OPPORTUNITY_DESCRIPTION,
                 O.SALES_STAGE,
                 (to_number(decode(O.OPPORTUNITY_VALUE_USD,'null',0,OPPORTUNITY_VALUE_USD)) / 1000000) CONTRACT_VAL,
            
                 (to_number(decode(O.renewal_portion_of_tocv_usd,'null',0,renewal_portion_of_tocv_usd)/ 1000000)) RENEWAL_VALUE,
          
                                TO_CHAR(TO_DATE(O.EXPECTED_CLOSE_DATE, 'DD-MON-YY'),
                                        'DD-MON-YYYY') CLOSE_DATE,
                 O.BUYING_STAKEHOLDER,
                 O.SERVICE_PRACTICES,
                 O.PRIMARY_FOCUS,
                 O.COMPETITORS,
                 S.STATUS_UPDATE,
                 S.IOU_ID,
                 S.SUB_IOU_ID,
                 S.ACCOUNT_ID,
                 S.LOGIN_ID,
                V_DATE---TO_DATE(FILE_DATE,'DD/MM/YYYY')
            FROM WKLY_BTG_PIPELINE_STG S, OPPORTUNITY_BTG_WSR O
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
             AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
             AND O.Iou_Id = TRIM(I_ISU_ID)
             AND O.Sub_Iou_Id=TRIM(I_CLUS_ID)
             AND O.ACCOUNT_ID=TRIM(I_ACC_ID)
               AND O.DATESTAMP=(SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR)
             -- AND UPPER(O.CONFIDENTIAL_FLAG) = 'N'
                   AND O.OPPORTUNITY_ID = S.CRM_ID and S.CRM_ID <>'-';
        COMMIT;
        
        
        
              INSERT INTO WKLY_BTG_PIPELINE_USER_DATA
          (GROUP_CLIENT,
           CRM_ID,
           OPPORTUNITY_NAME,
           OPP_DESCRIPTION,
           SALES_STAGE,
           DEAL_VALUE,
           RENEWAL_VALUE,
           CLOSURE_MONTH,
           BUYING_STAKEHOLDER,
           SP,
           PRIMARY_FOCUS,
           PRIMARY_COMPETITORS,
           STATUS_UPDATE,
           IOU_ID,
           SUB_IOU_ID,
           ACCOUNT_ID,
           LOGIN_ID,
           FILE_DATE)
          SELECT GROUP_CLIENT,
                 CRM_ID,
                 OPPORTUNITY_NAME,
                 OPP_DESCRIPTION,
                 SALES_STAGE,
                 DEAL_VALUE,
                 ----TO_NUMBER(RENEWAL_VALUE),
               TO_NUMBER(DECODE(RENEWAL_VALUE,'-','0',RENEWAL_VALUE)),
                 CLOSURE_MONTH,
                 BUYING_STAKEHOLDER,
                 SP,
                 PRIMARY_FOCUS,
                 PRIMARY_COMPETITORS,
                 STATUS_UPDATE,
                 IOU_ID,
                 SUB_IOU_ID,
                 ACCOUNT_ID,
                 LOGIN_ID,
                V_DATE---TO_DATE(FILE_DATE,'DD/MM/YYYY')
            FROM WKLY_BTG_PIPELINE_STG S WHERE 
            S.Iou_Id = TRIM(I_ISU_ID) AND S.Sub_Iou_Id=TRIM(I_CLUS_ID)
            AND S.ACCOUNT_ID=TRIM(I_ACC_ID) AND S.CRM_ID <>'-'
              AND S.CRM_ID NOT IN  
              (SELECT distinct O.OPPORTUNITY_ID  FROM OPPORTUNITY_BTG_WSR O WHERE  O.Iou_Id = TRIM(I_ISU_ID)
             AND O.Sub_Iou_Id=TRIM(I_CLUS_ID)
             AND O.ACCOUNT_ID=TRIM(I_ACC_ID) 
             AND O.Datestamp=(SELECT MAX(DATESTAMP) FROM OPPORTUNITY_BTG_WSR));
                  
        COMMIT;
        
        
       
        END IF;
        
        SELECT COUNT(*) INTO V_ERROR FROM  WKLY_BTG_PIPELINE_USER_DATA T
        WHERE  T.FILE_DATE = V_DATE
        AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
        
             IF V_ERROR <> 0 THEN
                O_MSG := 'WARNING';
             ELSE
                  O_MSG := 'SUCCESS'; 
             END IF;           
            
           
         INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
              
               OPEN O_USER_DATA FOR SELECT  'Opp Id '||U.CRM_ID ||' '||'not in system' FROM WKLY_BTG_PIPELINE_USER_DATA U 
          WHERE U.Iou_Id=TRIM(I_ISU_ID) AND U.ACCOUNT_ID = TRIM(I_ACC_ID) AND U.SUB_IOU_ID = TRIM(I_CLUS_ID)  AND U.FILE_DATE=V_DATE;
      
    ELSIF REPLACE(UPPER(I_SHEET_NAME),' ','') LIKE 'C-CONNECTSORCUSTOMERVISIT'  THEN
     
    ---CHECKING VALUE IS CONNECTS OR VISITS   
     DELETE FROM CCONNECT_ERROR;
        COMMIT;
    
 open v_cur_2 for  
   
          
      SELECT DISTINCT S.CATEGORY 
     -- INTO V_CAT_CHK 
      FROM 
       WKLY_CUSTOMER_VISIT_STG S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR')=  TO_DATE(I_DATE, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) ;
               
              
           LOOP FETCH 
          V_CUR_2 INTO 
          V_CAT_CHK;
          EXIT WHEN V_CUR_2% NOTFOUND;  
               
               
                --- FOR CHECKING THE SENTIMENT IS ENTERED IF THE DATES ARE IN PAST DATES
           V_CHK_SEN_1 := 0;
           V_CHK_SEN_2 := 0;
        IF UPPER(V_CAT_CHK) LIKE '%VISITS%' THEN        
        SELECT COUNT(1)
          INTO V_CHK_SEN_1
          FROM WKLY_CUSTOMER_VISIT_STG S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') = TO_DATE(i_date, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
              
              (TO_DATE(S.VISIT_START_DATE, 'DD/MM/RRRR') < TO_DATE(SYSDATE, 'DD/MM/RRRR')
              or TO_DATE( S.VISIT_END_DATE, 'DD/MM/RRRR') < TO_DATE(SYSDATE, 'DD/MM/RRRR'))
              AND S.SENTIMENTS IS NULL
              AND UPPER(S.CATEGORY) = UPPER(V_CAT_CHK)
               
               ;
               END IF;
               
         IF UPPER(V_CAT_CHK) LIKE '%CONNECT%' THEN        
        SELECT COUNT(1)
          INTO V_CHK_SEN_2
          FROM WKLY_CUSTOMER_VISIT_STG S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR')  = TO_DATE(i_date, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
              TO_DATE(S.MEETING_DATE, 'DD/MM/RRRR')  < TO_DATE(SYSDATE, 'DD/MM/RRRR')  
              AND S.SENTIMENTS IS NULL AND 
              UPPER(S.CATEGORY) = UPPER(V_CAT_CHK)
             
               ;
               
               
               
                
           END IF;  
           
          -- IF V_CHK_SEN_1 <>0 OR V_CHK_SEN_2 <>0 THEN 
             
           IF V_CHK_SEN_1 <>0 THEN 
           
           IF UPPER(V_CAT_CHK) LIKE '%VISITS%' THEN 
             
           
           OPEN V_CUR_3 FOR 
             SELECT distinct S.VISIT_END_DATE
         -- INTO V_DATE_10
          FROM WKLY_CUSTOMER_VISIT_STG S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') = TO_DATE(i_date, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
              
              (TO_DATE(S.VISIT_START_DATE, 'DD/MM/RRRR') < TO_DATE(SYSDATE, 'DD/MM/RRRR')
              or TO_DATE( S.VISIT_END_DATE, 'DD/MM/RRRR') < TO_DATE(SYSDATE, 'DD/MM/RRRR'))
              AND S.SENTIMENTS IS NULL
              AND UPPER(S.CATEGORY) = UPPER(V_CAT_CHK)
               
               ;
              V_VAR_1 := 'VISIT DATE'; 
                
               LOOP FETCH 
          V_CUR_3 INTO 
          V_DATE_10;
          EXIT WHEN V_CUR_3% NOTFOUND; 
                     
                 INSERT INTO CCONNECT_ERROR (SELECT  INITCAP(V_VAR_1||' '||v_date_10||' '||' IS A PAST DATE SO PLEASE FILL THE VISIT SENTIMENTS(WARNING)') FROM DUAL);
          COMMIT;
         END LOOP;

 


      CLOSE V_CUR_3;
              
              END IF;
              END IF;
              
             IF  V_CHK_SEN_2 <>0 THEN  
              
               if UPPER(V_CAT_CHK) LIKE '%CONNECT%'
                 THEN 
                   OPEN V_CUR_3 FOR 
                  SELECT DISTINCT  S.MEETING_DATE
          --INTO V_DATE_10
          FROM WKLY_CUSTOMER_VISIT_STG S
           WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR')  = TO_DATE(i_date, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID) AND 
              TO_DATE(S.MEETING_DATE, 'DD/MM/RRRR')  < TO_DATE(SYSDATE, 'DD/MM/RRRR')  
              AND S.SENTIMENTS IS NULL AND 
              UPPER(S.CATEGORY) = UPPER(V_CAT_CHK)
             
               ;
               
                 
               V_VAR_1 := 'Meeting date';
               
               LOOP FETCH 
          V_CUR_3 INTO 
          V_DATE_10;
          EXIT WHEN V_CUR_3% NOTFOUND; 
                     
                 INSERT INTO CCONNECT_ERROR (SELECT  INITCAP(V_VAR_1||' '||v_date_10||' '||' IS A PAST DATE SO PLEASE FILL THE VISIT SENTIMENTS(WARNING)') FROM DUAL);
          COMMIT;
         END LOOP;

 


      CLOSE V_CUR_3;
              
               
               
          END IF;    
          END IF; 
               
        /*   END LOOP;

 


      CLOSE V_CUR_2;*/   
              
           
            
        
         
      IF V_CHK_SEN_1 <>0  OR  V_CHK_SEN_2 <>0 THEN 
        
       
       /*
        IF V_CHK_SEN_1 <>0  THEN 
        
       --  OPEN O_USER_DATA FOR
         
        INSERT INTO CCONNECT_ERROR (SELECT  INITCAP(V_VAR_1||' '||v_date_10||' '||' IS A PAST DATE SO PLEASE FILL THE VISIT SENTIMENTS(WARNING)') FROM DUAL);\*FROM WKLY_CUSTOMER_VISIT_STG U
          WHERE U.Iou_Id=TRIM(I_ISU_ID) AND U.ACCOUNT_ID = TRIM(I_ACC_ID) AND U.SUB_IOU_ID = TRIM(I_CLUS_ID)  AND
          TO_DATE(U.FILE_DATE, 'DD/MM/RRRR')  = TO_DATE(i_date, 'DD/MM/RRRR')*\       
             COMMIT;
             END IF;*/
             
        /* IF     V_CHK_SEN_2 <>0 THEN 
           INSERT INTO CCONNECT_ERROR (SELECT  INITCAP(V_VAR_1||' '||v_date_10||' '||' IS A PAST DATE SO PLEASE FILL THE VISIT SENTIMENTS(WARNING)') FROM DUAL);\*FROM WKLY_CUSTOMER_VISIT_STG U
          WHERE U.Iou_Id=TRIM(I_ISU_ID) AND U.ACCOUNT_ID = TRIM(I_ACC_ID) AND U.SUB_IOU_ID = TRIM(I_CLUS_ID)  AND
          TO_DATE(U.FILE_DATE, 'DD/MM/RRRR')  = TO_DATE(i_date, 'DD/MM/RRRR')*\       
             COMMIT;
             END IF;*/
          -- U.FILE_DATE=V_DATE;
          OPEN O_USER_DATA FOR SELECT * FROM CCONNECT_ERROR; 
          
          
      ELSE 
        V_MSG_1 := 'SUCCESS';
         
          END IF;
          
      
      
    
      
         END LOOP;

 


      CLOSE V_CUR_2;
      
      SELECT COUNT(*) INTO V_CNT_6 FROM CCONNECT_ERROR ;
      IF V_CNT_6 <>0  THEN 
         V_MSG_1 := 'WARNING';
         ELSE
            V_MSG_1 := 'SUCCESS';
            END IF;
        
      
        SELECT COUNT(1)
          INTO V_CNT_NAME
          FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
         WHERE T.FILE_DATE = V_DATE
           AND T.IOU_ID = TRIM(I_ISU_ID)
           AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
           AND T.ACCOUNT_ID = TRIM(I_ACC_ID)
          ;
      
        IF V_CNT_NAME = 0 THEN
        
          INSERT INTO WKLY_CUSTOMER_VISIT_TGT_NAME
            SELECT S.SUB_IOU_ID,
                   S.ACCOUNT,
                   S.ACCOUNT_ID,
                  
S.cust_name, 
S.category, 
S.tcs_partcipants_name, 
S.sentiments, 
S.meeting_date, 
S.visit_start_date, 
S.visit_end_date, 
S.visit_location, 
S.objective, 
S.outcome, 

                   S.IOU_ID,
                   S.LOGIN_ID,
                   V_DATE,
                   SYSDATE,
                   ''
              FROM WKLY_CUSTOMER_VISIT_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') = TO_DATE(I_DATE, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          COMMIT; 
          
       update   WKLY_CUSTOMER_VISIT_TGT_NAME 
       set account = (select  distinct short_name from new_btg_account_mapping WHERE  ACCOUNT_ID = I_ACC_ID)
       where account_id = I_ACC_ID;
       commit;
       
        
          O_MSG := 'SUCCESS';
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
        
       ELSE
        
          INSERT INTO WKLY_CUSTOMER_VISIT_TGT_NAME_HIS
            SELECT T.SUB_IOU_ID,
                   T.ACCOUNT,
                   T.ACCOUNT_ID,
   
T.cust_name, 
T.category, 
T.tcs_partcipants_name, 
T.sentiments, 
T.meeting_date, 
T.visit_start_date, 
T.visit_end_date, 
T.visit_location, 
T.objective, 
T.outcome, 

                   T.IOU_ID,
                   T.LOGIN_ID,
                   T.FILE_DATE,
                   T.UPLOADED_DATE,
                   T.UPDATED_DATE,'',''
              FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
             WHERE T.IOU_ID = TRIM(I_ISU_ID)
               AND T.FILE_DATE = V_DATE
                  
               AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
          COMMIT;
        -----------------------------------------------------
          DELETE FROM WKLY_CUSTOMER_VISIT_TGT_NAME T
           WHERE T.IOU_ID = TRIM(I_ISU_ID)
             AND T.FILE_DATE = V_DATE
             AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
          COMMIT;
          
          
         
        -----------------------------------
          INSERT INTO WKLY_CUSTOMER_VISIT_TGT_NAME
            SELECT S.SUB_IOU_ID,
                   S.ACCOUNT,
                   S.ACCOUNT_ID,
                  
S.cust_name, 
S.category, 
S.tcs_partcipants_name, 
S.sentiments, 
S.meeting_date, 
S.visit_start_date, 
S.visit_end_date, 
S.visit_location, 
S.objective, 
S.outcome, 

                   S.IOU_ID,
                   S.LOGIN_ID,
                   V_DATE,
                   SYSDATE,
                   ''
              FROM WKLY_CUSTOMER_VISIT_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND TO_DATE(S.FILE_DATE, 'DD/MM/RRRR') = TO_DATE(I_DATE, 'DD/MM/RRRR')
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          COMMIT;
         
        
          O_MSG := v_msg_1;
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
             update   WKLY_CUSTOMER_VISIT_TGT_NAME 
       set account = (select  distinct short_name from new_btg_account_mapping WHERE  ACCOUNT_ID = I_ACC_ID)
       where account_id = I_ACC_ID;
       commit;
       
      
            
        END IF;
           
       -- END IF;
        /* END LOOP;


      CLOSE V_CUR_1;*/   
      
      ELSIF REPLACE(LOWER(I_SHEET_NAME), ' ', '') = LOWER('CLOSED') THEN
      
        SELECT COUNT(*) INTO V_LOSS_TGT_CHCK 
      FROM WKLY_LOSSES_STG  S 
      WHERE S.OPP_ID = '-'
       AND S.IOU_ID = I_ISU_ID
      AND S.SUB_IOU_ID = I_CLUS_ID
      AND S.ACCOUNT_ID = I_ACC_ID;
      
     IF V_LOSS_TGT_CHCK  = 0 THEN
      
        select count(1)
          INTO V_CNT_NAME
          FROM WKLY_LOSSES_TGT T
         WHERE T.FILE_DATE = V_DATE
           AND T.IOU_ID = TRIM(I_ISU_ID)
           AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
           AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
      
        IF V_CNT_NAME = 0 THEN
        
          INSERT INTO WKLY_LOSSES_TGT
            SELECT S.SUB_IOU_ID,
                   S.ACCOUNT_ID,
                   S.GROUP_CUSTOMER,
                   '',
                    S.OPP_ID,--TO_NUMBER(S.OPP_ID),
                   S.OPP_NAME,
                   S.OPP_VALUE,
                   S.RENEW_OPP_VALUE,
                   S.CLOSURE_MONTH,
                   S.COMPETITORS,
                   S.SALES_STAGE,
                   S.REASON_FOR_LOSS_WIN,
                   S.IOU_ID,
                   S.LOGIN_ID,
                   V_DATE,
                   Sysdate,
                   '',
                   '',
                   ''
              FROM WKLY_LOSSES_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND S.FILE_DATE = TRIM(I_DATE)
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          COMMIT;
        
          O_MSG := 'SUCCESS';
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
        
        ELSE
        
          INSERT INTO WKLY_LOSSES_TGT_HIS
            SELECT T.SUB_IOU_ID,
                   T.ACCOUNT_ID,
                   T.GROUP_CUSTOMER,
                   T.GROUP_CUSTOMER_ID,
                   T.OPP_ID,
                   T.OPP_NAME,
                   T.OPP_VALUE,
                   T.RENEW_OPP_VALUE,
                   T.CLOSURE_MONTH,
                   T.COMPETITORS,
                   T.SALES_STAGE,
                   T.REASON_FOR_LOSS_WIN,
                   T.IOU_ID,
                   T.LOGIN_ID,
                   T.FILE_DATE,
                   T.UPLOADED_DATE,
                   T.UPDATED_DATE,
                   T.RENEWAL_VALUE,
                   T.STATUS_UPDATE,'',''
              FROM WKLY_LOSSES_TGT T
             WHERE T.IOU_ID = TRIM(I_ISU_ID)
               AND T.FILE_DATE = V_DATE
                  
               AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
          COMMIT;
        
          DELETE FROM WKLY_LOSSES_TGT T
           WHERE T.IOU_ID = TRIM(I_ISU_ID)
             AND T.FILE_DATE = V_DATE
             AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
          COMMIT;
        
          INSERT INTO WKLY_LOSSES_TGT
            SELECT S.SUB_IOU_ID,
                   S.ACCOUNT_ID,
                   S.GROUP_CUSTOMER,
                   '',
                  TO_NUMBER(S.OPP_ID),
                   S.OPP_NAME,
                   S.OPP_VALUE,
                   S.RENEW_OPP_VALUE,
                   S.CLOSURE_MONTH,
                   S.COMPETITORS,
                   S.SALES_STAGE,
                   S.REASON_FOR_LOSS_WIN,
                   S.IOU_ID,
                   S.LOGIN_ID,
                   V_DATE,
                   Sysdate,
                   '',
                   '',
                   ''
              FROM WKLY_LOSSES_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND S.FILE_DATE = TRIM(I_DATE)
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          COMMIT;
        
          O_MSG := 'SUCCESS';
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
          
        END IF;
    
        END IF;
      
      ELSIF REPLACE(LOWER(I_SHEET_NAME), ' ', '') = LOWER('WINS') THEN
      
        
      
      SELECT COUNT(*) INTO V_WINS_TGT_CHCK 
      FROM WKLY_WINS_STG  S 
      WHERE  S.OPP_ID  = '-'
      AND S.IOU_ID = I_ISU_ID
      AND S.SUB_IOU_ID = I_CLUS_ID
      AND S.ACCOUNT_ID = I_ACC_ID;
      
     IF V_WINS_TGT_CHCK  = 0 THEN 

     
      
        select count(1)
          INTO V_CNT_NAME
          FROM WKLY_WINS_TGT T
         WHERE T.FILE_DATE = V_DATE
           AND T.IOU_ID = TRIM(I_ISU_ID)
           AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
           AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
      
        IF V_CNT_NAME = 0 THEN
        
          INSERT INTO WKLY_WINS_TGT
            SELECT S.SUB_IOU_ID,
                   S.ACCOUNT_ID,
                   S.GROUP_CUSTOMER,
                   '',
                 TO_NUMBER(S.OPP_ID),
                   S.OPP_NAME,
                   S.TOTAL_OF_CON_VALUE,
                   S.RENEW_PORTION_TOC,
                   S.CLOSURE_MONTH,
                   S.COMPETITORS,
                   S.REASON_FOR_LOSS_WIN,
                   S.IOU_ID,
                   S.LOGIN_ID,
                   V_DATE,
                   S.UPLOADED_DATE,
                   SYSDATE,
                TO_NUMBER(DECODE(S.RENEWAL_VALUE,'-','0',S.RENEWAL_VALUE)),
                   S.STATUS_UPDATE
              FROM WKLY_WINS_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND S.FILE_DATE = TRIM(I_DATE)
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          COMMIT;
        
          O_MSG := 'SUCCESS';
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
        
        ELSE
        
          INSERT INTO WKLY_WINS_TGT_HIS
            SELECT T.SUB_IOU_ID,
                   T.ACCOUNT_ID,
                   T.GROUP_CUSTOMER,
                   T.GROUP_CUSTOMER_ID,
                   T.OPP_ID,
                   T.OPP_NAME,
                   T.TOTAL_OF_CON_VALUE,
                   T.RENEW_PORTION_TOC,
                   T.CLOSURE_MONTH,
                   T.COMPETITORS,
                   T.REASON_FOR_LOSS_WIN,
                   T.IOU_ID,
                   T.LOGIN_ID,
                   T.FILE_DATE,
                   T.UPLOADED_DATE,
                   T.UPDATED_DATE,
                   T.RENEWAL_VALUE,
                   T.STATUS_UPDATE,'',''
              FROM WKLY_WINS_TGT T
             WHERE T.IOU_ID = TRIM(I_ISU_ID)
               AND T.FILE_DATE = V_DATE
                  
               AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
          COMMIT;
       --------------------------------------------------- 
          DELETE FROM WKLY_WINS_TGT T
           WHERE T.IOU_ID = TRIM(I_ISU_ID)
             AND T.FILE_DATE = V_DATE
             AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
          COMMIT;
        
          INSERT INTO WKLY_WINS_TGT
            SELECT S.SUB_IOU_ID,
                   S.ACCOUNT_ID,
                   S.GROUP_CUSTOMER,
                   '',
                   S.OPP_ID,   --TO_NUMBER(S.OPP_ID),
                   S.OPP_NAME,
                   S.TOTAL_OF_CON_VALUE,
                   S.RENEW_PORTION_TOC,
                   S.CLOSURE_MONTH,
                   S.COMPETITORS,
                   S.REASON_FOR_LOSS_WIN,
                   S.IOU_ID,
                   S.LOGIN_ID,
                   V_DATE,
                   S.UPLOADED_DATE,
                   SYSDATE,
                TO_NUMBER(DECODE(S.RENEWAL_VALUE,'-','0',S.RENEWAL_VALUE)),
                   S.STATUS_UPDATE
              FROM WKLY_WINS_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND S.FILE_DATE = TRIM(I_DATE)
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          COMMIT;
          
         
        
          O_MSG := 'SUCCESS';
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
          
          
        END IF;
        
      
     end if;
      O_MSG := 'SUCCESS';
      
      ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'TCVOUTLOOK' THEN
      
       /* delete from wkly_tcv_outlook_tgt t  --252 736 581
         where ((iou_id, sub_iou_id, account_id) in
               (select ioU_id, sub_iou_id, account_id
                  from wkly_tcv_outlook_stg))
                    AND T.FILE_DATE = V_DATE;
                    
                    
      */ 
    ---------------CHANGES DONE HERE FOR CRCT DELETION --------------  
      DELETE FROM  wkly_tcv_outlook_tgt G 
      WHERE  G.IOU_ID = I_ISU_ID 
      AND G.SUB_IOU_ID = I_CLUS_ID 
      AND G.ACCOUNT_ID = I_ACC_ID 
      AND  G.FILE_DATE = V_DATE;
        commit;
      
        insert into wkly_tcv_outlook_tgt
          (account,
           q1fy_projection,
           q2fy_projection,
           q3fy_projection,
           q4fy_projection,
           fy_projection,
           iou_id,
           sub_iou_id,
           account_id,
           uploaded_date,
           uploaded_by,
           FILE_DATE)
        
          (select account,
                  q1fy_projection,
                  q2fy_projection,
                  q3fy_projection,
                  q4fy_projection,
                  fy_projection,
                  iou_id,
                  sub_iou_id,
                  account_id,
                  TO_DATE(uploaded_date,'DD/MM/YYYY'),
                  uploaded_by,
                 V_DATE -- TO_DATE(FILE_DATE,'DD/MM/YYYY')
             from wkly_tcv_outlook_stg S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND S.FILE_DATE = TRIM(I_DATE)
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID));
      
        COMMIT;
          SELECT COUNT(*) INTO V_ERROR 
                FROM wkly_tcv_outlook_tgt S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = V_DATE;
                 
                 
              IF V_ERROR =0 THEN 
              O_MSG:='Error';
              else              
                O_MSG := 'SUCCESS';            
             END IF;
         INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
       ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'HC' THEN
        
      IF V_CUR_MONTH = V_MON1 THEN
        V_COL:= 'A.MON1_EXIT = B.MON1_EXIT,
                 A.MON2_EXIT = B.MON2_EXIT,
                 A.MON3_EXIT = B.MON3_EXIT,
                 A.MON1_INC  = B.MON1_INC,
                 A.MON2_INC  = B.MON2_INC,
                 A.MON3_INC  = B.MON3_INC,
                 A.CUR_QTR_INC = B.CUR_QTR_INC,';
     ELSIF V_CUR_MONTH = V_MON2 THEN
        V_COL:= 'A.MON2_EXIT = B.MON2_EXIT,
                 A.MON3_EXIT = B.MON3_EXIT,
                 A.MON2_INC  = B.MON2_INC,
                 A.MON3_INC  = B.MON3_INC,
                 A.CUR_QTR_INC = B.CUR_QTR_INC,';
    ELSIF V_CUR_MONTH = V_MON3 THEN
        V_COL:= 'A.MON3_EXIT = B.MON3_EXIT,
                 A.MON3_INC  = B.MON3_INC,
                 A.CUR_QTR_INC = B.CUR_QTR_INC,';
    END IF;
    
  QRY := 'MERGE INTO (SELECT *
                FROM BTG_WSR_HC_TGT T
               WHERE T.PERIOD = '''||V_DATE||'''
                 AND T.IOU_ID = '''||I_ISU_ID||'''
                 AND T.ACCOUNT_ID = '''||I_ACC_ID||''') A
  USING (SELECT *
           FROM BTG_WSR_HC_STG T
          WHERE T.IOU_ID = '''||I_ISU_ID||'''
            AND T.ACCOUNT_ID = '''||I_ACC_ID||''') B
  ON (NVL(A.ON_OFF,''-'') = NVL(B.ON_OFF,''-'') AND NVL(A.PERSON_TYPE,''-'') = NVL(B.PERSON_TYPE,''-''))
  WHEN MATCHED THEN
    UPDATE
       SET '||V_COL||'
           A.LOGIN_EMP_ID  = '||I_LOGGED_EMP_ID||',
           A.DATESTAMP     = SYSDATE,
           A.PERIOD        = '''||V_DATE||'''
  WHEN NOT MATCHED THEN
    INSERT (iou_id,
       account_id,
       on_off,
       person_type,
       prev_qtr_exit,
       mon1_exit,
       mon2_exit,
       mon3_exit,
       prev_qtr_inc,
       mon1_inc,
       mon2_inc,
       mon3_inc,
       cur_qtr_inc,
       login_emp_id,
       datestamp,
       period)
    VALUES
      (B.IOU_ID,
       B.ACCOUNT_ID,
       B.ON_OFF,
       B.PERSON_TYPE,
       B.PREV_QTR_EXIT,
       B.MON1_EXIT,
       B.MON2_EXIT,
       B.MON3_EXIT,
       B.PREV_QTR_INC,
       B.MON1_INC,
       B.MON2_INC,
       B.MON3_INC,
       B.CUR_QTR_INC,
       '||I_LOGGED_EMP_ID||',
       SYSDATE,
       '''||V_DATE||''')';
       
       DELETE FROM HD_DUMMY;
       COMMIT;
       INSERT INTO HD_DUMMY VALUES(QRY);
       COMMIT;
       
       EXECUTE IMMEDIATE QRY;
       
       COMMIT; 
           O_MSG := 'SUCCESS';            
           
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
      /*ELSIF REPLACE(UPPER(I_SHEET_NAME), ' ', '') = 'HC' THEN
      
        select count(1)
          INTO V_CNT_NAME
          FROM WKLY_HC_BTG_TGT T
         WHERE T.FILE_DATE = V_DATE
           AND T.IOU_ID = TRIM(I_ISU_ID)
           AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
           AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
      
        IF V_CNT_NAME = 0 THEN
        
          INSERT INTO WKLY_HC_BTG_TGT
            (sub_iou_id,
             account_id,
             group_customer,
             group_customer_id,
             wfp_net_on,
             wfp_net_off,
             wfp_net_tot,
             net_won_gr_off,
             net_won_gr_onn,
             pa_off,
             pa_onn,
             pa_tot,
             net_won_growth_off,
             net_won_growth_onn,
             net_won_growth_tot,
             mon1_exit,
             mon2_exit,
             mon3_exit,
             emp,
             tr,
             ep,
             ba,
             intern,
             file_date,
             uploaded_date,
             updated_date,
             iou_id
             
             )
            SELECT S.SUB_IOU_ID,
                   S.ACCOUNT_ID,
                   S.GROUP_CUSTOMER,
                   S.GROUP_CUSTOMER_ID,
                   S.wfp_net_on,
                   S.wfp_net_off,
                   S.wfp_net_tot,
                   S.net_won_gr_off,
                   S.net_won_gr_onn,
                   S.pa_off,
                   S.pa_onn,
                   S.pa_tot,
                   S.net_won_growth_off,
                   S.net_won_growth_onn,
                   S.net_won_growth_tot,
                   S.mon1_exit,
                   S.mon2_exit,
                   S.mon3_exit,
                   S.emp,
                   S.tr,
                   S.ep,
                   S.ba,
                   S.intern,
                   V_DATE,
                   SYSDATE,
                   S.UPDATED_DATE,
                   S.IOU_ID
            
              FROM WKLY_HC_BTG_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND S.FILE_DATE = TRIM(I_DATE)
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          COMMIT;
        
         SELECT COUNT(*) INTO V_ERROR  
                FROM wkly_hc_btg_tgt S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = V_DATE;
                 
                 
              IF V_ERROR =0 THEN 
              O_MSG:='Error';
              else              
                O_MSG := 'SUCCESS';            
             END IF;
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
        
        ELSE
        
          DELETE FROM WKLY_HC_BTG_TGT T
           WHERE T.IOU_ID = TRIM(I_ISU_ID)
             AND T.FILE_DATE = V_DATE
             AND T.SUB_IOU_ID = TRIM(I_CLUS_ID)
             AND T.ACCOUNT_ID = TRIM(I_ACC_ID);
          COMMIT;
        
          INSERT INTO WKLY_HC_BTG_TGT
            (sub_iou_id,
             account_id,
             group_customer,
             group_customer_id,
             wfp_net_on,
             wfp_net_off,
             wfp_net_tot,
             net_won_gr_off,
             net_won_gr_onn,
             pa_off,
             pa_onn,
             pa_tot,
             net_won_growth_off,
             net_won_growth_onn,
             net_won_growth_tot,
             mon1_exit,
             mon2_exit,
             mon3_exit,
             emp,
             tr,
             ep,
             ba,
             intern,
             file_date,
             uploaded_date,
             updated_date,
             iou_id
             
             )
            SELECT S.SUB_IOU_ID,
                   S.ACCOUNT_ID,
                   S.GROUP_CUSTOMER,
                   S.GROUP_CUSTOMER_ID,
                   S.wfp_net_on,
                   S.wfp_net_off,
                   S.wfp_net_tot,
                   S.net_won_gr_off,
                   S.net_won_gr_onn,
                   S.pa_off,
                   S.pa_onn,
                   S.pa_tot,
                   S.net_won_growth_off,
                   S.net_won_growth_onn,
                   S.net_won_growth_tot,
                   S.mon1_exit,
                   S.mon2_exit,
                   S.mon3_exit,
                   S.emp,
                   S.tr,
                   S.ep,
                   S.ba,
                   S.intern,
                   V_DATE,
                   SYSDATE,
                   S.UPDATED_DATE,
                   S.IOU_ID
            
              FROM WKLY_HC_BTG_STG S
             WHERE S.IOU_ID = TRIM(I_ISU_ID)
               AND S.FILE_DATE = TRIM(I_DATE)
                  
               AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
               AND S.ACCOUNT_ID = TRIM(I_ACC_ID);
        
          COMMIT;
        
         SELECT COUNT(*) INTO V_ERROR 
                FROM wkly_hc_btg_tgt S
               WHERE S.IOU_ID = TRIM(I_ISU_ID)
                 AND S.SUB_IOU_ID = TRIM(I_CLUS_ID)
                 AND S.ACCOUNT_ID = TRIM(I_ACC_ID)
                    --AND S.FILE_DATE = V_CURR_WEEK
                 AND S.FILE_DATE = V_DATE;
                 
                 
              IF V_ERROR =0 THEN 
              O_MSG:='Error';
              else              
                O_MSG := 'SUCCESS';            
             END IF;
           INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
            
        
        END IF;*/
      
      END IF;
      
      SELECT COUNT(1) INTO V_CNT FROM BTG_WKLY_REP_UPLOAD_ERROR E
  WHERE TRIM(E.DATESTAMP) =TRIM(SYSDATE)
  AND E.IOU_ID=I_ISU_ID
  AND E.SUB_IOU_ID=I_CLUS_ID
  AND E.ACCOUNT_ID=I_ACC_ID;
  
 SELECT COUNT(*)  INTO V_CNT1 FROM   MSG_EXEP R
 WHERE R.I_ISU_ID = I_ISU_ID
 AND R.I_CLUS_ID = I_CLUS_ID
 AND R.I_ACCOUNT_ID = I_ACC_ID
 AND UPPER(R.MSG) = 'ERROR';
         
            
            
  
  IF V_CNT=0 AND V_CNT1 = 0 THEN
  
  UPDATE  WKLY_REP_FRZ_UNFRZ_BTG T SET T.FILE_UPLOADED='Y',T.UPLOADED_DATE=SYSDATE  WHERE T.ISU_ID=I_ISU_ID
  AND T.SUB_ISU_ID=I_CLUS_ID AND T.ACCOUNT_ID=I_ACC_ID 
  AND T.FILE_DATE=V_DATE ;
  
  COMMIT;
  ----UPDATING FOR MONTHLY 
  UPDATE  WKLY_REP_FRZ_UNFRZ_BTG T SET T.M_FILE_UPLOADED='Y',T.M_UPLOADED_DATE=SYSDATE  WHERE T.ISU_ID=I_ISU_ID
  AND T.SUB_ISU_ID=I_CLUS_ID AND T.ACCOUNT_ID=I_ACC_ID 
  AND T.FILE_DATE=V_DATE ;
  
  COMMIT;
  ELSE
    
  UPDATE  WKLY_REP_FRZ_UNFRZ_BTG T SET T.FILE_UPLOADED='N'  WHERE T.ISU_ID=I_ISU_ID
  AND T.SUB_ISU_ID=I_CLUS_ID AND T.ACCOUNT_ID=I_ACC_ID 
  AND T.FILE_DATE=V_DATE ;
  COMMIT;
  
   UPDATE  WKLY_REP_FRZ_UNFRZ_BTG T SET T.M_FILE_UPLOADED='N'  WHERE T.ISU_ID=I_ISU_ID
  AND T.SUB_ISU_ID=I_CLUS_ID AND T.ACCOUNT_ID=I_ACC_ID 
  AND T.FILE_DATE=V_DATE ;
  COMMIT;
  
  END IF;
      --  END IF;
      
   
    
    EXCEPTION
      WHEN OTHERS THEN
      
        O_MSG := 'ERROR';
  INSERT INTO MSG_EXEP 
            VALUES(I_SHEET_NAME,O_MSG,I_ISU_ID,I_CLUS_ID,I_ACC_ID);
            COMMIT;
      
    END;
    ---------ADDED BY 1595716 FOR MOBILE APP UPDATION OF OUTLOOK VALUES   
  
  END SP_WEEKLY_STG_TO_TGT;

  PROCEDURE SP_WEEKLY_SCHEDULER IS
  
    V_DATE       VARCHAR2(1000);
    V_ID         VARCHAR2(4000);
    QRY          LONG;
    V_ISU        SYS_REFCURSOR;
    V_ISU_ID     NUMBER;
    V_SHEET_NAME SYS_REFCURSOR;
    V_SHEET      VARCHAR2(1000);
  BEGIN
    QRY := 'SELECT TRUNC(SYSDATE) - INTERVAL ''2'' DAY AS NEXT_FRIDAY
                 FROM DUAL';
  
    EXECUTE IMMEDIATE QRY
      INTO V_DATE;
      
      UPDATE WKLY_REP_FRZ_UNFRZ_BTG T 
      SET T.FILE_UPLOADED='Y',T.FREEZE_FLAG='Y'
       WHERE T.FILE_DATE = (SELECT MAX(M.FILE_DATE)FROM WKLY_REP_FRZ_UNFRZ_BTG M);
       COMMIT;
      
    QRY:='DELETE FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE T.FILE_DATE=TO_DATE('''||V_DATE||''',''DD-MON-YY'')
    AND T.FILE_UPLOADED <> ''Y'' ';
    
    EXECUTE IMMEDIATE QRY;
    COMMIT;
    
    QRY := 'INSERT INTO WKLY_REP_FRZ_UNFRZ_BTG
      (ISU_ID,SUB_ISU_ID,ACCOUNT_ID,FILE_UPLOADED,FILE_DATE,FREEZE_FLAG,m_file_uploaded
      ,m_freeze_flag )
 SELECT  DISTINCT D.IOU_ID,D.SUB_IOU_ID,D.ACCOUNT_ID,''N'',''' ||
           V_DATE || ''',''N'' ,''N'',''N'' FROM NEW_BTG_ACCOUNT_MAPPING D
            WHERE (D.IOU_ID,D.SUB_IOU_ID,D.ACCOUNT_ID) NOT IN (
 SELECT  H.ISU_ID,H.SUB_ISU_ID,H.ACCOUNT_ID  FROM WKLY_REP_FRZ_UNFRZ_BTG H 
 WHERE H.FILE_UPLOADED = ''Y''
 AND H.FILE_DATE = ''' ||
           V_DATE || ''')';
  
    EXECUTE IMMEDIATE QRY;
    COMMIT;
    
    -------------HAVE TO ASK Y THIS PAERT ----------
  
   /* OPEN V_SHEET_NAME FOR
    
      SELECT 'Summary Status'
        from dual
      union all
      SELECT 'Executive Summary'
        from dual
      union all
      SELECT 'PL'
        from dual
      union all
      SELECT 'Accountwise Revenue'
        from dual
      union all
      SELECT 'Accountwise HC'
        from dual
      union all
      SELECT 'Key Deals'
        from dual
      union all
      SELECT 'Client Visit'
        from dual
      union all
      SELECT 'Red Projects'
        from dual
      union all
      SELECT 'Red Projects'
        from dual;
  
    LOOP
      FETCH V_SHEET_NAME
        INTO V_SHEET;
      EXIT WHEN V_SHEET_NAME%NOTFOUND;
    
      QRY := 'INSERT INTO WKLY_SHEET_NAME
                  (FILE_DATE, 
                   SHEET_NAME, 
                   MAIL_FLAG )
       VALUES
      (''' || V_DATE || ''',''' || V_SHEET || ''',''N'')';
    
      EXECUTE IMMEDIATE QRY;
      COMMIT;
    
    END LOOP;
    CLOSE V_SHEET_NAME;*/

---------------HAVE TO ASK THIS PART 
  
    INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG T
    VALUES
      ('',
       SYSDATE,
       'PKG_WEEKLY_REPORT.SP_WEEKLY_SCHEDULER',
       '',
       V_ID,
       '',
       '');
    COMMIT;
  
  END SP_WEEKLY_SCHEDULER;
  ----------------
  PROCEDURE SP_DECK_WSR_GRID_CNT(I_LOGGED_EMP_ID IN NUMBER,
                               I_COORPORATE    IN NUMBER,
                               I_BU            IN NUMBER,
                               I_ISU           IN NUMBER,
                               I_FILE_DATE     IN VARCHAR2,
                               I_SHEET_NAME    IN VARCHAR2,
                               I_FLAG          IN VARCHAR2, ---===EXCEL/PPT
                               O_GRID_COUNT  OUT NUMBER,
                               O_GROUP OUT VARCHAR2)
                               
 IS
 QRY LONG;
 BEGIN
   
   IF I_ISU IS NULL OR I_ISU =0 THEN
   
  QRY :=  'SELECT DISTINCT B.BU_NAME 
    FROM BU_MASTER B WHERE B.BU# = '||I_BU||'';
    
    EXECUTE IMMEDIATE QRY INTO O_GROUP;
 ELSE
    QRY:= 'SELECT DISTINCT initcap(substr(t.iou_short_name,instr(t.iou_short_name,''BTG-'')+4)) 
      FROM NEW_BTG_ACCOUNT_MAPPING T WHERE T.IOU_ID = '||I_ISU||'';
      
     EXECUTE IMMEDIATE QRY INTO O_GROUP;
     END IF;
   
 IF I_BU = 21 THEN
   O_GRID_COUNT := 1;

 
   ELSIF I_BU = 22 THEN
       O_GRID_COUNT := 3;
     
   END IF;
   
 END  SP_DECK_WSR_GRID_CNT;
 --------------
 PROCEDURE SP_WSR_PPT_ATTACHMENT(I_LOGGED_EMP_ID IN NUMBER,
                               I_COORPORATE    IN NUMBER,
                               I_BU            IN NUMBER,
                               I_ISU           IN NUMBER,
                               I_FILE_DATE     IN VARCHAR2,
                               I_SHEET_NAME    IN VARCHAR2,
                               I_FLAG          IN VARCHAR2, ---===EXCEL/PPT
                               I_GRID_COUNT  IN NUMBER,
                               O_SHEET_HEADER  OUT SYS_REFCURSOR,
                               O_SHEET_DATA    OUT SYS_REFCURSOR,
                               O_DATA_TYPE     OUT SYS_REFCURSOR,
                               O_SLIDE_TITLE   OUT VARCHAR2,
                               O_SLIDE_FOOTER  OUT VARCHAR2,
                               O_WEEK          OUT VARCHAR2) is
  
----PROCEDURE SP_WSR_SUMMARY_SHEET() IS

  -----====for excel and ppt                                                  
  V_CURR_QTR      VARCHAR2(1000);
  V_HEADER_SMP     VARCHAR2(1000);
  V_PRV_QTR       VARCHAR2(1000);
  QRY             CLOB;
  V_PLAN          VARCHAR2(1000);
  V_CORP_PLAN     VARCHAR2(1000);
  V_DATE          DATE;
  V_CURR_MONTH    VARCHAR2(1000);
  V_CURR_QTR_TEMP VARCHAR2(1000);
  V_FIRST_DATE DATE;
  V_FIRST_DAY VARCHAR2(4000);
v_bu VARCHAR2(4000);
  V_PREV_WEEK    DATE;
  V_SMP_COND     VARCHAR(2000);
    V_SMP_HEADER     VARCHAR(2000);
  V_CNT          NUMBER;
  V_BG_SWON_COST NUMBER;
  V_APPEND VARCHAR2(2000);
  V_HEADER_DATE  VARCHAR2(1000);
  V_AOP           VARCHAR2(1000);
  V_HEADER       VARCHAR2(1000);
  V_COLOUR_CODE1 VARCHAR2(1000);
  V_COLOUR_CODE2 VARCHAR2(1000);
  V_COLOUR_CODE3 VARCHAR2(1000);
  V_COLOUR_CODE4 VARCHAR2(1000);
  V_COLOUR_CODE5 VARCHAR2(1000);
  V_COLOUR_CODE6 VARCHAR2(1000);
  V_INDIC        VARCHAR2(1000);
  V_INDIC1       VARCHAR2(1000);
  V_INDIC2       VARCHAR2(1000);
  V_INDIC3       VARCHAR2(1000);
  V_INDIC4       VARCHAR2(1000);
  V_INDIC5       VARCHAR2(1000);
  V_CHK_CURR_QTR VARCHAR2(1000);
  V_DATA_COLOUR1 VARCHAR2(1000);
  V_DATA_COLOUR2 VARCHAR2(1000);
  V_DATA         VARCHAR2(5000);
  V_HDR1         VARCHAR2(4000);
  V_FILE_DATE  VARCHAR2(4000);
  V_HDR2         VARCHAR2(4000);
  V_HC_COL       VARCHAR2(2000);
  v_hdr_3 VARCHAR2(1000);


V_HEADER_DATE_4 varchar2(4000);
BEGIN

  INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
  VALUES
    (I_LOGGED_EMP_ID,
     SYSDATE,
     'PKG_WSR_UPLOAD.SP_WSR_PPT_ATTACHMENT',
     I_LOGGED_EMP_ID || '-I_LOGGED_EMP_ID ' || I_COORPORATE ||
     ' -I_COORPORATE ' || I_BU || '-I_BU ' || I_ISU || '-I_ISU ' ||
     I_FILE_DATE || '-I_FILE_DATE ' || I_SHEET_NAME || ' -I_SHEET_NAME ',
     '',
     '',
     '');

  COMMIT;
  
  SELECT  MAX(T.FILE_DATE) INTO V_FILE_DATE
                          FROM BTG_WKLY_PL_tgt T;
                         
  


  ----===used for calculating bg cm%   
 ---- V_BG_SWON_COST := 10.8778;

  PKG_btg_WSR_download.SP_WEEKLY_FILE_DATE(TO_DATE(I_FILE_DATE,
                                                       'DD/MM/RRRR'),
                                               V_DATE,
                                               V_CURR_MONTH,
                                               V_CURR_QTR_TEMP);

  V_CURR_QTR := FN_FETCH_QTR(TRIM(V_DATE));
  V_PRV_QTR  := FN_FETCH_PRV_QTR(TRIM(V_DATE));

  QRY := 'SELECT SUBSTR(''' || V_CURR_QTR ||
         ''',1,2)||'' ''||Q''<->''||SUBSTR(''' || V_CURR_QTR ||
         ''',-2,2)||'' Plan'' FROM DUAL';
  EXECUTE IMMEDIATE QRY
    INTO V_PLAN;

  QRY := 'SELECT SUBSTR(''' || V_CURR_QTR ||''',1,2)||'' ''||Q''<->''||SUBSTR(''' || V_CURR_QTR ||''',-2,2)||'' Corp Plan'' FROM DUAL';
  EXECUTE IMMEDIATE QRY
    INTO V_CORP_PLAN;
    
     QRY:='SELECT SUBSTR('''||V_CURR_QTR||''',1,2)||'' ''||Q''<->''||SUBSTR('''||V_CURR_QTR||''',-2,2)||'' AOP/Target'' FROM DUAL'; 
   EXECUTE IMMEDIATE QRY INTO V_AOP;

  QRY := 'SELECT SUBSTR(''' || V_CURR_QTR ||''',1,2)||'' ''||Q''<''>''||SUBSTR(''' || V_CURR_QTR ||''',-2,2) FROM DUAL';
  EXECUTE IMMEDIATE QRY
    INTO V_HEADER;

  SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE, 'DD/MM/RRRR')) + INTERVAL '3' DAY,'Mon-dd') AS NEXT_MON_HEADER
    INTO V_HEADER_DATE
    FROM DUAL;

if i_bu = 21 then
  
v_bu := ' BTG';
  
elsif i_bu = 22 then
  v_bu := ' EGG';
end if;

/*
  IF V_BU = ' BTG' THEN
     
   V_APPEND := '(BTG)';
     
   ELSIF V_BU = ' EGG' THEN
     
    V_APPEND := '(EGG)';
     
   END IF;*/
   
 
   
    IF I_ISU = 0 OR I_ISU IS NULL THEN
        V_SMP_COND:='';
        V_SMP_HEADER:='BTG Weekly Report - Summary';
         V_APPEND:='(BTG)';

      ELSE
        V_SMP_COND:= 'AND IOU_ID = '||I_ISU||'';
        V_SMP_HEADER:=''||V_HEADER_SMP||' '||' Weekly Report - Summary';
               V_APPEND:=''||V_HEADER_SMP||'';
               
               SELECT  DISTINCT initcap(substr(t.iou_short_name,instr(t.iou_short_name,'BTG-')+4)) INTO V_HEADER_SMP FROM NEW_BTG_ACCOUNT_MAPPING T WHERE T.IOU_ID = I_ISU;
   
      END IF; 

  IF REPLACE(UPPER(I_SHEET_NAME), ' ', '') LIKE 'SUMMARYSTATUS%' THEN
 -- BEGIN
   QRY := 'SELECT FILE_DATE 
          FROM (SELECT FILE_DATE, ROWNUM RN
                  FROM (SELECT DISTINCT T.FILE_DATE
                          FROM BTG_WKLY_PL_tgt T
                         ORDER BY T.FILE_DATE DESC)
                )
         WHERE RN = 2';
  
    EXECUTE IMMEDIATE QRY
      INTO V_PREV_WEEK;
      
      --EXCEPTION WHEN OTHERS THEN
        
--V_PREV_WEEK := TO_DATE(V_PREV_WEEK,'MM/DD/YYYY');

        
     
      
      SELECT
to_char(TRUNC(TO_dATE(V_DATE,'DD-MON-RR'), 'Q'),'DAY'),
TRUNC(TO_dATE(V_DATE,'DD-MON-RR'), 'Q')
INTO V_FIRST_DAY,V_FIRST_DATE
FROM DUAL;
IF UPPER(TRIM(V_FIRST_DAY)) = 'FRIDAY' THEN 
  V_FIRST_DATE := V_FIRST_DATE + 2;
  ELSIF TRIM(V_FIRST_DAY) = 'SATURDAY' THEN 
  V_FIRST_DATE := V_FIRST_DATE + 1;
    ELSIF TRIM(V_FIRST_DAY) = 'SUNDAY' THEN 
  V_FIRST_DATE := V_FIRST_DATE;
   ELSIF TRIM(V_FIRST_DAY) = 'MONDAY' THEN 
  V_FIRST_DATE := V_FIRST_DATE + 6;
   ELSIF TRIM(V_FIRST_DAY) = 'TUESDAY' THEN 
  V_FIRST_DATE := V_FIRST_DATE + 5;
   ELSIF TRIM(V_FIRST_DAY) = 'WEDNESDAY' THEN 
  V_FIRST_DATE := V_FIRST_DATE + 4;
  ELSIF TRIM(V_FIRST_DAY) = 'THURSDAY' THEN 
  V_FIRST_DATE := V_FIRST_DATE + 3;
  END IF;
      

  SELECT SUBSTR(TO_CHAR(TRUNC(TO_DATE(V_DATE, 'DD/MM/RRRR')) + INTERVAL '3' DAY,
                          'Mon-dd'),
                  5,
                  2) || '-' ||
           SUBSTR(TO_CHAR(TRUNC(TO_DATE(V_DATE, 'DD/MM/RRRR')) + INTERVAL '3' DAY,
                          'Mon-dd'),
                  1,
                  3) AS NEXT_MON_HEADER
      INTO V_HEADER_DATE_4
      FROM DUAL;
  
 ---  V_CHK_CURR_QTR := FN_FETCH_QTR(TRIM(V_PREV_WEEK)); ---COMMENTING TEMPORARILY FOR NEW ORG STRUCTURE BY 1597908
   
   -- V_CHK_CURR_QTR := FN_FETCH_QTR(TRIM(SYSDATE));

  
    ---------========FOR PPT
    IF UPPER(I_FLAG) LIKE '%PPT%' THEN
 
   
      V_COLOUR_CODE1 := '^#BE0046';
      V_COLOUR_CODE2 := '^#005B9C';
      V_COLOUR_CODE3 := '^#E95001';
      V_DATA_COLOUR1 := '~#FEFEDB';
      V_DATA_COLOUR2 := '~#EDE7FF';
     IF V_DATE <> V_FIRST_DATE THEN 
      ------======indicators====-------
      V_INDIC  := '!\u25BC!#FF0000'; --====downward triangle
      V_INDIC1 := '!\u25B2!#77dd77'; ---==upward triangle
      V_INDIC2 := '!\u25CF!#FFA500'; ---==circle
      
      -----=======boc---==down-green
      V_INDIC3 := '!\u25BC!#77dd77';
      V_INDIC4 := '!\u25B2!#FF0000';
      V_INDIC5 := '!\u25CF!#FFA500'; ---==circle
      end if;
    
      V_COLOUR_CODE4 := '!#BE0046';
      V_COLOUR_CODE5 := '!#005B9C';
      V_COLOUR_CODE6 := '!#E95001';
    
    ----data type
      
      OPEN O_DATA_TYPE FOR
      SELECT '' FROM DUAL;
      
  
    ---===if current week and previous week are not in same qtr
    ---===then prev week column should not be shown in grid data and header  
    IF V_DATE <> V_FIRST_DATE THEN
    
      O_SLIDE_FOOTER := 'NOTE:Indicators are based on previous week plans
      *- Current week WSR is not submitted,So Previous Week WSR Data is populated in Current week.';
      
            O_WEEK := 'WEEK1###' || V_HEADER || ' WSR###' || V_HEADER_DATE_4 || '';
            
            

    
    ---  O_WEEK := 'OTHERS###' || V_HEADER || ' WSR###' || V_HEADER_DATE_4 || '';--COMMENTED TEMPORARLY BY 1597908 FOR NEW_ORG_STRUCTURE
    
    IF I_GRID_COUNT = 1 THEN
    
    /*  V_HDR1 := '\*''REVENUE' || V_COLOUR_CODE2 || ''',
           ''REVENUE' || V_COLOUR_CODE2 || ''',
         ''REVENUE' || V_COLOUR_CODE2 || ''',
         ''$$$$'',*\
         ''Inc HC' || V_COLOUR_CODE3 || ''',
         ''Inc HC' || V_COLOUR_CODE3 || ''',
         ''Inc HC' || V_COLOUR_CODE3 || ''',
         ''$$$$'',
         ''GM' || V_COLOUR_CODE2 || ''',
         ''GM' || V_COLOUR_CODE2 || ''',
         ''GM' || V_COLOUR_CODE2 || ''',
         ''$$$$'',
         ''TCV' || V_COLOUR_CODE3 || ''',
         ''TCV' || V_COLOUR_CODE3 || ''',
         ''TCV' || V_COLOUR_CODE3 || '''';
    
      V_HDR2 := ' ----===revenue
       \*''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''$$$$'',*\
       ---===hc
       ''WFP' || V_COLOUR_CODE3 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''$$$$'',
       ---===CM
       ''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''$$$$'',
      ---===TCV
       ''Revised Target' || V_COLOUR_CODE3 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || '''';*/
             V_HDR1 := '/*''REVENUE' || V_COLOUR_CODE2 || ''',
           ''REVENUE' || V_COLOUR_CODE2 || ''',
         ''REVENUE' || V_COLOUR_CODE2 || ''',
         ''$$$$'',*/
         
         
         ''Inc HC' || V_COLOUR_CODE3 || ''',
         ''Inc HC' || V_COLOUR_CODE3 || ''',
         ''Inc HC' || V_COLOUR_CODE3 || ''',
           ''Inc HC' || V_COLOUR_CODE3 || ''',
             ''Inc HC' || V_COLOUR_CODE3 || ''',
               ''Inc HC' || V_COLOUR_CODE3 || ''',
                 ''Inc HC' || V_COLOUR_CODE3 || ''',
         ''$$$$'',
         ''GM' || V_COLOUR_CODE2 || ''',
         ''GM' || V_COLOUR_CODE2 || ''',
         ''GM' || V_COLOUR_CODE2 || ''',
         ''$$$$'',
         ''TCV' || V_COLOUR_CODE3 || ''',
         ''TCV' || V_COLOUR_CODE3 || ''',
         ''TCV' || V_COLOUR_CODE3 || '''';
    
      V_HDR2 := ' ----===revenue
       /*''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE2 || ''',
       
       
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''$$$$'',*/
       ---===hc
       ''WFP' || V_COLOUR_CODE3 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''$$$$'',
       ---===CM
       ''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''$$$$'',
      ---===TCV
       ''Revised Target' || V_COLOUR_CODE3 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || '''';
       v_hdr_3 := '
       ---HC
       ''WFP' || V_COLOUR_CODE3 || ''',
       ''OFF'|| V_COLOUR_CODE3 || ''',
       ''ON'|| V_COLOUR_CODE3 || ''',
       ''TOTAL'|| V_COLOUR_CODE3 || ''',
       ''OFF'|| V_COLOUR_CODE3 || ''',
       ''ON'|| V_COLOUR_CODE3 || ''',
       ''TOTAL'|| V_COLOUR_CODE3 || ''',

        ''$$$$'',
       ---===CM
       ''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''$$$$'',
      ---===TCV
       ''Revised Target' || V_COLOUR_CODE3 || ''',
       ''Prev. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || '''';
        O_SLIDE_TITLE := '' || V_HEADER || ' '||V_SMP_HEADER||'  (' ||V_HEADER_DATE_4 || ')'||'##'||V_APPEND||'';

          ------====Data
 /*QRY := 'SELECT CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
       CASE WHEN MOD(ROWNUM,2) = 0 ---=====to give colour code for alternate rows
       AND UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
       ACC_NAME||''' || V_DATA_COLOUR1 || '''
       ELSE
       ACC_NAME||''' || V_DATA_COLOUR2 || '''
       END
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
       ACC_NAME||''' || V_COLOUR_CODE1 || ''' 
       END ACC_NAME,A,
      \* S.CUR_QTR_REV_TOTAL_CORP,
       S.PRV_WK_REV_TOTAL_PLAN,
       S.CUR_WK_REV_TOTAL_PLAN,B,*\
       S.Cur_Qtr_Hc_Inc_Corp,
       S.PRV_WK_HC_INC_PLAN,
S.CUR_WK_HC_INC_PLAN,C,
S.CUR_QTR_CM_PRCNT_AOP,
S.PRV_WK_CM_PRCNT_PLAN,
S.CUR_WK_CM_PRCNT_PLAN,


D,
S.CUR_QTR_TCV_CORP,
S.PRV_WK_TCV_PLAN,
S.CUR_WK_TCV_PLAN
 
FROM 
 (SELECT  ACC_NAME ,
 ''$$$$'' A ,
 
-- NVL(CUR_QTR_REV_TOTAL_CORP,''-''),
-- NVL(PRV_WK_REV_TOTAL_PLAN,''-''),
-- NVL(CUR_WK_REV_TOTAL_PLAN,''-''),
 
 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
          F_PPT(CUR_QTR_REV_TOTAL_CORP,''V13'')||''' || V_COLOUR_CODE2 || '''
        ELSE
            F_PPT(CUR_QTR_REV_TOTAL_CORP,''V13'')||''''
        END CUR_QTR_REV_TOTAL_CORP,
        
       \*    case WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
       F_PPT(CUR_QTR_REV_TOTAL_AOP,''V13'')||'''  || V_COLOUR_CODE2 || '''
       else
           F_PPT(CUR_QTR_REV_TOTAL_AOP,''V13'')
         end CUR_QTR_REV_TOTAL_AOP,*\
        
        
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
           F_PPT(PRV_WK_REV_TOTAL_PLAN,''V13'')||''' || V_COLOUR_CODE2 || '''
        ELSE
          F_PPT(PRV_WK_REV_TOTAL_PLAN,''V13'')||''''
        END PRV_WK_REV_TOTAL_PLAN,
        
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
            CASE WHEN   NVL(PRV_WK_REV_TOTAL_PLAN,0) = 0
                THEN   F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')  
        WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) > CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')||''' || V_INDIC || '''
         WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) < CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')||''' || V_INDIC1 || '''
         WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) = CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')||''' || V_INDIC2 || '''
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
            CASE WHEN   NVL(PRV_WK_REV_TOTAL_PLAN,0) = 0
                THEN   F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'') ||''' || V_COLOUR_CODE2 || '''
        WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) > CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')||''' || V_INDIC || V_COLOUR_CODE5 || '''
         WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) < CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')||''' || V_INDIC1 || V_COLOUR_CODE5 || '''
         WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) = CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')||''' || V_INDIC2 || V_COLOUR_CODE5 || '''
        END
       END CUR_WK_REV_TOTAL_PLAN,
 
 ''$$$$'' B ,
 ----NVL(T.Cur_Qtr_Hc_Inc_Corp,''-''),
 ----NVL(T.PRV_WK_HC_INC_PLAN,''-''),
---NVL(T.CUR_WK_HC_INC_PLAN,''-''),

 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
          F_PPT(Cur_Qtr_Hc_Inc_Corp,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
         F_PPT(Cur_Qtr_Hc_Inc_Corp,''COMMA'')||''''
         END Cur_Qtr_Hc_Inc_Corp,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
         F_PPT(PRV_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
        F_PPT(PRV_WK_HC_INC_PLAN,''COMMA'')||''''
         END PRV_WK_HC_INC_PLAN,  
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
           CASE WHEN NVL(PRV_WK_HC_INC_PLAN,0) = 0 THEN  F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
        WHEN NVL(PRV_WK_HC_INC_PLAN,0) > CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) < CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC1 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) = CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC2 || '''
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
          CASE WHEN NVL(PRV_WK_HC_INC_PLAN,0) = 0 THEN  F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
        WHEN NVL(PRV_WK_HC_INC_PLAN,0) > CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC || V_COLOUR_CODE6 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) < CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC1 || V_COLOUR_CODE6 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) = CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC2 || V_COLOUR_CODE6 || '''
       END   
       END CUR_WK_HC_INC_PLAN,


''$$$$'' C ,
---NVL(T.CUR_QTR_CM_PRCNT_AOP,''-''),
---NVL(T.PRV_WK_CM_PRCNT_PLAN,''-''),
---NVL(T.CUR_WK_CM_PRCNT_PLAN,''-''),

 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
         \*case when  f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'') = ''0'' then
           ''''||''' || V_COLOUR_CODE2 || '''
         else
       -----   ''''||''' || V_COLOUR_CODE2 || '''
        f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         end *\
         ''-''||''' || V_COLOUR_CODE2 || '''
         ELSE
           case when  f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'') = ''0'' then
           ''-''
           else
         
          f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''
          end
        END CUR_QTR_CM_PRCNT_AOP,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
            \*case when  f_ppt(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
              ''''||''' || V_COLOUR_CODE2 || '''
            else
              
       ---- ''''||  ''' || V_COLOUR_CODE2 || '''

         F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'')||''%''||  ''' || V_COLOUR_CODE2 || '''
         end*\
         ''-''||''' || V_COLOUR_CODE2 || '''
         ELSE
          case when  f_ppt(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
          ''-''
          else
            F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'')||''%''
            end
        END PRV_WK_CM_PRCNT_PLAN,
        
        CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
        \*case when  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
         ''''||''' || V_COLOUR_CODE2 || '''
        else
        -----   ''''||  ''' || V_COLOUR_CODE2 || '''
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         end*\
      
         
        \* CASE WHEN NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = 0 THEN 
           F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
          WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) > TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC || V_COLOUR_CODE5 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) < TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC1 || V_COLOUR_CODE5 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         
         
          CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''-'' AND F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''-'' THEN
          F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') ||''%''||'''||V_COLOUR_CODE5||'''
         ELSE
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC2 || V_COLOUR_CODE5 ||  '''
        END
           ---- F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''' || V_INDIC2 || V_COLOUR_CODE5 || '''
       END*\
       ''-''||''' || V_COLOUR_CODE2 || '''
         
         
         
 
         ELSE
         
         case when  F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
        CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''0'' THEN
             ''-''---- F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')
           ELSE
              F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
           END
       WHEN   
       NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) > TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
             F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC || '''
             
          WHEN NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) < TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC1 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
           
         CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''-'' 
           AND F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''-'' THEN
          F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')
         ELSE
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC2 || '''
        END
       END       

       
       
       
        \* else
           F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
           end*\
        END CUR_WK_CM_PRCNT_PLAN,




''$$$$'' D ,
----NVL(T.CUR_QTR_TCV_CORP,''-''),
----NVL(T.PRV_WK_TCV_PLAN,''-''),
----NVL(T.CUR_WK_TCV_PLAN,''-'')


 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
         F_PPT(CUR_QTR_TCV_CORP,''V13'')||''' || V_COLOUR_CODE3 || '''
         ELSE
       F_PPT(CUR_QTR_TCV_CORP,''V13'')||''''
        END CUR_QTR_TCV_CORP,
        
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
       F_PPT(PRV_WK_TCV_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
        F_PPT(PRV_WK_TCV_PLAN,''COMMA'')||''''
        END PRV_WK_TCV_PLAN,
        
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN 
          CASE WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = 0 
            THEN F_PPT(CUR_WK_TCV_PLAN,''COMMA'')
        WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) > TO_NUMBER(CUR_WK_TCV_PLAN) THEN
      F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC || '''
         WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) < TO_NUMBER(CUR_WK_TCV_PLAN) THEN
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC1 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = TO_NUMBER(CUR_WK_TCV_PLAN) THEN
           
         CASE WHEN  F_PPT(CUR_WK_TCV_PLAN,''V13'') = ''-'' 
           AND F_PPT(PRV_WK_TCV_PLAN,''V13'') = ''-'' THEN
          F_PPT(CUR_WK_TCV_PLAN,''COMMA'')
         ELSE
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC2 || '''
        END
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
          CASE WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = 0 THEN 
            F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
          WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) > TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC || V_COLOUR_CODE6 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) < TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC1 || V_COLOUR_CODE6 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         
         
          CASE WHEN  F_PPT(CUR_WK_TCV_PLAN,''V13'') = ''-'' AND F_PPT(PRV_WK_TCV_PLAN,''V13'') = ''-'' THEN
          F_PPT(CUR_WK_TCV_PLAN,''COMMA'') ||'''||V_COLOUR_CODE6||'''
         ELSE
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC2 || V_COLOUR_CODE6 ||  '''
        END
         
     
         
       ---- F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC2 || V_COLOUR_CODE6 || '''
       END
       END CUR_WK_TCV_PLAN



FROM(SELECT ZZ.ACC_NAME,
ZZ.CUR_QTR_REV_TOTAL_CORP,
ZZ.PRV_WK_REV_TOTAL_PLAN,
ZZ.CUR_WK_REV_TOTAL_PLAN,
ZZ.Cur_Qtr_Hc_Inc_Corp,
ZZ.PRV_WK_HC_INC_PLAN,
ZZ.CUR_WK_HC_INC_PLAN,
ZZ.CUR_QTR_CM_PRCNT_AOP,

 zz.PRV_WK_CM_PRCNT_PLAN,
  
  zz.CUR_WK_CM_PRCNT_PLAN,
  

ROUND(CUR_QTR_TCV_CORP) CUR_QTR_TCV_CORP,
ROUND(PRV_WK_TCV_PLAN) PRV_WK_TCV_PLAN,
ROUND(CUR_WK_TCV_PLAN)CUR_WK_TCV_PLAN
 FROM( SELECT NVL(ACC_NAME,''Total'')ACC_NAME,
SUM(CUR_QTR_REV_TOTAL_CORP)CUR_QTR_REV_TOTAL_CORP,
SUM(PRV_WK_REV_TOTAL_PLAN)PRV_WK_REV_TOTAL_PLAN,
SUM(NVL(CUR_WK_REV_TOTAL_PLAN,PRV_WK_REV_TOTAL_PLAN))CUR_WK_REV_TOTAL_PLAN,
SUM(Cur_Qtr_Hc_Inc_Corp)Cur_Qtr_Hc_Inc_Corp,
SUM(PRV_WK_HC_INC_PLAN)PRV_WK_HC_INC_PLAN,
SUM(NVL(CUR_WK_HC_INC_PLAN,PRV_WK_HC_INC_PLAN))CUR_WK_HC_INC_PLAN,
SUM(CUR_QTR_CM_PRCNT_AOP)CUR_QTR_CM_PRCNT_AOP,


case when acc_name is null then 
   sum(prev_gm_total)
   else SUM(PREV_QTR_PLAN_GM)
     end PRV_WK_CM_PRCNT_PLAN,
     
  case when acc_name is null then 
   sum(NVL(curr_gm_total,prev_gm_total))
else
SUM(NVL(CURR_QTR_PLAN_GM,PREV_QTR_PLAN_GM))
end CUR_WK_CM_PRCNT_PLAN,


SUM(CUR_QTR_TCV_CORP)CUR_QTR_TCV_CORP,
SUM(PRV_WK_TCV_PLAN)PRV_WK_TCV_PLAN,
SUM(NVL(CURR_WK_TCV_PLAN,PRV_WK_TCV_PLAN)) CUR_WK_TCV_PLAN
FROM(







SELECT CASE WHEN K.FILE_UPLOADED = ''N''
 

THEN ACC_NAME||''*''

 ELSE
ACC_NAME end acc_name,

\*CASE WHEN C.CURR_QTR_PLAN_REV = 0 or C.CURR_QTR_PLAN_REV is null AND B.PREV_QTR_PLAN_REV <> 0  
THEN ACC_NAME||''*''*\

\* ELSE
ACC_NAME end acc_name,*\
E.CURR_QTR_REV_AOP_REV CUR_QTR_REV_TOTAL_CORP,
B.PREV_QTR_PLAN_REV PRV_WK_REV_TOTAL_PLAN,
C.CURR_QTR_PLAN_REV CUR_WK_REV_TOTAL_PLAN,
E.CURR_QTR_REV_AOP_HC Cur_Qtr_Hc_Inc_Corp,
B.PREV_QTR_PLAN_HC PRV_WK_HC_INC_PLAN,
C.CURR_QTR_PLAN_HC CUR_WK_HC_INC_PLAN,
E.CURR_QTR_REV_AOP_GM CUR_QTR_CM_PRCNT_AOP,


 
   b.prev_gm_total prev_gm_total,
 B.PREV_QTR_PLAN_GM PREV_QTR_PLAN_GM,
    
     
 
  c.curr_gm_total curr_gm_total,

C.CURR_QTR_PLAN_GM CURR_QTR_PLAN_GM,



E.CURR_QTR_REV_AOP_TCV CUR_QTR_TCV_CORP,
B.PREV_QTR_PLAN_TCV PRV_WK_TCV_PLAN,
C.CURR_QTR_PLAN_TCV CURR_WK_TCV_PLAN
FROM (
(select distinct b.account_id,b.SHORT_NAME ACC_NAME from new_btg_account_mapping b
WHERE 1=1 \*B.IOU_ID <> 263*\  '||V_SMP_COND||'
order by SHORT_NAME asc)A
LEFT OUTER JOIN
(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)PREV_QTR_PLAN_REV,SUM(T.INCR_HC)PREV_QTR_PLAN_HC,SUM(T.CM_MARGIN)PREV_QTR_PLAN_GM,
SUM(T.TCV_BMN_USD)PREV_QTR_PLAN_TCV,sum((1- (CM_MARGIN/100))*TOTAL_REV)PREV_gm_total
FROM BTG_WKLY_PL_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%OUTLOOK%''
AND T.FILE_DATE = (select max(t.file_date) from btg_wkly_pl_tgt t where t.file_date < '''||V_FILE_DATE||''')
GROUP BY ACCOUNT_ID)B
ON A.ACCOUNT_ID = B.ACCOUNT_ID

LEFT OUTER JOIN

(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)CURR_QTR_PLAN_REV,SUM(T.INCR_HC)CURR_QTR_PLAN_HC,SUM(T.CM_MARGIN)CURR_QTR_PLAN_GM,
SUM(T.TCV_BMN_USD)CURR_QTR_PLAN_TCV,sum((1- (CM_MARGIN/100))*TOTAL_REV)curr_gm_total
FROM BTG_WKLY_PL_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%OUTLOOK%''
AND T.FILE_DATE = ''' || V_DATE || '''
GROUP BY ACCOUNT_ID)C
ON A.ACCOUNT_ID = C.ACCOUNT_ID



LEFT OUTER JOIN

(SELECT N.ACCOUNT_ID,SUM(N.TOTAL_REV)CURR_QTR_REV_AOP_REV,SUM(N.INCR_HC)CURR_QTR_REV_AOP_HC,SUM(N.CM_MARGIN)CURR_QTR_REV_AOP_GM,
SUM(N.TCV_BMN_USD)CURR_QTR_REV_AOP_TCV,sum(N.CM_MARGIN)CURR_QTR_REV_AOP_CM
FROM BTG_WKLY_PL_PMO_TGT N
WHERE UPPER(N.PERIOD) LIKE ''%REVISED%''
AND N.QUATER=''' || V_CURR_QTR || '''
GROUP BY ACCOUNT_ID)  E
ON A.ACCOUNT_ID = E.ACCOUNT_ID

LEFT OUTER JOIN
(SELECT  distinct T.ACCOUNT_ID,MAX(t.FILE_UPLOADED) FILE_UPLOADED from wkly_rep_frz_unfrz_btg T 
WHERE 

 T.FILE_DATE =   '''||V_DATE||'''
GROUP BY ACCOUNT_ID )K
ON A.ACCOUNT_ID = K.ACCOUNT_ID


)

)
GROUP BY ROLLUP(ACC_NAME))ZZ

)
order by case when acc_name <> ''Total'' then ''1'' else ''2'' end
)S';
*/

QRY := ' SELECT CASE WHEN FILE_UPLOADED = ''Y'' THEN ACC_NAME ELSE replace(ACC_NAME,''~'',''*~'') END ACC_NAME,''$$$$'' B ,
Cur_Qtr_Hc_Inc_Corp,
 PREV_OFF_TOTAL,PREV_ON_TOTAL,PRV_WK_HC_INC_PLAN,cur_ofF_total,cur_ON_total,
 CUR_WK_HC_INC_PLAN,


''$$$$'' C ,CUR_QTR_CM_PRCNT_AOP,
PRV_WK_CM_PRCNT_PLAN,
CUR_WK_CM_PRCNT_PLAN,




''$$$$'' D ,
CUR_QTR_TCV_CORP,PRV_WK_TCV_PLAN,CUR_WK_TCV_PLAN FROM 
 
 
 
 
 
 (SELECT A.*,B.ACCOUNT_NAME,B.FILE_UPLOADED FROM (SELECT  ACC_NAME ,
 ''$$$$'' A ,
 

 
 ''$$$$'' B ,
 ----NVL(T.Cur_Qtr_Hc_Inc_Corp,''-''),
 ----NVL(T.PRV_WK_HC_INC_PLAN,''-''),
---NVL(T.CUR_WK_HC_INC_PLAN,''-''),

 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
          F_PPT(Cur_Qtr_Hc_Inc_Corp,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
         F_PPT(Cur_Qtr_Hc_Inc_Corp,''COMMA'')||''''
         END Cur_Qtr_Hc_Inc_Corp,
         CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN F_PPT(PREV_OFF_TOTAL,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
           F_PPT(PREV_OFF_TOTAL,''COMMA'')
           END PREV_OFF_TOTAL,
                  CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN F_PPT(PREV_ON_TOTAL,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
            F_PPT(PREV_ON_TOTAL,''COMMA'')
           END PREV_ON_TOTAL,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
         F_PPT(PRV_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
        F_PPT(PRV_WK_HC_INC_PLAN,''COMMA'')||''''
         END PRV_WK_HC_INC_PLAN,  
                  CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN F_PPT(CUR_OFF_TOTAL,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
           F_PPT(CUR_OFF_TOTAL,''COMMA'')
           END CUR_OFF_TOTAL,
          CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN F_PPT(CUR_ON_TOTAL,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
            F_PPT(CUR_ON_TOTAL,''COMMA'')
           END CUR_ON_TOTAL,
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
           CASE WHEN NVL(PRV_WK_HC_INC_PLAN,0) = 0 THEN  F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
        WHEN NVL(PRV_WK_HC_INC_PLAN,0) > CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) < CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC1 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) = CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC2 || '''
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
          CASE WHEN NVL(PRV_WK_HC_INC_PLAN,0) = 0 THEN  F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
        WHEN NVL(PRV_WK_HC_INC_PLAN,0) > CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC || V_COLOUR_CODE6 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) < CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC1 || V_COLOUR_CODE6 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) = CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_INDIC2 || V_COLOUR_CODE6 || '''
        
       END   
       END CUR_WK_HC_INC_PLAN,


''$$$$'' C ,
---NVL(T.CUR_QTR_CM_PRCNT_AOP,''-''),
---NVL(T.PRV_WK_CM_PRCNT_PLAN,''-''),
---NVL(T.CUR_WK_CM_PRCNT_PLAN,''-''),

 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
         /*case when  f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'') = ''0'' then
           ''''||''' || V_COLOUR_CODE2 || '''
         else
       -----   ''''||''' || V_COLOUR_CODE2 || '''
        f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         end */
         ''-''||''' || V_COLOUR_CODE2 || '''
         ELSE
           case when  f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'') = ''0'' then
           ''-''
           else
         
          f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''
          end
        END CUR_QTR_CM_PRCNT_AOP,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
            /*case when  f_ppt(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
              ''''||''' || V_COLOUR_CODE2 || '''
            else
              
       ---- ''''||  ''' || V_COLOUR_CODE2 || '''

         F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'')||''%''||  ''' || V_COLOUR_CODE2 || '''
         end*/
         ''-''||''' || V_COLOUR_CODE2 || '''
         ELSE
          case when  f_ppt(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
          ''-''
          else
            F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'')||''%''
            end
        END PRV_WK_CM_PRCNT_PLAN,
        
        CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
        /*case when  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
         ''''||''' || V_COLOUR_CODE2 || '''
        else
        -----   ''''||  ''' || V_COLOUR_CODE2 || '''
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         end*/
      
         
        /* CASE WHEN NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = 0 THEN 
           F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
          WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) > TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC || V_COLOUR_CODE5 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) < TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC1 || V_COLOUR_CODE5 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         
         
          CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''-'' AND F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''-'' THEN
          F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') ||''%''||'''||V_COLOUR_CODE5||'''
         ELSE
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC2 || V_COLOUR_CODE5 ||  '''
        END
           ---- F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''' || V_INDIC2 || V_COLOUR_CODE5 || '''
       END*/
       ''-''||''' || V_COLOUR_CODE2 || '''
         
         
         
 
         ELSE
         
         case when  F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
        CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''0'' THEN
             ''-''---- F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')
           ELSE
              F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
           END
       WHEN   
       NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) > TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
             F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC || '''
             
          WHEN NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) < TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC1 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
           
         CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''-'' 
           AND F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''-'' THEN
          F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')
         ELSE
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC2 || '''
        END
       END       

       
       
       
        /* else
           F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
           end*/
        END CUR_WK_CM_PRCNT_PLAN,




''$$$$'' D ,
----NVL(T.CUR_QTR_TCV_CORP,''-''),
----NVL(T.PRV_WK_TCV_PLAN,''-''),
----NVL(T.CUR_WK_TCV_PLAN,''-'')


 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
         F_PPT(CUR_QTR_TCV_CORP,''V13'')||''' || V_COLOUR_CODE3 || '''
         ELSE
       F_PPT(CUR_QTR_TCV_CORP,''V13'')||''''
        END CUR_QTR_TCV_CORP,
        
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
       F_PPT(PRV_WK_TCV_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
        F_PPT(PRV_WK_TCV_PLAN,''COMMA'')||''''
        END PRV_WK_TCV_PLAN,
        
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN 
          CASE WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = 0 
            THEN F_PPT(CUR_WK_TCV_PLAN,''COMMA'')
        WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) > TO_NUMBER(CUR_WK_TCV_PLAN) THEN
      F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC || '''
         WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) < TO_NUMBER(CUR_WK_TCV_PLAN) THEN
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC1 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = TO_NUMBER(CUR_WK_TCV_PLAN) THEN
           
         CASE WHEN  F_PPT(CUR_WK_TCV_PLAN,''V13'') = ''-'' 
           AND F_PPT(PRV_WK_TCV_PLAN,''V13'') = ''-'' THEN
          F_PPT(CUR_WK_TCV_PLAN,''COMMA'')
         ELSE
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC2 || '''
        END
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
          CASE WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = 0 THEN 
            F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
          WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) > TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC || V_COLOUR_CODE6 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) < TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC1 || V_COLOUR_CODE6 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         
         
          CASE WHEN  F_PPT(CUR_WK_TCV_PLAN,''V13'') = ''-'' AND F_PPT(PRV_WK_TCV_PLAN,''V13'') = ''-'' THEN
          F_PPT(CUR_WK_TCV_PLAN,''COMMA'') ||'''||V_COLOUR_CODE6||'''
         ELSE
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC2 || V_COLOUR_CODE6 ||  '''
        END
         
     
         
       ---- F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC2 || V_COLOUR_CODE6 || '''
       END
       END CUR_WK_TCV_PLAN from (



  SELECT CASE WHEN ACCOUNT LIKE ''%Total%'' THEN A.ACCOUNT||''^#BE0046'' WHEN MOD(ROWNUM,2)=0 THEN A.ACCOUNT||''~#EDE7FF'' ELSE A.ACCOUNT||''~#FEFEDB'' END acc_name,
       A.WFP Cur_Qtr_Hc_Inc_Corp,
       A.PREV_OFF_TOTAL,
       A.PREV_ON_TOTAL,
       A.PREV_TOTAL PRV_WK_HC_INC_PLAN,
       A.CUR_OFF_TOTAL,
       A.CUR_ON_TOTAL,
       A.CUR_TOTAL  CUR_WK_HC_INC_PLAN,
       B.CURR_GM_AOP CUR_QTR_CM_PRCNT_AOP,
       B.PRV_WK_CM PRV_WK_CM_PRCNT_PLAN,
       B.CUR_WK_CM CUR_WK_CM_PRCNT_PLAN,
       B.CURR_TCV_AOP CUR_QTR_TCV_CORP,
       B.PRV_WK_TCV  PRV_WK_TCV_PLAN,
       B.CUR_WK_TCV CUR_WK_TCV_PLAN FROM
  (SELECT NVL(ACCOUNT,''Total'') ACCOUNT,
       SUM(WFP) WFP,
       SUM(PREV_OFF_TOTAL) PREV_OFF_TOTAL,
       SUM(PREV_ON_TOTAL) PREV_ON_TOTAL,
       SUM(PREV_TOTAL) PREV_TOTAL,
       SUM(CUR_OFF_TOTAL) CUR_OFF_TOTAL,
       SUM(CUR_ON_TOTAL) CUR_ON_TOTAL,
       SUM(CUR_TOTAL) CUR_TOTAL
       FROM
(SELECT (SELECT DISTINCT SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING M WHERE M.ACCOUNT_ID=B.ACCOUNT_ID) ACCOUNT,
       A.WFP,
       B.PREV_OFF_TOTAL,
       B.PREV_ON_TOTAL,
       B.PREV_TOTAL,
       B.CUR_OFF_TOTAL,
       B.CUR_ON_TOTAL,
       B.CUR_TOTAL
  FROM (SELECT ACCOUNT_ID, INCR_HC WFP
          FROM BTG_WKLY_PL_PMO_TGT
         WHERE QUATER = '''||V_CURR_QTR||'''
           AND PERIOD LIKE ''%Revised%''
                                                '||V_SMP_COND||') A
 RIGHT OUTER JOIN (SELECT A.ACCOUNT_ID,
                          PREV_OFF_TOTAL,
                          PREV_ON_TOTAL,
                          PREV_TOTAL,
                          CUR_OFF_TOTAL,
                          CUR_ON_TOTAL,
                          CUR_TOTAL
                     FROM (SELECT *
                             FROM (SELECT ACCOUNT_ID,
                                          CASE
                                            WHEN ON_OFF IS NULL THEN
                                             ''Total''
                                            ELSE
                                             ON_OFF
                                          END ON_OFF,
                                          CUR_QTR_INC
                                     FROM BTG_WSR_HC_TGT
                                    WHERE (ON_OFF LIKE ''%Total%'' OR
                                          ON_OFF IS NULL)
                                      AND PERIOD IN ('''||V_PREV_WEEK||''')
                                                                           '||V_SMP_COND||')
                           PIVOT(SUM(CUR_QTR_INC)
                              FOR ON_OFF IN(''Off Total'' as prev_off_total,
                                           ''On Total'' as prev_on_total,
                                           ''Total'' as prev_TOTAL))) A
                     JOIN (SELECT *
                            FROM (SELECT ACCOUNT_ID,
                                         CASE
                                           WHEN ON_OFF IS NULL THEN
                                            ''Total''
                                           ELSE
                                            ON_OFF
                                         END ON_OFF,
                                         CUR_QTR_INC
                                    FROM BTG_WSR_HC_TGT
                                   WHERE (ON_OFF LIKE ''%Total%'' OR
                                         ON_OFF IS NULL)
                                     AND PERIOD IN ('''||V_DATE||''')
                                     '||V_SMP_COND||'                                     )
                          PIVOT(SUM(CUR_QTR_INC)
                             FOR ON_OFF IN(''Off Total'' as CUR_off_total,
                                          ''On Total'' as CUR_on_total,
                                          ''Total'' as CUR_TOTAL))) B
                       ON A.ACCOUNT_ID = B.ACCOUNT_ID
                    ORDER BY ACCOUNT_ID) B
    ON A.ACCOUNT_ID = B.ACCOUNT_ID
ORDER BY ACCOUNT)
GROUP BY GROUPING SETS((ACCOUNT),())
ORDER BY CASE WHEN ACCOUNT = ''Total'' THEN ''ZZZZZZZ'' ELSE ACCOUNT END
) A LEFT OUTER JOIN (SELECT * FROM (SELECT ZZ.ACC_NAME,
--ZZ.CURR_REV_AOP,
--ZZ.PRV_WK_REV,
--ZZ.CUR_WK_REV,
ZZ.CURR_HC_AOP,
ZZ.PRV_WK_HC,
ZZ.CUR_WK_HC,
ZZ.CURR_GM_AOP,
 zz.PRV_WK_CM,
  

   zz.CUR_WK_CM,

ROUND(CURR_TCV_AOP) CURR_TCV_AOP,

ROUND(PRV_WK_TCV) PRV_WK_TCV,

ROUND(CUR_WK_TCV) CUR_WK_TCV
 FROM(SELECT NVL(A.ACC_NAME,''Total'')ACC_NAME,
SUM(C.CURR_QTR_REV_AOP_REV)CURR_REV_AOP,SUM(B.PREV_QTR_PLAN_REV)PRV_WK_REV,SUM(NVL(D.CURR_QTR_PLAN_REV,B.PREV_QTR_PLAN_REV))CUR_WK_REV,
SUM(C.CURR_QTR_REV_AOP_HC)CURR_HC_AOP,SUM(B.PREV_QTR_PLAN_HC)PRV_WK_HC,SUM(NVL(D.CURR_QTR_PLAN_HC,b.PREV_QTR_PLAN_HC))CUR_WK_HC,
SUM(C.CURR_QTR_REV_AOP_GM)CURR_GM_AOP,

CASE WHEN ACC_NAME IS NULL THEN
   0--SUM(B.PREV_GM_TOTAL)
   ELSE SUM(B.PREV_QTR_PLAN_GM)
     END PRV_WK_CM,
      CASE WHEN ACC_NAME IS NULL THEN
        0--SUM(D.CURR_GM_TOTAL)
ELSE
SUM(NVL(D.CURR_QTR_PLAN_GM,B.PREV_QTR_PLAN_GM))
END CUR_WK_CM,


SUM(C.CURR_QTR_REV_AOP_TCV)CURR_TCV_AOP,SUM(B.PREV_QTR_PLAN_TCV)PRV_WK_TCV,SUM(NVL(D.CURR_QTR_PLAN_TCV,B.PREV_QTR_PLAN_TCV)) CUR_WK_TCV
FROM ((select distinct b.account_id,b.SHORT_NAME ACC_NAME from new_btg_account_mapping b
WHERE 1=1 
 /* B.IOU_ID <> 263 */ '|| V_SMP_COND ||'

order by SHORT_NAME asc)A
LEFT OUTER JOIN
(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)PREV_QTR_PLAN_REV,SUM(T.INCR_HC)PREV_QTR_PLAN_HC,SUM(T.CM_MARGIN)PREV_QTR_PLAN_GM,
SUM(T.TCV_BMN_USD)PREV_QTR_PLAN_TCV,sum((1- (CM_MARGIN/100))*TOTAL_REV)PREV_gm_total
FROM BTG_WKLY_PL_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%OUTLOOK%''
AND T.FILE_DATE = (select max(t.file_date) from btg_wkly_pl_tgt t where t.file_date < '''||V_FILE_DATE||''')
GROUP BY ACCOUNT_ID)B
ON A.ACCOUNT_ID = B.ACCOUNT_ID

LEFT OUTER JOIN

(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)CURR_QTR_REV_AOP_REV,SUM(T.INCR_HC)CURR_QTR_REV_AOP_HC,SUM(T.CM_MARGIN)CURR_QTR_REV_AOP_GM,
SUM(T.TCV_BMN_USD)CURR_QTR_REV_AOP_TCV,sum(T.CM_MARGIN)CURR_QTR_REV_AOP_CM
FROM BTG_WKLY_PL_PMO_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%REVISED%''
AND T.QUATER='''||V_CURR_QTR||'''
GROUP BY ACCOUNT_ID)C
ON A.ACCOUNT_ID = C.ACCOUNT_ID

LEFT OUTER JOIN

(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)CURR_QTR_PLAN_REV,SUM(T.INCR_HC)CURR_QTR_PLAN_HC,SUM(T.CM_MARGIN)CURR_QTR_PLAN_GM,
SUM(T.TCV_BMN_USD)CURR_QTR_PLAN_TCV,sum((1- (CM_MARGIN/100))*TOTAL_REV)curr_gm_total
FROM BTG_WKLY_PL_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%OUTLOOK%''
AND T.FILE_DATE = '''||V_DATE||'''
GROUP BY ACCOUNT_ID)D
ON A.ACCOUNT_ID = D.ACCOUNT_ID


)
GROUP BY ROLLUP(ACC_NAME)
)ZZ

)order by case when acc_name <> ''Total'' then ''1'' else ''2'' end) B
ON A.ACCOUNT=B.ACC_NAME
ORDER BY CASE WHEN ACCOUNT = ''Total'' THEN ''ZZZZZZZ'' ELSE ACCOUNT END


)) A
left outer join (SELECT  distinct (SELECT DISTINCT SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING M WHERE M.ACCOUNT_ID = T.ACCOUNT_ID) ACCOUNT_NAME,MAX(t.FILE_UPLOADED) FILE_UPLOADED from wkly_rep_frz_unfrz_btg T 
WHERE 

 T.FILE_DATE =  '''||V_DATE||'''
GROUP BY ACCOUNT_ID ) b
on SUBSTR(a.ACC_NAME,0,INSTR(A.ACC_NAME,''~'')-1) = B.ACCOUNT_NAME)
ORDER BY CASE WHEN ACC_NAME LIKE ''%Total%'' THEN ''ZZZZZZZ'' ELSE ACC_NAME END
';
DELETE FROM HD_DUMMY;
COMMIT;
INSERT INTO HD_DUMMY VALUES (QRY);
COMMIT;
                   OPEN O_SHEET_DATA FOR QRY;
       
    
    
      
    END IF;
    
    ELSE
      ----===Without previous week columns
      
      O_WEEK := 'OTHERS###' || V_HEADER || ' WSR###' || V_HEADER_DATE_4 || '';
    
     ----- O_WEEK := 'WEEK1###' || V_HEADER || ' WSR###' || V_HEADER_DATE || '';
    
      O_SLIDE_FOOTER := '';
      IF I_GRID_COUNT = 1 THEN
    
       /* V_HDR1 := '\*''REVENUE' || V_COLOUR_CODE2 || ''',
            ''REVENUE' || V_COLOUR_CODE2 || ''',
           
           ''$$$$'',*\
           ''Inc HC' || V_COLOUR_CODE3 || ''',
           ''Inc HC' || V_COLOUR_CODE3 || ''',
         
           ''$$$$'',
           ''GM' || V_COLOUR_CODE2 || ''',
           ''GM' || V_COLOUR_CODE2 || ''',
          
           ''$$$$'',
           ''TCV' || V_COLOUR_CODE3 || ''',
         ''TCV' || V_COLOUR_CODE3 || '''';
    
      V_HDR2 := ' ----===revenue
       \*''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
      
       ''$$$$'',*\
       ---===hc
       ''WFP' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''$$$$'',
       ---===CM
       ''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''$$$$'',
        ---===TCV
       ''Revised Target' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || '''';
       */
       
       
       ---- for new hc structure 
       
        V_HDR1 := '/*''REVENUE' || V_COLOUR_CODE2 || ''',
            ''REVENUE' || V_COLOUR_CODE2 || ''',
           
           ''$$$$'',*/
           ''Inc HC' || V_COLOUR_CODE3 || ''',
           ''Inc HC' || V_COLOUR_CODE3 || ''',
           ''Inc HC' || V_COLOUR_CODE3 || ''',
           ''Inc HC' || V_COLOUR_CODE3 || ''',
           ''$$$$'',
           ''GM' || V_COLOUR_CODE2 || ''',
           ''GM' || V_COLOUR_CODE2 || ''',
          
           ''$$$$'',
           ''TCV' || V_COLOUR_CODE3 || ''',
         ''TCV' || V_COLOUR_CODE3 || '''';
    
      V_HDR2 := ' ----===revenue
       /*''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
      
       ''$$$$'',*/
       ---===hc
       ''WFP' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || ''',
       ''$$$$'',
       ---===CM
       ''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''$$$$'',
        ---===TCV
       ''Revised Target' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || '''';
       
         v_hdr_3 := '
       ---HC
       ''WFP' || V_COLOUR_CODE3 || ''',
       ''OFF'|| V_COLOUR_CODE3 || ''',
       ''ON'|| V_COLOUR_CODE3 || ''',
       ''TOTAL'|| V_COLOUR_CODE3 || ''',
      

        ''$$$$'',
       ---===CM
        ''Revised Target' || V_COLOUR_CODE2 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE2 || ''',
       ''$$$$'',
      ---===TCV
        ''Revised Target' || V_COLOUR_CODE3 || ''',
       ''Curr. Week Outlook' || V_COLOUR_CODE3 || '''';
       
       
          O_SLIDE_TITLE := '' || V_HEADER || ' '''||V_SMP_HEADER||'''  (' ||V_HEADER_DATE_4 || ')'||'##'||V_APPEND||'';

          ------====Data
 /*QRY := 'SELECT CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
       CASE WHEN MOD(ROWNUM,2) = 0 ---=====to give colour code for alternate rows
       AND UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
       ACC_NAME||''' || V_DATA_COLOUR1 || '''
       ELSE
       ACC_NAME||''' || V_DATA_COLOUR2 || '''
       END
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
       ACC_NAME||''' || V_COLOUR_CODE1 || ''' 
       END ACC_NAME,A,
      \* S.CUR_QTR_REV_TOTAL_CORP,
     ----  S.CUR_QTR_REV_TOTAL_AOP,
      ---- S.PRV_WK_REV_TOTAL_PLAN,
       S.CUR_WK_REV_TOTAL_PLAN,B,*\
       S.Cur_Qtr_Hc_Inc_Corp,
      ---- S.PRV_WK_HC_INC_PLAN,
S.CUR_WK_HC_INC_PLAN,C,
S.CUR_QTR_CM_PRCNT_AOP,
---S.PRV_WK_CM_PRCNT_PLAN,
S.CUR_WK_CM_PRCNT_PLAN,


D,
S.CUR_QTR_TCV_CORP,
---S.PRV_WK_TCV_PLAN,
S.CUR_WK_TCV_PLAN
 
FROM 
 (SELECT  ACC_NAME ,
 ''$$$$'' A ,
 
 ---NVL(T.CUR_QTR_REV_TOTAL_CORP,''-''),
 ---NVL(T.PRV_WK_REV_TOTAL_PLAN,''-''),
 ----NVL(T.CUR_WK_REV_TOTAL_PLAN,''-''),
 
 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
          F_PPT(CUR_QTR_REV_TOTAL_CORP,''V13'')||''' || V_COLOUR_CODE2 || '''
        ELSE
            F_PPT(CUR_QTR_REV_TOTAL_CORP,''V13'')||''''
        END CUR_QTR_REV_TOTAL_CORP,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
           F_PPT(PRV_WK_REV_TOTAL_PLAN,''V13'')||''' || V_COLOUR_CODE2 || '''
        ELSE
          F_PPT(PRV_WK_REV_TOTAL_PLAN,''V13'')||''''
        END PRV_WK_REV_TOTAL_PLAN,
        
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
       CASE WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) > CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')
         WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) < CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')
         WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) = CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
       CASE WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) > CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')||'''  || V_COLOUR_CODE2 || '''
         WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) < CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')||''' || V_COLOUR_CODE2 || '''
         WHEN NVL(PRV_WK_REV_TOTAL_PLAN,0) = CUR_WK_REV_TOTAL_PLAN THEN 
         F_PPT(CUR_WK_REV_TOTAL_PLAN,''V13'')||'''  || V_COLOUR_CODE2 || '''
        END
       END CUR_WK_REV_TOTAL_PLAN,
       \* case WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
       F_PPT(CUR_QTR_REV_TOTAL_AOP,''V13'')||'''  || V_COLOUR_CODE2 || '''
       else
           F_PPT(CUR_QTR_REV_TOTAL_AOP,''V13'')
         end CUR_QTR_REV_TOTAL_AOP,*\
 
 ''$$$$'' B ,
 ----NVL(T.Cur_Qtr_Hc_Inc_Corp,''-''),
 ----NVL(T.PRV_WK_HC_INC_PLAN,''-''),
---NVL(T.CUR_WK_HC_INC_PLAN,''-''),

 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
          F_PPT(Cur_Qtr_Hc_Inc_Corp,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
         F_PPT(Cur_Qtr_Hc_Inc_Corp,''COMMA'')||''''
         END Cur_Qtr_Hc_Inc_Corp,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
         F_PPT(PRV_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
        F_PPT(PRV_WK_HC_INC_PLAN,''COMMA'')||''''
         END PRV_WK_HC_INC_PLAN,  
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
       CASE WHEN NVL(PRV_WK_HC_INC_PLAN,0) > CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) < CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) = CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
       CASE WHEN NVL(PRV_WK_HC_INC_PLAN,0) > CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) < CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) = CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||'''  || V_COLOUR_CODE3 || '''
       END   
       END CUR_WK_HC_INC_PLAN,


''$$$$'' C ,
---NVL(T.CUR_QTR_CM_PRCNT_AOP,''-''),
---NVL(T.PRV_WK_CM_PRCNT_PLAN,''-''),
---NVL(T.CUR_WK_CM_PRCNT_PLAN,''-''),

 \*CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
   ''''||''' || V_COLOUR_CODE2 || '''
       -----  f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         ELSE
          f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''
        END CUR_QTR_CM_PRCNT_AOP,*\
        
        CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
         \*case when  f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'') = ''0'' then
           ''''||''' || V_COLOUR_CODE2 || '''
         else
       -----   ''''||''' || V_COLOUR_CODE2 || '''
        f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         end *\
         ''-''||''' || V_COLOUR_CODE2 || '''
         ELSE
           case when  f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'') = ''0'' then
           ''-''
           else
         
          f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''
          end
        END CUR_QTR_CM_PRCNT_AOP,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
         \*''''||  ''' || V_COLOUR_CODE2 || '''
        ---- F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'')||''%''||  ''' || V_COLOUR_CODE2 || '''*\
         ''-''||''' || V_COLOUR_CODE2 || '''
         ELSE
            F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'')||''%''
        END PRV_WK_CM_PRCNT_PLAN,
      \*  CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
          ''''||''' || V_COLOUR_CODE2 || '''
        ---- F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         ELSE
           F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
        END CUR_WK_CM_PRCNT_PLAN,
*\


 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
        \*case when  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
         ''''||''' || V_COLOUR_CODE2 || '''
        else
        -----   ''''||  ''' || V_COLOUR_CODE2 || '''
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         end*\
      
         
        \* CASE WHEN NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = 0 THEN 
           F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
          WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) > TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) < TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         
         
          CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''-'' AND F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''-'' THEN
          F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') ||''%''||'''||V_COLOUR_CODE2||'''
         ELSE
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||'''  || V_COLOUR_CODE2 ||  '''
        END
           ---- F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''' || V_COLOUR_CODE2 || '''
       END*\
          ''-''||''' || V_COLOUR_CODE2 || '''
         
         
 
         ELSE
         
         case when  F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
        CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''0'' THEN
             ''-''---- F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')
           ELSE
              F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
           END
       WHEN   
       NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) > TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
             F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
             
          WHEN NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) < TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
           
         CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''-'' 
           AND F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''-'' THEN
          F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')
         ELSE
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
        END
       END       

       
       
       
        \* else
           F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
           end*\
        END CUR_WK_CM_PRCNT_PLAN,

''$$$$'' D ,
----NVL(T.CUR_QTR_TCV_CORP,''-''),
----NVL(T.PRV_WK_TCV_PLAN,''-''),
----NVL(T.CUR_WK_TCV_PLAN,''-'')


 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
         F_PPT(CUR_QTR_TCV_CORP,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
       F_PPT(CUR_QTR_TCV_CORP,''COMMA'')||''''
        END CUR_QTR_TCV_CORP,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
       F_PPT(PRV_WK_TCV_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
        F_PPT(PRV_WK_TCV_PLAN,''COMMA'')||''''
        END PRV_WK_TCV_PLAN,
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN 
       CASE WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) > TO_NUMBER(CUR_WK_TCV_PLAN) THEN
      F_PPT(CUR_WK_TCV_PLAN,''COMMA'')
         WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) < TO_NUMBER(CUR_WK_TCV_PLAN) THEN
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = TO_NUMBER(CUR_WK_TCV_PLAN) THEN
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
         CASE WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) > TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) < TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||'''  || V_COLOUR_CODE3 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = TO_NUMBER(CUR_WK_TCV_PLAN) THEN
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
       END
       END CUR_WK_TCV_PLAN



FROM ( SELECT ZZ.ACC_NAME,
ZZ.CUR_QTR_REV_TOTAL_CORP,
ZZ.PRV_WK_REV_TOTAL_PLAN,
ZZ.CUR_WK_REV_TOTAL_PLAN,
ZZ.Cur_Qtr_Hc_Inc_Corp,
ZZ.PRV_WK_HC_INC_PLAN,
ZZ.CUR_WK_HC_INC_PLAN,
ZZ.CUR_QTR_CM_PRCNT_AOP,

zz.PRV_WK_CM_PRCNT_PLAN,
zz.CUR_WK_CM_PRCNT_PLAN,


ROUND(CUR_QTR_TCV_CORP) CUR_QTR_TCV_CORP,
ROUND(PRV_WK_TCV_PLAN) PRV_WK_TCV_PLAN,
ROUND(CUR_WK_TCV_PLAN) CUR_WK_TCV_PLAN
 FROM(  SELECT NVL(A.ACC_NAME,''Total'')ACC_NAME,
SUM(E.CURR_QTR_REV_AOP_REV)CUR_QTR_REV_TOTAL_CORP,SUM(B.PREV_QTR_PLAN_REV)PRV_WK_REV_TOTAL_PLAN,SUM(C.CURR_QTR_PLAN_REV)CUR_WK_REV_TOTAL_PLAN,
SUM(E.CURR_QTR_REV_AOP_HC)Cur_Qtr_Hc_Inc_Corp,SUM(B.PREV_QTR_PLAN_HC)PRV_WK_HC_INC_PLAN,SUM(C.CURR_QTR_PLAN_HC)CUR_WK_HC_INC_PLAN,
SUM(E.CURR_QTR_REV_AOP_GM)CUR_QTR_CM_PRCNT_AOP,
---SUM(B.PREV_QTR_PLAN_GM)PRV_WK_CM_PRCNT_PLAN,
---SUM(C.CURR_QTR_PLAN_GM) CUR_WK_CM_PRCNT_PLAN,

case when acc_name is null then 
   sum(b.prev_gm_total)
   else SUM(B.PREV_QTR_PLAN_GM)
     end PRV_WK_CM_PRCNT_PLAN,
     
  case when acc_name is null then 
   sum(c.curr_gm_total)
else
SUM(C.CURR_QTR_PLAN_GM)
end CUR_WK_CM_PRCNT_PLAN,


SUM(E.CURR_QTR_REV_AOP_TCV)CUR_QTR_TCV_CORP,SUM(B.PREV_QTR_PLAN_TCV)PRV_WK_TCV_PLAN,SUM(C.CURR_QTR_PLAN_TCV) CUR_WK_TCV_PLAN
FROM (
(select distinct b.account_id,b.SHORT_NAME ACC_NAME from new_btg_account_mapping b
WHERE\* B.IOU_ID <> 263*\ 1=1
order by SHORT_NAME asc)A
LEFT OUTER JOIN
(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)PREV_QTR_PLAN_REV,SUM(T.INCR_HC)PREV_QTR_PLAN_HC,SUM(T.CM_MARGIN)PREV_QTR_PLAN_GM,
SUM(T.TCV_BMN_USD)PREV_QTR_PLAN_TCV,sum((1- (CM_MARGIN/100))*TOTAL_REV)PREV_gm_total
FROM BTG_WKLY_PL_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%OUTLOOK%''
AND T.FILE_DATE = TO_CHAR(TO_DATE('''||V_DATE||''',''DD-MON-RR'') - 7,''DD-MON-RR'')
GROUP BY ACCOUNT_ID)B
ON A.ACCOUNT_ID = B.ACCOUNT_ID

LEFT OUTER JOIN

(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)CURR_QTR_PLAN_REV,SUM(T.INCR_HC)CURR_QTR_PLAN_HC,SUM(T.CM_MARGIN)CURR_QTR_PLAN_GM,
SUM(T.TCV_BMN_USD)CURR_QTR_PLAN_TCV,sum((1- (CM_MARGIN/100))*TOTAL_REV)curr_gm_total
FROM BTG_WKLY_PL_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%OUTLOOK%''
AND T.FILE_DATE = ''' || V_DATE || '''
GROUP BY ACCOUNT_ID)C
ON A.ACCOUNT_ID = C.ACCOUNT_ID
LEFT OUTER JOIN

(SELECT N.ACCOUNT_ID,SUM(N.TOTAL_REV)CURR_QTR_REV_AOP_REV,SUM(N.INCR_HC)CURR_QTR_REV_AOP_HC,SUM(N.CM_MARGIN)CURR_QTR_REV_AOP_GM,
SUM(N.TCV_BMN_USD)CURR_QTR_REV_AOP_TCV,sum(N.CM_MARGIN)CURR_QTR_REV_AOP_CM
FROM BTG_WKLY_PL_PMO_TGT N
WHERE UPPER(N.PERIOD) LIKE ''%REVISED%''
AND N.QUATER=''' || V_CURR_QTR || '''
GROUP BY ACCOUNT_ID)  E
ON A.ACCOUNT_ID = E.ACCOUNT_ID



)
GROUP BY ROLLUP(ACC_NAME))ZZ

)order by case when acc_name <> ''Total'' then ''1'' else ''2'' end)S';*/


QRY :=' SELECT CASE WHEN FILE_UPLOADED = ''Y'' THEN ACC_NAME ELSE replace(ACC_NAME,''~'',''*~'') END ACC_NAME,''$$$$'' B ,
Cur_Qtr_Hc_Inc_Corp,
 --PREV_OFF_TOTAL,PREV_ON_TOTAL,PRV_WK_HC_INC_PLAN,
 cur_ofF_total,cur_ON_total,
 CUR_WK_HC_INC_PLAN,


''$$$$'' C ,CUR_QTR_CM_PRCNT_AOP,
--PRV_WK_CM_PRCNT_PLAN,
CUR_WK_CM_PRCNT_PLAN,




''$$$$'' D ,
CUR_QTR_TCV_CORP,
--PRV_WK_TCV_PLAN,
CUR_WK_TCV_PLAN FROM 
 
 
 
 
 
 (SELECT A.*,B.ACCOUNT_NAME,B.FILE_UPLOADED FROM (SELECT  ACC_NAME ,
 ''$$$$'' A ,
 

 
 ''$$$$'' B ,
 ----NVL(T.Cur_Qtr_Hc_Inc_Corp,''-''),
 ----NVL(T.PRV_WK_HC_INC_PLAN,''-''),
---NVL(T.CUR_WK_HC_INC_PLAN,''-''),

 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
          F_PPT(Cur_Qtr_Hc_Inc_Corp,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
         --F_PPT(Cur_Qtr_Hc_Inc_Corp,''COMMA'')||''''
         TO_CHAR(Cur_Qtr_Hc_Inc_Corp)
         END Cur_Qtr_Hc_Inc_Corp,
         PREV_OFF_TOTAL,
         PREV_ON_TOTAL,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
         F_PPT(PRV_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
        F_PPT(PRV_WK_HC_INC_PLAN,''COMMA'')||''''
         END PRV_WK_HC_INC_PLAN,  
              CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
             F_PPT(cur_ofF_total,''COMMA'') ELSE 
            F_PPT(cur_ofF_total,''COMMA'')||''' || V_COLOUR_CODE3 || '''
           END cur_ofF_total,
                  CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
                     F_PPT(cur_ON_total,''COMMA'') ELSE 
            F_PPT(cur_ON_total,''COMMA'')||''' || V_COLOUR_CODE3 || '''
           END cur_ON_total,
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN
           CASE WHEN NVL(PRV_WK_HC_INC_PLAN,0) = 0 THEN  F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
        WHEN NVL(PRV_WK_HC_INC_PLAN,0) > CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) < CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) = CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
         WHEN NVL(CUR_WK_HC_INC_PLAN,0) = 0 THEN  F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')
        
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
          CASE WHEN NVL(PRV_WK_HC_INC_PLAN,0) = 0 THEN  F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
        WHEN NVL(PRV_WK_HC_INC_PLAN,0) > CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' ||V_COLOUR_CODE3 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) < CUR_WK_HC_INC_PLAN THEN 
         F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         WHEN NVL(PRV_WK_HC_INC_PLAN,0) = CUR_WK_HC_INC_PLAN THEN 
        F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         WHEN NVL(CUR_WK_HC_INC_PLAN,0) = 0 THEN  F_PPT(CUR_WK_HC_INC_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
       END   
       END CUR_WK_HC_INC_PLAN,


''$$$$'' C ,
---NVL(T.CUR_QTR_CM_PRCNT_AOP,''-''),
---NVL(T.PRV_WK_CM_PRCNT_PLAN,''-''),
---NVL(T.CUR_WK_CM_PRCNT_PLAN,''-''),

 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
         /*case when  f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'') = ''0'' then
           ''''||''' || V_COLOUR_CODE2 || '''
         else
       -----   ''''||''' || V_COLOUR_CODE2 || '''
        f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         end */
         ''-''||''' || V_COLOUR_CODE2 || '''
         ELSE
           case when  f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'') = ''0'' then
           ''-''
           else
         
          f_ppt(CUR_QTR_CM_PRCNT_AOP,''V3'')||''%''
          end
        END CUR_QTR_CM_PRCNT_AOP,
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
            /*case when  f_ppt(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
              ''''||''' || V_COLOUR_CODE2 || '''
            else
              
       ---- ''''||  ''' || V_COLOUR_CODE2 || '''

         F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'')||''%''||  ''' || V_COLOUR_CODE2 || '''
         end*/
         ''-''||''' || V_COLOUR_CODE2 || '''
         ELSE
          case when  f_ppt(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
          ''-''
          else
            F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'')||''%''
            end
        END PRV_WK_CM_PRCNT_PLAN,
        
        CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN 
        /*case when  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
         ''''||''' || V_COLOUR_CODE2 || '''
        else
        -----   ''''||  ''' || V_COLOUR_CODE2 || '''
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
         end*/
      
         
        /* CASE WHEN NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = 0 THEN 
           F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_COLOUR_CODE2 || '''
          WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) > TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC || V_COLOUR_CODE5 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) < TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC1 || V_COLOUR_CODE5 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
         
         
          CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''-'' AND F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''-'' THEN
          F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') ||''%''||'''||V_COLOUR_CODE5||'''
         ELSE
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC2 || V_COLOUR_CODE5 ||  '''
        END
           ---- F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''' || V_INDIC2 || V_COLOUR_CODE5 || '''
       END*/
       ''-''||''' || V_COLOUR_CODE2 || '''
         
         
         
 
         ELSE
         
         case when  F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''0'' then
        CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''0'' THEN
             ''-''---- F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')
           ELSE
              F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
           END
       WHEN   
       NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) > TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
             F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC || '''
             
          WHEN NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) < TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC1 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_CM_PRCNT_PLAN),0) = TO_NUMBER(CUR_WK_CM_PRCNT_PLAN) THEN
           
         CASE WHEN  F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'') = ''-'' 
           AND F_PPT(PRV_WK_CM_PRCNT_PLAN,''V3'') = ''-'' THEN
          F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')
         ELSE
        F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''||''' || V_INDIC2 || '''
        END
       END       

       
       
       
        /* else
           F_PPT(CUR_WK_CM_PRCNT_PLAN,''V3'')||''%''
           end*/
        END CUR_WK_CM_PRCNT_PLAN,




''$$$$'' D ,
----NVL(T.CUR_QTR_TCV_CORP,''-''),
----NVL(T.PRV_WK_TCV_PLAN,''-''),
----NVL(T.CUR_WK_TCV_PLAN,''-'')


 CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
         F_PPT(CUR_QTR_TCV_CORP,''V13'')||''' || V_COLOUR_CODE3 || '''
         ELSE
       F_PPT(CUR_QTR_TCV_CORP,''V13'')||''''
        END CUR_QTR_TCV_CORP,
        
       CASE WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%''THEN 
       F_PPT(PRV_WK_TCV_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
         ELSE
        F_PPT(PRV_WK_TCV_PLAN,''COMMA'')||''''
        END PRV_WK_TCV_PLAN,
        
       CASE WHEN UPPER(ACC_NAME) NOT LIKE ''%TOTAL%'' THEN 
          CASE WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = 0 
            THEN F_PPT(CUR_WK_TCV_PLAN,''COMMA'')
        WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) > TO_NUMBER(CUR_WK_TCV_PLAN) THEN
      F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC || '''
         WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) < TO_NUMBER(CUR_WK_TCV_PLAN) THEN
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC1 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = TO_NUMBER(CUR_WK_TCV_PLAN) THEN
           
         CASE WHEN  F_PPT(CUR_WK_TCV_PLAN,''V13'') = ''-'' 
           AND F_PPT(PRV_WK_TCV_PLAN,''V13'') = ''-'' THEN
          F_PPT(CUR_WK_TCV_PLAN,''COMMA'')
         ELSE
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC2 || '''
        END
       END 
       WHEN UPPER(ACC_NAME) LIKE ''%TOTAL%'' THEN
          CASE WHEN NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = 0 THEN 
            F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_COLOUR_CODE3 || '''
          WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) > TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC || V_COLOUR_CODE3 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) < TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC1 || V_COLOUR_CODE3 || '''
         WHEN  NVL(TO_NUMBER(PRV_WK_TCV_PLAN),0) = TO_NUMBER(CUR_WK_TCV_PLAN) THEN
         
         
          CASE WHEN  F_PPT(CUR_WK_TCV_PLAN,''V13'') = ''-'' AND F_PPT(PRV_WK_TCV_PLAN,''V13'') = ''-'' THEN
          F_PPT(CUR_WK_TCV_PLAN,''COMMA'') ||'''||V_COLOUR_CODE3||'''
         ELSE
        F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC2 || V_COLOUR_CODE3 ||  '''
        END
         
     
         
       ---- F_PPT(CUR_WK_TCV_PLAN,''COMMA'')||''' || V_INDIC2 || V_COLOUR_CODE3 || '''
       END
       END CUR_WK_TCV_PLAN from (



  SELECT CASE WHEN ACCOUNT LIKE ''%Total%'' THEN A.ACCOUNT||''^#BE0046'' WHEN MOD(ROWNUM,2)=0 THEN A.ACCOUNT||''~#EDE7FF'' ELSE A.ACCOUNT||''~#FEFEDB'' END acc_name,
       A.WFP Cur_Qtr_Hc_Inc_Corp,
       A.PREV_OFF_TOTAL,
       A.PREV_ON_TOTAL,
       A.PREV_TOTAL PRV_WK_HC_INC_PLAN,
       A.CUR_OFF_TOTAL,
       A.CUR_ON_TOTAL,
       A.CUR_TOTAL  CUR_WK_HC_INC_PLAN,
       B.CURR_GM_AOP CUR_QTR_CM_PRCNT_AOP,
       B.PRV_WK_CM PRV_WK_CM_PRCNT_PLAN,
       B.CUR_WK_CM CUR_WK_CM_PRCNT_PLAN,
       B.CURR_TCV_AOP CUR_QTR_TCV_CORP,
       B.PRV_WK_TCV  PRV_WK_TCV_PLAN,
       B.CUR_WK_TCV CUR_WK_TCV_PLAN FROM
  (SELECT NVL(ACCOUNT,''Total'') ACCOUNT,
       SUM(WFP) WFP,
       SUM(PREV_OFF_TOTAL) PREV_OFF_TOTAL,
       SUM(PREV_ON_TOTAL) PREV_ON_TOTAL,
       SUM(PREV_TOTAL) PREV_TOTAL,
       SUM(CUR_OFF_TOTAL) CUR_OFF_TOTAL,
       SUM(CUR_ON_TOTAL) CUR_ON_TOTAL,
       SUM(CUR_TOTAL) CUR_TOTAL
       FROM
(SELECT (SELECT DISTINCT SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING M WHERE M.ACCOUNT_ID=B.ACCOUNT_ID) ACCOUNT,
       A.WFP,
       B.PREV_OFF_TOTAL,
       B.PREV_ON_TOTAL,
       B.PREV_TOTAL,
       B.CUR_OFF_TOTAL,
       B.CUR_ON_TOTAL,
       B.CUR_TOTAL
  FROM (SELECT ACCOUNT_ID, INCR_HC WFP
          FROM BTG_WKLY_PL_PMO_TGT
         WHERE QUATER = '''||V_CURR_QTR||'''
           AND PERIOD LIKE ''%Revised%''
                                                '||V_SMP_COND||') A
 RIGHT OUTER JOIN (SELECT A.ACCOUNT_ID,
                          PREV_OFF_TOTAL,
                          PREV_ON_TOTAL,
                          PREV_TOTAL,
                          CUR_OFF_TOTAL,
                          CUR_ON_TOTAL,
                          CUR_TOTAL
                     FROM (SELECT *
                             FROM (SELECT ACCOUNT_ID,
                                          CASE
                                            WHEN ON_OFF IS NULL THEN
                                             ''Total''
                                            ELSE
                                             ON_OFF
                                          END ON_OFF,
                                          CUR_QTR_INC
                                     FROM BTG_WSR_HC_TGT
                                    WHERE (ON_OFF LIKE ''%Total%'' OR
                                          ON_OFF IS NULL)
                                      AND PERIOD IN ('''||V_PREV_WEEK||''')
                                     '||V_SMP_COND||'                                      )
                           PIVOT(SUM(CUR_QTR_INC)
                              FOR ON_OFF IN(''Off Total'' as prev_off_total,
                                           ''On Total'' as prev_on_total,
                                           ''Total'' as prev_TOTAL))) A
                     JOIN (SELECT *
                            FROM (SELECT ACCOUNT_ID,
                                         CASE
                                           WHEN ON_OFF IS NULL THEN
                                            ''Total''
                                           ELSE
                                            ON_OFF
                                         END ON_OFF,
                                         CUR_QTR_INC
                                    FROM BTG_WSR_HC_TGT
                                   WHERE (ON_OFF LIKE ''%Total%'' OR
                                         ON_OFF IS NULL)
                                     AND PERIOD IN ('''||V_DATE||''')
                                                                          '||V_SMP_COND||')
                          PIVOT(SUM(CUR_QTR_INC)
                             FOR ON_OFF IN(''Off Total'' as CUR_off_total,
                                          ''On Total'' as CUR_on_total,
                                          ''Total'' as CUR_TOTAL))) B
                       ON A.ACCOUNT_ID = B.ACCOUNT_ID
                    ORDER BY ACCOUNT_ID) B
    ON A.ACCOUNT_ID = B.ACCOUNT_ID
ORDER BY ACCOUNT)
GROUP BY GROUPING SETS((ACCOUNT),())
ORDER BY CASE WHEN ACCOUNT = ''Total'' THEN ''ZZZZZZZ'' ELSE ACCOUNT END
) A LEFT OUTER JOIN (SELECT * FROM (SELECT ZZ.ACC_NAME,
--ZZ.CURR_REV_AOP,
--ZZ.PRV_WK_REV,
--ZZ.CUR_WK_REV,
ZZ.CURR_HC_AOP,
ZZ.PRV_WK_HC,
ZZ.CUR_WK_HC,
ZZ.CURR_GM_AOP,
 zz.PRV_WK_CM,
  

   zz.CUR_WK_CM,

ROUND(CURR_TCV_AOP) CURR_TCV_AOP,

ROUND(PRV_WK_TCV) PRV_WK_TCV,

ROUND(CUR_WK_TCV) CUR_WK_TCV
 FROM(SELECT NVL(A.ACC_NAME,''Total'')ACC_NAME,
SUM(C.CURR_QTR_REV_AOP_REV)CURR_REV_AOP,SUM(B.PREV_QTR_PLAN_REV)PRV_WK_REV,SUM(NVL(D.CURR_QTR_PLAN_REV,B.PREV_QTR_PLAN_REV))CUR_WK_REV,
SUM(C.CURR_QTR_REV_AOP_HC)CURR_HC_AOP,SUM(B.PREV_QTR_PLAN_HC)PRV_WK_HC,SUM(D.CURR_QTR_PLAN_HC)CUR_WK_HC,
SUM(C.CURR_QTR_REV_AOP_GM)CURR_GM_AOP,

CASE WHEN ACC_NAME IS NULL THEN
   0--SUM(B.PREV_GM_TOTAL)
   ELSE SUM(B.PREV_QTR_PLAN_GM)
     END PRV_WK_CM,
      CASE WHEN ACC_NAME IS NULL THEN
        0--SUM(D.CURR_GM_TOTAL)
ELSE
SUM(D.CURR_QTR_PLAN_GM)
END CUR_WK_CM,


SUM(C.CURR_QTR_REV_AOP_TCV)CURR_TCV_AOP,SUM(B.PREV_QTR_PLAN_TCV)PRV_WK_TCV,SUM(NVL(D.CURR_QTR_PLAN_TCV,B.PREV_QTR_PLAN_TCV)) CUR_WK_TCV
FROM ((select distinct b.account_id,b.SHORT_NAME ACC_NAME from new_btg_account_mapping b
WHERE 1=1 
 /* B.IOU_ID <> 263 */ '|| V_SMP_COND ||'

order by SHORT_NAME asc)A
LEFT OUTER JOIN
(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)PREV_QTR_PLAN_REV,SUM(T.INCR_HC)PREV_QTR_PLAN_HC,SUM(T.CM_MARGIN)PREV_QTR_PLAN_GM,
SUM(T.TCV_BMN_USD)PREV_QTR_PLAN_TCV,sum((1- (CM_MARGIN/100))*TOTAL_REV)PREV_gm_total
FROM BTG_WKLY_PL_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%OUTLOOK%''
AND T.FILE_DATE = (select max(t.file_date) from btg_wkly_pl_tgt t where t.file_date =  '''||V_FILE_DATE||''')
GROUP BY ACCOUNT_ID)B
ON A.ACCOUNT_ID = B.ACCOUNT_ID

LEFT OUTER JOIN

(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)CURR_QTR_REV_AOP_REV,SUM(T.INCR_HC)CURR_QTR_REV_AOP_HC,SUM(T.CM_MARGIN)CURR_QTR_REV_AOP_GM,
SUM(T.TCV_BMN_USD)CURR_QTR_REV_AOP_TCV,sum(T.CM_MARGIN)CURR_QTR_REV_AOP_CM
FROM BTG_WKLY_PL_PMO_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%REVISED%''
AND T.QUATER='''||V_CURR_QTR||'''
GROUP BY ACCOUNT_ID)C
ON A.ACCOUNT_ID = C.ACCOUNT_ID

LEFT OUTER JOIN

(SELECT T.ACCOUNT_ID,SUM(T.TOTAL_REV)CURR_QTR_PLAN_REV,SUM(T.INCR_HC)CURR_QTR_PLAN_HC,SUM(T.CM_MARGIN)CURR_QTR_PLAN_GM,
SUM(T.TCV_BMN_USD)CURR_QTR_PLAN_TCV,sum((1- (CM_MARGIN/100))*TOTAL_REV)curr_gm_total
FROM BTG_WKLY_PL_TGT T 
WHERE UPPER(T.PERIOD) LIKE ''%OUTLOOK%''
AND T.FILE_DATE = '''||V_DATE||'''
GROUP BY ACCOUNT_ID)D
ON A.ACCOUNT_ID = D.ACCOUNT_ID


)
GROUP BY ROLLUP(ACC_NAME)
)ZZ

)order by case when acc_name <> ''Total'' then ''1'' else ''2'' end) B
ON A.ACCOUNT=B.ACC_NAME
ORDER BY CASE WHEN ACCOUNT = ''Total'' THEN ''ZZZZZZZ'' ELSE ACCOUNT END


)) A
left outer join (SELECT  distinct (SELECT DISTINCT SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING M WHERE M.ACCOUNT_ID = T.ACCOUNT_ID) ACCOUNT_NAME,MAX(t.FILE_UPLOADED) FILE_UPLOADED from wkly_rep_frz_unfrz_btg T 
WHERE 

 T.FILE_DATE =  '''||V_DATE||'''
GROUP BY ACCOUNT_ID ) b
on SUBSTR(a.ACC_NAME,0,INSTR(A.ACC_NAME,''~'')-1) = B.ACCOUNT_NAME)
ORDER BY CASE WHEN ACC_NAME LIKE ''%Total%'' THEN ''ZZZZZZZ'' ELSE ACC_NAME END
';



DELETE FROM HD_DUMMY;
COMMIT;
INSERT INTO HD_DUMMY VALUES (QRY);
COMMIT;
                   OPEN O_SHEET_DATA FOR QRY;
     
    
       
      
    END IF;
   
    
    END IF;
  
 
  --====FOR EXCEL
    
    END IF;
  
    QRY := 'SELECT COUNT(1)
         FROM BTG_WKLY_PL_TGT T WHERE T.FILE_DATE=''' || V_DATE || '''';
  
    EXECUTE IMMEDIATE QRY
      INTO V_CNT;
  
    IF V_CNT <> 0 THEN
      ----=====Header
      QRY := 'SELECT ''Account Name' || V_COLOUR_CODE1 || ''',
       ''$$$$'',
       ' || V_HDR1 || '
      
  FROM DUAL
UNION ALL
SELECT ''Account Name' || V_COLOUR_CODE1 || ''',
       ''$$$$'',
       ' || V_HDR2 || '
    
  FROM DUAL
  UNION ALL 
  SELECT  ''Account Name' || V_COLOUR_CODE1 || ''',
       ''$$$$'',
       ' || V_HDR_3 || '
    
  FROM DUAL';
    
      DELETE FROM SD_DUMMY;
      COMMIT;
      INSERT INTO SD_DUMMY VALUES (QRY);
      COMMIT;
    
      OPEN O_SHEET_HEADER FOR QRY;
    

    ELSE
      ---===If no data
    
      QRY := 'SELECT '''' FROM DUAL';
       OPEN O_SHEET_DATA FOR QRY;
       
       
        QRY := 'SELECT '''' FROM DUAL';
       OPEN O_SHEET_HEADER FOR QRY;
    
    END IF;
  
   
  
  END IF;

end SP_WSR_PPT_ATTACHMENT;
 
------
PROCEDURE SP_TGT_DATE_CHECK(I_LOGGED_EMP_ID IN NUMBER,
                            I_COORPORATE    IN NUMBER,
                            I_BU            IN NUMBER,
                            I_ISU           IN VARCHAR2,
                             I_SUB_ISU       IN VARCHAR2,
                            I_ACC             IN VARCHAR2,
                            I_DATE          IN VARCHAR2,
                            O_MSG           OUT VARCHAR2) IS
  V_TODAY          VARCHAR2(1000);
  V_PREV_WEEK_DATE DATE;
  V_FLAG           VARCHAR2(100);
  V_DATE           DATE;
  QRY              LONG;
  V_CURR_MONTH      VARCHAR2(100);
  V_CURR_QTR        VARCHAR2(100);
  V_CURR_MONTH_SYS      VARCHAR2(100);
  V_CURR_QTR_SYS        VARCHAR2(100);
  V_CURR_WEEK  DATE;
  v_cur_week_status     varchar2(100);
BEGIN

/*  QRY := 'SELECT TO_DATE('''||I_DATE||''',''DD/MM/RRRR'') FROM DUAL';

 EXECUTE IMMEDIATE QRY INTO V_DATE;*/
 
  PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(I_DATE,'DD/MM/RRRR'),
                                               V_DATE,
                                               V_CURR_MONTH,
                                               V_CURR_QTR);
  PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TRIM(SYSDATE),
                                               V_CURR_WEEK,
                                               V_CURR_MONTH_SYS,
                                               V_CURR_QTR_SYS);

 
  SELECT TRIM(TO_CHAR(V_DATE, 'Day')) INTO V_TODAY FROM DUAL;
  V_PREV_WEEK_DATE := V_DATE - 7;
  
                                             
     SELECT TO_DATE(TO_CHAR('01-' || TO_CHAR(SYSDATE, 'MON-RRRR')),
                   'DD-MON-RRRR')
      INTO V_CURR_MONTH_SYS
      FROM DUAL;
 QRY:= 'SELECT T.FILE_UPLOADED
      FROM WKLY_REP_FRZ_UNFRZ_BTG T
     WHERE T.ISU_ID = '||I_ISU||'
     AND T.SUB_ISU_ID = '||I_SUB_ISU||'
     AND T.ACCOUNT_ID = '||I_ACC||'
       AND T.FILE_DATE = '''||V_DATE||'''';
 
 EXECUTE IMMEDIATE QRY INTO v_cur_week_status;
      
 IF V_CURR_WEEK = V_DATE /*AND V_CURR_MONTH = V_CURR_MONTH_SYS*/  and v_cur_week_status ='N' THEN
   
  QRY:= 'SELECT T.FILE_UPLOADED
      FROM WKLY_REP_FRZ_UNFRZ_BTG T
     WHERE T.ISU_ID = '||I_ISU||'
     AND T.SUB_ISU_ID = '||I_SUB_ISU||'
     AND T.ACCOUNT_ID = '||I_ACC||'
       AND T.FILE_DATE = '''||V_PREV_WEEK_DATE||'''';
  
  EXECUTE IMMEDIATE QRY INTO V_FLAG;
    
    IF V_FLAG = 'N' THEN---if file has not uploaded
      
      O_MSG := 'Y';
    
    ELSE
    
      O_MSG := 'N';
    
    END IF;
    
ELSE
  
   O_MSG := 'N'; 

END IF;
 
  
  
END SP_TGT_DATE_CHECK;

PROCEDURE SP_HC_STATUS_FRZ_UNFRZ(I_LOGGED_EMP_ID   IN NUMBER,
                                I_COORPORATE  IN NUMBER,
                                I_BU    IN NUMBER,
                                I_ISU  IN VARCHAR2,
                                I_CLUS IN VARCHAR2,
                                I_ACC_ID   IN VARCHAR2,----ACCOUNT_ID WITH FREEZE/UNFRZ FLAG
                                I_DATE   IN VARCHAR2,
                                O_MSG      OUT VARCHAR2) as
 QRY             CLOB;
    V_UNIT_ID       VARCHAR2(1000);
    V_CURR_WEEK      VARCHAR2(1000);
    V_CURR_MONTH     VARCHAR2(1000);
    V_CURR_QTR       VARCHAR2(1000);
    V_CURR_QTR1       VARCHAR2(1000);
    V_WEEK_COUNT    VARCHAR2(1000);
    V_CUR_FLAG      VARCHAR2(1000);
    V_LEVEL_ID      VARCHAR2(1000);
    O_CUR_CLUS      SYS_REFCURSOR;
    V_DATE      VARCHAR2(1000);
    V_UPD_FLAG      VARCHAR2(1000);
    V_FILE_DATE     DATE;
    V_FREEZE_COUNT  NUMBER;
    v_extra VARCHAR2(1000);
    V_ACCOUNT_ID VARCHAR2(1000);
    V_OTHERS VARCHAR2(2000);
  BEGIN
    
  SELECT Q'<'>' || REPLACE(I_ACC_ID, ',', Q'<'>' || ',' || Q'<'>') || Q'<'>'
      INTO V_OTHERS
      FROM DUAL;
  
    QRY := 'SELECT  ' || V_OTHERS || ' FROM DUAL';
  
    EXECUTE IMMEDIATE QRY
      INTO V_ACCOUNT_ID, v_extra;
       
  
    


    ----====to find the cur week===---
    
     PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(I_DATE, 'DD/MM/RRRR'),
                                             V_DATE,
                                             V_CURR_MONTH,
                                             V_CURR_QTR);
  
    PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TRIM(SYSDATE),
                                             V_CURR_WEEK,
                                             V_CURR_MONTH,
                                             V_CURR_QTR1);
  
 
    IF V_DATE=V_CURR_WEEK THEN
    
  
  IF V_EXTRA = 'Y' THEN 
    
   UPDATE WKLY_REP_FRZ_UNFRZ_BTG S
                 SET S.FREEZE_FLAG = 'Y',
                     S.NO_OF_FREEZE = '1'
               WHERE S.FILE_DATE=V_DATE
               AND S.ACCOUNT_ID=V_ACCOUNT_ID;
          ELSIF   V_EXTRA = 'N' 
            THEN
                 
    
      UPDATE WKLY_REP_FRZ_UNFRZ_BTG S
                 SET S.FREEZE_FLAG = 'N',
                     S.NO_OF_FREEZE = '1'
               WHERE S.FILE_DATE=V_DATE
               AND S.ACCOUNT_ID=V_ACCOUNT_ID;
               
   END IF;
  
      COMMIT;
    
   
    O_MSG := 'SUCCESS';

  ELSE
    
  O_MSG:='PLEASE SELECT CURRENT WEEK';
  
  END IF;

  END SP_HC_STATUS_FRZ_UNFRZ;
  
  
  PROCEDURE SP_WEEKLY_SCHEDULER_FREEZE IS
  
    V_DATE       VARCHAR2(1000);
    V_ID         VARCHAR2(4000);
    QRY          LONG;
    V_ISU        SYS_REFCURSOR;
    V_ISU_ID     NUMBER;
    V_SHEET_NAME SYS_REFCURSOR;
    V_SHEET      VARCHAR2(1000);
  BEGIN
    QRY := 'SELECT TRUNC(SYSDATE) - INTERVAL ''7'' DAY AS NEXT_FRIDAY
                 FROM DUAL';
  
    EXECUTE IMMEDIATE QRY
      INTO V_DATE;
    QRY:='UPDATE WKLY_REP_FRZ_UNFRZ_BTG T SET T.FILE_UPLOADED = ''Y'',T.FREEZE_FLAG =''Y'' WHERE T.FILE_DATE=TO_DATE('''||V_DATE||''',''DD-MON-YY'')';
    
    EXECUTE IMMEDIATE QRY;
    COMMIT;
    
   
  
  END SP_WEEKLY_SCHEDULER_FREEZE;
  
 

PROCEDURE SP_WEEKLY_TEMPLATE_HC(I_EMP_ID        IN NUMBER,
                                I_CORP_ID       IN NUMBER,
                                I_BG_ID         IN VARCHAR2,
                                I_ISU_ID        IN VARCHAR2,
                                I_CLUS_ID       IN VARCHAR2,
                                I_ACC_ID        IN VARCHAR2,
                                I_FILE_DATE     IN VARCHAR2, ---==//File Date
                                I_REPORT_NAME   IN VARCHAR2, --===//Report Name
                                I_SHEET_NAME    IN VARCHAR2, --== // Sheet Name
                                I_GRID_COUNT    IN NUMBER, --== // Grid count in a sheet
                                I_OTHERS        IN VARCHAR2, --== // extra input
                                O_CUR_HDR       OUT SYS_REFCURSOR, --==// Header cursor
                                O_CUR_DATA_TYPE OUT SYS_REFCURSOR, --==// Data Type cursor
                                O_CUR_VAL       OUT SYS_REFCURSOR, --==// Values Cursor
                                O_MSG           OUT VARCHAR2, --==/ success / Failure Msg
                                O_NO_OF_INDEX   OUT NUMBER,
                                O_TCV_COL       OUT VARCHAR2) IS

  QRY          CLOB;
  MERGE_QRY    CLOB;
  V_CUR_QTR    VARCHAR2(4000);
  V_CUR1       VARCHAR2(4000);
  V_CUR2       VARCHAR2(4000);
  V_PRV_QTR    VARCHAR2(4000);
  V_PIVOT_LIST VARCHAR2(4000);
  V_MON1       VARCHAR2(4000);
  V_MON2       VARCHAR2(4000);
  V_MON3       VARCHAR2(4000);
  V_MON1_PRO   VARCHAR2(4000);
  V_MON2_PRO   VARCHAR2(4000);
  V_MON3_PRO   VARCHAR2(4000);
  V_PERIOD     DATE;
  V_CURR_MONTH VARCHAR2(4000);
  V_CUR_MON    VARCHAR2(4000);
  V_HC_CNT     VARCHAR2(4000);
  V_COND       VARCHAR2(4000);
  V_HC_CHECK   VARCHAR2(4000);

BEGIN
  -- IF I_ACC_ID <> 0 AND I_ACC_ID IS NOT NULL THEN
  V_COND := ' AND HEADER_ID <> 24';
  -- END IF;

  V_PERIOD := TO_DATE(I_FILE_DATE, 'DD-MM-RRRR');

  V_PRV_QTR := FN_FETCH_PRV_QTR(IN_DATE => V_PERIOD);

  PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(V_PERIOD,
                                           V_PERIOD,
                                           V_CUR1,
                                           V_CUR2);

  V_CUR_MON := TO_CHAR(V_PERIOD, 'MM');

  V_CUR_QTR := FN_FETCH_QTR(IN_DATE => V_PERIOD);
  SELECT INITCAP(SUBSTR(V_PERIOD, 4, 3)) INTO V_CURR_MONTH FROM DUAL;

  V_MON1 := INITCAP(SUBSTR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 4, 3));
  V_MON2 := INITCAP(SUBSTR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 4, 3));
  V_MON3 := INITCAP(SUBSTR(FN_FETCH_LAST_MONTH(V_CUR_QTR), 4, 3));

  IF V_CURR_MONTH = V_MON1 THEN
    V_MON1_PRO := 'P';
    V_MON2_PRO := 'P';
    V_MON3_PRO := 'P';
  ELSIF V_CURR_MONTH = V_MON2 THEN
    V_MON1_PRO := 'A';
    V_MON2_PRO := 'P';
    V_MON3_PRO := 'P';
  ELSIF V_CURR_MONTH = V_MON3 THEN
    V_MON1_PRO := 'A';
    V_MON2_PRO := 'A';
    V_MON3_PRO := 'P';
  END IF;

  SELECT COUNT(*)
    INTO V_HC_CNT
    FROM BTG_WSR_HC_TGT T
   WHERE PERIOD = V_PERIOD;
   
  IF V_HC_CNT = 0 THEN
    IF V_CURR_MONTH = V_MON1 THEN
    
      V_PIVOT_LIST := '''' || FN_FETCH_FIRST_MONTH(V_CUR_QTR) || ''' AS ' ||
                      TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon');
     --value inserting                 
                      
      QRY := 'INSERT INTO BTG_WSR_HC_TGT
          SELECT A.IOU_ID,
       A.ACCOUNT_ID,
       A.OFF_ON,
       A.PERSON_TYPE,
       A.' || TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') || ',
       B.MON1_EXIT,
       B.MON2_EXIT,
       B.MON3_EXIT,
       '''',
       B.MON1_INC,
       B.MON2_INC,
       B.MON3_INC,
       B.CUR_QTR_INC,
      ' || I_EMP_ID || ',
       SYSDATE,
       ''' || V_PERIOD || '''
  FROM (SELECT (SELECT DISTINCT IOU_ID
                  FROM NEW_BTG_ACCOUNT_MAPPING M
                 WHERE M.IOU = T.IOU) IOU_ID,
               CASE
                 WHEN IOU = ''IS-Public Services USA-Parent'' THEN
                  5610
                 ELSE
                  (SELECT DISTINCT ACCOUNT_ID
                     FROM NEW_BTG_ACCOUNT_MAPPING M
                    WHERE M.SHORT_NAME = T.RELATIONSHIP)
               END ACCOUNT_ID,
               OFF_ON,
               PERSON_TYPE,
               ' || TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') || '
          FROM (SELECT IOU,
                       RELATIONSHIP,
                       CASE
                         WHEN PERSON_TYPE IS NULL AND OFF_ON IS NOT NULL THEN
                          OFF_ON || '' Total''
                         ELSE
                          OFF_ON
                       END OFF_ON,
                       PERSON_TYPE,
                       ' || TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') || '
                  FROM (SELECT IOU,
                               RELATIONSHIP,
                               PERIOD,
                               PERSON_TYPE,
                               OFF_ON,
                               SUM(HC) HC
                          FROM (SELECT IOU,
                                       RELATIONSHIP,
                                       PERIOD,
                                       PERSON_TYPE,
                                       OFF_ON,
                                       SUM(HC) HC
                                  FROM (SELECT IOU,
                                               CASE
                                                 WHEN IOU =
                                                      ''IS-Public Services USA-Parent'' THEN
                                                  ''PS-US''
                                                  WHEN RELATIONSHIP=''Glaxo'' THEN
                                                     ''GSK''
                                                 ELSE
                                                  RELATIONSHIP
                                               END RELATIONSHIP,
                                               PERIOD,
                                               CASE
                                                 WHEN PERSON_TYPE NOT IN
                                                      (''Business Associate'',
                                                       ''Trainee'') AND UPPER(BASE_COUNTRY) =
                                                      ''INDIA'' AND UPPER(T.WORK_SECTOR) <>
                                                      ''INDIA'' THEN
                                                  ''Expat''
                                                 WHEN PERSON_TYPE NOT IN
                                                      (''Business Associate'',
                                                       ''Trainee'') AND UPPER(BASE_COUNTRY) <>
                                                      ''India'' AND UPPER(T.WORK_SECTOR) <>
                                                      ''INDIA'' THEN
                                                  ''Local''
                                                 WHEN PERSON_TYPE =
                                                      ''Business Associate'' THEN
                                                  ''BA''
                                                 WHEN PERSON_TYPE IN
                                                      (''Contract Consultant'',
                                                       ''Intern'',
                                                       ''Contingent Worker'') THEN
                                                  ''Intern''
                                                 WHEN PERSON_TYPE = ''Probationer'' THEN
                                                  ''EP''
                                                 ELSE
                                                  PERSON_TYPE
                                               END PERSON_TYPE,
                                               CASE
                                                 WHEN UPPER(WORK_SECTOR) =
                                                      ''INDIA'' THEN
                                                  ''Off''
                                                 ELSE
                                                  ''On''
                                               END OFF_ON,
                                               EMPLOYEE_COUNT HC
                                          FROM HC_DSBD_EMPLOYEE_DTS_BTG_AGG T
                                         WHERE T.PERIOD IN
                                               (''' ||FN_FETCH_FIRST_MONTH(V_CUR_QTR) || ''')
                                           AND T.WON_SWON = ''WON''
                                           AND (IOU, CASE
                                                  WHEN IOU =
                                                       ''IS-Public Services USA-Parent'' THEN
                                                   ''PS-US''
                                                   WHEN RELATIONSHIP=''Glaxo'' THEN
                                                     ''GSK''
                                                  ELSE
                                                   RELATIONSHIP
                                                END) IN
                                               (SELECT DISTINCT IOU, SHORT_NAME
                                                  FROM NEW_BTG_ACCOUNT_MAPPING))
                                 GROUP BY GROUPING SETS((IOU, RELATIONSHIP, PERIOD, PERSON_TYPE, OFF_ON),(IOU, RELATIONSHIP, PERIOD),(IOU, RELATIONSHIP, PERIOD, OFF_ON)))
                         GROUP BY IOU,
                                  RELATIONSHIP,
                                  PERIOD,
                                  PERSON_TYPE,
                                  OFF_ON)
                PIVOT(MAX(HC)
                   FOR PERIOD IN('||V_PIVOT_LIST||'))
                 ORDER BY IOU, RELATIONSHIP, OFF_ON, PERSON_TYPE) T) A
  LEFT OUTER JOIN (SELECT IOU_ID,
                          ACCOUNT_ID,
                          ON_OFF,
                          PERSON_TYPE,
                          MON1_EXIT,
                          MON2_EXIT,
                          MON3_EXIT,
                          MON1_INC,
                          MON2_INC,
                          MON3_INC,
                          CUR_QTR_INC
                     FROM BTG_WSR_HC_TGT T
                    WHERE T.PERIOD =
                          (SELECT MAX(PERIOD)
                             FROM BTG_WSR_HC_TGT
                            WHERE PERIOD < '''||V_PERIOD||'''
                            AND PERIOD > ''' || FN_FETCH_FIRST_MONTH(V_CUR_QTR)|| ''' )) B
    ON A.IOU_ID = B.IOU_ID
   AND A.ACCOUNT_ID = B.ACCOUNT_ID
   AND NVL(A.OFF_ON, ''-'') = NVL(B.ON_OFF, ''-'')
   AND NVL(A.PERSON_TYPE, ''-'') = NVL(B.PERSON_TYPE, ''-'')';
    
     
    
    ELSIF V_CURR_MONTH = V_MON2 THEN
    
      V_PIVOT_LIST := '''' || FN_FETCH_FIRST_MONTH(V_CUR_QTR) || ''' AS ' ||
                      TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') ||
                      ', ''' || FN_FETCH_SECOND_MONTH(V_CUR_QTR) ||
                      ''' AS ' ||
                      TO_CHAR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 'Mon');
                      
      QRY := 'INSERT INTO BTG_WSR_HC_TGT
          SELECT A.IOU_ID,
       A.ACCOUNT_ID,
       A.OFF_ON,
       A.PERSON_TYPE,
      A.' || TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') || ',
       A.' || TO_CHAR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 'Mon') || ',
       B.MON2_EXIT,
       B.MON3_EXIT,
       '''',
       B.MON1_INC,
       B.MON2_INC,
       B.MON3_INC,
       B.CUR_QTR_INC,
      ' || I_EMP_ID || ',
       SYSDATE,
       ''' || V_PERIOD || '''
  FROM (SELECT (SELECT DISTINCT IOU_ID
                  FROM NEW_BTG_ACCOUNT_MAPPING M
                 WHERE M.IOU = T.IOU) IOU_ID,
               CASE
                 WHEN IOU = ''IS-Public Services USA-Parent'' THEN
                  5610
                 ELSE
                  (SELECT DISTINCT ACCOUNT_ID
                     FROM NEW_BTG_ACCOUNT_MAPPING M
                    WHERE M.SHORT_NAME = T.RELATIONSHIP)
               END ACCOUNT_ID,
               OFF_ON,
               PERSON_TYPE,
               ' || TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') || ',
               ' || TO_CHAR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 'Mon') || '
          FROM (SELECT IOU,
                       RELATIONSHIP,
                       CASE
                         WHEN PERSON_TYPE IS NULL AND OFF_ON IS NOT NULL THEN
                          OFF_ON || '' Total''
                         ELSE
                          OFF_ON
                       END OFF_ON,
                       PERSON_TYPE,
                       ' || TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') || ',
                       ' || TO_CHAR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 'Mon') || '
                  FROM (SELECT IOU,
                               RELATIONSHIP,
                               PERIOD,
                               PERSON_TYPE,
                               OFF_ON,
                               SUM(HC) HC
                          FROM (SELECT IOU,
                                       RELATIONSHIP,
                                       PERIOD,
                                       PERSON_TYPE,
                                       OFF_ON,
                                       SUM(HC) HC
                                  FROM (SELECT IOU,
                                               CASE
                                                 WHEN IOU =
                                                      ''IS-Public Services USA-Parent'' THEN
                                                  ''PS-US''
                                                  WHEN RELATIONSHIP=''Glaxo'' THEN
                                                     ''GSK''
                                                 ELSE
                                                  RELATIONSHIP
                                               END RELATIONSHIP,
                                               PERIOD,
                                               CASE
                                                 WHEN PERSON_TYPE NOT IN
                                                      (''Business Associate'',
                                                       ''Trainee'') AND UPPER(BASE_COUNTRY) =
                                                      ''INDIA'' AND UPPER(T.WORK_SECTOR) <>
                                                      ''INDIA'' THEN
                                                  ''Expat''
                                                 WHEN PERSON_TYPE NOT IN
                                                      (''Business Associate'',
                                                       ''Trainee'') AND UPPER(BASE_COUNTRY) <>
                                                      ''India'' AND UPPER(T.WORK_SECTOR) <>
                                                      ''INDIA'' THEN
                                                  ''Local''
                                                 WHEN PERSON_TYPE =
                                                      ''Business Associate'' THEN
                                                  ''BA''
                                                 WHEN PERSON_TYPE IN
                                                      (''Contract Consultant'',
                                                       ''Intern'',
                                                       ''Contingent Worker'') THEN
                                                  ''Intern''
                                                 WHEN PERSON_TYPE = ''Probationer'' THEN
                                                  ''EP''
                                                 ELSE
                                                  PERSON_TYPE
                                               END PERSON_TYPE,
                                               CASE
                                                 WHEN UPPER(WORK_SECTOR) =
                                                      ''INDIA'' THEN
                                                  ''Off''
                                                 ELSE
                                                  ''On''
                                               END OFF_ON,
                                               EMPLOYEE_COUNT HC
                                          FROM HC_DSBD_EMPLOYEE_DTS_BTG_AGG T
                                         WHERE T.PERIOD IN
                                               (''' ||
                                           FN_FETCH_FIRST_MONTH(V_CUR_QTR) || ''',
                                                                      ''' ||
                                           FN_FETCH_SECOND_MONTH(V_CUR_QTR) || ''')
                                           AND T.WON_SWON = ''WON''
                                           AND (IOU, CASE
                                                  WHEN IOU =
                                                       ''IS-Public Services USA-Parent'' THEN
                                                   ''PS-US''
                                                   WHEN RELATIONSHIP=''Glaxo'' THEN
                                                     ''GSK''
                                                  ELSE
                                                   RELATIONSHIP
                                                END) IN
                                               (SELECT DISTINCT IOU, SHORT_NAME
                                                  FROM NEW_BTG_ACCOUNT_MAPPING))
                                 GROUP BY GROUPING SETS((IOU, RELATIONSHIP, PERIOD, PERSON_TYPE, OFF_ON),(IOU, RELATIONSHIP, PERIOD),(IOU, RELATIONSHIP, PERIOD, OFF_ON)))
                         GROUP BY IOU,
                                  RELATIONSHIP,
                                  PERIOD,
                                  PERSON_TYPE,
                                  OFF_ON)
                PIVOT(MAX(HC)
                   FOR PERIOD IN('||V_PIVOT_LIST||'))
                 ORDER BY IOU, RELATIONSHIP, OFF_ON, PERSON_TYPE) T) A
  LEFT OUTER JOIN (SELECT IOU_ID,
                          ACCOUNT_ID,
                          ON_OFF,
                          PERSON_TYPE,
                          MON1_EXIT,
                          MON2_EXIT,
                          MON3_EXIT,
                          MON1_INC,
                          MON2_INC,
                          MON3_INC,
                          CUR_QTR_INC
                     FROM BTG_WSR_HC_TGT T
                    WHERE T.PERIOD =
                          (SELECT MAX(PERIOD)
                             FROM BTG_WSR_HC_TGT
                            WHERE PERIOD < '''||V_PERIOD||''')) B
    ON A.IOU_ID = B.IOU_ID
   AND A.ACCOUNT_ID = B.ACCOUNT_ID
   AND NVL(A.OFF_ON, ''-'') = NVL(B.ON_OFF, ''-'')
   AND NVL(A.PERSON_TYPE, ''-'') = NVL(B.PERSON_TYPE, ''-'')';
        
    
    ELSIF V_CURR_MONTH = V_MON3 THEN
      V_PIVOT_LIST := '''' || FN_FETCH_FIRST_MONTH(V_CUR_QTR) || ''' AS ' ||
                      TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') ||
                      ', ''' || FN_FETCH_SECOND_MONTH(V_CUR_QTR) ||
                      ''' AS ' ||
                      TO_CHAR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 'Mon') ||
                      ', ''' || FN_FETCH_LAST_MONTH(V_CUR_QTR) || ''' AS ' ||
                      TO_CHAR(FN_FETCH_LAST_MONTH(V_CUR_QTR), 'Mon');
                      
      QRY := 'INSERT INTO BTG_WSR_HC_TGT
          SELECT A.IOU_ID,
       A.ACCOUNT_ID,
       A.OFF_ON,
       A.PERSON_TYPE,
      A.' || TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') || ',
      A.' || TO_CHAR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 'Mon') || ',
      A.' || TO_CHAR(FN_FETCH_LAST_MONTH(V_CUR_QTR), 'Mon') || ',
       B.MON3_EXIT,
       '''',
       B.MON1_INC,
       B.MON2_INC,
       B.MON3_INC,
       B.CUR_QTR_INC,
      ' || I_EMP_ID || ',
       SYSDATE,
       ''' || V_PERIOD || '''
  FROM (SELECT (SELECT DISTINCT IOU_ID
                  FROM NEW_BTG_ACCOUNT_MAPPING M
                 WHERE M.IOU = T.IOU) IOU_ID,
               CASE
                 WHEN IOU = ''IS-Public Services USA-Parent'' THEN
                  5610
                 ELSE
                  (SELECT DISTINCT ACCOUNT_ID
                     FROM NEW_BTG_ACCOUNT_MAPPING M
                    WHERE M.SHORT_NAME = T.RELATIONSHIP)
               END ACCOUNT_ID,
               OFF_ON,
               PERSON_TYPE,
               ' || TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') || ',
               ' || TO_CHAR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 'Mon') || ',
               ' || TO_CHAR(FN_FETCH_LAST_MONTH(V_CUR_QTR), 'Mon') || '
          FROM (SELECT IOU,
                       RELATIONSHIP,
                       CASE
                         WHEN PERSON_TYPE IS NULL AND OFF_ON IS NOT NULL THEN
                          OFF_ON || '' Total''
                         ELSE
                          OFF_ON
                       END OFF_ON,
                       PERSON_TYPE,
                       ' || TO_CHAR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 'Mon') || ',
                       ' || TO_CHAR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 'Mon') || ',
                       ' || TO_CHAR(FN_FETCH_LAST_MONTH(V_CUR_QTR), 'Mon') || '
                  FROM (SELECT IOU,
                               RELATIONSHIP,
                               PERIOD,
                               PERSON_TYPE,
                               OFF_ON,
                               SUM(HC) HC
                          FROM (SELECT IOU,
                                       RELATIONSHIP,
                                       PERIOD,
                                       PERSON_TYPE,
                                       OFF_ON,
                                       SUM(HC) HC
                                  FROM (SELECT IOU,
                                               CASE
                                                 WHEN IOU =
                                                      ''IS-Public Services USA-Parent'' THEN
                                                  ''PS-US''
                                                  WHEN RELATIONSHIP=''Glaxo'' THEN
                                                     ''GSK''
                                                  
                                                 ELSE
                                                  RELATIONSHIP
                                               END RELATIONSHIP,
                                               PERIOD,
                                               CASE
                                                 WHEN PERSON_TYPE NOT IN
                                                      (''Business Associate'',
                                                       ''Trainee'') AND UPPER(BASE_COUNTRY) =
                                                      ''INDIA'' AND UPPER(T.WORK_SECTOR) <>
                                                      ''INDIA'' THEN
                                                  ''Expat''
                                                 WHEN PERSON_TYPE NOT IN
                                                      (''Business Associate'',
                                                       ''Trainee'') AND UPPER(BASE_COUNTRY) <>
                                                      ''India'' AND UPPER(T.WORK_SECTOR) <>
                                                      ''INDIA'' THEN
                                                  ''Local''
                                                 WHEN PERSON_TYPE =
                                                      ''Business Associate'' THEN
                                                  ''BA''
                                                 WHEN PERSON_TYPE IN
                                                      (''Contract Consultant'',
                                                       ''Intern'',
                                                       ''Contingent Worker'') THEN
                                                  ''Intern''
                                                 WHEN PERSON_TYPE = ''Probationer'' THEN
                                                  ''EP''
                                                 ELSE
                                                  PERSON_TYPE
                                               END PERSON_TYPE,
                                               CASE
                                                 WHEN UPPER(WORK_SECTOR) =
                                                      ''INDIA'' THEN
                                                  ''Off''
                                                 ELSE
                                                  ''On''
                                               END OFF_ON,
                                               EMPLOYEE_COUNT HC
                                          FROM HC_DSBD_EMPLOYEE_DTS_BTG_AGG T
                                         WHERE T.PERIOD IN
                                               (''' ||
                                           FN_FETCH_FIRST_MONTH(V_CUR_QTR) || ''',
                                                                      ''' ||
                                           FN_FETCH_SECOND_MONTH(V_CUR_QTR) || ''',
                                                                      ''' ||
                                           FN_FETCH_LAST_MONTH(V_CUR_QTR) || ''')
                                           AND T.WON_SWON = ''WON''
                                           AND (IOU, CASE
                                                  WHEN IOU =
                                                       ''IS-Public Services USA-Parent'' THEN
                                                   ''PS-US''
                                                   WHEN RELATIONSHIP=''Glaxo'' THEN
                                                     ''GSK''
                                                  ELSE
                                                   RELATIONSHIP
                                                END) IN
                                               (SELECT DISTINCT IOU, SHORT_NAME
                                                  FROM NEW_BTG_ACCOUNT_MAPPING))
                                 GROUP BY GROUPING SETS((IOU, RELATIONSHIP, PERIOD, PERSON_TYPE, OFF_ON),(IOU, RELATIONSHIP, PERIOD),(IOU, RELATIONSHIP, PERIOD, OFF_ON)))
                         GROUP BY IOU,
                                  RELATIONSHIP,
                                  PERIOD,
                                  PERSON_TYPE,
                                  OFF_ON)
                PIVOT(MAX(HC)
                   FOR PERIOD IN('||V_PIVOT_LIST||'))
                 ORDER BY IOU, RELATIONSHIP, OFF_ON, PERSON_TYPE) T) A
  LEFT OUTER JOIN (SELECT IOU_ID,
                          ACCOUNT_ID,
                          ON_OFF,
                          PERSON_TYPE,
                          MON1_EXIT,
                          MON2_EXIT,
                          MON3_EXIT,                          
                          MON1_INC,
                          MON2_INC,
                          MON3_INC,
                          CUR_QTR_INC
                     FROM BTG_WSR_HC_TGT T
                    WHERE T.PERIOD =
                          (SELECT MAX(PERIOD)
                             FROM BTG_WSR_HC_TGT
                            WHERE PERIOD < '''||V_PERIOD||''')) B
    ON A.IOU_ID = B.IOU_ID
   AND A.ACCOUNT_ID = B.ACCOUNT_ID
   AND NVL(A.OFF_ON, ''-'') = NVL(B.ON_OFF, ''-'')
   AND NVL(A.PERSON_TYPE, ''-'') = NVL(B.PERSON_TYPE, ''-'')';
    

    END IF;
    DELETE FROM X_TST_AGILE;
    COMMIT;
    INSERT INTO X_TST_AGILE VALUES (QRY);
    COMMIT;
  
    EXECUTE IMMEDIATE QRY;
  
    COMMIT;
   --insert query fro insertig any null values  
    
    QRY:= 'INSERT INTO BTG_WSR_HC_TGT
          SELECT *
  FROM (SELECT NVL(A.IOU_ID, B.IOU_ID) IOU_ID,
               NVL(A.ACCOUNT_ID, B.ACCOUNT_ID) ACCOUNT_ID,
               NVL(A.ON_OFF, B.ON_OFF) ON_OFF,
               NVL(A.PERSON_TYPE, B.PERSON_TYPE) PERSON_TYPE,
               A.prev_qtr_exit,
               A.mon1_exit,
               A.mon2_exit,
               A.mon3_exit,
               A.prev_qtr_inc,
               A.mon1_inc,
               A.mon2_inc,
               A.mon3_inc,
               A.cur_qtr_inc,
               '||I_EMP_ID||',
               SYSDATE,
               '''||V_PERIOD||'''
          FROM (SELECT * FROM BTG_WSR_HC_TGT T WHERE T.PERIOD = '''||V_PERIOD||''') A
         RIGHT OUTER JOIN (SELECT *
                            FROM (SELECT DISTINCT IOU_ID, ACCOUNT_ID
                                    FROM NEW_BTG_ACCOUNT_MAPPING)
                           CROSS JOIN (SELECT ''Off'' ON_OFF, ''BA'' PERSON_TYPE
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''Off'', ''Intern''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''Off'', ''Employee''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''Off'', ''Trainee''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''Off'', ''EP''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''Off Total'', ''''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''On'', ''BA''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''On'', ''Trainee''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''On'', ''Expat''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''On'', ''Local''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT ''On Total'', ''''
                                        FROM DUAL
                                      UNION ALL
                                      SELECT '''', ''''
                                        FROM DUAL)) B
            ON (A.IOU_ID = B.IOU_ID AND A.ACCOUNT_ID = B.ACCOUNT_ID AND
               NVL(A.ON_OFF, ''-'') = NVL(B.ON_OFF, ''-'') AND
               NVL(A.PERSON_TYPE, ''-'') = NVL(B.PERSON_TYPE, ''-'')))
 WHERE (IOU_ID, ACCOUNT_ID, NVL(ON_OFF, ''-''), NVL(PERSON_TYPE, ''-'')) NOT IN
       (SELECT IOU_ID, ACCOUNT_ID, NVL(ON_OFF, ''-''), NVL(PERSON_TYPE, ''-'')
          FROM BTG_WSR_HC_TGT T
         WHERE T.PERIOD = '''||V_PERIOD||''')';
         
         
    DELETE FROM X_TST_AGILE;
    COMMIT;
    INSERT INTO X_TST_AGILE VALUES (QRY);
    COMMIT;
  
    EXECUTE IMMEDIATE QRY;
  
    COMMIT;
         
  
    V_PIVOT_LIST := '''' || ADD_MONTHS(FN_FETCH_FIRST_MONTH(V_CUR_QTR), -3) ||
                    ''' AS ' ||
                    TO_CHAR(ADD_MONTHS(FN_FETCH_FIRST_MONTH(V_CUR_QTR), -3),
                            'Mon');
           
    QRY := 'SELECT NVL(A.IOU_ID, B.IOU_ID) IOU_ID,
       NVL(A.ACCOUNT_ID, B.ACCOUNT_ID) ACCOUNT_ID,
       NVL(A.OFF_ON, B.ON_OFF) ON_OFF,
       NVL(A.PERSON_TYPE, B.PERSON_TYPE) PERSON_TYPE,
       NVL(A.INC_HC,0) INC_HC
  FROM (SELECT (SELECT DISTINCT IOU_ID
                  FROM NEW_BTG_ACCOUNT_MAPPING M
                 WHERE M.IOU = T.IOU) IOU_ID,
               CASE
                 WHEN IOU = ''IS-Public Services USA-Parent'' THEN
                  5610
                 ELSE
                  (SELECT DISTINCT ACCOUNT_ID
                     FROM NEW_BTG_ACCOUNT_MAPPING M
                    WHERE M.SHORT_NAME = T.RELATIONSHIP)
               END ACCOUNT_ID,
               OFF_ON,
               PERSON_TYPE,
                ' ||
           TO_CHAR(ADD_MONTHS(FN_FETCH_FIRST_MONTH(V_CUR_QTR), -3), 'Mon') || ' INC_HC
          FROM (SELECT IOU,
                       RELATIONSHIP,
                       CASE
                         WHEN PERSON_TYPE IS NULL AND OFF_ON IS NOT NULL THEN
                          OFF_ON || '' Total''
                         ELSE
                          OFF_ON
                       END OFF_ON,
                       PERSON_TYPE,
                        ' ||
           TO_CHAR(ADD_MONTHS(FN_FETCH_FIRST_MONTH(V_CUR_QTR), -3), 'Mon') || '
                  FROM (SELECT IOU,
                               RELATIONSHIP,
                               PERIOD,
                               PERSON_TYPE,
                               OFF_ON,
                               SUM(HC) HC
                          FROM (SELECT IOU,
                                       RELATIONSHIP,
                                       PERIOD,
                                       PERSON_TYPE,
                                       OFF_ON,
                                       SUM(HC) HC
                                  FROM (SELECT IOU,
                                               CASE
                                                 WHEN IOU =
                                                      ''IS-Public Services USA-Parent'' THEN
                                                  ''PS-US''
                                                 WHEN RELATIONSHIP = ''Glaxo'' THEN
                                                  ''GSK''
                                                 ELSE
                                                  RELATIONSHIP
                                               END RELATIONSHIP,
                                               PERIOD,
                                               CASE
                                                 WHEN PERSON_TYPE NOT IN
                                                      (''Business Associate'',
                                                       ''Trainee'') AND UPPER(BASE_COUNTRY) =
                                                      ''INDIA'' AND UPPER(T.WORK_SECTOR) <>
                                                      ''INDIA'' THEN
                                                  ''Expat''
                                                 WHEN PERSON_TYPE NOT IN
                                                      (''Business Associate'',
                                                       ''Trainee'') AND UPPER(BASE_COUNTRY) <>
                                                      ''India'' AND UPPER(T.WORK_SECTOR) <>
                                                      ''INDIA'' THEN
                                                  ''Local''
                                                 WHEN PERSON_TYPE =
                                                      ''Business Associate'' THEN
                                                  ''BA''
                                                 WHEN PERSON_TYPE IN
                                                      (''Contract Consultant'',
                                                       ''Intern'',
                                                       ''Contingent Worker'') THEN
                                                  ''Intern''
                                                 WHEN PERSON_TYPE = ''Probationer'' THEN
                                                  ''EP''
                                                 ELSE
                                                  PERSON_TYPE
                                               END PERSON_TYPE,
                                               CASE
                                                 WHEN UPPER(WORK_SECTOR) =
                                                      ''INDIA'' THEN
                                                  ''Off''
                                                 ELSE
                                                  ''On''
                                               END OFF_ON,
                                               EMPLOYEE_COUNT HC
                                          FROM HC_DSBD_EMPLOYEE_DTS_BTG_AGG_ARCHIVE T
                                         WHERE T.PERIOD IN ('''||ADD_MONTHS(FN_FETCH_FIRST_MONTH(V_CUR_QTR), -3)||''')
                                           AND T.WON_SWON = ''WON''
                                           AND (IOU, CASE
                                                  WHEN IOU =
                                                       ''IS-Public Services USA-Parent'' THEN
                                                   ''PS-US''
                                                  WHEN RELATIONSHIP = ''Glaxo'' THEN
                                                   ''GSK''
                                                  ELSE
                                                   RELATIONSHIP
                                                END) IN
                                               (SELECT DISTINCT IOU, SHORT_NAME
                                                  FROM NEW_BTG_ACCOUNT_MAPPING))
                                 GROUP BY GROUPING SETS((IOU, RELATIONSHIP, PERIOD, PERSON_TYPE, OFF_ON),(IOU, RELATIONSHIP, PERIOD),(IOU, RELATIONSHIP, PERIOD, OFF_ON)))
                         GROUP BY IOU,
                                  RELATIONSHIP,
                                  PERIOD,
                                  PERSON_TYPE,
                                  OFF_ON)
                PIVOT(MAX(HC)
                   FOR PERIOD IN('||V_PIVOT_LIST||'))
                 ORDER BY IOU, RELATIONSHIP, OFF_ON, PERSON_TYPE) T) A
 RIGHT OUTER JOIN (SELECT *
                     FROM (SELECT DISTINCT IOU_ID, ACCOUNT_ID
                             FROM NEW_BTG_ACCOUNT_MAPPING)
                    CROSS JOIN (SELECT ''Off'' ON_OFF, ''BA'' PERSON_TYPE
                                 FROM DUAL
                               UNION ALL
                               SELECT ''Off'', ''Intern''
                                 FROM DUAL
                               UNION ALL
                               SELECT ''Off'', ''Employee''
                                 FROM DUAL
                               UNION ALL
                               SELECT ''Off'', ''Trainee''
                                 FROM DUAL
                               UNION ALL
                               SELECT ''Off'', ''EP''
                                 FROM DUAL
                               UNION ALL
                               SELECT ''Off Total'', ''''
                                 FROM DUAL
                               UNION ALL
                               SELECT ''On'', ''BA''
                                 FROM DUAL
                               UNION ALL
                               SELECT ''On'', ''Trainee''
                                 FROM DUAL
                               UNION ALL
                               SELECT ''On'', ''Expat''
                                 FROM DUAL
                               UNION ALL
                               SELECT ''On'', ''Local''
                                 FROM DUAL
                               UNION ALL
                               SELECT ''On Total'', ''''
                                 FROM DUAL
                               UNION ALL
                               SELECT '''', ''''
                                 FROM DUAL)) B
    ON (A.IOU_ID = B.IOU_ID AND A.ACCOUNT_ID = B.ACCOUNT_ID AND
       NVL(A.OFF_ON, ''-'') = NVL(B.ON_OFF, ''-'') AND
       NVL(A.PERSON_TYPE, ''-'') = NVL(B.PERSON_TYPE, ''-''))';
  
    MERGE_QRY := 'MERGE INTO (SELECT * FROM BTG_WSR_HC_TGT WHERE PERIOD= ''' ||
                 V_PERIOD || ''') A
                USING (' || QRY || ') B
                ON (A.IOU_ID=B.IOU_ID AND A.ACCOUNT_ID=B.ACCOUNT_ID AND NVL(A.ON_OFF,''-'')=NVL(B.ON_OFF,''-'') AND NVL(A.PERSON_TYPE,''-'')=NVL(B.PERSON_TYPE,''-''))
                WHEN MATCHED THEN 
                  UPDATE SET A.PREV_QTR_INC = NVL(A.PREV_QTR_EXIT,0) - NVL(B.INC_HC,0)';
  
    DELETE FROM SD_DUMMY;
    COMMIT;
    INSERT INTO SD_DUMMY VALUES (MERGE_QRY);
    COMMIT;
  
    EXECUTE IMMEDIATE MERGE_QRY;
    COMMIT;
    
    IF V_CURR_MONTH = V_MON2 OR V_CURR_MONTH = V_MON3 THEN 
      UPDATE BTG_WSR_HC_TGT T SET T.MON1_INC=NVL(T.MON1_EXIT,0) - NVL(T.PREV_QTR_EXIT,0) WHERE T.PERIOD=V_PERIOD;
      COMMIT;
    END IF;
    IF V_CURR_MONTH = V_MON3 THEN 
      UPDATE BTG_WSR_HC_TGT T SET T.MON2_INC=NVL(T.MON2_EXIT,0) - NVL(T.MON1_EXIT,0) WHERE T.PERIOD=V_PERIOD;
      COMMIT;
   END IF;
    
  UPDATE BTG_WSR_HC_TGT T SET T.CUR_QTR_INC= NVL(T.MON1_INC,0) + NVL(T.MON2_INC,0) + NVL(T.MON3_INC,0) WHERE T.PERIOD=V_PERIOD;
  COMMIT;
  
  END IF;

  QRY := 'SELECT FN_MULTIPLE_REPLACE(LEVEL_2_HDR,NEW T_TEXT(''Prev_qtr'',''Mon1'',''Mon2'',''Mon3'',''Cur_qtr'',''m1'',''m2'',''m3''),NEW T_TEXT(''' ||
         REPLACE(V_PRV_QTR, '-20', '''''') || ''',''' || V_MON1 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' || V_MON2 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' || V_MON3 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' ||
         REPLACE(V_CUR_QTR, '-20', '''''') || ''',''' || V_MON1_PRO ||
         ''',''' || V_MON2_PRO || ''',''' || V_MON3_PRO ||
         ''')) || ''$$'' ||LEVEL_2_HDR_COLOR
             FROM (SELECT * FROM WSR_TEMPLATE_HDR_BTG WHERE REPORT_NAME=''Template'' AND SHEET_NAME=''HC New''' ||
         V_COND || '
             ORDER BY HEADER_ID)';

  DELETE FROM HD_DUMMY;
  COMMIT;
  INSERT INTO HD_DUMMY VALUES (QRY);
  COMMIT;

  OPEN O_CUR_HDR FOR QRY;

  QRY := 'SELECT COLUMN_DATATYPE,
                     COLUMN_WIDTH,
                     COLUMN_COLOR,
                     CASE WHEN LEVEL_2_HDR NOT LIKE ''%(A)%'' AND LEVEL_2_HDR NOT LIKE ''%(P)%'' THEN ''FALSE'' WHEN LEVEL_2_HDR LIKE ''%(A)%'' OR LEVEL_2_HDR = ''' ||
         REPLACE(V_CUR_QTR, '-20', '''''') ||
         ' Inc(P)'' THEN ''FALSE'' ELSE ''TRUE'' END COLUMN_EDITABLE,
                    CASE WHEN LEVEL_2_HDR NOT LIKE ''%(A)%'' AND LEVEL_2_HDR NOT LIKE ''%(P)%'' THEN '''' WHEN LEVEL_2_HDR LIKE ''%(A)%'' THEN '''' ELSE   FN_MULTIPLE_REPLACE(COLUMN_FORMULA,NEW T_TEXT(''Prev_qtr'',''Mon1'',''Mon2'',''Mon3'',''Cur_qtr'',''m1'',''m2'',''m3''),NEW T_TEXT(''' ||
         REPLACE(V_PRV_QTR, '-20', '''''') || ''',''' || V_MON1 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' || V_MON2 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' || V_MON3 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' ||
         REPLACE(V_CUR_QTR, '-20', '''''') || ''',''' || V_MON1_PRO ||
         ''',''' || V_MON2_PRO || ''',''' || V_MON3_PRO ||
         ''')) END COLUMN_FORMULA,
                     COLUMN_WRAP_TEXT
                     FROM (SELECT LEVEL_1_HDR,FN_MULTIPLE_REPLACE(LEVEL_2_HDR,NEW T_TEXT(''Prev_qtr'',''Mon1'',''Mon2'',''Mon3'',''Cur_qtr'',''m1'',''m2'',''m3''),NEW T_TEXT(''' ||
         REPLACE(V_PRV_QTR, '-20', '''''') || ''',''' || V_MON1 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' || V_MON2 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' || V_MON3 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' ||
         REPLACE(V_CUR_QTR, '-20', '''''') || ''',''' || V_MON1_PRO ||
         ''',''' || V_MON2_PRO || ''',''' || V_MON3_PRO ||
         ''')) LEVEL_2_HDR,COLUMN_DATATYPE,
                     COLUMN_WIDTH,
                     COLUMN_COLOR,COLUMN_FORMULA,COLUMN_EDITABLE,COLUMN_WRAP_TEXT
             FROM (SELECT * FROM WSR_TEMPLATE_HDR_BTG WHERE REPORT_NAME=''Template'' AND SHEET_NAME=''HC New''' ||
         V_COND || '
             ORDER BY HEADER_ID))';

  DELETE FROM HD_DUMMY;
  COMMIT;
  INSERT INTO HD_DUMMY VALUES (QRY);
  COMMIT;

  OPEN O_CUR_DATA_TYPE FOR QRY;
  
  SELECT COUNT(*) INTO V_HC_CHECK FROM BTG_WSR_HC_TGT T WHERE T.PERIOD=V_PERIOD AND T.IOU_ID = I_ISU_ID AND T.ACCOUNT_ID=I_ACC_ID;
  
  IF V_HC_CHECK <> 0 THEN
  
  QRY := 'SELECT ACCOUNT,
       on_off,
       person_type,
       CASE
         WHEN ON_OFF = ''Off Total'' THEN
          ''SUM(D2,D3,D4,D5,D6)''
         WHEN ON_OFF = ''On Total'' THEN
          ''SUM(D7,D8,D9,D10)''
         WHEN ACCOUNT LIKE ''%Total%'' THEN
          ''SUM(D11,D12)''
         ELSE
          REPLACE(NVL(prev_qtr_exit,''''),''.0'','''')
       END prev_qtr_exit,
       CASE
         WHEN ON_OFF = ''Off Total'' THEN
          ''SUM(E2,E3,E4,E5,E6)''
         WHEN ON_OFF = ''On Total'' THEN
          ''SUM(E7,E8,E9,E10)''
         WHEN ACCOUNT LIKE ''%Total%'' THEN
          ''SUM(E11,E12)''
         ELSE
          REPLACE(NVL(mon1_exit,''''),''.0'','''')
       end mon1_exit,
       CASE
         WHEN ON_OFF = ''Off Total'' THEN
          ''SUM(F2,F3,F4,F5,F6)''
         WHEN ON_OFF = ''On Total'' THEN
          ''SUM(F7,F8,F9,F10)''
         WHEN ACCOUNT LIKE ''%Total%'' THEN
          ''SUM(F11,F12)''
         ELSE
          REPLACE(NVL(mon2_exit,''''),''.0'','''')
       end mon2_exit,
       CASE
         WHEN ON_OFF = ''Off Total'' THEN
          ''SUM(G2,G3,G4,G5,G6)''
         WHEN ON_OFF = ''On Total'' THEN
          ''SUM(G7,G8,G9,G10)''
         WHEN ACCOUNT LIKE ''%Total%'' THEN
          ''SUM(G11,G12)''
         ELSE
          REPLACE(NVL(mon3_exit,''''),''.0'','''')
       end mon3_exit,
       CASE
         WHEN ON_OFF = ''Off Total'' THEN
          ''SUM(I2,I3,I4,I5,I6)''
         WHEN ON_OFF = ''On Total'' THEN
          ''SUM(I7,I8,I9,I10)''
         WHEN ACCOUNT LIKE ''%Total%'' THEN
          ''SUM(I11,I12)''
         ELSE
           REPLACE(NVL(prev_qtr_inc,''''),''.0'','''')
         end prev_qtr_inc,
       CASE
         WHEN ON_OFF = ''Off Total'' THEN
          ''SUM(K2,K3,K4,K5,K6)''
         WHEN ON_OFF = ''On Total'' THEN
          ''SUM(K7,K8,K9,K10)''
         WHEN ACCOUNT LIKE ''%Total%'' THEN
          ''SUM(K11,K12)''
         ELSE
          REPLACE(NVL(mon1_inc,''''),''.0'','''')
       end mon1_inc,
      CASE
         WHEN ON_OFF = ''Off Total'' THEN
          ''SUM(L2,L3,L4,L5,L6)''
         WHEN ON_OFF = ''On Total'' THEN
          ''SUM(L7,L8,L9,L10)''
         WHEN ACCOUNT LIKE ''%Total%'' THEN
          ''SUM(L11,L12)''
         ELSE
         REPLACE(nvl(mon2_inc,''''),''.0'','''')
       end mon2_inc,
       CASE
         WHEN ON_OFF = ''Off Total'' THEN
          ''SUM(M2,M3,M4,M5,M6)''
         WHEN ON_OFF = ''On Total'' THEN
          ''SUM(M7,M8,M9,M10)''
         WHEN ACCOUNT LIKE ''%Total%'' THEN
          ''SUM(M11,M12)''
         ELSE
         REPLACE(nvl(mon3_inc,''''),''.0'','''')
       end mon3_inc,
       CASE
         WHEN ON_OFF = ''Off Total'' THEN
          ''SUM(N2,N3,N4,N5,N6)''
         WHEN ON_OFF = ''On Total'' THEN
          ''SUM(N7,N8,N9,N10)''
         WHEN ACCOUNT LIKE ''%Total%'' THEN
          ''SUM(N11,N12)''
         ELSE
          REPLACE(nvl(cur_qtr_inc,''''),''.0'','''')
       end cur_qtr_inc
  FROM ((SELECT CASE
                  WHEN ON_OFF IS NULL THEN
                   (select distinct short_name
                      from new_btg_account_mapping m
                     where m.account_id = t.account_id) || '' Total''
                  WHEN ON_OFF=''Off'' AND PERSON_TYPE=''BA'' THEN
                   (select distinct short_name
                      from new_btg_account_mapping m
                     where m.account_id = t.account_id)
                  ELSE
                   '' ''
                END ACCOUNT,
                on_off,
                person_type,
                prev_qtr_exit,
                mon1_exit,
                mon2_exit,
                mon3_exit,
                '''',
                prev_qtr_inc,
                '''',
                mon1_inc,
                mon2_inc,
                mon3_inc,
                cur_qtr_inc
           FROM (SELECT iou_id,
                        account_id,
                        on_off,
                        person_type,
                        prev_qtr_exit,
                        mon1_exit,
                        mon2_exit,
                        mon3_exit,
                        prev_qtr_inc,
                        mon1_inc,
                        mon2_inc,
                        mon3_inc,
                        cur_qtr_inc,
                        login_emp_id,
                        datestamp,
                        period,
                        ROWNUM AS RN
                   FROM BTG_WSR_HC_TGT T
                  WHERE T.PERIOD = '''||V_PERIOD||'''
                    AND T.IOU_ID = '||I_ISU_ID||'
                    AND T.ACCOUNT_ID = '||I_ACC_ID||') T))
 ORDER BY CASE
            WHEN NVL(ACCOUNT,''-'') IS NOT NULL THEN
             ''AAA''
            WHEN NVL(ACCOUNT,''-'') LIKE ''%Total%'' THEN
             ''ZZZ''
            ELSE
             ACCOUNT
          END,
          CASE WHEN ON_OFF = ''Off Total'' THEN ''XXX'' WHEN ON_OFF=''On Total'' THEN ''YYY'' ELSE ON_OFF END,

          CASE
            WHEN PERSON_TYPE LIKE ''%BA%'' THEN
             ''AAA''
            WHEN PERSON_TYPE LIKE ''%Employee%'' THEN
             ''BBB''
            WHEN PERSON_TYPE LIKE ''%EP%'' THEN
             ''CCC''
            WHEN PERSON_TYPE LIKE ''%Intern%'' THEN
             ''DDD''
            WHEN PERSON_TYPE LIKE ''%Trainee%'' THEN
             ''EEE''
            ELSE
             PERSON_TYPE
          END';
  ELSE 
    QRY := 'SELECT CASE
         WHEN ON_OFF = ''Off'' and person_type = ''BA'' THEN
         (SELECT DISTINCT SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING WHERE ACCOUNT_ID='||I_ACC_ID||') 
         ELSE
          ACCOUNT
       END ACCOUNT,
       on_off,
       person_type,
       prev_qtr_exit,
       mon1_exit,
       mon2_exit,
       mon3_exit,
       prev_qtr_inc,
       mon1_inc,
       mon2_inc,
       mon3_inc,
       cur_qtr_inc
  FROM ((SELECT DISTINCT '' '' ACCOUNT,
                         on_off,
                         person_type,
                         '''' prev_qtr_exit,
                         '''' mon1_exit,
                         '''' mon2_exit,
                         '''' mon3_exit,
                         '''',
                         '''' prev_qtr_inc,
                         '''',
                         '''' mon1_inc,
                         '''' mon2_inc,
                         '''' mon3_inc,
                         '''' cur_qtr_inc
           FROM BTG_WSR_HC_TGT
          WHERE ON_OFF IS NOT NULL) UNION ALL
        (SELECT (SELECT DISTINCT SHORT_NAME FROM NEW_BTG_ACCOUNT_MAPPING WHERE ACCOUNT_ID='||I_ACC_ID||') || ''Total'',
                '''',
                '''',
                '''' prev_qtr_exit,
                '''' mon1_exit,
                '''' mon2_exit,
                '''' mon3_exit,
                '''',
                '''' prev_qtr_inc,
                '''',
                '''' mon1_inc,
                '''' mon2_inc,
                '''' mon3_inc,
                '''' cur_qtr_inc
           FROM DUAL))
 ORDER BY CASE
            WHEN NVL(ACCOUNT, ''-'') IS NOT NULL THEN
             ''AAA''
            WHEN NVL(ACCOUNT, ''-'') LIKE ''%Total%'' THEN
             ''ZZZ''
            ELSE
             ACCOUNT
          END,
          CASE WHEN ON_OFF = ''Off Total'' THEN ''XXX'' WHEN ON_OFF=''On Total'' THEN ''YYY'' ELSE ON_OFF END,
          CASE
            WHEN PERSON_TYPE LIKE ''%BA%'' THEN
             ''AAA''
            WHEN PERSON_TYPE LIKE ''%Employee%'' THEN
             ''BBB''
            WHEN PERSON_TYPE LIKE ''%EP%'' THEN
             ''CCC''
            WHEN PERSON_TYPE LIKE ''%Intern%'' THEN
             ''DDD''
            WHEN PERSON_TYPE LIKE ''%Trainee%'' THEN
             ''EEE''
            ELSE
             PERSON_TYPE
          END';
  END IF; 
  
  DELETE FROM HD_DUMMY;
  COMMIT;
  INSERT INTO HD_DUMMY VALUES (QRY);
  COMMIT;
  OPEN O_CUR_VAL FOR QRY;
  O_MSG := 'SUCCESS';

  select substr(fn_fetch_qtr(V_PERIOD), 2, 1) into O_TCV_COL from dual;

END SP_WEEKLY_TEMPLATE_HC;
 
 
 
 PROCEDURE SP_WKLY_MONTHLY_GRID_BTG(I_LOGGED_EMP_ID IN NUMBER,
                                                     I_COORPORATE    IN VARCHAR2,
                                                     I_BU            IN VARCHAR2,
                                                     I_ISU           IN NUMBER,
                                                     I_CLUS_ID       IN NUMBER,
                                                     I_ACC           IN NUMBER,
                                                     I_DATE          IN VARCHAR2,
                                                     O_HEADER        OUT SYS_REFCURSOR,
                                                     O_DATA          OUT SYS_REFCURSOR,
                                                     O_VAR_DATA      OUT VARCHAR2) IS
  QRY          CLOB;
  QRY_1        CLOB;
  V_FILE_DATE  DATE;
  V_CURR_WEEK  VARCHAR2(1000);
  V_CURR_MONTH VARCHAR2(1000);
  -- V_BU  VARCHAR2(1000);
  -- v_isu varchar2(1000);
  V_CURR_QTR  VARCHAR2(1000);
  V_SYS_DATE  varchar2(400); --DATE;
  V_LAST_WEEK varchar2(400); --DATE;         
  V_DATE_1    varchar2(1000);
  V_DATE_2    varchar2(1000);
  V_DATE_3    varchar2(1000);
  V_DATE_4    varchar2(1000);
  V_DATE_5    varchar2(1000);
  V_CNT       NUMBER;
  V_CUR_1     SYS_REFCURSOR;
  V_FIRST_1   DATE;
  V_FIRST_2   DATE;
  V_FIRST_3   DATE;
  V_FIRST_4   DATE;
  V_LAST_4    DATE;
  V_LAST_3    DATE;
  V_LAST_2    DATE;
  V_LAST_1    DATE;
  V_DATE_11   VARCHAR2(100);
  V_DATE_12   VARCHAR2(100);

  V_DATE_13 VARCHAR2(100);

  V_DATE_14 VARCHAR2(100);
  V_DATE_15 VARCHAR2(100);

  v_first_5 date;
  v_last_5  date;
  v_month   varchar2(1000);
  V_COND    varchar2(1000);
  V_COND_1  VARCHAR2(1000);
  V_COND_2  VARCHAR2(1000);
  V_COND_4  VARCHAR2(1000);
  V_M       VARCHAR2(100);

BEGIN

  INSERT INTO WEEKLY_REPORT_SP_INPUT_LOG
  VALUES
    (I_LOGGED_EMP_ID,
     SYSDATE,
     'PKG_WSR_UPLOAD.SP_WKLY_GRID',
     I_LOGGED_EMP_ID || '-I_LOGGED_EMP_ID ' || I_COORPORATE ||
     ' -I_COORPORATE ' || I_BU || '-I_BU ' || I_ISU || '-I_ISU ' || I_DATE ||
     ' -I_DATE',
     '',
     '',
     '');

  COMMIT;

  PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TO_DATE(I_DATE, 'DD/MM/RRRR'),
                                           V_FILE_DATE,
                                           V_CURR_MONTH,
                                           V_CURR_QTR);

  PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(TRIM(SYSDATE),
                                           V_CURR_WEEK,
                                           V_CURR_MONTH,
                                           V_CURR_QTR);


  SELECT count(week_id)
    INTO V_CNT
    FROM WSR_CALENDAR
  
    where to_char(to_date(I_DATE, 'DD/MM/YYYY'), 'mm') = month;

  select SUBSTR(TO_CHAR(TO_DATE(I_DATE, 'DD/MM/YYYY'), 'MONTH'), 1, 3)
    into v_month
    from dual;

  /* SELECT TO_CHAR(dat,'MON-RRRR'),COUNT(*) INTO V_M,V_CNT FROM
  (SELECT TRUNC((TO_DATE(I_DATE,'DD/MON/RRRR')),'MM') + level - 1 dat FROM dual
  connect by level <=LAST_DAY(TRUNC(TO_DATE(I_DATE,'DD/MON/RRRR'))) - TRUNC((TO_DATE(I_DATE,'DD/MON/RRRR')),'MM') + 1) 
  WHERE TO_CHAR(dat,'DY') = 'SUN' GROUP BY TO_CHAR(dat,'MON-RRRR');*/

  IF V_CNT = 5 THEN
    V_COND_2 := ' IN (1,2,3,4,5)';
  ELSIF V_CNT = 4 THEN
    V_COND_2 := ' IN (1,2,3,4)';
  END IF;
  /* ELSIF V_CNT = 3 THEN 
    V_COND_2 := ' IN (1,2,3)';
     ELSIF V_CNT = 2 THEN 
    V_COND_2 := ' IN (1,2)';
     ELSIF V_CNT = 1 THEN 
    V_COND_2 := ' IN (1)';
    
  END IF;*/

  /*  QRY_1 := 'SELECT * FROM
  (SELECT PERIOD,ROWNUM RN FROM (SELECT TO_CHAR(FILE_DATE,''DD-MON-YYYY'') PERIOD FROM
  (select distinct file_date  FROM WKLY_REP_FRZ_UNFRZ_BTG  WHERE
          SUBSTR(FILE_DATE,4,3) in (SELECT  upper(SUBSTR(''' ||
             I_DATE || ''',4,3)) from dual)
          ORDER BY FILE_DATE)))
          PIVOT(MAX(PERIOD) FOR RN' || V_COND_2 || ')';*/

  QRY_1 := 'SELECT *  FROM (SELECT FILE_DATE,ROWNUM RN FROM
  (SELECT FILE_DATE FROM (SELECT DISTINCT  FILE_DATE,WEEK_ID 
 FROM  WSR_CALENDAR where 
to_char(to_date(''' || I_DATE || ''',''DD/MM/YYYY''),''mm'') = month ) ORDER BY WEEK_ID)) PIVOT(MAX(FILE_DATE)
 FOR RN ' || V_COND_2 || ')';

  IF V_CNT = 5 THEN
    OPEN V_CUR_1 FOR QRY_1;
  
    LOOP
      FETCH V_CUR_1
        INTO V_DATE_1, V_DATE_2, V_DATE_3, V_DATE_4, V_DATE_5;
      EXIT WHEN V_CUR_1% NOTFOUND;
    
    END LOOP;
    CLOSE V_CUR_1;
  ELSIF V_CNT = 4 THEN
  
    OPEN V_CUR_1 FOR QRY_1;
  
    LOOP
      FETCH V_CUR_1
        INTO V_DATE_1, V_DATE_2, V_DATE_3, V_DATE_4;
    
      EXIT WHEN V_CUR_1% NOTFOUND;
    
    END LOOP;
    CLOSE V_CUR_1;
  END IF;

  SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_1, 'DD-MON-RR')) + INTERVAL '7' DAY,
                 'dd-Mon-YYYY') AS PREV_THURSDAY
    INTO V_DATE_11
    FROM DUAL;

  SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_2, 'DD-MON-RR')) + INTERVAL '7' DAY,
                 'dd-Mon-YYYY') AS PREV_THURSDAY
    INTO V_DATE_12
    FROM DUAL;

  SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_3, 'DD-MON-RR')) + INTERVAL '7' DAY,
                 'dd-Mon-YYYY') AS PREV_THURSDAY
    INTO V_DATE_13
    FROM DUAL;
  SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_4, 'DD-MON-RR')) + INTERVAL '7' DAY,
                 'dd-Mon-YYYY') AS PREV_THURSDAY
    INTO V_DATE_14
    FROM DUAL;
  SELECT TO_CHAR(TRUNC(TO_DATE(V_DATE_5, 'DD-MON-RR')) + INTERVAL '7' DAY,
                 'dd-Mon-YYYY') AS PREV_THURSDAY
    INTO V_DATE_15
    FROM DUAL;

  IF V_CNT = 5 THEN
  
    V_COND := 'LEFT OUTER JOIN (SELECT DISTINCT ACCOUNT_ID,CASE 
 when M_FREEZE_FLAG = ''Y'' AND FREEZED_DATE >= ''' ||
              V_DATE_13 || ''' THEN   ''C''
   WHEN M_FREEZE_FLAG = ''Y'' THEN ''Y''
     WHEN M_FREEZE_FLAG = ''N'' THEN ''N'' END M_FREEZE_FLAG

 FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_5 ||
              ''') s
  
  
  on k.account_id = s.account_id ';
  
    V_COND_1 := ',s.m_freeze_flag week5';
  
  ELSIF V_CNT = 4 THEN
    V_COND := '';
  
    V_COND_1 := '';
  END IF;

  SELECT WEEK_START, WEEK_END
    INTO V_FIRST_1, V_LAST_1
    FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
            FROM WSR_CALENDAR
           where to_char(to_date(I_DATE, 'DD/MM/YYYY'), 'mm') = month)
   WHERE WEEK_ID = 1;

  SELECT WEEK_START, WEEK_END
    INTO V_FIRST_2, V_LAST_2
    FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
            FROM WSR_CALENDAR
           where to_char(to_date(I_DATE, 'DD/MM/YYYY'), 'mm') = month)
   WHERE WEEK_ID = 2;

  SELECT WEEK_START, WEEK_END
    INTO V_FIRST_3, V_LAST_3
    FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
            FROM WSR_CALENDAR
           where to_char(to_date(I_DATE, 'DD/MM/YYYY'), 'mm') = month)
   WHERE WEEK_ID = 3;

  SELECT WEEK_START, WEEK_END
    INTO V_FIRST_4, V_LAST_4
    FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
            FROM WSR_CALENDAR
           where to_char(to_date(I_DATE, 'DD/MM/YYYY'), 'mm') = month)
   WHERE WEEK_ID = 4;

  IF V_CNT = 5 THEN
  
    SELECT WEEK_START, WEEK_END
      INTO V_FIRST_5, V_LAST_5
      FROM (SELECT WEEK_START, WEEK_END, WEEK_ID
              FROM WSR_CALENDAR
             where to_char(to_date(I_DATE, 'DD/MM/YYYY'), 'mm') = month)
     WHERE WEEK_ID = 5;
  END IF;

  IF V_CNT = 5 THEN
  
    V_COND_4 := '
      UNION ALL
      SELECT '''||'WEEK5('||CHR(13)|| SUBSTR(V_FIRST_5,1,6) || ' TO ' || SUBSTR(V_LAST_5,1,6) ||')'|| '''
        FROM DUAL';
  ELSIF V_CNT = 4 THEN
  
    V_COND_4 := '';
  END IF;
  QRY := ' select ''ACCOUNT''
        FROM DUAL
      union all
      select ''ACCOUNT NAME''
        FROM DUAL
      
      UNION ALL
      SELECT  '''||'WEEK1('|| SUBSTR(V_FIRST_1,1,6) || ' TO ' || SUBSTR(V_LAST_1,1,6) ||')'||'''
        FROM DUAL 
        UNION ALL
        SELECT  '''||'WEEK2('|| SUBSTR(V_FIRST_2,1,6) || ' TO ' || SUBSTR(V_LAST_2,1,6) ||')'|| '''
        FROM DUAL 
        UNION ALL
        SELECT ''' ||'WEEK3('|| SUBSTR(V_FIRST_3,1,6) || ' TO ' || SUBSTR(V_LAST_3,1,6) ||')'|| '''
        FROM DUAL 
        UNION ALL
        SELECT ''' ||'WEEK4('|| SUBSTR(V_FIRST_4,1,6) || ' TO ' || SUBSTR(V_LAST_4,1,6) ||')'|| '''
        FROM DUAL 
       ' || V_COND_4 || '';

  delete from Sd_dummy;
  insert into Sd_dummy values (qry);
  commit;
  OPEN O_HEADER FOR QRY;

  QRY := '

select distinct  K.ACCOUNT_ID,k.short_name,a.m_freeze_flag week1,b.m_freeze_flag week2 ,d.m_freeze_flag week3,
f.m_freeze_flag week4



 ' || V_COND_1 ||
         ' from 
new_btg_account_mapping k
left outer   join 
(SELECT DISTINCT ACCOUNT_ID,CASE 
 when M_FREEZE_FLAG = ''Y'' AND FREEZED_DATE >= ''' || V_DATE_11 ||
         ''' THEN   ''C''
   WHEN M_FREEZE_FLAG = ''Y'' THEN ''Y''
     WHEN M_FREEZE_FLAG = ''N'' THEN ''N'' END M_FREEZE_FLAG

 FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE 
  T.FILE_DATE = ''' || V_DATE_1 ||
         ''') a on 
  a.account_id = k.account_id
  
  left outer join 
  
(SELECT DISTINCT ACCOUNT_ID,CASE 
 when M_FREEZE_FLAG = ''Y'' AND FREEZED_DATE >= ''' || V_DATE_12 ||
         ''' THEN   ''C''
   WHEN M_FREEZE_FLAG = ''Y'' THEN ''Y''
     WHEN M_FREEZE_FLAG = ''N'' THEN ''N'' END M_FREEZE_FLAG

 FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE   T.FILE_DATE = ''' ||
         V_DATE_2 || ''' ) b
   on k.account_id = b.account_id
   left outer join 
(SELECT DISTINCT ACCOUNT_ID,CASE 
 when M_FREEZE_FLAG = ''Y'' AND FREEZED_DATE >= ''' || V_DATE_13 ||
         ''' THEN   ''C''
   WHEN M_FREEZE_FLAG = ''Y'' THEN ''Y''
     WHEN M_FREEZE_FLAG = ''N'' THEN ''N'' END M_FREEZE_FLAG

 FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE   T.FILE_DATE = ''' ||
         V_DATE_3 || ''') d
  on k.account_id = d.account_id
  left outer join 
(SELECT DISTINCT ACCOUNT_ID,CASE 
 when M_FREEZE_FLAG = ''Y'' AND FREEZED_DATE >= ''' || V_DATE_14 ||
         ''' THEN   ''C''
   WHEN M_FREEZE_FLAG = ''Y'' THEN ''Y''
     WHEN M_FREEZE_FLAG = ''N'' THEN ''N'' END M_FREEZE_FLAG

 FROM WKLY_REP_FRZ_UNFRZ_BTG T WHERE   T.FILE_DATE = ''' ||
         V_DATE_14 || ''') f 
  ON  k.account_id = F.account_id
  
  ' || V_COND || '
  
 
  order by short_name';

  delete from hd_dummy;
  insert into hd_dummy values (qry);
  commit;

  OPEN O_DATA FOR QRY;

  --O_VAR_DATA:='WSR Status Dashboard for the week of '||V_LAST_WEEK||' to '||V_SYS_DATE||'';
  O_VAR_DATA := 'WSR Status Dashboard for the month of ' || v_month || '';

end SP_WKLY_MONTHLY_GRID_BTG;

PROCEDURE SP_WEEKLY_REPORT_HC(I_EMP_ID        IN NUMBER,
                                I_CORP_ID       IN NUMBER,
                                I_BG_ID         IN VARCHAR2,
                                I_ISU_ID        IN VARCHAR2,
                                I_CLUS_ID       IN VARCHAR2,
                                I_ACC_ID        IN VARCHAR2,
                                I_FILE_DATE     IN VARCHAR2, ---==//File Date
                                I_REPORT_NAME   IN VARCHAR2, --===//Report Name
                                I_SHEET_NAME    IN VARCHAR2, --== // Sheet Name
                                I_GRID_COUNT    IN NUMBER, --== // Grid count in a sheet
                                I_OTHERS        IN VARCHAR2, --== // extra input
                                O_CUR_HDR       OUT SYS_REFCURSOR, --==// Header cursor
                                O_CUR_DATA_TYPE OUT SYS_REFCURSOR, --==// Data Type cursor
                                O_CUR_VAL       OUT SYS_REFCURSOR, --==// Values Cursor
                                O_MSG           OUT VARCHAR2, --==/ success / Failure Msg
                                O_NO_OF_INDEX   OUT NUMBER,
                                O_TCV_COL       OUT VARCHAR2) IS

  QRY          CLOB;
  MERGE_QRY    CLOB;
  V_CUR_QTR    VARCHAR2(4000);
  V_CUR1       VARCHAR2(4000);
  V_CUR2       VARCHAR2(4000);
  V_PRV_QTR    VARCHAR2(4000);
  V_PIVOT_LIST VARCHAR2(4000);
  V_MON1       VARCHAR2(4000);
  V_MON2       VARCHAR2(4000);
  V_MON3       VARCHAR2(4000);
  V_MON1_PRO   VARCHAR2(4000);
  V_MON2_PRO   VARCHAR2(4000);
  V_MON3_PRO   VARCHAR2(4000);
  V_PERIOD     DATE;
  V_CURR_MONTH VARCHAR2(4000);
  V_CUR_MON    VARCHAR2(4000);
  V_HC_CNT     VARCHAR2(4000);
  V_COND       VARCHAR2(4000);
  V_HC_CHECK   VARCHAR2(4000);
  V_IOU_COL    VARCHAR2(4000);
  V_ACC_COND   VARCHAR2(4000);
  V_IOU_COND   VARCHAR2(4000);
  V_ORDER      VARCHAR2(4000);

BEGIN
  
  IF I_ACC_ID <> 0 AND I_ACC_ID IS NOT NULL THEN
  V_ACC_COND := 'AND T.ACCOUNT_ID = '||I_ACC_ID||'';
  
  ELSIF I_ISU_ID <> 0 AND I_ISU_ID IS NOT NULL THEN
    V_IOU_COND := 'AND IOU_ID = '||I_ISU_ID;
  
  END IF;

  V_PERIOD := TO_DATE(I_FILE_DATE, 'DD-MM-RRRR');

  V_PRV_QTR := FN_FETCH_PRV_QTR(IN_DATE => V_PERIOD);

  PKG_BTG_WSR_DOWNLOAD.SP_WEEKLY_FILE_DATE(V_PERIOD,
                                           V_PERIOD,
                                           V_CUR1,
                                           V_CUR2);

  V_CUR_MON := TO_CHAR(V_PERIOD, 'MM');

  V_CUR_QTR := FN_FETCH_QTR(IN_DATE => V_PERIOD);
  SELECT INITCAP(SUBSTR(V_PERIOD, 4, 3)) INTO V_CURR_MONTH FROM DUAL;

  V_MON1 := INITCAP(SUBSTR(FN_FETCH_FIRST_MONTH(V_CUR_QTR), 4, 3));
  V_MON2 := INITCAP(SUBSTR(FN_FETCH_SECOND_MONTH(V_CUR_QTR), 4, 3));
  V_MON3 := INITCAP(SUBSTR(FN_FETCH_LAST_MONTH(V_CUR_QTR), 4, 3));

  IF V_CURR_MONTH = V_MON1 THEN
    V_MON1_PRO := 'P';
    V_MON2_PRO := 'P';
    V_MON3_PRO := 'P';
  ELSIF V_CURR_MONTH = V_MON2 THEN
    V_MON1_PRO := 'A';
    V_MON2_PRO := 'P';
    V_MON3_PRO := 'P';
  ELSIF V_CURR_MONTH = V_MON3 THEN
    V_MON1_PRO := 'A';
    V_MON2_PRO := 'A';
    V_MON3_PRO := 'P';
  END IF;


  QRY := 'SELECT FN_MULTIPLE_REPLACE(LEVEL_2_HDR,NEW T_TEXT(''Prev_qtr'',''Mon1'',''Mon2'',''Mon3'',''Cur_qtr'',''m1'',''m2'',''m3''),NEW T_TEXT(''' ||
         REPLACE(V_PRV_QTR, '-20', '''''') || ''',''' || V_MON1 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' || V_MON2 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' || V_MON3 || '''''' ||
         SUBSTR(V_CUR_QTR, 6, 7) || ''',''' ||
         REPLACE(V_CUR_QTR, '-20', '''''') || ''',''' || V_MON1_PRO ||
         ''',''' || V_MON2_PRO || ''',''' || V_MON3_PRO ||
         ''')) || ''$$'' ||LEVEL_2_HDR_COLOR
             FROM (SELECT * FROM WSR_TEMPLATE_HDR_BTG WHERE REPORT_NAME=''Template'' AND SHEET_NAME=''HC New''' ||
         V_COND || '
             ORDER BY HEADER_ID)';

  DELETE FROM HD_DUMMY;
  COMMIT;
  INSERT INTO HD_DUMMY VALUES (QRY);
  COMMIT;

  OPEN O_CUR_HDR FOR QRY;

  QRY := 'SELECT COLUMN_DATATYPE,
                     COLUMN_WIDTH,
                     COLUMN_COLOR,
                     ''FALSE'' COLUMN_EDITABLE,
                     '''' COLUMN_FORMULA,
                     COLUMN_WRAP_TEXT
                     FROM (SELECT * FROM WSR_TEMPLATE_HDR_BTG WHERE REPORT_NAME=''Template'' AND SHEET_NAME=''HC New''' ||
         V_COND || '
             ORDER BY HEADER_ID)';

  DELETE FROM HD_DUMMY;
  COMMIT;
  INSERT INTO HD_DUMMY VALUES (QRY);
  COMMIT;

  OPEN O_CUR_DATA_TYPE FOR QRY;
  
  QRY := 'SELECT * FROM
       (SELECT NVL(REPLACE(IOU,''IS-BTG-'',''''),''Total^4'') IOU,NVL(ACCOUNT,''Total''),
       NVL(on_off,''Total''),
       NVL(person_type,''Total''),
       SUM(NVL(TO_NUMBER(prev_qtr_exit),0)),
       SUM(NVL(TO_NUMBER(mon1_exit),0)),
       SUM(NVL(TO_NUMBER(mon2_exit),0)),
       SUM(NVL(TO_NUMBER(mon3_exit),0)),
       SUM(NVL(TO_NUMBER(prev_qtr_inc),0)),
       SUM(NVL(TO_NUMBER(mon1_inc),0)),
       SUM(NVL(TO_NUMBER(mon2_inc),0)),
       SUM(NVL(TO_NUMBER(mon3_inc),0)),
       SUM(NVL(TO_NUMBER(cur_qtr_inc),0)),
       ROWNUM RN
  FROM (SELECT (select distinct IOU_SHORT_NAME
                      from new_btg_account_mapping m
                     where m.IOU_ID = t.IOU_ID) IOU,
               (select distinct short_name
                      from new_btg_account_mapping m
                     where m.account_id = t.account_id) ACCOUNT,
                on_off,
                person_type,
                prev_qtr_exit,
                mon1_exit,
                mon2_exit,
                mon3_exit,
                '''',
                prev_qtr_inc,
                '''',
                mon1_inc,
                mon2_inc,
                mon3_inc,
                cur_qtr_inc
           FROM (SELECT iou_id,
                        account_id,
                        on_off,
                        person_type,
                        prev_qtr_exit,
                        mon1_exit,
                        mon2_exit,
                        mon3_exit,
                        prev_qtr_inc,
                        mon1_inc,
                        mon2_inc,
                        mon3_inc,
                        cur_qtr_inc,
                        login_emp_id,
                        datestamp,
                        period,
                        ROWNUM AS RN
                   FROM BTG_WSR_HC_TGT T
                  WHERE T.PERIOD = '''||V_PERIOD||'''
                    '||V_IOU_COND||'
                    '||V_ACC_COND||'
                    AND T.ON_OFF NOT LIKE ''%Total%''
                    ORDER BY IOU_ID,ACCOUNT_ID,ON_OFF,CASE
                    WHEN PERSON_TYPE LIKE ''%BA%'' THEN
                     ''AAA''
                    WHEN PERSON_TYPE LIKE ''%Employee%'' THEN
                     ''BBB''
                    WHEN PERSON_TYPE LIKE ''%EP%'' THEN
                     ''CCC''
                    WHEN PERSON_TYPE LIKE ''%Intern%'' THEN
                     ''DDD''
                    WHEN PERSON_TYPE LIKE ''%Trainee%'' THEN
                     ''EEE''
                    ELSE
                     PERSON_TYPE
                  END) T)
                  GROUP BY GROUPING SETS((IOU,ACCOUNT,ON_OFF,PERSON_TYPE,ROWNUM),()))
                  ORDER BY CASE WHEN IOU LIKE ''%Total%'' THEN 0 ELSE RN END';
 
    
  DELETE FROM HD_DUMMY;
  COMMIT;
  INSERT INTO HD_DUMMY VALUES (QRY);
  COMMIT;
  OPEN O_CUR_VAL FOR QRY;
  
  O_MSG := 'SUCCESS';

  select substr(fn_fetch_qtr(V_PERIOD), 2, 1) into O_TCV_COL from dual;

END SP_WEEKLY_REPORT_HC;


procedure SP_IOU (O_IOU OUT SYS_REFCURSOR) IS
  BEGIN 
    OPEN O_IOU FOR 
    SELECT 0 from dual
    union all
    select distinct iou_id from new_btg_account_mapping  order by 1 ;
    end  sp_iou;
  

-----------------------

end PKG_BTG_WSR_DOWNLOAD;
/
