IMPORT datadbscan;
IMPORT DBSCAN;
out1rec := { unsigned id; };    
a:=DBSCAN.FIT(datadbscan.ds,datadbscan.num_dims,datadbscan.num_records);
// Dbscan_Test(datadbscan.ds);
temp:=RECORD
    datadbscan.Layout;
    Integer clusterid;
END;

temp slim(datadbscan.Layout L,set of integer a,INTEGER c):= TRANSFORM
    SELF.clusterid:=a[c];
    self:=L;
END;
out:=PROJECT(datadbscan.ds, slim(LEFT,a,COUNTER) );
out;
