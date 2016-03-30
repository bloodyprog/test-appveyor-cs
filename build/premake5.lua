-- test-appveyor-cs

workspace("AppVeyor")
    configurations( { "Debug", "Release" } )
    location( _ACTION )

    configuration("Debug")
        targetdir("../output/bin/debug")
        objdir("../output/tmp/debug")

    configuration( "Release" )
        targetdir("../output/bin/release")
        objdir("../output/tmp/release")

project("TestCSharp.NUnit")
    kind("SharedLib")
    language("C#")

    files { "../src/TestCSharp/**.cs" }

    links { "C:/Tools/NUnit3/bin/net-4.5/nunit.framework.dll" }

    configuration { "vs*" }
        postbuildcommands { "nunit3-console.exe $(TargetPath)" }
