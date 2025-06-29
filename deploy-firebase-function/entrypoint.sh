#!/bin/sh

if [ -z "${FIREBASE_TOKEN}" ]; then
    echo "❌ FIREBASE_TOKEN is missing"
    exit 1
fi

if [ -z "${FUNCTION_NAME}" ]; then
    echo "❌ FUNCTION_NAME is missing"
    exit 1
fi

if [ -z "${PROJECT_ID}" ]; then
    echo "❌ PROJECT_ID is missing"
    exit 1
fi

if [ -z "${PROJECT_PATH}" ]; then
    echo "❌ PROJECT_PATH is missing"
    exit 1
fi

cd ${PROJECT_PATH} || exit 1; 

firebase deploy \
    -m "${GITHUB_REF} (${GITHUB_SHA})" \
    --token ${FIREBASE_TOKEN} \
    --only functions:${FUNCTION_NAME} \
    --project ${PROJECT_ID}
