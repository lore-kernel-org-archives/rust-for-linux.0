Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698FC3382CB
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769432731; cv=none; b=GnklOevVnafl2hY4Y0QUU/q/6uHvLaSMMBxtzzIT1Oz3kQpgwqqaKle7CdsGhWLiT4Nn5KSaEnxzl3MZ4+kgFZh1XzU2eDpDKnCttTK7JgaxgTE89Rh5FAsSoJdfHNXkzpQmY87f7i884pWRmLvmrhvKemfgzt2GB6gkhFFhvOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769432731; c=relaxed/simple;
	bh=bXzZLukQXEbPWRHxObil5vyPCVlHq4BXTn8D2BTuTm8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GshJCuoyPGvJCXIV9dFKCCfyZh6W1Oe5I2zdlPHKlRrkNS9UDwQ2WCaJT3ZbsYHoZksdmr+wy9Dpdt/eYFB0bdnZhts2HtIlrxvM6x9F9rT+YrKvfg8st3EejfYKH8eZz18Sf6Limti8Mb1FP/FzMFMmTglWX2T4phCTnf4FT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TomOpbD0; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TomOpbD0"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-480600391e2so9538715e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769432728; x=1770037528; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gN2t17/t1rDSBRJlYmD8L1PuCsoH1p/D10jNGeOcAjc=;
        b=TomOpbD04f6pwTQfko1b2fNKs5QM/zOYyq1xD9kM+y5QB1mdjgesxLyaLiiWW5YB4I
         sfD1YowHw9pXLrSTjS6b/v6Hf5jDIDdp6gy+npEe3K6lZHhQp0S17Ym9CYqhX20RJCxr
         tIyWF8w9FiZ1tI/1DCRZr6sYoMXSwMY7BNc6FBjegMEOMUt4DmZzLk2RSQPkxtzCctjc
         az5zNWooGsPdwYR6klBvQHABZULnsQr5gTT00gT2+VTXOnqCfnzKhBt8uckn742+RC+7
         yP4K1m7+WaWV4EdqEc/BxZmz/Bq19da/b7gaFbDj45ARNUFWft2UhzAYV7Ve3I9LwMZJ
         PJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432728; x=1770037528;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gN2t17/t1rDSBRJlYmD8L1PuCsoH1p/D10jNGeOcAjc=;
        b=PAxcOtsG9QNGxyQx67mkrVb1IRfNV4ApEJ2rPV5Ts9PUj/dw8KBsdJAfJ1k66q/g1p
         CvYTokXoW9mTkgdLkLeW3gnQUz5p/hEo9YSZlK3TBoBfPIgUKwnLn4cCQuu7xFp/XdLl
         qHpvdaCoCjHtGH3x00Zp/6+c0B1u+aD2KtFz6x5cyaxdmLer5ZRA7RQjUB1sYHA1SKPp
         hPIFdjB4iKoQ/Xp3p6Pe7usBJagalM/NWZGll8pQYrPJufr92JHOxkeKvQAjhiOV04WP
         Y3FhPnItenzxSa8PPM1ruaNltyp+uBfhCFhhbLU0Ue0HeBP2EdNwI/hGLuOTUJjFFG2B
         CX4Q==
X-Gm-Message-State: AOJu0YwaBWDTP9U3YRiJgyUly4gJ/YdcTNHMUWqZcZpFXeEiDXGdAUND
	aITvkoVr6rQJvDYGQAWtN1MGmNkF18tgUeh5GLntT07aorL+pV7Mj8B29NzaBLAzpQAL3ATMEI6
	BfWqIGNIUTcxBHrJ+4A==
X-Received: from wmbjj21.prod.google.com ([2002:a05:600c:6a15:b0:46e:1e57:dbd6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470e:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-4805ce3fcaemr63455715e9.5.1769432727799;
 Mon, 26 Jan 2026 05:05:27 -0800 (PST)
Date: Mon, 26 Jan 2026 13:05:14 +0000
In-Reply-To: <20260126-zeroable-ffi-v1-0-0ef101d1ed85@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260126-zeroable-ffi-v1-0-0ef101d1ed85@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=bXzZLukQXEbPWRHxObil5vyPCVlHq4BXTn8D2BTuTm8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpd2aV4Lk3pJz0stKiMcxdwDpn8Kl1BIjlWX/rA
 aiAyQf03zGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXdmlQAKCRAEWL7uWMY5
 RuoiEAC1swO+geQ+r+AjShO8mOnMB/d2DuExVIlaIuoxklXWLQXi30gIy/MzfAAkXa3MM0hHl2j
 hh53B8QTFDgYVxbfzUdlR2iiLv7JD9zdJXcQWboxTqRakN/Z8lhDdQz+tZXG4kDyEzuVhJVWTsp
 hEp1lNtWWRrT5sN52J9Rks+F/KbQwA3ZjqknlUJoIKuqffWbC3OeZ19nJTXQ+lNraopmiJ7/H2G
 0fCUTS26dd6Di792kIMpyY0Kdy07GHev06L7g453oNygCHc7ksg+ROsK2girhonLkVBCdI7dj8a
 4p7ZX6Z3Ovwc+//kovrIehqaaHeJoLWWBO+BfKZWjCF2N0GxPQRB5wgK3pCwfx9COnmo/rzNDsg
 m+Oria3AxIzwcgIKEXGXmDq6jKquJT+rFJD5VjswYLdQ8qMWYhZgpGRZjmLXc7AYfnBdHOLfe1J
 3HSS/YNE9DyRhSqmFb6abGDjUl9MAdJfRT42gD/HSjhWJWu69722AcH3+84x2HFPv4xIHX/2iMF
 8dC814QSrhnvf+jWFMe1hdzwSHZA09toEN1KnxglEjuBr3RhqTfxyR67J8ytsr3zOua92OXYI7e
 f8jiLcJOHbX6hfJiqVQ3Y+zUvI6yFB7lJ7tPyXp+x4I6NoPeIDdxiCATHZ/bcKxTEaEVltMOBxc s8T1/rN35j3ksVA==
X-Mailer: b4 0.14.2
Message-ID: <20260126-zeroable-ffi-v1-1-0ef101d1ed85@google.com>
Subject: [PATCH 1/4] rust: ffi: reexport Zeroable and related items
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Len Brown <lenb@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To implement FromBytes/AsBytes for bindings types, we need to move these
traits to the ffi crate. For consistency, this means that Zeroable
should also be available from the ffi crate. Thus, add the appropriate
re-exports.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/Makefile | 9 ++++++---
 rust/ffi.rs   | 7 +++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704d15e43effc528be8f5a4d74d3d8d..701d64c2310858aca8f7f76d698549fa014f62bf 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -207,7 +207,8 @@ rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-ffi: private is-kernel-object := y
-rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
+rustdoc-ffi: private rustc_target_flags = --extern pin_init
+rustdoc-ffi: $(src)/ffi.rs rustdoc-pin_init rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-pin_init_internal: private rustdoc_host = yes
@@ -249,7 +250,8 @@ quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
 rusttestlib-build_error: $(src)/build_error.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-ffi: $(src)/ffi.rs FORCE
+rusttestlib-ffi: private rustc_target_flags = --extern pin_init
+rusttestlib-ffi: $(src)/ffi.rs rusttestlib-pin_init FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
@@ -657,7 +659,8 @@ $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/ffi.o: private skip_gendwarfksyms = 1
-$(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
+$(obj)/ffi.o: private rustc_target_flags = --extern pin_init
+$(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o $(obj)/pin_init.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/bindings.o: private rustc_target_flags = --extern ffi --extern pin_init
diff --git a/rust/ffi.rs b/rust/ffi.rs
index f961e9728f590fd2c52d4c03a1f715d654051d04..7218d4c535cbd7163d9aca52b0525c588a394d1b 100644
--- a/rust/ffi.rs
+++ b/rust/ffi.rs
@@ -48,3 +48,10 @@ macro_rules! alias {
 pub use core::ffi::c_void;
 
 pub use core::ffi::CStr;
+
+pub use pin_init::{
+    zeroed,
+    MaybeZeroable,
+    Zeroable,
+    ZeroableOption, //
+};

-- 
2.52.0.457.g6b5491de43-goog

