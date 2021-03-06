FILE(GLOB SRC *.cpp *.h *.def *.rc)

IF(WIN32)
  SET(NLDRV_AL_LIB "nel_drv_openal_win")
ELSE()
  SET(NLDRV_AL_LIB "nel_drv_openal")
ENDIF()

SOURCE_GROUP(efx FILES
        effect_al.cpp
        effect_al.h)

SOURCE_GROUP(sfx FILES
        buffer_al.cpp
        buffer_al.h
        listener_al.cpp
        listener_al.h
        music_channel_al.cpp
        music_channel_al.h
        source_al.cpp
        source_al.h)

SOURCE_GROUP(util FILES
        ext_al.cpp
        ext_al.h)

NL_TARGET_DRIVER(${NLDRV_AL_LIB} ${SRC})

INCLUDE_DIRECTORIES(${OPENAL_INCLUDE_DIR})

TARGET_LINK_LIBRARIES(${NLDRV_AL_LIB} ${OPENAL_LIBRARY} nelmisc nelsnd_lowlevel)
NL_DEFAULT_PROPS(${NLDRV_AL_LIB} "NeL, Driver, Sound: OpenAL")
NL_ADD_RUNTIME_FLAGS(${NLDRV_AL_LIB})
NL_ADD_LIB_SUFFIX(${NLDRV_AL_LIB})

IF(WIN32)
  # Find and include EFX-Util on Windows.
  FIND_PACKAGE(EFXUtil)
  INCLUDE_DIRECTORIES(${EFXUTIL_INCLUDE_DIR})
  TARGET_LINK_LIBRARIES(${NLDRV_AL_LIB} ${EFXUTIL_LIBRARY})
ENDIF()

IF(WITH_PCH)
  ADD_NATIVE_PRECOMPILED_HEADER(${NLDRV_AL_LIB} ${CMAKE_CURRENT_SOURCE_DIR}/stdopenal.h ${CMAKE_CURRENT_SOURCE_DIR}/stdopenal.cpp)
ENDIF()

IF((WITH_INSTALL_LIBRARIES AND WITH_STATIC_DRIVERS) OR NOT WITH_STATIC_DRIVERS)
  INSTALL(TARGETS ${NLDRV_AL_LIB} RUNTIME DESTINATION ${NL_DRIVER_PREFIX} LIBRARY DESTINATION ${NL_DRIVER_PREFIX} ARCHIVE DESTINATION ${NL_LIB_PREFIX} COMPONENT driverssound)
  IF(WITH_MAXPLUGIN)
    INSTALL(TARGETS ${NLDRV_AL_LIB} RUNTIME DESTINATION maxplugin COMPONENT driverssound)
  ENDIF()
ENDIF()
