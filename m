Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4B317163;
	Thu, 16 Apr 2026 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776359859; cv=none; b=ruD4mVaRdxnqw2pOudmnzCAP+AK0sU8JAtjUx9eXibvfX/TBXtG6aAi29aWbTgMkOudyKPdyWDfK71Jq1b323SDQsRl24vXChVauI6PtsWpltwK4+uh1/XARr6+cwjDbszF9GcC+99PIvaWCcIj7b1/WjhPz5DSOdTXE8TZHnpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776359859; c=relaxed/simple;
	bh=UHdcDdaUC/BRBzyjcTOP0gSYDOKIkkH+L29JAUmJeMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TtcSq6q8euC9Ua/fsAVdXcjrfFdkuixSA6q9dSG4JpgXWObi4TPOPPlGdf3l/4kArZLNn1f+F4WbdaaS7RuJKSyAdBzZpkzZww/feQra5vtPOZ5zH+wXxnSpn48F3kkelQPdOQWA+xv9H6tiz2UhsRxPgEkDqTzGZPpucnxsUr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=DYhGdGfP; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="DYhGdGfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776359854; x=1776619054;
	bh=kKkf/oVUaWX/TtBj3YjWMsOXTLOwLzh0/60F3Yx6pE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DYhGdGfPAhtnr7lPY5hhM8A9hKJeoqe5+NEamYNoyB/1EfTE4jloxQyVIBBI7pUSY
	 M8uerP2o8emFGFhCUQMpjW/yQf6BGD7H9BFEoRh1Rxm5Qd1GhqZKzzJ3VxxVe3azse
	 efKyT17mVoPIg6qvdiBFQbxis5gSYzx6X2Ft8YbAf7fG7Cx6GBPl+9VrJwx9uhdCzg
	 xmLg7LqXuFcQWg9lO380aUQ98onXVbIxvvtpUPPzCJIU9JG/Y9my+773usWybyufYX
	 OBb4+YNAPEZ+IK6nufIwms1Vzj7DUlkS7XYOzSpuWYYWII3NPf34CWSf2BydExiTU9
	 KX2v5/kc9VIUw==
X-Pm-Submission-Id: 4fxPpN1zmzz1DDrS
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 3/4] rust: add Work::disable_sync
Date: Thu, 16 Apr 2026 20:17:27 +0300
Message-ID: <20260416171728.205141-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260416171728.205141-1-work@onurozkan.dev>
References: <20260416171728.205141-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds Work::disable_sync() as a safe wrapper for disable_work_sync().

Drivers can use this during teardown to stop new queueing and wait for
queued or running work to finish before dropping related resources.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/workqueue/mod.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index e30c21214a81..7f63d778146e 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -582,6 +582,21 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // the compiler does not complain that the `work` field is unused.
         unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
     }
+
+    /// Disables this work item and waits for queued/running executions to finish.
+    ///
+    /// # Note
+    ///
+    /// Should be called from a sleepable context if the work was last queued on a non-BH
+    /// workqueue.
+    #[inline]
+    pub fn disable_sync(&self) {
+        let ptr: *const Self = self;
+        // SAFETY: `self` points to a valid initialized work.
+        let raw_work = unsafe { Self::raw_get(ptr) };
+        // SAFETY: `raw_work` is a valid embedded `work_struct`.
+        unsafe { bindings::disable_work_sync(raw_work) };
+    }
 }
 
 /// Declares that a type contains a [`Work<T, ID>`].
-- 
2.51.2

