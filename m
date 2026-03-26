Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F53B3914E2
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508153; cv=none; b=ALO5thy7zrXkZtRMPOJE2vi4tQED2ogzC21fKdbqdjgdJOFnORey3M/1YzlfcyCBJ0UDJ5Q6u0YU26Be4pIANX02S7NA2s6DO3NWd6e1Byf7Woi+wxRx85CO6+bo81xQGIuKaaTab62OqeS4y9MSOHpuNAVWUvTrNEFR4SfTGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508153; c=relaxed/simple;
	bh=DA84Ymbf079qCjCVvVAH/KpIbPA3jpISHviOPMVP3qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5MTvNxak9zUzwQ1s5uidagUsZJWiA1mJCIGxUZcfUQdUm3rDMPt8EeRlnivJJ4vE0kC/Oxb/MlBwCMpLciERd5pYL8T0pqhwKWl9+n51W4JXA4LQDGwzAiRi7VmIVeT+DAmuFwnsqTyGVS+NRwYcR0PHjF4fIn+fLY+XJGVjLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=osXOxPsr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="osXOxPsr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F08D9C2BCF6;
	Thu, 26 Mar 2026 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1774508153; bh=DA84Ymbf079qCjCVvVAH/KpIbPA3jpISHviOPMVP3qo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=osXOxPsrU5OqOjnbDzeB6nDSBwTzPzdVleNFPf4aTDz2qeQYxiXWaWn3W2Mg0RLnY
	 eA9jSgxYkXO5+B7DKmXHvbVCJzxYuucl8ywp2xUqVu5PZEQTh9xb+M7BldSbLY7F0x
	 pJvUtsfLfovT7R/mPSeCZl3P3tbfSWaxVLmxkJLk=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B26103A9A0;
	Thu, 26 Mar 2026 06:55:52 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Thu, 26 Mar 2026 14:53:00 +0800
Subject: [PATCH 07/13] rust: drm: add Device::primary_index()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-tyr-debugfs-v1-7-074badd18716@linux.dev>
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
In-Reply-To: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774508149; l=1091;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=DA84Ymbf079qCjCVvVAH/KpIbPA3jpISHviOPMVP3qo=;
 b=G376wniR4/sgouAGFGuqpemjkx7s04qm0u0u+1vYHG+/xqPwdUKq00ukzZnB5dEGw4UkQJZGf
 g2zURToulH8BusETt7LXl3Ivbf1R1oqJf4cTcIk1q+WcExHgwBW4+j/
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add primary_index() to return the primary minor index (e.g. the N in
/dev/dri/cardN). Needed by drivers to register per-device debugfs under
a unique directory name.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/drm/device.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index d7bb338efb9d8..268ac02e800fd 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -336,6 +336,16 @@ pub(crate) unsafe fn assume_ctx<NewCtx: DeviceContext>(&self) -> &Device<T, NewC
     }
 }
 
+impl<T: drm::Driver> Device<T, Registered> {
+    /// Returns the primary minor index (the number in `/dev/dri/cardN`).
+    #[inline]
+    pub fn primary_index(&self) -> u32 {
+        // SAFETY: `self.as_raw()` is guaranteed to be a valid pointer to a `struct drm_device`.
+        let index = unsafe { (*(*self.as_raw()).primary).index };
+        index as u32
+    }
+}
+
 impl<T: drm::Driver> Deref for Device<T, Registered> {
     type Target = T::Data;
 

-- 
2.43.0


