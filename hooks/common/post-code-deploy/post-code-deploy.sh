#!/bin/sh
#
# Cloud Hook: Rebuild the cache and run any pending database updates.
#
# Run `drush cache-rebuild` and `drush updatedb` in the target environment.

site="$1"
target_env="$2"

/usr/local/bin/drush9 --version
/usr/local/bin/drush9 @$site.$target_env cache-rebuild --yes
/usr/local/bin/drush9 @$site.$target_env updatedb --yes
/usr/local/bin/drush9 @$site.$target_env cache-rebuild --yes
/usr/local/bin/drush9 @$site.$target_env config-import --no-interaction
/usr/local/bin/drush9 @$site.$target_env cache-rebuild --yes
