Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E460C23F424;
	Thu, 12 Feb 2026 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884730; cv=none; b=MVshdGLwWkjurcYzIBzwm8T6+ZSC2lFOeP3sYp3JCU6eU9P3OAGYXprGQpJVk8+F2xA17DBtuQnI76BeqXcvmoq76zi5qZ8Ru3Y17dd4VeQS/dKP9E8Rghtahl02K6oAf3CLdSaRv18PCddjzlM+sHGXGFCZyUgg9vEzur5Bkn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884730; c=relaxed/simple;
	bh=nWOQOPNlF2NKalrXxoDvWR77eWVnEKgX2SJPRdaxPMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L70R9eP3lYeJCP9UxEmx+BpJ/phzHT0GX1ExzXqlrtTd1uqJT9A7U6fzi7Wz+GeXu8MBTWCl4yn+0qZEvCRK5GnIonxKjQOb8L6alIFKMGAygX1f+iukMdyeyO8byXnNaXcU3teSPdHk+9ShKujN4qoy6pZsfctw/0LNNCiDwOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMs4PCpB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMs4PCpB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BED89C2BCB0;
	Thu, 12 Feb 2026 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770884729;
	bh=nWOQOPNlF2NKalrXxoDvWR77eWVnEKgX2SJPRdaxPMc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LMs4PCpBElB98lsfw3EN9PlVqhkdTQaz1VkqtXXsbF99QG16ghQ2G439gtFfHMP3J
	 y71eXAJzoNKni+vjWkGM7KoBc92O/LkqO3NDTi/Z2ExEdczlCi91LQUPi1UQX46PzY
	 9SW29EC/u8y4/p050ck9hWTiuSNe5R/Stw4+jk3EjR5dCianD8UOb2LxpP0/nBSo5+
	 LkVoJOZFb9LRbCRskCpBMhcaNjXA9xbgqJCGX0IjPvAbwyeMgCT/E7bXaLGvmYEl1d
	 1Xk+Ie8MWoW3SxbOTrMBr3NOp6W95dGI73UuhkdyeeI8Iq+ulyOb94KKEW6xrtZ/QT
	 WWKfm3IuTBDHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1839EDF058;
	Thu, 12 Feb 2026 08:25:29 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Thu, 12 Feb 2026 13:47:09 +0530
Subject: [PATCH v4 3/3] rust_binder: shrink all_procs when deregistering
 processes
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-binder-shrink-vec-v3-v4-3-bd02f06bf2cd@zohomail.in>
References: <20260212-binder-shrink-vec-v3-v4-0-bd02f06bf2cd@zohomail.in>
In-Reply-To: <20260212-binder-shrink-vec-v3-v4-0-bd02f06bf2cd@zohomail.in>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770884727; l=2022;
 i=shivamkalra98@zohomail.in; s=20260212; h=from:subject:message-id;
 bh=ofWhi1ML9enjnPcwalc0CgCX2PLEBs7iFFyc8twE/GY=;
 b=T+06K77mrVOTOH6io1OMTpMjZQldVsZxOxg3z5IVqorzVVHDHS8u/IV7Sp18h/0dGAlv8I11k
 /Lu8sZySgDdBpZ4Zb4KLcmLmCwuVb+x3eSIGRfuPCKYwG6n4/x+F3nk
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
and shrinks to 1/2 of capacity rather than to the exact length. This
provides hysteresis to avoid repeated reallocations when the process
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
index 9cf437c025a20..399dab475728b 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -94,6 +94,17 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
         }
         let mut manager = self.manager.lock();
         manager.all_procs.retain(|p| !Arc::ptr_eq(p, proc));
+
+        // Shrink the vector if it has significant unused capacity to avoid memory waste,
+        // but use a conservative strategy to prevent shrink-then-regrow oscillation.
+        // Only shrink when length drops below 1/4 of capacity, and shrink to 1/2 capacity.
+        let len = manager.all_procs.len();
+        let cap = manager.all_procs.capacity();
+        if len < cap / 4 {
+            // Shrink to half capacity. Ignore allocation failures since this is just an
+            // optimization; the vector remains valid even if shrinking fails.
+            let _ = manager.all_procs.shrink_to(cap / 2, GFP_KERNEL);
+        }
     }
 
     pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {

-- 
2.43.0


