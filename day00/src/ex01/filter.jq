def header:
  ["id", "created_at", "name", "has_test", "alternate_url"];

(header | @csv),
(.items[] | [.id, .created_at, .name, .has_test, .alternate_url] | @csv)
