2. Digite o comando “man gcc” no terminal.

Segundo a descrição, quando o gcc é invocado, o que ele faz?

When you invoke GCC, it normally does preprocessing, compilation, assembly and linking.  The "overall options" allow
       you to stop this process at an intermediate stage.  For example, the -c option says not to run the linker.  Then the
       output consists of object files output by the assembler.

3. Quantas opções o GCC possui?

( ) De 1 a 5 opções

( ) De 5 a 10 opções

(X) Mais de 10 opções

4. No entanto, o GCC não realiza todo o processo sozinho, ele delega parte do processo de criação do executável para dois outros programas: "as" e "ld". O que cada um deles faz?

Dica: utilize, no terminal do Linux, o comando man:

$ man as

$ man ld

Dica: para sair do manual, basta apertar a letra 'q' (quit) no teclado.

as is primarily intended to assemble the output of the GNU C compiler "gcc" for use by the linker "ld".
       Nevertheless, we've tried to make as assemble correctly everything that other assemblers for the same machine would
       assemble.  Any exceptions are documented explicitly.  This doesn't mean as always uses the same syntax as another
       assembler for the same architecture; for example, we know of several incompatible versions of 680x0 assembly
       language syntax.

ld combines a number of object and archive files, relocates their data and ties up symbol references. Usually the
       last step in compiling a program is to run ld.

       ld accepts Linker Command Language files written in a superset of AT&T's Link Editor Command Language syntax, to
       provide explicit and total control over the linking process.

       This man page does not describe the command language; see the ld entry in "info" for full details on the command
       language and on other aspects of the GNU linker.


5. De acordo com o trecho abaixo retirado do manual do GCC:

The “overall options” allow you to stop this process at an intermediate stage.  For example, the -c option says not to run the linker.  Then the output consists of object files output by the assembler.

Podemos pedir que o processo de compilação pare em uma determinada fase da compilação.

Utilizando o comando “gcc --help”, quais opções são responsáveis por:

Parar o processo logo após o pré-processador. gcc -E

Parar o processo logo após gerar as instruções assembly (e antes de compilar). gcc -S

Parar o processo logo depois de compilar e antes de gerar o executável. gcc -c

6. Execute o comando abaixo para ativar o modo verbose, ou seja, o GCC mostrará o que ele está fazendo para compilar o programa:

$ gcc -v  -Wl,-v  -o print  print.c

É possível identificar as fases de compilação nos logs exibidos?

Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/9/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none:hsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu 9.3.0-17ubuntu1~20.04' --with-bugurl=file:///usr/share/doc/gcc-9/README.Bugs --enable-languages=c,ada,c++,go,brig,d,fortran,objc,obj-c++,gm2 --prefix=/usr --with-gcc-major-version-only --program-suffix=-9 --program-prefix=x86_64-linux-gnu- --enable-shared --enable-linker-build-id --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --libdir=/usr/lib --enable-nls --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-gnu-unique-object --disable-vtable-verify --enable-plugin --enable-default-pie --with-system-zlib --with-target-system-zlib=auto --enable-objc-gc=auto --enable-multiarch --disable-werror --with-arch-32=i686 --with-abi=m64 --with-multilib-list=m32,m64,mx32 --enable-multilib --with-tune=generic --enable-offload-targets=nvptx-none=/build/gcc-9-HskZEa/gcc-9-9.3.0/debian/tmp-nvptx/usr,hsa --without-cuda-driver --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04) 
COLLECT_GCC_OPTIONS='-v' '-o' 'print' '-mtune=generic' '-march=x86-64'
 /usr/lib/gcc/x86_64-linux-gnu/9/cc1 -quiet -v -imultiarch x86_64-linux-gnu print.c -quiet -dumpbase print.c -mtune=generic -march=x86-64 -auxbase print -version -fasynchronous-unwind-tables -fstack-protector-strong -Wformat -Wformat-security -fstack-clash-protection -fcf-protection -o /tmp/ccIVMRsd.s
GNU C17 (Ubuntu 9.3.0-17ubuntu1~20.04) version 9.3.0 (x86_64-linux-gnu)
        compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
ignoring nonexistent directory "/usr/local/include/x86_64-linux-gnu"
ignoring nonexistent directory "/usr/lib/gcc/x86_64-linux-gnu/9/include-fixed"
ignoring nonexistent directory "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../x86_64-linux-gnu/include"
#include "..." search starts here:
#include <...> search starts here:
 /usr/lib/gcc/x86_64-linux-gnu/9/include
 /usr/local/include
 /usr/include/x86_64-linux-gnu
 /usr/include
End of search list.
GNU C17 (Ubuntu 9.3.0-17ubuntu1~20.04) version 9.3.0 (x86_64-linux-gnu)
        compiled by GNU C version 9.3.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
Compiler executable checksum: bbf13931d8de1abe14040c9909cb6969
COLLECT_GCC_OPTIONS='-v' '-o' 'print' '-mtune=generic' '-march=x86-64'
 as -v --64 -o /tmp/ccW6aSUd.o /tmp/ccIVMRsd.s
Gnu assembler versão 2.34 (x86_64-linux-gnu) usando versão BFD (GNU Binutils for Ubuntu) 2.34
COMPILER_PATH=/usr/lib/gcc/x86_64-linux-gnu/9/:/usr/lib/gcc/x86_64-linux-gnu/9/:/usr/lib/gcc/x86_64-linux-gnu/:/usr/lib/gcc/x86_64-linux-gnu/9/:/usr/lib/gcc/x86_64-linux-gnu/
LIBRARY_PATH=/usr/lib/gcc/x86_64-linux-gnu/9/:/usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/:/usr/lib/gcc/x86_64-linux-gnu/9/../../../../lib/:/lib/x86_64-linux-gnu/:/lib/../lib/:/usr/lib/x86_64-linux-gnu/:/usr/lib/../lib/:/usr/lib/gcc/x86_64-linux-gnu/9/../../../:/lib/:/usr/lib/
COLLECT_GCC_OPTIONS='-v' '-o' 'print' '-mtune=generic' '-march=x86-64'
 /usr/lib/gcc/x86_64-linux-gnu/9/collect2 -plugin /usr/lib/gcc/x86_64-linux-gnu/9/liblto_plugin.so -plugin-opt=/usr/lib/gcc/x86_64-linux-gnu/9/lto-wrapper -plugin-opt=-fresolution=/tmp/ccrSvcJg.res -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s --build-id --eh-frame-hdr -m elf_x86_64 --hash-style=gnu --as-needed -dynamic-linker /lib64/ld-linux-x86-64.so.2 -pie -z now -z relro -o print /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/Scrt1.o /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/crti.o /usr/lib/gcc/x86_64-linux-gnu/9/crtbeginS.o -L/usr/lib/gcc/x86_64-linux-gnu/9 -L/usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu -L/usr/lib/gcc/x86_64-linux-gnu/9/../../../../lib -L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu -L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/9/../../.. -v /tmp/ccW6aSUd.o -lgcc --push-state --as-needed -lgcc_s --pop-state -lc -lgcc --push-state --as-needed -lgcc_s --pop-state /usr/lib/gcc/x86_64-linux-gnu/9/crtendS.o /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/crtn.o
collect2 version 9.3.0
/usr/bin/ld -plugin /usr/lib/gcc/x86_64-linux-gnu/9/liblto_plugin.so -plugin-opt=/usr/lib/gcc/x86_64-linux-gnu/9/lto-wrapper -plugin-opt=-fresolution=/tmp/ccrSvcJg.res -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s --build-id --eh-frame-hdr -m elf_x86_64 --hash-style=gnu --as-needed -dynamic-linker /lib64/ld-linux-x86-64.so.2 -pie -z now -z relro -o print /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/Scrt1.o /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/crti.o /usr/lib/gcc/x86_64-linux-gnu/9/crtbeginS.o -L/usr/lib/gcc/x86_64-linux-gnu/9 -L/usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu -L/usr/lib/gcc/x86_64-linux-gnu/9/../../../../lib -L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu -L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/9/../../.. -v /tmp/ccW6aSUd.o -lgcc --push-state --as-needed -lgcc_s --pop-state -lc -lgcc --push-state --as-needed -lgcc_s --pop-state /usr/lib/gcc/x86_64-linux-gnu/9/crtendS.o /usr/lib/gcc/x86_64-linux-gnu/9/../../../x86_64-linux-gnu/crtn.o
GNU ld (GNU Binutils for Ubuntu) 2.34
COLLECT_GCC_OPTIONS='-v' '-o' 'print' '-mtune=generic' '-march=x86-64'

