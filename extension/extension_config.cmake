################################################################################
# DuckDB extension base config
################################################################################
#
# This is the base DuckDB extension configuration file. The extensions loaded here are included in every DuckDB build.
# Note that this file is checked into version control; if you want to specify which extensions to load for local
# development, create `extension/extension_config_local.cmake` and specify extensions there.
# The local file is also loaded by the DuckDB CMake build but ignored by version control.

# Parquet is loaded by default on every build as its a essential part of DuckDB
duckdb_extension_load(parquet)
duckdb_extension_load(autocomplete)
duckdb_extension_load(excel)
duckdb_extension_load(fts)
duckdb_extension_load(httpfs)
duckdb_extension_load(icu)
duckdb_extension_load(inet)
duckdb_extension_load(json)
duckdb_extension_load(visualizer)
duckdb_extension_load(tpch)
duckdb_extension_load(tpcds)


# Jemalloc is enabled by default for linux. MacOS malloc is already good enough and Jemalloc on windows has issues.
if(NOT WASM_LOADABLE_EXTENSIONS AND NOT CLANG_TIDY AND OS_NAME STREQUAL "linux" AND NOT ANDROID AND NOT ZOS)
    duckdb_extension_load(jemalloc)
endif()
