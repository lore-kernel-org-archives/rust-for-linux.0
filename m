Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686868;
	b=uvja/qOS/g60upQgI4pKJ1hknwlK74mdutPxme19lWLVxozEk7zEC53Hi5Ncu5W2XDkB
	 Vx6D9hd03D+U9PSMu/J074M1vy9fjONZaxBRI6Z/d0qaFsNYhUkvBRQ8rCwmZ/Ed9r9JR
	 CdccD4wlpa5BY5cE+e7cVceHGeU6UfeMtuUBr0pyLzu4gvps6HK1jTc4aunnN5c/7IFVp
	 gGgsYOYGJwFb8Bi04FvZ+oiEHqdNtXcES8H6ZPV/HJgfKt8T7Vi7XANJqU0mON04nuNAu
	 N2b8eGLanVyHfVgwSgalU8qDH9AmAiLLkNJS9wy+6IPisaW2nnp5gImy89LolNITXYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h59xmQEXNiVf2Fhkdj+7iJHbOtfNt9kdz0X5y1ytH2k=;
	b=17hs0aI23nEu/k8dsEPUF5IM22YWqYIBbBoNdBeeKwastX21blkUDOHf7dsnqUMYYgzz
	 uUJ0gK4WYOxbCgvk13eQR9aT8vppGAGvDasXi/BhlkjOIczgPYNVecSHdJSR53Fmed2HK
	 OfIQ/ZNh2kmqfhELbzt7+WC5+tb3zG2PKB7oatY+CfMn8xMkV+wDF182qj2jAQ+vSSGhL
	 WTukj63Sv5SAEtp3h6wpHK36IYzWUb3wdZHUOGX88gEPzG89FVB3ZFahvq5klG1m+vj/6
	 ebfFMgf+FIQj+g/rBzbguWB7VaTUFaQ+CQQibELllT0qCBqlu00fb9ZW960X/lKRX/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OSxw07/e";
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4EB606A338
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 20:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4EB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSxw07/e
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3acf82fdcdbso24607321fa.0
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 12:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686866; x=1795291666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h59xmQEXNiVf2Fhkdj+7iJHbOtfNt9kdz0X5y1ytH2k=;
        b=OSxw07/eDUL4JHk9FzdzhliztgepJPtw7phsB2GKNx5vQRtrJ5Jh3Fuf1XeoNeBzFt
         YPKNhcgkI9FHcWoS3+uHyEAYoej/MF1uk+dIcBrbx5EjeY3lZqYOd2oK1mI4eENvMahY
         rwKMXzhlvG4N3xy4DIVKwecpAPM2maLGQqr9/iJy8SBd8TKHwIg9XYTQWiTB84IxFXot
         wu00P/cdURr67I83L3HTPbpyqw3kAjFTubQfSHqDH/J886/zUBIzeg22XC6OtAeIJCAf
         gYYZWgAsUtdQXAT/ma5u7X0dyaDNbVfT1aeA4FyZ7f/DIefOVYUfYA14kUtHS1jKL0D1
         0eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686866; x=1795291666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h59xmQEXNiVf2Fhkdj+7iJHbOtfNt9kdz0X5y1ytH2k=;
        b=dCuyOh5tcZU+r82upqQbKJrvQauQZcMgaYB7R6RvEU/OldV07QPHOM69luaUyK7Vi4
         4T6RN9vNIv1o1hibL8UyQUxKs0CG2mo4Aja/EQLNle0abL7qXqBlnZkHMZpU7+IoPu3W
         DiogykTV1MYcR4TrhviNMatqViawh6Bo7mmOXklXZoI6zH+WvOOqALyCNqFyIb+jPAak
         GEqO+QVvOXzBAHWLLSCtWWLEtuKP8Z4tjawZuXPTVWzXbvj4zPUrRQFTrwMyctnpCqTq
         LN3rseSMkIKMmJDjyihRxs3GIvgc5YWIIniqCsVCeDkaT1G5CjcP4P6mGNFMr7M9jCq4
         Up8w==
X-Gm-Message-State: APuU4Z8yQ4gF8UipGz6fPj7SdGO5HQ733SDFOoVIZxH26VoJwzHsOAws
	s1elO50ekHm1OxW58ouMAA2bl9IGmNHVutdAANlsdZHVBNhC+5Ne8qX/otQeNISTLGI=
X-Gm-Gg: AYBFou1CLWKwvPZLkF3sP2BArxos2HNihBzA6w6in+4wNmuMgVtwljGE+HejnpDaTqV
	PxxtxctxQIAGSpUGjYJpqMIxw0vpiBk4ztm7L4/JIwo+LpTkZqmxaWccTQDilUCbmcaJboYCqGB
	YVFUv+JoFfJkiC+Dma3hHTnCXYZeNjz5JYXNlh+flobY3gRaQRPDmD95nzjSJ2yLaSUUCvzyPvg
	SUBvgEbN63Vv9OT21BVL/iujRDZrUhNBgZYkUIIhSTrjTfBHW7Vc+bvdNse6QEtiA7q8I63UCAu
	3qebuymNNbmdYxOQJkNQj2oZ5ArsNR0NTQnC6oSB6s0fEXbNfHJ3lzharxAYpf31JVVpyd6WRKB
	7C1QFJnVaJbH4i2wMWRLMsg41KVjw1hKdICg6v8BWIOu6V1/7CmmL0fYKn/cLKZiRh+7FIZgTDQ
	R5nM3LdqMw+YuJzoOI/OxO29torcg2RtjgfXRPOPrPlLV06iN0prtn4K/yZfTC0mvJnvgz+hh77
	Rh8kW+xaSdvvIDNjK3Gcf9SDsbUnpOuo+7Nwn3un8+7oQX/cJI2o/9quXOM2x4Qvb1ySjqs6clg
	VfHp8zVvgviK31Hva5lrC4QvHKQdF9r6eVUfvaQ=
X-Received: by 2002:a05:651c:2204:b0:3ad:f2f4:3fb8 with SMTP id 38308e7fff4ca-3ae2b4e899emr18932731fa.21.1794686866101;
        Sat, 14 Nov 2026 12:07:46 -0800 (PST)
Received: from IuseArchBTW ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712da125sm1891070e87.1.2026.11.14.12.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:07:45 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
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
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: gpu: buddy: store the allocator inside the Mutex
Date: Sat, 14 Nov 2026 22:07:01 +0200
Message-ID: <20261114200703.33229-3-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
References: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
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
 rust/kernel/gpu/buddy.rs | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/gpu/buddy.rs b/rust/kernel/gpu/buddy.rs
index d502ada6ebbd..3397eb584ead 100644
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
@@ -338,22 +333,20 @@ fn new(params: GpuBuddyParams) -> impl PinInit<Self, Error> {
         // `gpu_buddy_*` APIs. `try_pin_init!` only completes if all fields succeed,
         // so the invariant holds when construction finishes.
         try_pin_init!(Self {
-            inner <- Opaque::try_ffi_init(|ptr| {
-                // SAFETY: `ptr` points to valid uninitialized memory from the pin-init
-                // infrastructure. `gpu_buddy_init` will initialize the structure.
-                to_result(unsafe {
-                    bindings::gpu_buddy_init(ptr, size, chunk_size.as_usize() as u64)
-                })
-            }),
-            lock <- new_mutex!(()),
-            params,
+            lock <- new_mutex!(Opaque::try_ffi_init(|ptr| {
+            // SAFETY: `ptr` points to valid uninitialized memory from the pin-init
+            // infrastructure. `gpu_buddy_init` will initialize the structure.
+            to_result(unsafe {
+                bindings::gpu_buddy_init(ptr, size, chunk_size.as_usize() as u64)
+            })
+        })),
+         params,
         })
     }
 
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

