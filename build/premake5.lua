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

project("TestCSharp.NUnit-2.6.4")
    kind("SharedLib")
    language("C#")

    files { "../src/TestCSharp.NUnit-2.6.4/**.cs" }

    links { "dependencies/nunit-2.6.4/NUnit-2.6.4/bin/nunit.framework.dll" }

    configuration { "vs*" }
        postbuildcommands { "\"$(SolutionDir)..\\dependencies\\nunit-2.6.4\\NUnit-2.6.4\\bin\\nunit-console.exe\" $(TargetPath)" }

project("TestCSharp.NUnit-3.2.0")
    kind("SharedLib")
    language("C#")

    files { "../src/TestCSharp.NUnit-3.2.0/**.cs" }

    links { "dependencies/nunit-3.2.0/bin/nunit.framework.dll" }

    configuration { "vs*" }
        postbuildcommands { "\"$(SolutionDir)..\\dependencies\\nunit-3.2.0\\bin\\nunit3-console.exe\" $(TargetPath)" }
