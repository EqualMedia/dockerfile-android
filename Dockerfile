# Docker base image with Oracle Java and Android SDK
FROM state/oraclejdk

ENV ANDROID_HOME /android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN yum update -y -q; yum clean all
RUN yum install -y git wget libstdc++.i686 zlib.i686; yum clean all

RUN export SDK_URL=http://dl.google.com/android/android-sdk_r23-linux.tgz; \
  wget -q ${SDK_URL}; \
  tar -xzf $(basename ${SDK_URL}); \
  rm $(basename ${SDK_URL}); \ 
  echo y | /android-sdk-linux/tools/android update sdk --filter platform,tool,platform-tool,extra,extra-android-m2repository,build-tools-20.0.0 --no-ui --force -a
