Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087141;
	b=WbSNvj+BpUwnpJg5IWauPzaAx5mn+lvzfYlxFae6Wy7587eXdg3KTpsZ/WymKOtJ6ezI
	 MsajFOlChZFxkoQJuggHbSElBI9xGFMaqaDVBB/HrSG4qwqv7YanGXooDLxXC7C4sVtT9
	 QPXUcSl5BWJU0X/PsnEQwE2qeDyfh/O7fJeh4+RmJaOIRWQSvUUKX7p5NUZi3pb27AYKj
	 Ahgl1B2HyrDX7mfD/8Jn0riNZZ6GccTfqbch5zO4PFH03RHWryn3Y7ik9YyWJN6zRwyoL
	 /2DAVT44y884iFCA3divzycAd0WAe3bDpW9EWymK1ULteIiaOoaPPobO0urWV+DO5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Zgs6SyHjUqs1Qm+T+oyA24Ly2fWRmc8rFy/5dpxwQdQ=;
	b=jF/v9nCUyWE9bMsV9zUr5agytwdY5ilS8Cmyhx3Ms2K6v1xJtPKvBFOTsmiDlqFWzhP6
	 IAOp4FJGapLI2xAu3WfnUgnqyZMH/hwHUy2/0Ra2qq+3Vv2GSKu1z8w4NWhNFt0TA55lQ
	 zfsEUiXaxo+90ZuJKqT6yrWnPA/gB3Hh9E5O8szLiACWMIie2iKpvDLQSSufrk/69F7+J
	 wFygeg/4HOqaKxfxPJrQiGKLBm0++KzvP4SyeJjK9bxPWNg3sng0gJhdmM9wnP4sG4Mir
	 IH80hcex3UvarIE3Okf+U7RXqHPlsI5sRyGskVikUs4wF3AuJFx++PL+tyBFwDE40cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cAsiU3NU;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959D8606A32F
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 11:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959D8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cAsiU3NU
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so7835421fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795087139; x=1795691939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zgs6SyHjUqs1Qm+T+oyA24Ly2fWRmc8rFy/5dpxwQdQ=;
        b=cAsiU3NUDcdFtfRRhn3m4kAQgqy+uOA+R3KgiSB5ET3rF3pzJZh+Qwm9rTsaI7jGqT
         Fg5uP/9ZPKULD9IdEbr1nLv8hSUehXQLSRJ5BYNkzH9GLvGKVXem7cdhKJqyE4WG3V2e
         IMs8fHKJY0OuqbnydLaI9RmEobD24ERbHjBi1A23aR1jcfnhBQVUx4bv3tGLyEiaNil4
         BnTCcor2dfVDcVcY46QZeG28RIsrrC56zitfDfKSp7d4ogv40KL03GTg8ZtHtbmgmqFF
         URrpl01aMXXWplJN+lBHnezjK44yNfnGoU/Y79ErX2mvQyAXXl8YsOJN/SZNWi78jaFT
         G+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087139; x=1795691939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zgs6SyHjUqs1Qm+T+oyA24Ly2fWRmc8rFy/5dpxwQdQ=;
        b=Sk8U5WqmJx3+WMjZ5ifbSqr41JxuUY37d0T4engFHCNpstOvmtxu4T2SnAgaH/g7+Y
         xYpqqCz/ZgJh5t9Hp7dwLT4+IQIq8xnoC6Slz4VQwmnOaJk74IsL3PJ3GYCYE/pPhXBa
         hiJcvHuMlnoBF72Vd5TOKviEO2OLmlEFKSBsAC/hrSmOwQC+RBssrGMAZ33NfhBz2hQN
         EbjtHXmulK600wjqRyw6IFqrtO18Gr9LJv1VRtZnhp9MwtPIY663chstINct5j+ZQh78
         aUZrCbeX49KlcoV56ntiz1QTaTZKpSFdfMDZAkeY5mTmfm3DZm3PiuEwtwAtNnLqyL5g
         11eg==
X-Gm-Message-State: APuU4Z/x7TFv4TWPog5OSBMu3FeHzTsBzpIwKlIhzEXr0QE53b5TmZDH
	QHmWVx3G/g8XD3S/H7GvxZZxAtygfaXr/Ksq/hTELV8xb7vt4lQ266zAkC4uCnWz1pUr4Q==
X-Gm-Gg: AYBFou0KKBI2McBoN6MpWVpM2eo3dI9Y4+NG943PBzibBu92RWo9qhEAgZEM35mosnn
	r5s1fdJnvYcGAP+/MStUMDze99QqcmsZNAtuuH3NSt5BTzQdKRj9Gk6IjNV3xrBZ4IWoyl6lxm6
	PFB+iiRF0l4NxmK2I29lUF/zjm3kgkajJSasLb+ceUeBQzgs8XB8Tc/DvrxrEZfKUb8Y0a56uue
	E9plKYA6y3PMKlrLm3d1VRdmhQ0i3fn1NSdbdQ7fEFIUqsUMhXMGn/EIE/TPRRAlFpY44QAYEbN
	PvFIgTyVRHuDTCXc2l8gQyi5Bq0A1ykrrAaVgS/GWb9a+Hlp1jyGXQioGZ7hFs595PaNV6m4tb5
	DB1+K/v94b3jPF60SLoqB7y4uvpVsxePTJGTYP6yIVRR0AAdpZ43XT25zVNrpvePzwXFXRilLM1
	J056KLtoEGoYnFU73eP8WgqQo49mrJQT+iqkkCG9947nlvPczdmmhyQciiJfCUn8QPXrnTJEtz4
	gtLQYJxW6P921qtlXIqbqkqyWGtZ6/R0ffRZSuoFwqvVpu6rTzYJKLrPQr+ryxekEKFAOU32Ba2
	RIbbfEvyEzl4IgMus4NpsoUUx9ztD/F6iZgZ
X-Received: by 2002:a05:6512:2354:b0:5c1:56e4:c705 with SMTP id 2adb3069b0e04-5c1b79fd08amr335267e87.3.1795087138391;
        Thu, 19 Nov 2026 03:18:58 -0800 (PST)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa8b3c86sm1376278e87.83.2026.11.19.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:18:57 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Joel Fernandes <jfern@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] rust: gpu: buddy: store the allocator inside the Mutex
Date: Thu, 19 Nov 2026 13:18:50 +0200
Message-ID: <20261119111850.33270-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GpuBuddyInner keeps the C gpu_buddy structure next to a separate
Mutex<()>, so nothing in the type system ties the data to the lock.
A TODO asked to replace Mutex<()> with Mutex<Opaque<..>> once
Mutex::new() accepts a fallible initializer.

That is now possible, so put the Opaque<gpu_buddy> directly inside the
Mutex. The allocator can then only be reached through the lock guard,
which lets the compiler enforce that the lock is held. This also
removes the now unneeded `inner` field from GpuBuddyGuard.

Update the safety comments that referred to the removed `inner` field.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
Changes in v2:
  - Dropped patch 1/2 ("rust: sync: lock: allow fallible initializers
    in Lock::new"): the same change is already in linux-next
    (Philipp Stanner's "rust: sync: Accept errors for Lock payload
    data"), as Gary pointed out. This patch now depends on it.
  - Rebased on next-20261118.
  - Fixed the indentation of the new_mutex!() initializer.
  - Build-tested on x86_64 (defconfig with CONFIG_RUST=y,
    CONFIG_GPU_BUDDY=y and CONFIG_NOVA_CORE=y). Not
    tested at runtime.

v1: https://lore.kernel.org/rust-for-linux/20261114200703.33229-1-mbkchelofficialdev@gmail.com/

 rust/kernel/gpu/buddy.rs | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/gpu/buddy.rs b/rust/kernel/gpu/buddy.rs
index 691bb4062..a85530895 100644
--- a/rust/kernel/gpu/buddy.rs
+++ b/rust/kernel/gpu/buddy.rs
@@ -313,16 +313,11 @@ pub struct GpuBuddyParams {
 ///
 /// # Invariants
 ///
-/// The inner [`Opaque`] contains an initialized buddy allocator.
+/// The `lock` field contains an initialized buddy allocator wrapped in `Opaque`.
 #[pin_data(PinnedDrop)]
 struct GpuBuddyInner {
     #[pin]
-    inner: Opaque<bindings::gpu_buddy>,
-
-    // TODO: Replace `Mutex<()>` with `Mutex<Opaque<..>>` once `Mutex::new()`
-    // accepts `impl PinInit<T>`.
-    #[pin]
-    lock: Mutex<()>,
+    lock: Mutex<Opaque<bindings::gpu_buddy>>,
     /// Cached creation parameters (do not change after init).
     params: GpuBuddyParams,
 }
@@ -338,14 +333,13 @@ fn new(params: GpuBuddyParams) -> impl PinInit<Self, Error> {
         // `gpu_buddy_*` APIs. `try_pin_init!` only completes if all fields succeed,
         // so the invariant holds when construction finishes.
         try_pin_init!(Self {
-            inner <- Opaque::try_ffi_init(|ptr| {
+            lock <- new_mutex!(Opaque::try_ffi_init(|ptr| {
                 // SAFETY: `ptr` points to valid uninitialized memory from the pin-init
                 // infrastructure. `gpu_buddy_init` will initialize the structure.
                 to_result(unsafe {
                     bindings::gpu_buddy_init(ptr, size, chunk_size.as_usize() as u64)
                 })
-            }),
-            lock <- new_mutex!(()),
+            })),
             params,
         })
     }
@@ -353,7 +347,6 @@ fn new(params: GpuBuddyParams) -> impl PinInit<Self, Error> {
     /// Lock the mutex and return a guard for accessing the allocator.
     fn lock(&self) -> GpuBuddyGuard<'_> {
         GpuBuddyGuard {
-            inner: self,
             _guard: self.lock.lock(),
         }
     }
@@ -364,7 +357,7 @@ impl PinnedDrop for GpuBuddyInner {
     fn drop(self: Pin<&mut Self>) {
         let guard = self.lock();
 
-        // SAFETY: Per the type invariant, `inner` contains an initialized
+        // SAFETY: Per the type invariant, `lock` contains an initialized
         // allocator. `guard` provides exclusive access.
         unsafe { bindings::gpu_buddy_fini(guard.as_raw()) };
     }
@@ -381,14 +374,13 @@ unsafe impl Sync for GpuBuddyInner {}
 ///
 /// The `_guard` holds the lock for the duration of this guard's lifetime.
 struct GpuBuddyGuard<'a> {
-    inner: &'a GpuBuddyInner,
-    _guard: MutexGuard<'a, ()>,
+    _guard: MutexGuard<'a, Opaque<bindings::gpu_buddy>>,
 }
 
 impl GpuBuddyGuard<'_> {
     /// Get a raw pointer to the underlying C `gpu_buddy` structure.
     fn as_raw(&self) -> *mut bindings::gpu_buddy {
-        self.inner.inner.get()
+        self._guard.get()
     }
 }
 
@@ -428,7 +420,7 @@ pub fn size(&self) -> u64 {
     pub fn avail(&self) -> u64 {
         let guard = self.0.lock();
 
-        // SAFETY: Per the type invariant, `inner` contains an initialized allocator.
+        // SAFETY: Per the type invariant, `lock` contains an initialized allocator.
         // `guard` provides exclusive access.
         unsafe { (*guard.as_raw()).avail }
     }
@@ -463,7 +455,7 @@ pub fn alloc_blocks(
                 // Lock while allocating to serialize with concurrent frees.
                 let guard = buddy.lock();
 
-                // SAFETY: Per the type invariant, `inner` contains an initialized
+                // SAFETY: Per the type invariant, `lock` contains an initialized
                 // allocator. `guard` provides exclusive access.
                 to_result(unsafe {
                     bindings::gpu_buddy_alloc_blocks(
-- 
2.56.1

