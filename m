Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393FA2571C7;
	Fri, 17 Apr 2026 01:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776388291; cv=none; b=qtUFVRz7UmqFNWrkLrAKuh97lEfu3w405ZtHDxggVmWTvTYhLM4jf489nS/xFHgwJcA4SVaqzU2WwNGsiJsycRCGE9+QMdej8oB5ljbX2XZOVh+RUFUc5YaAdZRxtf5JYf1wKmyZsp5WLBkAp+RU5j53ALhru7uKjf3jn8PpKRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776388291; c=relaxed/simple;
	bh=CEPawZ6sXIb2An8dSVvX8IrZi7UWboan6QZmQB4W5f4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJiWT08k+2RGfuwIm5sASVe4JjBDWb1lCgLKnagdmjyf6hcWtbA9QZKYA6WEjBoiEHce50UkoR27C0stDg9JqjRsI9c0RTZRw5awU1xVZ4FUqenYP3wV+CxqxA+2WYxxaq5rMmRDc1NaESaZxwLPrw3+O6WSUnKgaQ4mXw/mugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=auTQRiek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="auTQRiek"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF902C2BCB8;
	Fri, 17 Apr 2026 01:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1776388291; bh=CEPawZ6sXIb2An8dSVvX8IrZi7UWboan6QZmQB4W5f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=auTQRiekRCbbnhehqgsarbiyZ9+MIl9n4mrx4RAyZfmikqaGndZyfXvBi/zIlG10q
	 eZtHFv8M0FEM0DNguds1lj8Q/j51ee61fZpOGnUg7mJjCLfq+Bl+HRl2DOA1f2i+63
	 H74dP9IhAzSdnRb9rb9ubnxnrNhJPUxAbijsb8qA=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E131FF8E49C;
	Fri, 17 Apr 2026 01:11:30 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 17 Apr 2026 09:05:52 +0800
Subject: [PATCH 2/4] rust: mm: Add task_size() method to Mm
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-tyr-ioctls-deps-v1-2-41c6e9bb061c@linux.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776388289; l=925;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=CEPawZ6sXIb2An8dSVvX8IrZi7UWboan6QZmQB4W5f4=;
 b=VhjBHoX9OG7AUX3/fgimlEwaBbhq84mQoNYpuucixnpKEzSkynw1I1YDpONyPwQb2ZxJnYiAx
 xdMwdIPQVOAAqa+DYmSyPAqlc34aXR+M1gMH67k4J5g01IGqgvkMwfx
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Add a task_size() method to the Mm struct to expose the process
virtual address space size. This is used by the Tyr driver's VmLayout
to determine the user VA range when VmUserSize::Auto is specified.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/mm.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 4764d7b68f2a7..c6ba4da52688b 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -149,6 +149,13 @@ pub fn mmget_not_zero(&self) -> Option<ARef<MmWithUser>> {
             None
         }
     }
+
+    /// Returns task size for this mm_struct.
+    #[inline]
+    pub fn task_size(&self) -> u64 {
+        // SAFETY: self.as_raw() is a valid pointer to an mm_struct.
+        unsafe { (*self.as_raw()).__bindgen_anon_1.task_size as u64 }
+    }
 }
 
 // These methods require `mm_users` to be non-zero.

-- 
2.43.0


