project('united', ['vala', 'c'], version: '0.7')

cc = meson.get_compiler('c')
libm = cc.find_library('m', required: true)

glib = dependency('glib-2.0')
gobject = dependency('gobject-2.0')

vala_args = []

if get_option('debug') == true
  vala_args += ['--ccode', '--debug']
endif

deps = [
  glib,
  gobject,
  libm
]

subdir('src')
subdir('tests')