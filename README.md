EasyBuild_Docker

- easybuild-docker/
   Dockerfile           - Dockerfile
   ebfiles/             - Put your .eb files here
   build/              - Temporary build files (auto-created)

Folder Breakdown
1. build/ ➤ Temporary Build Path
Used by EasyBuild during compilation
It’s a scratch directory where EasyBuild downloads sources, unpacks them, and compiles software before installation.
This can be deleted safely after a successful build.

Environment variable:
EASYBUILD_BUILDPATH=/easybuild/build


2. ebfiles/ ➤ EasyBuild Files Directory
Where you put your custom .eb files (EasyBuild recipes).
These files describe how to build specific software packages: what version, what toolchain, dependencies, etc.
EasyBuild uses this folder (along with its internal repository) to resolve builds.
You point EasyBuild here using:
EASYBUILD_ROBOT_PATHS=/easybuild/ebfiles

3. software/ ➤ Software Installation Directory
This is where the final built software ends up.
Organized by software name/version/toolchain, e.g.:
/easybuild/software/
  └── GCCcore/12.2.0
        └── CMake/3.25.1
You can later load this software via the module system (e.g., Lmod).
Controlled by:
EASYBUILD_INSTALLPATH_SOFTWARE=/easybuild/software
