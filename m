Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE52C0282;
	Thu, 15 Jan 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494954; cv=none; b=EtEt5HW4VX35GeJa/Id+Rp133Ru9VgEDfoLmrOuM0Svia6jCk+7QhYKn6rq0uywzu52pVkADyZZ+m/J4sLg1lcHJY7mAciw9wwiAcLdQlO1EclHt/K03cP5gHcOAcaVZ1oeDaI33TaXoXq4Nb+WvagSCiGRaju9teOYMqX368Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494954; c=relaxed/simple;
	bh=8m21RhxED4tma+8uuYKNSOWq2lTjk2yHg3/sNJE9toU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=snRsNeRA/bVDSyZNbsXD//eQjanYj/493ZC2j7g8nGQRHzrc0qanT2VQEunD9gqZxnrMi5g5XJmBTAyWYee+QXkGTxqUiGr6G9I7sZBiRQTOtEWBU0JzOqiihqIMbz4sZMmdEKspedyaJOrp/hiTdc6t/avBFoEcAtLOeRw5INU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVmqjQdy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVmqjQdy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A83EC16AAE;
	Thu, 15 Jan 2026 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768494954;
	bh=8m21RhxED4tma+8uuYKNSOWq2lTjk2yHg3/sNJE9toU=;
	h=From:Date:Subject:To:Cc:From;
	b=rVmqjQdyhde0j0DCyy4n4Huk+MApSoyOCbcKHvxVTglmfo1xQ8zCp7erBA1STYEYH
	 WZRY4n+SPk0yEp2LmCDsLhbworJlubo6qGQ5aOTq7gAsPVYnN+gq1UKqMYJS3O4k2m
	 GF7Oj5I1yYSKFL9m2r29+jHSItbg0AD/g+lfidQ1HyWBK5aacbR6rYjKK2mUcCc/8y
	 akMQ01fpYULojsc6StrgO1GEx1y0PdLlnXqyT5Lcp1s5IHXIj+ZwIQBEslFGmKEpch
	 VXEvYt5PTGrxSAqhlZmIb+yT6NlM4uhgV6BnlCxPmc1iwMRBJA6PLMm9g1cU0rumPO
	 nTopo7phBoGBg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 15 Jan 2026 11:35:50 -0500
Subject: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPduELZkBX8V4KFCkhGymHUYkv
 LtTj9/h/3cwVmGDS7WD8lNMUixwpwr6ieKdUYZi8LU/184F1NUyUqRle7OibaYpZQxj1waitgm
 Dh9I+lEd5/b7X29+2djP3+TuD4/gAVdA5i3kAAAA=
X-Change-ID: 20260115-rust-analyzer-sysroot-5fb95aa985d2
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1768494952; l=4499;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=QMZLLcC9z1PSg3WG4NSojUsLOMEDhxKz1flbQyzB+8k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO+rnkM5eGBqnd4xO8EHJLc0k92WKZ9QcZ9QOS96vppoiCDPSruMc3/EBHwI+feNEPkC2CNhMmR
 2cRKKukaHuQ8=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

From: Tamir Duberstein <tamird@gmail.com>

Rename `core-edition` to `sysroot-edition` to align with the naming used
to refer to standard library crates in `generate_rust_analyzer.py` and
apply it to all standard library crates rather than just core.

Note that backporting this will conflict unless commit 46e58a9637ec ("rust:
kbuild: introduce `core-flags` and `core-skip_flags`") is also backported.

Fixes: f4daa80d6be7 ("rust: compile libcore with edition 2024 for 1.87+")
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/Makefile                     |  7 ++++---
 scripts/generate_rust_analyzer.py | 11 +++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 4dcc2eff51cb..a8ded6c07255 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -67,7 +67,7 @@ cfgs-to-flags = $(patsubst %,--cfg='%',$1)
 core-cfgs := \
     no_fp_fmt_parse
 
-core-edition := $(if $(call rustc-min-version,108700),2024,2021)
+sysroot_edition := $(if $(call rustc-min-version,108700),2024,2021)
 
 core-skip_flags := \
     --edition=2021 \
@@ -75,7 +75,7 @@ core-skip_flags := \
     -Wrustdoc::unescaped_backticks
 
 core-flags := \
-    --edition=$(core-edition) \
+    --edition=$(sysroot_edition) \
     $(call cfgs-to-flags,$(core-cfgs))
 
 proc_macro2-cfgs := \
@@ -567,7 +567,8 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 
 rust-analyzer:
 	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
-		--cfgs='core=$(core-cfgs)' $(core-edition) \
+		$(sysroot_edition) \
+		--cfgs='core=$(core-cfgs)' \
 		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
 		--cfgs='quote=$(quote-cfgs)' \
 		--cfgs='syn=$(syn-cfgs)' \
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 6061bd6e2ebd..47e49f8dacbc 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -19,7 +19,7 @@ def args_crates_cfgs(cfgs):
 
     return crates_cfgs
 
-def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edition):
+def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, sysroot_edition):
     # Generate the configuration list.
     cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
@@ -61,7 +61,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         display_name,
         deps,
         cfg=[],
-        edition="2021",
     ):
         append_crate(
             display_name,
@@ -69,13 +68,13 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             deps,
             cfg,
             is_workspace_member=False,
-            edition=edition,
+            edition=sysroot_edition,
         )
 
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
     # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
     # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []), edition=core_edition)
+    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []))
     append_sysroot_crate("alloc", ["core"])
     append_sysroot_crate("std", ["alloc", "core"])
     append_sysroot_crate("proc_macro", ["core", "std"])
@@ -200,7 +199,7 @@ def main():
     parser = argparse.ArgumentParser()
     parser.add_argument('--verbose', '-v', action='store_true')
     parser.add_argument('--cfgs', action='append', default=[])
-    parser.add_argument("core_edition")
+    parser.add_argument("sysroot_edition")
     parser.add_argument("srctree", type=pathlib.Path)
     parser.add_argument("objtree", type=pathlib.Path)
     parser.add_argument("sysroot", type=pathlib.Path)
@@ -217,7 +216,7 @@ def main():
     assert args.sysroot in args.sysroot_src.parents
 
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.core_edition),
+        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.sysroot_edition),
         "sysroot": str(args.sysroot),
     }
 

---
base-commit: 74e15ac34b098934895fd27655d098971d2b43d9
change-id: 20260115-rust-analyzer-sysroot-5fb95aa985d2

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

