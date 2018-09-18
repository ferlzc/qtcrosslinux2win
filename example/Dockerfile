FROM ferlzc/qtcrosslinux2win:latest
RUN mkdir /src
COPY src /src

# Switch to the source directory
WORKDIR /src

# Now build the project
RUN qmake
RUN make
