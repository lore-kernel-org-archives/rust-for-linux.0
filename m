Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B830F925;
	Thu, 22 Jan 2026 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103062; cv=none; b=tGBrVlvPRZjCuFtyCmO2Iw3uCGotlkshKgwxn3ofinoQiUyUMrN32BV4FCJ0ZYj8bZhK76aeDnnN+jdxbWuqumETHDrhoCGENK6qW4Ty9j9PdE4cKWQykdAz2U0q0op3YpLu/ABSB1ehPUU/1+U+X5IBztTU29SFFqoC3X8yEwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103062; c=relaxed/simple;
	bh=zMXrgAtF0e7iHP7f42GLvdV5rWt3y/mmSt8wv4h7l9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvb82eWzLQJq9Z2QaeKJQ6nvdl5m7LEg0Hg6066eWW6tY/EdYPAs4MQpAVq4xe9MnW72IjTuLbbIGVr7X1Hf13XduwtOtoTXUplZxEDm8EZepjLE0DKD/0pJiqokanvGB5AWGOaha8uVlQp1ZOjVdXEOPSJzWf3+epnbD4pEc1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uO8m8yqZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uO8m8yqZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A27DC116C6;
	Thu, 22 Jan 2026 17:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103060;
	bh=zMXrgAtF0e7iHP7f42GLvdV5rWt3y/mmSt8wv4h7l9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uO8m8yqZP38LdNv/rSyEUO1QZXSrFm25o9C4qBarV0xAhI0jWA5DaHbXhmICIOFk8
	 sbRhKEo1jSNE8D9+3nCUbZmbQU2kBdPD0j87K5Wgak08K407Fzfx1UC7tVlK25LbeC
	 Tu0h5JAKNY/K0dL02YzSQzcAbhMFWcm/vshfAS3YEVb3+AzTmg5eA+If+pRGaPv3ia
	 B0uRm+XDdknsoEyCm8Y/vhLMsx8h3iUkvxIEAmwgpi3Twvj5QeJFy2MyDFtUrGQ25y
	 suMQPsZwcJ3b4/EO/R8vaF8wKK5QPAPHq5NUWxjep51Zx4Xo1wg+n33wjU7UKe5QWz
	 osv7ze9jTJrEQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 22 Jan 2026 12:30:48 -0500
Subject: [PATCH 4/4] scripts: generate_rust_analyzer.py: identify crates
 explicitly
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-rust-analyzer-types-v1-4-29cc2e91dcd5@kernel.org>
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
In-Reply-To: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
To: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1769103052; l=7970;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=zMXrgAtF0e7iHP7f42GLvdV5rWt3y/mmSt8wv4h7l9U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLoDj7FdQyCDjkHHvRN7RFQVo7wlPYx8Ytsm9evXkDc0bVJCg/086ce3xMNKd3xVt6sfXHGz0aT
 ssmmovTKfkQI=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Use the return of `append_crate` to declare dependency on that crate.
This removes the need to build an index of crates and allows multiple
crates with the same display_name be defined, which allows e.g. host
crates to be defined separately from target crates.

Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 scripts/generate_rust_analyzer.py | 82 ++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 40 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 2723154f207c..b8fa1b4c37b0 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -65,17 +65,14 @@ def generate_crates(
             line = line.replace("\n", "")
             cfg.append(line)
 
-    # Now fill the crates list -- dependencies need to come first.
-    #
-    # Avoid O(n^2) iterations by keeping a map of indexes.
+    # Now fill the crates list.
     crates: List[Crate] = []
-    crates_indexes: Dict[str, int] = {}
     crates_cfgs = args_crates_cfgs(cfgs)
 
     def build_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: List[str],
+        deps: List[Dependency],
         *,
         cfg: Optional[List[str]],
         is_workspace_member: Optional[bool],
@@ -90,7 +87,7 @@ def generate_crates(
             "display_name": display_name,
             "root_module": str(root_module),
             "is_workspace_member": is_workspace_member,
-            "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
+            "deps": deps,
             "cfg": cfg,
             "edition": edition,
             "env": {
@@ -101,12 +98,12 @@ def generate_crates(
     def append_proc_macro_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: List[str],
+        deps: List[Dependency],
         *,
         cfg: Optional[List[str]] = None,
         is_workspace_member: Optional[bool] = None,
         edition: Optional[str] = None,
-    ) -> None:
+    ) -> Dependency:
         crate = build_crate(
             display_name,
             root_module,
@@ -139,19 +136,20 @@ def generate_crates(
         }
         return register_crate(proc_macro_crate)
 
-    def register_crate(crate: Crate) -> None:
-        crates_indexes[crate["display_name"]] = len(crates)
+    def register_crate(crate: Crate) -> Dependency:
+        index = len(crates)
         crates.append(crate)
+        return {"crate": index, "name": crate["display_name"]}
 
     def append_crate(
         display_name: str,
         root_module: pathlib.Path,
-        deps: List[str],
+        deps: List[Dependency],
         *,
         cfg: Optional[List[str]] = None,
         is_workspace_member: Optional[bool] = None,
         edition: Optional[str] = None,
-    ) -> None:
+    ) -> Dependency:
         return register_crate(
             build_crate(
                 display_name,
@@ -165,11 +163,11 @@ def generate_crates(
 
     def append_sysroot_crate(
         display_name: str,
-        deps: List[str],
+        deps: List[Dependency],
         *,
         cfg: Optional[List[str]] = None,
         edition: Optional[str] = None,
-    ) -> None:
+    ) -> Dependency:
         return append_crate(
             display_name,
             sysroot_src / display_name / "src" / "lib.rs",
@@ -182,74 +180,76 @@ def generate_crates(
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
     # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
     # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []), edition=core_edition)
-    append_sysroot_crate("alloc", ["core"])
-    append_sysroot_crate("std", ["alloc", "core"])
-    append_sysroot_crate("proc_macro", ["core", "std"])
+    core = append_sysroot_crate(
+        "core", [], cfg=crates_cfgs.get("core", []), edition=core_edition
+    )
+    alloc = append_sysroot_crate("alloc", [core])
+    std = append_sysroot_crate("std", [alloc, core])
+    proc_macro = append_sysroot_crate("proc_macro", [core, std])
 
-    append_crate(
+    compiler_builtins = append_crate(
         "compiler_builtins",
         srctree / "rust" / "compiler_builtins.rs",
         [],
     )
 
-    append_crate(
+    proc_macro2 = append_crate(
         "proc_macro2",
         srctree / "rust" / "proc-macro2" / "lib.rs",
-        ["core", "alloc", "std", "proc_macro"],
+        [core, alloc, std, proc_macro],
         cfg=crates_cfgs["proc_macro2"],
     )
 
-    append_crate(
+    quote = append_crate(
         "quote",
         srctree / "rust" / "quote" / "lib.rs",
-        ["alloc", "proc_macro", "proc_macro2"],
+        [alloc, proc_macro, proc_macro2],
         cfg=crates_cfgs["quote"],
     )
 
-    append_crate(
+    syn = append_crate(
         "syn",
         srctree / "rust" / "syn" / "lib.rs",
-        ["proc_macro", "proc_macro2", "quote"],
+        [proc_macro, proc_macro2, quote],
         cfg=crates_cfgs["syn"],
     )
 
-    append_proc_macro_crate(
+    macros = append_proc_macro_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
+        [std, proc_macro, proc_macro2, quote, syn],
     )
 
-    append_crate(
+    build_error = append_crate(
         "build_error",
         srctree / "rust" / "build_error.rs",
-        ["core", "compiler_builtins"],
+        [core, compiler_builtins],
     )
 
-    append_proc_macro_crate(
+    pin_init_internal = append_proc_macro_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
         [],
         cfg=["kernel"],
     )
 
-    append_crate(
+    pin_init = append_crate(
         "pin_init",
         srctree / "rust" / "pin-init" / "src" / "lib.rs",
-        ["core", "pin_init_internal", "macros"],
+        [core, pin_init_internal, macros],
         cfg=["kernel"],
     )
 
-    append_crate(
+    ffi = append_crate(
         "ffi",
         srctree / "rust" / "ffi.rs",
-        ["core", "compiler_builtins"],
+        [core, compiler_builtins],
     )
 
     def append_crate_with_generated(
         display_name: str,
-        deps: List[str],
-    ) -> None:
+        deps: List[Dependency],
+    ) -> Dependency:
         crate = build_crate(
             display_name,
             srctree / "rust"/ display_name / "lib.rs",
@@ -271,9 +271,11 @@ def generate_crates(
         }
         return register_crate(crate_with_generated)
 
-    append_crate_with_generated("bindings", ["core", "ffi", "pin_init"])
-    append_crate_with_generated("uapi", ["core", "ffi", "pin_init"])
-    append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "ffi", "bindings", "uapi"])
+    bindings = append_crate_with_generated("bindings", [core, ffi, pin_init])
+    uapi = append_crate_with_generated("uapi", [core, ffi, pin_init])
+    kernel = append_crate_with_generated(
+        "kernel", [core, macros, build_error, pin_init, ffi, bindings, uapi]
+    )
 
     def is_root_crate(build_file: pathlib.Path, target: str) -> bool:
         try:
@@ -303,7 +305,7 @@ def generate_crates(
             append_crate(
                 name,
                 path,
-                ["core", "kernel"],
+                [core, kernel],
                 cfg=cfg,
             )
 

-- 
2.52.0

