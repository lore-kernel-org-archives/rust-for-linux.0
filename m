Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646879;
	b=3zcNAug3wH8S90iyB6TTX0XznNlbaWaQ1HF4HF/b1n68Zml7MEdV0GLw5vTtOimOe5Np
	 mNoqFgOoCtv1gXqkuVPI+wZvEx7vAAYC27Yr3GEecS5lxbUTxrPqC8lKN10nwT1sA6c9e
	 Yt+o/3w8s4u6wjlRlIcw6H8fvcZCc1BPQSxl5FDIsYW3wUE6jvMx7hRs8QQfT3XtPHXw+
	 iGQVFyJbTC4DUu77/rW7wg5ZaIW8b2o/Nfdq7LIBU20olCgTbZp6eIEbytAcQsoE2r73E
	 o38IfcPjEdNu7Lw4QrzSuuLWyunVUZtm8xsD58d9yeIvfEID6DorBd8Ww8ZgqjOANXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646879;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=kTLazHtfQ7T6v1LOgMxmntX/KekXJGbNxR4RU+IK22k=;
	b=MF0zkXGfrV67ZO7twoxrPi7IUeOmIfP6zzciI7DPVNWiy6irrWAbge+BPd+oAcYREXxN
	 jzQBaNt5fuTf1sAFUdRUOJiPkj4VOnbQyhS710vxwi5izGWrNHKfDfAiHgfPHA7hN4lAV
	 cNIO2cCxCAIGSGVpkrAKur59+F+5L5jEzSFz7r25DqW2uNJ361J4ds524wSF9sr7B7JMe
	 Yzbbdk8ZhycCZEtoe+G3VwJwkBRZF8bM6j/mUsL7OhYlerMIzvdlq8acDZmLFaA9sJiNu
	 WXOEfpQ/RBMjiFL/0pZyro4OnVPZRMCyoXXAn/jlHQQPfv9NU4Ib+ad6BcSKtoEl8Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=B8j7ErYP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871F606A327;
	Wed, 25 Nov 2026 22:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1871F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=B8j7ErYP
ARC-Seal: i=1; a=rsa-sha256; t=1795646839; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WmbgfwRWQGhSySXLVRBrtGSV7kd1KdpNR+Vcl/6VK1Fj0cv7NG6D9Pvks/duQ1sTYLvYYkODccaLUIMF07oRnt4n2942mm7gQNezfz1d/1IblknIJXfOj0E05rIeFfXRyw403RwU0V9Mz6fW87Rdf60JEd/081bWrsX7a56CWxk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646839; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kTLazHtfQ7T6v1LOgMxmntX/KekXJGbNxR4RU+IK22k=; 
	b=RSeRXT3oTOuKdb3Lu2vaYrW1a8Tz1rlSG4vIIBRw2/IL2gnyo/+nZvhHGXtzDcRxf8q2a/OCaKaIvRb+dvomhwxKONAjIh7YFUbXLgmLEYrFisFdlQKADGAOer8HIKdDOy3mKWcfXA8BmP7OrvNuxbyzNEE4mNgwWRxpj4ZHR2g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=B8j7ErYPeJps/R5dmh/QaP16cT+1tqxecYtbPtV/xFlgMORDvINYQlhwO9jY4wO74qN6jeRvJX7J4ka72NrW89E9qE4iV/pWpHTCZK8onC4/KmGFOsVmFOzHScdKwnONvZsyORiZJeUpEGhRytti16y7u9TDpWHwVi4EE6wIbcE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=kTLazHtfQ7T6v1LOgMxmntX/KekXJGbNxR4RU+IK22k=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646837241209.47334520332345;
	Wed, 25 Nov 2026 14:47:17 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 25 Nov 2026 19:46:53 -0300
Subject: [PATCH 02/13] drm/tyr: convert VmAsData::va_bits from u8 to u32
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
Message-Id: <20261125-b4-tyr-as-casts-v1-2-2b2f53164d86@collabora.com>
References: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
In-Reply-To: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

An `as` cast silently drops the bits that do not fit the target type,
and nothing at the cast shows whether that can happen. As part of a
larger effort to reduce the number of `as` casts in Tyr, convert
`VmAsData::va_bits` from `u8` to `u32`.

`VmAsData::new()` receives the number of virtual address bits as a
`u32` and narrows it with `as` to store it in a `u8` field. The only
reader of the field, `as_config()`, widens it again to `u64`.

Store it as `u32`, which removes the cast.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/mmu/address_space.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tyr/mmu/address_space.rs b/drivers/gpu/drm/tyr/mmu/address_space.rs
index dd6377bee989..a388c0087b20 100644
--- a/drivers/gpu/drm/tyr/mmu/address_space.rs
+++ b/drivers/gpu/drm/tyr/mmu/address_space.rs
@@ -78,7 +78,7 @@ pub(crate) struct VmAsData<'drm> {
     as_seat: LockedSeat<AddressSpaceManager<'drm>, MAX_AS>,
 
     /// Virtual address bits for this address space.
-    va_bits: u8,
+    va_bits: u32,
 
     /// The page table which maps GPU virtual addresses to physical addresses for this VM.
     #[pin]
@@ -105,7 +105,7 @@ pub(crate) fn new<'a>(
 
         try_pin_init!(Self {
             as_seat: LockedBy::new(&mmu.as_manager, Seat::NoSeat),
-            va_bits: va_bits as u8,
+            va_bits,
             page_table <- page_table_init,
         }? Error)
     }

-- 
2.56.0

