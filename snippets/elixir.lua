return {
  s("li",
    { t("require Logger; Logger.info("), i(1, "message"), t(")") }),
  s("le",
    { t("require Logger; Logger.error("), i(1, "message"), t(")") }),
  s("ld",
    { t("require Logger; Logger.debug("), i(1, "message"), t(")") }),
  s("lw",
    { t("require Logger; Logger.warn("), i(1, "message"), t(")") }),
  s("i",
    { t("IO.inspect("), i(1, "message"), t(", label: \"домат\")") }),
  }

