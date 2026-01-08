Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1E9364E98;
	Thu,  8 Jan 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858192; cv=none; b=ha1GKaZdqZtEcVCucvHtV3OAGBuPDL7IRSaVAenopXkt0DTVj8ia/gKGAMyjSrPxmerQHHuc/v7HxVdBkn69F4LuLt581BKamVYVn8Icz7JNCqE8eDtCzkT8Fd6UOEw28mqmaIvTPwtrTwVuaVgfRXt0exicE5YZgIwJbcV9BZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858192; c=relaxed/simple;
	bh=cMqjwUiYmqqDMaoEyq5ukbLry8LcVc+yfvHUzdgrlsE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=VtmSgZIJ326t4DROk/rU/z90mCxNhVE3WCx1MER+leuUlazIGbe2hf7msmtvuKRHuIkQZGXtTW2SoJOGoTy7KSORMff2pvfJCFaaBUE4ZPKoMXe083P9vsE+iPIS6q+WQKi6dQtCxiCchsJ5Xy8egliI0/8VmOwqxfIclWoemXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kCwmlEs9; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kCwmlEs9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1767858177; bh=RjUBuqYVGimPY4HLnHqTraxdWTF07cojlX+YGvRWO3o=;
	h=From:To:Cc:Subject:Date;
	b=kCwmlEs9OJcTCxxyNlItP9HLtB2V4O22TSQZHe4MYoqwldUqSQvXjEVgwq/Q3tATv
	 w4PaPLEXnFQgnmg4RCXdf4ZDpU0szJIuwqFGXxVjvvkyRAv8iYp7Hp3MAdP3ELR4dQ
	 ZY734m4UNiBB3t14oGZ20/ghBEN9lR7vnItuztmc=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id AB635816; Thu, 08 Jan 2026 15:42:54 +0800
X-QQ-mid: xmsmtpt1767858174tyozoxj7g
Message-ID: <tencent_C135881D822B4C6C12E841516893C774A805@qq.com>
X-QQ-XMAILINFO: NHWsITUsYMGe6JREiQnneaxZIzQovSLNYtTvh13LYOpaRs/syTh9J6/ZC4Jg5j
	 H1TxPitpbivsgs6CBfoy2ArNRUCTdxqntdLnbvipN0a0fmBo12TV35g1/o46ysuHjcrloqOy97kE
	 qTeQkHGCgd/i8OAt2M0JM+JDhRA/1uBsbnM2cx7+Sb1gBPyKPPtvj92POvs0IDRxjlo//h3+nfbS
	 doMa7H6jlcCJiP1aIFYekWa6f4eUKrmeK1ia/8dqJOctswi044uLWkTaQjhCa+FZGYQPiZVnbvEc
	 ruF6PTCN7BgAGGN9tng4cBUHtuI5wJe2F1vpJdMXZIKSYFkdunxu2svBZC8q3l8JL9nDXndCHfI3
	 CclewLFNMyl6+4YLfdNbz6Ld60ZUWpuM/fTCcHFp48Elt7Lf0NkL/yDMrxCssXK5KAY6TygUe3ks
	 1TqPFXLwgBTZV3PZZn9xUK4aVF7AFKKY3d9MjexjU+geJmH26WUo/LAo4McHaPCTd4f5U/sAXZ8c
	 jn4aKpV8T2rntDLYNaiM+dcnPEbYDDyC9NmZkkVI8cuN4OQ8nE93LDdBgfFT3WP41eMoH8RLF5+e
	 bVoKbJzfT1ruwhXxFU4cfZ5a2hmtCgQu5WHdgMhj3xIr9rffgkg9/5cUvFPw/d+FwHVrNfBOG23o
	 Qn9MZELDfhOqu6jk4JjhvRXRPQzdBlxeRbq9miM7PDP83GEO06tLSk0rJ8/1Ijq2LNnYw61wsvJm
	 4AAl/rCvP7uJwPS5UoGKBH3WcAI+69AzC4btvj3ulPErna2A9Vc6MFncKpBu7PqThzWQkA/RpbkL
	 GmV9qkVOExhYgwogk8qmLXse5kvwYMCLKKj+w1cwNNSUUd6yOpBnSYACL2dUKIUCNATje5GTlhNj
	 xNcL3ooQJWK/J/N6Z+efZr5voUlqhHoPKLd9S8Ie65fLp5IX2Gyp+SLljl8f+NdfzSpT8UV0gXh8
	 KBvZqFChF8xYS5l0Ok/FDrZgxaa99JmNE847sS2pnslituZpnGbMxgeDnyj/AZ
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: 1064094935@qq.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengfuyuan <pengfuyuan@kylinos.cn>
Subject: [PATCH] rust: device: add platdata accessors
Date: Thu,  8 Jan 2026 15:42:51 +0800
X-OQ-MSGID: <20260108074251.323790-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: pengfuyuan <pengfuyuan@kylinos.cn>

Implement generic accessors for the platform data of a device.

Platform data is typically set by platform code when creating the device
and points to platform-specific data structures. The accessor provides
type-safe access to this data without requiring unsafe code at the call
site.

The accessor is implemented for Device<Bound>, allowing drivers to access
platform data during probe() and other device lifecycle callbacks. Unlike
drvdata, platform data is managed by platform code and has a lifetime
tied to the device itself.

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 rust/kernel/device.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe3..e16f8eaa52e0 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -325,6 +325,31 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
         // - We've just checked that the type of the driver's private data is in fact `T`.
         Ok(unsafe { self.drvdata_unchecked() })
     }
+
+    /// Access the platform data for this device.
+    ///
+    /// The lifetime of the platform data is tied to the device's lifetime.
+    /// Returns a reference to the platform data of type `T`, or [`ENOENT`] if no platform data
+    /// is set.
+    ///
+    /// # Type Safety
+    ///
+    /// This function does not perform runtime type checking. The caller must ensure that the
+    /// platform data structure actually matches the type `T` for the specific platform device.
+    /// Incorrect type usage will result in undefined behavior.
+    pub fn platdata<T>(&self) -> Result<&T> {
+        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
+        let ptr = unsafe { (*self.as_raw()).platform_data };
+
+        if ptr.is_null() {
+            return Err(ENOENT);
+        }
+
+        // SAFETY:
+        // - `ptr` is not null, so it points to valid memory.
+        // - The caller must ensure that the platform data structure matches type `T`.
+        Ok(unsafe { &*ptr.cast::<T>() })
+    }
 }
 
 impl<Ctx: DeviceContext> Device<Ctx> {
-- 
2.25.1

