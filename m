Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646863;
	b=nESMaPLrL+vnE8+W+/HhSVCSnbG3wG6PES110xhz4bx7V9V7Ij1VYf8It7PA6UOvI0Yp
	 QFBsM6Z7egDRXUsmVQ3228zOsDOUGSKDhzJ2ok0QAKqRiFVi5RUzy6+N2ANElnqPZzJgA
	 KaEzBoWBcrl5BTHmZDgfQsKbMtc3xYk6BuVjs7J67bNwbXUR+JPi41xWb1Yjvir+NOFaJ
	 6dAMaXlL1rBp+oD+37bc+6UyA73TlE6PXaiIsw1asttLG30gVr9CuoSIdts6W1RAfxJjf
	 lmsSvJP//HJdoq5vuRJt14RH60pT82SpgX1gt2+1U6oyA7Aj9DBXQcwjOBT0W/28yJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646863;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=qYaXgoIPVoWjn0UlVSrBwMDEjnv73NbP6vzIlAzAMJg=;
	b=zCqZ1vTxLoZUpcnc3VyKpzBnRARgoj8mJMYqN1FcVB/yTrQgH00LHnpezmFYRb5U8sOt
	 uTj8R+ed2R+4JVeNA4VmtcWdSPq1w8SNB/oINQlk2wd9OuS3K9Y6qwlmlzMW44b9APoRc
	 s3CTz/2CKW7Er2dNNM9XffNw19/Df1dh119KRGQhHbKx+OLiHgUGubJF9pTVCVDiMZr5p
	 R7yhBAddnXmHpVqji9XLULDBoG5oVsPr1wuBcY3KG6YTfMG5urbztpSY9vTrcofDG3usR
	 DnimsjZwcoPUfPBcd4qPWTMYYcQOH2jvamxDMbT5YZQRxiJ7zDwjb+G5FVADjGa/WTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IaB+LfON;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E5606A32C;
	Wed, 25 Nov 2026 22:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5E5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IaB+LfON
ARC-Seal: i=1; a=rsa-sha256; t=1795646829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BGV21UNbDR7gcmUiyAG518h9Lk2UL+El2sSfcjj0i+BViibAPE2Ju/jaqmcKXt9WKhFPmKCUsVEkP+Cc4gTou6AwTRpVGQoowGixs7Wbz4wmk3mH0vBwXy+nvsVdS0rCCQfCpMJ2SmacF3psVXTrWZuORpCiAgVmVqGCrZdCRMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646829; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qYaXgoIPVoWjn0UlVSrBwMDEjnv73NbP6vzIlAzAMJg=; 
	b=IHZPbqvbmmYB6PMSX9CBzkXcrZ/Sfc3rauvqVx5tGkBn8vPC2uUtCvS79OOpyQS8Jmzp/WDqmr1EEv2BYxLaBXFWuX9PlimrhxQ+frGeNlMSo5oozMl2HwB2s3l4hD1Rwk+1WQRRuc7EFJATjO0OXx+Z62R4HCDRZT7JJU+cnHI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=IaB+LfONHUpGEyaZ/Unz7Bu32TH+pZxUQnt105ndCjFY7p5CSlf0DYrz1cEXM5nvUyBVWYW84O3kQxDRyil6cZopfulRdWezMcDDVVKeRpMorbMkf1CqwJm27J0MvkF/br2uEGEdgaeWu7IHa5LbRY4gf8fi3kqg/GEm/zxOhoA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=qYaXgoIPVoWjn0UlVSrBwMDEjnv73NbP6vzIlAzAMJg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646827552932.8920723449709;
	Wed, 25 Nov 2026 14:47:07 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 00/13] drm/tyr: reduce the number of `as` casts
Date: Wed, 25 Nov 2026 19:46:51 -0300
Message-Id: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ7CIBBA4as0s+4kQIomXsV0wc+g4wINQxsN4
 e5iXX6L9xoIFSaBy9Sg0M7Czzyg5wnC3eUbIcdhMMqctDYW/YL1U9AJBidVUKXofQpu0fYMo3o
 VSvw+jtf1b9n8g0L9baD3L20QsKRzAAAA
X-Change-ID: 20261125-b4-tyr-as-casts-0fdbbfca4157
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
and nothing at the cast shows whether that can happen. Tyr has 86 of
them, as counted by `clippy::as_conversions`. This series removes 62.

Patches 1 to 4 change the type a value is kept in, so that it needs no
cast. Patches 5 to 8 use what the kernel already provides:
`SizeConstants`, `From`, `FromSafeCast`, `cv!` and the `all_bits()` of
`impl_flags!`. Patches 10 and 11 move repeated casts into one place.

The 24 casts that remain are each justified in a `// CAST:` comment and
marked with `#[expect(clippy::as_conversions)]`. 19 of them convert an
enum to its integer value. I intend to follow up with an RFC that
generates these conversions with nova-core's `bounded_enum!`.

The last patch denies `clippy::as_conversions` in the driver, so that
Clippy rejects a new cast unless it is marked.

---
Daniel Almeida (13):
      drm/tyr: convert SeatInfo::slot from u8 to usize
      drm/tyr: convert VmAsData::va_bits from u8 to u32
      drm/tyr: convert the lock region exponents from u8 to u32
      drm/tyr: convert EntryHeader to `bitfield!`
      drm/tyr: use SizeConstants for the u32 and u64 size constants
      drm/tyr: replace lossless `as` casts with From and FromSafeCast
      drm/tyr: use `cv!` for constant conversions
      drm/tyr: use VmMapFlags::all_bits() to validate map flags
      drm/tyr: justify the casts of enums to their integer value
      drm/tyr: add split_u64() for the 64-bit register values
      drm/tyr: return usize from get_pgsize()
      drm/tyr: justify the physical address cast in pt_map()
      drm/tyr: deny `clippy::as_conversions`

 drivers/gpu/drm/tyr/file.rs              |  2 +-
 drivers/gpu/drm/tyr/fw.rs                | 11 +++--
 drivers/gpu/drm/tyr/fw/parser.rs         | 62 ++++++++++++-------------
 drivers/gpu/drm/tyr/mmu/address_space.rs | 54 ++++++++++------------
 drivers/gpu/drm/tyr/regs.rs              | 56 +++++++++++++++++++++--
 drivers/gpu/drm/tyr/slot.rs              | 23 ++++------
 drivers/gpu/drm/tyr/tyr.rs               |  5 ++
 drivers/gpu/drm/tyr/vm.rs                | 78 ++++++++++++++++----------------
 8 files changed, 167 insertions(+), 124 deletions(-)
---
base-commit: 7402dd230f4497954b465145a22cff7a5a488629
change-id: 20261125-b4-tyr-as-casts-0fdbbfca4157

Best regards,
--  
Daniel Almeida <daniel.almeida@collabora.com>

