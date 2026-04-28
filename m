Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C31A3172;
	Tue, 28 Apr 2026 19:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404009; cv=pass; b=iWiwcsKRY52GbE/aSCOk+S7jydveLchYKI5rEbFvC4er9GGDQgpKUyMxm/Ge1xX64wWpPMlypL9wTeLh9dfCJaxOa2XGeAxgt8CsxP49zLIT0we0EJeISDzeJfLAa2zYDEXawCRWviz21+PrzcZtKXOuDnFSBeH3YBpwjMl688c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404009; c=relaxed/simple;
	bh=wHgzwMRrUJfYHHfE2WXBX3WbLk6oFnOfTwqgKpYvPss=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I99UDFORmkzmTHrF5QakFZLVG59RHgaq5WABcRhzYm+Wj8ymQDjsCkn2bPOICirtzHpEcS7Cach4BFsAMiwGqe193VoYjKqqnSTHyE88kJF1S+FI7nX2TB824LiaphGxsipVFvi6hWMYXuLl6/kLoA41VeOpW7A4u/uYv6i2V5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=R8Q85/yK; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="R8Q85/yK"
ARC-Seal: i=1; a=rsa-sha256; t=1777403977; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kEGJsl+wJc2C/uKS0Imj0Vz3z6fm56lUpZOfHeXnG52IeHttaFayAxLb5nJTANP+dr74xa0UlMUE5rFQnx9uNZ1LseIsc4PkxDsL6VeuGEncEPt5//ox7PP/Tb5uJEG6RV5N/M8ugHXIhnb4BOlRChj6y/SBxygVpenwSMOl+sk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777403977; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O5ChZpERESFjQ41mP5fJi6iStflTCM7Ma/ZJ2ceV8ZA=; 
	b=RvTvgTEsxuwezsnR2iZXFmvI9bNzRmwTV2Ztw5EHJRFVIRPB8Ez/W2rZM4QpdPv305JuW0PtMv3gTlLPerMnSXOzThFlnxbCjrMKdCz6N3v/PBDeORXy18uVyw8UcJft9ygWrE+1IDarzpRfqxmygyRU3KNtxoZwc2VFpuc2Bic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777403977;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=O5ChZpERESFjQ41mP5fJi6iStflTCM7Ma/ZJ2ceV8ZA=;
	b=R8Q85/yKo5tBWMP42QCMSPEGNuK/hRuiUYv5oMuPeWHguESLVKupWhxS+pqK6Aud
	5CLyteNPVVvspvGJhcVs9wmdS1t6/MZaPYjzLntDe3H3GqIqcadFYLdtR/VAk0yAMOL
	62X/kMnjkS2GTA35BrqgNkl0uE7mP6LqNaC1YZKM=
Received: by mx.zohomail.com with SMTPS id 1777403976360389.23902430689645;
	Tue, 28 Apr 2026 12:19:36 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 0/5] drm/tyr: prereqs for firmware loading and MCU boot
Date: Tue, 28 Apr 2026 12:19:27 -0700
Message-Id: <20260428-fw-boot-prerequisites-v1-0-c69af9abe1af@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2Myw5AMBAAf0X2bJNqkPIr4lC1ZS9K65WIf7dxn
 ExmHkgUmRK02QORTk4cFoEiz8DNdpkIeRQGrXStSm3QXziEsOMaKdJ2SLBTwqaxta+MJWcUSCv
 W8/1/u/59PyBwHR5nAAAA
X-Change-ID: 20260428-fw-boot-prerequisites-99a6f58aec80
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, work@onurozkan.dev, alvin.sun@linux.dev, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=wHgzwMRrUJfYHHfE2WXBX3WbLk6oFnOfTwqgKpYvPss=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJkfOdxv1x9RC1baszFe6V9KE3tNG9PyWsnrnpavXC76S
 s347rGmo5SFQYyLQVZMkeWsvVGPeNV7I935/5th5rAygQxh4OIUgIksvsnwV+Kzh/K0XlXBsH3P
 bZI4du1d9nWGfIFJiNHmFNGZUQeeLmD4zR6leD36x49lk67HPnlopPpr86vOsLytjwQ2eB8XiJt
 hywsA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

This series extracts patches from the Tyr firmware boot series that have
no additional prerequisites and can be applied directly to drm-rust-next.

Most of the patches are unchanged from the fw-boot series, except
"drm/tyr: use shmem GEM object type in TyrDrmDriver"
which now also selects RUST_DRM_GEM_SHMEM_HELPER in Kconfig.

Link to [PATCH v4 00/20] drm/tyr: firmware loading and MCU boot support
- https://lore.kernel.org/rust-for-linux/20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com/

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Alvin Sun (1):
      drm/tyr: use shmem GEM object type in TyrDrmDriver

Beata Michalska (1):
      drm/tyr: set DMA mask using GPU physical address

Boris Brezillon (1):
      drm/tyr: rename TyrObject to BoData

Deborah Brouwer (2):
      drm/tyr: move clock cleanup into Clocks Drop impl
      drm/tyr: add shmem backing for GEM objects

 drivers/gpu/drm/tyr/Kconfig   |  1 +
 drivers/gpu/drm/tyr/driver.rs | 39 +++++++++++++++++++++++----------------
 drivers/gpu/drm/tyr/gem.rs    | 24 ++++++++++++++++++------
 3 files changed, 42 insertions(+), 22 deletions(-)
---
base-commit: d9a6809478f9815b6455a327aa001737ac7b2c09
change-id: 20260428-fw-boot-prerequisites-99a6f58aec80

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

