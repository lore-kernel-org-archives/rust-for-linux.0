Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF563AE1A4
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749104; cv=none; b=hc8+ogbxIdG9NQUoWBq4gnURId3wi/WJr7mVErgYnSMHd6dRM4pyvrYZW9IuwB9HXrU0bBeQWW5w/EUzWQD2z1jAzpH1DqTr7eeINyXieDc/VCN5lFWYOqbLsGQCR5Lksq23fwDSJl22j6oJZOsTWDofuyqcyXDJHmouY32qqwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749104; c=relaxed/simple;
	bh=1cQPW0r6BS+eEjsyt0XQrJVhTMBdg77G847AwAAPoC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lERrVF3sE6ySBy4wz6SFkjGLPx2WjSWNgd9Lwo7PtyEWXcnpE6qgqU04VmNig9es6Ejm3+LLxKFNiRq2XIPGQ/SDMkMxd3gniEflpdztaEvytuJ3fPELSOXaVY9rgrMBwrg7yNezPgKS4RyVxHoApPT4B9q262GLWb3cutoIP4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GsXFthx3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GsXFthx3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFCB1C2BC86;
	Tue, 17 Mar 2026 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1773749104; bh=1cQPW0r6BS+eEjsyt0XQrJVhTMBdg77G847AwAAPoC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GsXFthx3981WkPcU81gMe2b5lwdU2tTbrQO6TDA909fUYNnRpDUfYLztkqptsS6zM
	 Mlmg6I3r3IsVU8mkza/Oef5nVPY0H4D0gFDTX+ib2W0SpfCOPDWnxGNztpzIHENxks
	 mFs3HK7qik6r1ExxPpme5afRyn/AbHqmALjYhwA8=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC20FD874D;
	Tue, 17 Mar 2026 12:05:03 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Tue, 17 Mar 2026 20:03:40 +0800
Subject: [PATCH 1/2] drm/gpuvm: add name(), RawGpuVa and kernel_alloc_va()
 for debugfs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-gpuvm-helpers-v1-1-00198fc6eeea@linux.dev>
References: <20260317-gpuvm-helpers-v1-0-00198fc6eeea@linux.dev>
In-Reply-To: <20260317-gpuvm-helpers-v1-0-00198fc6eeea@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773749102; l=3053;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=1cQPW0r6BS+eEjsyt0XQrJVhTMBdg77G847AwAAPoC0=;
 b=hh3kP7Y+s26EUoQhcpPxRgdgkUcG/PQdcv6jvZUjcOpTa4Z89lKBGQWiaxADRQ+xtqmq3Ho8t
 Iz8745X0a90DQLQpljwK0yppC3Y2hiOl/ca4gWzihv26LqfunalJSZx
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Expose GPU VM name and kernel-reserved VA so drivers can dump GPU VA
state in debugfs.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/drm/gpuvm/mod.rs | 14 ++++++++++++++
 rust/kernel/drm/gpuvm/va.rs  | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 20e512842dfc6..3186df9f740cf 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -165,6 +165,13 @@ pub fn as_raw(&self) -> *mut bindings::drm_gpuvm {
         self.vm.get()
     }
 
+    /// Returns the name of this GpuVm.
+    #[inline]
+    pub fn name(&self) -> &CStr {
+        // SAFETY: The `name` field is immutable and points to a NUL-terminated string.
+        unsafe { CStr::from_char_ptr((*self.as_raw()).name) }
+    }
+
     /// The start of the VA space.
     #[inline]
     pub fn va_start(&self) -> u64 {
@@ -188,6 +195,13 @@ pub fn va_range(&self) -> Range<u64> {
         Range { start, end }
     }
 
+    /// Returns the kernel-allocated VA for this GpuVm.
+    #[inline]
+    pub fn kernel_alloc_va(&self) -> &RawGpuVa {
+        // SAFETY: The `self.as_raw()` is guaranteed to be a valid pointer to a drm_gpuvm.
+        unsafe { RawGpuVa::from_raw(&raw mut (*self.as_raw()).kernel_alloc_node) }
+    }
+
     /// Get or create the [`GpuVmBo`] for this gem object.
     #[inline]
     pub fn obtain(
diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
index a31122ff22282..8b8fd500b3c5f 100644
--- a/rust/kernel/drm/gpuvm/va.rs
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -81,6 +81,43 @@ pub fn vm_bo(&self) -> &GpuVmBo<T> {
     }
 }
 
+/// Represents that a range of a GEM object is mapped in the kernel.
+#[repr(transparent)]
+pub struct RawGpuVa(Opaque<bindings::drm_gpuva>);
+
+impl RawGpuVa {
+    /// Access this [`RawGpuVa`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of `'a`, the pointer must reference a valid `drm_gpuva`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuva) -> &'a Self {
+        // SAFETY: `drm_gpuva` and `RawGpuVa` have the same layout.
+        unsafe { &*(ptr.cast()) }
+    }
+
+    /// Returns a raw pointer to underlying C value.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::drm_gpuva {
+        self.0.get()
+    }
+
+    /// Returns the address of this mapping in the GPU virtual address space.
+    #[inline]
+    pub fn addr(&self) -> u64 {
+        // SAFETY: `self.as_raw()` is guaranteed to be a valid pointer to a `drm_gpuva`.
+        unsafe { (*self.as_raw()).va.addr }
+    }
+
+    /// Returns the length of this mapping.
+    #[inline]
+    pub fn length(&self) -> u64 {
+        // SAFETY: `self.as_raw()` is guaranteed to be a valid pointer to a `drm_gpuva`.
+        unsafe { (*self.as_raw()).va.range }
+    }
+}
+
 /// A pre-allocated [`GpuVa`] object.
 ///
 /// # Invariants

-- 
2.43.0


