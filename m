Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5933A386429;
	Fri, 31 Jul 2026 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529863; cv=none; b=iONvItI/5CQcUE+82ruZxUck6/oSEge5tbbn/iXamnweJYHycqikRv4ei5s0mBUV+zRRuCoTG7xN9KDgBPkXCFCLZdjFy53YLFNYNSNrMYEJLmrl67mSv/DxqWJWPMTP4ogr1rZb+DlxndRaBYq8IAjBAGNqJey+0k90li07pHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529863; c=relaxed/simple;
	bh=Zq44MwbXDOcOoz+Qfz1RwXEda/JiiBqyhD5TdIogL4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WnukYabG536P5T/mLYpEbxe/1F81dsKB4zAYTxe8fuPhwFEgVDBtbkWWqs1JX/wG8qURuBTDb1etjxpjM+XpEpj23Ox63L0UHNtG0nVgagsRK2Tn1ImUGSQRTpoHtpgBFpC7FoWoNoBDYflN+L+YlWMaFebQCBp/MgC4cIpJ/Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fL/1Nql0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fL/1Nql0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE07F1F00ADB;
	Fri, 31 Jul 2026 20:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529861;
	bh=7VuPgpz4qMdyLp6c1Eec/Wedh3mG+ZmpiyvkZ3oX17s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fL/1Nql0f+h1DVjDCCq40di0VoaSHDI85+DHRCv/buhikoVM8zGVOb3TPP4fdB0Le
	 Lmq68Er4I8zkfj9CYgqnwj1y3zkjxUZWhOKVSy2d91iEX53pwzgK6Wil5eQc15fXeh
	 oqC1S0+lOhpNJIkq57tzmztScVmD1+w90gvuMcZZbsUlJMCa2lVzDeP+TRNiku5sdT
	 6S4Z1f7zw6IW4HDeDxOVgcAT2M4dKCv8sVEWDoqaRMbOx1nkd3DSBsvTo824k09oew
	 zU2xFL2Sv/BifOGgNiPX3J6BMCibatMfHe0d3IBpR7FF16Rx2wLGhaynRLHWkVDdvh
	 UJS/a1NWXyx7g==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0839BF40077;
	Fri, 31 Jul 2026 16:31:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 31 Jul 2026 16:31:00 -0400
X-ME-Sender: <xms:AwZtajPx7jR9aV-kw4CtKnoloXEGwgKB-yBX7rr7yw1KK4WeoGxpjA>
    <xme:AwZtapLCc5vUA3UvQkiQeDgDSUwkA4rWJx46TQfblTVEyQwLOa5qc8lh76qUCwhMq
    ng_JM-NBXjAFwu4_1zFGkS6D1JnwysaiCnkvSCr72imLV_vL7H8RbQ>
X-ME-Received: <xmr:AwZtamGC6Weu9f6coxLa26ZPgWfd3Tf_ego0K6Wqupvma9Xqq8lT8ksJ9oYu_P7s3_PkJmhL3Rv1lO0svZ4uFkxD3YgAC-QZ>
X-ME-Proxy-Cause: dmFkZTEWpnubMTgFvO8GUjRBMncK13/AJQfdv9iqwcIEXvBf+u3+nTD986gctK6cJQuSpa
    nAueWKjs/UUb145eUguWg26p1szdm87j0GTWXbRTLgDPU3op3LOZvWryJHZrX0hpe+yTkz
    u3HIKpzQggIeejA0plSt7O29WoQ9Za8ROWFr88iLOKW68eIlszrjGWvvR/lBHSR0HWQsD9
    HRyKpzcT9P0hGBQKgyFUQrBwb1GX9ijM7UyL5Md8UvHEgbjHbf7rmGKBl7KLy8tQRM6vWf
    gZ478lopPE44VNsCTUy32ohOlAIHeJ6n0VJQvt8VBUd3JafJ8bDUl2vjGZis7/X1s6A2Y3
    BB25vPx4EMonDgKFbPi0t0ST0C450mbhzgnQWIbul8dgqVOR6A2e3A7zKB0m5E97k6WexL
    cuZF/snUBBAuAtbrICmmeNJA0X6mk31Z+omAl0YlLU+JQvhbe3idUEX0YuiCZHuPczzmjh
    8MehyfpnzOIo8/WT6kw7i3rcHnEdeOSmv6sew9r2fcFivTy5yDghHVOHFbOIuw71jybDOa
    oQdp9/Lqorr+rLW0/Sclqe14Bpr7gmRk50NMSiL/opzS/3WBXiCWZNDhfrUp8DGKJLnhl1
    wyqtAAipkL6oxpdJINApDQ5m3aagPneirj1xcLJ8F/o7Jxj+VuUyNKeZkGDQ
X-ME-Proxy: <xmx:AwZtaiCvqDd5yYO9aznujhDqQIZUq48unQdLkRAw6_VJs_NZiIUeCg>
    <xmx:BAZtao0aKx8leJBD4KEdbsQDBRvIzAirUqifkYDbQVrL-m2ElvWeqg>
    <xmx:BAZtanOeJnmadjsVoOraWMUZh1VuKKvvm5iGfGmcERRFV0x99TP6lQ>
    <xmx:BAZtat6HFV0ScpKmDUTQedzIPuZMdUvXEtW6qkjHLqI6mzMcvUC1nQ>
    <xmx:BAZtasbpxYFGFubv1I_4mlssALqk-5VlmqHaIDTlqhFOIzyzCtVopg_1>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:59 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH 14/24] rust: Introduce interrupt module
Date: Fri, 31 Jul 2026 13:30:15 -0700
Message-ID: <20260731203031.13679-15-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lyude Paul <lyude@redhat.com>

This introduces a module for dealing with interrupt-disabled contexts,
including the ability to enable and disable interrupts along with the
ability to annotate functions as expecting that IRQs are already
disabled on the local CPU.

[Boqun: This is based on Lyude's work on interrupt disable abstraction,
I port to the new local_interrupt_disable() mechanism to make it work
as a guard type. I cannot even take the credit of this design, since
Lyude also brought up the same idea in zulip. Anyway, this is only for
POC purpose, and of course all bugs are mine]

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Link: https://patch.msgid.link/20260302232154.861916-2-lyude@redhat.com
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 rust/helpers/helpers.c   |  1 +
 rust/helpers/interrupt.c | 18 ++++++++
 rust/helpers/sync.c      |  5 +++
 rust/kernel/interrupt.rs | 89 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs       |  1 +
 5 files changed, 114 insertions(+)
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 998e31052e66..0d85b5e68ec2 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -65,6 +65,7 @@
 #include "irq.c"
 #include "fs.c"
 #include "gpu.c"
+#include "interrupt.c"
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/helpers/interrupt.c b/rust/helpers/interrupt.c
new file mode 100644
index 000000000000..51b319bd4c00
--- /dev/null
+++ b/rust/helpers/interrupt.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/spinlock.h>
+
+__rust_helper void rust_helper_local_interrupt_disable(void)
+{
+	local_interrupt_disable();
+}
+
+__rust_helper void rust_helper_local_interrupt_enable(void)
+{
+	local_interrupt_enable();
+}
+
+__rust_helper bool rust_helper_irqs_disabled(void)
+{
+	return irqs_disabled();
+}
diff --git a/rust/helpers/sync.c b/rust/helpers/sync.c
index 82d6aff73b04..4f474fe847c4 100644
--- a/rust/helpers/sync.c
+++ b/rust/helpers/sync.c
@@ -11,3 +11,8 @@ __rust_helper void rust_helper_lockdep_unregister_key(struct lock_class_key *k)
 {
 	lockdep_unregister_key(k);
 }
+
+__rust_helper void rust_helper_lockdep_assert_irqs_disabled(void)
+{
+	lockdep_assert_irqs_disabled();
+}
diff --git a/rust/kernel/interrupt.rs b/rust/kernel/interrupt.rs
new file mode 100644
index 000000000000..667a3bd329fb
--- /dev/null
+++ b/rust/kernel/interrupt.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Interrupt controls
+//!
+//! This module allows Rust code to annotate areas of code where local processor interrupts should
+//! be disabled, along with actually disabling local processor interrupts.
+//!
+//! # ⚠️ Warning! ⚠️
+//!
+//! The usage of this module can be more complicated than meets the eye, especially surrounding
+//! [preemptible kernels]. It's recommended to take care when using the functions and types defined
+//! here and familiarize yourself with the various documentation we have before using them, along
+//! with the various documents we link to here.
+//!
+//! # Reading material
+//!
+//! - [Software interrupts and realtime (LWN)](https://lwn.net/Articles/520076)
+//!
+//! [preemptible kernels]: https://www.kernel.org/doc/html/latest/locking/preempt-locking.html
+
+use crate::types::NotThreadSafe;
+
+/// A guard that represents local processor interrupt disablement on preemptible kernels.
+///
+/// [`LocalInterruptDisabled`] is a guard type that represents that local processor interrupts have
+/// been disabled on a preemptible kernel.
+///
+/// Certain functions take an immutable reference of [`LocalInterruptDisabled`] in order to require
+/// that they may only be run in local-interrupt-disabled contexts on preemptible kernels.
+///
+/// This is a marker type; it has no size, and is simply used as a compile-time guarantee that local
+/// processor interrupts are disabled on preemptible kernels. Note that no guarantees about the
+/// state of interrupts are made by this type on non-preemptible kernels.
+///
+/// # Invariants
+///
+/// Local processor interrupts are disabled on preemptible kernels for as long as an object of this
+/// type exists.
+pub struct LocalInterruptDisabled(NotThreadSafe);
+
+/// Disable local processor interrupts on a preemptible kernel.
+///
+/// This function disables local processor interrupts on a preemptible kernel, and returns a
+/// [`LocalInterruptDisabled`] token as proof of this. On non-preemptible kernels, this function is
+/// a no-op.
+///
+/// **Usage of this function is discouraged** unless you are absolutely sure you know what you are
+/// doing, as kernel interfaces for rust that deal with interrupt state will typically handle local
+/// processor interrupt state management on their own and managing this by hand is quite error
+/// prone.
+#[inline]
+pub fn local_interrupt_disable() -> LocalInterruptDisabled {
+    // SAFETY: It's always safe to call `local_interrupt_disable()`.
+    unsafe { bindings::local_interrupt_disable() };
+
+    LocalInterruptDisabled(NotThreadSafe)
+}
+
+impl Drop for LocalInterruptDisabled {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: Per type invariants, a `local_interrupt_disable()` must be called to create this
+        // object, hence call the corresponding `local_interrupt_enable()` is safe.
+        unsafe { bindings::local_interrupt_enable() };
+    }
+}
+
+impl LocalInterruptDisabled {
+    /// Assume that local processor interrupts are disabled on preemptible kernels.
+    ///
+    /// This can be used for annotating code that is known to be run in contexts where local
+    /// processor interrupts are disabled on preemptible kernels. It makes no changes to the local
+    /// interrupt state on its own.
+    ///
+    /// # Safety
+    ///
+    /// For the whole life `'a`, local interrupts must be disabled on preemptible kernels. This
+    /// could be a context like for example, an interrupt handler.
+    #[inline]
+    pub unsafe fn assume_disabled<'a>() -> &'a LocalInterruptDisabled {
+        const ASSUME_DISABLED: &LocalInterruptDisabled = &LocalInterruptDisabled(NotThreadSafe);
+
+        // Confirm they're actually disabled if lockdep is available
+        // SAFETY: It's always safe to call `lockdep_assert_irqs_disabled()`
+        unsafe { bindings::lockdep_assert_irqs_disabled() };
+
+        ASSUME_DISABLED
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..2ee6c24d39c2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -82,6 +82,7 @@
 pub mod impl_flags;
 pub mod init;
 pub mod interop;
+pub mod interrupt;
 pub mod io;
 pub mod ioctl;
 pub mod iommu;
-- 
2.50.1 (Apple Git-155)

