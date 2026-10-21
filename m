Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792541238;
	b=rBAJCPVZupROdj1GAcz9iWxKIJGEAJcBeCuTNLka85lwJ1yfgjtjZeA1oTE1VQxyXf3W
	 Uh2APsOankQ4mk0PQz/TYD3veXTrs1e0FKPJZqQitgsydrSCGkfIjBgi/bFmy/Ck8cf+f
	 uEg9MRtskfj6r1nLA7fvsNuanzsQ4noL0PO+esIK3dxvIOqGZeUvG3hefZ1ILe/5lHafk
	 ez0Ejjfiijsvs2hF34eBGtfvOZiw57oWjK3ptS1DH1GoleCqXxNnLNCnzj3zk336P7f2e
	 us8nb4+H/O73mfQXwg1ESH1vTBiYw/pGRwyGECNCxH8p3J0k3EGMxGylCt/ILPZqBpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541238;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xvVn8Y8fDCV94jW6KWPstvQM6iscLHTCd7/u3m0LTfs=;
	b=L//GEI5yQCOGAqZSeVKUnRUN3EsNV999bfxGg+rC9l+rOUDJUrJ9N84a9qYNsfJszvwq
	 +P+UfVMSz9hs3AiLXgFAD7Wqoq0eRMAp/rk/vYxiEblXpG2+SO6+A+3qAReXfFVuila5a
	 K1cI74eJssnZ1MVf6bykIwbFjFHhe9T19/VswykRVmGjEH0ZSTynubnTPLSjmAguyrITG
	 CyHwCmmwAkgjEO/tKF6zAtzcPG/Ehcd+eZgJ70lqHpQU+EBgxC7f3ONlc1nXK6oPeBTt8
	 IYneh5XPUa3Yg8mwuasVmP6ikta66PVNpGoXJ1+0fAD3qQrdZnzHea1kNFVkT0b9UFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Kk64iPFI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D7606A319;
	Wed, 21 Oct 2026 00:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 149D7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Kk64iPFI
ARC-Seal: i=1; a=rsa-sha256; t=1792541208; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mDNRmGcFsBoI+QahUVD4rH0GuzFzvfICeQmo8INaC4tWeyisd3SMPm8rCrvjQ29WK0ZCXzoXzxwn4+NRcyIwTMShSNwdlNn7xORA6vyEwUjr7Cgka3IcJ0o4hSsX+VgkBXWVSaAaL5jAlDiigdpbTGplfm5c+eORxYjr3kHTBBs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792541208; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xvVn8Y8fDCV94jW6KWPstvQM6iscLHTCd7/u3m0LTfs=; 
	b=OhrWFmGHgLm3q+r73Q31S1Zl6V9ZSbriMBZgpZ2ughJgskXJs6VprkNDxjXjJ7aigMW/AJEBvUDeejvoNjw3OYEXK3QQpVRam+Du2v6wZ9dEaeq9skxaGXnh6tMwM9TRzVCr14aRThdxaFwJQxgS/avnOnRxZ/8c3khk7Ez3wL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792541208;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=xvVn8Y8fDCV94jW6KWPstvQM6iscLHTCd7/u3m0LTfs=;
	b=Kk64iPFI+la3xEnrUdP/iMSv4DN3klAcgpqq6/2/+TlCJtHMPHebO7xQSru3T9yo
	nl8kptpnWtNeFYSQ42Gx7vcAMKQ+9NvwhTWYAtvnKWa70X3raaYLKMt5iNb/uNmMpRe
	YuXUUJch71o9EA/Omge/4HBzngexmCiudXsqgvoY=
Received: by smtp.zohomail.com with SMTPS id 1792541206606520.137903256707;
	Tue, 20 Oct 2026 17:06:46 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v4 0/3] drm/tyr: allow mismatched buffers for dev_query
Date: Tue, 20 Oct 2026 17:06:44 -0700
Message-Id: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QS27DIBAG4KtYrEs1DA8Hr3qPqrJ4jBOkJCTYs
 WpFuXtxsmhURd0g/cB8MHNlI5VEI+uaKys0pzHlYw3qrWFh545b4inWzBDQCBCKe8Ujzf35QmX
 ph/RNI1cEzgMqtMqxWngqdD+odZ9fNe/SOOWy3N+Yxbr7LzcLDtwiKCkAvGrxI+T93vlc3HvIB
 7aSMz4z+iWDlSFJJqIGDcG/YuQzY14ysjLDBloRopNa6L/M7dFxofOlTm96tP07vK5ZdbAoV31
 7uvTpOOS6TNkv9TYPGJUe0EodNt2s1wF6NxKv+CFNXSOVbZ0CiUZ5sIp8NMJvfKu1MDpqQ220M
 ci2/uT2A7QKKhTPAQAA
X-Change-ID: 20261014-b4-dev_query_fixes-4e0ab024294a
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=3mXYYH2Wyp7iMdOVfIyLyhIL3ZJckx+Ml8KpZV29isc=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFk3mERfTo/dHbnGdP7B+5tdf7y8z2Q7r3NNVohomLxKw
 L7vwlmtHaUsDGJcDLJiiixn7Y16xKveG+nO/98MM4eVCWQIAxenAEwkrp2RYe2anoJHPh9UcrpM
 2DZM9Xf2iJdcd+ubcoQBr0TXDYfLKQy/2ew6i2Pr2/6c5l5am/vvUkpFyrqEtlf9DAsfrtqvfjq
 XGwA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Panthor UAPI for DRM_IOCTL_PANTHOR_DEV_QUERY allows userspace to provide
a smaller or larger buffer than the kernel needs. Revise Tyr's
implementation to match the expected UAPI behaviour.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
This series depends on:
[PATCH v5 0/2] drm/tyr: safely write GpuInfo to userspace 
https://lore.kernel.org/rust-for-linux/20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com

Changes in v4:
- add new UserPtr method to accept u64 address
- replace write_truncated() with write_slice_partial()
- replace AsBytes with IntoBytes + Immutable in set_uobj
- replace u32_as_usize with usize::from_safe_cast
- remove redundant import size_of_val
- Link to v3: https://lore.kernel.org/r/20261016-b4-dev_query_fixes-v3-0-f8071cda3515@collabora.com

Changes in v3:
- replace "as" cast with lossless u32_as_usize()
- Link to v2: https://lore.kernel.org/r/20261015-b4-dev_query_fixes-v2-0-e3e6d25050cb@collabora.com

Changes in v2:
- Added #[inline] to UserSliceWriter::clear()
- Link to v1: https://lore.kernel.org/r/20261014-b4-dev_query_fixes-v1-0-92043100b472@collabora.com

---
Deborah Brouwer (3):
      rust: uaccess: add UserSliceWriter::clear()
      rust: uaccess: add method to get UserPtr from u64
      drm/tyr: allow userspace buffers to be mismatched

 drivers/gpu/drm/tyr/file.rs | 49 +++++++++++++++++++++++++++++++++++++--------
 rust/helpers/uaccess.c      |  6 ++++++
 rust/kernel/uaccess.rs      | 33 ++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 8 deletions(-)
---
base-commit: 3497a403264b094ebd61b8b755165d56e7d9dc37
change-id: 20261014-b4-dev_query_fixes-4e0ab024294a
prerequisite-change-id: 20260923-b4-gpu_info_intobytes-c2d45f2935c8:v5
prerequisite-patch-id: 0ff3c9871f563680d2888d489cc155cc52788048
prerequisite-patch-id: ecf0aed0bd7e4f8d3bc1bbaabb02976fc8d5fa4d

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

