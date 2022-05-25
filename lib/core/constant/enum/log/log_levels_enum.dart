enum LogLevelEnum {
  INFO("info"),
  WARN("warn"),
  ERROR("error"),
  VERBOSE("verbose"),
  DEBUG("debug"),
  TERRIBLE_FAILURE("terrible_failure");

  final String levelName;
  const LogLevelEnum(this.levelName);
}
