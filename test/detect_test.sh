#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDetect()
{
  touch ${BUILD_DIR}/REQUIRE

  capture ${BUILDPACK_HOME}/bin/detect ${BUILD_DIR}

  assertEquals 0 ${rtrn}
  assertEquals "Julia" "$(cat ${STD_OUT})"
  assertEquals "" "$(cat ${STD_ERR})"
}

testNoDetectMissingRequire()
{
  mkdir ${BUILD_DIR}/something

  capture ${BUILDPACK_HOME}/bin/detect ${BUILD_DIR}

  assertEquals 1 ${rtrn}
  assertEquals "no" "$(cat ${STD_OUT})"
  assertEquals "" "$(cat ${STD_ERR})"
}
