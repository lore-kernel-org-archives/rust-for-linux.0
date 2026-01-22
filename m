Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECB1366047;
	Thu, 22 Jan 2026 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103057; cv=none; b=L+g6mp5d/ShrMDJY6q8ldRg6oXNqXiYhC+HV3eQEqKTVW+Zf+JsCHY1aTP2Bdu0ILHSBPbSGR3tbmPqAwY3P3ajRz+Ceyyk3uyEulVTcviPyHGpsROu38TZ4b6cJQh5tR+v8JqBSp3chJJc8BiqTpjczqYvbmByJC3ts1+nsTh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103057; c=relaxed/simple;
	bh=rqkfMsPmGDvPE2L5/f+Gzp/R09gApJ9QjhDPUA9qg4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WpMvIHrJcfAI6EtqymbXObs89Z3t/vaiuRU8zrMgkNmwUIcIN/DzUHH+0ZcTDs7rFbpl503PpdZxeLZoFQMQLv8DOyQAVIyQR2DLCRArrxF60l5kWla0kLPBz6sw44Ja3O4oy/yg5x1iNCvGADNVYeZFYXPVhLzUdNwyf6Mygu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ijhg0gDv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ijhg0gDv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3887EC116C6;
	Thu, 22 Jan 2026 17:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103057;
	bh=rqkfMsPmGDvPE2L5/f+Gzp/R09gApJ9QjhDPUA9qg4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ijhg0gDv5v1DZ02tAuaih2+qfvRWYbA3RrBWzRP37QVPJ1Cklv80ZKalTMx24h8HY
	 s/LNcgE+ngpjscOpyaZ+9KOrNuvHDi95020NL7ebzj9g1kBIqnRY2uPKWQx5Ovb4zv
	 UpcUflfEWBTNtwuQmqCwQSBtZIZmTxnGDzkF4QoY3Lodt2KipQbUsVz+1i5BbTk+7m
	 G2wx7Go6si2tDi+9DqMVUTLPfXdipwIgRaH5tKa3yUg+qkVLVaev76rnj/bq7/vnDv
	 Mz29LFHFXFdfmmQloG78gzazE8EROdZS2QHrCHN2MlDL6iPnzW04FFGhNSo/HWe1DK
	 3J75DNdOSr8dQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 22 Jan 2026 12:30:46 -0500
Subject: [PATCH 2/4] scripts: generate_rust_analyzer.py: drop
 `"is_proc_macro": false`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-rust-analyzer-types-v1-2-29cc2e91dcd5@kernel.org>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1769103052; l=5649;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=rqkfMsPmGDvPE2L5/f+Gzp/R09gApJ9QjhDPUA9qg4I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHH8mXRFRmnUphKAu9VNG/SEWTkjCFYPQdyIMGB3XHvtlVu9pMcrjn+3dSQRR7GtCrSsz/ikSPf
 V9hRlsPxtCwM=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Add a dedicated `append_proc_macro_crate` function to reduce overloading
in `append_crate`. This has the effect of removing `"is_proc_macro":
false` from the output; this field is interpreted as false if absent[1]
so this doesn't change the behavior of rust-analyzer.

Use the `/` operator on `pathlib.Path` rather than directly crafting a
string. This is consistent with all other path manipulation in this
script.

Link: https://github.com/rust-lang/rust-analyzer/blob/8d01570b5e812a49daa1f08404269f6ea5dd73a1/crates/project-model/src/project_json.rs#L372-L373 [1]
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 scripts/generate_rust_analyzer.py | 60 ++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 17 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index fbf686f0dced..bc79e4d8e8e7 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -42,20 +42,17 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         *,
         cfg,
         is_workspace_member,
-        is_proc_macro,
         edition,
     ):
         cfg = cfg if cfg is not None else []
         is_workspace_member = (
             is_workspace_member if is_workspace_member is not None else True
         )
-        is_proc_macro = is_proc_macro if is_proc_macro is not None else False
         edition = edition if edition is not None else "2021"
-        crate = {
+        return {
             "display_name": display_name,
             "root_module": str(root_module),
             "is_workspace_member": is_workspace_member,
-            "is_proc_macro": is_proc_macro,
             "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
             "cfg": cfg,
             "edition": edition,
@@ -63,13 +60,47 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
                 "RUST_MODFILE": "This is only for rust-analyzer"
             }
         }
-        if is_proc_macro:
-            proc_macro_dylib_name = subprocess.check_output(
-                [os.environ["RUSTC"], "--print", "file-names", "--crate-name", display_name, "--crate-type", "proc-macro", "-"],
+
+    def append_proc_macro_crate(
+        display_name,
+        root_module,
+        deps,
+        *,
+        cfg=None,
+        is_workspace_member=None,
+        edition=None,
+    ):
+        crate = build_crate(
+            display_name,
+            root_module,
+            deps,
+            cfg=cfg,
+            is_workspace_member=is_workspace_member,
+            edition=edition,
+        )
+        proc_macro_dylib_name = (
+            subprocess.check_output(
+                [
+                    os.environ["RUSTC"],
+                    "--print",
+                    "file-names",
+                    "--crate-name",
+                    display_name,
+                    "--crate-type",
+                    "proc-macro",
+                    "-",
+                ],
                 stdin=subprocess.DEVNULL,
-            ).decode('utf-8').strip()
-            crate["proc_macro_dylib_path"] = f"{objtree}/rust/{proc_macro_dylib_name}"
-        return crate
+            )
+            .decode("utf-8")
+            .strip()
+        )
+        proc_macro_crate = {
+            **crate,
+            "is_proc_macro": True,
+            "proc_macro_dylib_path": str(objtree / "rust" / proc_macro_dylib_name),
+        }
+        return register_crate(proc_macro_crate)
 
     def register_crate(crate):
         crates_indexes[crate["display_name"]] = len(crates)
@@ -82,7 +113,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         *,
         cfg=None,
         is_workspace_member=None,
-        is_proc_macro=None,
         edition=None,
     ):
         return register_crate(
@@ -92,7 +122,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
                 deps,
                 cfg=cfg,
                 is_workspace_member=is_workspace_member,
-                is_proc_macro=is_proc_macro,
                 edition=edition,
             )
         )
@@ -148,11 +177,10 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         cfg=crates_cfgs["syn"],
     )
 
-    append_crate(
+    append_proc_macro_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
         ["std", "proc_macro", "proc_macro2", "quote", "syn"],
-        is_proc_macro=True,
     )
 
     append_crate(
@@ -161,12 +189,11 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         ["core", "compiler_builtins"],
     )
 
-    append_crate(
+    append_proc_macro_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
         [],
         cfg=["kernel"],
-        is_proc_macro=True,
     )
 
     append_crate(
@@ -192,7 +219,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             deps,
             cfg=cfg,
             is_workspace_member=True,
-            is_proc_macro=False,
             edition=None,
         )
         crate["env"]["OBJTREE"] = str(objtree.resolve(True))

-- 
2.52.0

