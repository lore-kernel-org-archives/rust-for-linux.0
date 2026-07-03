Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEFD28488F
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047659; cv=none; b=JCtrqrvWzyTUNaysYg6r43UEW/iYuM+pkSiK+WV9PKvereIuAW0a++9AOOT3Gkhdfd3uRYBT38mNQUwCxBJLc5pgJNoYChtuBqO2wXJcpbpjAHszdXQh02kChnTbXdcYlegFJi2GdDttk9pqxqY34bNIGYY1BztUdQ9/30ErFuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047659; c=relaxed/simple;
	bh=d4fMzcnolsL0fVjexV5Y1nPWxOzkutk7Dr5FSKpIyWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UVbiGDoaPBvxKam+I0HTeWizF9Fs4OnJnPEToYyf8+rWBg9VxaPMknXbeVakho0xq+k027DGmd7MOlCL/4bZPoue0tUVD9fwfGbGJ7VtjQbEzHHFuMX4THDxoYtxhd73fLTypiSD7M0p+9eQxWyvnWkZlVbhXSehdhkuwqNYuDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=mMeAEBQz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="mMeAEBQz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-475881b9a4bso78693f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047653; x=1783652453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDtlzI1o9QHG1A0Yg5fgxyLBaQWwHYWiJZWSyWk212Q=;
        b=mMeAEBQzjtjHB5OYYsYP/YeuBukEzvX5DB8nTM8zGQg+eO0h1D/dUBxYTvrg5yjU9s
         vTHpTIo0e4aeF6NRRUzgVi9m9WNcauBBLVBHSkVWgAgbymT69c6KH+S67b4+ULsCl9Vs
         M9It5mH2o3paEGDUwVpb+/cjFSH21Wly6IvlPu9TDQ0sikNG+FbvUqIjcQtcQDnaXP1T
         X3wTQCV0MfYAT29EI2U31mppmK6/Pa1Oh6+ThrQH++nfSuIb6A/Ra2ziC/j5hPSspwgk
         Orh+1TZV3aKKuq+FQ3ieOPZpWaY5X0OgL4xtv/Nw5QL76+mRWDgE2lcCSyumyljQVEKW
         cxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047653; x=1783652453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDtlzI1o9QHG1A0Yg5fgxyLBaQWwHYWiJZWSyWk212Q=;
        b=Tf0+V8V3t8qXxJPgzlcLkLL45TCP6fPMSpwRQA8wgvZRWQnYF3bZA1MCr0hVlvCyVC
         5lbLCYUVP75dmeEDu099YWHGtQIKAGRjFKau4tNGuMfJUtXUv4wyo5x83tAewUs3OWKs
         D3ZgpvGphtsxmPa7A6bqJES2QoZXHDlOOkr027i+nVperof9DluiK8HSaKjYIDEra76M
         t8tFYA7CH2a5Fl/o9p4XOrQ/BB9aVrTvuAO5ovgqcoV429s9ITkY9Z0H0NLFB95RSXng
         Ph1khZZ0cyVkcEtKmUZUVUFXPfbLIVzpaovoYSP98rAYAVsIj37l7LhatEgvn0qv0y4g
         cZvQ==
X-Gm-Message-State: AOJu0Yx7KjKM+7rLyo9pTQyTK0koVv9RdKI4euYclIM1u0D3JcnYERAi
	6MX6uDsc+lag4X16Vl8jPJpZJKoLQFt5u1OqcmL6N1GbA2WQ5z4hNXMQV8Zp9TdzEFw2mfFCSSW
	TUxNKyJ85
X-Gm-Gg: AfdE7cl27FyyYrQ6k4VeMf4AcaNqIugs81Qz/e+usN3hYkeY/2L0BmG0qCPs/s+tQIS
	istwjqbZVjDiNJWUn8KSsDfoUpQHF2Tyjcq0u10D4e4BXma+5hKqRzuZ+wkpAoXBlQFtu63gqaZ
	fsUOanK+s+qBPVNlFrMtQkcuyIl1Ct97wuMu4ECgEURwiDc/OWJI7ynno8FE0r4Yd6kV55hKh/I
	vdR6bMyPLImqtnxozsz3pa+aVkjjB9s//NdAgmfLPpGfxx+4E7WNMriHUd+p7APXwy0+ulXpsd0
	vAr2zqGs17tGu3lM9uU/5H2D1lZ3qTvdsK8VXgL08djNvP68fxpN8A/9/mKtI8SNCvviFyo3Rta
	NyDqR/Ga814F0Az553WMZKBYRx6zzeFwwgShRCPHhYgc7y875/RYD+g+dhBMaVF/c17/J6CV7s6
	cRiZfP4XgkpvQYGpqBi9/ow7+Z520TqPw7n6gwFXBxU3a2FyPQgRE+/m6UJhwVUmuGdnY=
X-Received: by 2002:a05:6000:2605:b0:46e:6201:5d56 with SMTP id ffacd0b85a97d-477b34b0307mr10270374f8f.7.1783047653144;
        Thu, 02 Jul 2026 20:00:53 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm13128569f8f.9.2026.07.02.20.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:52 -0700 (PDT)
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
Subject: [RFC PATCH v2 11/11] rust: usb: let drivers choose the transfer allocation flags
Date: Fri,  3 Jul 2026 04:00:15 +0100
Message-ID: <20260703030020.2694-12-mike@fireburn.co.uk>
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
Content-Transfer-Encoding: 8bit

Oliver Neukum review of the synchronous transfer bindings: a USB driver must be able to
specify GFP_KERNEL vs GFP_NOIO/GFP_NOFS (USB shares error handling and power management
across a device's interfaces, so allocations on reset/resume/error paths must not recurse
into I/O). Thread a `gfp: Flags` parameter through bulk_send/bulk_recv/interrupt_recv/
control_send/control_recv (both the Interface wrappers and the Device impls) instead of
hardcoding GFP_KERNEL.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/usb.rs | 59 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 1fcaf34433cc..d39ba6246090 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -17,6 +17,7 @@
         from_result,
         to_result, //
     },
+    alloc::Flags,
     prelude::*,
     sync::aref::AlwaysRefCounted,
     time::Delta,
@@ -418,24 +419,40 @@ pub fn clear_halt(&self, endpoint: u8) -> Result {
 
     /// Issues a synchronous bulk OUT transfer of `data` to `endpoint`, returning
     /// the number of bytes transferred. `data` must be DMA-capable. Sleeps.
-    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
-        self.device().bulk_send(endpoint, data, timeout)
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
+    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta, gfp: Flags) -> Result<usize> {
+        self.device().bulk_send(endpoint, data, timeout, gfp)
     }
 
     /// Issues a synchronous bulk IN transfer into `data`, returning the number of
     /// bytes received. `data` must be DMA-capable. Sleeps.
-    pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
-        self.device().bulk_recv(endpoint, data, timeout)
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
+    pub fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta, gfp: Flags) -> Result<usize> {
+        self.device().bulk_recv(endpoint, data, timeout, gfp)
     }
 
     /// Issues a synchronous interrupt IN transfer into `data`, returning the number
     /// of bytes received. `data` must be DMA-capable. Sleeps.
-    pub fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
-        self.device().interrupt_recv(endpoint, data, timeout)
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
+    pub fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta, gfp: Flags) -> Result<usize> {
+        self.device().interrupt_recv(endpoint, data, timeout, gfp)
     }
 
     /// Issues a synchronous control OUT transfer on the default control endpoint.
     /// The buffer is copied internally, so `data` need not be DMA-capable. Sleeps.
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
     pub fn control_send(
         &self,
         request: u8,
@@ -444,13 +461,18 @@ pub fn control_send(
         index: u16,
         data: &[u8],
         timeout: Delta,
+        gfp: Flags,
     ) -> Result {
         self.device()
-            .control_send(request, request_type, value, index, data, timeout)
+            .control_send(request, request_type, value, index, data, timeout, gfp)
     }
 
     /// Issues a synchronous control IN transfer on the default control endpoint,
     /// filling `data` with exactly `data.len()` bytes. Sleeps.
+    ///
+    /// `gfp` selects the allocation flags for this transfer's buffers: pass `GFP_KERNEL`
+    /// normally, or `GFP_NOIO`/`GFP_NOFS` when called from a reset/resume or error-handling
+    /// path (USB shares error handling and PM across a device's interfaces).
     pub fn control_recv(
         &self,
         request: u8,
@@ -459,9 +481,10 @@ pub fn control_recv(
         index: u16,
         data: &mut [u8],
         timeout: Delta,
+        gfp: Flags,
     ) -> Result {
         self.device()
-            .control_recv(request, request_type, value, index, data, timeout)
+            .control_recv(request, request_type, value, index, data, timeout, gfp)
     }
 
     /// Selects alternate setting `alternate` of interface `interface`
@@ -609,13 +632,13 @@ pub(crate) fn clear_halt(&self, endpoint: u8) -> Result {
     /// not arrange DMA-capable storage themselves.
     ///
     /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
-    pub(crate) fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
+    pub(crate) fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta, gfp: Flags) -> Result<usize> {
         let mut actual: kernel::ffi::c_int = 0;
 
         // `usb_bulk_msg()` requires a DMA-capable buffer; `data` may live on the
         // stack or in `.rodata`, so copy it into a kmalloc'd bounce buffer.
-        let mut buf = KVec::with_capacity(data.len(), GFP_KERNEL)?;
-        buf.extend_from_slice(data, GFP_KERNEL)?;
+        let mut buf = KVec::with_capacity(data.len(), gfp)?;
+        buf.extend_from_slice(data, gfp)?;
 
         // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
         let pipe = unsafe { bindings::usb_sndbulkpipe(self.as_raw(), endpoint.into()) };
@@ -655,12 +678,12 @@ pub(crate) fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Res
     /// `data` may be any slice.
     ///
     /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
-    pub(crate) fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+    pub(crate) fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta, gfp: Flags) -> Result<usize> {
         let mut actual: kernel::ffi::c_int = 0;
 
         // `usb_bulk_msg()` requires a DMA-capable buffer; receive into a kmalloc'd
         // bounce buffer and copy out, so `data` need not be DMA-capable itself.
-        let mut buf = KVec::from_elem(0u8, data.len(), GFP_KERNEL)?;
+        let mut buf = KVec::from_elem(0u8, data.len(), gfp)?;
 
         // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
         let pipe = unsafe { bindings::usb_rcvbulkpipe(self.as_raw(), endpoint.into()) };
@@ -697,12 +720,12 @@ pub(crate) fn bulk_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) ->
     /// milliseconds; a [`Delta`] of zero, or any non-zero value below 1 ms, waits indefinitely.
     ///
     /// [`bulk_recv`]: Self::bulk_recv
-    pub(crate) fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta) -> Result<usize> {
+    pub(crate) fn interrupt_recv(&self, endpoint: u8, data: &mut [u8], timeout: Delta, gfp: Flags) -> Result<usize> {
         let mut actual: kernel::ffi::c_int = 0;
 
         // `usb_interrupt_msg()` requires a DMA-capable buffer; receive into a kmalloc'd
         // bounce buffer and copy out, so `data` need not be DMA-capable itself.
-        let mut buf = KVec::from_elem(0u8, data.len(), GFP_KERNEL)?;
+        let mut buf = KVec::from_elem(0u8, data.len(), gfp)?;
 
         // SAFETY: `self.as_raw()` is a valid `struct usb_device` by the type invariant.
         let pipe = unsafe { bindings::usb_rcvintpipe(self.as_raw(), endpoint.into()) };
@@ -749,6 +772,7 @@ pub(crate) fn control_send(
         index: u16,
         data: &[u8],
         timeout: Delta,
+        gfp: Flags,
     ) -> Result {
         // SAFETY: `self.as_raw()` is valid by the type invariant; `data` is valid for
         // reads of `data.len()` bytes; `usb_control_msg_send()` copies the buffer.
@@ -763,7 +787,7 @@ pub(crate) fn control_send(
                 data.as_ptr().cast::<kernel::ffi::c_void>(),
                 data.len().try_into()?,
                 timeout.as_millis().try_into()?,
-                bindings::GFP_KERNEL,
+                gfp.as_raw(),
             )
         })
     }
@@ -784,6 +808,7 @@ pub(crate) fn control_recv(
         index: u16,
         data: &mut [u8],
         timeout: Delta,
+        gfp: Flags,
     ) -> Result {
         // SAFETY: `self.as_raw()` is valid by the type invariant; `data` is valid for
         // writes of `data.len()` bytes; `usb_control_msg_recv()` copies into the buffer.
@@ -798,7 +823,7 @@ pub(crate) fn control_recv(
                 data.as_mut_ptr().cast::<kernel::ffi::c_void>(),
                 data.len().try_into()?,
                 timeout.as_millis().try_into()?,
-                bindings::GFP_KERNEL,
+                gfp.as_raw(),
             )
         })
     }
-- 
2.55.0

