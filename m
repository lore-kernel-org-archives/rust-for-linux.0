Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E73BB682
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086170; cv=none; b=LjASPaHIpkgJPOMevwbP+Ltv+LKs08z6POZKO2N5VO/Gfusp4pmAurtjLIc+W0odeQ5IHl54IG41Kjr64VnfYClNsUAQUJQHeylt7KzM0iqRb/F4S8FG8Qfa4AYWcQ+Kui0bESQv0OUiJe2v6Zc6o7Nr4SZEmqBGP0uTzGjiUoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086170; c=relaxed/simple;
	bh=PwsYruj68uHekcgGg2+D0S/5Y1JU0FvXwh9yngRw4wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M9QODpAm3JR8znJdMy/CxjztV8+ppeZY9SKxd7DCeYTcioYGi1aRy60z1wNQSuOG0XqIuYvi98lyvRU1/QlqyItbLXHM8uSpc3dmULzGjna82QRH5OorPDezVEvAeHcNMEWhEkP3F+pIBRzA1qOdcQqcQrTdjj9xxR2oJCLfYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVtVisqu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVtVisqu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A541F00A3E;
	Fri,  7 Aug 2026 07:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086167;
	bh=c1gjxyEZxiWV+lR91hdPXb5LqwKRvifjfGHEayyotg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CVtVisquvWFt7l5b8RIUBlZo4UEbo+VsgUOEIIVCX+bUBnhS5JbaZLJuWYlqOz5ZC
	 MaZApJZhS73GWw6aJO3Es/EyI0LGad2gR9quo+Uy21m6qun6Ri9UAykc9nZCHQJ2ol
	 PgMOS945ns8fUisxT6fU1DSP2X2UgtC5IejtH7fLtl1ymu5lKe260coP4nI9Wlbwcv
	 9M+0Q26MPd6WM8O0PelenGpT+ez7E7S4H3QBEILGOUSP8cpI6mbUQlhhS7NUxkNn9k
	 e9AuqJMO+E4gYSnQdGXfeu4QU9g/+5+xQBNsonhJwJ3IFqEYuyR/HdCt00CnmJTI9A
	 axjDxSPFxG28g==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9BCB9F40066;
	Fri,  7 Aug 2026 03:02:45 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 07 Aug 2026 03:02:45 -0400
X-ME-Sender: <xms:FYN1amA7AImviQM4fW7SvbywEEFEQNDs9Pzg9hT7GMDkuu0fftgNFw>
    <xme:FYN1ah_a4DgDiDYnknFmFNJflv_y7OFgGIOTE22EswpzbhbepJOYcrr-CeXejrqd2
    iF05KjnYbYouEprRrFFT8-P0K4bO3NCMI0nFVfiLIYGuk1RA9_Fig>
X-ME-Received: <xmr:FYN1ak_x_lbO16xVHhaN6hTiR-lAmz3m9UpF_Ds_PjEUzXk1w-Z_4vzChxLOYIeKayphFDgsLZV4LxEeLchQNKw6gB_-0YfM>
X-ME-Proxy-Cause: dmFkZTEuIF4BJa02ksz8c6+pbNx+CfKbVvckvqNdWjG0w+J3eOeY4gZPEbHYkHV280IqRE
    6CqIVUxK++7rrTQ6KafE3stMxcgHcXTICSkvp/Gm4Pvrjo+EijkyqZYBiiJ3/n6ho2JJoA
    +z3LEyMMLxnmrvsM8jv7r6QLHuhHe/gVjBCG/U4y8+GBsKMbxk4mVZHM/4KkYYuddOHp5+
    c/w7tykyKr75BCb/YMDMzDMDkmcosbnKNvsPeVKdUx+gCCQcP5I1LkxVO7ESqqV2bHBFVp
    KNlm7eXd5pjuMrlENKGqMcjUt8/3KBTC1wQGBwxnYDR1wKNHQ1uSZR/kSxISILnA/QHkcU
    XfLd2ul9etVTXhY7dfDAJlITZUnNJOKl7xLWqK6sL2bTy5NQVYVfu6rm7zMbbK+SS87ljI
    /cwCN8dAzYkJstIRvwSikL0UAm3dhQb3lkuKdUKwh8JOwGlZayK3NP/JtckLdJ0PlRmjpW
    YjJWGsU8BSdjIh0Mu6ht4o7R25XRUJ6GtP4rQeZj1RaosmRx0SRVMRgtYNWs5s4ticqenh
    KXABTzF+LBlJ8EJbm6lODXKrsJVzbEeN4xqPsOuh/KS/ugaGmrKqoqZMGQMrLppaci6xe6
    j7tEX97a/7KcVUSHK7HsEJq4RSHC2bzHUWn7zm9oZeNYVBu7OJ3DFZu1wAPw
X-ME-Proxy: <xmx:FYN1ah2tjCidh7XhDk9b74y8qrG6_mxs55dIO28kk5vPCpgyn9kZ_A>
    <xmx:FYN1as-a--Ao13OMwnRqn4m1DZctkweNdyjokKX-0kB0w_JzwEsEtA>
    <xmx:FYN1aqcsV0QG721fhooIQYmKGEZrMfCWhGFguEFGjegwrPrxxaB-mA>
    <xmx:FYN1agFcM0NbjYvzwFRXKnWmnTTX_cP8JYXiM5s5CVP5kInE81-8gw>
    <xmx:FYN1anD5hnkLXveZGStby6AA56Tg1jQWKerNkYU-m1wI0Rjms_FkjkSb>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:45 -0400 (EDT)
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
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v5 14/18] rust: Introduce interrupt module
Date: Fri,  7 Aug 2026 00:02:11 -0700
Message-ID: <20260807070218.27144-15-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260807070218.27144-1-boqun@kernel.org>
References: <20260807070218.27144-1-boqun@kernel.org>
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
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
index 000000000000..a880ec3b8538
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
+/// doing, as kernel interfaces for Rust that deal with interrupt state will typically handle local
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
+        // object, hence calling the corresponding `local_interrupt_enable()` is safe.
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
+    /// could be a context like, for example, an interrupt handler.
+    #[inline]
+    pub unsafe fn assume_disabled<'a>() -> &'a LocalInterruptDisabled {
+        const ASSUME_DISABLED: &LocalInterruptDisabled = &LocalInterruptDisabled(NotThreadSafe);
+
+        // Confirm they're actually disabled if lockdep is available
+        // SAFETY: It's always safe to call `lockdep_assert_irqs_disabled()`.
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

