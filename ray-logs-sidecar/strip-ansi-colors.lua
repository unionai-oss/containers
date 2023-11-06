-- From: https://github.com/fluent/fluent-bit/discussions/6151#discussioncomment-4392962
function strip_ansi_colors(tag, timestamp, record)
  if type(record["log"]) == "string" then
    -- strip ansi https://stackoverflow.com/a/49209650/368691
    record["log"] = record["log"]:gsub('[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]', '')

    return 2, 0, record
  end

  return 0, 0, 0
end
