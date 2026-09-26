Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2642E736E;
	Sat, 26 Sep 2026 00:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382397; cv=pass; b=Y3+AZsTE8NfJBcCudKa5xuDkmKoft11L9uFbZR3OZbFSyek7/Zq06AQh5hFjGFQmJeFFjyamzAKqGDGYG5aF0awVF8Ii8fi1r1yFhP3AL0JWYu/nOuaa1Ga+KJI5cy/vLXknBqQb5Ejvs037PB2Yv1QQDNg8m+k7cDPhFSZ0/3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382397; c=relaxed/simple;
	bh=hfK5OVz+2QcBJEGQp5s7j+sgirY7kP6SRjDdPIZcJd0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NmM3r1YnuDl+FIk2xwPi2BZz/WITZRREdWiwzsNx1ZVSahEpDZ/nOfre/cfLuCCwK7EhDq8de8yN96gBcqLNizDI4JQZdyr5Qs9X2DqNcHklJ/BEDU1pIoIoF/NrC576Yxy8+clXm87WjmC4zJehYqTJPynnidzoZAiElYIRE9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=bevBJB7x; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="bevBJB7x"
ARC-Seal: i=1; a=rsa-sha256; t=1790382372; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=O8LVy66XgkSSFMoP0QVFIy2/voxkfMS/j8bmyyeOFL2FSFq47dQFaPuaLL8zrL0kzrcX6IxxB2PGQ7o6RJSnfeaWB0ZAE4lbpM+2cIxhQyDLPir+WpmMrbwQ4mc2M8XabP6ErTsuGfEsUgXGdLKKFO0oMuTyXTByk/bZY8nAILQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790382372; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rwYYr3dzkkUgcOzLC5zgNrkaVjsF9YoWpxyb4GV7h14=; 
	b=bP4FXyfQcs6+IOAU1pEpJMGFkVnShDG9nnFqHpHUyFkxgXaSMS5qhiWC1hLtKpv8XvZVBdcNgy2qUwVBNv12i8ARniE7nS3d8loFgIfxuzK4uUmmItqUL8UpUy6awWyqta65q4UNYqzwFVo8VtsIdXTBkwGoLsnpyRMUe6WDcgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790382372;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=rwYYr3dzkkUgcOzLC5zgNrkaVjsF9YoWpxyb4GV7h14=;
	b=bevBJB7xQ7zmgyWERBazYF4tlCO0TlN0nmK5k3Dtkzeohub2uQN3pcwZinYAQwl+
	OycGyGtctZcJvEetykgiioAGjOyElBEUTdkdWPY8QqBAdIZwSrTx5BptjtN10VWSXau
	RpmAizxyGqP6NgVYVnCxIZSP07uZ6KxcYAltMFrI=
Received: by smtp.zohomail.com with SMTPS id 1790382371486273.5271645872215;
	Fri, 25 Sep 2026 17:26:11 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 0/2] drm/tyr: safely write GpuInfo to userspace
Date: Fri, 25 Sep 2026 17:26:08 -0700
Message-Id: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNUQuCMBDA8a8Se27h3WZpT32PiHDzpgNzstlIx
 O/e9CmC6OXgf3C/m1kgbymw825mnqIN1vUpxH7HdFv1DXFbp2aY4TErUXAleTM877Y3Lo3RqWm
 kwDXWMjdYilwXLN0Onox9be71lrq1YXR+2t5EWLf/xAgcuFIIJ2FKIICLdl1XKeerg3YPtqoRP
 yX5S8IkgcpyEqI2RSW/pWVZ3vuzyYIIAQAA
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
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=hfK5OVz+2QcBJEGQp5s7j+sgirY7kP6SRjDdPIZcJd0=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFnbBZWUpBZ5CT44nXzjkuDzHE0hCW3/iqd1sVffKev0z
 q/5WFjbUcrCIMbFICumyHLW3qhHvOq9ke78/80wc1iZQIYwcHEKwETyHRgZTm6/eub3JtfvbzWC
 Wl2iq5fkL1w0Q4bzSCPTSu7/ep251YwMW9aLRGe52IYka2Rdj5waIlWRk/NEgu/O26nFvq9lTOS
 ZAA==
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

This series makes zerocopy and zerocopy_derive available to the UAPI crate
so that zerocopy derive attributes can be added to generated UAPI
bindings. It derives the zerocopy traits specifically for struct
drm_panthor_gpu_info, allowing Tyr to safely copy this struct byte-for-
byte into userspace memory.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v3:
- split the commit into two to keep Tyr changes separate
- Link to v2: https://lore.kernel.org/r/20260924-b4-gpu_info_intobytes-v2-1-1b05e33df8a4@collabora.com

Changes in v2:
- use zerocopy_derive::most_traits
- Link to v1: https://lore.kernel.org/r/20260923-b4-gpu_info_intobytes-v1-1-bb2173f91e11@collabora.com

---
Deborah Brouwer (2):
      rust: uapi: add zerocopy/zerocopy_derive
      drm/tyr: safely write GpuInfo to userspace

 drivers/gpu/drm/tyr/file.rs |  2 +-
 drivers/gpu/drm/tyr/gpu.rs  | 12 ------------
 rust/Makefile               | 12 +++++++++---
 rust/bindgen_parameters     |  3 +++
 4 files changed, 13 insertions(+), 16 deletions(-)
---
base-commit: 896ed083362758b33c49a1b5e5a3423c5814d87e
change-id: 20260923-b4-gpu_info_intobytes-c2d45f2935c8

Best regards,
-- 
Deborah Brouwer <deborah.brouwer@collabora.com>

