Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794502898;
	b=dHv7629VJ+wds483N/ndBnL1smU6LIs5AQEPNlADvQwZSdFgPmgXWY6P64AJOsuTZPLA
	 Y/m6a2yLyc48Iw/Xxp9sITPMUjTUmtychy0p0ggmi3z+Mfdu9NI1gSuohYTPGA2HTHiOq
	 9OUwNu814qswx309HJaFp8YsZF4PR63PyPz5cCAXj3eNjXy64mcuX3oINzY2ubU2wIohP
	 05L1SSLx2ercx8dxYM/QORZ4cf3JgbQBY+7gZVPVEAbTs3MFZv4b4lNd03UWCHVGVlj7L
	 0hulFjxFzHKeFLhUwhArdGKKfG4jqm+XyD8Ff06PyCHfPtqBWIW2TeRPilvdEv6AXAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502898;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=Zs9D6QmbwJaatPy/C5twhxIDkazaNFo1QaQc5EOx0PM=;
	b=Qc5Zd0mXZK3nm5RLw7ksegAdKz9me8NPL9bQrX2gJlLBhGrgsA0mjoCuLdq2L3G06bnL
	 C5vEY0qSy9aUVwLC0QhXxzrfDmgOLU8t3C0fgY7dMrh1Hl4r8Jo3M8Ym6ls8qSexeqDRA
	 RrJ31wfWZA2i8BSi7hAzfCk/Z+oQlFPcMBtZXUnSZgivgsrUnFgxuel7Nx4A6uqylr6Xk
	 lv8i57//sk8GBuCuhC0lIrheiFSBQYTWivFnldBsus7lR8hxLCW7J0mJ4fK0QpYYNXwe8
	 an/WdB+MeFJHbocMCA+AP1vol2aicL2xyY0A9DL1iFCku7Se8VDEeo2HgAn/2O+KZFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=LD6GXrkp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89796606A886;
	Thu, 12 Nov 2026 17:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89796606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=LD6GXrkp
ARC-Seal: i=1; a=rsa-sha256; t=1794502878; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CWV/TTD7KIIUEEom1x8q9SXObO2Is2V5aGulYqs6tv87tTSxL0vPP7hJEZPYyMJ6/jE/Y57WEHZZxxexJoOdmGIXMKIqW6HcSyyyw+w7lS+AVQINY+1OxLc6aKs3ZwL976xx6hyDoTZ9tu8I26YxhJzn4WyB9YcVJd73NQPix7Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794502878; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Zs9D6QmbwJaatPy/C5twhxIDkazaNFo1QaQc5EOx0PM=; 
	b=F8ibaA5ow7/oV5aHtDdVAZwdRbIwNqLeVvob0AzLDQ/nPx95EjtOEwrZf8QT0lXiFsLuEI4Ll1HiXFDpPILSSAJgtt0SZEYdGs3THGXVhp28LWEvFWCgrNohziBMfAMMzAljgg65QFMRR9bxU4e3q/0kf/79hsO2oNgIIPPRZsc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=LD6GXrkpxY87Fv4Ht5tqOC3Ur/YyG9as+JuPoszx3/vhwIBROnoTbEaCR+21L85e/HGw9vgF8Zn819KPvjNr4MJUbWsA3vzs/5hsvmLs6IoRCyPoy4oB9V3/CPoeKWtqCXOJXf6ONuNOGrZflsVxwZGsDMLKgQkpoUzjbGFDZhE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Zs9D6QmbwJaatPy/C5twhxIDkazaNFo1QaQc5EOx0PM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794502875889151.91160893113;
	Thu, 12 Nov 2026 09:01:15 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 12 Nov 2026 14:00:13 -0300
Subject: [PATCH 6/6] rust: iommu: add Domain::with_fault_handler()
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
Message-Id: <20261112-b4-iommu-domain-v1-6-c29e86788dda@collabora.com>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
In-Reply-To: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: iommu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

A driver is not told when its device faults in the IOMMU unless its
domain has a fault handler. The upcoming rkvenc driver needs to know,
so that it can stop the encoder and fail the job of the client whose
domain faulted.

Add Domain::with_fault_handler(), which allocates a domain and installs
a FaultHandler on it with iommu_set_fault_handler(). The handler is
borrowed for the lifetime of the domain. One handler can serve several
domains, which it tells apart by the DomainId it receives.

The handler may run in atomic context.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/iommu/domain.rs | 112 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/rust/kernel/iommu/domain.rs b/rust/kernel/iommu/domain.rs
index ac9947d5063b..351a8e77fa71 100644
--- a/rust/kernel/iommu/domain.rs
+++ b/rust/kernel/iommu/domain.rs
@@ -21,6 +21,7 @@
     },
     error::{
         from_err_ptr,
+        from_result,
         to_result, //
     },
     prelude::*,
@@ -126,6 +127,8 @@ unsafe impl<'a> Send for Domain<'a> {}
 //   be called concurrently for the same domain.
 // - Mapping and unmapping ranges. `iommu_map_sg()` and `iommu_unmap()` may be called concurrently
 //   for the same domain, except in the cases that the safety requirements of `map()` exclude.
+// - Getting the identifier of the domain. `id()` takes the address held in `ptr` and does not
+//   dereference it.
 unsafe impl<'a> Sync for Domain<'a> {}
 
 impl<'a> Domain<'a> {
@@ -155,6 +158,39 @@ pub unsafe fn new(dev: &'a Device<Bound>) -> Result<Self> {
         })
     }
 
+    /// Allocates a paging domain for `dev` that reports its faults to `handler`.
+    ///
+    /// A handler can serve several domains, which [`Domain::id`] tells apart.
+    ///
+    /// # Safety
+    ///
+    /// This function has the same safety requirements as [`Domain::new`].
+    pub unsafe fn with_fault_handler<H: FaultHandler>(
+        dev: &'a Device<Bound>,
+        handler: &'a H,
+    ) -> Result<Self> {
+        // SAFETY: The caller meets the safety requirements of `Domain::new()`.
+        let domain = unsafe { Self::new(dev)? };
+
+        // SAFETY: By the type invariant, `domain.ptr` is a valid domain, which nothing else uses
+        // yet. `handler` outlives `'a`, and thus the domain.
+        unsafe {
+            bindings::iommu_set_fault_handler(
+                domain.ptr.as_ptr(),
+                Some(fault_callback::<H>),
+                core::ptr::from_ref(handler).cast_mut().cast(),
+            )
+        };
+
+        Ok(domain)
+    }
+
+    /// Returns the identifier that [`FaultHandler::fault`] receives for faults on this domain.
+    #[inline]
+    pub fn id(&self) -> DomainId {
+        DomainId(self.ptr.as_ptr().addr())
+    }
+
     /// Attaches the domain to `dev`.
     ///
     /// This may sleep.
@@ -311,3 +347,79 @@ fn drop(&mut self) {
         unsafe { bindings::iommu_unmap(self.domain.ptr.as_ptr(), self.iova, self.size) };
     }
 }
+
+/// Identifies a [`Domain`] in fault reports.
+///
+/// Two identifiers are equal if they identify the same domain. An identifier can be reused once
+/// its domain is freed.
+#[derive(Clone, Copy, PartialEq, Eq)]
+pub struct DomainId(usize);
+
+/// A handler for the IOMMU faults of a [`Domain`], see [`Domain::with_fault_handler`].
+///
+/// Only IOMMU drivers that report faults with `report_iommu_fault()` call it.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{
+///     device::{
+///         Bound,
+///         Device, //
+///     },
+///     iommu::domain::{
+///         Domain,
+///         DomainId,
+///         FaultHandler, //
+///     },
+///     prelude::*,
+///     sync::atomic::{
+///         Atomic,
+///         Relaxed, //
+///     }, //
+/// };
+///
+/// struct Faults {
+///     count: Atomic<u32>,
+/// }
+///
+/// impl FaultHandler for Faults {
+///     fn fault(&self, _domain: DomainId, _iova: usize, _write: bool) -> Result {
+///         self.count.add(1, Relaxed);
+///         Ok(())
+///     }
+/// }
+///
+/// fn test<'a>(dev: &'a Device<Bound>, faults: &'a Faults) -> Result<Domain<'a>> {
+///     // SAFETY: The IOMMU driver that `dev` is behind meets the requirements of `Domain::new()`.
+///     unsafe { Domain::with_fault_handler(dev, faults) }
+/// }
+/// ```
+pub trait FaultHandler: Sync {
+    /// Handles a faulting access to `iova` through the domain identified by `domain`. `write` is
+    /// true if the IOMMU driver reported a write access.
+    ///
+    /// This may be executed in atomic context and must not sleep. Implementations return `Ok(())`
+    /// if the fault was handled. The result is passed to the IOMMU driver.
+    fn fault(&self, domain: DomainId, iova: usize, write: bool) -> Result;
+}
+
+/// # Safety
+///
+/// `token` must be the `&H` that [`Domain::with_fault_handler`] registered for `domain`.
+unsafe extern "C" fn fault_callback<H: FaultHandler>(
+    domain: *mut bindings::iommu_domain,
+    _dev: *mut bindings::device,
+    iova: c_ulong,
+    flags: c_int,
+    token: *mut c_void,
+) -> c_int {
+    // SAFETY: By the safety requirements, `token` is a `&H` that outlives `domain`.
+    let handler = unsafe { &*token.cast_const().cast::<H>() };
+    let write = flags & cv!(bindings::IOMMU_FAULT_WRITE => c_int) != 0;
+
+    from_result(|| {
+        handler.fault(DomainId(domain.addr()), iova, write)?;
+        Ok(0)
+    })
+}

-- 
2.56.0

