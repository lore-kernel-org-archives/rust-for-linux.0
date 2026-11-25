Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646941;
	b=t70IeriCdA51Niu8z5pavevNwvOaMlQ+y0E7TYXyybbmC2h4KcrM/3mRR0iu55nRZohM
	 1Rg/C8QNMRfWusVkw87o4f+3i2a5UwBXKPVFJ30D7oTIeP5B2qTPAZNAeRasrJxht4ikq
	 25Si3fgIvDrO4BIlDOL+YqVBj/NGguyTM7E++bnCk1eeihedKlg6mjJigCQR/rF9z/WkC
	 nYLdVp+YCgkQ+odw+CjocLzYJx6QyqJ4l3MuRoQUOxTY1UaEOdMypNTo/Cz0a9JXY1Ocw
	 v/ciRuivUd7KRyWeZHCJ+SOKp0w+v4M1DwNoxkpGE/utAkgTeg1ZVM59/ujxwyxFk8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646941;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=mz9ZaEp5GpbURwHwKVcvQ4Ypmw1Fz7gWPB79WrWZZSw=;
	b=HH6o4SSS0cLZN6Y9ymvkiEpn7gtkWlZifl/gOmUfvjSRnooElzQc3w8Z9/xfDDx4R3nD
	 e7YW8QVX37IrfsJzFT56WfioC/PpeIAMY4jgosaJu2ZQKcYR2JixzN4EZB39AjfQpRcx5
	 XUNheX5J/c8ICD+70iN75JxDGiuwyBWwArfwGPAoNc+GOol4j/tghCQbDK/C/XZ7fdI19
	 VxvoWvAF0I25LWolcwqVaSy67ex6v9aySxeuPjv251tzFk8qaZF6qquEIuWNSUVcEZF22
	 sF7wPepEuvpaXvbh85+N8p6je9pLI9jvYDu+njC3au1lDwg8TTeVa669xxhcND97pcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=dAXiLM45;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5119606A6A8;
	Wed, 25 Nov 2026 22:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5119606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=dAXiLM45
ARC-Seal: i=1; a=rsa-sha256; t=1795646888; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nbLBmnbXUfx9q3j+ElyaWIfPjSAgRIYCDhM25KbmFJWTBSnq0Ys7AwybcGiBdLdRpPxcDRZXAuIu2pFkO908JawbvZTAJI9HSIeOMc9uW+D9A1X3bwe+kgmZ4twmvMSNqGUWr9INRj7RjP5+cQWvDUVRgh0ASlXGDRpWMwLCXeY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646888; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mz9ZaEp5GpbURwHwKVcvQ4Ypmw1Fz7gWPB79WrWZZSw=; 
	b=i5t4gc1t7IuH11ruuBUtRbLFkFEV3bv+J/zK42xGSwhAWCCHqfrwciMfUH4dKNW4y30cKnfG9JjOt7jFe2N6GLoXNS1tCkOaVdvTs10R8DaRTc/UZboYXBSqkGlrb8NsHTkMXIDsQCKWSjdfGYcSd1zLES/g0jgVZfKhqvIwdBU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=dAXiLM45t3kuCNXEQUfRrrgYNVGisbtUJrl+P/Jw9axMMpMgLCVzDY3WbnyDoHK4ykIgEURzMXY+x6fZHG5BZAkQLyB8wPA6EcQP51K6lmne4qfmBUMnovnvaxomA77MY02CDI5w97h7wvAYwoNpGX4us0Lrlbe0NPLEHPs+Yig=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=mz9ZaEp5GpbURwHwKVcvQ4Ypmw1Fz7gWPB79WrWZZSw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646885641703.1452437482217;
	Wed, 25 Nov 2026 14:48:05 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 25 Nov 2026 19:47:03 -0300
Subject: [PATCH 12/13] drm/tyr: justify the physical address cast in
 pt_map()
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
Message-Id: <20261125-b4-tyr-as-casts-v1-12-2b2f53164d86@collabora.com>
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
larger effort to reduce the number of `as` casts in Tyr, justify the
cast of the DMA address to `PhysAddr` in `pt_map()`. It stays, with a
`// CAST:` comment and an `#[expect(clippy::as_conversions)]`.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/vm.rs | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index 673fc6819070..3e2ed43f07a0 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -866,22 +866,18 @@ fn pt_map(
             }
         };
 
+        // CAST: `PhysAddr` is as wide as a DMA address on the platforms we care about.
+        #[expect(clippy::as_conversions)]
+        let curr_paddr = curr_paddr as PhysAddr;
+
         // SAFETY:
         // No other io-pgtable operation can currently access this range because Tyr holds
         // the gpuvm_unique mutex for the entire sm_map() operation.
         // The addresses being mapped won't overlap any existing mappings in this
         // page table because drm_gpuvm_sm_map() checks each requested mapping and either unmaps
         // or remaps any overlap before creating the new mapping.
-        let (mapped, result) = unsafe {
-            pt.map_pages(
-                curr_iova,
-                curr_paddr as PhysAddr,
-                pgsize,
-                pgcount,
-                prot,
-                GFP_KERNEL,
-            )
-        };
+        let (mapped, result) =
+            unsafe { pt.map_pages(curr_iova, curr_paddr, pgsize, pgcount, prot, GFP_KERNEL) };
 
         if let Err(e) = result {
             // If map_pages fails, mapped will be zero because the ARM LPAE backend

-- 
2.56.0

