#include "dbscan.h"
#include <vector>
#include<iostream>
using namespace std;
struct vec4f {
    float data[4];
    float operator[](int idx) const { return data[idx]; }
};

int cluster=0;

void cluster_assign(vector<vector<unsigned int>> &df,int *V,int src){
V[src]=1;

df[0].push_back(cluster);
// if(V[itj[0]]!=0){
//     cluster_assign(df,V,itj[0]);
// }

}

int main() {

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



    
    // int Run(TVector* V, const uint dim, const Float eps, const uint min, const DistanceFunc& disfunc = [](const T& t1, const T& t2)->Float { return 0; });
    dbscan.Run(&data, 4, 0.15f, 2);
    auto noise = dbscan.Noise;
    auto clusters = dbscan.Clusters;
    // for(auto it:clusters.data){
    //     cout<<"few";
    // }

 

    int n=data.size();
    int V[n]={0};



    for(auto it=clusters.begin();it!=clusters.end();it++){
        for(auto j=(*it).begin();j!=(*it).end();j++){
            cout<<*j<<" ";
        }
        cout<<"\n";
    }


    cout<<"Noise"<<"\n";
    for(auto it : noise){
        cout<<it<<"\n";
    }
    return 0;

}