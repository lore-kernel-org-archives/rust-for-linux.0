Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD0394793
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529876; cv=none; b=NCSXwamRWB9eicxu9CyfphZUWRBabVGa4XzhklCYu9WcAIWbyhtEJnNVg5R5bILYO2mnsY3XsSLbgTixPr7zPzCVLXi7Ck2gl3EM8ITeW5WxA1WhXZkupiuP7kmMu7HmW/V3OKR30z1zNamLHpeFBHzU6pNWC7VgQSdOxa+t8ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529876; c=relaxed/simple;
	bh=BnZY+ssx1FNk1UN/oxDrG+BGtBCN1VUyUUnZuJBcyTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDkhvk24T8ZwDr9MnWMlXSeTdBQUcY9AaH4/Zl/osFTlxSGZDHTu86cDnhtv8uPJ2x3sCLo8y7UJRek9XooWY6FrfY1Npa/UC+tOJ9n2QwDhcMvK5h7KOu2OLKGBV2V0XVYz6yqP9zpvapOXiCMuqcqWd9Ns4feUTYpe+e/B4mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTzEUwxn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTzEUwxn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A651B1F00ADB;
	Fri, 31 Jul 2026 20:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529875;
	bh=ee35tIBuiy+GnxuKIVMP3Asj7TkW4wEaj81yaDPH2Yw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZTzEUwxnno6uRD24iznbybhVEyK6LadMYqj3meMYLyPhPjA6sZkSBBDK0OaeuCOzG
	 24ofHrw/UaaWQPa3Qgq4GxlBny273vSWFLLARt2FGE46f4SVGBIzM8QgGKoJE+Ccob
	 jvxy5rXX924T5eyUhmIKmu4KMgPeDuQl3RpIbyQmyhfChBUp0tznoI/h95AYcHQW+h
	 KWNtxKBZrbFE2E09It5swGeu+hajWoPZmb33T+hpfn+t0vvX+/sS1jTuyLlaTw07ti
	 c+oaT7xTWBJWLrNs6sSe8eCWz5ViZitw94L8NkAS+E82qZkduBuzuG4d0X0Q6gJMI1
	 NoeBl3AtvVwYA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id D4F6CF4007B;
	Fri, 31 Jul 2026 16:31:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 16:31:13 -0400
X-ME-Sender: <xms:EQZtamC_xCu4fdZjCFbCpStLsrK6AZTYtc7qD8DeVF4X2eaYNrPPSA>
    <xme:EQZtalsDtkMH-_R7Tye1GkOPF8DJpdFJxqYea7bwrEN0prpQL8_-JvabCn4_ChluW
    XEYP8LdCuHJ0eoLfo7T3wNWX85KRE6a1VIZpsUUcVBRu-nh2OzQrQ>
X-ME-Received: <xmr:EQZtas-30XyAGIrGo8-fZh5cgTQ0At8Xf2c44qibNpFj3gb5L8nFj5Bks84sm4RNg1qFqW7J5oa6_2aAxaJhDnvDZXkjkaK7>
X-ME-Proxy-Cause: dmFkZTEbBIfeSlo9prBcK5SQKPeqygxB1v/cLTVgZ5l5/ASlZ9vahSgThT0iqkqsNP7FqK
    9zw6YF1XG3UNmEM3u6nsEDmLcFtKi/7cfe9xQqiaIubHunNfY02XRK8wlY6K0FXtf9SRo/
    1VhrSN/M5RNZuHROCh24ulCrPMyClee0/fhnnz4fOUOZI3q/RLZ6x47wJ8LNHHXBj1sqg0
    b5NEuj6hbqItE5byv8n020XMXAOwtwYIaLnMGB3SEjNqrhWWOtqs6CUvr8EJZH2Eus7heN
    HM0Lm9s3y2ZTjZXTsYc0ZE4AKwqpvayt6n7d2o32foshM6FX1uxJb77wm/zD1mFUlsqeFO
    BH1yQ7M16W+COuLmbkYrpywWYFxLYn1MsVfNSkehl1kbBbS5aSCV9DZODkwyx8HBrq2M2T
    OwZO5o6kx3UD1/PYVo4ZHjY92hv7+0X0VsPIslkiBQ/QboJ0GRYyH9lx/1OI694XfOu2aK
    bSwVQVwlVWEStRbQb7H+uGtFB25JCAViVYAMW1ArzEilw3rzBhdbpbl9LBIPm6EuANrdS2
    lPdYSfEg5cub4rVa+KOnWQsZpPqLlG53vfzxx9q4ZccNnPXc6/Z1hJA/itJFNilqJ69ohK
    cLguu45uKprn3Jytr5v1tnbiq7aNnSaJtgjh8YH/ojjMPJmN2JS7OdwWcOCg
X-ME-Proxy: <xmx:EQZtakR8YSMoVsD_6c8LAf6u5oJxzmotAqqBnurwwnpg9pL881qRdQ>
    <xmx:EQZtamWUUg80NAlq6Rltwh9G2ldLVMfb3Set2WQHJV7FLECQ2Y-LdQ>
    <xmx:EQZtau9seFtbOYBkkczY-4d7cs3uXDOabaA4y-wM25_itL-8RIprtw>
    <xmx:EQZtau2sNBXQ3bRRDDfQMmOWiKY-GEajxSztgHXI4u-pyz6cytLQDA>
    <xmx:EQZtareje9KsL-8WgzGLjITLwNbtrJBJwTBodfKOM3k-g9ELXFdXe-uh>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:31:13 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH 23/24] rust: sync: Add generic memory barriers
Date: Fri, 31 Jul 2026 13:30:24 -0700
Message-ID: <20260731203031.13679-24-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Implement a generic interface for memory barriers (full system/DMA/SMP).
The interface uses a parameter to force user to specify their intent
with barriers.

Provide `Read`, `Write`, `Full` orderings which map to the existing
`rmb()`, `wmb()` and `mb()`. Generic is used here instead of providing
individual standalone functions to reduce code duplication; for example,
the `CONFIG_SMP` check in `smp_mb` is uniformly implemented for all SMP
barriers. This could extend to `virt_mb`'s if they're introduced in the
future. It would also make it easier if new ordering types are
introduced in the future (e.g. `Acquire`, `Release`).

Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260609-rust-barrier-v2-2-30fcc48e1cd0@garyguo.net
---
 rust/kernel/sync/atomic/ordering.rs |   2 +-
 rust/kernel/sync/barrier.rs         | 127 ++++++++++++++++++++++------
 2 files changed, 100 insertions(+), 29 deletions(-)

diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
index 3f103aa8db99..c4e732e7212f 100644
--- a/rust/kernel/sync/atomic/ordering.rs
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -15,7 +15,7 @@
 //!   - It provides ordering between the annotated operation and all the following memory accesses.
 //!   - It provides ordering between all the preceding memory accesses and all the following memory
 //!     accesses.
-//!   - All the orderings are the same strength as a full memory barrier (i.e. `smp_mb()`).
+//!   - All the orderings are the same strength as a full memory barrier (i.e. `smp_mb(Full)`).
 //! - [`Relaxed`] provides no ordering except the dependency orderings. Dependency orderings are
 //!   described in "DEPENDENCY RELATIONS" in [`LKMM`]'s [`explanation`].
 //!
diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
index 8f2d435fcd94..1180695d533a 100644
--- a/rust/kernel/sync/barrier.rs
+++ b/rust/kernel/sync/barrier.rs
@@ -7,6 +7,38 @@
 //!
 //! [`LKMM`]: srctree/tools/memory-model/
 
+#![expect(private_bounds, reason = "sealed implementation")]
+
+/// Memory barrier orderings.
+///
+/// The semantics of these orderings follows the [`LKMM`] definitions and rules.
+///
+/// - [`Read`] provides ordering between preceding load operations and succeeding load operations.
+/// - [`Write`] provides ordering between preceding store operations and succeeding store
+///   operations.
+/// - [`Full`] provides ordering between all the preceding memory accesses and succeeding memory
+///   accesses.
+///
+/// [`LKMM`]: srctree/tools/memory-model/
+pub mod ordering {
+    pub use crate::sync::atomic::ordering::Full;
+
+    /// The annotation type for read-read barrier ordering.
+    pub struct Read;
+
+    /// The annotation type for write-write barrier ordering.
+    pub struct Write;
+}
+
+pub use ordering::{
+    Full,
+    Read,
+    Write, //
+};
+
+struct Smp;
+struct Dma;
+
 /// A compiler barrier.
 ///
 /// A barrier that prevents compiler from reordering memory accesses across the barrier.
@@ -19,43 +51,82 @@ pub(crate) fn barrier() {
     unsafe { core::arch::asm!("") };
 }
 
-/// A full memory barrier.
+trait MemoryBarrier<Flavour = ()> {
+    fn run();
+}
+
+macro_rules! define_barrier {
+    ($([$flavour:ident])? $ordering:ident, $binding:ident) => {
+        impl MemoryBarrier$(<$flavour>)? for $ordering {
+            #[inline]
+            fn run() {
+                // SAFETY: barrier methods are safe to call.
+                unsafe { bindings::$binding() };
+            }
+        }
+    };
+}
+
+define_barrier!(Full, mb);
+define_barrier!(Read, rmb);
+define_barrier!(Write, wmb);
+define_barrier!([Dma] Full, dma_mb);
+define_barrier!([Dma] Read, dma_rmb);
+define_barrier!([Dma] Write, dma_wmb);
+define_barrier!([Smp] Full, smp_mb);
+define_barrier!([Smp] Read, smp_rmb);
+define_barrier!([Smp] Write, smp_wmb);
+
+/// Memory barrier.
 ///
 /// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
-#[inline(always)]
-pub fn smp_mb() {
-    if cfg!(CONFIG_SMP) {
-        // SAFETY: `smp_mb()` is safe to call.
-        unsafe { bindings::smp_mb() };
-    } else {
-        barrier();
-    }
+///
+/// The specific forms of reordering can be specified using the parameter.
+/// - `mb(Read)` provides a read-read barrier.
+/// - `mb(Write)` provides a write-write barrier.
+/// - `mb(Full)` provides a full barrier.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::sync::barrier::*;
+/// mb(Read);
+/// mb(Write);
+/// mb(Full);
+/// ```
+#[inline]
+#[doc(alias = "rmb")]
+#[doc(alias = "wmb")]
+pub fn mb<T: MemoryBarrier>(_: T) {
+    T::run()
 }
 
-/// A write-write memory barrier.
+/// Memory barrier between CPUs.
 ///
-/// A barrier that prevents compiler and CPU from reordering memory write accesses across the
-/// barrier.
-#[inline(always)]
-pub fn smp_wmb() {
+/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
+/// Does not prevent re-ordering with respect to other bus-mastering devices.
+///
+/// See [`mb`] for usage.
+#[inline]
+#[doc(alias = "smp_rmb")]
+#[doc(alias = "smp_wmb")]
+pub fn smp_mb<T: MemoryBarrier<Smp>>(_: T) {
     if cfg!(CONFIG_SMP) {
-        // SAFETY: `smp_wmb()` is safe to call.
-        unsafe { bindings::smp_wmb() };
+        T::run()
     } else {
-        barrier();
+        barrier()
     }
 }
 
-/// A read-read memory barrier.
+/// Memory barrier between local CPU and bus-mastering devices.
 ///
-/// A barrier that prevents compiler and CPU from reordering memory read accesses across the
-/// barrier.
-#[inline(always)]
-pub fn smp_rmb() {
-    if cfg!(CONFIG_SMP) {
-        // SAFETY: `smp_rmb()` is safe to call.
-        unsafe { bindings::smp_rmb() };
-    } else {
-        barrier();
-    }
+/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
+/// Does not prevent re-ordering with respect to other CPUs.
+///
+/// See [`mb`] for usage.
+#[inline]
+#[doc(alias = "dma_rmb")]
+#[doc(alias = "dma_wmb")]
+pub fn dma_mb<T: MemoryBarrier<Dma>>(_: T) {
+    T::run()
 }
-- 
2.50.1 (Apple Git-155)

