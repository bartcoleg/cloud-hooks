#!/bin/sh
#
# Cloud Hook: post-code-deploy
#
# The post-code-deploy hook is run whenever you use the Workflow page to
# deploy new code to an environment, either via drag-drop or by selecting
# an existing branch or tag from the Code drop-down list. See
# ../README.md for details.
#
# Usage: post-files-copy site target-env source-env

site="$1"
target_env="$2"
source_env="$3"

# Load the Slack webhook URL (which is not stored in this repo).
## . $HOME/slack_settings
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"
# Post deployment notice to Slack

curl -X POST --data-urlencode "payload={\"username\": \"Acquia Cloud\", \"text\": \"Copying files from *$target_env* to *$source_env* on *$site*.\", \"icon_emoji\": \":ghost:\"}" $SLACK_WEBHOOK_URL
