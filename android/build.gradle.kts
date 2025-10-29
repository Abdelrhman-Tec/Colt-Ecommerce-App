allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory
    .dir("../../build")
    .get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir = rootProject.buildDir.resolve(project.name)
    project.buildDir = newSubprojectBuildDir
    project.layout.buildDirectory.set(newSubprojectBuildDir)
    
    project.evaluationDependsOn(":app")
}

// task clean
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
