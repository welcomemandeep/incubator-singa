/************************************************************
*
* Licensed to the Apache Software Foundation (ASF) under one
* or more contributor license agreements.  See the NOTICE file
* distributed with this work for additional information
* regarding copyright ownership.  The ASF licenses this file
* to you under the Apache License, Version 2.0 (the
* "License"); you may not use this file except in compliance
* with the License.  You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*
*************************************************************/

/*interface file for swig */

%module core_device
%include "std_vector.i"
%include "std_string.i"

%{
#include "singa/core/device.h"
%}

namespace singa{

  %nodefault Device;
  class Device {
   public:
    virtual void SetRandSeed(unsigned seed) = 0;
    Device* host();
    int id() const;
  };

  class CppCPU : public Device {
   public:
    CppCPU(int id = -1, int num_executors = 1,
           std::string scheduler = "sync", std::string vm = "gc-only");
    void SetRandSeed(unsigned seed) override;
    /* (TODO) add necessary functions of CppCPU class
    */
  };

  class CudaGPU : public Device {
   public:
    CudaGPU(int id = 0, int num_executors = 1,
            std::string scheduler = "sync", std::string vm = "gc-only");
    void SetRandSeed(unsigned seed) override;
    /* (TODO) add necessary functions of CudaGPU class
    */
  };
}
