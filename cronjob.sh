#!/bin/bash

# Create the cron job file directly in /etc/cron.d/
cat <<EOF > /etc/cron.d/auto_convert
*/5 * * * * /bin/bash /app/kcc/auto_convert.sh >> /var/log/auto_convert.log 2>&1
EOF

# Set appropriate permissions (0600 is often preferred for security)
chmod 0600 /etc/cron.d/auto_convert

# (Optional) Log the creation of the cron job for auditing
echo "$(date): Created/updated cron job /etc/cron.d/auto_convert" >> /var/log/cron_setup.log

# No need for 'cron -f'

echo "Cron job created/updated successfully."
