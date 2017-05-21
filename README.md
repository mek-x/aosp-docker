Build procedure
---------------

```
cd aosp-docker
docker build -t 3mdeb/aosp-docker .
```

Running container
-----------------

Assuming that your AOSP repo is in `$PWD/aosp` and ccache is in `$PWD/ccache`:

```
aosp-docker/aosp-docker.sh $PWD/aosp $PWD/ccache
```

Running build procedure for Nexus 7 in container
------------------------------------------------

```
cd $HOME/aosp
source build/envsetup.sh
lunch aosp_flo-userdebug
# http://android-rebuilds.beuc.net/SDK_6.0.0/
export USER=$(whoami)
make -j$(nproc)
```

