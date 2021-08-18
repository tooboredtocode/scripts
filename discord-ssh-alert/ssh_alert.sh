#!/bin/bash

# MIT License
#
# Copyright (c) 2021 tooboredtocode
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

if [[ $PAM_TYPE = "open_session" ]]
then
    TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    TOKEN="webhook-token-here"

    DATA="{
    \"content\": \"<@your-id-here> user $PAM_USER has logged in via ssh!\",
    \"embeds\": [
        {
        \"title\": \"Login Event\",
        \"color\": 16711680,
        \"fields\": [
            {
            \"name\": \"User\",
            \"value\": \"$PAM_USER\",
            \"inline\": true
            },
            {
            \"name\": \"IP\",
            \"value\": \"$PAM_RHOST\",
            \"inline\": true
            },
            {
            \"name\": \"Service\",
            \"value\": \"$PAM_SERVICE\",
            \"inline\": true
            },
            {
            \"name\": \"TTY\",
            \"value\": \"$PAM_TTY\",
            \"inline\": true
            }
        ],
        \"timestamp\": \"$TIMESTAMP\"
        }
    ]
    }"

    curl -H "Content-Type: application/json" \
    -d "$DATA" \
    $TOKEN

fi 
exit 0

