Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123633793D4;
	Mon,  4 May 2026 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900864; cv=none; b=UZLfDdRE5Xzi19imxNZBNCAVk+bFQPTUOHECMpoiDG22CuZxJ/LGwLQ5kg6LMW5rkBwspJ6hk3+ruNkKVq0iYzkeV5aOqZTJhJEDyhKoo2gucjdm8O33Fqnm5NBN4ULNs9xeHb+XuDHW7tbzEsLQ8j+b82cCzG3xt25cCkrYDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900864; c=relaxed/simple;
	bh=F4a88pXk4JR9r3OFQyfMcCjwmDy/K7GX8P3OpK/0UQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OYoS/gL8YQcg9S4c5+1iynUnl2kecFTcWRl2rma4XHO0BoW2DiW/D8GTcZa4XsRwXFnA1XeU6DJGgsVEZbFi4nSyVr/BIR7FdnQz1mgxQz8C+LuIHCdn9gzip7Zt5BZ6irp/W7Oiqm76N/TvCOt7GbzcZEtRvObKhsmFrZrm2gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pe8ZbU+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pe8ZbU+a"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE537C2BCFC;
	Mon,  4 May 2026 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777900863;
	bh=F4a88pXk4JR9r3OFQyfMcCjwmDy/K7GX8P3OpK/0UQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Pe8ZbU+aVPNrZvDOLqTX2eDYM/5vlwnBC81AJeGryWTvFDiXfFXweMo48b8u4mr/C
	 Ju0PhWWxK1P08cx8f2gtlJgU2o7gaD8F6TvKpG8yBvV7N0RkCPk6fK45K3/mULT9jy
	 PnY/rApKsr/mUZoH2Fw0c4StjOzzPVrMcdGfPqR7fdkhih66lSVLHYqUuifZ/xHoDS
	 NbFlhGqXM/AxCYJiAJ7mhBTTZFzI1YcAA9Hc6bpTUODP3X2T8UY/PhIHhW3wjaMGil
	 hz0GWouRmOP55YT4hyvhdAhVymHTd8ml1e8cd0xp9p7gkLV2nlXQ9Cmrgld2BsdEP7
	 bCLF0CYPExCiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8FACD3439;
	Mon,  4 May 2026 13:21:03 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Mon, 04 May 2026 22:21:00 +0900
Subject: [PATCH v6 2/2] scripts: generate_rust_analyzer.py: fix IDE support
 for primitive types
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-ra-fix-primitive-v6-2-74cfc1e862d0@gmail.com>
References: <20260504-ra-fix-primitive-v6-0-74cfc1e862d0@gmail.com>
In-Reply-To: <20260504-ra-fix-primitive-v6-0-74cfc1e862d0@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777900862; l=9490;
 i=y.j3ms.n@gmail.com; s=kernel; h=from:subject:message-id;
 bh=NvLoeDXbQEJYfK+F+C9B10uJF3QRx85hA+CFgoo7WDo=;
 b=EDKOFQLa+7sXusXb+DnRdO6silifT2m1mC7v1+aajtX31kK/RyYbamLzolUTujWrvdMKCjh91
 SgrwCj8TtFsDnccLWtKSr+pDB/x9TLFHDbkxdIXrozkajgRFJAomAbK
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=4nSlncQuTIIYLyLXkNxS0ssInM3uK0snxLSeQ2tdG/o=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/kernel with
 auth_id=755
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Reply-To: y.j3ms.n@gmail.com

From: Jesung Yang <y.j3ms.n@gmail.com>

Update `generate_rust_analyzer.py` so that the generated
`rust-project.json` contains the `sysroot_src` field with
`"crate_attrs": ["no_std"]` specified for relevant crates. This ensures
that rust-analyzer provides proper IDE support for inherent methods of
primitive types.

Since commit 50384460c68f ("Rewrite method resolution to follow rustc
more closely") to rust-analyzer, it no longer provides language server
features like code completion and go-to-definition for inherent methods
of primitive types when sysroot crates (e.g., `core`, `std`) are inlined
in `rust-project.json` [1]. As `generate_rust_analyzer.py` currently
inlines these crates, our setup is affected by this change.

Specifying the `sysroot_src` field restores this functionality by
allowing rust-analyzer to locate sysroot crates by itself. However, this
causes `std` to be treated as a dependency for all local crates by
default. To align with our compilation settings, provide the `no_std`
attribute via the `crate_attrs` field, as the `-Zcrate-attr=no_std`
compiler flag is not visible to rust-analyzer. This combined approach
removes manual manipulation of sysroot dependencies while preventing
incorrect symbol resolution against the standard library.

Note that this configuration requires rust-analyzer release 2025-12-22
(v0.3.2727) or later, which introduced support for the `crate_attrs`
field.

Link: https://rust-lang.zulipchat.com/#narrow/channel/x/topic/x/near/561607963 [1]
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/561607753
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 scripts/generate_rust_analyzer.py | 108 ++++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 21 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 934698c7eb95..af02b82379c1 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -4,6 +4,7 @@
 """
 
 import argparse
+from dataclasses import dataclass
 from datetime import date
 import enum
 import re
@@ -39,14 +40,28 @@ class Source(TypedDict):
     exclude_dirs: List[str]
 
 
-class Crate(TypedDict):
-    display_name: str
-    root_module: str
-    is_workspace_member: bool
-    deps: List[Dependency]
-    cfg: List[str]
-    edition: str
-    env: Dict[str, str]
+# TODO: clean up once Python 3.11 is adopted.
+if sys.version_info < (3, 11):
+    class Crate(TypedDict, total=False):
+        display_name: str
+        root_module: str
+        is_workspace_member: bool
+        deps: List[Dependency]
+        cfg: List[str]
+        crate_attrs: List[str]
+        edition: str
+        env: Dict[str, str]
+else:
+    from typing import NotRequired
+    class Crate(TypedDict):
+        display_name: str
+        root_module: str
+        is_workspace_member: bool
+        deps: List[Dependency]
+        cfg: List[str]
+        crate_attrs: NotRequired[List[str]]
+        edition: str
+        env: Dict[str, str]
 
 
 class ProcMacroCrate(Crate):
@@ -58,7 +73,14 @@ class CrateWithGenerated(Crate):
     source: Source
 
 
+@dataclass(frozen=True)
+class RaVersionCtx:
+    manual_sysroot_crates: bool
+    use_crate_attrs: bool
+
+
 def generate_crates(
+    ctx: RaVersionCtx,
     srctree: pathlib.Path,
     objtree: pathlib.Path,
     sysroot_src: pathlib.Path,
@@ -84,22 +106,24 @@ def generate_crates(
     def build_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: List[Dependency],
+        deps: List[Optional[Dependency]],
         *,
         cfg: Optional[List[str]],
+        crate_attrs: Optional[List[str]],
         is_workspace_member: Optional[bool],
         edition: Optional[str],
     ) -> Crate:
+        filtered_deps = [dep for dep in deps if dep is not None]
         cfg = cfg if cfg is not None else crates_cfgs.get(display_name, [])
         is_workspace_member = (
             is_workspace_member if is_workspace_member is not None else True
         )
         edition = edition if edition is not None else "2021"
-        return {
+        crate: Crate = {
             "display_name": display_name,
             "root_module": str(root_module),
             "is_workspace_member": is_workspace_member,
-            "deps": deps,
+            "deps": filtered_deps,
             "cfg": cfg,
             "edition": edition,
             "env": {
@@ -107,10 +131,15 @@ def generate_crates(
             }
         }
 
+        if ctx.use_crate_attrs and crate_attrs is not None:
+            crate["crate_attrs"] = crate_attrs
+
+        return crate
+
     def append_proc_macro_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: List[Dependency],
+        deps: List[Optional[Dependency]],
         *,
         cfg: Optional[List[str]] = None,
         is_workspace_member: Optional[bool] = None,
@@ -121,6 +150,7 @@ def generate_crates(
             root_module,
             deps,
             cfg=cfg,
+            crate_attrs=None,
             is_workspace_member=is_workspace_member,
             edition=edition,
         )
@@ -148,9 +178,10 @@ def generate_crates(
     def append_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: List[Dependency],
+        deps: List[Optional[Dependency]],
         *,
         cfg: Optional[List[str]] = None,
+        crate_attrs: Optional[List[str]] = None,
         is_workspace_member: Optional[bool] = None,
         edition: Optional[str] = None,
     ) -> Dependency:
@@ -160,6 +191,7 @@ def generate_crates(
                 root_module,
                 deps,
                 cfg=cfg,
+                crate_attrs=crate_attrs,
                 is_workspace_member=is_workspace_member,
                 edition=edition,
             )
@@ -167,10 +199,12 @@ def generate_crates(
 
     def append_sysroot_crate(
         display_name: str,
-        deps: List[Dependency],
+        deps: List[Optional[Dependency]],
         *,
         cfg: Optional[List[str]] = None,
-    ) -> Dependency:
+    ) -> Optional[Dependency]:
+        if not ctx.manual_sysroot_crates:
+            return None
         return append_crate(
             display_name,
             sysroot_src / display_name / "src" / "lib.rs",
@@ -269,13 +303,14 @@ def generate_crates(
 
     def append_crate_with_generated(
         display_name: str,
-        deps: List[Dependency],
+        deps: List[Optional[Dependency]],
     ) -> Dependency:
         crate = build_crate(
             display_name,
             srctree / "rust"/ display_name / "lib.rs",
             deps,
             cfg=generated_cfg,
+            crate_attrs=None,
             is_workspace_member=True,
             edition=None,
         )
@@ -342,6 +377,7 @@ def generate_crates(
                 path,
                 [core, kernel, pin_init],
                 cfg=generated_cfg,
+                crate_attrs=["no_std"],
             )
 
     return crates
@@ -407,6 +443,21 @@ class RaVersionInfo(enum.Enum):
         date(2024, 12, 23),
         (0, 3, 2228),
         (1, 85, 0),
+        RaVersionCtx(
+            use_crate_attrs=False,
+            manual_sysroot_crates=True,
+        ),
+    )
+    # v0.3.2727, released on 2025-12-22;
+    # v0.3.2743 is shipped with the rustup 1.94.0 toolchain.
+    SUPPROTS_CRATE_ATTRS = (
+        date(2025, 12, 22),
+        (0, 3, 2727),
+        (1, 94, 0),
+        RaVersionCtx(
+            use_crate_attrs=True,
+            manual_sysroot_crates=False,
+        ),
     )
 
     def __init__(
@@ -414,19 +465,30 @@ class RaVersionInfo(enum.Enum):
         release_date: date,
         ra_version: Version,
         rust_version: Version,
+        ctx: RaVersionCtx,
     ) -> None:
         self.release_date = release_date
         self.ra_version = ra_version
         self.rust_version = rust_version
+        self.ctx = ctx
 
 
-class RustProject(TypedDict):
-    crates: List[Crate]
-    sysroot: str
+# TODO: clean up once Python 3.11 is adopted.
+if sys.version_info < (3, 11):
+    class RustProject(TypedDict, total=False):
+        crates: List[Crate]
+        sysroot: str
+        sysroot_src: str
+else:
+    from typing import NotRequired
+    class RustProject(TypedDict):
+        crates: List[Crate]
+        sysroot: str
+        sysroot_src: NotRequired[str]
 
 
 def generate_rust_project(
-    _version_info: RaVersionInfo,
+    version_info: RaVersionInfo,
     srctree: pathlib.Path,
     objtree: pathlib.Path,
     sysroot: pathlib.Path,
@@ -435,13 +497,17 @@ def generate_rust_project(
     cfgs: List[str],
     core_edition: str,
 ) -> RustProject:
+    ctx = version_info.ctx
     rust_project: RustProject = {
         "crates": generate_crates(
-            srctree, objtree, sysroot_src, external_src, cfgs, core_edition
+            ctx, srctree, objtree, sysroot_src, external_src, cfgs, core_edition
         ),
         "sysroot": str(sysroot),
     }
 
+    if not ctx.manual_sysroot_crates:
+        rust_project["sysroot_src"] = str(sysroot_src)
+
     return rust_project
 
 def query_ra_version() -> Optional[str]:

-- 
2.53.0


