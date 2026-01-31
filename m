Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF612FBDED;
	Sat, 31 Jan 2026 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769846812; cv=none; b=qn5SWJQuEi+0WvRbBTmW+aT1q+230nzOkmXvr7ACJfH6PBdF+opindlM1eBfsa4DVo9WhqawyuWThNCP/yPzUBcRbiTcUN3duCPFQLzQdFLqdigX0gWrj67sKAqvQGj1bebxJvuDDPOPXOt6Osa9dRNNyfW1Etip5wCfkErYHTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769846812; c=relaxed/simple;
	bh=PNZhCR+/pggdZ+eX2S14oEhix7kpixYkOW4FSi+tsAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQ2nBsZhhX3JIb1/ob78fcP08O3hjl27M86u+CaXRf4n+eubn1UWA+/qM5eb9/FkKZSIb1eqcRr+Sb3MLBIsBbioUFObw4B/Q3JDhjSpSnOE5R+wUNzVUWytyqfGqw4+6HVHKMOjbNRNAYUNfZhPCj+WOrDY0htlezR35rqbkQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=E+RlKPKm; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="E+RlKPKm"
From: Shivam Kalra <shivamklr@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1769846808; bh=PNZhCR+/pggdZ+eX2S14oEhix7kpixYkOW4FSi+tsAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E+RlKPKmE2TrcAQdio+JMUEPy8fSYOhrpK3HhLrqFBBF2SjZMFZVmkYp0S9jRRTvH
	 y6fDpP81T/7LLH+mZ4GAGJ6yr6RCwdDw33e9Pnjtsfbm6YmHKGgh/O7W2sr6cvApQC
	 fdg+I72zrExDA/E0wPy1K6x2RltEsbLncch/miqLcHDxe58P3RoHAGqTO2hcBGzz5A
	 ere2LWvvChORrhmm0T6XRHcq70E+rn+Qhl5bsJZuCkwJDoMdgGPEap3fzM2lYSSTj3
	 XkHJ+G6X6ylgmSa4Lj34JOHZg0bp2Mxc3gGaDLjTkAOoRU4fIyk1pQ/OTojs9uN1rG
	 a4JC04qJT4MzQ==
To: dakr@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org
Cc: aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Kalra <shivamklr@cock.li>
Subject: [PATCH v1 3/3] binder: context: shrink all_procs vector to reclaim memory
Date: Sat, 31 Jan 2026 13:36:14 +0530
Message-ID: <20260131080614.264242-2-shivamklr@cock.li>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131080614.264242-1-shivamklr@cock.li>
References: <20260131080614.264242-1-shivamklr@cock.li>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing a process from the all_procs list, shrink the vector
if it has significant unused capacity. Specifically, if the capacity
exceeds 128 and the length is less than half the capacity, shrink
the vector to its current length.

This prevents unbounded memory retention in long-running systems where
the number of binder processes fluctuates significantly over time.

Link: https://lore.kernel.org/rust-for-linux/aW4DWebqCg1c8Fgb@google.com/
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Shivam Kalra <shivamklr@cock.li>
---
 drivers/android/binder/context.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index 9cf437c025a20..f2505fbf17403 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -94,6 +94,16 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
         }
         let mut manager = self.manager.lock();
         manager.all_procs.retain(|p| !Arc::ptr_eq(p, proc));
+
+        // Shrink the vector if it has significant unused capacity.
+        // Only shrink if capacity > 128 to avoid repeated reallocations for small vectors.
+        let len = manager.all_procs.len();
+        let cap = manager.all_procs.capacity();
+        if cap > 128 && len < cap / 2 {
+            // Shrink to current length. Ignore allocation failures since this is just an
+            // optimization; the vector remains valid even if shrinking fails.
+            let _ = manager.all_procs.shrink_to(len, GFP_KERNEL);
+        }
     }
 
     pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {
-- 
2.43.0

