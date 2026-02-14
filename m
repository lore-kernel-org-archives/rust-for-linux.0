Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E783E28CF5F;
	Sat, 14 Feb 2026 20:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771101332; cv=none; b=lwHyO2yOLSiwMl/6qslIj7iRwv8jyIlI9fi9kj4PtFovz6L6iC7js8mnRiDg2tSNTq3izI478Fsvm4cEVYbdjOG4NhsI1Aeh3ILQX6RfD52/vY2K2SIi7jvmUczFfZcVo1pEjNp1SyOxWUpM8Kr0HX91k+VJS5u2YwH9Bo9h1IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771101332; c=relaxed/simple;
	bh=7rTjjHmVbvTMCZ+dJlkHV6ttiO6Ve3s67Dplq47uUDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tz7+7QMbsKfxpkA6l6oO8FpanXZ0bOnlQMeR0huNBdUUts2qJSyuB4RtBhkPqI/0pE53EZn8rncEdjYWl1Sj3tqa80TkdsdW3emV6lqJPULgNvmsJVYC7QcC+2Yw7V2LWTZ0sDI1ObYB959Kf9sM5H5ltn/MWIPqaGeU7AWLsAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAj5hNIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAj5hNIp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0631C4AF0B;
	Sat, 14 Feb 2026 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771101331;
	bh=7rTjjHmVbvTMCZ+dJlkHV6ttiO6Ve3s67Dplq47uUDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dAj5hNIpKVkkfjC6+fUeDkr61GbesFldapQABZuhy5zBmUckf8ReOmA5ZyJOxu3+b
	 3ba+Itw3Dy0du1vrVZiaK1hX/c/myjF/0SXNiLiDGcMuXnmW5B1LclL15XAVpC1G80
	 /394/qRIR3fcEbTzHDvmtJWcUmO9l3jtcEjWP1SPO7/MRiwY5AMEwCKi/KcjwTWP3b
	 NBJVn5RATFvRMSwGQ86A9XkJ06iPWIKRupnswmXV4g9wZ26F63xIjf7ZR0xQLryiVE
	 mhx6XP5+48TaY35R7a8DwIsKsvEtwlC/FXzuWEPAr5wf/qeZmhZdcdOT207C7pDpG8
	 aLnZEav22qqxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1984EF584C;
	Sat, 14 Feb 2026 20:35:31 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Sun, 15 Feb 2026 02:05:23 +0530
Subject: [PATCH v5 3/3] rust_binder: shrink all_procs when deregistering
 processes
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-binder-shrink-vec-v3-v5-3-6e5e56d69766@zohomail.in>
References: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>
In-Reply-To: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771101329; l=2050;
 i=shivamkalra98@zohomail.in; s=20260212; h=from:subject:message-id;
 bh=7FV6uKzz4TJqB7MKxHeO755/zc8FAEv6EPYTU8loKcE=;
 b=4//76mOxNdGg1G1UwGPMDljOwlmA6xOOV7+xCKJGo6mFMRYT7XcNYU5aCd8YSQWi8P83nsliy
 xNL9aU4Df7KA4ngR+N2CbkeGPBnxfM4uoTqtxSKoC+uYxqXdVQDfEOi
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


