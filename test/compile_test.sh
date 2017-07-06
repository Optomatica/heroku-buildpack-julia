#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompile()
{
  capture ${BUILDPACK_HOME}/bin/compile ${BUILD_DIR} ${CACHE_DIR}
  assertEquals 0 ${rtrn}
  assertEquals "" "`cat ${STD_ERR}`"

  assertContains "-----> Downloading julia-"  "`cat ${STD_OUT}`"
  assertTrue "Should have cached Julia tar.gz file `ls -la ${CACHE_DIR}`" "[ -f ${CACHE_DIR}/julia-v0.3.0.tar.gz ]"

  assertContains "-----> Installing julia-"  "`cat ${STD_OUT}`"
  assertTrue "Should have installed julia in build dir: `ls -la ${BUILD_DIR}`" "[ -d ${BUILD_DIR}/.julia ]"

  # Run again to ensure cache is used.
  rm -rf ${BUILD_DIR}/*
  resetCapture

  capture ${BUILDPACK_HOME}/bin/compile ${BUILD_DIR} ${CACHE_DIR}
  assertNotContains "-----> Downloading julia-"  "`cat ${STD_OUT}`"

  assertEquals 0 ${rtrn}
  assertEquals "" "`cat ${STD_ERR}`"
}
