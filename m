Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC032FD66D;
	Fri, 16 Jan 2026 00:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768523777; cv=none; b=XMpWciyoKVUiHZW3jLIa2OHUGE4pi8SPX42X4CneroQ2E8NSKpClRe3WWMUtcgfw44oPKdm2kHO52AXMJpgApFINTV3sf13md0Y8zq3m4iNVpyxaeiXcRP14XVozLkKlY7L3asq7d+XLVtBMD5w7b/swCiSqn8ZhH7J/3OncIKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768523777; c=relaxed/simple;
	bh=o7a0hN8233hHD9BCGtRr6Gh5sxlycp6ly9Wn2+YrBFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCXpw3Yb15ux/VjxMHU2/u4PUOMq4EwP0x+v9Uhg0IP22OK9hc3kCFqeZSQOmCwhP1HVZ+eF5c/Nvx+p5gWfokb8RcJSz3oBdrnYUC/J43N05vIBGBQMkdVfLxTV2ytWuShpYo5WVlfGQeGVNsIXvO8DV5SkiQQl6z3LWxA/ghw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o1S/K9ME; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o1S/K9ME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768523771;
	bh=o7a0hN8233hHD9BCGtRr6Gh5sxlycp6ly9Wn2+YrBFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o1S/K9MEy5kdjtOUR5xIdio2/QW9LDIAHwbzPYasAuMD+EFzo2RyXSg+KGSVHP2hl
	 gVVodzkI6qP1JHOGeNGkr0w0SWCHGWa3cwcNEyjfOJQytpdO60XmlIJJIohE9GRIZZ
	 pS7AMuj7giqph3CYXo5mtJ9kxahWi3x5CDC0+E7IrqE6XFDqWwmU4rl/QTKZBTq3iI
	 sGHhn/Ar4DkKoofCFEGgMHfnLhuhDqI1FTx1MCo9/JPqJ24C8byquJb6auCYJRaV+N
	 oVKxqFTWW4ECbuyUre+qnGsMMMzY2XoKyQ2iTpgwYDORCZqIoQnNGrbvSmAa4onUAr
	 CrQERMo1O7wiA==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B69AC17E1380;
	Fri, 16 Jan 2026 01:36:08 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 15 Jan 2026 21:35:59 -0300
Subject: [PATCH 3/4] rust: workqueue: add delayed work support for ARef<T>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-aref-workitem-v1-3-9883e00f0509@collabora.com>
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
In-Reply-To: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.3

The preceding patches added support for ARef<T> work items. By the same
token, add support for delayed work items too.

The rationale is the same: it may be convenient or even necessary at times
to implement HasDelayedWork directly on ARef<T>. A follow up patch will
also implement support for drm::Device as the first user.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/workqueue.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 6ae7f3fb3496..4ee4ff567197 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -1007,6 +1007,17 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+// SAFETY: By the safety requirements of `HasDelayedWork`, the `work_struct` returned by methods in
+// `HasWork` provides a `work_struct` that is the `work` field of a `delayed_work`, and the rest of
+// the `delayed_work` has the same access rules as its `work` field.
+unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for ARef<T>
+where
+    T: WorkItem<ID, Pointer = Self>,
+    T: HasDelayedWork<T, ID>,
+    T: AlwaysRefCounted,
+{
+}
+
 /// Returns the system work queue (`system_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are

-- 
2.52.0

