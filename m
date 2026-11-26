Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795723895;
	b=iIcpRijlXxNT1pCUCgnobFTh4jHLMCEyGdYUeKmdu98xGnqWtkKSJuP2HmpZXU2UEVMa
	 uduP0KgKhCntxuP18ziF4d4/C0/oFqF3hiTQUSKrcLRaypMwykgpRSsb9BcYPFtxRKM63
	 Ku9OwZoCrdv+De7eVKZ/jEL8b6sS3VznzHbQ6ufYnGmBy0QVwlY3JFyauVdU69IH77uQA
	 0Bpl3rbp0lF0TBVLAg/xp9+/s1DHoG//pjCGtXih6oMuN1J7QY3E9I6Y5VzqKaNjVQuMt
	 BIlUFQOXHETwaiJK0JwswqWR2/9bB5+74cG/eDoqO89vRZ8C746aqQnnoSKV5u/TPig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723895;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=91AuQ0wdQZg5KK8w32E/aXUdWMBJlHDCMF0yiHAgKG8=;
	b=oozNIS0ANv9QA0A9Tf1nNJtjsfzyEZx+49kbDgKNWtY5VP9SVUOQJ8XwVKCQWQ8sF+gL
	 SoxBASkV4AQCy/6p7BeSy+BVs1hwamj9qrNEDq26CT+MpYTB0eRUYDmTEDw67ySFlA+EK
	 zVm90znEJzxMRC7pLfVIk3n2dkO5639x2o7N56GtM49VjWJxouQCY43tG3XY1zQJL/ISw
	 hddMGGDsEv0D2WopNsxtZO0vZp4NGGOKczsHXRlLdBZj5H3OO0ZwheIW79Od5d7W7hwhj
	 Hv27nvfBCaUngjqq0yaDUM8aqT4w1BKRl+f+lfg3iFRxbFrv3O3ipGfKT4L4/aOFPpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=CL7Lkw4n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9E2606A323;
	Thu, 26 Nov 2026 20:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A9E2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=CL7Lkw4n
ARC-Seal: i=1; a=rsa-sha256; t=1795723866; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ME9MMM/HzpNE3cEHqAqDF/lTKHrffWYVjhms7lImntTA1+XDp/xtDtSPuOF12XKOoE/uB1PKsiAkOrtB9ATERCjjqYO1mlOlis24b9LR5oEvcuWVJz//TBF5+1KqPCyDZ4oYrjmruo4DgVjG46/T5Rvrf/K1XlX1Zwi65cm1iIk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795723866; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=91AuQ0wdQZg5KK8w32E/aXUdWMBJlHDCMF0yiHAgKG8=; 
	b=QsSUC8/znHIsMkmjlZdycCr1AejPFv0KHqfXZXCvZgh2YJqZhC28NuH4bOcMVR49WZ9w1lggSGCUdDWgFuKCjtBDcJWshKI3X7Ves/bVOBcuRoJr+vFePFNIMylItQmubFtg7HqGDnOhAEVgHzWk2fPthyAb/+VtR/inojf3lGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=CL7Lkw4nDrGlEhHyfZb3h2dlDBAkJvAKyXgHODQdjRLF5wsNSWZDTq3kADGmrMdox2wBp7zSyht/NO1ILmFyxZHZzRoTF0ybr9CEB+5wcob1zA3fZILKQjm3kf3xrIwovnPJfR3wxXMO6hSBFfg+S06TuYjBfyhYV0JexjoiHuo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=91AuQ0wdQZg5KK8w32E/aXUdWMBJlHDCMF0yiHAgKG8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795723863896766.2077658156967;
	Thu, 26 Nov 2026 12:11:03 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 26 Nov 2026 17:10:46 -0300
Subject: [PATCH 4/4] drm/tyr: use the `TryFrom` derive for `EntryType`
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
Message-Id: <20261126-tyr-enum-derives-v1-4-a487b0e1bee3@collabora.com>
References: <20261126-tyr-enum-derives-v1-0-a487b0e1bee3@collabora.com>
In-Reply-To: <20261126-tyr-enum-derives-v1-0-a487b0e1bee3@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Kaiqi Guo <chaoji_xinren@163.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

`EntryType` is the last enum in Tyr whose conversion from `Bounded` is
written by hand. Derive it as well, so that all of them use the
conversion derives.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/fw/parser.rs | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tyr/fw/parser.rs b/drivers/gpu/drm/tyr/fw/parser.rs
index 6576bc870982..cf8a815e8ab8 100644
--- a/drivers/gpu/drm/tyr/fw/parser.rs
+++ b/drivers/gpu/drm/tyr/fw/parser.rs
@@ -18,10 +18,8 @@
 use kernel::{
     bitfield,
     device::Device,
-    num::{
-        casts::FromSafeCast,
-        Bounded, //
-    },
+    macros::TryFrom,
+    num::casts::FromSafeCast,
     prelude::*,
     sizes::SizeConstants, //
 };
@@ -548,7 +546,8 @@ fn entry_type(&self) -> Result<EntryType> {
     }
 }
 
-#[derive(Clone, Copy, Debug)]
+#[derive(Clone, Copy, Debug, TryFrom)]
+#[try_from(Bounded<u32, 8>)]
 #[repr(u8)]
 enum EntryType {
     /// Host <-> FW interface.
@@ -564,19 +563,3 @@ enum EntryType {
     /// Metadata about how the FW binary was built.
     BuildInfoMetadata = 6,
 }
-
-impl TryFrom<Bounded<u32, 8>> for EntryType {
-    type Error = Error;
-
-    fn try_from(value: Bounded<u32, 8>) -> Result<Self, Self::Error> {
-        match value.get() {
-            0 => Ok(EntryType::Iface),
-            1 => Ok(EntryType::Config),
-            2 => Ok(EntryType::FutfTest),
-            3 => Ok(EntryType::TraceBuffer),
-            4 => Ok(EntryType::TimelineMetadata),
-            6 => Ok(EntryType::BuildInfoMetadata),
-            _ => Err(EINVAL),
-        }
-    }
-}

-- 
2.56.0

