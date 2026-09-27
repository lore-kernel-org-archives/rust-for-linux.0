Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE342046E
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532712; cv=none; b=iqon3jp+cQo3m91tM0FLCJaKHNp8iJXyDDurlrqqI9jLvHp8v0SevgyNwX5lxPVL0b1/YVGuJgfREFC4KadxGZyuvf9K81ySPSWVcJU2N66MbDU3Mp3prGl89T56X3Z0C8CUJYLKXW7AluUjVeIjYsuUnEvCx/+vBKo3PXx9fFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532712; c=relaxed/simple;
	bh=VKPUTJnZ5RtYzk38I8a5be1igeXKqoLTiQ2eUTRxFn4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SQL8kcyCj3RDS+mpG6YpFQm2XciJg2orMeoWo5Y4/tv1MsQspBr/RYnh+kaciVd005vI041UwUCdsRwopm77SVRtIdwmbyRhylGsm4QyqUTWtY7RFRV4cBWb/bnCjdNlbaAoSRKD57os3kko6RM4UKl8AHm3tp0qoV0KINhRKH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=AN6Rxr4i; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AN6Rxr4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790532701; x=1790791901;
	bh=xojCAjopFrYdQ40SwOTqpF43M3oLSUS1UPbRcl8SZ7o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AN6Rxr4it50UbewfRUrpZtNff9+X17eoP0H6aHWMbovwUWJKUWMw9BWyeOSN6ST4S
	 oXs6Jtu+VBDDEmArdDTa2RHc9QRvw7LsbqYidjhJ4kyQfsgjxOm5+xzDIJO+gMYe1z
	 fgSTt3CM9tE7kr/94qAAhJi2/WNvqKFmZ/9NWJhfJAwYoWJgxc1I+wu85A4Q3nSXBN
	 vDFo6ACGIhRynhNMNQ+uf7pdahqsnN25RFJlI1I8EdjMTZC7C8EGYYghMt4f6VX2t/
	 e2RxooEGVDGztU8PY0b4fl5585KtzRBpVtBdz42552dPPzwA8C4imgPQ0+JWg50Clh
	 m5EkF3hP13K/A==
Date: Sun, 27 Sep 2026 18:11:35 +0000
To: Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Subject: [PATCH v4 1/2] rust: scatterlist: return u32 from SGEntry::dma_len()
Message-ID: <20260927-resource-size-newtype-v4-1-447a08af23fb@proton.me>
In-Reply-To: <20260927-resource-size-newtype-v4-0-447a08af23fb@proton.me>
References: <20260927-resource-size-newtype-v4-0-447a08af23fb@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 16d3e700f402241472419065386b064829754ca4
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

`SGEntry::dma_len()` returns `ResourceSize`, but the length of a DMA
segment is not the size of a resource. The C side stores it as an
`unsigned int` (`dma_length` in `struct scatterlist`), the helper
returns `unsigned int`, and a single segment is bounded by the
device's `max_segment_size`, which is an `unsigned int` as well. The
method only widens the value to `resource_size_t`.

Return `u32`, which is what the binding already produces, and drop the
`.into()` along with its `clippy::useless_conversion` allow.

tyr widens the length to `u64`, which is now a real conversion on
every architecture, so drop its `useless_conversion` allow too.
nova-core converts it to `usize` through `FromSafeCast`, which already
covers `u32`, so it needs no change.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/r/DLNPXJ4WPH4L.2MBUGV1TAESYY@kernel.org
Signed-off-by: Lorenzo Delgado <lnsdev@proton.me>
---
 drivers/gpu/drm/tyr/vm.rs  | 1 -
 rust/kernel/scatterlist.rs | 9 +++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index c5e307b1e241..1dd11b2b1253 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -644,7 +644,6 @@ fn sm_step_map<'op>(
             // Expressly convert to u64 to work with arm 32-bit builds.
             #[allow(clippy::useless_conversion)]
             let mut paddr =3D u64::from(sgt_entry.dma_address());
-            #[allow(clippy::useless_conversion)]
             let mut sgt_entry_length =3D u64::from(sgt_entry.dma_len());
=20
             if bytes_left_to_map =3D=3D 0 {
diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index b83c468b5c63..f37bf29fdbca 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -34,9 +34,7 @@
     bindings,
     device::{Bound, Device},
     devres::Devres,
-    dma, error,
-    io::ResourceSize,
-    page,
+    dma, error, page,
     prelude::*,
     sync::aref::ARef,
     types::Opaque,
@@ -90,10 +88,9 @@ pub fn dma_address(&self) -> dma::DmaAddress {
=20
     /// Returns the length of this SG entry in bytes.
     #[inline]
-    pub fn dma_len(&self) -> ResourceSize {
-        #[allow(clippy::useless_conversion)]
+    pub fn dma_len(&self) -> u32 {
         // SAFETY: `self.as_raw()` is a valid pointer to a `struct scatter=
list`.
-        unsafe { bindings::sg_dma_len(self.as_raw()) }.into()
+        unsafe { bindings::sg_dma_len(self.as_raw()) }
     }
 }
=20

--=20
2.55.0


