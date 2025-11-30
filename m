Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2500A13635C
	for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 21:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764537158; cv=none; b=UoDj+JqM2HKcrJpVoOOI6Fs5eisfrY3tePPLw+vN2tB/xAZ9zFnUxsoohnKClfhYXW3cAOpBtC2msEHSOSjzbaT+GfLy4w3vxujy4QjaEfMy3fqG8RVpVyMsHvyW9eqmaerDx2INah0kxJ0548yqB7QxrYQ8Q4tEDiPfxZFLGIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764537158; c=relaxed/simple;
	bh=eEiEil8seIemHKT/0+pfKyqmKSeZ7JqIh2LubyYV3qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kkeu2G3IFJFT39HXferGKmHyghiEWVnoG8YOwNQbdXKoauWQH+OQYgq+LrCxJOPWTVrEDgUcOLotUjSQMn8UkJMNAQiFfVEPp2KJMS7sxnolekn82NWcXWGV9zUMfeUvfSCKzpnALVn2KKHA7L5blAmKQ+6dU0PnU6libYOL1Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yoz3dGez; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yoz3dGez"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42e2e3c3a83so259884f8f.1
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 13:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764537154; x=1765141954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJAxM7UfUBXkPmHfcP/x/YjOIgMsR5DSLjb2IH0DUQ4=;
        b=Yoz3dGezZLfPgy77ZKhLmhiq51UyAHByPIbKwer72qRkj0zE00l+KzKkKuokZHy3lN
         95qzxsXgBvDXmzOjGjxZiYPfEjySRGpe4ME5fc1MFGAFTSakk1B26HNW/CWuFDkgjwd6
         uFIxkDkikxvtPuMTfF9vTHGu9Ilk7VivoYpkBVkUcZyaVH3EACLthJuexumUIPipzHXn
         y75n+LxxaPQIE9UNunaqT6+k7mN7vmAZSXiH5AATD1mR6I/mXrczdZTJjX9Xreb7mzH4
         YArwe0bI4azGqt3kf1nuu/90ZouEkQ7G1wHut3QEP6I8fJhtc/IkDrXE2dzCTpt4k7OG
         EC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764537154; x=1765141954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJAxM7UfUBXkPmHfcP/x/YjOIgMsR5DSLjb2IH0DUQ4=;
        b=g4aIU+KMTzkFft9KdCfCpnTAO0aW9ALFezE9I11dISuZ/TZIG/Rp9PuMS20w68zvmr
         qiF/zJzllRcOHFXHtBKWlMcalZas89s5EW1v+tf5zWXTvFKuELULFt9lZeZwHt1kD/8H
         f5EZ0KQXvSQ/RkNNz/xw/WEl+lme1le1YlSC1ZOs8bIo1qf3KfCKEL72ee8uAJrIeXca
         91PWchfOSJzKGMCj5ew7PQcdDwNZ4AF9g1M/O1Wafifwdydv6mH0b3HUlug/4hdZ/s7w
         HNvZBE/Bfnx+JL1EQCDMS297/g0iOjQjqB23PyxMrM6GHfzQIAgNg6AfCm7qRZt09qU7
         3OXA==
X-Gm-Message-State: AOJu0Yx9FwTuV/WR2qcmtmsFeKrnEqmzbAQaeqGjukGKUSnU8CPa73oS
	g6bQkn/FCLC+qzSJPukuuAh6A7yXD3ihGcCQeQHaqCZJOvW4D9I+EWOh
X-Gm-Gg: ASbGnctK3zCxsI2eRH48jtYXxhvJ+Jz7sbSDST1XujPdkT0q0WYwtDAE8wR9IaLcfM6
	s8PBwLsQ7b3oTQ9y7z3SfcpZoHvkg8KYB2V605P65ObelH70YF8wxaRIucrGktm8fI5QS/roCtK
	8kqd76A6YReqmi4KkP+84HsOfeFe8oELFo6aEVyTe7OemnnW8uXIsK8dZGDRPvfuoItJZ96lbNm
	jVA/qmJEz1R2mQr8GLIHcjZSoVGd9v0/y16TrcGUltgIeTJPq76jhvjr/QpqciDpOu4k1oEkEbw
	KFyte2LO4BAoe1e8Zavi1LXJPo2R4CNgQDXnKZZUcw4tppfseWuCNb3+o16atFOmHZWXwlmfLoA
	+nCjWwDF3JYeIo310wS5qzXc+s1LSwzdlXRx0JhOhtU1tGds5lZWBFnyeWhk8YUxROYjZyj8Q/U
	ybS6g6mro0++u0yf/eRZ8DnSJEyIODae1e9dPYqYHNk6Q6nd8WdxfK1FONxumc89daiige5/bJA
	NRB7D2mSmOqLPEJwby1f1dp
X-Google-Smtp-Source: AGHT+IHyY5b1kBzFF1ECu8CZOT7LDu5aXovt/O3v8eAy1n9hN8YzuFXm9/bpXwLZ9AjDon6Cvt4PCg==
X-Received: by 2002:a05:6000:2506:b0:42b:3455:e490 with SMTP id ffacd0b85a97d-42cc1cbd05cmr35975477f8f.14.1764537154135;
        Sun, 30 Nov 2025 13:12:34 -0800 (PST)
Received: from archlinux (ip4-46-39-168-190.cust.nbox.cz. [46.39.168.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a38bsm22565908f8f.24.2025.11.30.13.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 13:12:33 -0800 (PST)
From: Peter Novak <seimun018r@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	Peter Novak <seimun018r@gmail.com>
Subject: [PATCH] rust: use consistent backtick formatting for NULL in docs
Date: Sun, 30 Nov 2025 22:12:33 +0100
Message-ID: <20251130211233.367946-1-seimun018r@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some doc comments use `NULL` while others use plain NULL.
This patch makes it consistent by adding backticks everywhere,
matching the majority of existing usage.

This is my first kernel patch - just getting familiar with
the contribution process.

Signed-off-by: Peter Novak <seimun018r@gmail.com>
---
 rust/kernel/clk.rs           | 2 +-
 rust/kernel/debugfs/entry.rs | 2 +-
 rust/kernel/kunit.rs         | 8 ++++----
 rust/macros/lib.rs           | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 1e6c8c42f..dcada231e 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -94,7 +94,7 @@ mod common_clk {
     /// # Invariants
     ///
     /// A [`Clk`] instance holds either a pointer to a valid [`struct clk`] created by the C
-    /// portion of the kernel or a NULL pointer.
+    /// portion of the kernel or a `NULL` pointer.
     ///
     /// Instances of this type are reference-counted. Calling [`Clk::get`] ensures that the
     /// allocation remains valid for the lifetime of the [`Clk`].
diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
index f99402cd3..6f656d452 100644
--- a/rust/kernel/debugfs/entry.rs
+++ b/rust/kernel/debugfs/entry.rs
@@ -148,7 +148,7 @@ pub(crate) fn empty() -> Self {
     /// # Guarantees
     ///
     /// Due to the type invariant, the value returned from this function will always be an error
-    /// code, NULL, or a live DebugFS directory. If it is live, it will remain live at least as
+    /// code, `NULL`, or a live DebugFS directory. If it is live, it will remain live at least as
     /// long as this entry lives.
     pub(crate) fn as_ptr(&self) -> *mut bindings::dentry {
         self.entry
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 79436509d..aecb8dab4 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -193,7 +193,7 @@ pub fn is_test_result_ok(t: impl TestResult) -> bool {
 
 /// Represents an individual test case.
 ///
-/// The [`kunit_unsafe_test_suite!`] macro expects a NULL-terminated list of valid test cases.
+/// The [`kunit_unsafe_test_suite!`] macro expects a `NULL`-terminated list of valid test cases.
 /// Use [`kunit_case_null`] to generate such a delimiter.
 #[doc(hidden)]
 pub const fn kunit_case(
@@ -215,9 +215,9 @@ pub const fn kunit_case(
     }
 }
 
-/// Represents the NULL test case delimiter.
+/// Represents the `NULL` test case delimiter.
 ///
-/// The [`kunit_unsafe_test_suite!`] macro expects a NULL-terminated list of test cases. This
+/// The [`kunit_unsafe_test_suite!`] macro expects a `NULL`-terminated list of test cases. This
 /// function returns such a delimiter.
 #[doc(hidden)]
 pub const fn kunit_case_null() -> kernel::bindings::kunit_case {
@@ -240,7 +240,7 @@ pub const fn kunit_case_null() -> kernel::bindings::kunit_case {
 ///
 /// # Safety
 ///
-/// `test_cases` must be a NULL terminated array of valid test cases,
+/// `test_cases` must be a `NULL` terminated array of valid test cases,
 /// whose lifetime is at least that of the test suite (i.e., static).
 ///
 /// # Examples
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index fa847cf3a..364bd3eba 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -122,7 +122,7 @@ pub fn module(ts: TokenStream) -> TokenStream {
 /// case the default implementation will never be executed. The reason for this
 /// is that the functions will be called through function pointers installed in
 /// C side vtables. When an optional method is not implemented on a `#[vtable]`
-/// trait, a NULL entry is installed in the vtable. Thus the default
+/// trait, a `NULL` entry is installed in the vtable. Thus the default
 /// implementation is never called. Since these traits are not designed to be
 /// used on the Rust side, it should not be possible to call the default
 /// implementation. This is done to ensure that we call the vtable methods
-- 
2.51.0

