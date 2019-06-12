IMPORT datadbscan;

EXPORT DBSCAN :=MODULE
    EXPORT SET OF INTEGER  FIT(DATASET(datadbscan.Layout) ds,numdims,num_records) := EMBED(C++)
    #include<iostream>
    #include "dbscan.h"
    #include "kdtree.cpp"
    #include <vector>
    #include<iostream>
    #body


    using namespace std;
    
    struct vec4f {
    float *datapoints;
    float operator[](int idx) const { return datapoints[idx]; }
    };



    auto dbscan = DBSCAN<vec4f, float>();

    
    //todo: have to interface the code here
    
    int i=num_records/numdims;
    int j,k,t=0;
    int clusterno[i];
    auto abc=vector<vec4f>{};
    for(j=0;j<i;j++){
        vec4f a = vec4f{};
        float* new_arr = new float[numdims]();
        a.datapoints=new_arr;
 
        for(k=0;k<numdims;k++)
        {
            a.datapoints[k]=*((float *)ds+t);
            t++;
        }
        abc.push_back(a);
    }
    dbscan.Run(&abc, 4, 0.15f, 2);
    auto noise = dbscan.Noise;
    auto clusters = dbscan.Clusters;
    

    int cl=0;
    for(auto it=clusters.begin();it!=clusters.end();it++){
        for(auto j=(*it).begin();j!=(*it).end();j++){
            cout<<*j<<" ";
            clusterno[*j]=cl;
        }
        cl++;
        cout<<"\n";
    }


   // cout<<"Noise"<<"\n";
    for(auto it : noise){
        cout<<it<<"\n";
        clusterno[it]=cl;
        cl++;
    }

    // v.push_back({vec});

    // RETURN 1;
    // __result = rtlMalloc(8);
    // *(unsigned *)__result = 91823;
    unsigned int n=(unsigned int)i;
    __lenResult = n*sizeof(unsigned __int64);
    __result = rtlMalloc(__lenResult);
    for (unsigned t=0; t < n; t++)
       ((unsigned __int64 *)__result)[t] = clusterno[t] ;
    // __result = clusterno;
    ENDEMBED;

  
END;
