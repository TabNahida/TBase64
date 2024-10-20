add_rules("mode.release", "mode.debug")

option("tab_repo")
    set_default(true)
    set_showmenu(true)
option_end()

add_languages("cxx20")

if not has_config("tab_repo") then
    add_repositories("tab-repo https://github.com/TabNahida/repo-xmake.git")
end
add_requires("tstring")
add_requires("xsimd")

target("tbase64")
    set_kind("static")
    add_files("src/TBase64.cpp")
    add_headerfiles("include/TBase64.hpp")
    add_packages("xsimd", "tstring")
    add_includedirs("include")
target_end()

target("MainTest")
    set_kind("binary")
    add_files("src/main.cpp")
    add_deps("tbase64")
    add_packages("tstring")
    add_includedirs("include")
target_end()

target("BenchMark")
    set_kind("binary")
    add_files("src/benchmark.cpp")
    add_deps("tbase64")
    add_packages("tstring")
    add_includedirs("include")
target_end()