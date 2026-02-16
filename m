Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7979D30F551;
	Mon, 16 Feb 2026 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251026; cv=none; b=G+L6vq1sA8PuLZWUwHxRO+i1954Iby4ZFh5EmjvUJTGJGwepmcCGxSLYPJFz/H4KBgWvJGolivoomWzx65FrXYFxMUHW+VpvWljQg5Zle/7jnti0eoSYw+FVSKyF2f0yQ4GjdftUaemsuQ8/ZtTcCFTdwGd9lfWP+7Byp7r3VnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251026; c=relaxed/simple;
	bh=rfVAM/ZHzx5qdWkfO8blN25XFekil5Ja5oqXZc5O6F8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CdkHGIyaoXRmIOLQHtHpV58MlFfrPjXkcFnFC3WOGDMldhf9swDNs2WNrc4gF5XANx+NLU0SMYIYlnY810wFwL2TV2GdjmHJjrR4r6X0ojmtQ7vBTAGYoq5otHqNxJ2DGiYOmdreFcnfR0r9oRXjkHBNIrz0T+1k1aclMBEe2us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qENupr8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qENupr8n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AC78C19423;
	Mon, 16 Feb 2026 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771251026;
	bh=rfVAM/ZHzx5qdWkfO8blN25XFekil5Ja5oqXZc5O6F8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qENupr8nkkXpgGimRWCfkHsxQVjYTtGsON6Bv+ZMH9SpUtaWxpSKrSrNev9zJ1joj
	 QuCtemlYigPhaM8kdMls3Tj+m7GiF05MGwmIpCBU1yM0bb1/2qMlU6VV2IRQWQRBBm
	 d1iI8VPCsoSTx6mLEhLDK006k1g+Q9XTJmq/8d2uwhBC6mOwekMrZHo6UaEyIw/ENt
	 N+l1PDYhUzBdBf912s0ZbYW3EZXCXN/5+okVAA/w5SU+1f2T2mvuaS/1/0Zx/ZDLoB
	 4Jz9z+hQk4RpWuItYzWKggNKOHZOlrmIL8YLgcOAsa0xyK3KaUi1w1ezcDa3TS/NUR
	 GeoresLqEIc+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB82E81A29;
	Mon, 16 Feb 2026 14:10:26 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Mon, 16 Feb 2026 19:39:57 +0530
Subject: [PATCH v6 3/3] rust_binder: shrink all_procs when deregistering
 processes
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-binder-shrink-vec-v3-v6-3-ece8e8593e53@zohomail.in>
References: <20260216-binder-shrink-vec-v3-v6-0-ece8e8593e53@zohomail.in>
In-Reply-To: <20260216-binder-shrink-vec-v3-v6-0-ece8e8593e53@zohomail.in>
To: Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shivam Kalra <shivamkalra98@zohomail.in>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771251023; l=2098;
 i=shivamkalra98@zohomail.in; s=20260212; h=from:subject:message-id;
 bh=mnNtqRuXw+GbWwUNizt695eJI0LDj0bQ9V6oPxS8Ca8=;
 b=KUC991Pcb5s8ApAhRfN2CtCmZ8JCK0Is6X3B6+q+41igluWkXepMKJ45h5JRYeQzj2X/MfaXg
 W2EfiYUdYp9C2dRyOxEmgaHhOqB/YLKhv4+8ci7NA2x8565gvf00rxD
X-Developer-Key: i=shivamkalra98@zohomail.in; a=ed25519;
 pk=9Q+S1LD/xjbjL7bEaLIlwRADBwU/6LJq7lYm8LFrkQE=
X-Endpoint-Received: by B4 Relay for shivamkalra98@zohomail.in/20260212
 with auth_id=633
X-Original-From: Shivam Kalra <shivamkalra98@zohomail.in>
Reply-To: shivamkalra98@zohomail.in

From: Shivam Kalra <shivamkalra98@zohomail.in>

When a process is deregistered from the binder context, the all_procs
vector may have significant unused capacity. Add logic to shrink the
vector using a conservative strategy that prevents shrink-then-regrow
oscillation.

The shrinking strategy triggers when length drops below 1/4 of capacity,
and shrinks to twice the current length rather than to the exact length.
This provides hysteresis to avoid repeated reallocations when the process
count fluctuates.

The shrink operation uses GFP_KERNEL and is allowed to fail gracefully
since it is purely an optimization. The vector remains valid and
functional even if shrinking fails.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
---
 drivers/android/binder/context.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index 9cf437c025a20..ddddb66b35571 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -94,6 +94,17 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
         }
         let mut manager = self.manager.lock();
         manager.all_procs.retain(|p| !Arc::ptr_eq(p, proc));
+
+        // Shrink the vector if it has significant unused capacity to avoid memory waste,
+        // but use a conservative strategy to prevent shrink-then-regrow oscillation.
+        // Only shrink when length drops below 1/4 of capacity, and shrink to twice the length.
+        let len = manager.all_procs.len();
+        let cap = manager.all_procs.capacity();
+        if len < cap / 4 {
+            // Shrink to twice the current length. Ignore allocation failures since this
+            // is just an optimization; the vector remains valid even if shrinking fails.
+            let _ = manager.all_procs.shrink_to(len * 2, GFP_KERNEL);
+        }
     }
 
     pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {

-- 
2.43.0


