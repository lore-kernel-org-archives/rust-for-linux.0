Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2730C37B;
	Fri, 24 Apr 2026 23:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777073998; cv=pass; b=WEQj8A920xnp2Sqs/1X3Jx6EZuRnTag32GlshJPqRFDJ/ISJpc1h8GSJ9qhdVVbVVzNuqtiYmsz0aujPsFxePQ4rb6jrYHyMxMtjKWf0gIoELlYeXHYjwS+oG+mSQUmwFYXQD7LN5shBfZhZMDRIFKpWtuVsHMIX8Y8e6v85jbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777073998; c=relaxed/simple;
	bh=n3WZMErEy6oVIqhhH/21DmsPSrqalZYcPgPTfJaLSp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cBQz2NJQc3FB5EtyhbpTdi1KXZ7BnoUjZNS+0x0sDi/PrNy+HBSVHAHxJ4E7N8Ez2YOChnJXiB0bFT+KN5nQJTWITAC7yn1KJh6kHnM9IWveH955a5tgQh5sxNjFA+Q5p5/jQOYq8Mpb5DOhCpPDVeRNOUSX0UQGgwVIJdAuGTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=VsgZXNQm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="VsgZXNQm"
ARC-Seal: i=1; a=rsa-sha256; t=1777073963; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GBjEnMlVyUe4YivVbiRTbiwC4Y6+GrkaEfWB7wyrcz7KHalJ06aKHf4mNVwD7wxY4T509eZrR4X8ihUYWP/N8XFuxhrQ5iO8Hc27MjbaxhKkvzHsVu7FQd4RY0k05IS1Bb6DDArkCP1b184N5X3HJWp7Lcf2mmJe51mqfQbRCAc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777073963; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3dTFROfvAzEnMmmF6K1xMdBFrCP2mhHx9BiBGFP1Ct0=; 
	b=HcoWkxLziWeW/RY1tzz/pNGi3so9W9fCQDhYTnY2bcdLoAF+j85xLOOErZ4QmgXb3PW0moksvyjIxv7KwwvTJAtEApAHmQELlKlsbppVFEOt6clWYMCeJnHdLzFuAJXs1KleEhg+ZLPiB9TrkTBLFBMbCeahHqhlzL26Yi8iyy4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777073963;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3dTFROfvAzEnMmmF6K1xMdBFrCP2mhHx9BiBGFP1Ct0=;
	b=VsgZXNQmFOEF7qIB+VCvdZmQESQ2moY0Ko5xRYjjZHdUiFHynbB9/slIIByLWRsL
	Z5WMctY8NCdUUcBSEzEv3tx1xiMcj1surQJodn9WwHqPpDZ7A9UGc3RWyl92OmO8IUH
	EU2LU7WiNi0YNAZErVbVCXSP7VYmMqZTgXhWwZoo=
Received: by mx.zohomail.com with SMTPS id 1777073960956568.8864358070433;
	Fri, 24 Apr 2026 16:39:20 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Fri, 24 Apr 2026 16:38:59 -0700
Subject: [PATCH v4 05/20] drm/tyr: use shmem GEM object type in
 TyrDrmDriver
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-b4-fw-boot-v4-v4-5-a5d91050789d@collabora.com>
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
In-Reply-To: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com, 
 work@onurozkan.dev, alvin.sun@linux.dev, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=4Ba4ZrUKq66SWVeeJW+wemfXBYB6qyOZr6r0bmtZhd0=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJmv/ytk7OY7eUtD5/QXY1/Xe9PXHNyjcPZD5APZQwEZC
 rlGHnNqOkpZGMS4GGTFFFnO2hv1iFe9N9Kd/78ZZg4rE8gQBi5OAZjIY0lGhpa+ipWHRLQN0gPE
 3aWyz9f6/Nk1JUvngHP1UtuA0BMMTxgZttb9XfWX79rMP1Wuzm8fLtl2+JSXxZZphWztMx5KqTP
 NZAMA
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

From: Alvin Sun <alvin.sun@linux.dev>

Tyr buffer objects are shmem-backed, so the driver should use
drm::gem::shmem::Object<BoData> as its GEM object type instead of the base
drm::gem::Object<BoData, R> type.

Switching to the shmem GEM object type matches how Tyr allocates and
manages its buffer objects, and uses the shmem-specific GEM abstraction
provided by the DRM Rust bindings.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index f2e7157221f1..26a20e0ab91c 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -183,7 +183,7 @@ fn drop(self: Pin<&mut Self>) {}
 impl drm::Driver for TyrDrmDriver {
     type Data = TyrDrmDeviceData;
     type File = TyrDrmFileData;
-    type Object<R: drm::DeviceContext> = drm::gem::Object<BoData, R>;
+    type Object<R: drm::DeviceContext> = drm::gem::shmem::Object<BoData>;
 
     const INFO: drm::DriverInfo = INFO;
 

-- 
2.53.0

