#!/data/data/com.termux/files/usr/bin/bash

set -uo pipefail
set +H

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

CLOSE_REQUESTED=0

if [ "${1:-}" = "--close" ]; then
    CLOSE_REQUESTED=1
elif [ "${1:-}" = "--help" ]; then
    echo "Usage: validate.sh [--close]"
    echo "--close: intended for execution using exec to close the shell."
    exit 0
elif [ "$#" -gt 0 ]; then
    echo "[ERROR] Unknown argument: $1"
    exit 2
fi

echo "======================================"
echo "       GODSEYE VALIDATION"
echo "======================================"

cd "$ROOT_DIR" || exit 2

echo
echo "===== PROJECT DIRECTORY ====="
echo "$ROOT_DIR"

echo
echo "===== REQUIRED TOOLS ====="

for tool in node npm; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "[FAILED] Required tool missing: $tool"
        exit 2
    fi
    echo "[OK] $tool: $(command -v "$tool")"
done

echo
echo "===== TYPESCRIPT CONFIGURATION VALIDATION ====="

if [ ! -f package.json ]; then
    echo "[FAILED] Root package.json missing."
    exit 2
fi

if [ ! -f apps/web/package.json ]; then
    echo "[FAILED] Web workspace package.json missing."
    exit 2
fi

if [ ! -f apps/web/tsconfig.json ]; then
    echo "[FAILED] Web tsconfig.json missing."
    exit 2
fi

if ! node - "$ROOT_DIR" <<'NODE'
const fs = require("node:fs");
const path = require("node:path");

const root = process.argv[2];
const rootPackage = JSON.parse(
  fs.readFileSync(path.join(root, "package.json"), "utf8")
);
const webPackage = JSON.parse(
  fs.readFileSync(path.join(root, "apps/web/package.json"), "utf8")
);

function check(condition, message) {
  if (!condition) {
    console.error("[FAILED] " + message);
    process.exitCode = 1;
  } else {
    console.log("[OK] " + message);
  }
}

check(
  rootPackage.workspaces?.includes("apps/web"),
  "Root npm workspace includes apps/web"
);

check(
  rootPackage.scripts?.typecheck?.includes("--workspace=@godseye/web"),
  "Root typecheck delegates to @godseye/web"
);

check(
  webPackage.name === "@godseye/web",
  "Web workspace package name is correct"
);

check(
  webPackage.scripts?.typecheck === "tsc --noEmit",
  "Web TypeScript check uses tsc --noEmit"
);

NODE
then
    echo "[FAILED] Configuration validation failed."
    exit 2
fi

echo
echo "===== TYPESCRIPT CHECK ====="

if npm run typecheck; then
    STATUS=0
else
    STATUS=$?
fi

echo
echo "===== FINAL VALIDATION REPORT ====="

if [ "$STATUS" -eq 0 ]; then
    echo "[SUCCESS] GODSEYE TYPESCRIPT VALIDATION PASSED"
else
    echo "[FAILED] GODSEYE TYPESCRIPT VALIDATION FAILED"
fi

echo "Exit code: $STATUS"

if [ "$CLOSE_REQUESTED" -eq 1 ]; then
    echo "[INFO] Close mode requested."
    echo "[INFO] When launched with exec, this session will now end."
fi

exit "$STATUS"
