Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1230F547
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766783323; cv=none; b=jhXkH2T5slMHvRF3w2qVGtNQH9iHaVlmC/6ex7xJzLyor2UDM9AudjwxZ4dzCd1ozfW4zVOhXcokbAEe95a1AM8SA+r9VJ/IbKy2ridTotFW1U2ydj8HUP/vdXgovqizDab7jf4ZbNEQbhUgCzX0qxaioewlQsPfv0g+brFjAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766783323; c=relaxed/simple;
	bh=VccHLUjK3IRX9cFk0CQPTzdLOHNgkUDYIYBSB1eUnV8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W31Xh221yE/rIhnJZZ9jP+Y2kS7ScYW6KYZCuS85kSjmF4w62V1SrseSjIeAQmDha5KoJLNeszjTygwo7IwHOu2WfIMiXMFcYz5n7LhQ+KEA8MKqaX0oxZ3v30zKaHZqVgRou6qHnnWYBeifPY7ommROsw9r4Qc1izZNcfbwBNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zZsq3Slx; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zZsq3Slx"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso10913414a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 13:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766783320; x=1767388120; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0vAmDPnKhZaxIMXmCiS6v0B3OVLZh4yL/KA0IE6TCw=;
        b=zZsq3SlxsasTH8BDtN8IlMXcYkAr9eqXMsctp8le2CMvshDppvzjZ8DRdctdIK+NzL
         2Ue58zPU5HtueGw3AthWHnvDUwyD/02MENWRv6ArLxZOap6J6EVYXLHH8yRl6jS1sRUG
         RpP3BucnbnQQkEY8dQgRtcvypFRPKjPLMHC49AWOS26j+jq0uJI1+LLpCXJUStGzuEx+
         wGFDyURMxDatDbpQPUgWc49X36rJDCjmly/aLHrxDTAXmLESSim2zy5tPezu/GPAHIfm
         kSKkwXTcjI6hPWuPNJDtGOUdmZKf0gMT6i5ONJ5zvL5PKxAEH/PvbpPpHYdcUFycPJCj
         jbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766783320; x=1767388120;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0vAmDPnKhZaxIMXmCiS6v0B3OVLZh4yL/KA0IE6TCw=;
        b=qg/kNZs3/w3o/u85Ymh+QF1IA0gkZnKWin/yKKiKrryALBEcuMovfGi0vgtTfSelsb
         3GIbBR24qILrVEjCPNnQFrC9KAfx7oZQ++9/d8L3ChAwD00r4T4I/YGcoaRiy3/CxZef
         XhjV5K8CmW40800j+zOXDMOEeTu6Qu+Y/swgqRhktTMsqzOFjaTY43pxT7fAvTab/qne
         8Pwjou66V1v0y0oVIBM5ZRUSfJD37vBRrhuQkS3d5e3q248Vx9iqNXbtgPu9+j08Lclt
         ruUSgD1oMzK+5Fn43x+pAQY720uBEay9dae2OoG7zToWrRqT3NuXRSXN1yYRWljjITCE
         EqDA==
X-Gm-Message-State: AOJu0YyIaNUG4idb/hb57tbl9MI+MGSGGSBFCc36qei0PIq1lV79CUv2
	9TL9ORh3st+QHxHC8L12GGlMJxYPiEcnika7ZP1M3sSL0buxGGD7z117Wd4Ku6TBNw5OBZE9zyA
	bGc3Ls0vLzg==
X-Google-Smtp-Source: AGHT+IHuYGZ+YiX9+snBG0lqZczrBSGybXzxG3SALPhqNUd/Pdi32QMIZF7otLmy1sbSZNOxCTBK3ptP7N9p
X-Received: from dlc13.prod.google.com ([2002:a05:7022:38d:b0:11f:457b:a457])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6ab:b0:11b:c0db:a5ea
 with SMTP id a92af1059eb24-121722d3a98mr25104281c88.26.1766783320464; Fri, 26
 Dec 2025 13:08:40 -0800 (PST)
Date: Fri, 26 Dec 2025 21:08:22 +0000
In-Reply-To: <20251226-transmute-v3-0-c69a81bf8621@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251226-transmute-v3-0-c69a81bf8621@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766783314; l=4016;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=VccHLUjK3IRX9cFk0CQPTzdLOHNgkUDYIYBSB1eUnV8=; b=2cVKLnh9slEA2V7MhxuCXwqIXLL+815nLADLq62pkWp6fObgrGyBo4eHeQA20HIRQaWIsZ2tb
 SYaRsAHRnDeAkjhnp4M/m+2yCl46FXV8m5CLFdQYf2jpV2dHG/Wsx20
X-Mailer: b4 0.14.2
Message-ID: <20251226-transmute-v3-3-c69a81bf8621@google.com>
Subject: [PATCH v3 3/4] rust: transmute: Migrate AsBytes/FromBytes to ffi
 crate for bindgen
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

When referencing a trait from inside the `uapi` or `bindings` crates,
the `kernel` crate is not available as the it depends on them. To break
this cycle, move the `transmute` module containing the two traits to the
`ffi` crate which is already used to export similar traits to `uapi` and
`bindings`.

Re-export `transmute` in its original position in the kernel to avoid
any breakage. Normal users are expected to continue using it from
`kernel::transmute`.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/Makefile                     | 6 +++---
 rust/{ffi.rs => ffi/lib.rs}       | 5 +++++
 rust/{kernel => ffi}/transmute.rs | 0
 rust/kernel/lib.rs                | 2 +-
 scripts/generate_rust_analyzer.py | 2 +-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704d15e43effc528be8f5a4d74d3d8d..5c2cb78f7c258aa87d8128593159be1f5945252f 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -207,7 +207,7 @@ rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-ffi: private is-kernel-object := y
-rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
+rustdoc-ffi: $(src)/ffi/lib.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-pin_init_internal: private rustdoc_host = yes
@@ -249,7 +249,7 @@ quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
 rusttestlib-build_error: $(src)/build_error.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-ffi: $(src)/ffi.rs FORCE
+rusttestlib-ffi: $(src)/ffi/lib.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
@@ -657,7 +657,7 @@ $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/ffi.o: private skip_gendwarfksyms = 1
-$(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
+$(obj)/ffi.o: $(src)/ffi/lib.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/bindings.o: private rustc_target_flags = --extern ffi --extern pin_init
diff --git a/rust/ffi.rs b/rust/ffi/lib.rs
similarity index 87%
rename from rust/ffi.rs
rename to rust/ffi/lib.rs
index f961e9728f590fd2c52d4c03a1f715d654051d04..14052362f091a609bc505fe6eca77fe998fe2321 100644
--- a/rust/ffi.rs
+++ b/rust/ffi/lib.rs
@@ -10,6 +10,11 @@
 
 #![no_std]
 
+#[doc(hidden)]
+// This lives here to make it accessible to `bindings`, similar to the other `ffi` types.
+// User code should access it through `kernel::transmute`.
+pub mod transmute;
+
 macro_rules! alias {
     ($($name:ident = $ty:ty;)*) => {$(
         #[allow(non_camel_case_types, missing_docs)]
diff --git a/rust/kernel/transmute.rs b/rust/ffi/transmute.rs
similarity index 100%
rename from rust/kernel/transmute.rs
rename to rust/ffi/transmute.rs
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf12004286962985a068665443dc22c389a2..4aa54dd83319ef16bd4baa1964114f1e6549942b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -63,6 +63,7 @@
 extern crate self as kernel;
 
 pub use ffi;
+pub use ffi::transmute;
 
 pub mod acpi;
 pub mod alloc;
@@ -146,7 +147,6 @@
 pub mod task;
 pub mod time;
 pub mod tracepoint;
-pub mod transmute;
 pub mod types;
 pub mod uaccess;
 #[cfg(CONFIG_USB = "y")]
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc940681426771db865bc2462e7029a6d7d..843d081eacaca8edeeac5978bd8107a498008186 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -137,7 +137,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
 
     append_crate(
         "ffi",
-        srctree / "rust" / "ffi.rs",
+        srctree / "rust" / "ffi" / "lib.rs",
         ["core", "compiler_builtins"],
     )
 

-- 
2.52.0.351.gbe84eed79e-goog

