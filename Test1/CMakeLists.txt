cmake_minimum_required(VERSION 3.0)

project(NE451-Test CXX C)

#Adds a custom FIND<MODULE>.CMAKE folder to the project
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

# Dependencies
find_package(DISLIN REQUIRED)
#find_package(Boost REQUIRED filesystem log thread system program_options unit_test_framework)
#find_package(Threads)
#find_package(DeckLinkSDK)
#find_package(Exiv2 REQUIRED)


set(CMAKE_CXX_STANDARD 11)


#set(TESTDATA_DIR ${CMAKE_CURRENT_LIST_DIR}/testdata)
#enable_testing()


if (UNIX)
    message(status "Setting GCC flags")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -fexceptions -Wall -Wextra")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -mtune=native")
else()
    message(status "Setting MSVC flags")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /EHc-")
endif()
message(status " CMAKE_CXX_FLAGS_DEBUG: ${CMAKE_CXX_FLAGS_DEBUG}")
message(status " CMAKE_CXX_FLAGS_RELEASE: ${CMAKE_CXX_FLAGS_RELEASE}")

set(CMAKE_SHARED_LINKER_FLAGS "-Wluser32 -Wlgdi32 -Wlopengl32 -Wstatic-libgcc")

include_directories(${DISLIN_INCLUDE_DIRS})

add_executable(NE451Test main.cpp)
target_link_libraries(NE451Test ${DISLIN_LIBRARIES}) 
install(TARGETS NE451Test DESTINATION bin)

