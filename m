Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017F127AC28
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757557; cv=none; b=BbURBZQlOAnqN54nKQx9ma85uWBuVbgyjsIqfb+zfqTl72s0bXC0K8ZjUNPjaPOrn4N17h3APRe4yuvHcbUxbn9apucAOh4m6ECyWZB23srrn+1G/owgl9zbkiwx/qKH31hyn0X5Ra+YbSad9VV11D91NZ/EHQwTyQ2UpCNLKAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757557; c=relaxed/simple;
	bh=sYf9mbBz632sHn5RbCo4WqjwBkjv/wKAxbIHxJSou88=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L10lpTS5Pemqck58+vN6t/i/hjZL9ra1jP2RuZX8+ghtAmEOQ2zKfW55EtCijE/t5B8qIu5wIcx9+zKp7S+wFSWIlINZET4UDXW3LuA4Y1Jvm8EMSlufiFyrhpCzXDKWQ2Uc2BinyMiSUPMK8vj0+lonbH4V+qq4aY110dA8ii8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEE3C106F;
	Tue, 24 Jun 2025 02:32:10 -0700 (PDT)
Received: from e129154.arm.com (unknown [10.57.66.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 309BC3F66E;
	Tue, 24 Jun 2025 02:32:23 -0700 (PDT)
From: Beata Michalska <beata.michalska@arm.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	alyssa@rosenzweig.io,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Drop Opaque from IOCTL args
Date: Tue, 24 Jun 2025 11:31:58 +0200
Message-Id: <20250624093200.812812-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This patch series removes the use of `Opaque<T>` for ioctl
arguments in the DRM Rust interface and updates the Nova
code accordingly.

v2:
- Missing Nova changes now included
- Fixed formatting and added comment on safety guarantees

Beata Michalska (1):
  rust: drm: Drop the use of Opaque for ioctl arguments

Danilo Krummrich (1):
  drm: nova-drm: Update ioctl handlers to drop Opaque usage

 drivers/gpu/drm/nova/file.rs | 23 ++++++--------
 drivers/gpu/drm/nova/nova.rs |  1 -
 drivers/gpu/drm/nova/uapi.rs | 61 ------------------------------------
 rust/kernel/drm/ioctl.rs     | 11 ++++---
 4 files changed, 16 insertions(+), 80 deletions(-)
 delete mode 100644 drivers/gpu/drm/nova/uapi.rs

-- 
2.25.1

