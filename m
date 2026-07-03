Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF6E2B9A4
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047659; cv=none; b=gBMKVi1aQBTroht8Hi7nE5MGcnLzqnVz1KI64bJMDMN03gTtvs+9YjlR9bAw5u7e6ls+uzpEVjwcFisG762zDB58ziTT9EdB9T98XzpR5/3rMh36tt/nEmTFOClPhFsPekjKOH6idJc0Knrhuzsf2+ekGJwp5nb1y0s7oGUPk2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047659; c=relaxed/simple;
	bh=aCC4q/ul6R6V+JxntXyLk1yBb3Ole6vI5dzaz+cOBTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7pZWEOg4Rpr18b97B0/JH4G70DC8bf4QbCo0bgYTLqXc5EPSOMGs26o35Ass/R5zLpKnZCqrC72HWLmBKs3sJ6RGtJkBl7CM6yuRYFAnfTbiDfgYM3wjkyltBDe+ZVI7FnoDTHJHrxfy/GjAfFVhuOmNeYgTtWf3iDUwuL/tT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=TPFj+2hp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="TPFj+2hp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so266125e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047651; x=1783652451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsZ4yoLHgQH5Efxe8E/7tqABE1F1gZe/Y3PpKR4M7ck=;
        b=TPFj+2hpRSRL++l580BsyA0ZTHqb0/raezsK5zOxt6aV36embzExRB6XafR8/IlDPU
         NqDdCyDZ1XaKQbLuz6E3dTxzxuTeXPkyn91VfO7rxakBnxftX5+TQWYq/h2haV4wnWTx
         V2tVMQsI8vIceabD0yIiCMJ8NmjVDeyG8trRuek0Mog5cviAyzeaHYQsygIyXw/LsfBn
         ihkOxDE2BD1KsM8VOrYa41HPL06kjAMnlC+chOSDmv2p4I4peQhdnDEfuEioOV330yjF
         nc/3JVP5+nszkCp9qHoPC017r+FDCQYVquZ5o1diQt7dRiDHt+A3MtbPUjF0O85wLB2v
         jZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047651; x=1783652451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZsZ4yoLHgQH5Efxe8E/7tqABE1F1gZe/Y3PpKR4M7ck=;
        b=AShfzPirVjPnaA9yXauqErQwSyMpNKDLRwNuKRjjYLziepxTtsek6KxLhnEqu3Zy6j
         DqiXQf/uWTWpqjOED6iC/owWcmXoI6vLZegPbsubIzLI2U/5IoKulK8j+SpwylVaZ2L2
         foK/d5famWS73TMnFi/NU8q9sAln2P0rFUTqR94cseHO1pc/5Ba8FnSEtrpgAVuoaBpd
         OoxigmQsLiLFK0tlMgLO8v5LmWqfM0h8rnzRJqNswLKsoT6uU1zL6kc2ecpe5SNCbZkt
         rLWi4JgrqTEwUaY/T7s2PL7ITznalKlmwXrC72UItS180IrRUOiIK82txU2Tgbm3G4JF
         40lA==
X-Gm-Message-State: AOJu0YzlH2cn+KtJ3Acli+2DqG0/z7UMzF2JO8oe4pEWK+eb7p8nkKG4
	JBigjZE3/zygGP6i0rQjstIMzVd1htQeP+zG4a5UeDWn+f+b4hFwuEh3ORaz7/nj3y7ckzQKeZK
	ieFPE6b39
X-Gm-Gg: AfdE7ckTw+cQHx7ReUe9KV/rGyDFpKMUjBr+437etC62PggMPq4YglU9uFmfwB1KppO
	J6cHReGmy0ot5rWeOQfPJ17VLTwN6W0Jp5BP0yzPpP+1Vpor4W4QFSgipAycrHzWlrv6BQoyXm0
	Zh1gVfY+X1JGdphrcM/ELY9DMAdjlx9uJfIuhVLDDWR/rMZCKcXb0l3WslUwtIKdRUulWo5DHZe
	EJP9EHCZWI2pzuimimBhi9qs+cCVPVpFVO++HRilyGxbORwR1Q+z2XE4ivJKAsXHhlOMQeCRr54
	s6QAG5KmpUHvG6pvSW72GRSKYiTn9zHL4jcyCbNd1fn7OQz+k7U3HUNTfs974XEMTHCwOGIlof6
	Q64n5GjCaUO3VTJ/3oEF5d0qGegTYLy4TB104BTN9oRHESl/5c94UAn+MXq0RnR2nGggp4upsnT
	uPp5gInZZqpKM9h1uio0/f/2D/lzdZ29Zeep3VBlDPFukFRBiSjxCMQag6e01YDSFq2zQ=
X-Received: by 2002:a05:600c:6d8c:b0:492:68f5:6b30 with SMTP id 5b1f17b1804b1-493c2b57006mr81105875e9.17.1783047650780;
        Thu, 02 Jul 2026 20:00:50 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:49 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 10/11] rust: usb: keep usb::Device private and gate transfers on Interface<Bound>
Date: Fri,  3 Jul 2026 04:00:14 +0100
Message-ID: <20260703030020.2694-11-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030020.2694-1-mike@fireburn.co.uk>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Address the v1 RFC review (Danilo Krummrich):

 - Do not make `usb::Device` public. Writing a `usb::Interface` driver should
   not require naming the underlying `usb::Device` (cf. commit 22d693e45d4a
   ("rust: usb: keep usb::Device private for now")), so the struct is
   private again and the device-wide transfer operations are exposed on
   the interface.

 - Gate the transfer methods (`bulk_send`/`bulk_recv`/`interrupt_recv`/
   `control_send`/`control_recv`/`set_interface`/`reset_configuration`/
   `clear_halt`/`bulk_in_queue`/`bulk_out_queue`) on `Interface<Bound>`, so a
   transfer cannot be issued before the interface's device is bound to the
   driver. Each forwards to the (now private) `Device` helper.

 - Add `Interface::as_bound()` for drivers that keep a refcounted
   `ARef<Interface>` and perform transfers from a deferred context (a work
   item), with a safety contract requiring the work be flushed before unbind.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 162 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 140 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 6c49de422b30..1fcaf34433cc 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -368,6 +368,130 @@ pub fn number(&self) -> u8 {
             (*altsetting).desc.bInterfaceNumber
         }
     }
+
+    /// Returns a [`Bound`](device::Bound)-context view of this interface, on which
+    /// the device-wide transfer operations (`bulk_send`, `control_recv`, …) become
+    /// callable.
+    ///
+    /// During `probe()` the interface is already available in a bound context
+    /// ([`Core`](device::Core) dereferences to [`Bound`](device::Bound)), so this
+    /// is only needed by drivers that keep a refcounted [`ARef<Interface>`] and
+    /// perform transfers from a deferred context (e.g. a work item).
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure the interface stays bound to this driver for the
+    /// entire lifetime of the returned reference — for example by cancelling and
+    /// flushing any such deferred work in `disconnect()`. Issuing a transfer on an
+    /// unbound interface is undefined behaviour.
+    ///
+    /// [`ARef<Interface>`]: crate::sync::aref::ARef
+    pub unsafe fn as_bound(&self) -> &Interface<device::Bound> {
+        // SAFETY: `Interface<Ctx>` is `#[repr(transparent)]` over the same
+        // `Opaque<usb_interface>` regardless of the `Ctx` marker, so this cast only
+        // changes the zero-sized context type; the caller upholds boundness.
+        unsafe { &*(self as *const Self as *const Interface<device::Bound>) }
+    }
+}
+
+/// Device-wide USB transfer operations, exposed only on a [`Bound`](device::Bound)
+/// interface so a transfer cannot be issued before the interface's device is bound
+/// to this driver. Each method forwards to the (sleeping) USB core helper for the
+/// interface's [`struct usb_device`]; all must be called from process context.
+impl Interface<device::Bound> {
+    fn device(&self) -> &Device {
+        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` by the type
+        // invariant; `interface_to_usbdev()` returns its valid `struct usb_device`,
+        // and `Device` is `#[repr(transparent)]` over `Opaque<usb_device>`. The
+        // borrow is tied to `&self`, which keeps the interface (and device) alive.
+        let usb_dev = unsafe { bindings::interface_to_usbdev(self.as_raw()) };
+        // SAFETY: `usb_dev` is a valid `struct usb_device` pointer (see above).
+        unsafe { &*(usb_dev.cast::<Device>()) }
+    }
+
+    /// Clears a halt/stall on bulk `endpoint` (both the device-side stall and the
+    /// host-side data toggle). The direction is taken from bit 7 of the endpoint
+    /// address, so it works for IN and OUT endpoints. Sleeps.
+    pub fn clear_halt(&self, endpoint: u8) -> Result {
+        self.device().clear_halt(endpoint)
+    }
+
+    /// Issues a synchronous bulk OUT transfer of `data` to `endpoint`, returning
+    /// the number of bytes transferred. `data` must be DMA-capable. Sleeps.
+    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
+        self.device().bulk_send(endpoint, data, timeout)
+    }
+
+    /// Issues a synchronous bulk IN transfer into `data`, returning the number of
+    /// bytes received. `data` must be DMA-capable. Sleeps.
+    pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+        self.device().bulk_recv(endpoint, data, timeout)
+    }
+
+    /// Issues a synchronous interrupt IN transfer into `data`, returning the number
+    /// of bytes received. `data` must be DMA-capable. Sleeps.
+    pub fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+        self.device().interrupt_recv(endpoint, data, timeout)
+    }
+
+    /// Issues a synchronous control OUT transfer on the default control endpoint.
+    /// The buffer is copied internally, so `data` need not be DMA-capable. Sleeps.
+    pub fn control_send(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &[u8],
+        timeout: Delta,
+    ) -> Result {
+        self.device()
+            .control_send(request, request_type, value, index, data, timeout)
+    }
+
+    /// Issues a synchronous control IN transfer on the default control endpoint,
+    /// filling `data` with exactly `data.len()` bytes. Sleeps.
+    pub fn control_recv(
+        &self,
+        request: u8,
+        request_type: u8,
+        value: u16,
+        index: u16,
+        data: &mut [u8],
+        timeout: Delta,
+    ) -> Result {
+        self.device()
+            .control_recv(request, request_type, value, index, data, timeout)
+    }
+
+    /// Selects alternate setting `alternate` of interface `interface`
+    /// (`SET_INTERFACE`). Sleeps.
+    pub fn set_interface(&self, interface: u8, alternate: u8) -> Result {
+        self.device().set_interface(interface, alternate)
+    }
+
+    /// Re-issues `SET_CONFIGURATION` for the current configuration, resetting all
+    /// endpoint data toggles without re-enumerating the device. Sleeps.
+    pub fn reset_configuration(&self) -> Result {
+        self.device().reset_configuration()
+    }
+
+    /// Opens a persistently-queued asynchronous bulk IN reader on `endpoint`
+    /// ([`BulkInQueue`]). Must be called from process context.
+    pub fn bulk_in_queue(&self, endpoint: u8, depth: usize, buf_len: usize) -> Result<BulkInQueue> {
+        self.device().bulk_in_queue(endpoint, depth, buf_len)
+    }
+
+    /// Opens an asynchronous, pipelined bulk OUT writer on `endpoint`
+    /// ([`BulkOutQueue`]). Must be called from process context.
+    pub fn bulk_out_queue(
+        &self,
+        endpoint: u8,
+        depth: usize,
+        buf_len: usize,
+    ) -> Result<BulkOutQueue> {
+        self.device().bulk_out_queue(endpoint, depth, buf_len)
+    }
 }
 
 // SAFETY: `usb::Interface` is a transparent wrapper of `struct usb_interface`.
@@ -392,17 +516,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }
 
-impl<Ctx: device::DeviceContext> AsRef<Device> for Interface<Ctx> {
-    fn as_ref(&self) -> &Device {
-        // SAFETY: `self.as_raw()` is valid by the type invariants.
-        let usb_dev = unsafe { bindings::interface_to_usbdev(self.as_raw()) };
-
-        // SAFETY: For a valid `struct usb_interface` pointer, the above call to
-        // `interface_to_usbdev()` guarantees to return a valid pointer to a `struct usb_device`.
-        unsafe { &*(usb_dev.cast()) }
-    }
-}
-
 // SAFETY: Instances of `Interface` are always reference-counted.
 unsafe impl AlwaysRefCounted for Interface {
     fn inc_ref(&self) {
@@ -431,6 +544,11 @@ unsafe impl Sync for Interface {}
 /// The implementation abstracts the usage of a C [`struct usb_device`] passed in
 /// from the C side.
 ///
+/// It is kept private to this module: a `usb::Interface` driver should never need
+/// to name the underlying `usb::Device`. The device-wide transfer operations are
+/// instead exposed on [`Interface<Bound>`](Interface), which proves the interface
+/// (and thus its device) is bound to this driver for the duration of the call.
+///
 /// # Invariants
 ///
 /// A [`Device`] instance represents a valid [`struct usb_device`] created by the C portion of the
@@ -438,7 +556,7 @@ unsafe impl Sync for Interface {}
 ///
 /// [`struct usb_device`]: https://www.kernel.org/doc/html/latest/driver-api/usb/usb.html#c.usb_device
 #[repr(transparent)]
-pub struct Device<Ctx: device::DeviceContext = device::Normal>(
+struct Device<Ctx: device::DeviceContext = device::Normal>(
     Opaque<bindings::usb_device>,
     PhantomData<Ctx>,
 );
@@ -454,7 +572,7 @@ fn as_raw(&self) -> *mut bindings::usb_device {
     /// address (`USB_DIR_IN`), so this works for both bulk IN and bulk OUT endpoints.
     /// Must be called from process context (it sleeps). Needed e.g. when another
     /// driver left a streaming endpoint stalled.
-    pub fn clear_halt(&self, endpoint: u8) -> Result {
+    pub(crate) fn clear_halt(&self, endpoint: u8) -> Result {
         // `usb_clear_halt()` must be given a pipe whose direction matches the endpoint:
         // it issues CLEAR_FEATURE to that endpoint address and resets the matching data
         // toggle. Build an IN or OUT pipe from the `USB_DIR_IN` bit of the address;
@@ -491,7 +609,7 @@ pub fn clear_halt(&self, endpoint: u8) -> Result {
     /// not arrange DMA-capable storage themselves.
     ///
     /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
-    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
+    pub(crate) fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
         let mut actual: kernel::ffi::c_int = 0;
 
         // `usb_bulk_msg()` requires a DMA-capable buffer; `data` may live on the
@@ -537,7 +655,7 @@ pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usi
     /// `data` may be any slice.
     ///
     /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
-    pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+    pub(crate) fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
         let mut actual: kernel::ffi::c_int = 0;
 
         // `usb_bulk_msg()` requires a DMA-capable buffer; receive into a kmalloc'd
@@ -579,7 +697,7 @@ pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result
     /// milliseconds; a [`Delta`] of zero, or any non-zero value below 1 ms, waits indefinitely.
     ///
     /// [`bulk_recv`]: Self::bulk_recv
-    pub fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+    pub(crate) fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
         let mut actual: kernel::ffi::c_int = 0;
 
         // `usb_interrupt_msg()` requires a DMA-capable buffer; receive into a kmalloc'd
@@ -623,7 +741,7 @@ pub fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> R
     /// non-zero value below 1 ms — waits indefinitely.
     ///
     /// [`usb_control_msg_send()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_control_msg_send
-    pub fn control_send(
+    pub(crate) fn control_send(
         &self,
         request: u8,
         request_type: u8,
@@ -658,7 +776,7 @@ pub fn control_send(
     /// rules are as for [`Device::control_send`].
     ///
     /// [`usb_control_msg_recv()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_control_msg_recv
-    pub fn control_recv(
+    pub(crate) fn control_recv(
         &self,
         request: u8,
         request_type: u8,
@@ -691,7 +809,7 @@ pub fn control_recv(
     /// a blocking, sleeping call and must only be invoked from process context.
     ///
     /// [`usb_set_interface()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_set_interface
-    pub fn set_interface(&self, interface: u8, alternate: u8) -> Result {
+    pub(crate) fn set_interface(&self, interface: u8, alternate: u8) -> Result {
         // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
         to_result(unsafe {
             bindings::usb_set_interface(self.as_raw(), interface.into(), alternate.into())
@@ -708,7 +826,7 @@ pub fn set_interface(&self, interface: u8, alternate: u8) -> Result {
     /// drivers that are mid-transfer.
     ///
     /// [`usb_reset_configuration()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_reset_configuration
-    pub fn reset_configuration(&self) -> Result {
+    pub(crate) fn reset_configuration(&self) -> Result {
         // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant;
         // `usb_reset_configuration()` only re-issues SET_CONFIGURATION and updates the
         // host-side endpoint state for this device.
@@ -734,7 +852,7 @@ pub fn reset_configuration(&self) -> Result {
     ///
     /// [`bulk_recv`]: Self::bulk_recv
     /// [`BulkInQueue::recv`]: BulkInQueue::recv
-    pub fn bulk_in_queue(&self, endpoint: u8, depth: usize, buf_len: usize) -> Result<BulkInQueue> {
+    pub(crate) fn bulk_in_queue(&self, endpoint: u8, depth: usize, buf_len: usize) -> Result<BulkInQueue> {
         let dev = self.as_raw();
 
         // SAFETY: `dev` is a valid `struct usb_device` by the type invariant; take a
@@ -818,7 +936,7 @@ pub fn bulk_in_queue(&self, endpoint: u8, depth: usize, buf_len: usize) -> Resul
     /// [`bulk_in_queue`]: Self::bulk_in_queue
     /// [`bulk_send`]: Self::bulk_send
     /// [`send`]: BulkOutQueue::send
-    pub fn bulk_out_queue(
+    pub(crate) fn bulk_out_queue(
         &self,
         endpoint: u8,
         depth: usize,
-- 
2.55.0

