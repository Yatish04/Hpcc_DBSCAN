IMPORT datadbscan;
IMPORT DBSCAN;
out1rec := { unsigned id; };    
DBSCAN.FIT(datadbscan.ds,datadbscan.num_dims,datadbscan.num_records);
// Dbscan_Test(datadbscan.ds);