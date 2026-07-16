Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A23F39DB;
	Thu, 16 Jul 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191081; cv=none; b=WLGGIXjd5DXNgpxWZe+BAZfH+T4/ghN4DKxpjia+fXyqtyiXgkt4deD3D4tljTygwa8hajhJT7lT16is2gVGNv/xFnwJG4xJIvHXT57tIcE3158K0nYrzirk8lRr+pQ8xdfErciwwG46TECUWKsrgbpGKdz5iu2luV2Goo3mx+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191081; c=relaxed/simple;
	bh=YfYIYubHv2Q4ihushjbAMl2ffommTXWfGXmYtafqEyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lU8h8zOByK9GRLMT2CNHB0MyR5OtlvymcGajzbACfLahfsZtua+SE99rjiG4/M1a2pDke3n2/XAaILiZVtAGEV66znkbSxVT1OwxZXci0HrT9e636s/SN9ULp/aJe6YOaoly9ZPA5HghxzhHs+6aAFMTXB+99WK8x7dJFztpnpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkcwfs+U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkcwfs+U"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E5C9C4AF0C;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784191080;
	bh=YfYIYubHv2Q4ihushjbAMl2ffommTXWfGXmYtafqEyM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jkcwfs+U80ZmpRi0HSyYkjjme0S+BX3AiJtRfVjMRbsDth2u0I0PmDSCAvFdb0Ick
	 prgoXeRwfsR4/zF/sQwjtG6Gzs5KY7nOjAwxtet/6i2xBipGfUnX/RmkDvNK+cBXXx
	 IfR9wZ+0gE2GERgSWICojTEvNqCrvAvykbc644hbdwmOydpcwUReL28wrsT4QlpPSM
	 /WrZs7KKvYhwXAWiX1TtinwToP+qALKBqIOrhSfyvG25G+P9VPci2ccKPrrU9v3T2H
	 cKng9/qcaHAX9XCzFXr2JA9AAdLmoGtP/Bd4P4YToOqSW9tUbhwOLKRf528jCgfsjL
	 aiJ84mGB+mrFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B04C44515;
	Thu, 16 Jul 2026 08:38:00 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Thu, 16 Jul 2026 08:37:47 +0000
Subject: [PATCH v4 5/7] rust_binder: Implement
 BINDER_DEBUG_FAILED_TRANSACTION
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-rust_binder_debug_mask-v4-5-3d7436c2d2f2@google.com>
References: <20260716-rust_binder_debug_mask-v4-0-3d7436c2d2f2@google.com>
In-Reply-To: <20260716-rust_binder_debug_mask-v4-0-3d7436c2d2f2@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784191078; l=2595;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=+4rw0vNjIoFTKWAClTzY1+yTtFeuL8UUoNYjyIOP6gQ=;
 b=sNkwuFcD0fc+U58aKKejbz1SmO1qojohE/ZwsyuerIf0aHd30yIeNEiDks1l4am80YKuIwell
 XmKnzIwIftqCvvTdC6BfsiUC0IPNCg3lyGg1vNqpMxMOsnXNhUoL07D
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

Reviewed-by: Carlos Llamas <cmllamas@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/thread.rs      | 21 ++++++++++++++++-----
 drivers/android/binder/transaction.rs |  8 ++++++++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 9f0178a13d6f..38b90c79c057 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1275,11 +1275,22 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
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
index afef5b46eac2..069c792d2200 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -404,6 +404,14 @@ fn do_work(
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
2.55.0.229.g6434b31f56-goog


