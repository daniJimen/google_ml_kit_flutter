#!/usr/bin/env python3
"""
Downloads Google ML Kit XCFrameworks from Google's CDN for SPM integration.

This script downloads the required Google ML Kit framework archives (.tar.gz),
extracts the .xcframework bundles, and places them in the mlkit_frameworks/Frameworks/
directory for use via Swift Package Manager binaryTarget references.
"""

import hashlib
import json
import os
import shutil
import subprocess
import sys
import tarfile
import tempfile
import urllib.request
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
FRAMEWORKS_DIR = SCRIPT_DIR / "Frameworks"

FRAMEWORKS = {
    "MLKitBarcodeScanning": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitBarcodeScanning.xcframework",
    },
    "MLKitCommon": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitCommon.xcframework",
    },
    "MLKitDigitalInkRecognition": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitDigitalInkRecognition.xcframework",
    },
    "MLKitEntityExtraction": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitEntityExtraction.xcframework",
    },
    "MLKitFaceDetection": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitFaceDetection.xcframework",
    },
    "MLKitImageLabeling": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitImageLabeling.xcframework",
    },
    "MLKitImageLabelingCommon": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitImageLabelingCommon.xcframework",
    },
    "MLKitImageLabelingCustom": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitImageLabelingCustom.xcframework",
    },
    "MLKitLanguageID": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitLanguageID.xcframework",
    },
    "MLKitLinkFirebase": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitLinkFirebase.xcframework",
    },
    "MLKitObjectDetection": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitObjectDetection.xcframework",
    },
    "MLKitObjectDetectionCommon": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitObjectDetectionCommon.xcframework",
    },
    "MLKitObjectDetectionCustom": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitObjectDetectionCustom.xcframework",
    },
    "MLKitPoseDetection": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitPoseDetection.xcframework",
    },
    "MLKitPoseDetectionAccurate": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitPoseDetectionAccurate.xcframework",
    },
    "MLKitPoseDetectionCommon": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitPoseDetectionCommon.xcframework",
    },
    "MLKitSegmentationCommon": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitSegmentationCommon.xcframework",
    },
    "MLKitSegmentationSelfie": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitSegmentationSelfie.xcframework",
    },
    "MLKitSmartReply": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitSmartReply.xcframework",
    },
    "MLKitTextRecognition": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitTextRecognition.xcframework",
    },
    "MLKitTextRecognitionCommon": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitTextRecognitionCommon.xcframework",
    },
    "MLKitTextRecognitionChinese": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitTextRecognitionChinese.xcframework",
    },
    "MLKitTextRecognitionDevanagari": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitTextRecognitionDevanagari.xcframework",
    },
    "MLKitTextRecognitionJapanese": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitTextRecognitionJapanese.xcframework",
    },
    "MLKitTextRecognitionKorean": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitTextRecognitionKorean.xcframework",
    },
    "MLKitTranslate": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitTranslate.xcframework",
    },
    "MLKitVision": {
        "url": "https://dl.google.com/dl/cpdc/4e1652530984149e/MLKitVision-10.0.0.tar.gz",
        "framework_path": "Frameworks/MLKitVision.framework",
    },
    "MLKitVisionKit": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitVisionKit.xcframework",
    },
    "MLKitXenoCommon": {
        "url": "https://dl.google.com/dl/cpdc/019adaeea9e4ebc0/GoogleMLKit-9.0.0.tar.gz",
        "framework_path": "Carthage/Build/MLKitXenoCommon.xcframework",
    },
}


def download_file(url, dest_path):
    """Download a file from url to dest_path with progress reporting."""
    print(f"  Downloading {url}")
    try:
        urllib.request.urlretrieve(url, dest_path)
    except Exception as e:
        print(f"  Error downloading: {e}")
        raise


def extract_tar_gz(tar_path, extract_dir):
    """Extract a .tar.gz archive."""
    print(f"  Extracting {tar_path}")
    with tarfile.open(tar_path, "r:gz") as tar:
        tar.extractall(path=extract_dir)


def find_framework(extract_dir, framework_name):
    """Find a .xcframework or .framework in the extracted directory."""
    xcframework = os.path.join(extract_dir, f"{framework_name}.xcframework")
    if os.path.exists(xcframework):
        return xcframework

    framework = os.path.join(extract_dir, f"{framework_name}.framework")
    if os.path.exists(framework):
        return framework

    for root, dirs, files in os.walk(extract_dir):
        for d in dirs:
            if d == f"{framework_name}.xcframework" or d == f"{framework_name}.framework":
                return os.path.join(root, d)

    return None


def compute_checksum(path):
    """Compute SHA256 checksum of a file or directory."""
    sha256 = hashlib.sha256()
    if os.path.isdir(path):
        for root, dirs, files in sorted(os.walk(path)):
            for fname in sorted(files):
                fpath = os.path.join(root, fname)
                sha256.update(fpath.encode())
                with open(fpath, "rb") as f:
                    while True:
                        chunk = f.read(65536)
                        if not chunk:
                            break
                        sha256.update(chunk)
    else:
        with open(path, "rb") as f:
            while True:
                chunk = f.read(65536)
                if not chunk:
                    break
                sha256.update(chunk)
    return sha256.hexdigest()


def main():
    print("=" * 60)
    print("Google ML Kit Frameworks Downloader")
    print("=" * 60)

    os.makedirs(FRAMEWORKS_DIR, exist_ok=True)

    download_cache = {}
    missing = []
    for name in FRAMEWORKS:
        framework = FRAMEWORKS_DIR / f"{name}.xcframework"
        if not os.path.exists(framework):
            framework = FRAMEWORKS_DIR / f"{name}.framework"
        if os.path.exists(framework):
            print(f"  [OK] {name} already exists")
        else:
            missing.append(name)
            print(f"  [MISSING] {name}")

    if not missing:
        print("\nAll frameworks are already downloaded.")
        return 0

    print(f"\n{len(missing)} frameworks need to be downloaded.")
    print("This may take a while (the GoogleMLKit archive is ~500MB).\n")
    answer = input("Continue? [y/N] ")
    if answer.lower() not in ("y", "yes"):
        print("Aborted.")
        return 0

    with tempfile.TemporaryDirectory() as tempdir:
        temp_dir = Path(tempdir)

        for name in missing:
            info = FRAMEWORKS[name]
            url = info["url"]

            print(f"\nProcessing {name}...")

            try:
                cache_key = url
                if cache_key not in download_cache:
                    tar_path = temp_dir / f"download_{len(download_cache)}.tar.gz"
                    download_file(url, tar_path)
                    extract_dir = temp_dir / f"extract_{len(download_cache)}"
                    os.makedirs(extract_dir)
                    extract_tar_gz(str(tar_path), str(extract_dir))
                    download_cache[cache_key] = extract_dir
                else:
                    print("  (using cached download)")

                extract_dir = download_cache[cache_key]
                src_framework = find_framework(str(extract_dir), name)

                if src_framework is None:
                    print(f"  Error: Could not find {name} framework in archive")
                    print(f"  Contents of {extract_dir}:")
                    for item in sorted(os.listdir(str(extract_dir))):
                        print(f"    {item}")
                    continue

                dest = FRAMEWORKS_DIR / os.path.basename(src_framework)
                if os.path.exists(dest):
                    shutil.rmtree(dest)
                shutil.copytree(src_framework, str(dest))
                print(f"  [OK] {name} -> {dest}")

            except Exception as e:
                print(f"  [ERROR] Failed to process {name}: {e}")

    print("\nDone!")
    return 0


if __name__ == "__main__":
    sys.exit(main())
