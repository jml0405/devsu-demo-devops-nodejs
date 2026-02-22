#!/usr/bin/env python3
import argparse
import json
import os
from pathlib import Path


def load_version(repo_root: Path) -> str:
    package_path = repo_root / "package.json"
    with package_path.open("r", encoding="utf-8") as handle:
        package = json.load(handle)
    return package.get("version") or "0.0.0"


def build_tag(version: str) -> str:
    run_number = os.getenv("GITHUB_RUN_NUMBER") or "0"
    sha = os.getenv("GITHUB_SHA") or ""
    short_sha = sha[:7] if sha else ""

    tag = f"v{version}-{run_number}"
    if short_sha:
        tag = f"{tag}-{short_sha}"
    return tag


def write_outputs(tag: str, output_file: str) -> None:
    output_path = Path(output_file)
    output_path.write_text(tag, encoding="utf-8")

    github_output = os.getenv("GITHUB_OUTPUT")
    if github_output:
        with open(github_output, "a", encoding="utf-8") as handle:
            handle.write(f"image_tag={tag}\n")


def main() -> None:
    parser = argparse.ArgumentParser(description="Compute a Docker image tag for CI.")
    parser.add_argument("--output", default="image_tag.txt", help="File to write the tag.")
    args = parser.parse_args()

    repo_root = Path(__file__).resolve().parents[1]
    version = load_version(repo_root)
    tag = build_tag(version)
    write_outputs(tag, args.output)

    print(tag)


if __name__ == "__main__":
    main()
