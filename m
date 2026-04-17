Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0132580E1;
	Fri, 17 Apr 2026 01:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776388291; cv=none; b=qwutEgYG+hqS4QOKG5veyYFwWkkICDKGYJZM+y6gLpklCxT1kD6jGjigckQR4kpmI5PcTzuex33h2uHwrYqzjheYjUKWDi5FBtNSvL+Um8Sz0PDNvWhgmo/0ojs/PJdjwjRfoGdoSNe8BByJ38hMCqXbyUG/PYwxgnKCMsCwdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776388291; c=relaxed/simple;
	bh=HK2c+z8dRuFsYNATe7JRBa5cKQyu3FlazejUuvyOuq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fs600+42GO3UlewWtesjPARo24t3uiAfHdmNrF8LhOZD35J8uVLMleEfvmyjnaXIkMNYdOUOWD0J8ItTN5Dj2k74t6WjsezzVj6dzlg/1ORh+zVb2akPFVagnaqZmON+5tjBhPZt4t2++qcg/UmDcmzm+6gLiu+c1uxqOlwAmuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pfwEavzJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pfwEavzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16CEDC2BCF4;
	Fri, 17 Apr 2026 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1776388291; bh=HK2c+z8dRuFsYNATe7JRBa5cKQyu3FlazejUuvyOuq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pfwEavzJ72Cb4tU1vMmW+uXzNsJX5JN95bWz+EZTvCqx3jfME/SrrCvzDrIwjwv6M
	 n20lcaa5rqsM/HLdEFldiS8HaRF3BPxh1f05XLfo7YKj2DHU0JcGPpXR5W27U2OSk+
	 7rPgCARP3SP2oaRgwaoE3AvHZ42sXCRLU0k2H2vs=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C288F8E49E;
	Fri, 17 Apr 2026 01:11:31 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 17 Apr 2026 09:05:54 +0800
Subject: [PATCH 4/4] rust: xarray: Add Guard::find() helper
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
In-Reply-To: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Tamir Duberstein <tamird@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776388289; l=1408;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=HK2c+z8dRuFsYNATe7JRBa5cKQyu3FlazejUuvyOuq8=;
 b=c/lPoOZ1Arte0C/QoYrkBDlhgjCZ5b99pHUmEM6OFrj/WdCEt52K0YfvGN8Z06RSSMFQgpDdo
 JBKPQrDSNehAxdqNGVcwXaYyiVDut1xvEu8f1PV1IxWItviywlhjFt6
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add a helper to find the first present entry in the XArray.

Returns the index of the first present entry, or None if the array
is empty.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/xarray.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 235fda0e394ba..e43129d032d9d 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -217,6 +217,28 @@ pub fn remove(&mut self, index: usize) -> Option<T> {
         unsafe { T::try_from_foreign(ptr) }
     }
 
+    /// Finds the first present entry.
+    ///
+    /// Returns the index of the first present entry, or `None` if the array is empty.
+    pub fn find(&mut self) -> Option<usize> {
+        let mut index = 0usize;
+        // SAFETY: `self.xa.xa` is always valid by the type invariant, and we hold the lock.
+        let ptr = unsafe {
+            bindings::xa_find(
+                self.xa.xa.get(),
+                &mut index,
+                usize::MAX,
+                bindings::XA_PRESENT,
+            )
+        };
+
+        if ptr.is_null() {
+            None
+        } else {
+            Some(index)
+        }
+    }
+
     /// Stores an element at the given index.
     ///
     /// May drop the lock if needed to allocate memory, and then reacquire it afterwards.

-- 
2.43.0


