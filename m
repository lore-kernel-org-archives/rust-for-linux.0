Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A10328B5B;
	Fri, 16 Jan 2026 16:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579871; cv=none; b=K0b4f6yjPo8kqCewNBlN/zx3cKWh5PCAo09Qctq1u8bvR5tgJjfgRbyNEWP8UCPJNZ9QuyaNx1lUAKxi4mUTThEgYTcFIO/OGheb/5IFVfUG2dngZhxROKe/N8i0w75Gb4jQHY5XI/kjuKUCoziTZ1Xrmaa5esncuWH2+Z+bDwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579871; c=relaxed/simple;
	bh=asx8c2CVxRsgbAP6hXl9P5U6smBiEV7zCNdEAVHFe5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WgxJ3hz3JteKVNCUlqQgCsfZPEscas+zujcDlUqZic1C92Y5oqnAImzWggf6eTb2oylRv4p4K/3XUUcPjcsJfCNrHinFGVG++zQyQw3dpBf5wLSAQ+npE7nkH4vKcreAhpPCKB1y7pTDTJ9agRe5rFP+D3rPgD78evBzzciT7qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oObgDmGQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oObgDmGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6E4C16AAE;
	Fri, 16 Jan 2026 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768579871;
	bh=asx8c2CVxRsgbAP6hXl9P5U6smBiEV7zCNdEAVHFe5o=;
	h=From:Date:Subject:To:Cc:From;
	b=oObgDmGQwZg+5ShK/M1KH9I74PEaRirH4IaJJPksPBtD9DfZmz3m35Ewsw0lTQWy9
	 KADekLilI6Cz0qnYFRaICAa99ZPJbEkF8jtq7pBeKNPkQv0m6yjDkIO9vWEkqWZbMk
	 rHZbjvivcKyhWFPWscbbcEH1v0/py21myY+GDF0gororOKkuEnbpfj42wiwSs04O/G
	 tnhTIx1VOuCt3Ew3GZqw6ajtQqEI8lovLG0Ud5TjIlgiRemaSPMGcubWrZmitzPzMC
	 HMQf0JDMl6EGR8/UJiR36d758OoY+17ux80CBoQ6HuBLf1Pv7DLJ3ZOmb3K38zu2Qb
	 WrIp6lLJo9ScA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 16 Jan 2026 11:11:06 -0500
Subject: [PATCH] scripts: generate_rust_analyzer.py: reduce cfg plumbing
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rust-analyzer-pin-init-duplication-v1-1-5e85c5824a02@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywoCMQyF4VcZsjbQBpwBX0VcxDZqZIill0Ed5
 t2tuvwW5z8rFMkqBQ7DClkWLfqwDr8bINzYroIau4Ecjc77EXMrFdl4fr0lY1JDNa0YW5o1cO1
 zZKLo9kR+mjz0UMpy0efv5Hj6u7TzXUL9lmHbPieyy8qGAAAA
X-Change-ID: 20260116-rust-analyzer-pin-init-duplication-a22d05221771
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1768579869; l=7457;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=asx8c2CVxRsgbAP6hXl9P5U6smBiEV7zCNdEAVHFe5o=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QICROsi3PgrbiiCh/hT+1d4VEgGbpgQtUr3TiiAHyZuJ8korDA8e136BSq4dgtfftvZ6PNYrtX8
 OhqDBn7/QFgw=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Plumb `pin-init{,-internal}` cfgs from Makefile to rust-analyzer and
automatically interpret `--cfg <crate>=<cfg>` as applying to <crate>.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 rust/Makefile                     | 32 +++++++++++++++++++++++---------
 scripts/generate_rust_analyzer.py | 13 +++++--------
 2 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..2461c5835a7e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -210,16 +210,30 @@ rustdoc-ffi: private is-kernel-object := y
 rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
+pin_init_internal-cfgs := \
+    kernel
+
+pin_init_internal-flags := \
+    $(call cfgs-to-flags,$(pin_init_internal-cfgs))
+
 rustdoc-pin_init_internal: private rustdoc_host = yes
-rustdoc-pin_init_internal: private rustc_target_flags = --cfg kernel \
+rustdoc-pin_init_internal: private rustc_target_flags = $(pin_init_internal-flags) \
     --extern proc_macro --crate-type proc-macro
 rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
     rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
+pin_init-cfgs := \
+    kernel
+
+pin_init-flags := \
+    --extern pin_init_internal \
+    --extern macros \
+    $(call cfgs-to-flags,$(pin_init-cfgs))
+
 rustdoc-pin_init: private rustdoc_host = yes
-rustdoc-pin_init: private rustc_target_flags = --extern pin_init_internal \
-    --extern macros --extern alloc --cfg kernel --cfg feature=\"alloc\"
+rustdoc-pin_init: private rustc_target_flags = $(pin_init-flags) \
+    --extern alloc --cfg feature=\"alloc\"
 rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
     rustdoc-macros FORCE
 	+$(call if_changed,rustdoc)
@@ -272,14 +286,13 @@ rusttestlib-macros: $(src)/macros/lib.rs \
     rusttestlib-proc_macro2 rusttestlib-quote rusttestlib-syn FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-pin_init_internal: private rustc_target_flags = --cfg kernel \
+rusttestlib-pin_init_internal: private rustc_target_flags = $(pin_init_internal-flags) \
     --extern proc_macro
 rusttestlib-pin_init_internal: private rustc_test_library_proc = yes
 rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-pin_init: private rustc_target_flags = --extern pin_init_internal \
-    --extern macros --cfg kernel
+rusttestlib-pin_init: private rustc_target_flags = $(pin_init-flags)
 rusttestlib-pin_init: $(src)/pin-init/src/lib.rs rusttestlib-macros \
     rusttestlib-pin_init_internal $(obj)/$(libpin_init_internal_name) FORCE
 	+$(call if_changed,rustc_test_library)
@@ -547,7 +560,7 @@ $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
     $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
-$(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
+$(obj)/$(libpin_init_internal_name): private rustc_target_flags = $(pin_init_internal-flags)
 $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
@@ -570,6 +583,8 @@ rust-analyzer:
 		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
 		--cfgs='quote=$(quote-cfgs)' \
 		--cfgs='syn=$(syn-cfgs)' \
+		--cfgs='pin_init_internal=$(pin_init_internal-cfgs)' \
+		--cfgs='pin_init=$(pin_init-cfgs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
@@ -642,8 +657,7 @@ $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/pin_init.o: private skip_gendwarfksyms = 1
-$(obj)/pin_init.o: private rustc_target_flags = --extern pin_init_internal \
-    --extern macros --cfg kernel
+$(obj)/pin_init.o: private rustc_target_flags = $(pin_init-flags)
 $(obj)/pin_init.o: $(src)/pin-init/src/lib.rs $(obj)/compiler_builtins.o \
     $(obj)/$(libpin_init_internal_name) $(obj)/$(libmacros_name) FORCE
 	+$(call if_changed_rule,rustc_library)
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc94068..b96d3cbe3df1 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -35,7 +35,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     crates_indexes = {}
     crates_cfgs = args_crates_cfgs(cfgs)
 
-    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False, edition="2021"):
+    def append_crate(display_name, root_module, deps, cfg=None, is_workspace_member=True, is_proc_macro=False, edition="2021"):
+        if cfg is None:
+            cfg = crates_cfgs.get(display_name, [])
         crate = {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -60,7 +62,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     def append_sysroot_crate(
         display_name,
         deps,
-        cfg=[],
+        cfg=None,
         edition="2021",
     ):
         append_crate(
@@ -75,7 +77,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
     # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
     # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []), edition=core_edition)
+    append_sysroot_crate("core", [], edition=core_edition)
     append_sysroot_crate("alloc", ["core"])
     append_sysroot_crate("std", ["alloc", "core"])
     append_sysroot_crate("proc_macro", ["core", "std"])
@@ -90,21 +92,18 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         "proc_macro2",
         srctree / "rust" / "proc-macro2" / "lib.rs",
         ["core", "alloc", "std", "proc_macro"],
-        cfg=crates_cfgs["proc_macro2"],
     )
 
     append_crate(
         "quote",
         srctree / "rust" / "quote" / "lib.rs",
         ["alloc", "proc_macro", "proc_macro2"],
-        cfg=crates_cfgs["quote"],
     )
 
     append_crate(
         "syn",
         srctree / "rust" / "syn" / "lib.rs",
         ["proc_macro", "proc_macro2", "quote"],
-        cfg=crates_cfgs["syn"],
     )
 
     append_crate(
@@ -124,7 +123,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
         [],
-        cfg=["kernel"],
         is_proc_macro=True,
     )
 
@@ -132,7 +130,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         "pin_init",
         srctree / "rust" / "pin-init" / "src" / "lib.rs",
         ["core", "pin_init_internal", "macros"],
-        cfg=["kernel"],
     )
 
     append_crate(

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260116-rust-analyzer-pin-init-duplication-a22d05221771

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

