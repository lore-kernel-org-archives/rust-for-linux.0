Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B0023EAA0
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132718; cv=none; b=hBOLAKest0S/LcRLiGknbztQ6CKl++juaYnLvU/wx1xzEWhBSq8LGjuJyQQH51z/2DqiCRzFoi4yYMj4rralcQ6qNHnIxvoO/1l3s3zBrZlhLYQuCZ8fEfX9lo/0aOSLm/Tz0X+CQp1rgg8WEuYtxtjBg+hiqbAnVCFEQ17aFAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132718; c=relaxed/simple;
	bh=vYQWWDn3ZMU7ZhgJQIFMJBOWlbCCxJkWe+WqAR7ur6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5Ff6LV52qazg0nk8Z6SRnIuaIbbYPzmIgngGui8R6zB8CV6SOVhBBlDYvwrl3wqNXsPDx0LpADw6ARTHqUnds2aQ6UKsXFO5ry0XWDAtiyCz3W/TNvOe8LdrPOLa+zQxbJuNR4dB0Rihllfz9nM7k8pL15XXZLY0sm/nmWtOcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC9PkEit; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC9PkEit"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8bb6a27d407so543769485a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 03:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132709; x=1768737509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ai6kzfN6tjZuKrzAAXupramGsGRk1fhjTMyiwJSSmtI=;
        b=AC9PkEite8z/gBxsd3WGaZAb84X07bDU/RUog8T1244QdZH7QuyC+uzJQAyRXVlk05
         Uci6xK1m/dkCR41Bw4D7f3H5A8hVjsIZ2s+Lz4jZtQhAb9Q+pKzXZeUXczFS/hVXfPMF
         JmYMGJn+c+C2DpdNKII3b3uFBGaWdfj86VlpstDMFjkm2Nci/kRmg0IEJlPhirEkIZFn
         yoFveFFSUGNT9CmnshlkqhS0E9UVvXir+g2YQqEGHOPCTM+uXccl9p0oxh/SLC31ZmCW
         lLThiy47c4qFm36TUWX6pwylacX3rl4GOO19Njdq6SJqW6d9K6wBdgF/acYw/FAR6b4t
         E4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132709; x=1768737509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ai6kzfN6tjZuKrzAAXupramGsGRk1fhjTMyiwJSSmtI=;
        b=OWMfWY8CTeVNl9FsV+MjckR2JXKykXE5S+mBFR1UhBXe57sTShTMSAL9FohQQniCkI
         oxMM4EQaEZbEGmF+EN3DY5Bn5VVNIhXqQ8Vkq09ZHLuEONozJmYNNd8Xh8Zrck2tM3of
         7uK3xnXSZTEmBZ9zlJzNlzMd9H7rT25OSTqW9vjeLm6/TV4FvaegOJfV2GwQG973YLb5
         A0I0XALqlBiaHWhHkG7LtpwDxZm0e1mSqWP9NsygNqJX2YLlk4sn3R1Bf3H5obdL1YQq
         qffrre2mKAhs+eWjNKGNxIfBTHtL3RoF8pr5rz68A9tm4Mz9/yP1rvj3+OLufns+vQou
         ggmg==
X-Gm-Message-State: AOJu0YxONhz355AcdGnMa1GyZdMsSBpHjJLyVnGCqmfVq7T0E/AFlZ4M
	6owwgo3Ta6wK3+X3Q5OYf9bT76+GgrN6kH1/nSMjfgC1hXXXD1O1ujAV
X-Gm-Gg: AY/fxX6neIiZEtq8QK7rtFnlH2JmgOA+ABppLzoKfsEIQfNiAC4TO+ZxN39qc0lkgNN
	Uwo5f85ix5T2OZq/3CyBUCO0sNXb4fNhp7Rkzai6XXJvlk/RlWSafA5y+FRE46DM3UXhn/MGpLM
	g1NmEr3NvS7hxmH7zecAZ60NAtTmfIMjZQrfQNxSJTunK3u2ILs7jTcfEGTCLEgAiIcTeX85/bb
	3KoRqldSoFDwImM0O8t3gV4zLpEvrjT2fOP/gUef/om7fyJ7c625uujy1cTyTAVN1o/ivJXSqmp
	vuQ5zCXUz9oX51jvYaf4MfdayF84K5bdPWI3oIE5s5ov7x6Tmvdf0rOeSW8kYP2JWemi8gSUf3C
	2bIYxO1mWfVhIWBoqQNcFKs/gVH3HzRqaAHLV8isKmNFK2lTURSnZTITtmatxrHBITH0GjvPW2I
	igSdQ/JT1k4k99CHlIJaw7Uy+rAroqFthGVr+cXj1fLAaa6tXHT9rhGTuyROwpQOEfLhbwR8kai
	++S0+Q5XRbg9OhwsCrKLQoCMw==
X-Google-Smtp-Source: AGHT+IG3o0MsFaV703ugnLdBB/Lo8Ct7pECA2g3uzwf4YmMMcxBQsZcjjJ07zeF4DOTkUeievjG2qw==
X-Received: by 2002:a05:620a:25ce:b0:8bb:a675:b545 with SMTP id af79cd13be357-8c3893f8712mr2151103585a.63.1768132709248;
        Sun, 11 Jan 2026 03:58:29 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1270837785a.5.2026.01.11.03.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 03:58:28 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5537FF40068;
	Sun, 11 Jan 2026 06:58:28 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 11 Jan 2026 06:58:28 -0500
X-ME-Sender: <xms:ZJBjaQ1pQnlsz_9EVcBViWN5reJiSqWYPWbgnOWJqEWPnjjkz43fKg>
    <xme:ZJBjaW4IaxZr8rFDaQy8qMtPDFGcJQwUzI5I0sm0LIyLU2o5Ls-bek_tMWMcm6m-A
    -Qa4vw1LVueinuGisYF7rLx213YB84bup65NRBiyG0OzUHUfTHD7A>
X-ME-Received: <xmr:ZJBjafWO9PkMDHLRVUp_ge5M5aTMqpMIwgFQ6tBVtpc3P6EQf0WUieLF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudegheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvteethfeugeejjeeuvdfhgfekleeujefhkeeuieekgeeufeetffeflefgfffg
    feenucffohhmrghinhepmhhsghhiugdrlhhinhhkpdhinhhfohhrmhgrthhiohhnrdhsrg
    hfvghthienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtd
    eigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehf
    ihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlh
    hinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgt
    ohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoh
    epohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihg
    uhhordhnvght
X-ME-Proxy: <xmx:ZJBjaWgBmPl3jmRHJ1va_VnjEkLnSafPSkK2xbOB-HXor1c54xITvA>
    <xmx:ZJBjaXd8hoa2rukgxHZ0HKQJr_vxdza349ffIVSakhXrWfE_YeEZIg>
    <xmx:ZJBjad1YrWuoeWS8toPME6sZiL-ItVJyop2a6wLjfsFH6_3LcCiRZA>
    <xmx:ZJBjaboz835HLNS2K3tx4KaHi4xR6G-e0LGLMgbl9A0nL0DmcxJ4wg>
    <xmx:ZJBjadgsKaTVk2Gcb2_bAYvy9h2QwBEn59d8GeAfgRcgTJfrENLKAgVo>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 06:58:27 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 02/36] rust: sync: Clean up LockClassKey and its docs
Date: Sun, 11 Jan 2026 19:57:34 +0800
Message-ID: <20260111115808.5702-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111115808.5702-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

Several aspects of the code and documentation for this type is
incomplete. Also several things are hidden from the docs. Thus, clean it
up and make it easier to read the rendered html docs.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20250811-lock-class-key-cleanup-v3-2-b12967ee1ca2@google.com
---
 rust/kernel/sync.rs | 54 +++++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 1dfbee8e9d00..b10e576221ff 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -32,7 +32,9 @@
 pub use refcount::Refcount;
 pub use set_once::SetOnce;
 
-/// Represents a lockdep class. It's a wrapper around C's `lock_class_key`.
+/// Represents a lockdep class.
+///
+/// Wraps the kernel's `struct lock_class_key`.
 #[repr(transparent)]
 #[pin_data(PinnedDrop)]
 pub struct LockClassKey {
@@ -40,6 +42,10 @@ pub struct LockClassKey {
     inner: Opaque<bindings::lock_class_key>,
 }
 
+// SAFETY: Unregistering a lock class key from a different thread than where it was registered is
+// allowed.
+unsafe impl Send for LockClassKey {}
+
 // SAFETY: `bindings::lock_class_key` is designed to be used concurrently from multiple threads and
 // provides its own synchronization.
 unsafe impl Sync for LockClassKey {}
@@ -47,28 +53,31 @@ unsafe impl Sync for LockClassKey {}
 impl LockClassKey {
     /// Initializes a statically allocated lock class key.
     ///
-    /// This is usually used indirectly through the [`static_lock_class!`] macro.
+    /// This is usually used indirectly through the [`static_lock_class!`] macro. See its
+    /// documentation for more information.
     ///
     /// # Safety
     ///
     /// * Before using the returned value, it must be pinned in a static memory location.
     /// * The destructor must never run on the returned `LockClassKey`.
-    #[doc(hidden)]
     pub const unsafe fn new_static() -> Self {
         LockClassKey {
             inner: Opaque::uninit(),
         }
     }
 
-    /// Initializes a dynamically allocated lock class key. In the common case of using a
-    /// statically allocated lock class key, the static_lock_class! macro should be used instead.
+    /// Initializes a dynamically allocated lock class key.
+    ///
+    /// In the common case of using a statically allocated lock class key, the
+    /// [`static_lock_class!`] macro should be used instead.
     ///
     /// # Examples
+    ///
     /// ```
-    /// # use kernel::alloc::KBox;
-    /// # use kernel::types::ForeignOwnable;
-    /// # use kernel::sync::{LockClassKey, SpinLock};
-    /// # use pin_init::stack_pin_init;
+    /// use kernel::alloc::KBox;
+    /// use kernel::types::ForeignOwnable;
+    /// use kernel::sync::{LockClassKey, SpinLock};
+    /// use pin_init::stack_pin_init;
     ///
     /// let key = KBox::pin_init(LockClassKey::new_dynamic(), GFP_KERNEL)?;
     /// let key_ptr = key.into_foreign();
@@ -86,7 +95,6 @@ impl LockClassKey {
     /// // SAFETY: We dropped `num`, the only use of the key, so the result of the previous
     /// // `borrow` has also been dropped. Thus, it's safe to use from_foreign.
     /// unsafe { drop(<Pin<KBox<LockClassKey>> as ForeignOwnable>::from_foreign(key_ptr)) };
-    ///
     /// # Ok::<(), Error>(())
     /// ```
     pub fn new_dynamic() -> impl PinInit<Self> {
@@ -96,7 +104,10 @@ pub fn new_dynamic() -> impl PinInit<Self> {
         })
     }
 
-    pub(crate) fn as_ptr(&self) -> *mut bindings::lock_class_key {
+    /// Returns a raw pointer to the inner C struct.
+    ///
+    /// It is up to the caller to use the raw pointer correctly.
+    pub fn as_ptr(&self) -> *mut bindings::lock_class_key {
         self.inner.get()
     }
 }
@@ -104,14 +115,28 @@ pub(crate) fn as_ptr(&self) -> *mut bindings::lock_class_key {
 #[pinned_drop]
 impl PinnedDrop for LockClassKey {
     fn drop(self: Pin<&mut Self>) {
-        // SAFETY: self.as_ptr was registered with lockdep and self is pinned, so the address
-        // hasn't changed. Thus, it's safe to pass to unregister.
+        // SAFETY: `self.as_ptr()` was registered with lockdep and `self` is pinned, so the address
+        // hasn't changed. Thus, it's safe to pass it to unregister.
         unsafe { bindings::lockdep_unregister_key(self.as_ptr()) }
     }
 }
 
 /// Defines a new static lock class and returns a pointer to it.
-#[doc(hidden)]
+///
+/// # Examples
+///
+/// ```
+/// use kernel::c_str;
+/// use kernel::sync::{static_lock_class, Arc, SpinLock};
+///
+/// fn new_locked_int() -> Result<Arc<SpinLock<u32>>> {
+///     Arc::pin_init(SpinLock::new(
+///         42,
+///         c_str!("new_locked_int"),
+///         static_lock_class!(),
+///     ), GFP_KERNEL)
+/// }
+/// ```
 #[macro_export]
 macro_rules! static_lock_class {
     () => {{
@@ -122,6 +147,7 @@ macro_rules! static_lock_class {
         $crate::prelude::Pin::static_ref(&CLASS)
     }};
 }
+pub use static_lock_class;
 
 /// Returns the given string, if one is provided, otherwise generates one based on the source code
 /// location.
-- 
2.51.0

