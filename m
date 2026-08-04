Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4545A4749C9;
	Tue,  4 Aug 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860124; cv=none; b=XShtnKHknGXjj1FpT9o1oaMPspRy1CvWJszCs7zp/3Ds60d6nCoJE1XdETMG4NHHo+Z8BgD2muMd4y2Snex/e5h2ID2sRBcpP/In9DcX5SETrxr7eCI6ZPsA0d9be89smOxqGN/TFfWaO0rN1bu4WsVkSIum2tJxMawHbGLN7E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860124; c=relaxed/simple;
	bh=PwsYruj68uHekcgGg2+D0S/5Y1JU0FvXwh9yngRw4wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6KtJusftZTANeSzpEOF2CPF1pCR7/xjKDU8usNN90SoPKpEGw4ag27i1yFJ75PZK7o2i0YgQQqRZC3lKlFGKf0FqoOBPmS4o46O/eVNDZl/AMXaTS3loe6HyNUWGWjRqWSPIiWsJFPW6rU97DnMgamUrGnusLIFuxBy+v5u0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaJt/orZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaJt/orZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4ADB1F00ACA;
	Tue,  4 Aug 2026 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860118;
	bh=c1gjxyEZxiWV+lR91hdPXb5LqwKRvifjfGHEayyotg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UaJt/orZq8aoIbSdAceGioNxglD9TvN90gVLFeGrxXURe4akIozM89u3Jj+hPL/B9
	 +X9q1jjfzODB6RJwTXGIviIwgruIKMnzsjtL5zxvfbU5sDpSgN5uvS3e7kiyTUI6if
	 Ihlgedw2Nv/T6FV1riPhL3rmyQIb3yAzkBkfgb+42Tj/cZexLiHgNW/8POdqFTWlYV
	 W6/uWKI3tVEzoWzKRVAV0F7jC19Qch8FhLpuH0EWxCLeWzc0dcQXsXsYV0vx2zeG1m
	 WqLNLgSRfFnshsgnGixCqSVuR0EVwgTYVtVcVd2BfrlH+IbsZX/H5HpaOwHdTxA/us
	 4qTe/ns4S1krg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0D043F40066;
	Tue,  4 Aug 2026 12:15:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 04 Aug 2026 12:15:17 -0400
X-ME-Sender: <xms:FRByajqlux3m0SLZkWRIT34-sr42P9AYOnjlIhThio1iuWO51dooLg>
    <xme:FRByalNFYTP4_T8Ej26s5LnY6DXfEdBoV3W6zQYFXnot2Dl6pQGlGGHUuLnguyWsC
    BGb7TmgzVMcuYytmZJgRCjlnOlPV-uHjofpOE254l3oQzHkiGOfsw>
X-ME-Received: <xmr:FRByav0g4kEXDItU5L-fJEQyx0At-N0PWyid02GjX8FwwwqUNM8mSKoV3O4dPkvJrOd8BJnJisABLOyWtLSfoLV8fxp-zszk>
X-ME-Proxy-Cause: dmFkZTGWpEpVyD1Wq7sf3aa73PVngtFiTOqR7nSVa+oR1a+xJBvuLB19FlSyZiPSqaGnqf
    mTcGiPEwbNDRyzULygS0C0KFc2nTddz/nikK5FiLrHcDr9T83+robkxqRQWCb8N/L7hnkX
    N5/7H2+B643pHh/o1C9v0il+2uw03O85e9l8+KDALGBfzRohermLGx6emmOwP2LXFvgKKY
    OqlnPWwi5FJDcrW9D/xIuH5dIUKdZj4Dkwn9DeYZtiLj0I9mtPOvnue5AmaiYISqY27LEo
    va8TSK5sGOUc1Q5JONq34xK6ShiWmU0CZpEvIgBamhBWd0KAMVNFKCaRdTjjwvXc8L2HCq
    ST+ShJJ5oOjOAXxpyK0fgEOIn+q3Q8nRPbrv0C6v6xorcBVX0/TbibmXLSbPioHwSLMq2/
    n4jU3T8iR+fqJefx8MMIZIwE39lUUBuYdvOE1+vq01XhnzkT49Ji6LVY3hnjVDhUDBJMZq
    PdWjDyyJZsfCfr5Dtbn6ruLHld1VI4RmbFwx+s3BTb+50COli+nwbKxLjo1S1VnS694Bc2
    i3hfAWWkiP0VTz1VDMhY8DkurjQK6CWiRMgkie+QXjnKHQ9w71ellyOm/LVSjlOIo4FDHd
    7cVyqR2U3q14ByPO2ruCO3Z5KU2dC3tvLVRV0R3iOQIkMI4QFT9pDJhxhNag
X-ME-Proxy: <xmx:FRByajq52rmupmsKS0DQmeJMUvDacBUSvVR8USU37Exem0Y9en0RmQ>
    <xmx:FRByapeBVMYcu3WiR_e8KiZxxf5dW6uCXUXQrvmCrJ2PFvvS5Or_cA>
    <xmx:FRByalsVI6exsCyCcZfrCawmH-90MjQiyue-weUHlmQmb7GYU1Io9w>
    <xmx:FRByapX1_766Mb9UKIU3mpd-ZK4_Ci5xFs1nwdLAQ_LCWiM4oSXAyQ>
    <xmx:FRByai-6YbYRpkO8hfyGsD8-poTxXZMIJec4Nmny96YbyoNdMerJNGxh>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:16 -0400 (EDT)
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
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v4 13/17] rust: Introduce interrupt module
Date: Tue,  4 Aug 2026 09:14:35 -0700
Message-ID: <20260804161447.84806-14-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804161447.84806-1-boqun@kernel.org>
References: <20260804161447.84806-1-boqun@kernel.org>
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

