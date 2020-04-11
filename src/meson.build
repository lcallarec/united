sources = files(
    'Prefix.vala',
    'Value.vala',
    'Bytes.vala',
)

united_static_lib = static_library('united', [sources], dependencies: deps, vala_args: vala_args)
united_dep = declare_dependency(include_directories: include_directories('.'), link_with: united_static_lib)
