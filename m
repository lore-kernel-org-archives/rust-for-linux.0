Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329FE23ED75;
	Thu, 22 Jan 2026 17:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103059; cv=none; b=iiyHx279fOA6kQW2ZvXmUaL27qjyC0DXTRevNE9qSr7taBgEf/9BAU33CjdEzgDLWzItmwjGq9x65GqkAQtKqYG0doLZYMYSYlMuUlK1TnE4AnjHYEDBy0EKOG7Y+ZMxWflonU4rPOrb/v8qIbkl3hqKd2aqkCymzgt9zBRKsWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103059; c=relaxed/simple;
	bh=36ruCmo+r1BzderDNTCI9lf9enZ1Me+RMKf1acltnyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kq1vRWoBXloOz+xUHemdHN0VEx//16QUczk/9lEWhhXt7zZIVrEkLWFmhj9PSJkfYQFM8TYyILD1LtTx4/lA2KU+tYD0xS44c45H8YUerUoHr85CAPRflhs84wIoT0Ck2pf9D210uszDQKhIjSCU3ZbVEe7zZxeDe6Q9RB31WMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITMWVIWM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITMWVIWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF51C19423;
	Thu, 22 Jan 2026 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103058;
	bh=36ruCmo+r1BzderDNTCI9lf9enZ1Me+RMKf1acltnyo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ITMWVIWMq86fI6T7gyFwdk+En6sO7V+aJFOAoBhyvescyVBhvVjDj/2NDHm81gJHH
	 ZDCmmjfsUINFy13G3G0GkjzXFa7+dgMkeUTErGk8/omuMVJuRa5d8cDhm/LWyXH/Q+
	 04hzGyIyQ8rtARwL1+2JQFOlQ3UwEOFJZB52/t0/e/ouh6pBhxsE35qQkHEdQllogb
	 EyQJ6xG8mjcLSG/cs11bjMoZRTj1ri/pjEg2Gke7qCifjcgW62+J0Ebz8vf5VTTZgC
	 0GO28FT9Mr4bV3lkMQEk9Iu51aKWPZlNrvx465DjU7GJWDxrB+c8sBNiNgaQVG8Hbf
	 RlFa4tYIJd7Dw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 22 Jan 2026 12:30:47 -0500
Subject: [PATCH 3/4] scripts: generate_rust_analyzer.py: add type hints
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-rust-analyzer-types-v1-3-29cc2e91dcd5@kernel.org>
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
In-Reply-To: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
To: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1769103052; l=8692;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=36ruCmo+r1BzderDNTCI9lf9enZ1Me+RMKf1acltnyo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNNymsf14WPoK5+wOQqIeRu5U+mOArn0IFVnX2lua9wVTMRuGaV+zI73fsHVwn+JbVqOWNbjv7K
 HwYtmzcJRcA8=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Python type hints allow static analysis tools like mypy to detect type
errors during development, improving the developer experience.

Python type hints have been present in the kernel since 2019 at the
latest; see commit 6ebf5866f2e8 ("kunit: tool: add Python wrappers for
running KUnit tests").

Add a subclass of `argparse.Namespace` to get type checking on the CLI
arguments.

Run `mypy --strict scripts/generate_rust_analyzer.py --python-version
3.9` to verify. Note that `mypy` no longer supports python < 3.9.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 scripts/generate_rust_analyzer.py | 130 ++++++++++++++++++++++++++------------
 1 file changed, 90 insertions(+), 40 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index bc79e4d8e8e7..2723154f207c 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -10,8 +10,9 @@ import os
 import pathlib
 import subprocess
 import sys
+from typing import Dict, Iterable, List, Literal, Optional, TypedDict
 
-def args_crates_cfgs(cfgs):
+def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
     crates_cfgs = {}
     for cfg in cfgs:
         crate, vals = cfg.split("=", 1)
@@ -19,7 +20,43 @@ def args_crates_cfgs(cfgs):
 
     return crates_cfgs
 
-def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edition):
+class Dependency(TypedDict):
+    crate: int
+    name: str
+
+
+class Source(TypedDict):
+    include_dirs: List[str]
+    exclude_dirs: List[str]
+
+
+class Crate(TypedDict):
+    display_name: str
+    root_module: str
+    is_workspace_member: bool
+    deps: List[Dependency]
+    cfg: List[str]
+    edition: str
+    env: Dict[str, str]
+
+
+class ProcMacroCrate(Crate):
+    is_proc_macro: Literal[True]
+    proc_macro_dylib_path: str  # `pathlib.Path` is not JSON serializable.
+
+
+class CrateWithGenerated(Crate):
+    source: Source
+
+
+def generate_crates(
+    srctree: pathlib.Path,
+    objtree: pathlib.Path,
+    sysroot_src: pathlib.Path,
+    external_src: Optional[pathlib.Path],
+    cfgs: List[str],
+    core_edition: str,
+) -> List[Crate]:
     # Generate the configuration list.
     cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
@@ -31,19 +68,19 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     # Now fill the crates list -- dependencies need to come first.
     #
     # Avoid O(n^2) iterations by keeping a map of indexes.
-    crates = []
-    crates_indexes = {}
+    crates: List[Crate] = []
+    crates_indexes: Dict[str, int] = {}
     crates_cfgs = args_crates_cfgs(cfgs)
 
     def build_crate(
-        display_name,
-        root_module,
-        deps,
+        display_name: str,
+        root_module: pathlib.Path,
+        deps: List[str],
         *,
-        cfg,
-        is_workspace_member,
-        edition,
-    ):
+        cfg: Optional[List[str]],
+        is_workspace_member: Optional[bool],
+        edition: Optional[str],
+    ) -> Crate:
         cfg = cfg if cfg is not None else []
         is_workspace_member = (
             is_workspace_member if is_workspace_member is not None else True
@@ -62,14 +99,14 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         }
 
     def append_proc_macro_crate(
-        display_name,
-        root_module,
-        deps,
+        display_name: str,
+        root_module: pathlib.Path,
+        deps: List[str],
         *,
-        cfg=None,
-        is_workspace_member=None,
-        edition=None,
-    ):
+        cfg: Optional[List[str]] = None,
+        is_workspace_member: Optional[bool] = None,
+        edition: Optional[str] = None,
+    ) -> None:
         crate = build_crate(
             display_name,
             root_module,
@@ -95,26 +132,26 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             .decode("utf-8")
             .strip()
         )
-        proc_macro_crate = {
+        proc_macro_crate: ProcMacroCrate = {
             **crate,
             "is_proc_macro": True,
             "proc_macro_dylib_path": str(objtree / "rust" / proc_macro_dylib_name),
         }
         return register_crate(proc_macro_crate)
 
-    def register_crate(crate):
+    def register_crate(crate: Crate) -> None:
         crates_indexes[crate["display_name"]] = len(crates)
         crates.append(crate)
 
     def append_crate(
-        display_name,
-        root_module,
-        deps,
+        display_name: str,
+        root_module: pathlib.Path,
+        deps: List[str],
         *,
-        cfg=None,
-        is_workspace_member=None,
-        edition=None,
-    ):
+        cfg: Optional[List[str]] = None,
+        is_workspace_member: Optional[bool] = None,
+        edition: Optional[str] = None,
+    ) -> None:
         return register_crate(
             build_crate(
                 display_name,
@@ -127,12 +164,12 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         )
 
     def append_sysroot_crate(
-        display_name,
-        deps,
+        display_name: str,
+        deps: List[str],
         *,
-        cfg=None,
-        edition=None,
-    ):
+        cfg: Optional[List[str]] = None,
+        edition: Optional[str] = None,
+    ) -> None:
         return append_crate(
             display_name,
             sysroot_src / display_name / "src" / "lib.rs",
@@ -210,9 +247,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     )
 
     def append_crate_with_generated(
-        display_name,
-        deps,
-    ):
+        display_name: str,
+        deps: List[str],
+    ) -> None:
         crate = build_crate(
             display_name,
             srctree / "rust"/ display_name / "lib.rs",
@@ -222,7 +259,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             edition=None,
         )
         crate["env"]["OBJTREE"] = str(objtree.resolve(True))
-        crate_with_generated = {
+        crate_with_generated: CrateWithGenerated = {
             **crate,
             "source": {
                 "include_dirs": [
@@ -238,7 +275,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     append_crate_with_generated("uapi", ["core", "ffi", "pin_init"])
     append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "ffi", "bindings", "uapi"])
 
-    def is_root_crate(build_file, target):
+    def is_root_crate(build_file: pathlib.Path, target: str) -> bool:
         try:
             return f"{target}.o" in open(build_file).read()
         except FileNotFoundError:
@@ -247,7 +284,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
-    extra_dirs = map(lambda dir: srctree / dir, ("samples", "drivers"))
+    extra_dirs: Iterable[pathlib.Path] = (
+        srctree / dir for dir in ("samples", "drivers")
+    )
     if external_src is not None:
         extra_dirs = [external_src]
     for folder in extra_dirs:
@@ -270,7 +309,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
 
     return crates
 
-def main():
+def main() -> None:
     parser = argparse.ArgumentParser()
     parser.add_argument('--verbose', '-v', action='store_true')
     parser.add_argument('--cfgs', action='append', default=[])
@@ -280,7 +319,18 @@ def main():
     parser.add_argument("sysroot", type=pathlib.Path)
     parser.add_argument("sysroot_src", type=pathlib.Path)
     parser.add_argument("exttree", type=pathlib.Path, nargs="?")
-    args = parser.parse_args()
+
+    class Args(argparse.Namespace):
+        verbose: bool
+        cfgs: List[str]
+        srctree: pathlib.Path
+        objtree: pathlib.Path
+        sysroot: pathlib.Path
+        sysroot_src: pathlib.Path
+        exttree: Optional[pathlib.Path]
+        core_edition: str
+
+    args = parser.parse_args(namespace=Args())
 
     logging.basicConfig(
         format="[%(asctime)s] [%(levelname)s] %(message)s",

-- 
2.52.0

