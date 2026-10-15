Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C722EEE66;
	Thu, 15 Oct 2026 01:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792026183; cv=pass; b=k+xoGasAcHmHJZOoFj7yz+r+oqGgMaFGbSdAcihT9HOwaEfbtLJPcbO8Ere1lN3xz4LWdI14GloRutuPXkweGigLR/ffLn+y6TXEcEgi4/Q3NA47y0XtDq4QC1NHpQHv/Xddjz5q2QnV/440UUq8YJpvk/FntfgpKr7SoiSI0H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792026183; c=relaxed/simple;
	bh=OwWdTR3XhajPl3U4zGrx0KdjDKksTiLlAAPouO5QtDA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I59PiILKGsNfwGknCVYfZcrvFAVm9jxwAqhmfYiWWTc23Cu5TmpRmHAuK+Uqmp6Oc+ECzGW9nLloCYabO/xQgcJMhbqhbmgtUFRdlK1UPWoKNscz21bfRuG1qkeJlSxtMr+bjg68ayCfgewlNRL9siYsyeBP+b3ja7R0RFPo1YQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=W2W55KxJ; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="W2W55KxJ"
ARC-Seal: i=1; a=rsa-sha256; t=1792026143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GP1L/jtP7DrJ7QJoSmSnld9D3L43R/tNhAM9W/r4Xs0UHMPa2Ztvif9AdMxaFb5icU8njM4rQrhWkILeSIuoIzuUdeAkO/EEsONDd/JKQJI5XM9507+2rwThihvC/ICDwg2GT2ofol9ZS/M5HI7emtgxZgnERZ8c41dJ8AuyW68=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792026143; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZLfGeZI4u4aHgotCmZSC6LpPADowbtpwUTlXNmQWkQE=; 
	b=eurUnNzCYxqcjgZnQldpNDJWyVu5JsCdh1Lw0iu6LY1/CLonuN6Ssro+Fy0JfrHQTdSvnXFdmzWMFOAn6cfkGgOG3W50M8dk0UnCSS4pMiv5dB/sel+uMXTA4BNPFcyxZ7R9utgFG9IyxoGd79J231tdk3/J4pDxZKbftNbPRBA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792026143;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=ZLfGeZI4u4aHgotCmZSC6LpPADowbtpwUTlXNmQWkQE=;
	b=W2W55KxJRiaSzB//Go80ZKTV+gVE5rwv9llz5CWkOxQ+fjdjfoS3VR2KAPL0pAmP
	qXNlBPEDEDIn09AexRQXaoTIkWtzob72lRV17Vdp9mOaIuhZCrO8KRuOpPeqyGzY4CR
	fr8k3igjmiV+m3gwo1jTQ6Tfl6/Q8OGmEfJYiD+s=
Received: by smtp.zohomail.com with SMTPS id 1792026141942704.1542737296895;
	Wed, 14 Oct 2026 18:02:21 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 0/2] drm/tyr: allow mismatched buffers for dev_query
Date: Wed, 14 Oct 2026 18:02:02 -0700
Message-Id: <20261014-b4-dev_query_fixes-v1-0-92043100b472@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3L0QpAMBSH8VfRubba1knxKpKGP87NsEW0vLvl8
 tfXlygiCCI1RaKAS6JsPsOUBY2r8wuUTNlkta2MNqwGVhOu/jgRnn6WG1ExtBu0ZVuzozzuAX/
 IX9u97wd1NiNeZAAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=809;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=OwWdTR3XhajPl3U4zGrx0KdjDKksTiLlAAPouO5QtDA=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFkX1GQUfvdOYrezyPhlaiAt/PXFcknOybM/lHDeWJpjV
 7V0HbdaRykLgxgXg6yYIstZe6Me8ar3Rrrz/zfDzGFlAhnCwMUpABOpzWb477hMxbZx0fwL09u4
 I0unVKyZf3Z1b+f5e0t/c5u5riiy7GNkOMvscvumt6FwxLa2EPPwu+uPZKubPTuwqG2D3pMl4ZF
 f+QE=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Panthor UAPI for DRM_IOCTL_TYR_DEV_QUERY allows userspace to provide
a smaller or larger buffer than the kernel needs. Revise Tyr's
implementation to match the expected UAPI behaviour.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Deborah Brouwer (2):
      rust: uaccess: add UserSliceWriter::clear()
      drm/tyr: allow userspace buffers to be mismatched

 drivers/gpu/drm/tyr/file.rs | 45 +++++++++++++++++++++++++++++++++++++--------
 rust/helpers/uaccess.c      |  6 ++++++
 rust/kernel/uaccess.rs      | 23 +++++++++++++++++++++++
 3 files changed, 66 insertions(+), 8 deletions(-)
---
base-commit: 5a1b7121a6c4db6c0239d3ac3fd1c2bb33a40025
change-id: 20261014-b4-dev_query_fixes-4e0ab024294a

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

