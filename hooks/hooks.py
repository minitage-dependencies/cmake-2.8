import os
import shutil



def h(options, buildout):
    compile_dir=options["compile-directory"]
    bd=buildout['buildout']["directory"]
    f =  open(os.path.join(buildout['buildout']['directory'], 'cmake.cmake'), 'w')
    f.write(buildout['init']['init']+"\n")
    os.environ['LDFLAGS'] = os.environ.get('LDFLAGS', '') + ' -lz -lcurl -lexpat'
    p(options, buildout)


def p(options, buildout):
    compile_dir=options["compile-directory"]
    bd=buildout['buildout']["directory"]
    hd = os.path.join(bd, 'helpers')
    for i in os.listdir(hd):
        print "Patching %s" % i
        hdfp = os.path.join(hd, i)
        fp = os.path.join(compile_dir, 'Modules', i)
        content = open(hdfp).read()
        content = content.replace('_BUILDOUT_DIRECTORY_', bd)
        content = content.replace('___NCURSES_', buildout['locations']['ncurses'])
        content = content.replace('___EXPAT_', buildout['locations']['expat'])
        content = content.replace('___CURL_', buildout['locations']['curl'])
        content = content.replace('___ZLIB_', buildout['locations']['zlib'])
        f = open(fp, 'w')
        f.write(content)
        f.close()

        
        
        






