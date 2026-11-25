Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646883;
	b=NBu3PTAx018C0X7HhXOQ0Sg9U+v6LtDogI7JWCo7CEoXWwBxl4XDCcWy71w43TS3hEGN
	 o8PqIpifqYQw7eND8nUTW/2Lm4D+v9mNr0VE5NUDNiePUCgcd3n1RSdU1GaCWWb841dpm
	 X/s0o+j5Y0NQ9vk9IQTIBShCcg6LvzK1KXXJTBqUqs9c6AsMfIGIbJAU6SyUfDdzlDyCX
	 uIrCYr3hZ0yhUqbohTpDM4juGGyUVcE/9Tga8KzUJAKsWYVWfv1RqJ5cuGjyGTpbRT7pq
	 iJ5u098N/AjPDGC861FEcZ1ybcNVP9Ra8ChB434DFT0scsdl0FjpycbFaEjJRem71kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646883;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=oyf1Ba7uOLMZNhpIzJe7ZwyMF7MLDDOOqAlfIKIFlO8=;
	b=VZaqgysl+GucaityNYkG8IHj3aCLU6SlVQGfMXsYP2TZ7hFewqagQZ7Av9311SRX7XLT
	 0yENCqTtxNTEnwGaPogSEmXacjQEgVVwD1vC7zOu1UbwccfWCvEN9cjMYoOazK89rmQ9D
	 I4PjS1j2+NsdRaUbCww5d+sOwi7xhO2bKXT3lBYnIYAW+SRJP44Mt2GR+suhSHgOg3h1G
	 lrCK3cOZZRjNZ9+P464ep6iR8JORPTOtayqRzh0C5jNx8ZCLZcLkipF0VSCOoXHB2FfZJ
	 XrV6xrWbCBVVUl8DdxVgY17opKrxzF1EIh+mgH1e2JvmKBiBs8mMGVW0ofrONT+CCnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=HjUMR54I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D49D606A68C;
	Wed, 25 Nov 2026 22:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D49D606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=HjUMR54I
ARC-Seal: i=1; a=rsa-sha256; t=1795646843; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GcH9Vp6CU1ED8YNzdFNZu/sNdRopYC8GWq+kvQO2KwIedRr5UNDXkv8izOgreElxtWC0nv+nmr+4J7AIMTKXcrDkV94bo33Lzk0O6mDdwdwVCSRS0p0xB1IFOSDmV2O6bPKvY3aNJqMuRSQzzFwxINo42sFML8ri0IChulA4+s4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646843; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oyf1Ba7uOLMZNhpIzJe7ZwyMF7MLDDOOqAlfIKIFlO8=; 
	b=WFcfeM0tiYxKvEXQWaEqHmxcX7kE+KvVk7i5bD83KJtJ9J8coYps9/9E1+SFH7Xg4gmWvbPorann+3F6FLE3uWf+eoaLWXrh3Ytkea9oFx7hlbTpnl4Mrehml9p8izcrD+AE+PiXa2yVhw4Z7yjw0T/u9tbzKxaalhT5KjdgTYk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=HjUMR54ItSE4LcaTq/Xgogoc+AMMk4iaankM2Tx569/MJ0obxeU8IOV6FrrLbKIPRep2kunYzGeAmQXaHi6qBOZyx7m5jkDpiD2sFKM47nPBkqFp6Jk1UGyuDfFyNRfSLIk0V+rFwDjQbI/GYLFBSvLOAY3pBO5AoSP4S1E71f0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=oyf1Ba7uOLMZNhpIzJe7ZwyMF7MLDDOOqAlfIKIFlO8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646842109819.1062793227454;
	Wed, 25 Nov 2026 14:47:22 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 25 Nov 2026 19:46:54 -0300
Subject: [PATCH 03/13] drm/tyr: convert the lock region exponents from u8
 to u32
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-b4-tyr-as-casts-v1-3-2b2f53164d86@collabora.com>
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
larger effort to reduce the number of `as` casts in Tyr, convert the
lock region exponents in `as_start_update()` from `u8` to `u32`.

`as_start_update()` works out the size of the region to lock as a power
of two. It takes the exponents from `trailing_zeros()` and
`leading_zeros()`, which return `u32`, and narrows them to `u8` with
`as`. The result is then widened back to `u32` for `checked_shl()`.

Keep the exponents as `u32`, which removes the casts.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/mmu/address_space.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tyr/mmu/address_space.rs b/drivers/gpu/drm/tyr/mmu/address_space.rs
index a388c0087b20..f6ccb0d7e3ed 100644
--- a/drivers/gpu/drm/tyr/mmu/address_space.rs
+++ b/drivers/gpu/drm/tyr/mmu/address_space.rs
@@ -362,7 +362,7 @@ fn as_start_update(&mut self, as_nr: usize, region: &Range<u64>) -> Result {
         // Count the number of trailing zero bits (zeros at the right/least-significant
         // end of the binary representation). For a power-of-two value, this equals the
         // base-2 exponent (e.g., 32 KiB = 2^15 → 15).
-        let lock_region_min_size_log2 = lock_region_min_size.trailing_zeros() as u8;
+        let lock_region_min_size_log2 = lock_region_min_size.trailing_zeros();
 
         // XOR the first and last addresses to identify which bits differ between them.
         // The highest set bit in the result determines the exponent of the smallest
@@ -373,11 +373,11 @@ fn as_start_update(&mut self, as_nr: usize, region: &Range<u64>) -> Result {
         //   highest set bit in 0x3FFF is bit 13
         //   minimum region size = 2^(13 + 1) = 16 KiB
         let addr_xor = region.start ^ (region.end - 1);
-        let region_size_log2 = 64 - addr_xor.leading_zeros() as u8;
+        let region_size_log2 = 64 - addr_xor.leading_zeros();
 
         let lock_region_log2 = core::cmp::max(region_size_log2, lock_region_min_size_log2);
 
-        let lock_region_size = 1u64.checked_shl(lock_region_log2.into()).ok_or(EINVAL)?;
+        let lock_region_size = 1u64.checked_shl(lock_region_log2).ok_or(EINVAL)?;
         // Align the LOCKADDR base address down to the lock region size (1 << lock_region_log2).
         //
         // The MMU ignores the low lock_region_log2 bits of LOCKADDR base, so ensure

-- 
2.56.0

