FROM ua-build-base

ENV MOZ_AUTOMATION_PACKAGE_TESTS=1 \
    MOZ_ENABLE_FULL_SYMBOLS=1

RUN wget -nv -O /builds/worker/fetches/binutils.tar.xz https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/linux64-binutils/binutils.tar.xz && \
    cd /builds/worker/fetches/ && \
    tar -xf binutils.tar.xz && \
    rm binutils.tar.xz

RUN wget -nv -O /builds/worker/fetches/clang.tar.zst https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/linux64-clang-12/clang.tar.zst && \
    cd /builds/worker/fetches/ && \
    tar -xf clang.tar.zst && \
    rm clang.tar.zst

RUN wget -nv -O /builds/worker/fetches/rustc.tar.zst https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/linux64-rust-1.54/rustc.tar.zst && \
    cd /builds/worker/fetches/ && \
    tar -xf rustc.tar.zst && \
    rm rustc.tar.zst

RUN wget -nv -O /builds/worker/fetches/rust-size.tar.xz https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/linux64-rust-size/rust-size.tar.xz && \
    cd /builds/worker/fetches/ && \
    tar -xf rust-size.tar.xz && \
    rm rust-size.tar.xz

RUN wget -nv -O /builds/worker/fetches/cbindgen.tar.xz https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/linux64-cbindgen/cbindgen.tar.xz && \
    cd /builds/worker/fetches/ && \
    tar -xf cbindgen.tar.xz && \
    rm cbindgen.tar.xz

RUN wget -nv -O /builds/worker/fetches/dump_syms.tar.xz https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/linux64-dump_syms/dump_syms.tar.xz && \
    cd /builds/worker/fetches/ && \
    tar -xf dump_syms.tar.xz && \
    rm dump_syms.tar.xz

RUN wget -nv -O /builds/worker/fetches/sccache.tar.xz https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/linux64-sccache/sccache.tar.xz && \
    cd /builds/worker/fetches/ && \
    tar -xf sccache.tar.xz && \
    rm sccache.tar.xz

RUN wget -nv -O /builds/worker/fetches/nasm.tar.bz2 https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/linux64-nasm/nasm.tar.bz2 && \
    cd /builds/worker/fetches/ && \
    tar -xf nasm.tar.bz2 && \
    rm nasm.tar.bz2

RUN wget -nv -O /builds/worker/fetches/node.tar.zst https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/linux64-node-12/node.tar.zst && \
    cd /builds/worker/fetches/ && \
    tar -xf node.tar.zst && \
    rm node.tar.zst

RUN wget -nv -O /builds/worker/fetches/sysroot-x86_64-linux-gnu.tar.zst https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/sysroot-x86_64-linux-gnu/sysroot-x86_64-linux-gnu.tar.zst && \
    cd /builds/worker/fetches/ && \
    tar -xf sysroot-x86_64-linux-gnu.tar.zst && \
    rm sysroot-x86_64-linux-gnu.tar.zst

RUN wget -nv -O /builds/worker/fetches/wasi-sysroot.tar.xz https://ghostery-user-agent-cache-public.s3.amazonaws.com/toolchains/92.0/wasi-sysroot-12/wasi-sysroot.tar.xz && \
    cd /builds/worker/fetches/ && \
    tar -xf wasi-sysroot.tar.xz && \
    rm wasi-sysroot.tar.xz

ENV MOZ_FETCHES_DIR=/builds/worker/fetches/ \
    GECKO_PATH=/builds/worker/workspace \
    WORKSPACE=/builds/worker/workspace \
    TOOLTOOL_DIR=/builds/worker/fetches/ \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en

COPY configs /builds/worker/configs

WORKDIR $WORKSPACE