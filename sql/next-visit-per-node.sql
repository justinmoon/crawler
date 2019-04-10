SELECT id, next_visit - strftime('%s','now') AS countdown
FROM nodes
ORDER BY countdown ASC