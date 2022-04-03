# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/accumulators
    REF boost-1.77.0
    SHA512 6d742d26ae382a753274d0c2055653d5b6368f939c0ccbd0e79283e993736a5369cdaacac648361730937dab8e5b412f265abf9f99de3c42de60baa34afe7029
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})