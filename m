Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795332021;
	b=bR/VmuHvP0KJwG8QcbqWhCmRML+hQwBOIy1TLa0u8uNIoMRGSszxFZwAuMODC9GI1Y3c
	 pyjWUhPuQ7fe86PkT9cwMJhWo3JILNW5Drpp3uAjudZU8Z4QgyeZ/sgVvwnt7yrhDWz1v
	 FxxzwsZbJefI6oiI1OYRSsebE3WtiMvdsxzCWB5n0pQ8sU8EjEHtd0tTDXjqqZI5rTkyk
	 c9KuyP+WlhL/CH8VWYs6Jxcn0oRXY2+rhf1WIEZI8DNdkWcgt2uf2uM0zyj78bNSb3Uo2
	 SDM9q9ahfCVGtPtEgpXfuqNsDxhFYhbJknjkmZELR92lp06lYHxgmKtX3kMDnLaeIaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=o8re6EZDSI55b5voUbfOtCkCAeZWYZ3ND/N+XRqjIEk=;
	b=lHV9ig77LXrHYPupM1nUPd9L8kTntuu07YE/uM383aE+WX4gEK7VlG78ZDlWMdcd/OOr
	 Ks+YS3eLmZXpUwzPkBP8T9lVguWdMPnOVDS2c30mtqAq7vF95mcBDrWk3qAbkH+XfaqnM
	 RGm6hoeuw8tK83GeDYjdXSwHtmHrVYiW02XyFhnxtqIwxDXythmdO9Nw2RFn6gHOuth2G
	 sq5plQp6zyodII4LkpPgBlLDBAZ8Z6gU8AEWZHE4doCd4d6xzN+vbieHCUxIAv0WvAskS
	 tRhoC6UQy5Ev54f6R+chJ+8AAal227KWtWnwT9dahRFuXoZfu4spF1hCgG0GcNwDNMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cH97aJVW;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8EF606A320
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 07:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B8EF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cH97aJVW
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso21694271fa.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 23:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795332018; x=1795936818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8re6EZDSI55b5voUbfOtCkCAeZWYZ3ND/N+XRqjIEk=;
        b=cH97aJVWovm41WlI45cwQsdm55JlT3VpwAynwiHVFVp+Y/nPDgX4dM/o5c99ucCxqM
         iNB6SD8eVvxZrNLfVN3plWQr2Tm+RDLymEYdBe8lYy9uh+t4rRDW1iuwexJpAx9911l9
         CI7grKfelZdpT7IaMIflkMEiPzD8b2QlnHvb65jBnMdFn7evMypnRwzxiwQFsK1B9dS4
         2rGq+KXE/vji0bxBewfzrw+mBzVTyKTR+Lwl0o32QBNo3MIXp9ZH97eC6yVa4eJJ0Z6M
         950QQqqLxsMkfer2kHc5v509PW1Q8D4smrShxkVLZcNsHiWWbUZjfywZqbV+5c4Y+/dc
         X+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795332018; x=1795936818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8re6EZDSI55b5voUbfOtCkCAeZWYZ3ND/N+XRqjIEk=;
        b=KpTxbWaWGzp6oiektq8idAlVxbEvySQ4is8srStOfIGI7lDPQGmF2X1NHsN7wzoqgy
         NziYo/PoNNf4MDoHMtLNjy5TeiSYqa6U8vIJsARcjVMdv74w5hKy7sIGyeId7kRjSgfu
         bZQZ5J1SXR5Gm0uCUQOLuU+x8SukmGPiVithCbF/Pt9uZ23tHkF3U45aotAEaOPar3Xj
         3IUhEeBjDwhBaLg2AtgRNsKhAH8obrxLvF5QiIQCKFCIxIWQ3fGKH2U2hd8ENvD0CxT6
         vqzOzEYqVdJ7sdMZzW2Ik0cyziiHL36mpv0YECXvzeK0pBSY4FHkjoj3me5iStmrkfQa
         H68A==
X-Gm-Message-State: APuU4Z/lXqxa5c6+88tS2xO/KX8rKThU0M3zqBkyWjiLRwneTU87DHwN
	yJ/4aaKAz9xN27kBdf28/WakXt7XF8brOhDL6zdCJTtNdrrrQUi2Vfx/iPbSoQU8TGL+nA==
X-Gm-Gg: AZFdTZeK2IGegeDs6YpOJMGsO7SjcBPFwvtoKvnWiJYEYMXtbniMiJrv3BUauHgPKzS
	fLZD7jpvJF8oupkprEOL/D3jYT/HqTdoJ4cgD45ubcg7Sof/SLKIZaj8811hh6h9WPt3raoO/hb
	KpF5sWsppiGYz6ugtkZMs7VN5vWga4R0SPfeQzmRNdu1ZR2xnwa3dDIOlCV4pcWOFj3sJ4G2N9G
	07nGwfLrWvdN3GTeEtljvYPmYijQWOMztSytVtFNuPUHOKxTLx8/DRaXF+/EIvIC5j/JaqK6NcZ
	4bPLjPe1KhUkhqw/5EzFgOVXGtuh80wBDCP4y5dYHNONzZDI1IcjFD4ywlg/HaF43WoBR/wT1B+
	VcAiQumwLZ6hSGk4okYsXHDHv2daCyBXz5fH8LQIK336OY2HgrX4nZ2t//oV/oHXgbiZY+EafkU
	UlHJcY7yk4ejGsIOfYhpR72TkVYBDoJoKUnrsFgkJTV5rS6aivtpPnK2QU/d1c4x4LXekxoCa9l
	7/ccH2Zrtvr1fLbAJ66FwSix2q78n+pnkzeDhca0DZzbyeaH6K4LaH5sy+wWagwH4WR4B/Tzjsu
	GGTzK9Uqc364iks/kvqRdwIjgMKmQArxE7eHs/FouFfX/+sj2l09rv7P4w==
X-Received: by 2002:a05:651c:b28:b0:39c:624d:82b9 with SMTP id 38308e7fff4ca-3ae7f9a073amr23677191fa.4.1795332017916;
        Sat, 21 Nov 2026 23:20:17 -0800 (PST)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee2bfsm21914051fa.9.2026.11.21.23.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:20:17 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Joel Fernandes <jfern@kernel.org>,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
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
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] rust: gpu: buddy: store the allocator inside the Mutex
Date: Sun, 22 Nov 2026 09:20:07 +0200
Message-ID: <20261122072007.14685-1-mbkchelofficialdev@gmail.com>
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

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Reviewed-by: Joel Fernandes <jfern@kernel.org>
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

Changes in v3:
  - Kept the name `inner` for the mutex field instead of renaming it
    to `lock`. (Danilo)
  - The SAFETY comment updates from v2 are gone, as the field keeps its
    original name.
  - Collected Reviewed-by from Joel.

v1: https://lore.kernel.org/rust-for-linux/20261114200703.33229-1-mbkchelofficialdev@gmail.com/
v2: https://lore.kernel.org/rust-for-linux/20261119111850.33270-1-mbkchelofficialdev@gmail.com/

 rust/kernel/gpu/buddy.rs | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/gpu/buddy.rs b/rust/kernel/gpu/buddy.rs
index 691bb4062..4e08ec319 100644
--- a/rust/kernel/gpu/buddy.rs
+++ b/rust/kernel/gpu/buddy.rs
@@ -313,16 +313,11 @@ pub struct GpuBuddyParams {
 ///
 /// # Invariants
 ///
-/// The inner [`Opaque`] contains an initialized buddy allocator.
+/// The `inner` field contains an initialized buddy allocator wrapped in `Opaque`.
 #[pin_data(PinnedDrop)]
 struct GpuBuddyInner {
     #[pin]
-    inner: Opaque<bindings::gpu_buddy>,
-
-    // TODO: Replace `Mutex<()>` with `Mutex<Opaque<..>>` once `Mutex::new()`
-    // accepts `impl PinInit<T>`.
-    #[pin]
-    lock: Mutex<()>,
+    inner: Mutex<Opaque<bindings::gpu_buddy>>,
     /// Cached creation parameters (do not change after init).
     params: GpuBuddyParams,
 }
@@ -338,14 +333,13 @@ fn new(params: GpuBuddyParams) -> impl PinInit<Self, Error> {
         // `gpu_buddy_*` APIs. `try_pin_init!` only completes if all fields succeed,
         // so the invariant holds when construction finishes.
         try_pin_init!(Self {
-            inner <- Opaque::try_ffi_init(|ptr| {
+            inner <- new_mutex!(Opaque::try_ffi_init(|ptr| {
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
@@ -353,8 +347,7 @@ fn new(params: GpuBuddyParams) -> impl PinInit<Self, Error> {
     /// Lock the mutex and return a guard for accessing the allocator.
     fn lock(&self) -> GpuBuddyGuard<'_> {
         GpuBuddyGuard {
-            inner: self,
-            _guard: self.lock.lock(),
+            _guard: self.inner.lock(),
         }
     }
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
 
-- 
2.56.1

