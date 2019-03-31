IMPORT datadbscan;

EXPORT DBSCAN :=MODULE
    EXPORT FIT(DATASET(datadbscan.Layout) ds) := EMBED(C++)
    #include<iostream>
    
    #body
    using namespace std;
    cout<<"hello"<<endl;
    cout<<*((float *)ds+1);

    //todo: have to interface the code here
  

    // RETURN 1;
    // __result = rtlMalloc(8);
    // *(unsigned *)__result = 91823;
    ENDEMBED;

  
END;
