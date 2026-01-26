#!/usr/bin/env python3
"""Minimal validation of generated artifacts.

Usage:
  python3 scripts/validate_artifacts.py <path-to-initiative-folder>

Checks:
- required files exist
- each file has a few required headings/keywords
"""
import sys
from pathlib import Path

REQUIRED = [
  "product-brief.md",
  "hypothesis-and-metrics.md",
  "data-plan.md",
  "execution-plan.md",
  "decision-log.md",
]

REQUIRED_MARKERS = {
  "product-brief.md": ["# Product Brief", "## 1) Problema", "## 5) Métricas"],
  "hypothesis-and-metrics.md": ["# Hipótesis", "## Métricas", "## Criterio de decisión"],
  "data-plan.md": ["# Data Plan", "## 1) Señales", "## 3) Instrumentación"],
  "execution-plan.md": ["# Execution Plan", "## Top 3", "## On-hold"],
  "decision-log.md": ["# Decision Log", "| Fecha | Decisión |"],
}

def main():
  if len(sys.argv) < 2:
    print("Usage: validate_artifacts.py <initiative-folder>")
    return 2
  folder = Path(sys.argv[1])
  if not folder.exists():
    print(f"Folder does not exist: {folder}")
    return 2

  ok = True
  for f in REQUIRED:
    p = folder / f
    if not p.exists():
      print(f"MISSING: {p}")
      ok = False
      continue
    content = p.read_text(encoding="utf-8", errors="ignore")
    for marker in REQUIRED_MARKERS.get(f, []):
      if marker not in content:
        print(f"WARN: {p} missing marker: {marker}")
        ok = False

  if ok:
    print("OK: artifacts look good")
    return 0
  print("NOT OK: please fix warnings/missing files")
  return 1

if __name__ == "__main__":
  raise SystemExit(main())
