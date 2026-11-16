Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794833613;
	b=PIjQHw9pDwBIJkJmgvtgTId7CkNcO8szgp5y45p6wPDgquf0JzVO2/JIjp0AkdYN+Jvk
	 pxdnM3MSlgg6J1lo2f4HIgO77n4L5tw+MgiiZ9CHLLnkCRi3Pml80ip7oLRw/YUTvmjSP
	 2craV/wOZfVGKAG63zVXK19F4Vsg9FznFfTcGIapjCa9KMnW/BCi0H/bNLeWX4h7ThoAm
	 QOX9IhnjLFl6+6putp7rdUAzFkEzzXkR+FXVLFl2x9xQYV5TvGEI1FW04ijDdy2IXjW0o
	 4bCWn0bEyDrWuqbSfDtSvl2yAt3hSETVEXwqlWSNrAqi9EJAw27OPq1aFu/oUOnOLPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833613;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vCTkIJC+402nA2gGKGIMvi8ieHgbeSO4c1Tg9h8hLgg=;
	b=3FApUWnbTuzBGK7U7AC+uMkth1a0uQ2dD3AAl+ZDLotiEns7a+kh1B7rMIIb1WBY9Fcp
	 nqhBQG0KUrSqwnS+jXLVJyRQfHxYPM+JO0iRgFOPrF8TY3J8D8PA0mGJlgQ0cK0oXc+71
	 SQZ9Nx83i2eIxXCG4JO6dc/DnqQosrOqqSv6AT14bDcXBWDY49D6lUpqO+DU2odvslP+i
	 e2JpPWw9WygWU0xGXlgcD9i+onrw8DcfdvsR7Js3JBnRSkPp/WOFiTPcRvy7R0MQnVIol
	 CyR4LMj9MRVUoVB+TRGR7UW9yz3RjvZqUVArAxQ6VMZwdNvibcBIHyNwgNONwkdUIWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Rh2JTqJ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61AE606A31C;
	Mon, 16 Nov 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rh2JTqJ/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794833613;
	b=RSUWOh2b/32+abyNwR+bY2s6nYsCUpzoWRMg4c5aBvjUN0a3RCW7zZ4TV0U/basK5ZJj
	 xjf8kpy1U/I1kqeaL8Uyxi5v+FSWZSgWGk6itq2Ml3kTklX/F3TMpnazkWIOiv1TwA6EY
	 p9rTvGD/BkpMT0HXQN85XKf9/m874qZxv6z7x83A1vPuYI8GEJQHTHWWodU/CCD8Hwnuv
	 y8A+PgI2vbqTgFqGiQdR2zl8ls61uyURGig0iR70wIBQ8n7KZ4RmBEKAalGMt6jBdcywj
	 qd7SuB3ck7cTeS0Bv1a6RdJqjRwszx87X4/Q389WSlhcrnUvo5DL1T5B1BRM2KDk5MQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794833613;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vCTkIJC+402nA2gGKGIMvi8ieHgbeSO4c1Tg9h8hLgg=;
	b=RT6NblAO0nDybVa9AYBDlw4VbBAWTlx4TNAeQVw5COaHyxodrUF8wObje+3hEvZrh3qZ
	 YXaYL4CBK+7RgZoAkwoeurzuDTRDhl2NEd3HnaMXP+vAIoxqwC9MZ/8J6WWqdiSxXz6JH
	 tN8wlViki8jnioIN2i2gxAESuv1wRwvocMoKrAfa1/am/ThhE7WA7yYhfaAE2kkwDKpqV
	 b4OQQHygB3ynDaszSMYi1mSkAS9/vCETT/L1LVVhE411m/+NDA11tcSFYcukTppHPSGi1
	 0FWT3yk0H8VEtisi8/SLM3BYDAfpzrtS0VUskS26XI2D/o7IqdozjVRmIuYSKf/LmVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C5C21F000C4;
	Mon, 16 Nov 2026 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833613;
	bh=vCTkIJC+402nA2gGKGIMvi8ieHgbeSO4c1Tg9h8hLgg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Rh2JTqJ/EukNLfOY9KKEQf0R2CU28oe6h0nTHhgK06EStbA81YETPdwBuO43kzKG6
	 1CAKhffrxvmT1Kt+GJErVfNkxzGdCfK6IQt4BIuTxVNfEy+8vm3ErZP/9LHs3BN+D2
	 FBrrHdgH3xIkdl6uI1wqpYFNjc45D6chxqS1JS/N71twP7NNLaQg+Jh2T3wVJIvdvV
	 KQeZXq/8KC+i0UbjFauInzTJSvH6YBEn1K4oAEpsOA2zHYs57yVxye7p+vzClaG+bg
	 OfXDEbe1Qa5tOi00QSLSRjKr8tsqXf8bYaduqrlzF/aZhKI710zUjBQB5CJQtAsGjE
	 R+gnKUVUhrOow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7198A4A474;
	Mon, 16 Nov 2026 12:53:32 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 13:53:32 +0100
Subject: [PATCH] rust: alloc: check the length precondition in
 Vec::from_raw_parts
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-vec-raw-parts-precondition-v1-1-8f633f66b4c1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMv8+moC/yWMSQ6DMAxFr4K8riWCCoteperCMW5JRQOywyAh7
 t6kXb4/vANMNIjBrTpAZQ0WppjBXSrggeJLMPSZoambzjnX4SqMShvOpMlwVuEp9iHlG/r2WpN
 vmVk8ZEEun2H/ye+PP9vi38KpGMvCkwl6pchDiZbZkgp9kMZxYoyyJzjPL3kdRwqkAAAA
X-Change-ID: 20261116-vec-raw-parts-precondition-b540ab5ccceb
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794833612; l=2687;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=8AL5TouHwkYVMGdbW1C9LR1cjbYm5Y41STYkvRtrL4E=;
 b=C71Hvp9FqzTymLLh+nECFQ02HlfuynnuaZJoG3z1rj9QjDIEIibvSjG9SM2olgoWXiYtOlLW0
 xl1FNloM/eWBf7daFFqCZOq7Gm5USwEBn9LDHv5AuzgoI2dEBPplWj/
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com
Content-Transfer-Encoding: 7bit

From: Peder Bergan <peder.bergan@gmail.com>

Vec::from_raw_parts() requires length to be no greater than capacity for
nonzero-sized elements. Check this precondition with
unsafe_precondition_assert!() before constructing the vector so debug
builds diagnose invalid raw parts at this boundary.

Keep the check in the nonzero-sized branch because zero-sized vectors
ignore the capacity argument. Add a KUnit test for reconstructing a
nonempty zero-sized vector with a zero capacity argument.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1232
Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
Based on alloc-next.

My validation used the x86_64 rust_kvec KUnit suite under QEMU with
CLIPPY=1 and debug assertions enabled and disabled. All six tests passed
in both configurations. A temporary invalid-length probe triggered the
expected precondition diagnostic. The baseline has an unrelated unused
function warning in io/resource.rs, also present after this change.

OpenAI Codex assisted with coding and testing.
---
 rust/kernel/alloc/kvec.rs | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index cd0c57a9a..b8f4c1692 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -23,7 +23,8 @@ use crate::{
     page::{
         AsPageIter,
         PAGE_SIZE, //
-    }, //
+    },
+    unsafe_precondition_assert, //
 };
 
 use core::{
@@ -685,6 +686,8 @@ where
         let layout = if Self::is_zst() {
             ArrayLayout::empty()
         } else {
+            unsafe_precondition_assert!(length <= capacity);
+
             // SAFETY: By the safety requirements of this function, `capacity * size_of::<T>()` is
             // smaller than `isize::MAX`.
             unsafe { ArrayLayout::new_unchecked(capacity) }
@@ -1623,6 +1626,18 @@ mod tests {
     use super::*;
     use crate::prelude::*;
 
+    #[test]
+    fn test_kvec_from_raw_parts_zst() {
+        let ptr = NonNull::<()>::dangling().as_ptr();
+
+        // SAFETY: For a zero-sized type, `ptr` only needs to be dangling and well aligned.
+        // The capacity argument is ignored.
+        let v = unsafe { KVec::from_raw_parts(ptr, 3, 0) };
+
+        assert_eq!(v.len(), 3);
+        assert_eq!(v.capacity(), usize::MAX);
+    }
+
     #[test]
     fn test_kvec_retain() {
         /// Verify correctness for one specific function.

---
base-commit: a2a82cbb73342d605078cb85763472f40156af1f
change-id: 20261116-vec-raw-parts-precondition-b540ab5ccceb

Best regards,
--  
Peder Bergan <peder.bergan@gmail.com>


