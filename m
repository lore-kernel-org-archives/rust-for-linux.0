Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794502880;
	b=rW4LbVCPd/ayZZIeE/JfjvcLqgEoDOI/rrClK4UtZTZxr2ydQ83kaaRaE5hOqicN+AmV
	 WzQxzras5V6NHg2beUeGA5xvbDFtXcmgH8mKs9yAQQ8xetiOm0eDX9tiGImMBbw0ysCnb
	 c7fgIFqEhqrnDLxwv2IGrcoYhfk2XugWf14QlFinYeQA0GCDTlxirR8HurdLMgh1m9RxM
	 bYwZBlKsUzXbeMSMZcKNJqE+w4wg0FWgpo0z6C/huJN07E7K1K4TqvPLZurgxYeWBGF2e
	 cSHoO5QkmVJB9RLRtMdHVApuLAQqm19b7jhdm9L9YolHbaxCGBd3pgg2uGMn/G1dg0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502880;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=TtYqv35d/hIFrfEOxRg2mF77Izfl5YEa1ki7sh6I1ZA=;
	b=o2oQMqs/sDYZc9WxI9FmBiB/vtc+fnAiGbukhqgD3vFzGPbphSx3tliYOa2hPZ1Fke4w
	 ojmlnT7CggDSBv/TkyBhdWqhPOo/uyayL7UBY6mQ6f344siEDLrRQG+MrhF/JZERWA0ue
	 3NiQvz/z3EilhvFlLa06bchAPSbI+KJvTvYLCpWhV8l83WHFslrMtb7W4gL4yJjMPQ18M
	 wNSvYzZaMsub1PN3EPJ0tkjZX3pYOiyvFlggRvOugz8knFvug47XijqI+KMIbzTUNPTMk
	 f8/LiLye1oKR9MSujQGUkAkDr5CrLbJp6/085oRgQtqs3S2aLShy2yATwhorrAG/3Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=GMVFhPIB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D1606A894;
	Thu, 12 Nov 2026 17:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40D1606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=GMVFhPIB
ARC-Seal: i=1; a=rsa-sha256; t=1794502852; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G04TUT7EN1HbycSFfu62DSpu1EZNheXoz/HbGS0oNyISqVFhdcGdhvTQuX6Wh/FNDheWMdUkWocXIyfO9WblWsOI26TvckV3u9QAxwD92cInKxNKu482DUHOjh0k68mgmq7rGlHetkJkS05Z6XC+x17jHsdbcdQomKNyzg7RjVw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794502852; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TtYqv35d/hIFrfEOxRg2mF77Izfl5YEa1ki7sh6I1ZA=; 
	b=SHtWqRW3Ci1UBQpxi/XG1e78CeE0FV2KBcS/9x1hYoWV52fHTyZzW7FV0mPlWnRzymyPNuNlhafw4Ek5LgeTFb2fPeLT0K3H05RYvPWVuldfukR1tvjUPjZvWUYAKKp5IcgRdaiZlnjBijcIZMGtci0sdqwj8gvbt01yJMiAZdE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=GMVFhPIBTILMgcg/vnKWK4hN1kbbN3/uXcUkMy7jCmaJ8YGeZpjjDjJ6YgspdhYfSK0DlgWVEKnZfU9bdkiN4K2Ken2lPw531ht11CA4xt4hDgOirVkpzsOp+Igrggra8gOlm6OobiC5LccDFAoDyO3Oy2/T72rpdDO60LhlCcs=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=TtYqv35d/hIFrfEOxRg2mF77Izfl5YEa1ki7sh6I1ZA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794502849482807.6283680977111;
	Thu, 12 Nov 2026 09:00:49 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 12 Nov 2026 14:00:09 -0300
Subject: [PATCH 2/6] rust: scatterlist: make SGTable::as_raw() visible to
 the crate
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
Message-Id: <20261112-b4-iommu-domain-v1-2-c29e86788dda@collabora.com>
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

SGTable::as_raw() is private to the scatterlist module. Domain::map(),
added later in this series, needs the raw table to pass its scatterlist
to iommu_map_sg().

Make it pub(crate).

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/scatterlist.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index 3a5250f85000..a68a9bbb38ed 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -147,8 +147,9 @@ pub unsafe fn from_raw<'a>(ptr: *mut bindings::sg_table) -> &'a Self {
         unsafe { &*ptr.cast() }
     }
 
+    /// Obtain the raw `struct sg_table *`.
     #[inline]
-    fn as_raw(&self) -> *mut bindings::sg_table {
+    pub(crate) fn as_raw(&self) -> *mut bindings::sg_table {
         self.inner.0.get()
     }
 

-- 
2.56.0

