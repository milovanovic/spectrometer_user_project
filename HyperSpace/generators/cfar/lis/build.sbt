def scalacOptionsVersion(scalaVersion: String): Seq[String] = {
  Seq() ++ {
    // If we're building with Scala > 2.11, enable the compile option
    //  switch to support our anonymous Bundle definitions:
    //  https://github.com/scala/bug/issues/10047
    CrossVersion.partialVersion(scalaVersion) match {
      case Some((2, scalaMajor: Long)) if scalaMajor < 12 => Seq()
      case _ => Seq("-Xsource:2.11")
    }
  }
}

def javacOptionsVersion(scalaVersion: String): Seq[String] = {
  Seq() ++ {
    // Scala 2.12 requires Java 8, but we continue to generate
    //  Java 7 compatible code until we need Java 8 features
    //  for compatibility with old clients.
    CrossVersion.partialVersion(scalaVersion) match {
      case Some((2, scalaMajor: Long)) if scalaMajor < 12 =>
        Seq("-source", "1.7", "-target", "1.7")
      case _ =>
        Seq("-source", "1.8", "-target", "1.8")
    }
  }
}

name := "lis"
version := "1.0-SNAPSHOT"
scalaVersion := "2.12.12"
crossScalaVersions := Seq("2.12.12", "2.11.12")
javacOptions ++= javacOptionsVersion(scalaVersion.value)
scalacOptions ++= scalacOptionsVersion(scalaVersion.value)

//libraryDependencies += "edu.berkeley.cs" %% "dsptools" % "1.3.1"
libraryDependencies += "edu.berkeley.cs" %% "rocket-dsptools" % "1.2-SNAPSHOT"

resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases")
)
