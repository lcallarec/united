project('united', ['vala', 'c'], version: '0.1')

cc = meson.get_compiler('c')
libm = cc.find_library('m', required: true)

glib = dependency('glib-2.0')
gobject = dependency('gobject-2.0')

vala_args = ['--target-glib=2.50']

deps = [
  glib,
  gobject,
  libm
]

subdir('src')
subdir('tests')