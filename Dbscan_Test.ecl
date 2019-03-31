IMPORT datadbscan;
IMPORT DBSCAN;
   Dbscan_Test(DATASET(datadbscan.Layout) ds):=FUNCTION
        
        a:=DBSCAN.FIT(ds);
        
        // b:=output('gg');
        RETURN '';
    END;
    
DBSCAN.FIT(datadbscan.ds);
// Dbscan_Test(datadbscan.ds);