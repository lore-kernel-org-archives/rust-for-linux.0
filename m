Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A851A58D;
	Sun,  1 Feb 2026 00:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769904529; cv=none; b=Gwd18VLBtQnS4LGhqff4WJO2yTku+FYRqs99bEfmXFTj/I1nIn17+/ldsbM9Unn2YhIr45ORN9bHi11ZQcyWkqLP86CdhfOcqkbOBCfqXFIgFK0Sm2ZZh9HNxIodU0oVbXXXngGkEDxINc/UEp5e5sJrvG3sZPN353avD7rbtog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769904529; c=relaxed/simple;
	bh=PNZhCR+/pggdZ+eX2S14oEhix7kpixYkOW4FSi+tsAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAAwa+8uU1Q4k6k9kDTjylzmjQADKPoc5hGo52jPxj6oyI4wdwHQ+yKmICh6MnwTB61AtZFHyoiNZwvu5hk/DBiPbq1TfCwBvA2W/ZgF1e418VubfiG+ID9gB5R0M2I3jamyh2xRvq56IndH3dQYeZ/+huVkD8VnOQX9+/UBh8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=kK1n3efU; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="kK1n3efU"
From: Shivam Kalra <shivamklr@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1769904515; bh=PNZhCR+/pggdZ+eX2S14oEhix7kpixYkOW4FSi+tsAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kK1n3efUSVe5VFeKpkpYEFeKi3+oeNHTrlaTDRxr9JFVSXm6lrTqGQ1qUxQDSO78x
	 82slpxCkRa6Fy6AGCotoWFGAoREtR56AN4rppi8OzXlgZza9Oxr7XMLyFw4jOpzKnj
	 2oXNTbG8VGIqLuYKvHoTTJT1ONWzFRkuZoyxwKFQiiOR33LXdnSUEQI4pkr7DslUTQ
	 97zLhcWWMQsVZSGJaGAP3x1pcJBz84ZihsB+6XLo+p/AGN+eiHjXOp5CMAvz+FK6PF
	 zu1D5X1Wtb5BIYtdI6FooisA9+rgConqOjHLqiqdf3a370nTvhU1fVYpYd1gnyk3DR
	 xy7jUUlLtn36A==
To: dakr@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org
Cc: aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Kalra <shivamklr@cock.li>
Subject: [PATCH v2 3/3] binder: context: shrink all_procs vector to reclaim memory
Date: Sun,  1 Feb 2026 05:38:17 +0530
Message-ID: <20260201000817.275382-1-shivamklr@cock.li>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131154016.270385-1-shivamklr@cock.li>
References: <20260131154016.270385-1-shivamklr@cock.li>
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

