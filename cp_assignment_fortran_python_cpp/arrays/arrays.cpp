#include <Eigen/Dense>
#include <vector>
#include <iostream>
#include <array>


int main() {
   
   Eigen::Vector3d v1, v2;  
   std::vector<int> v3, v4;
   std::array<int,3> v5 {1, 2, 3};
   std::array<int,3> v6;
   int i;

   // using eigen:
   v1 << 1.0, 2.0, 3.0;
   v2 = v1;
   v1(0) = 4.0;

   std::cout << "using eigen" << std::endl;
   std::cout << v1.transpose() << std::endl;
   std::cout << v2.transpose() << std::endl;

   // using vector:
   v3 = {1, 2, 3};
   v4 = v3;
   v3[0] = 4;

   std::cout << " " << std::endl;
   std::cout << "using vector" << std::endl;
   for (i=0; i<=2; i=i+1) {
      std::cout << v3[i] ;
   }
   std::cout << " " << std::endl;
   for (i=0; i<=2; i=i+1) {
      std::cout << v3[i] ;
   }
   std::cout << " " << std::endl;

   // using array (the library. built in errors can't use "="):
   v6 = v5;   
   v5[0] = 4;

   std::cout << " " << std::endl;
   std::cout << "using array (the library):" << std::endl;
   for (i=0; i<=2; i=i+1) {
      std::cout << v5[i] ;
   }
   std::cout << " " << std::endl;
   for (i=0; i<=2; i=i+1) {
      std::cout << v6[i] ;
   }
   std::cout << " " << std::endl;

}
