Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAC32FD69E;
	Fri, 16 Jan 2026 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768523776; cv=none; b=NTMzUT1E9WjMzhcuFXZIwkt2AIOnETY5e1BNRRr0ANcEaG30cHY38cdEGkEiXdMdBQcpRyMvASZjAJlIqFKDKmkXW3z0oLWGrWmMEx0rkMbJDkq9ufiWbYP0E5PnSMB76stvowjvH8FW1NpkLF9pObaOc7wcuGuJBweFjtDtgiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768523776; c=relaxed/simple;
	bh=dd+gf/jKyogh1Q1ivowg9YoTCKDzuqKUdBLw/sUwIr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nn5LJZJkgc8/1UiloL/RMNQ7LjeAl0V1y2DM+CiCyETMT+/m/i4MwxYz6+t6c45Qx3FWFDzGpKJcILPH5q1mEMwkFf3nIIu9ucaXhC+den6NXOqh4BeT9h3cNxI9U45OC9RzrG5km6r1xPUOyB1jYMopZLy9ldmjhtWhfhuY4Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MCFiBk19; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MCFiBk19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768523773;
	bh=dd+gf/jKyogh1Q1ivowg9YoTCKDzuqKUdBLw/sUwIr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MCFiBk19KSyzj3GNb4YQJWZ+yHiLyG5SCkvs8n4GwaC519KqFbMWcPQ4LlJ3aW8RA
	 Vyjtg1PDih0R4um/Cn46Lxxedl/TETvzArrwf5qkmvb8dasAGZ6y+vkRRJLJE4au99
	 6HMC7Xr75RfS08YIFTE8ZRVIJyiqnViBexaZZyR610IXJq3xkU61jBuvC3uyMnrnK1
	 +2gkg6Bht0x20HmH0v9P/XPZL4YLuxhqKF1q2cQlMaatQNUQ+Z8k8Y2w7SDkFTq/sp
	 zpEzQFKvx08vIzj+Dfz7lVk3xzdwBRNaZ4oygUuPwGfK3tpte17IUPHuvNKPMbT3Lp
	 1Vq/bPpNCDQHQ==
Received: from [192.168.0.79] (unknown [IPv6:2804:14d:72b4:81ae:67c:16ff:fe57:b5a3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 63D8C17E138B;
	Fri, 16 Jan 2026 01:36:11 +0100 (CET)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 15 Jan 2026 21:36:00 -0300
Subject: [PATCH 4/4] rust: drm: dispatch delayed work items to the private
 data
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-aref-workitem-v1-4-9883e00f0509@collabora.com>
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

Much like the patch that dispatched (regular) work items, we also need to
dispatch delayed work items in order not to trigger the orphan rule. This
allows a drm::Device<T> to dispatch the delayed work to T::Data.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/device.rs | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index c760a743e1df..ad0447e8763f 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -12,7 +12,7 @@
     prelude::*,
     sync::aref::{ARef, AlwaysRefCounted},
     types::Opaque,
-    workqueue::{HasWork, Work, WorkItem},
+    workqueue::{HasDelayedWork, HasWork, Work, WorkItem},
 };
 use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
 
@@ -273,3 +273,15 @@ unsafe fn work_container_of(ptr: *mut Work<Device<T>, ID>) -> *mut Self {
         unsafe { crate::container_of!(data_ptr, Self, data) }
     }
 }
+
+// SAFETY: Our `HasWork<T, ID>` implementation returns a `work_struct` that is
+// stored in the `work` field of a `delayed_work` with the same access rules as
+// the `work_struct` owing to the bound on `T::Data: HasDelayedWork<Device<T>,
+// ID>`, which requires that `T::Data::raw_get_work` return a `work_struct` that
+// is inside a `delayed_work`.
+unsafe impl<T, const ID: u64> HasDelayedWork<Device<T>, ID> for Device<T>
+where
+    T: drm::Driver,
+    T::Data: HasDelayedWork<Device<T>, ID>,
+{
+}

-- 
2.52.0

