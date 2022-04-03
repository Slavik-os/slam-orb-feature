// CMake generated file. Do Not Edit.

#pragma once

namespace pangolin {

  // Forward declarations
  bool RegisterOsxWindowFactory();


  inline bool RegisterFactoriesWindowInterface() {
    bool success = true;
    success &= RegisterOsxWindowFactory();
    return success;
  }


} // pangolin
