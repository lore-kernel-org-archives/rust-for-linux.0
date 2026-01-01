Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC123A1DB;
	Thu,  1 Jan 2026 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767255743; cv=none; b=jPwS+ply9+iy2QdG9lFhN3LlzxfCZhNvF3IQ81mz37xBYJJJlUc4zIn7z65gPz9lno0g0XRbajDv4QcaUWhiGgD3XTD+GisCOf3dRwiAw4u59KRNlgK6DQVOGqOFd6daZamQUpFJscRQhKlH4PqeYbKEVRD9+E1GPHfIqs2l2V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767255743; c=relaxed/simple;
	bh=Szi00mKmBN44p1iHgaqUbG3cAmIbYSoHC39FX291kGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uOOl1lY6oEGraEboK307aWcVHEMpiHfL11w7DUC3vSys6WArSzdCZFcLjgIfeLRkztGUXkywle5LICaD70S8w8sYvVRvRmP7H8kzgaOn7VrkFJJAzZfU0wIaoqmh4TnwbqXccbnC1KHCbEY/RBtgX4zadUNXSud1QTSxnwb6D60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8Dz09yL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8Dz09yL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 112BBC4CEF7;
	Thu,  1 Jan 2026 08:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767255743;
	bh=Szi00mKmBN44p1iHgaqUbG3cAmIbYSoHC39FX291kGM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=X8Dz09yLON1aLDN4Zldd2B1eo4CkckePChdwB8fkHK+AldxxfWrJo7mLPiZ/X06uj
	 u/9kt0/3b+d7nS3hW0Z+0jmLoarYTpilg/XzfFFMhRr94Y/me51MsCuhxP/dwt8lQh
	 XC2qjGU6xLI5Fb6HrIrfFUbRClXzvuq8Njbxq5VIj0WKZSIiNTNMw6Ur5gR1N/g6PI
	 j4eJPjHrvofDhD9ROzBwoQgBpc+VNSLk8lZ9XHMniUFlG5V7eTDNRr4JZPQ4BvYQae
	 UHkh2Q3sj+bi7eWJIpQjeS8qsYszPytGaPebKCBZdWwF4H8HN8/0JeLRAqV6eaEtj/
	 9S7Z18DYEV1rA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D93EEB56D;
	Thu,  1 Jan 2026 08:22:22 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Thu, 01 Jan 2026 08:21:24 +0000
Subject: [PATCH] scripts: generate_rust_analyzer: reduce the output file
 size
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIMuVmkC/0WNQQ7CMAwEv1LljKU4LU3oVxAH4zhgJCgkbYVA/
 J0AB45jeWeepkhWKWZonibLokXHSwVcNYaPdDkIaKxsnHW9RYuQ5zLBNY8n4QmyxJkFij4EYnA
 b8uRtIDF1fs2S9P5Vb3c/znKba2H6Hf+BofnrCeqqBvSsky4CPuC6SxLQt2lY8GPeUxHg8Vw/h
 iaFtGFMXbTsqe96a8UxteiicHAd2T27hJHM7vV6A129EETuAAAA
X-Change-ID: 20260101-rust-project-reduce-size-d829a7a708ae
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767255742; l=4572;
 i=y.j3ms.n@gmail.com; s=20251225; h=from:subject:message-id;
 bh=fEPh+w8Y+NMyisGvsPgXPjuY6/RbC7wcVePF3f0Ffh4=;
 b=j1VfacoahJifuc3/koMnMMRFojai3MABa61AGcrHSwqIP1QLapT91j9KNXmTo1f3wFpqvrS0C
 EqF4uBC7IXHC1kgoee1PYJ1/a+fYXkYAgSEMk0DiJvYsebQoQuOwQsp
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=2yVgO1I+y7kkFSF2Dc/Dckj4L2FgRnvmERHFt4bspbI=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/20251225 with
 auth_id=586
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Reply-To: y.j3ms.n@gmail.com

From: Jesung Yang <y.j3ms.n@gmail.com>

Use the `cfg_groups` field to aggregate common configurations into a
single project-level definition. This avoids repeating identical `cfg`s
across crates.

As a result, the size of the generated `rust-project.json` is reduced
from 11MiB to 406KiB (about 96% reduction).

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
This patch depends on [1] to ensure it merges cleanly without conflicts.

[1] https://lore.kernel.org/rust-for-linux/20260101-ra-fix-primitive-v1-1-def809357b4e@gmail.com/
---
 scripts/generate_rust_analyzer.py | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 6178a53516ec35f308897e65c5001edd81b0d3dd..2a8578fb784d08b2a5e628bfab935080759d2dce 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -19,15 +19,7 @@ def args_crates_cfgs(cfgs):
 
     return crates_cfgs
 
-def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
-    # Generate the configuration list.
-    cfg = []
-    with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
-        for line in fd:
-            line = line.replace("--cfg=", "")
-            line = line.replace("\n", "")
-            cfg.append(line)
-
+def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, kernel_cfg_group):
     # Now fill the crates list -- dependencies need to come first.
     #
     # Avoid O(n^2) iterations by keeping a map of indexes.
@@ -35,7 +27,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     crates_indexes = {}
     crates_cfgs = args_crates_cfgs(cfgs)
 
-    def append_crate(display_name, root_module, deps, cfg=[], crate_attrs=[], is_workspace_member=True, is_proc_macro=False, edition="2021"):
+    def append_crate(display_name, root_module, deps, cfg=[], cfg_groups=[], crate_attrs=[], is_workspace_member=True, is_proc_macro=False, edition="2021"):
         crate = {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -48,6 +40,8 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
                 "RUST_MODFILE": "This is only for rust-analyzer"
             }
         }
+        if len(cfg_groups) > 0:
+            crate["cfg_groups"] = cfg_groups
         if len(crate_attrs) > 0:
             crate["crate_attrs"] = crate_attrs
         if is_proc_macro:
@@ -134,7 +128,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
             display_name,
             srctree / "rust"/ display_name / "lib.rs",
             deps,
-            cfg=cfg,
+            cfg_groups=[kernel_cfg_group],
             crate_attrs=crate_attrs,
         )
         crates[-1]["env"]["OBJTREE"] = str(objtree.resolve(True))
@@ -189,7 +183,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
                 name,
                 path,
                 ["kernel"],
-                cfg=cfg,
+                cfg_groups=[kernel_cfg_group],
                 crate_attrs=["no_std"],
             )
 
@@ -214,10 +208,22 @@ def main():
     # Making sure that the `sysroot` and `sysroot_src` belong to the same toolchain.
     assert args.sysroot in args.sysroot_src.parents
 
+    # Generate the configuration list.
+    cfg = []
+    with open(args.objtree / "include" / "generated" / "rustc_cfg") as fd:
+        for line in fd:
+            line = line.replace("--cfg=", "")
+            line = line.replace("\n", "")
+            cfg.append(line)
+    kernel_cfg_group = "kernel"
+
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs),
+        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, kernel_cfg_group),
         "sysroot": str(args.sysroot),
-        "sysroot_src": str(args.sysroot_src)
+        "sysroot_src": str(args.sysroot_src),
+        "cfg_groups": {
+            kernel_cfg_group: cfg,
+        },
     }
 
     json.dump(rust_project, sys.stdout, sort_keys=True, indent=4)

---
base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
change-id: 20260101-rust-project-reduce-size-d829a7a708ae
prerequisite-change-id: 20260101-ra-fix-primitive-78154fe8173f:v1
prerequisite-patch-id: 0544fdf5522949047a81c3580960183375574fd3

Best regards,
-- 
Jesung Yang <y.j3ms.n@gmail.com>


