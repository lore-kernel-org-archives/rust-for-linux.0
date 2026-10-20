Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792540107;
	b=uAP1wWXe/yjed2swehT4oCm9TpESJnKc8xOC6o3dMwjFVXfgWu6oB6lwJVuCVN2AlPTu
	 xRFXiY3idSPW3oE0Fw+QAmYH5W2Yont6WzuvfH+4THE2RNIFq/0ajAvwEoBLkd8/PDuG0
	 o8KT8eCDx81z7q82nZjr+U/JUl7xeVYBwXgcGiA1AYP6uLfS1BYvC1FbLAcv1I2IUreO+
	 Q5+nKBuo4U9Gudn08gisF++lW3FbNPUyVvMm//Qb9sqWAT9m87inTOQcev2CHD8J+Yw9O
	 zhUfM84DVBUwVU44Yy2Sl1JJ/sGgwRzYLmzJy/WZBB3A9XuuBeCSEUPQUfPCJ1GbhAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540107;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pezBLtqw+G7PzHP9O8j/M3idu3JQdHPwYogFZHrBkXc=;
	b=e64ohfVwaYxb1fKigKJSkW5d0w7i36MGK9mCwFnytGUQerTTCImX+fGCmZo9521VbZZz
	 DmbGKzeIJTfbGZlwos3wFiSjXb810AQ+pxcG8IJLXIoU5xUSdd9/XY7ZLr2zygGZgXFUy
	 oKlDdELxxix6OM8UIQOW7yWkwdd+sOSAncgDPdBL2iiKM1wvV1kls7xe25FOyKKwyqMOO
	 6Og12k6TXea6naL3bYzFRunTCYkEwUnyDpBsehejqeaA79EUbOUanPl+RCT4zaJ00+HHi
	 odCwDXQbDSI+ZZjHUqSPLrJnPeVxNbqBwn9gdi4qn3Ip277qSlEGBsIK99PXULcifcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TZe5GLfO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2942606A31C;
	Tue, 20 Oct 2026 23:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2942606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TZe5GLfO
ARC-Seal: i=1; a=rsa-sha256; t=1792540074; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DL68KABmwX1jVaiLY4jS1lnjFd5D7l0OY5EcsqC67BmDyOwFQzFkuS4xYGND+JBWlrDVJgvO1kvxCKsIQKW7DlAkxcuX950q2go2LnHfyOPAInsAu7bdiYg44KwxeHJaBRErW1fCMowZp8V7bnzP6En0bJo67OGciD6D32G+Zwc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792540074; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pezBLtqw+G7PzHP9O8j/M3idu3JQdHPwYogFZHrBkXc=; 
	b=OiG7/loHyO2WpRfMm19OL0GXYG/3OL3xkj0NZJ3hGwIRl80w0c1AUB332H71lqfNxsPWvuOPnd7GIMkWvbmCq2WR01nt+enM7nOvb+FOjRci2e+sVxv6kS/3sApkO8n1/d9NbpcunxUMIRCqUwGpwe82GwtS7/BnzE+mMskQr8I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792540074;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=pezBLtqw+G7PzHP9O8j/M3idu3JQdHPwYogFZHrBkXc=;
	b=TZe5GLfO1igVt9x6lC1CwUQ4D/poy4OjXMjaWcIB6u9q0FqVi1Vyccwu7tf8hTEc
	l1yPSn1Y0gevs+JGfh4cDNEBOvZy/o+PUuaVPXIga+zkXrdzlmnL7nDKrRHqtbq91xM
	yNad4HmkwMvDEQBVbsA9mq202lvfgp5efSRy6t9I=
Received: by smtp.zohomail.com with SMTPS id 1792540071239475.70856863747576;
	Tue, 20 Oct 2026 16:47:51 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v5 0/2] drm/tyr: safely write GpuInfo to userspace
Date: Tue, 20 Oct 2026 16:47:47 -0700
Message-Id: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNwWoCMRCA4VeRnBvJJBPdePI9Sik7yUQDdiPJd
 qnIvnujB5Hi0svAPzDfXEXlkriK3eoqCk+ppjy0sG8r4Y/9cGCZQmuhld4op40klIfz92caYm5
 jzHQZuUqvA9qonbG+E+32XDimn7v7/tH6mOqYy+X+ZoLb9j9xAgmSSMPWRAcMsPf5dOopl37t8
 5e4qZN+lnBJ0k0CUpaNCbHr8ZVkniW7JBmpJIMjT1twnQqvJHxIoMAtSdgkRV5hiLix6P5K8zz
 /AtRTPW+cAQAA
X-Change-ID: 20260923-b4-gpu_info_intobytes-c2d45f2935c8
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jesung Yang <y.j3ms.n@gmail.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=HZSB5ct5YzvLCmCx+2Ullgo2DnKnOBJ7e5n503QWDOE=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFnX/y6dXfY2S7Pp8eVFpUs2bXxw/VVUx9xdnMGn812YF
 ljEXzCX7ShlYRDjYpAVU2Q5a2/UI1713kh3/v9mmDmsTCBDGLg4BWAiFgEM/7Svebt/SRDdeoqt
 JUcmNaJk4TOPCU+ezbugpzlVv+CGuiHDP6Vpl25cNBFXfv4xx/iU06wpk8r2f7n0gd1nv2ZH9c1
 WaXYA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

This series makes zerocopy and zerocopy_derive available to both the UAPI
and bindings crates.

It derives the zerocopy traits specifically for struct
drm_panthor_gpu_info, allowing Tyr to safely copy this struct byte-for-
byte into userspace memory.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v5:
- broaden subject line of first patch
- make zerocopy and zerocopy_derive available to rust-analyzer
- use 4 spaces instead of tab in make file
- re-order imports so external crates are grouped together
- remove unnecessary invariant comment
- pick up Reviewed-by tag
- Link to v4: https://lore.kernel.org/r/20261019-b4-gpu_info_intobytes-v4-0-0bc04df46549@collabora.com

Changes in v4:
- add zerocopy and zerocopy_derive to bindings crate
- move derivation for drm_panthor_gpu_info to tyr patch
- use kernel prelude to import IntoBytes
- pick up Reviewed-by tag
- Link to v3: https://lore.kernel.org/r/20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com

Changes in v3:
- split the commit into two to keep Tyr changes separate
- Link to v2: https://lore.kernel.org/r/20260924-b4-gpu_info_intobytes-v2-1-1b05e33df8a4@collabora.com

Changes in v2:
- use zerocopy_derive::most_traits
- Link to v1: https://lore.kernel.org/r/20260923-b4-gpu_info_intobytes-v1-1-bb2173f91e11@collabora.com

---
Deborah Brouwer (2):
      rust: add zerocopy to bindings and uapi
      drm/tyr: safely write GpuInfo to userspace

 drivers/gpu/drm/tyr/file.rs       |  2 +-
 drivers/gpu/drm/tyr/gpu.rs        | 19 ++-----------------
 rust/Makefile                     | 24 ++++++++++++++++++------
 rust/bindgen_parameters           |  3 +++
 scripts/generate_rust_analyzer.py |  4 ++--
 5 files changed, 26 insertions(+), 26 deletions(-)
---
base-commit: 3497a403264b094ebd61b8b755165d56e7d9dc37
change-id: 20260923-b4-gpu_info_intobytes-c2d45f2935c8

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

