Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709187;
	b=KXc9rlaRWqOZ6bTw9LvzndQ208FwAD1DWDxpY6SJ+GgZ927gnqQcFCTOGz9WDmtuYPI/
	 pkfa26cl6lcL6XYeL/17OD/OsqHQn4sDWvbCFRUlKb3l9UVV8FOL0XPNHY/HE8pjnYuJq
	 oP/cbU7RT/WnhYgcqK+K6GS9+7cqHoHFr4qVfjoOIsWLPTcnvoyJtfLFUc8K7eGvSgS/J
	 xd2o5IUJEoG5/xWikX3+viqwUXHOGwI2pqfyAKms1tz4T87vewViUg73L26PcnWSRqV3Z
	 Lxie+w5B2EBz58uYG0/neEjZzge/mwLMtfR5NrgyJCiJ8xpt9M1GqlrRSed6rmZp8sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709187;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=l5OYIe75wHzFRIOHh0kfNH2rcb0KVmBnsaIGoSidDr4=;
	b=RksIDBq9TTCwRQFKoxP/YmnRAMCijqtHscPRT9RhRzDgcTeVVPw5xGZMzMvnL/Rst+rD
	 rB152jWdMGva7elNZARITj7e0eZJjDLA1OZRNPfvbCsUkoVGpOkR8+2Z4YUpLNCX6CM2y
	 HfvaN9yIAdvoJXi4d8lS44Yr6sCuW0Z9GeFSYLzFh4vu+0ErK23YfrWpkkgBmHUMa6JvS
	 O+conlDJK7ppOEfU6Dx1viW/GWIAt7g29N7j2AT/4fajZ/w9Y1CWZ1T4LfViFUvcl0zwI
	 gY51ydMEyIaQlTBbPu8DvoJgmsHz2TDltPxtQAIfIZE2RH7eSOu9Hlkkhg37GMbn41A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=C5bVt5Ml;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B2B606A31C;
	Thu, 26 Nov 2026 16:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B2B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=C5bVt5Ml
ARC-Seal: i=1; a=rsa-sha256; t=1795709105; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ugpy+eup+rDqcYyfdyVCVfMxMbbC3rTYNPRuyLXGTzz4HbO0ZdfwrjGUjDGq6i2DkExqTmwxY5WOxuReBFziai8Mg5PY9FGTl2ezNklxwIQv/iVSWug+SUr/I5ynE9NC7NekPtv16OFk3WINqNQKJ93J66vuD8K+wD0L/jmw2Hc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795709105; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l5OYIe75wHzFRIOHh0kfNH2rcb0KVmBnsaIGoSidDr4=; 
	b=bvD+3HGHzs059X4MdyeIFqMbmqur7BWxz0kNQrUfJCOyybhxDm7rymTcuhFXjGI+ERmyfJrbaJ9L/tqnu/4eIsllNxwUquyOWLfPvXkvjlEpudVHs+yWsZzGHgaunljjpm8TQ6bsTcjBfnFL+dalNHcVYbNQYSU8AtHgGSC8vWY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=C5bVt5MlJfuVjfJ8Qc7sNCg5plkyjKo7LO9yYILyO7pCqy77LfbXYu74K1bBTRbrUQPMuJTdie9slxouINyHQYVa5vSdIjZroAjfpNQb2XA4a3/WXqrLj7AuSGZrJ5gx3yuCX9lklVRt9aIXYcf861ujbIophPhOZpSUwoWD7iY=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=l5OYIe75wHzFRIOHh0kfNH2rcb0KVmBnsaIGoSidDr4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795709104416312.4345849624442;
	Thu, 26 Nov 2026 08:05:04 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 26 Nov 2026 13:04:31 -0300
Subject: [PATCH 4/7] rust: reset: add AssertedGuard
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-b4-rust-reset-v1-4-9c4c3d029080@collabora.com>
References: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
In-Reply-To: <20261126-b4-rust-reset-v1-0-9c4c3d029080@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

Some drivers hold their device in reset for a short time while they
are bound.

Add ExclusiveResetControl::assert_guard() as a convenience for them. It
asserts the reset line of an Unknown control and returns an
AssertedGuard that deasserts it when dropped, so the control stays in
the Unknown state.

The guard borrows the control mutably because, unlike regulators,
exclusive resets do not have an "enabled" count. Therefore, allowing
more than one guard at a time would not work, as dropping one of them
would invalidate the other while it is still alive.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/reset.rs | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/rust/kernel/reset.rs b/rust/kernel/reset.rs
index 7ca83f2d6abf..3bbd226825d8 100644
--- a/rust/kernel/reset.rs
+++ b/rust/kernel/reset.rs
@@ -12,6 +12,10 @@
 //! A driver can also get a single reset control for all the reset lines in the `resets`
 //! property of its device. Its operations then act on all of those lines.
 //!
+//! An [`ExclusiveResetControl`] in the [`Unknown`] state can also assert its line for a limited
+//! time, with [`ExclusiveResetControl::assert_guard`]. The [`AssertedGuard`] that it returns
+//! deasserts the line when dropped, and the control stays in the [`Unknown`] state.
+//!
 //! C header: [`include/linux/reset.h`](srctree/include/linux/reset.h)
 //!
 //! See [Reset controller API](https://docs.kernel.org/driver-api/reset.html) for more information.
@@ -381,6 +385,24 @@ pub fn assert(self) -> Result<ExclusiveResetControl<'a, Asserted>, Error<Self>>
     pub fn deassert(self) -> Result<ExclusiveResetControl<'a, Deasserted>, Error<Self>> {
         self.deassert_internal()
     }
+
+    /// Asserts the reset line and returns an [`AssertedGuard`], which deasserts it when dropped.
+    ///
+    /// The [`ExclusiveResetControl`] stays in the [`Unknown`] state, and it cannot be used while
+    /// the guard exists.
+    ///
+    /// The line is asserted with the kernel's [`reset_control_assert()`].
+    ///
+    /// [`reset_control_assert()`]:
+    /// https://docs.kernel.org/driver-api/reset.html#c.reset_control_assert
+    #[inline]
+    pub fn assert_guard(&mut self) -> Result<AssertedGuard<'_, 'a>> {
+        // SAFETY: By the type invariants, `self.inner` is a pointer that a C getter returned, and
+        // `self` owns its reference.
+        to_result(unsafe { bindings::reset_control_assert(self.inner) })?;
+
+        Ok(AssertedGuard { reset: self })
+    }
 }
 
 impl<'a> ExclusiveResetControl<'a, Asserted> {
@@ -423,3 +445,63 @@ fn drop(&mut self) {
         unsafe { bindings::reset_control_put(self.inner) };
     }
 }
+
+/// A guard returned by [`ExclusiveResetControl::assert_guard`], which deasserts the reset line when
+/// dropped.
+///
+/// An error from the deassert done on drop is discarded. [`AssertedGuard::deassert`] deasserts the
+/// line and returns the error.
+///
+/// # Examples
+///
+/// Holding a device in reset for a limited time:
+///
+/// ```
+/// use kernel::reset::{
+///     ExclusiveResetControl,
+///     Unknown, //
+/// };
+///
+/// # fn restart_clocks() -> Result { Ok(()) }
+/// fn reset_device(reset: &mut ExclusiveResetControl<'_, Unknown>) -> Result {
+///     let asserted = reset.assert_guard()?;
+///
+///     // If this fails, dropping `asserted` deasserts the line.
+///     restart_clocks()?;
+///
+///     asserted.deassert()
+/// }
+/// ```
+#[must_use = "the reset line is deasserted immediately when the guard is unused"]
+pub struct AssertedGuard<'r, 'a> {
+    reset: &'r mut ExclusiveResetControl<'a, Unknown>,
+}
+
+impl<'r, 'a> AssertedGuard<'r, 'a> {
+    /// Deasserts the reset line and consumes the guard.
+    ///
+    /// The only difference from dropping the guard is that this returns an error from the
+    /// deassert, which a drop discards.
+    ///
+    /// Equivalent to the kernel's [`reset_control_deassert()`].
+    ///
+    /// [`reset_control_deassert()`]:
+    /// https://docs.kernel.org/driver-api/reset.html#c.reset_control_deassert
+    #[inline]
+    pub fn deassert(self) -> Result {
+        // Skip `drop()`, which would deassert the line a second time.
+        let guard = ManuallyDrop::new(self);
+
+        // SAFETY: By the type invariants of `ExclusiveResetControl`, `guard.reset.inner` is a
+        // pointer that a C getter returned, and `guard.reset` owns its reference.
+        to_result(unsafe { bindings::reset_control_deassert(guard.reset.inner) })
+    }
+}
+
+impl<'r, 'a> Drop for AssertedGuard<'r, 'a> {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants of `ExclusiveResetControl`, `self.reset.inner` is a
+        // pointer that a C getter returned, and `self.reset` owns its reference.
+        unsafe { bindings::reset_control_deassert(self.reset.inner) };
+    }
+}

-- 
2.56.0

