/** Project */
name := "JBullet"

version := "2.72"
    
organization := "com.bulletphysics"

scalaVersion := "2.9.1"

// Dependencies 
libraryDependencies ++= Seq(
"java3d" % "vecmath" % "1.3.1",
"org.lwjgl.lwjgl" % "lwjgl" % "2.8.1",
"org.lwjgl.lwjgl" % "lwjgl_util" % "2.8.1",
"asm" % "asm-all" % "3.3.1",
"org.swinglabs" % "swing-layout" % "1.0.3"
)