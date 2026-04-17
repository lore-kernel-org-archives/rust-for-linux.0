Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408C02580CF;
	Fri, 17 Apr 2026 01:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776388291; cv=none; b=dvh/iZEWtc7z9257z0qka6l+rUcdU0IZ4Q+1HdDhXyzTuAJwcMe2qC0eIXFcpsOtVsvJ44iCUlRvEJijxERWOQFoZPvkHm9XDTbzaA01VkXu2YhBxJNjt0G8wijrL1OmcVNIn01wkvl1uJN14sID6oWCIVF2D4OLgPZ5Y8QCcz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776388291; c=relaxed/simple;
	bh=F/5SEP+S/zr/1Wvabq3W0ofBAhgKbB5EzANwuYwFetA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mlnsb5ZEqxKPyl2and6cqva1lOT07kTV7M86+yQR0+Gv5+SmhqZ5FLq5nTQcG0nN3I2MzfP606KblbA0rgPac2mbF79jFRGrkxGdCYKzBQ5Y8EaMoaEKVFqOwRPszPrnGq1evrdSwIjPsTT5l2Om1uhHhHwY8nxkChTFCha/wrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ERVavyNP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ERVavyNP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A378C2BCB5;
	Fri, 17 Apr 2026 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1776388291; bh=F/5SEP+S/zr/1Wvabq3W0ofBAhgKbB5EzANwuYwFetA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ERVavyNPYzsodTs1O4T0WsRy2gXRbZLrmgkue83UvPa1p2Dfo9uLmg4KsFKSq5W/U
	 xMh02BOb6fYSgWIUA9fRrXhtTv9DZCNlDdQEv/JGaU/juRxKn2g6BofyuDZNQVx2Ct
	 GUKi1n3l50ELo9XAxiEj8hUMp/F3In3ar8dWmtIc=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01B0F8E497;
	Fri, 17 Apr 2026 01:11:30 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 17 Apr 2026 09:05:53 +0800
Subject: [PATCH 3/4] rust: xarray: Update StoreError comments for alloc()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-tyr-ioctls-deps-v1-3-41c6e9bb061c@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776388289; l=1003;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=F/5SEP+S/zr/1Wvabq3W0ofBAhgKbB5EzANwuYwFetA=;
 b=mHYTu9uPEnfW/Y/sIW8aE4App2+Eq7VQ+cJKYCM8Ln6csO3vDaC4O7okM3v+6xmI1n7e/ytq8
 VUnKr8eWYQoCUmsdOOLPgvyM73PSb2biAEBFhMnuYrl1GylM0RFUgRh
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Update StoreError documentation comments to mention alloc() usage since
this error type will be used by the upcoming alloc() helper.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/xarray.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 1b882cd2f58bf..235fda0e394ba 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -161,13 +161,13 @@ fn drop(&mut self) {
     }
 }
 
-/// The error returned by [`store`](Guard::store).
+/// The error returned by [`Guard::store`] and [`Guard::alloc`].
 ///
-/// Contains the underlying error and the value that was not stored.
+/// Contains the underlying error and the value that was not stored or allocated.
 pub struct StoreError<T> {
     /// The error that occurred.
     pub error: Error,
-    /// The value that was not stored.
+    /// The value that was not stored or allocated.
     pub value: T,
 }
 

-- 
2.43.0


