Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FD344D87;
	Thu, 22 Jan 2026 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103057; cv=none; b=cH4fDGm6iakFM6kqbJ64gHv8LteyzB5L0z0LRxX2MPhSmxzwZmCM4GlqVdCn7KJhHN53cJbwf0R7N9SOF0syzcuoReoNJFLk8Rn9k2GX6s4ShwF7O0KpAmvT/WzawK1I6jMPT0AUr2Ixrr39Z9K/BlfnPdYClO3LRDANSLS1w3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103057; c=relaxed/simple;
	bh=JBx7i2BRLUG0r+j5Fz0gzZAgW8vhiXHQUtlgJNI/jP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCaal45lHTMV8utVAjf509ZFOvAyxVel/3ZVT++uQTae5iBc6jDHaNWM2UbpmPKW0vlZUmx+AMjuDg12iSbDX7pfDnnatsNjkmBUyoXQkvfMysLGbXWRrOQCOTURakjwVCNhjEW5IwvMnlPQB4xwkEqYv/JraSYmMg+2PkLUJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGlj5CZG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGlj5CZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72B4C116D0;
	Thu, 22 Jan 2026 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103056;
	bh=JBx7i2BRLUG0r+j5Fz0gzZAgW8vhiXHQUtlgJNI/jP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dGlj5CZGuO+euivDkcOl9zE1uWFycDHBNjFzL5BK3hBhmUyFVyUV4tmj1YgGvmNhr
	 dZW+znteo9pyuPTYO0ouGZx9zTj1KyPS4MGoVhbSsxK1AzkcvXQHYZ6sGSnx/yd3j/
	 AdKQU+afY5X81TyPgw89iWeMayellCkkuRbpwJc9FpqjiBlA2eO8QzdW5x0RU39YL+
	 GMyuqgO14ltou7Qub4BFqIF0YjJLzO+D1dXq3b2N9rgkCKmQ66h7YsapkImXi45zmz
	 HWd2I5+Tkt2t4PQTTsUN7+BIG3hoy3rmxPREtjVMopai+VBoStEX2eh5/GonN9W5Yq
	 MK7LFaw2wTnYA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 22 Jan 2026 12:30:45 -0500
Subject: [PATCH 1/4] scripts: generate_rust_analyzer.py: extract
 `{build,register}_crate`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-rust-analyzer-types-v1-1-29cc2e91dcd5@kernel.org>
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
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Fiona Behrens <me@kloenk.dev>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1769103052; l=4750;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=JBx7i2BRLUG0r+j5Fz0gzZAgW8vhiXHQUtlgJNI/jP8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBvk2QshFFuouW6hPMnB+1oxDzkDdaBKZVQmwRz5F1seW+gwC6DVU8sPURGcJ6uy6mu0UZBbwdV
 8VQ6gTiCylAw=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Extract helpers from `append_crate` to avoid the need to peek into
`crates[-1]`. This improves readability.

Change default parameters to `None` with true defaults applied in
`build_crate` to avoid repeating the defaults in wrapper functions such
as `append_crate`.

Use `ruff format` to format modified lines.

Suggested-by: Trevor Gross <tmgross@umich.edu>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 scripts/generate_rust_analyzer.py | 76 +++++++++++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 14 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc94068..fbf686f0dced 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -35,7 +35,22 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     crates_indexes = {}
     crates_cfgs = args_crates_cfgs(cfgs)
 
-    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False, edition="2021"):
+    def build_crate(
+        display_name,
+        root_module,
+        deps,
+        *,
+        cfg,
+        is_workspace_member,
+        is_proc_macro,
+        edition,
+    ):
+        cfg = cfg if cfg is not None else []
+        is_workspace_member = (
+            is_workspace_member if is_workspace_member is not None else True
+        )
+        is_proc_macro = is_proc_macro if is_proc_macro is not None else False
+        edition = edition if edition is not None else "2021"
         crate = {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -54,20 +69,46 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
                 stdin=subprocess.DEVNULL,
             ).decode('utf-8').strip()
             crate["proc_macro_dylib_path"] = f"{objtree}/rust/{proc_macro_dylib_name}"
-        crates_indexes[display_name] = len(crates)
+        return crate
+
+    def register_crate(crate):
+        crates_indexes[crate["display_name"]] = len(crates)
         crates.append(crate)
 
+    def append_crate(
+        display_name,
+        root_module,
+        deps,
+        *,
+        cfg=None,
+        is_workspace_member=None,
+        is_proc_macro=None,
+        edition=None,
+    ):
+        return register_crate(
+            build_crate(
+                display_name,
+                root_module,
+                deps,
+                cfg=cfg,
+                is_workspace_member=is_workspace_member,
+                is_proc_macro=is_proc_macro,
+                edition=edition,
+            )
+        )
+
     def append_sysroot_crate(
         display_name,
         deps,
-        cfg=[],
-        edition="2021",
+        *,
+        cfg=None,
+        edition=None,
     ):
-        append_crate(
+        return append_crate(
             display_name,
             sysroot_src / display_name / "src" / "lib.rs",
             deps,
-            cfg,
+            cfg=cfg,
             is_workspace_member=False,
             edition=edition,
         )
@@ -145,20 +186,27 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         display_name,
         deps,
     ):
-        append_crate(
+        crate = build_crate(
             display_name,
             srctree / "rust"/ display_name / "lib.rs",
             deps,
             cfg=cfg,
+            is_workspace_member=True,
+            is_proc_macro=False,
+            edition=None,
         )
-        crates[-1]["env"]["OBJTREE"] = str(objtree.resolve(True))
-        crates[-1]["source"] = {
-            "include_dirs": [
-                str(srctree / "rust" / display_name),
-                str(objtree / "rust")
-            ],
-            "exclude_dirs": [],
+        crate["env"]["OBJTREE"] = str(objtree.resolve(True))
+        crate_with_generated = {
+            **crate,
+            "source": {
+                "include_dirs": [
+                    str(srctree / "rust" / display_name),
+                    str(objtree / "rust"),
+                ],
+                "exclude_dirs": [],
+            },
         }
+        return register_crate(crate_with_generated)
 
     append_crate_with_generated("bindings", ["core", "ffi", "pin_init"])
     append_crate_with_generated("uapi", ["core", "ffi", "pin_init"])

-- 
2.52.0

