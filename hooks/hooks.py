import os
import shutil

def h(options, buildout):
    compile_dir=options["compile-directory"]
    bd=buildout['buildout']["directory"]
    f =  open(os.path.join(buildout['buildout']['directory'], 'cmake.cmake'), 'w')
    f.write(buildout['init']['init']+"\n")
    par = {}
    par['z'] = "%s/lib" % buildout['locations']['zlib']
    par['a'] = "%s/lib" % buildout['locations']['libarchive']
    par['b'] = "%s/lib" % buildout['locations']['bzip2']
    par['c'] = "%s/lib" % buildout['locations']['curl']
    par['s'] = "%s/lib" % buildout['locations']['ssl']
    os.environ['LDFLAGS'] = (os.environ.get('LDFLAGS', '') + (' '
                                                              '-L%(s)s -Wl,-rpath -Wl,%(s)s '
                                                              '-L%(c)s -Wl,-rpath -Wl,%(c)s '
                                                              '-L%(b)s -Wl,-rpath -Wl,%(b)s '
                                                              '-L%(a)s -Wl,-rpath -Wl,%(a)s '
                                                              '-L%(z)s -Wl,-rpath -Wl,%(z)s '
                                                              '-lz -lcurl -lexpat -lbz2 -larchive'%par)).strip()
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
        content = content.replace('___BZIP2_', buildout['locations']['bzip2'])
        content = content.replace('___CURL_', buildout['locations']['curl'])
        content = content.replace('___LibArchive_', buildout['locations']['libarchive'])
        content = content.replace('___ZLIB_', buildout['locations']['zlib'])
        content = content.replace('___SSL_', buildout['locations']['ssl'])
        f = open(fp, 'w')
        f.write(content)
        f.close()

