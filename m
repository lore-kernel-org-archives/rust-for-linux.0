Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898613A7850
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909949; cv=none; b=XDtm0IFUYlcHaEZNuEoUCQ9xGBIE8aoEpe4oxML7AQVGiU28+qeHQxxyOkC0XWYHT2xSTWOqBktLyP2z68z/NdplJhoNN19DgIX9vKGzrQ8SCsRGHm6nWMb5C+6M4AIBcdjHKDQrGnTiSTcYbbdm7dggIUTAUSTkFFTMXqolO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909949; c=relaxed/simple;
	bh=bvuVfpg7fANpqrGpBEK9Ta/Hkb+dwC9XZqzfpSHeTjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VK64txZgYi0CO4jrVTVtJbTizU0mh8u4wbic+5YBsw/ZF1+3wCAk8HlfbJ/eQHKX1wtsrPaiADGwxz1uVmVWiCbD54tCVNE07RBoQ3PSZDcUVEc2tIB/7B8wrYi2HtimQJ7WT0vVdMFa5ot3RuXVodkReNuKDWsx/f1HiWPxKA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZLQHPZa; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZLQHPZa"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso53231496d6.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 03:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768909942; x=1769514742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1M3E4UxKfMJ+dI/l+/VVbPQmnjuaMV2kWf95M7jFT9o=;
        b=lZLQHPZayZfdeaVhh8SLENMbqPIm+/SU6AdOOfukMavEYQtV4FMd04lvrhjCSYNVKn
         csbAZyhLzEuyTrHwMWgD2jkOc4ZgveGyR/u9jSAs+51B7Y6PccPucDk7sEILt8hhgpC+
         3QqSDNpnUygvigHDV8l3qm2cizUolEN9lCHIcQpR5vrMTjpSI6OgYRK2NTtEdpMb3NRZ
         KsSaKWgaxpsiSCn7WX677/reAjv4EXT9Q4RkizfEBSpNGkcM5T5nDERltYG/0xnS3rKh
         h1irv8vrr6RQ6kgYDSxXNjxnouaFAC2vndfrzosWr41VqJowz5uMaA+c+Y4yypFB0Q7j
         0EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909942; x=1769514742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1M3E4UxKfMJ+dI/l+/VVbPQmnjuaMV2kWf95M7jFT9o=;
        b=h50y5kAImDUVdcuGK0XlEQG13tJaERo7hhLjlBT+yyOsVFqSiVPBGbhxf7DE7B2/DN
         9LETL5TBvdN2gQOC1SnRhJ/xDgzPAiABOiU+ii9SqBi+YZbgCiMvtyngf2e+WYGFfTbE
         1+6rfOq4xMKI65K0sj+A3dgWYHt9r40oSK7nhvk/e8ev/eDpSQipsioYNCF3RWlDgla8
         AEANx59eqLjHX3JWSCDvK6QRwQicg6x3WXwNL8vFJGj51rm06DJyTsAuztWZY8Azs2MA
         S770aRG9cCo3oPPEOhJ6LZ30RnPVSCy7fy78aJc3C+H5+Ld4brkhaCvELzZmwbzf06aP
         PSaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8sz3BiwbRTvkzv9PlnMWaLYAZO5xp8dc05C+OfB4WEKEXXgQzJS4Kg44Toyd+V4Rk7PsnfUcTiTq5XwO1yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH33LMU0GCDdY1lM7aFKeHb/5yjAVLoe+7CJQWN0Vntw+IRycE
	jj7nHdtM+8id/zE2kOT9WyM7KteFmnFxoewZBn8YgE8p5YchCf+WUUuZ
X-Gm-Gg: AZuq6aLelMneHynMtDtlVfKAM6jiZelza/3YkIT3Y4aeNnWQrKNNaTAfjeDlBbVfZyK
	JBZwKXjAhHY4YF4G2Yw9kx1Gz74hVD0NkIb5CJahR6sfDTUFRJ3DyDF6vqfVAEl9hc1urKGNgf7
	slvmJowdbQsj/+gnYVhiwbmLCrC39bHtZKQSBCbi+zgHDyWKYKqESm1Vr/lta8hG76ABOiQW4vg
	Los2HDR5w0l1YeIOiXXfesMqw56mGzNY134L+MKo6flulFGrPp1hHJPVMaqEgmtiz3K8hnhlUlc
	kB2PpDbuMWEIUG9kULJuNm0remaBqEDsoYcIQ31vQuSIeU1GXqekkgc6+dDiVxnPyeUEhnuEIjP
	OuaOJJdc4skQDXBkR/RpUuk4TF+vp6lUzPDnW0OQI+dt0CawYoq17h4sq6QkTcEr/A19Fjrp8v4
	SB04ax8xew+nqLffTKzv9nwuXxElTv0FkK69NXI0s4BRUJDTzeFHsZFS8ISL1oxdC8FjmkKAfQX
	piKvsSouxYPm0c=
X-Received: by 2002:a05:6214:da6:b0:88a:375b:ed7c with SMTP id 6a1803df08f44-89398273c7cmr206650326d6.35.1768909941648;
        Tue, 20 Jan 2026 03:52:21 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6214c5sm100416876d6.25.2026.01.20.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:52:21 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 45E7EF40068;
	Tue, 20 Jan 2026 06:52:20 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 20 Jan 2026 06:52:20 -0500
X-ME-Sender: <xms:dGxvaeqkIaxe-HgSJlZ-XdYMXejqbWoVC6UThHAb-Rvic93GdQubJA>
    <xme:dGxvaSa8gav2xX32Oy285vSFg7ByFOIkpt2RK0DzHdiMZ8fTzzLqNBx5e_FUfMpdi
    q34jZJ9pgSsoNGFH4kULx4XuYenM8xrxCzOzpnI7_mYQrejR5fx8w>
X-ME-Received: <xmr:dGxvaRSPUthtjWaovyWv9pjjrE3aB0mWKVLe1ItVXOUhdQ5PqESJVUhy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhgrshgrnhdquggvvhesghhoohhglhgvghhrohhuphhsrdgt
    ohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvg
    htvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghn
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmh
    drtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:dGxvaYfKNo8QDwLYM9CXeiISh2_oldLP9KNgBPMv_C14CM-1i-LTMw>
    <xmx:dGxvaYlvME6F5NCUZJYEaj9oEaPojavelmjuY8g2-7LJ489XKk0xQA>
    <xmx:dGxvaVhMjOriFRdNi62qvTsp8VlSSPfzz_4B3_23vklb-14ShEa8zg>
    <xmx:dGxvaREoz1sQ_A-5H57v0CBmy4qsl47VgFTj2JbsxHXyWG7Ei8Jxwg>
    <xmx:dGxvacx2qewmct1PBt13iNre5_XJTp0BvOBLUs-Wl3WS5g1zXfe541fl>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 06:52:19 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kasan-dev@googlegroups.com
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Marco Elver <elver@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers over raw pointers
Date: Tue, 20 Jan 2026 19:52:07 +0800
Message-ID: <20260120115207.55318-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120115207.55318-1-boqun.feng@gmail.com>
References: <20260120115207.55318-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to synchronize with C or external, atomic operations over raw
pointers, althought previously there is always an `Atomic::from_ptr()`
to provide a `&Atomic<T>`. However it's more convenient to have helpers
that directly perform atomic operations on raw pointers. Hence a few are
added, which are basically a `Atomic::from_ptr().op()` wrapper.

Note: for naming, since `atomic_xchg()` and `atomic_cmpxchg()` has a
conflict naming to 32bit C atomic xchg/cmpxchg, hence they are just
named as `xchg()` and `cmpxchg()`. For `atomic_load()` and
`atomic_store()`, their 32bit C counterparts are `atomic_read()` and
`atomic_set()`, so keep the `atomic_` prefix.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs           | 104 +++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs |  46 ++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index d49ee45c6eb7..6c46335bdb8c 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -611,3 +611,107 @@ pub fn cmpxchg<Ordering: ordering::Ordering>(
         }
     }
 }
+
+/// Atomic load over raw pointers.
+///
+/// This function provides a short-cut of `Atomic::from_ptr().load(..)`, and can be used to work
+/// with C side on synchronizations:
+///
+/// - `atomic_load(.., Relaxed)` maps to `READ_ONCE()` when using for inter-thread communication.
+/// - `atomic_load(.., Acquire)` maps to `smp_load_acquire()`.
+///
+/// # Safety
+///
+/// - `ptr` is a valid pointer to `T` and aligned to `align_of::<T>()`.
+/// - If there is a concurrent store from kernel (C or Rust), it has to be atomic.
+#[doc(alias("READ_ONCE", "smp_load_acquire"))]
+#[inline(always)]
+pub unsafe fn atomic_load<T: AtomicType, Ordering: ordering::AcquireOrRelaxed>(
+    ptr: *mut T,
+    o: Ordering,
+) -> T
+where
+    T::Repr: AtomicBasicOps,
+{
+    // SAFETY: Per the function safety requirement, `ptr` is valid and aligned to
+    // `align_of::<T>()`, and all concurrent stores from kernel are atomic, hence no data race per
+    // LKMM.
+    unsafe { Atomic::from_ptr(ptr) }.load(o)
+}
+
+/// Atomic store over raw pointers.
+///
+/// This function provides a short-cut of `Atomic::from_ptr().load(..)`, and can be used to work
+/// with C side on synchronizations:
+///
+/// - `atomic_store(.., Relaxed)` maps to `WRITE_ONCE()` when using for inter-thread communication.
+/// - `atomic_load(.., Release)` maps to `smp_store_release()`.
+///
+/// # Safety
+///
+/// - `ptr` is a valid pointer to `T` and aligned to `align_of::<T>()`.
+/// - If there is a concurrent access from kernel (C or Rust), it has to be atomic.
+#[doc(alias("WRITE_ONCE", "smp_store_release"))]
+#[inline(always)]
+pub unsafe fn atomic_store<T: AtomicType, Ordering: ordering::ReleaseOrRelaxed>(
+    ptr: *mut T,
+    v: T,
+    o: Ordering,
+) where
+    T::Repr: AtomicBasicOps,
+{
+    // SAFETY: Per the function safety requirement, `ptr` is valid and aligned to
+    // `align_of::<T>()`, and all concurrent accesses from kernel are atomic, hence no data race
+    // per LKMM.
+    unsafe { Atomic::from_ptr(ptr) }.store(v, o);
+}
+
+/// Atomic exchange over raw pointers.
+///
+/// This function provides a short-cut of `Atomic::from_ptr().xchg(..)`, and can be used to work
+/// with C side on synchronizations.
+///
+/// # Safety
+///
+/// - `ptr` is a valid pointer to `T` and aligned to `align_of::<T>()`.
+/// - If there is a concurrent access from kernel (C or Rust), it has to be atomic.
+#[inline(always)]
+pub unsafe fn xchg<T: AtomicType, Ordering: ordering::Ordering>(
+    ptr: *mut T,
+    new: T,
+    o: Ordering,
+) -> T
+where
+    T::Repr: AtomicExchangeOps,
+{
+    // SAFETY: Per the function safety requirement, `ptr` is valid and aligned to
+    // `align_of::<T>()`, and all concurrent accesses from kernel are atomic, hence no data race
+    // per LKMM.
+    unsafe { Atomic::from_ptr(ptr) }.xchg(new, o)
+}
+
+/// Atomic compare and exchange over raw pointers.
+///
+/// This function provides a short-cut of `Atomic::from_ptr().cmpxchg(..)`, and can be used to work
+/// with C side on synchronizations.
+///
+/// # Safety
+///
+/// - `ptr` is a valid pointer to `T` and aligned to `align_of::<T>()`.
+/// - If there is a concurrent access from kernel (C or Rust), it has to be atomic.
+#[doc(alias("try_cmpxchg"))]
+#[inline(always)]
+pub unsafe fn cmpxchg<T: AtomicType, Ordering: ordering::Ordering>(
+    ptr: *mut T,
+    old: T,
+    new: T,
+    o: Ordering,
+) -> Result<T, T>
+where
+    T::Repr: AtomicExchangeOps,
+{
+    // SAFETY: Per the function safety requirement, `ptr` is valid and aligned to
+    // `align_of::<T>()`, and all concurrent accesses from kernel are atomic, hence no data race
+    // per LKMM.
+    unsafe { Atomic::from_ptr(ptr) }.cmpxchg(old, new, o)
+}
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 5faa2fe2f4b6..11bc67ab70a3 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -235,6 +235,14 @@ fn atomic_basic_tests() {
 
             assert_eq!(v, x.load(Relaxed));
         });
+
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(v);
+            let ptr = x.as_ptr();
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(v, unsafe { atomic_load(ptr, Relaxed) });
+        });
     }
 
     #[test]
@@ -245,6 +253,17 @@ fn atomic_acquire_release_tests() {
             x.store(v, Release);
             assert_eq!(v, x.load(Acquire));
         });
+
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(0);
+            let ptr = x.as_ptr();
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            unsafe { atomic_store(ptr, v, Release) };
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(v, unsafe { atomic_load(ptr, Acquire) });
+        });
     }
 
     #[test]
@@ -258,6 +277,18 @@ fn atomic_xchg_tests() {
             assert_eq!(old, x.xchg(new, Full));
             assert_eq!(new, x.load(Relaxed));
         });
+
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(v);
+            let ptr = x.as_ptr();
+
+            let old = v;
+            let new = v + 1;
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(old, unsafe { xchg(ptr, new, Full) });
+            assert_eq!(new, x.load(Relaxed));
+        });
     }
 
     #[test]
@@ -273,6 +304,21 @@ fn atomic_cmpxchg_tests() {
             assert_eq!(Ok(old), x.cmpxchg(old, new, Relaxed));
             assert_eq!(new, x.load(Relaxed));
         });
+
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(v);
+            let ptr = x.as_ptr();
+
+            let old = v;
+            let new = v + 1;
+
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(Err(old), unsafe { cmpxchg(ptr, new, new, Full) });
+            assert_eq!(old, x.load(Relaxed));
+            // SAFETY: `ptr` is a valid pointer and no concurrent access.
+            assert_eq!(Ok(old), unsafe { cmpxchg(ptr, old, new, Relaxed) });
+            assert_eq!(new, x.load(Relaxed));
+        });
     }
 
     #[test]
-- 
2.51.0

