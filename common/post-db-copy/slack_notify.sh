#!/bin/sh
#
# Cloud Hook: post-code-deploy
#
# The post-code-deploy hook is run whenever you use the Workflow page to
# deploy new code to an environment, either via drag-drop or by selecting
# an existing branch or tag from the Code drop-down list. See
# ../README.md for details.
#
# Usage: post-db-copy site target-env db-name source-env

site="$1"
target_env="$2"
db_name="$3"
source_env="$4"

# Load the Slack webhook URL (which is not stored in this repo).
## . $HOME/slack_settings

SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"
# Post deployment notice to Slack

curl -X POST --data-urlencode "payload={\"username\": \"Acquia Cloud\", \"text\": \"Copied *$db-name* database from *$source_env* to *$target_env* on *$site*.\", \"icon_emoji\": \":ghost:\"}" $SLACK_WEBHOOK_URL
