Unicode true
RequestExecutionLevel user
SilentInstall silent
AutoCloseWindow true
SetCompressor /SOLID lzma
SetCompress auto

!include "FileFunc.nsh"

!ifndef PORTABLE_SOURCE_DIR
  !error "PORTABLE_SOURCE_DIR is required"
!endif

!ifndef PORTABLE_OUTFILE
  !error "PORTABLE_OUTFILE is required"
!endif

!ifndef PORTABLE_RUN_EXE
  !define PORTABLE_RUN_EXE "VJ Curator Runtime.exe"
!endif

Name "VJ Curator"
Caption "VJ Curator"
OutFile "${PORTABLE_OUTFILE}"
Icon "${PORTABLE_SOURCE_DIR}/vlc.ico"

Section
  InitPluginsDir
  SetOutPath "$PLUGINSDIR\app"
  File /r "${PORTABLE_SOURCE_DIR}/*"

  System::Call 'Kernel32::SetEnvironmentVariable(t,t)i("VJ_CURATOR_CLIP_DIR", "$EXEDIR").r0'
  System::Call 'Kernel32::SetEnvironmentVariable(t,t)i("VLC_PLUGIN_PATH", "$PLUGINSDIR\app\plugins").r0'

  ${GetParameters} $0
  ExecWait '"$PLUGINSDIR\app\${PORTABLE_RUN_EXE}" $0'
  RMDir /r "$PLUGINSDIR"
SectionEnd
