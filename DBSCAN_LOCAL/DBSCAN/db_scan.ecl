INTEGER db_scan() := EMBED(C++)

  #option pure  

  #include "dbscan.h"
  #include<iostream>
  #include "kdtree.cpp"
  
  #body
  struct vec4f {
    float data[4];
    float operator[](int idx) const { return data[idx]; }
};

using namespace std;




    auto dbscan = DBSCAN<vec4f, float>();

    auto data = std::vector<vec4f>{
        vec4f{ 0.f, 0.f, 1.f, 1.f }
        , vec4f{ 0.f, 0.f, 1.f, 0.9f }
        , vec4f{ 0.f, 0.f, 0.9f, 0.9f }
        , vec4f{ 0.f, 0.f, 0.f, 0.9f }
        , vec4f{ 0.f, 0.f, 0.f, 0.8f }
        , vec4f{ 0.f, 0.f, 0.1f, 0.8f },
         vec4f{ 0.f, 0.f, 0.1f, 0.8f }
    };



    dbscan.Run(&data, 4, 0.2f, 2);
    auto noise = dbscan.Noise;
    auto clusters = dbscan.Clusters;
    int i=0;
    for(auto it=clusters.begin();it!=clusters.end();it++){
        for(auto j=(*it).begin();j!=(*it).end();j++){
            cout<<i<<"->"<<*j<<"\n";
            i+=1;
        }
    }


    cout<<"Noise"<<"\n";
    for(auto it : noise){
        cout<<it<<"\n";
    }
    return -1;
ENDEMBED;
         
db_scan();

