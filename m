Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0BB38E5F6
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508153; cv=none; b=JNM+3wr8HT4LvPy8iqR9HNAU0aMeyWDmfLwPjnQyTJ0m0ggRHigEFDrM7Plu1gWczqWwFxm+Svmf5wj2kRoQfhULvGUkh2v0fXif+cC7uABkuaujdpfyTa7pjzCFaiaZYmuaLxH/larRqK/Jn8FcljEJTjBUmMhURkAAvYJOiLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508153; c=relaxed/simple;
	bh=tUYRpEsjcJwgFiDLyfqu8+WsQSC+51o7zeiWV2WwdXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HkB6JFBCOWe8PHBaEEk6pWUpX7jkcpWv7Yrko4Fe69yRJh6o2rLUkZ93EaZzKnJVnG+l25a2UfCfbu7ehhPhl1L6453NdEcGVgQ1Uz+kg+nvO5R/tAJCbNa22HovpIQWTdVHi7zBGGLNy2x4rHq6t5al3d2OTtoLh2m5Ons4b/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AgTOddqb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AgTOddqb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB172C2BCB8;
	Thu, 26 Mar 2026 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1774508152; bh=tUYRpEsjcJwgFiDLyfqu8+WsQSC+51o7zeiWV2WwdXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AgTOddqbBydf5h4/gS+J512wveQMIqtr99jPcBcey8NSL2ftuhTpfMiOZ5604ibZE
	 IruIZbVz87zKSLRl190HMW8ehDDJlK3hcTeI3jU9DIEj404i5XD+4My9YNlPgPcdGs
	 cgIpO9X+USOcgZF+ft/sFVCEi6lqBy64rCaQPCp8=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC67103A9A0;
	Thu, 26 Mar 2026 06:55:52 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Thu, 26 Mar 2026 14:52:56 +0800
Subject: [PATCH 03/13] rust: sync: set_once: Rename InitError variants to
 fix clippy warning
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-tyr-debugfs-v1-3-074badd18716@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774508149; l=1849;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=tUYRpEsjcJwgFiDLyfqu8+WsQSC+51o7zeiWV2WwdXg=;
 b=LejMass/PgiXRGEVCIMUZhQoqRvFp8dZ+rFdyHpwf6Fsnq4qYQsRzZHZilPaqI0LL/f9CBaJ0
 H+g0I5DQj3MAWlxgNapRhv0mnILfZyGSs/JRHNM6EezDqVAUdxlF/lC
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Fixes clippy warning:
warning: all variants have the same postfix: `Init`
  --> rust/kernel/sync/set_once.rs:68:1

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/sync/set_once.rs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
index db9c5423fade3..3af5538aae1d4 100644
--- a/rust/kernel/sync/set_once.rs
+++ b/rust/kernel/sync/set_once.rs
@@ -67,17 +67,17 @@ fn default() -> Self {
 #[derive(Debug)]
 pub enum InitError<E> {
     /// The `Once` has already been initialized.
-    AlreadyInit,
+    Already,
     /// The `Once` is being raced to initialize by another thread.
-    RacedInit,
+    Raced,
     /// Error occurs during initialization.
-    DuringInit(E),
+    Inner(E),
 }
 
 impl<E> From<E> for InitError<E> {
     #[inline]
     fn from(err: E) -> Self {
-        InitError::DuringInit(err)
+        InitError::Inner(err)
     }
 }
 
@@ -85,9 +85,9 @@ impl<E: Into<Error>> From<InitError<E>> for Error {
     #[inline]
     fn from(this: InitError<E>) -> Self {
         match this {
-            InitError::AlreadyInit => EEXIST,
-            InitError::RacedInit => EBUSY,
-            InitError::DuringInit(e) => e.into(),
+            InitError::Already => EEXIST,
+            InitError::Raced => EBUSY,
+            InitError::Inner(e) => e.into(),
         }
     }
 }
@@ -155,8 +155,8 @@ pub fn init<E>(&self, init: impl Init<T, E>) -> Result<&T, InitError<E>> {
                     }
                 }
             }
-            Err(1) => Err(InitError::RacedInit),
-            Err(_) => Err(InitError::AlreadyInit),
+            Err(1) => Err(InitError::Raced),
+            Err(_) => Err(InitError::Already),
         }
     }
 

-- 
2.43.0


