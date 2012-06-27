#!/bin/sh
# TODO the fast tool should be downloaded directly as an executable jar file.
# Once that's available, we can get rid of these mvn commands and the pom file.
mvn -f ../flatpack-java/fast/pom.xml install
mvn -q compile dependency:copy-dependencies || exit 1
java \
  -cp target/classes/:$(echo $(ls target/dependency/*.jar) |  sed 's/ /:/g') \
  com.getperka.flatpack.fast.FastTool \
    --RbDialect.gemName perka \
    --RbDialect.moduleName Perka \
    --RbDialect.modelModuleName Model \
    generate --dialect rb --out target $@
