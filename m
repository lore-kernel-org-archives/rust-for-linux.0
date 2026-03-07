Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13B518B0A;
	Sat,  7 Mar 2026 23:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772926238; cv=none; b=M7sgOu/lMSHzn3wDzTIllt9q1CzRk8rVyzcAkuz4OOvmtTJL/ZSuzmucpOzKVh99QTPLNLcd2dtZeHlUWltWwFavZzSQ15WPHpsVpkUPA5uieca9yXh7cQZKpdGw0ZNsX/w+Gia8KTZbufdfrWH7ywG2C9hfBbvWLxmnA5nsgFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772926238; c=relaxed/simple;
	bh=8JsQjYZfZUuMPbxlbCPswcSPJk07ouEB9KBD1oDfweM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IsaB4wHKZM+pxIIHQ1ub8w3+rvJHXmIeGxyc88PiFGXaRoMylKooDm3hlxU+XaUP89aDItjxh/i3v+lj213w3yHjBQKuKqpzobQgwlmkhzcpG665lDvMWhk96kr5HIdTeEmkrCvGU0zopOTBk6oMVUZmjsK3rrJrInXAQnNRBWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fc3xhqPa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fc3xhqPa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C476C2BCAF;
	Sat,  7 Mar 2026 23:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772926238;
	bh=8JsQjYZfZUuMPbxlbCPswcSPJk07ouEB9KBD1oDfweM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fc3xhqPa21oFWD70T7qPyLpAzoMfkFM9SXd8ELLkheVBPOefOBFp1iglINAfWL7Iw
	 yIUM2ojMLAiu1hjf68gHYCLOF/UQDzyUh9t14ZG4HIdR/CccwNrE71pMoimb5iBpzk
	 9Z7TYKjDac+VGu0hGXS1CSaDaLGSB20jBXV+tE3Wn4O3rELI+ZKR5+GhQlDiSQcgwT
	 7cReioFsSvofgyaNnjcMoPsVfr616jWID0QHyJjsggnKHa7/ldJMIQ60nZXU61SYZW
	 fK7uYH92i8gTYLPJ8Ha1ieHiqF/tZW7z1hk5mZqbcV1s7l9JqGOILaDygnk+I6WwpV
	 WB1+JIIVs1G2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6A4F55121;
	Sat,  7 Mar 2026 23:30:38 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Sun, 08 Mar 2026 08:30:34 +0900
Subject: [PATCH v3 1/2] scripts: generate_rust_analyzer.py: add versioning
 infrastructure
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-ra-fix-primitive-v3-1-598017bcefd8@gmail.com>
References: <20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com>
In-Reply-To: <20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13589;
 i=y.j3ms.n@gmail.com; h=from:subject:message-id;
 bh=D6HY3hLIBeeZoqxbSZ+6YmrmEavmnlnC1kfSnVinmeg=;
 b=owJ4nAFtApL9kA0DAAoBhnBYoOPQ2LoByyZiAGmstR170m8s8i1bbuNS6qdKM0PM1Yz/EDQWC
 79WX8J9DMS5mokCMwQAAQoAHRYhBNJuBqTTLsbEgOaQ0IZwWKDj0Ni6BQJprLUdAAoJEIZwWKDj
 0Ni6yPkQAJ/83fGOtNXY0NY70wtp9jy0F2kHM4AgGTtlZGBjMU7hq4WoKo/+/jX8l3O5YJ0MEIy
 UrUwjt7esfLfsU1ADcTQmd2D2lU7XkmW0ajmlZsIMHYjiYhrkBmbeFnFaGJvsOamWaRxk7CHHrK
 wal8KJkM9qQM4qeHLaq1koX9LKBziW0Uz8OvEmLPQGSlf6Qb/CbyB9zUI7fx7qSaePq99+beopq
 rrlt40fDosP7CimItbBj8E9LZAnAEg1BR4xmPYhAxtU7vL9tfg4eW2qbhEmDs40wE44UIunK8Gl
 bf07IIxvKfjedRoFQveJGM5+chCUt3zqKqisGoLqQV3zT4OrD6H40WRKWw8E2UqCsSZLiZkzafV
 5BOt9R2vq7pLV/szVbhQiSkILFzfjRK0sVkS/UW7lWl9bRDkrY6mG4ftTSCpY6JrAa7lWtgbwwm
 k6aOxSndhDa7iJQ7ZnI4suBY7NPVyMQfJGDZ+mKh3+8ZfZkmJAcTKbCbJA0a8tdVX2kTmlYyQUd
 9QlGv0ZRe3Lr9U9r9TiQo+RSXy6+SzkCs188mTrBTJu+98KjVNIbbH64IrafuXC2mBRVEq3Dp0j
 OpGGm/zLwgHhH9lzdXu5Y8r1aJm/Bv6szseDYHTEbKoIgyGzfWV9VK1a9NZL2ttSjQoIPLgKUaL
 5B1j7KG6PMXZtnzHdm+gr8A==
X-Developer-Key: i=y.j3ms.n@gmail.com; a=openpgp;
 fpr=D26E06A4D32EC6C480E690D0867058A0E3D0D8BA
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/default with
 auth_id=602
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Reply-To: y.j3ms.n@gmail.com

From: Jesung Yang <y.j3ms.n@gmail.com>

Introduce multi-version support for rust-analyzer. The script now
executes `rust-analyzer --version` to query the version string and
generates a `rust-project.json` file compatible with the detected
version.

This is a preparatory patch to address inherent method resolution
failures for primitive types occurring in rust-analyzer v0.3.2693
(2025-11-24) or later when used with our current `rust-project.json`
generation logic. Since the actual fix requires using the `sysroot_src`
field with a feature only available in rust-analyzer v0.3.2727
(2025-12-22) or later, this infrastructure is necessary to maintain
compatibility with older rust-analyzer releases.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 scripts/generate_rust_analyzer.py | 201 +++++++++++++++++++++++++++++++++-----
 1 file changed, 176 insertions(+), 25 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index b4a55344688d..a4d25bb8b602 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -4,10 +4,12 @@
 """
 
 import argparse
+from datetime import datetime, date
 import json
 import logging
 import os
 import pathlib
+import re
 import subprocess
 import sys
 from typing import Dict, Iterable, List, Literal, Optional, TypedDict
@@ -36,6 +38,7 @@ class Crate(TypedDict):
     is_workspace_member: bool
     deps: List[Dependency]
     cfg: List[str]
+    crate_attrs: List[str]
     edition: str
     env: Dict[str, str]
 
@@ -49,7 +52,41 @@ class CrateWithGenerated(Crate):
     source: Source
 
 
+class RustProject(TypedDict):
+    crates: List[Crate]
+    sysroot: str
+
+
+Version = tuple[int, int, int]
+
+
+class RaVersionInfo(TypedDict):
+    release_date: date
+    ra_version: Version
+    rust_version: Version
+
+
+class RaVersionCtx(TypedDict):
+    manual_sysroot_crates: bool
+    use_crate_attrs: bool
+
+
+# Represents rust-analyzer compatibility baselines. Concrete versions are mapped to the most
+# recent baseline they have reached. Must be in release order.
+BASELINES: List[RaVersionInfo] = [
+    # v0.3.1877, released on 2024-03-11; shipped with the rustup 1.78 toolchain.
+    {
+        "release_date": datetime.strptime("2024-03-11", "%Y-%m-%d"),
+        "ra_version": (0, 3, 1877),
+        "rust_version": (1, 78, 0),
+    },
+]
+
+DEFAULT_BASELINE: RaVersionInfo = BASELINES[0]
+
+
 def generate_crates(
+    ctx: RaVersionCtx,
     srctree: pathlib.Path,
     objtree: pathlib.Path,
     sysroot_src: pathlib.Path,
@@ -75,10 +112,14 @@ def generate_crates(
         deps: List[Dependency],
         *,
         cfg: Optional[List[str]],
+        crate_attrs: Optional[List[str]],
         is_workspace_member: Optional[bool],
         edition: Optional[str],
     ) -> Crate:
         cfg = cfg if cfg is not None else crates_cfgs.get(display_name, [])
+        crate_attrs = (
+            crate_attrs if ctx["use_crate_attrs"] and crate_attrs is not None else []
+        )
         is_workspace_member = (
             is_workspace_member if is_workspace_member is not None else True
         )
@@ -89,6 +130,7 @@ def generate_crates(
             "is_workspace_member": is_workspace_member,
             "deps": deps,
             "cfg": cfg,
+            "crate_attrs": crate_attrs,
             "edition": edition,
             "env": {
                 "RUST_MODFILE": "This is only for rust-analyzer"
@@ -109,6 +151,7 @@ def generate_crates(
             root_module,
             deps,
             cfg=cfg,
+            crate_attrs=None,
             is_workspace_member=is_workspace_member,
             edition=edition,
         )
@@ -147,6 +190,7 @@ def generate_crates(
         deps: List[Dependency],
         *,
         cfg: Optional[List[str]] = None,
+        crate_attrs: Optional[List[str]] = None,
         is_workspace_member: Optional[bool] = None,
         edition: Optional[str] = None,
     ) -> Dependency:
@@ -156,6 +200,7 @@ def generate_crates(
                 root_module,
                 deps,
                 cfg=cfg,
+                crate_attrs=crate_attrs,
                 is_workspace_member=is_workspace_member,
                 edition=edition,
             )
@@ -200,67 +245,72 @@ def generate_crates(
             edition=core_edition,
         )
 
-    # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
-    # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
-    # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    core = append_sysroot_crate("core", [])
-    alloc = append_sysroot_crate("alloc", [core])
-    std = append_sysroot_crate("std", [alloc, core])
-    proc_macro = append_sysroot_crate("proc_macro", [core, std])
+    core = alloc = std = proc_macro = None
+    if ctx["manual_sysroot_crates"]:
+        # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
+        # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
+        # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
+        core = append_sysroot_crate("core", [])
+        alloc = append_sysroot_crate("alloc", [core])
+        std = append_sysroot_crate("std", [alloc, core])
+        proc_macro = append_sysroot_crate("proc_macro", [core, std])
+
+    def sysroot_deps(*deps: Optional[Dependency]) -> List[Dependency]:
+        return [dep for dep in deps if dep is not None]
 
     compiler_builtins = append_crate(
         "compiler_builtins",
         srctree / "rust" / "compiler_builtins.rs",
-        [core],
+        sysroot_deps(core),
     )
 
     proc_macro2 = append_crate(
         "proc_macro2",
         srctree / "rust" / "proc-macro2" / "lib.rs",
-        [core, alloc, std, proc_macro],
+        sysroot_deps(core, alloc, std, proc_macro),
     )
 
     quote = append_crate(
         "quote",
         srctree / "rust" / "quote" / "lib.rs",
-        [core, alloc, std, proc_macro, proc_macro2],
+        sysroot_deps(core, alloc, std, proc_macro) + [proc_macro2],
         edition="2018",
     )
 
     syn = append_crate(
         "syn",
         srctree / "rust" / "syn" / "lib.rs",
-        [std, proc_macro, proc_macro2, quote],
+        sysroot_deps(std, proc_macro) + [proc_macro2, quote],
     )
 
     macros = append_proc_macro_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        [std, proc_macro, proc_macro2, quote, syn],
+        sysroot_deps(std, proc_macro) + [proc_macro2, quote, syn],
     )
 
     build_error = append_crate(
         "build_error",
         srctree / "rust" / "build_error.rs",
-        [core, compiler_builtins],
+        sysroot_deps(core) + [compiler_builtins],
     )
 
     pin_init_internal = append_proc_macro_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
-        [std, proc_macro, proc_macro2, quote, syn],
+        sysroot_deps(std, proc_macro) + [proc_macro2, quote, syn],
     )
 
     pin_init = append_crate(
         "pin_init",
         srctree / "rust" / "pin-init" / "src" / "lib.rs",
-        [core, compiler_builtins, pin_init_internal, macros],
+        sysroot_deps(core) + [compiler_builtins, pin_init_internal, macros],
     )
 
     ffi = append_crate(
         "ffi",
         srctree / "rust" / "ffi.rs",
-        [core, compiler_builtins],
+        sysroot_deps(core) + [compiler_builtins],
     )
 
     def append_crate_with_generated(
@@ -272,6 +322,7 @@ def generate_crates(
             srctree / "rust"/ display_name / "lib.rs",
             deps,
             cfg=generated_cfg,
+            crate_attrs=None,
             is_workspace_member=True,
             edition=None,
         )
@@ -288,10 +339,14 @@ def generate_crates(
         }
         return register_crate(crate_with_generated)
 
-    bindings = append_crate_with_generated("bindings", [core, ffi, pin_init])
-    uapi = append_crate_with_generated("uapi", [core, ffi, pin_init])
+    bindings = append_crate_with_generated(
+        "bindings", sysroot_deps(core) + [ffi, pin_init]
+    )
+    uapi = append_crate_with_generated(
+        "uapi", sysroot_deps(core) + [ffi, pin_init]
+    )
     kernel = append_crate_with_generated(
-        "kernel", [core, macros, build_error, pin_init, ffi, bindings, uapi]
+        "kernel", sysroot_deps(core) + [macros, build_error, pin_init, ffi, bindings, uapi]
     )
 
     scripts = srctree / "scripts"
@@ -303,7 +358,7 @@ def generate_crates(
         append_crate(
             name,
             path,
-            [std],
+            sysroot_deps(std),
         )
 
     def is_root_crate(build_file: pathlib.Path, target: str) -> bool:
@@ -335,12 +390,90 @@ def generate_crates(
             append_crate(
                 name,
                 path,
-                [core, kernel, pin_init],
+                sysroot_deps(core) + [kernel, pin_init],
                 cfg=generated_cfg,
+                crate_attrs=["no_std"],
             )
 
     return crates
 
+def generate_rust_project(
+    version_info: RaVersionInfo,
+    srctree: pathlib.Path,
+    objtree: pathlib.Path,
+    sysroot: pathlib.Path,
+    sysroot_src: pathlib.Path,
+    external_src: Optional[pathlib.Path],
+    cfgs: List[str],
+    core_edition: str,
+) -> RustProject:
+    assert len(BASELINES) == 1, "Exhaustiveness check: update if branches!"
+
+    ctx: RaVersionCtx
+
+    if version_info["ra_version"] == (0, 3, 1877):
+        ctx = {
+            "use_crate_attrs": False,
+            "manual_sysroot_crates": True,
+        }
+        return {
+            "crates": generate_crates(
+                ctx, srctree, objtree, sysroot_src, external_src, cfgs, core_edition
+            ),
+            "sysroot": str(sysroot),
+        }
+    else:
+        assert False, "Unreachable!"
+
+def query_ra_version() -> Optional[str]:
+    try:
+        # Use the rust-analyzer binary found in $PATH.
+        ra_version_output = (
+            subprocess.check_output(
+                ["rust-analyzer", "--version"],
+                stdin=subprocess.DEVNULL,
+            )
+            .decode("utf-8")
+            .strip()
+        )
+        return ra_version_output
+    except FileNotFoundError:
+        logging.warning("Failed to find rust-analyzer in $PATH")
+        return None
+
+def map_ra_version_baseline(ra_version_output: str) -> RaVersionInfo:
+    baselines = reversed(BASELINES)
+
+    version_match = re.search(r"\d+\.\d+\.\d+", ra_version_output)
+    if version_match:
+        version_string = version_match.group()
+        found_version = tuple(map(int, version_string.split(".")))
+
+        # `rust-analyzer --version` shows different version string depending on how the binary
+        # is built: it may print either the Rust version or the rust-analyzer version itself.
+        # To distinguish between them, we leverage rust-analyzer's versioning convention.
+        #
+        # See:
+        # - https://github.com/rust-lang/rust-analyzer/blob/fad5c3d2d642/xtask/src/dist.rs#L19-L21
+        is_ra_version = version_string.startswith(("0.3", "0.4", "0.5"))
+        if is_ra_version:
+            for info in baselines:
+                if found_version >= info["ra_version"]:
+                    return info
+        else:
+            for info in baselines:
+                if found_version >= info["rust_version"]:
+                    return info
+
+    date_match = re.search(r"\d{4}-\d{2}-\d{2}", ra_version_output)
+    if date_match:
+        found_date = datetime.strptime(date_match.group(), "%Y-%m-%d")
+        for info in baselines:
+            if found_date >= info["release_date"]:
+                return info
+
+    return DEFAULT_BASELINE
+
 def main() -> None:
     parser = argparse.ArgumentParser()
     parser.add_argument('--verbose', '-v', action='store_true')
@@ -369,10 +502,28 @@ def main() -> None:
         level=logging.INFO if args.verbose else logging.WARNING
     )
 
-    rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.core_edition),
-        "sysroot": str(args.sysroot),
-    }
+    ra_version_output = query_ra_version()
+    if ra_version_output:
+        compatible_ra_version = map_ra_version_baseline(ra_version_output)
+    else:
+        logging.warning(
+            "Falling back to `rust-project.json` for rust-analyzer %s, %s (shipped with Rust %s)",
+            ".".join(map(str, DEFAULT_BASELINE["ra_version"])),
+            datetime.strftime(DEFAULT_BASELINE["release_date"], "%Y-%m-%d"),
+            ".".join(map(str, DEFAULT_BASELINE["rust_version"])),
+        )
+        compatible_ra_version = DEFAULT_BASELINE
+
+    rust_project = generate_rust_project(
+        compatible_ra_version,
+        args.srctree,
+        args.objtree,
+        args.sysroot,
+        args.sysroot_src,
+        args.exttree,
+        args.cfgs,
+        args.core_edition,
+    )
 
     json.dump(rust_project, sys.stdout, sort_keys=True, indent=4)
 

-- 
2.52.0


