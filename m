Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5D93A255D
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983958; cv=none; b=nDICkJclz01lNR7BH4UeLmnl2mWiXLtVsryUXxhjgD4g6gIAKo8IkwGo8y4lNVCA4z5YU1Bai7bG+FuYfMLn+m5ht5C3u4yIQyIKHlYwSmxGzLKriNykusfYt3iAtLK1luXtFNfbUoWxKROHtJQ4JrnL+f5D3H84eLKO45cecc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983958; c=relaxed/simple;
	bh=RzFYbNXYDjSKpdaaYG/36/VR5DniF2dfs1faTPKO4pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9lp3KYZObPQvuP6RG9HAa8ySct2h835+UrPIP9lieu72/VKBZGvzad9waftAFCapn1HyPaVYbalrkBm8lW1tMly1RPR1GkzUesBykjzPhufQpSfZiXpADNz5pCS/M3bqxxOTiK/RPTZEOYAgi4AE9n5zXRoHJwYw5XfZYteAwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=FzviiBIm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eGGPRoVi; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="FzviiBIm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eGGPRoVi"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id A56A31D00163;
	Tue, 31 Mar 2026 15:05:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 15:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983956; x=
	1775070356; bh=pDmrmjaGXTxLmtCFNvJbUHjuHcE67Wy5JJL2xWtfJZo=; b=F
	zviiBIm6Oa9dT/gZgk1OPqmZD35+4LH/Oi+hR/teRZLRfZKpVnRQSP1WO8k93i2n
	QNOm0Jlyo4KAzVB/GqtY2heVVIs3b7ixaX7QtOcsmRe7gMBytfFYKWCrdKvRmDMN
	DODTG6TTDiRrxuLdNivZp8Vc9ajy7s8CC0DjEZMnn8VBMGjiWyadRVY+MTO5uav7
	TuTu+SIPw6RwMzySi4VGL2AEp3WKiHU3nOXCVUFLhm+rAtJeWVQ++UF3GaSSR3qb
	rxsqiKqEbIbpi+dMsspQ9jO7RnTRZC6Wub5kHPgzBdrxerfXuPYJjFdykdKJZn8n
	ZS8cTFKtL/WbYLbslKYpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983956; x=1775070356; bh=p
	DmrmjaGXTxLmtCFNvJbUHjuHcE67Wy5JJL2xWtfJZo=; b=eGGPRoViMbalMS7hu
	q5iKuvRBBu96rO0g2SldYC1KwuvRoWOlSmNXdMs35fMrJ6YPvF98epdQrD/AAms+
	u4naZcZZcrGb0NyfN3u0YV+QPfgVS8Eg4JDHkDJAUJrd2jY4hPcGlV1MDJj1mAs0
	NiiEProRCrD5Rc2QBA+KD7CPi1rJXsAJ4oVciRx9BFJWvmgcVEH7SLv8cSnzOXWN
	/i24mGHBTAGm3LYDBiNbj9qGTWydYeKfFnViZ7qEO+Ggt2JEPJrSIKnLndUvGjZy
	oRTclnr69pt5zJQAZU4ZHZqwFi8hI/gAexNZCqi7j0K72Vz6sGtrCAHKb3a0LrsZ
	MqhKA==
X-ME-Sender: <xms:FBvMacJCHcRN6kNFJB4GXyUbthsqUiZFdqOm_4_XcMzbTRQxKpUEFA>
    <xme:FBvMaTJ5dvSJYz_tSVsGdLO06ymQRFUGHwLeNf1Ne9MddoXfebYu5iDchxf6cQA-J
    xb3gYbQhGgtbPiMEmIL5T6Dx6Ie0pWiHUtVdhL8v5W0iDfNm7W37ds>
X-ME-Received: <xmr:FBvMaRuUVgtgZA-yegawBmcLpSDQYHq8poFZBo2hMndGIjaFC9gRYcqQpynnLpf2lJ5uekzP3960x7XERoMJjs0T7VCBGkullpsqQKosfGaxcx7f0xTf-yuUnK7ipdSucC4Lzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhepueduudehfedvtddtudfhtedutdetffdukeefudefieehveevudeutdeivdfg
    teejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepug
    grvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesrhgvrg
    gurghhvggrugdrvghu
X-ME-Proxy: <xmx:FBvMaYRf8Wh9HfvfMpuwmzkfJ990VzsMUEkvcoZThBB_hJ4xcUcpEg>
    <xmx:FBvMafN4h70mI6w9anG6_JwyZ12x0ut-PHY2OoziMXSZ94MQ6vbcCw>
    <xmx:FBvMaVYf8_Gn9Mi4jNoqWLuNUnVlVn64_v3U7N9LUTWlkVA6TmfIFg>
    <xmx:FBvMaRyv3nEL_fLgy0RNNDsX07BAskImgynqcRyATEXz7rVJoEkdig>
    <xmx:FBvMaS7clRHQlfhJAlcarT6SEIcaFLcX9gmLVxTog6_1TcSbp67WymMo>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:54 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 08/16] bus1/util: add basic utilities
Date: Tue, 31 Mar 2026 21:03:00 +0200
Message-ID: <20260331190308.141622-9-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331190308.141622-1-david@readahead.eu>
References: <20260331190308.141622-1-david@readahead.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Import some basic utility helpers. They come with documentation and
should be self-explanatory.

Some helpers will become obsolete, once the MSRV is bumped. This is
noted in the documentation.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 ipc/bus1/lib.rs      |  2 +
 ipc/bus1/util/mod.rs | 87 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 ipc/bus1/util/mod.rs

diff --git a/ipc/bus1/lib.rs b/ipc/bus1/lib.rs
index 7c3364651638..a7e7a99086c2 100644
--- a/ipc/bus1/lib.rs
+++ b/ipc/bus1/lib.rs
@@ -4,6 +4,8 @@
 //! This is the in-kernel implementation of the Bus1 communication system in
 //! rust. Any user-space API is outside the scope of this module.
 
+pub mod util;
+
 #[allow(
     dead_code,
     missing_docs,
diff --git a/ipc/bus1/util/mod.rs b/ipc/bus1/util/mod.rs
new file mode 100644
index 000000000000..4dd08c04eec6
--- /dev/null
+++ b/ipc/bus1/util/mod.rs
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+//! # Utility library
+//!
+//! This module provides utilities that can be used independently of the core
+//! module.
+
+use kernel::prelude::*;
+use kernel::sync::{Arc, ArcBorrow};
+
+/// Convert an Arc to its pinned version.
+///
+/// All [`Arc`] instances are unconditionally pinned. It is always safe to
+/// convert from their unpinned variant to their pinned variant.
+///
+/// Most kernel APIs just use a plain [`Arc`], even if they rely on pinning.
+/// If another API needs a `Pin<T>`, this converter can provide it for [`Arc`],
+/// even though most other kernel APIs do not use `Pin<Arc<T>>`.
+pub fn arc_pin<T>(v: Arc<T>) -> Pin<Arc<T>> {
+    // SAFETY: `Arc<T>` guarantees its target is pinned.
+    unsafe { Pin::new_unchecked(v) }
+}
+
+/// Convert an Arc to its unpinned version.
+///
+/// All [`Arc`] instances are unconditionally pinned. It is always safe to
+/// convert from their pinned variant to their unpinned variant.
+///
+/// Most kernel APIs just use a plain [`Arc`], even if they rely on pinning.
+/// This converter allows getting an [`Arc`] if some other API returned a
+/// generic `Pin<T>` with `T = Arc<U>`.
+pub fn arc_unpin<T>(v: Pin<Arc<T>>) -> Arc<T> {
+    // SAFETY: `Arc<T>` guarantees its target is pinned, even if not wrapped.
+    unsafe { Pin::into_inner_unchecked(v) }
+}
+
+/// Convert an ArcBorrow to its pinned version.
+///
+/// All [`Arc`] instances are unconditionally pinned. It is always safe to
+/// convert from their unpinned variant to their pinned variant.
+pub fn arc_borrow_pin<T>(v: ArcBorrow<'_, T>) -> Pin<ArcBorrow<'_, T>> {
+    // SAFETY: `Arc<T>` guarantees its target is pinned.
+    unsafe { Pin::new_unchecked(v) }
+}
+
+/// Create a [`NonNull`] from a reference.
+///
+/// This is a backport of [`core::ptr::NonNull::from_ref()`].
+pub fn nonnull_from_ref<T: ?Sized>(v: &T) -> core::ptr::NonNull<T> {
+    // SAFETY: A reference cannot be NULL.
+    unsafe { core::ptr::NonNull::new_unchecked(core::ptr::from_ref(v).cast_mut()) }
+}
+
+/// Create a [`NonNull`] from a reference.
+///
+/// This is a backport of [`core::ptr::NonNull::from_mut()`].
+pub fn nonnull_from_mut<T: ?Sized>(v: &mut T) -> core::ptr::NonNull<T> {
+    // SAFETY: A reference cannot be NULL.
+    unsafe { core::ptr::NonNull::new_unchecked(v) }
+}
+
+/// Return the memory address part of a pointer without exposing provenance.
+///
+/// This returns the same value as an `as usize` cast. However, this function
+/// is meant to not expose provenance, and rather behave like
+/// `<*mut T>::addr()`. Unfortunately, the latter requires an MSRV of 1.84,
+/// which is not yet available upstream. Until then, this serves as a
+/// replacement.
+pub fn ptr_addr<T: ?Sized>(v: *const T) -> usize {
+    // Simply expose the provenance until. A transmute would avoid the
+    // exposition, but is not a stable API.
+    v.cast::<()>() as usize
+}
+
+/// Compare two pointers.
+///
+/// This is equivalent to `<*const T as Ord>::cmp()`. Unlike the trait-based
+/// solution, this has fixed pointer types and thus can be called with
+/// references, which are then coerced to pointers.
+///
+/// This serves the same purpose as `core::ptr::eq()`, but for `Ord` rather
+/// than `Eq`.
+pub fn ptr_cmp<T: ?Sized>(a: *const T, b: *const T) -> core::cmp::Ordering {
+    // Even though `PartialOrd for *mut T` documents that it uses
+    // `<*mut T>::addr()` for comparisons, clippy still warns about it. Cast
+    // to `()` to ensure metadata is ignored.
+    a.cast::<()>().cmp(&b.cast::<()>())
+}
-- 
2.53.0

