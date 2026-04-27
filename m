Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E213CFF6B;
	Mon, 27 Apr 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299828; cv=none; b=ig1WdG1f1CnHe/2zzvJL3tL9Kyywz/8jyrOzrpTPO4zgF/yH6CQG/xz0yAnvL3pLnZC5Q63z4FceYK5Tnj9+Kw+mp2EIkYcWbbFx7xuUxxvwirBftzpcNatG7tCAjMvKNmO42o86c9ai84DPiWl+lN0FPfMsBRdy5y645IKur0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299828; c=relaxed/simple;
	bh=veZiSblbrqqUxdpaFgL+A1F6aafak2LjnLI0mVwLBhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fxmsaTKG+JZ/YgdAJAmEgpEi1mCGblfpvBrmUxzprp4wZJSFCQbc0s4UyeedTLKkzS6o58C0qgXGRbhxjIimqKXiZ5wMFATNKPOHoy3zseHlC4fFwz0yJkYB4/O5e3Zv1P0CRsO5MuLB8RGfRUHe2j4cAvbzEVZ6q+kpoWFDK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpd1uCxH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpd1uCxH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD02C19425;
	Mon, 27 Apr 2026 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299827;
	bh=veZiSblbrqqUxdpaFgL+A1F6aafak2LjnLI0mVwLBhs=;
	h=From:Date:Subject:To:Cc:From;
	b=tpd1uCxHbQVetmUogStbWG9vxpy9xEU1oAKpXPdyN4mS7bh+QGNRVklrB8ispkgA5
	 AiIgxsTS9BIj3ovM5lvAJYije5nqbfAfQukhHHrWYQIgDcaJYm+H39A1+AR4fkn48B
	 N3o+ixVbb2cBn837s6j+LXAYkzOPhR4zqQK96xRQHYLhVx1SMAfjZ8EYhiMsoeqvs5
	 ryIxTNnEbIM6derhMcerB2NRDm6YVZ4sXx6i64FIY0g1UzCKse3SshjQjAD4jDihel
	 9PL/T8WyQO7xHBD221SQb9IfX9Gdl9x0QSj3j7uYuwx1rUVdquuehFvmUUe2dik5U+
	 zUsCVStHS6jxg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 27 Apr 2026 10:23:44 -0400
Subject: [PATCH] scripts: generate_rust_analyzer.py: reduce import noise
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-rust-analyzer-import-typing-as-t-v1-1-5bb33ad12396@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMAyA4VchPdsEJ8PFVzEeClas0bG0w4iEd
 3fq8bv8/wLGKmxwqBZQforJGAu2mwr6K8WBUc7F4GrX1o3bo06WkSLd5zcryiONmjHPSeKAZJi
 x3YXQeNdR8B5KJilf5PVbHE9/29TduM/fLqzrB7QUK+mEAAAA
X-Change-ID: 20260427-rust-analyzer-import-typing-as-t-6388452ba855
To: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6195; i=tamird@kernel.org;
 h=from:subject:message-id; bh=veZiSblbrqqUxdpaFgL+A1F6aafak2LjnLI0mVwLBhs=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJnvC4vWPBR6OVFz1aZfZV8s/i72Wntgx9O7s9Y95zz9/
 fGlR7lRvR0TWRjEuBgsxRRZEkUP7U1Pvb1HNvPdcZg5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BIx0DHmIGLUwCmWq6QkeHoAYbgGQZCVZPl+W1etXdlzT0w67gs4xfJ99pfb3iEM0xh+J/IvW6
 7YVrx13975TjbZjev2h308tMcHdn1weXTd0orH2ADAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Use `import typing as t` to avoid having to list each imported symbol
whenever it is added.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 scripts/generate_rust_analyzer.py | 68 +++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index d5f9a0ca742c..c61e76cb40a1 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -10,15 +10,15 @@ import os
 import pathlib
 import subprocess
 import sys
-from typing import Dict, Iterable, List, Literal, Optional, TypedDict
+import typing as t
 
-def invoke_rustc(args: List[str]) -> str:
+def invoke_rustc(args: t.List[str]) -> str:
     return subprocess.check_output(
         [os.environ["RUSTC"]] + args,
         stdin=subprocess.DEVNULL,
     ).decode('utf-8').strip()
 
-def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
+def args_crates_cfgs(cfgs: t.List[str]) -> t.Dict[str, t.List[str]]:
     crates_cfgs = {}
     for cfg in cfgs:
         crate, vals = cfg.split("=", 1)
@@ -26,28 +26,28 @@ def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
 
     return crates_cfgs
 
-class Dependency(TypedDict):
+class Dependency(t.TypedDict):
     crate: int
     name: str
 
 
-class Source(TypedDict):
-    include_dirs: List[str]
-    exclude_dirs: List[str]
+class Source(t.TypedDict):
+    include_dirs: t.List[str]
+    exclude_dirs: t.List[str]
 
 
-class Crate(TypedDict):
+class Crate(t.TypedDict):
     display_name: str
     root_module: str
     is_workspace_member: bool
-    deps: List[Dependency]
-    cfg: List[str]
+    deps: t.List[Dependency]
+    cfg: t.List[str]
     edition: str
-    env: Dict[str, str]
+    env: t.Dict[str, str]
 
 
 class ProcMacroCrate(Crate):
-    is_proc_macro: Literal[True]
+    is_proc_macro: t.Literal[True]
     proc_macro_dylib_path: str  # `pathlib.Path` is not JSON serializable.
 
 
@@ -59,10 +59,10 @@ def generate_crates(
     srctree: pathlib.Path,
     objtree: pathlib.Path,
     sysroot_src: pathlib.Path,
-    external_src: Optional[pathlib.Path],
-    cfgs: List[str],
+    external_src: t.Optional[pathlib.Path],
+    cfgs: t.List[str],
     core_edition: str,
-) -> List[Crate]:
+) -> t.List[Crate]:
     # Generate the configuration list.
     generated_cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
@@ -72,7 +72,7 @@ def generate_crates(
             generated_cfg.append(line)
 
     # Now fill the crates list.
-    crates: List[Crate] = []
+    crates: t.List[Crate] = []
     crates_cfgs = args_crates_cfgs(cfgs)
 
     def get_crate_name(path: pathlib.Path) -> str:
@@ -81,11 +81,11 @@ def generate_crates(
     def build_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: List[Dependency],
+        deps: t.List[Dependency],
         *,
-        cfg: Optional[List[str]],
-        is_workspace_member: Optional[bool],
-        edition: Optional[str],
+        cfg: t.Optional[t.List[str]],
+        is_workspace_member: t.Optional[bool],
+        edition: t.Optional[str],
     ) -> Crate:
         cfg = cfg if cfg is not None else crates_cfgs.get(display_name, [])
         is_workspace_member = (
@@ -107,11 +107,11 @@ def generate_crates(
     def append_proc_macro_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: List[Dependency],
+        deps: t.List[Dependency],
         *,
-        cfg: Optional[List[str]] = None,
-        is_workspace_member: Optional[bool] = None,
-        edition: Optional[str] = None,
+        cfg: t.Optional[t.List[str]] = None,
+        is_workspace_member: t.Optional[bool] = None,
+        edition: t.Optional[str] = None,
     ) -> Dependency:
         crate = build_crate(
             display_name,
@@ -145,11 +145,11 @@ def generate_crates(
     def append_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: List[Dependency],
+        deps: t.List[Dependency],
         *,
-        cfg: Optional[List[str]] = None,
-        is_workspace_member: Optional[bool] = None,
-        edition: Optional[str] = None,
+        cfg: t.Optional[t.List[str]] = None,
+        is_workspace_member: t.Optional[bool] = None,
+        edition: t.Optional[str] = None,
     ) -> Dependency:
         return register_crate(
             build_crate(
@@ -164,9 +164,9 @@ def generate_crates(
 
     def append_sysroot_crate(
         display_name: str,
-        deps: List[Dependency],
+        deps: t.List[Dependency],
         *,
-        cfg: Optional[List[str]] = None,
+        cfg: t.Optional[t.List[str]] = None,
     ) -> Dependency:
         return append_crate(
             display_name,
@@ -266,7 +266,7 @@ def generate_crates(
 
     def append_crate_with_generated(
         display_name: str,
-        deps: List[Dependency],
+        deps: t.List[Dependency],
     ) -> Dependency:
         crate = build_crate(
             display_name,
@@ -317,7 +317,7 @@ def generate_crates(
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
-    extra_dirs: Iterable[pathlib.Path] = (
+    extra_dirs: t.Iterable[pathlib.Path] = (
         srctree / dir for dir in ("samples", "drivers")
     )
     if external_src is not None:
@@ -356,12 +356,12 @@ def main() -> None:
 
     class Args(argparse.Namespace):
         verbose: bool
-        cfgs: List[str]
+        cfgs: t.List[str]
         srctree: pathlib.Path
         objtree: pathlib.Path
         sysroot: pathlib.Path
         sysroot_src: pathlib.Path
-        exttree: Optional[pathlib.Path]
+        exttree: t.Optional[pathlib.Path]
         core_edition: str
 
     args = parser.parse_args(namespace=Args())

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260427-rust-analyzer-import-typing-as-t-6388452ba855

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

