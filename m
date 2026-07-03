Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1B41736C;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092566; cv=none; b=V50rb68ydCb7WW4BjII02rV3wJposF++5jfy2corxEn5i8BbFPm3G2guHfCLNznADmrdzKxDXWDUtXMmfOgyeUYQPC6MDfW1wluUZ0guyPrXIVIpWs5+KbL94xuCV++Ak43EMY53F4omBiOXKhhBMDsbeGYl123FxzNhUcntdpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092566; c=relaxed/simple;
	bh=RyS2wURh21mTeoz5CI3KKh78yIHLSp24HPxf9dLKbeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EiotgbEUKvBWB8PoZUgsz+0f/N0Rnds4j2wnHfVD20HXA+SP3Kp6YxXg5Uu9RmTd/gMiUmPAq7VVBLWOS/pJpfF3A/AjjK6YEoSDN5kJp6VFXVXmlHLh/38KMPy1gIXDCJnTbxTe3ebDc63ZsTXPIdMKtxaoNErtp3lFwvshOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzlj+gBI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzlj+gBI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1BA1C4AF15;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783092565;
	bh=RyS2wURh21mTeoz5CI3KKh78yIHLSp24HPxf9dLKbeo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wzlj+gBIyPxHRt8mlOhKHuQtCF5rkSsCrZNcqQMpHG00rJ/ZE825OdAvTfzTlnQa9
	 JQ2HUY8s0xHfcaTQK4v28lzoQT5jrv40RQM4QtFnLOzXhbFqIgbnvMF9hsu18fnjre
	 lO/0BGBx2Go9I5oGpE04IOPwZ5VB3bdTCFF1VqjiEe4navkmRuZ7NPXbRlYp0WL+t3
	 NDNJ5P5E2PbH3hmHMTtsgeu8VOz5xO8szzN2F+D+7+PJsWv4z8qDaOT7pkUZ/P5KO1
	 EUNdweVeVllYqTMldEAdIPPhrr+cy6Crn3oTXVjoMswAW+VAikQSEkUKEzPgralt4V
	 B5UG0cFhQCRag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEE0C44500;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Fri, 03 Jul 2026 15:29:26 +0000
Subject: [PATCH 5/7] rust_binder: Implement the
 BINDER_DEBUG_FAILED_TRANSACTION logging mask for transaction parsing and
 routing failures
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rust_binder_debug_mask-v1-5-9bdf12b5325c@google.com>
References: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
In-Reply-To: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783092563; l=3866;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=lhDwr5z2mnm33UNmF+M4c23cZnU/CATsdD2Yk/m7PNc=;
 b=6BMbdtWnti5RyUjf1XQ7kTBHHQOposUDX1b0Wz267ejokT8u+c8FyQu0nwtB8A+7pbDRGGjFz
 ePqcrCX7aiFBOotN2ZX9iJJ6nJk26D/Z1urJzdCFqSaCLq1M7RwCUgw
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
- File descriptor (FD) array validation and translation errors.

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/thread.rs      | 40 +++++++++++++++++++++++++++++++----
 drivers/android/binder/transaction.rs |  5 +++++
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index ecf05cebcb3e..1656e0c70fef 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1191,6 +1191,11 @@ fn deliver_single_reply(
             }
 
             if inner.is_dead {
+                binder_debug!(
+                    crate::debug::BINDER_DEBUG_FAILED_TRANSACTION,
+                    "send failed reply for transaction {}, target dead",
+                    transaction.debug_id
+                );
                 return true;
             }
 
@@ -1198,7 +1203,18 @@ fn deliver_single_reply(
                 Ok(work) => {
                     inner.push_work(work);
                 }
-                Err(code) => inner.push_reply_work(code),
+                Err(code) => {
+                    if code == BR_FAILED_REPLY || code == BR_DEAD_REPLY {
+                        binder_debug!(
+                            crate::debug::BINDER_DEBUG_FAILED_TRANSACTION,
+                            "send failed reply for transaction {} to {}:{}",
+                            transaction.debug_id,
+                            self.process.task.pid(),
+                            self.task.pid()
+                        );
+                    }
+                    inner.push_reply_work(code)
+                }
             }
         }
 
@@ -1297,11 +1313,27 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                     ee.param = source.to_errno();
                 }
 
-                pr_warn!(
-                    "{}:{} transaction to {} failed: {source:?}",
+                binder_debug!(
+                    crate::debug::BINDER_DEBUG_FAILED_TRANSACTION,
+                    "{}:{} transaction {} to {}:{} failed {}/{}/{}, code {} size {}-{} line {}",
                     info.from_pid,
                     info.from_tid,
-                    info.to_pid
+                    if info.is_reply {
+                        "reply"
+                    } else if info.is_oneway() {
+                        "async"
+                    } else {
+                        "call"
+                    },
+                    info.to_pid,
+                    info.to_tid,
+                    info.debug_id,
+                    err.reply,
+                    info.errno,
+                    info.code,
+                    info.data_size,
+                    info.offsets_size,
+                    line!()
                 );
             }
         }
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index f9285eb93fc0..f8756c5dfba4 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -405,6 +405,11 @@ fn do_work(
         } else {
             // On failure to process the list, we send a reply back to the sender and ignore the
             // transaction on the recipient.
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_FAILED_TRANSACTION,
+                "transaction {} fd fixups failed",
+                self.debug_id
+            );
             return Ok(true);
         };
 

-- 
2.55.0.rc0.799.gd6f94ed593-goog


