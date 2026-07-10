Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2E53DD532;
	Fri, 10 Jul 2026 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693980; cv=none; b=IcdLk1diy7y/AGk6dVkXXNZUqJmJVcnYY6DOtd51ccka6UYny2kXrtzpmp2OCmdyTWpz2EE2zCFjDaEhEP6yj7Mn/+DqK+46aKWQq5aRUfuS+bvCsUH1xngC7FtOuKtBT/dxmZIAqyMqqKcBVQgbDhNOEWmTiBBqjmUAE5LZiAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693980; c=relaxed/simple;
	bh=Fj+4q0i9E6sV/EfSf177668feUv8hRm0VkvWCJs57U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gXZi4zoC1S5TGKoCLIao42utMTqoscgmDmvW0v8b8c5oRqnnffmkEL9XJMCXB5XXoHf8cuMTWSuu4NaVSaHHkrIzYN2cb9M9pIjrtnxMqClr0rEZoU7TM7tfKJtsChta/DrmLtE95Od4iMHeO47UWpvEJdKgzPGqUW6hmFAc76c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EObl982v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EObl982v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04B0BC4AF0D;
	Fri, 10 Jul 2026 14:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783693980;
	bh=Fj+4q0i9E6sV/EfSf177668feUv8hRm0VkvWCJs57U8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EObl982v5yOyuZdJKxzfioOwsizpuEVQpGEzrKu74PGk9sAox2u3H/1kyn4k9T+m2
	 FGaW4rn3NkXfJmTBH0VlcmV0bnS5tTJmUgkfbMNX5wHLnr5i1e3kYo+tOlvdlZ9Q/+
	 pgKhL2/ryxAXgTyabaAivE7DOskD/uB+KmcrybNiF4aF/eOP7wkbPirej+h2Rskddu
	 LetoBPBWIThZbV0nZmrwCPRulErwDrkddgLAWqCrKLA6Ip70+SacRxUeZnkz4oZVv6
	 herk7YTSk7LVyphaKREcY6ilZ5P7PxklJaVvaRVT4skOkp/SrH3zozbrC46rVOK9Q+
	 4cQ+JQgMno++A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE5DC43458;
	Fri, 10 Jul 2026 14:32:59 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Fri, 10 Jul 2026 14:32:56 +0000
Subject: [PATCH v2 5/7] rust_binder: Implement
 BINDER_DEBUG_FAILED_TRANSACTION
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rust_binder_debug_mask-v2-5-2846410e3ae6@google.com>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
In-Reply-To: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Jahnavi MN <jahnavimn@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783693978; l=2497;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=3CWbC+qTkLa0h08bqhh/+fob2zZIrU6rdQ2RDF8q2v0=;
 b=DTBz4DkrW1XrBoisPt3FrZirHrWqhl3c0fkgJDTmHHPEXAHoCPi/usYlnWZ8nOOEwdCDOjlaf
 rDihzyqFi7kAWC6s0PRvoDKFzWQC8JA+JJ6YD6IVWbNRMWdiiLg2+4P
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

This adds dynamic debug logs for:
- Failed replies, target process deaths, and error code deliveries.
- Detailed transaction failure diagnostics (including sender/receiver
  PIDs, TIDs, transaction IDs, buffer sizes, and error codes).

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/thread.rs      | 21 ++++++++++++++++-----
 drivers/android/binder/transaction.rs |  8 ++++++++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 54b98efdd0ec..d7038b58c2ad 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1315,11 +1315,22 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                     }
                 }
 
-                pr_warn!(
-                    "{}:{} transaction to {} failed: {err:?}",
-                    info.from_pid,
-                    info.from_tid,
-                    info.to_pid
+                binder_debug!(
+                    FailedTransaction,
+                    "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
+                    if info.is_reply {
+                        "reply"
+                    } else if info.is_oneway() {
+                        "async"
+                    } else {
+                        "call"
+                    },
+                    info.to_pid,
+                    info.to_tid,
+                    err,
+                    info.code,
+                    info.data_size,
+                    info.offsets_size
                 );
             }
         }
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 2643cca4a7d6..f058d3d50eb7 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -448,6 +448,14 @@ fn do_work(
         } else {
             // On failure to process the list, we send a reply back to the sender and ignore the
             // transaction on the recipient.
+            binder_debug!(
+                FailedTransaction,
+                "transaction {} to {} failed, fd fixups failed, size {}-{}",
+                self.debug_id,
+                self.to.task.pid(),
+                self.data_size,
+                self.offsets_size
+            );
             return Ok(true);
         };
 

-- 
2.55.0.795.g602f6c329a-goog


