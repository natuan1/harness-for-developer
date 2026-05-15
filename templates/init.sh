#!/bin/bash
set -e

echo "=== Hybrid Harness Initialization ==="

# Verify spec structure exists
if [ ! -d "docs/specs" ]; then
  echo "Warning: docs/specs/ directory not found. Run /constitution and /specify first."
fi

# Verify harness structure exists
if [ ! -d "docs/harness" ]; then
  echo "Warning: docs/harness/ directory not found. Create harness structure first."
fi

# Verify environment
npm install
npm run check
npm test
npm run build

echo "=== Verification Complete ==="
echo ""
echo "Next steps:"
echo "1. Read docs/harness/feature-list.json for current feature state"
echo "2. Read docs/harness/progress.md for last session context"
echo "3. Pick ONE task from the current feature"
echo "4. Implement only that task"
echo "5. Run verification before claiming done"
