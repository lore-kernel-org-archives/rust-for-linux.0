Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5BA30676C
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047727; cv=none; b=iATEC3G2u1dfFw274o2jDu/Ce7HxGFAdU0MhD1fNoxaRvM2f1GXCMF2dnSyyznJr9QAtuR+ymMVPWaz5O/Gy33APJBpPThc8tOuOQzlTKkhJy1kgRlk/AtWC56EBFctdTTwpq96MyveQhMsBbq1YWnsrpouIe1bYnTsrnISZVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047727; c=relaxed/simple;
	bh=kaMRhV66jMxQvqjeQ7Ar6Cr8aJCEeWtJrustTtJxVZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tUBPSp0FfcMpHHVDJFPxEIbA3KqtGknr64ESZoZEfWIXy7wG5qhPaQq8H9cikQfAYPGJfyW3eE5JZxs32Zd9/yzGgy17BP+GTmJO3XJEUzgC4suMU1VE4ySUWo8MfWEzGlhkffhSQOaL+qPhK20698m3YfY9zdBELR0gLK9Tz28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=S66R4TAc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="S66R4TAc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-476d8e647e9so91414f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047724; x=1783652524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=031sIZWe4JTCBupEXr5DXAC9PJaWSnyeiEEKJDEA+7w=;
        b=S66R4TAcwlWQDggJCgyL/uL76w8ZbflNo0DH9z/OI80kTnixJn7tGrLJobYBcSHt9T
         2rqBFSiBZZgof8jb1/y8UJvc42S/w70QCIevvJp4QCS80FCBkP3FdC1qiUAyLf/PxSTz
         qDQ4m2hAZEcp06PPlQMQzM1Ml7n/bLQLCvo3L3F4/lJfS4Xjt/7E+yyMQmqLmLtM4wz7
         PdE3kifL0v2ZepqF/B+Le5SnFlQMNCxK0JT0z3XBMBmJRoYUUhV42OPGIcRPIxVoYBoT
         keHMIlrnB1907zYRYX6JN5D33yQg/T+EPLFMhrAN1bjlUWzqGTFcJmEhmQmtlzqpb7XL
         WdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047724; x=1783652524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=031sIZWe4JTCBupEXr5DXAC9PJaWSnyeiEEKJDEA+7w=;
        b=WULIA6rO7LJavYtkycEpce++zkcpTzvUy7R32j8dy9MSONQRBzUs/tn4qXqMEoJpGo
         N7dnbFxZ2S68kfI+9k0Pf2vnz5qHoyS9tHqf6QoIQiUau7nj2xgMYDzSMKqB5FFgK+Xf
         kNDQ1xOyZjK5huoFJ5hT+kZQAUXZ9pzVouANYCY+NKRmS1Fv+PKIl6JD1l73brCkAIUw
         VPCfMWmQA77FY8ZNirAlgKVw6ARMNfHtRoYMxEmQEGt0ZY2Wqv8i2gPCUcAQ26Cx45TY
         FU77D/wNPhFStU5qsBo+AtcRYGIEIxmAURX1/Bbixc3AlNsLIFcKw+ApZqk6WM7N0eta
         iKbQ==
X-Gm-Message-State: AOJu0YzIPn0PrhDyLfCkHEZnyiDsr0r38hiTI/a5n0jgn9gppnFbOnhb
	BtDyjVsT6etAaaInO0NoaOwbz3j/nKDXjcKpkVkZP8galbiTyjnX5M927L8kF8f9G2OJxG/8z+t
	rl1EJKn5W
X-Gm-Gg: AfdE7ckjyxLLf6xSLWM3XcK8TbmP52adkjInyI/HCavkgog6m4EHJGDwUbKGy2YStzt
	VtiqoXq3L1jpmiUkNSro9b404PuQ6QGwutebTMRO3LXNMnjHfjH7O786TgS3pNjBpTRfpSQSil7
	yCvEW5LF9yMBAmsWvH2bHY3TmhPph5TmECu6CO+uBEg7rvaTm1kfZ/6IyOh6YCzkb71z7DajoA5
	VmstBmb3mOXc9pOsjMOLdt7hW0E5p6ivbbFfGHuApJV/PKoXA4/mprZimd4ebySq6CTO11Lv5dS
	rcZauhQY7bL8WnjlUDFwR3ggg14XoFndm0mThcbDwd1KNz+D1ekGR4mPHRAa3jj6j3Cq2+m3hCN
	DkQ3gb7CvMLYhfZNFOxeSTS+vkRPy+K2SWwXW7rekx3AwhLxdeNnKBisqunzbdXmAUvBkd4+4Zr
	AAxArjrs15AddllO09uTjCHWAlBud9jDWgs/sGmOV95zNkzxIoqQZePgtpe+3VvalLd2E=
X-Received: by 2002:a5d:50c9:0:b0:475:5e4b:588f with SMTP id ffacd0b85a97d-4775a2eff42mr10021826f8f.16.1783047724132;
        Thu, 02 Jul 2026 20:02:04 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:02:02 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 13/18] rust: i2c: add adapter-provider (bus controller) registration
Date: Fri,  3 Jul 2026 04:01:00 +0100
Message-ID: <20260703030123.2814-14-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030123.2814-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
 <20260703030123.2814-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C abstraction can register an I2C *client* driver (i2c::Driver), but not
provide a bus. A driver that presents a virtual I2C bus and services the
transfers itself -- e.g. DisplayLink's evdi, which exposes a DDC/CI channel so
userspace monitor-control tools can reach the display -- needs the controller
side.

Add i2c::BusController (a trait with master_xfer/functionality over a
driver-supplied Context) and i2c::BusAdapter, which fills a struct i2c_adapter
whose i2c_algorithm dispatches to the trait via trampolines, calls
i2c_add_adapter() on creation and i2c_del_adapter() on drop. i2c::Msg is a
#[repr(transparent)] view over struct i2c_msg exposing addr/flags/is_read and
the payload as a (mutable) byte slice, so a transfer routine needs no unsafe.
FUNC_I2C is exported for the common functionality() return.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/i2c.rs | 192 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 624b971ca8b0..5cde59a3ce46 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -601,3 +601,195 @@ unsafe impl Send for Registration {}
 // SAFETY: `Registration` offers no interior mutability (no mutation through &self
 // and no mutable access is exposed)
 unsafe impl Sync for Registration {}
+
+// ===========================================================================
+// I2C adapter (bus controller / provider) side
+// ===========================================================================
+
+/// A single I2C message presented to a [`BusController`]'s transfer routine.
+///
+/// Wraps a `struct i2c_msg`; `#[repr(transparent)]` so a C `i2c_msg` array can be viewed directly
+/// as a `[Msg]`.
+#[repr(transparent)]
+pub struct Msg(Opaque<bindings::i2c_msg>);
+
+impl Msg {
+    /// The 7-bit (or 10-bit) target address.
+    #[inline]
+    pub fn addr(&self) -> u16 {
+        // SAFETY: `self.0` is a valid `i2c_msg` for the callback's duration.
+        unsafe { (*self.0.get()).addr }
+    }
+
+    /// The message flags (`I2C_M_*`).
+    #[inline]
+    pub fn flags(&self) -> u16 {
+        // SAFETY: as above.
+        unsafe { (*self.0.get()).flags }
+    }
+
+    /// Whether this is a read (`I2C_M_RD`) rather than a write.
+    #[inline]
+    pub fn is_read(&self) -> bool {
+        self.flags() & (bindings::I2C_M_RD as u16) != 0
+    }
+
+    /// The message length in bytes.
+    #[inline]
+    pub fn len(&self) -> usize {
+        // SAFETY: as above.
+        unsafe { (*self.0.get()).len as usize }
+    }
+
+    /// Whether the message is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        self.len() == 0
+    }
+
+    /// The message payload of a write, as a read-only slice.
+    #[inline]
+    pub fn buf(&self) -> &[u8] {
+        // SAFETY: `buf` points to `len` bytes valid for the callback's duration.
+        unsafe { core::slice::from_raw_parts((*self.0.get()).buf, self.len()) }
+    }
+
+    /// The message buffer of a read, as a mutable slice to fill with the reply.
+    #[inline]
+    pub fn buf_mut(&mut self) -> &mut [u8] {
+        // SAFETY: `buf` points to `len` writable bytes valid for the callback's duration.
+        unsafe { core::slice::from_raw_parts_mut((*self.0.get()).buf, self.len()) }
+    }
+}
+
+/// `I2C_FUNC_I2C`: the adapter supports plain I2C (not just SMBus) transfers.
+pub const FUNC_I2C: u32 = bindings::I2C_FUNC_I2C;
+
+/// A Rust-implemented I2C bus adapter (the controller/provider side).
+///
+/// This is the counterpart to the [`Driver`] trait above: rather than binding to an I2C client on
+/// an existing bus, an implementer *is* a bus and services transfers. Virtual buses -- e.g. the
+/// DDC/CI channel DisplayLink's evdi exposes so userspace monitor-control tools can reach the
+/// display -- use this.
+pub trait BusController: 'static {
+    /// Per-adapter driver context, made available to the transfer callbacks.
+    type Context: Send + Sync;
+
+    /// Transfer `msgs` on the bus, returning the number of messages successfully transferred
+    /// (as the C `master_xfer` does), or an error.
+    fn master_xfer(ctx: &Self::Context, msgs: &mut [Msg]) -> Result<usize>;
+
+    /// Report the bus functionality bitmask (`I2C_FUNC_*`).
+    fn functionality(ctx: &Self::Context) -> u32;
+}
+
+/// An owned, registered I2C adapter driven by a [`BusController`].
+///
+/// [`BusAdapter::new`] fills a `struct i2c_adapter` (pointing its algorithm at trampolines that
+/// dispatch to `T`) and calls `i2c_add_adapter()`; dropping it calls `i2c_del_adapter()`.
+#[pin_data(PinnedDrop)]
+pub struct BusAdapter<T: BusController> {
+    #[pin]
+    adapter: Opaque<bindings::i2c_adapter>,
+    #[pin]
+    algo: Opaque<bindings::i2c_algorithm>,
+    ctx: T::Context,
+    registered: core::sync::atomic::AtomicBool,
+}
+
+// SAFETY: the adapter is internally synchronized by the I2C core; `ctx` is `Send + Sync`.
+unsafe impl<T: BusController> Send for BusAdapter<T> {}
+// SAFETY: see `Send`.
+unsafe impl<T: BusController> Sync for BusAdapter<T> {}
+
+impl<T: BusController> BusAdapter<T> {
+    /// # Safety
+    /// `adap` is a valid adapter whose `algo_data` points to a live `T::Context`.
+    unsafe extern "C" fn xfer_trampoline(
+        adap: *mut bindings::i2c_adapter,
+        msgs: *mut bindings::i2c_msg,
+        num: crate::ffi::c_int,
+    ) -> crate::ffi::c_int {
+        // SAFETY: by the invariant established in `new`, `algo_data` points to the `T::Context`.
+        let ctx = unsafe { &*((*adap).algo_data as *const T::Context) };
+        // SAFETY: the I2C core passes `num` valid `i2c_msg`s; `Msg` is `#[repr(transparent)]`.
+        let slice = unsafe { core::slice::from_raw_parts_mut(msgs.cast::<Msg>(), num as usize) };
+        match T::master_xfer(ctx, slice) {
+            Ok(n) => n as crate::ffi::c_int,
+            Err(e) => e.to_errno(),
+        }
+    }
+
+    /// # Safety
+    /// `adap` is a valid adapter whose `algo_data` points to a live `T::Context`.
+    unsafe extern "C" fn func_trampoline(adap: *mut bindings::i2c_adapter) -> u32 {
+        // SAFETY: by the invariant established in `new`, `algo_data` points to the `T::Context`.
+        let ctx = unsafe { &*((*adap).algo_data as *const T::Context) };
+        T::functionality(ctx)
+    }
+
+    /// Create and register a new I2C adapter named `name`, parented to `parent`, with driver
+    /// context `ctx`.
+    pub fn new(
+        name: &CStr,
+        parent: &device::Device,
+        ctx: T::Context,
+    ) -> Result<Pin<KBox<Self>>> {
+        let this = KBox::try_pin_init(
+            try_pin_init!(Self {
+                adapter <- Opaque::ffi_init(|slot: *mut bindings::i2c_adapter| {
+                    // SAFETY: `slot` is valid, uninitialized storage; a zeroed adapter is a valid
+                    // starting point (self-referential fields are set below, after pinning).
+                    unsafe { *slot = bindings::i2c_adapter::default() };
+                }),
+                algo <- Opaque::ffi_init(|slot: *mut bindings::i2c_algorithm| {
+                    // SAFETY: `slot` is valid, uninitialized storage.
+                    unsafe {
+                        *slot = bindings::i2c_algorithm::default();
+                        (*slot).__bindgen_anon_1.master_xfer = Some(Self::xfer_trampoline);
+                        (*slot).functionality = Some(Self::func_trampoline);
+                    }
+                }),
+                ctx: ctx,
+                registered: core::sync::atomic::AtomicBool::new(false),
+            }),
+            GFP_KERNEL,
+        )?;
+
+        // `this` now has a stable address; wire the self-referential adapter fields and register.
+        let adap = this.adapter.get();
+        // Copy the name without its NUL into the fixed 48-byte array (capped at 47 so the
+        // already-zeroed array stays NUL-terminated even if the name is over-long).
+        let name_bytes = name.to_bytes();
+        let n = core::cmp::min(name_bytes.len(), 47);
+        // SAFETY: `adap`/`algo`/`ctx` live for `this`'s (pinned) lifetime; `name_bytes` is valid
+        // for `n <= 47` bytes; `parent` is a valid device.
+        unsafe {
+            (*adap).algo = this.algo.get();
+            (*adap).algo_data = (&this.ctx as *const T::Context).cast_mut().cast();
+            core::ptr::copy_nonoverlapping(
+                name_bytes.as_ptr(),
+                (*adap).name.as_mut_ptr().cast::<u8>(),
+                n,
+            );
+            (*adap).dev.parent = parent.as_raw();
+        }
+
+        // SAFETY: `adap` is a fully-initialized adapter.
+        to_result(unsafe { bindings::i2c_add_adapter(adap) })?;
+        this.registered
+            .store(true, core::sync::atomic::Ordering::Release);
+        Ok(this)
+    }
+}
+
+#[pinned_drop]
+impl<T: BusController> PinnedDrop for BusAdapter<T> {
+    fn drop(self: Pin<&mut Self>) {
+        if self.registered.load(core::sync::atomic::Ordering::Acquire) {
+            // SAFETY: the adapter was successfully registered with `i2c_add_adapter` and has not
+            // been deleted yet.
+            unsafe { bindings::i2c_del_adapter(self.adapter.get()) };
+        }
+    }
+}
-- 
2.55.0

