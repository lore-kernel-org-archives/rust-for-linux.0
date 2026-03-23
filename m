Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A123876AC;
	Mon, 23 Mar 2026 23:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308477; cv=pass; b=X/fEgo7pUUYZWumVYsEwZx/vY1W6Cao3jS8jjsApPAFk7aw3Tdac5pGS5AvCSLwOhvefFP9k0EbM9CbdGG3DK0gVd07VzH2kYhQseiHwlzbgmHcbEqSq5P7OT9KQiOfMcJSz7Dc12AGlD2OD5MLp8lFLc1kyCcIMXRaymdd7gJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308477; c=relaxed/simple;
	bh=vWBsfRfDgqyYQLuP/6FgcoeYWelwJcDtgworp1+kXaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsHJ/lYxiSLYMbhi73ZLZOBfzZb08sKSYu8sXofVkRv0Z+Ca6LkUlggdYNB+kDHOQFSlVQdwozKSXRTKMU2nJ83ocfApvDwQuC9df/A+Bg3Z62F335FrA1lzJ2RKz1WeEkQdsmvmkTMcGS2eIWyBF4+ej1w61Ni4GLf/R/rOMbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=JKBtArGy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JKBtArGy"
ARC-Seal: i=1; a=rsa-sha256; t=1774308464; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bgprSye1Vvp5G6bGaUFvx9G8OD2nw+tFjQU/6/GuraboS6q2iwgr4WCmFnT5kzRkK80xbKfStvpybSK7MeyQ/GVZbE0HmAt3hRA3LZqv+HLQYzXZyf/nfbIIeVJScKvDueYVEctENcN67JkOu6ruCcGO+ASjFgFJ5Xct4VsxxJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774308464; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n2mQAmYZgm9af7m4XdXfvDKaJMRTqHc7fXRq9oM8rlg=; 
	b=PilbN1CG0jBiyEBX54uL/vE89ZsucJsCBgvrR/v6n3uA68lGkbjECNCq0Zcyv+f2crVH/00sSbi3Ya1v95cdnOGZxfQ/BrdFb/TgHw4recMOvCOKoQz8gv9QOuC0Y115Y8GHCnFWqrTrmXExfX4K37HvzhSllGYdCiVoVtLOe6A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774308464;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=n2mQAmYZgm9af7m4XdXfvDKaJMRTqHc7fXRq9oM8rlg=;
	b=JKBtArGyOFbDSQRmFO5LjjyTwgl+X1eJ+3GgN36Sc7Lh3waMSJe/7RghBCZQa3z1
	8yoCtdOfEUQJg5t1vqL6dN7KEsJFVIPtRP+aajaQeH6ai5eWgWTy5N/04QAXaPmMwEU
	QDX/UQK9yQ0yPbdjb/ZCNdFbbaUFGoGzt0ftXrIM=
Received: by mx.zohomail.com with SMTPS id 1774308462545484.8837925185438;
	Mon, 23 Mar 2026 16:27:42 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Mar 2026 20:27:02 -0300
Subject: [PATCH v3 4/4] rust: drm: dispatch delayed work items to the
 private data
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-aref-workitem-v3-4-f59729b812aa@collabora.com>
References: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
In-Reply-To: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
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
X-ZohoMailClient: External

Much like the patch that dispatched (regular) work items, we also need to
dispatch delayed work items in order not to trigger the orphan rule. This
allows a drm::Device<T> to dispatch the delayed work to T::Data.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/device.rs | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 5db5c7e3bb7a..adbafe8db54d 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -19,6 +19,7 @@
     },
     types::Opaque,
     workqueue::{
+        HasDelayedWork,
         HasWork,
         Work,
         WorkItem, //
@@ -291,3 +292,15 @@ unsafe fn work_container_of(ptr: *mut Work<Device<T>, ID>) -> *mut Self {
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
2.53.0

