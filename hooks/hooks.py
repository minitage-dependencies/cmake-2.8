import os

def h(options, buildout):
    compile_dir=options["compile-directory"]
    f =  open(os.path.join(buildout['buildout']['directory'], 'cmake.cmake'), 'w')
    f.write(buildout['init']['init']+"\n")
    os.environ['LDFLAGS'] = os.environ.get('LDFLAGS', '') + '-lz -lcurl -lexpat'



