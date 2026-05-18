Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A0B26E706
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 04:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779077533; cv=none; b=LBueUdyqTqS8aCgFdu5xiCl5Iu0797cEV3I9lqDLCYGJbQgRjiuapPIXaTeQkfwxDYNaA73yMgAkn9cLonL3RGTRQ0lKkErIEm0hZz6FGdFL+52M3u/gscFt+JPqtnylhM4D1u+VXBb/DWFNN8V9YsUhmnXETUpZtBUIkjCI8/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779077533; c=relaxed/simple;
	bh=94BYK/meaWRlBFsub8cZ3gCJ1k2jJpAZpuOvXBpdB1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OInbRjXAYEdok+h1y/4ebZgXqCB70odLru4qYtf+xz44eJFKuxfXU388mo8Du2gofCe40RwEVqBcPJYNEaXKSY+mhlzFhPmalQyaqpR8Z3RCe5ueNZvBHZRXR6m9yYWCMmVeRv+ZQUFahEbsXD122pTQX+pnSk2NnU4bIIDyJZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOuwuOJv; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOuwuOJv"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bce57c132b2so581775366b.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 21:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779077530; x=1779682330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+3nxpGKAAJVujTKbl/ibTWmnRef3XHrcqZengS5y84=;
        b=IOuwuOJvqGKfzbDtCmnFJ6yaIhKia6s6UQTYJ6yZ6si52XlWDoKYX4deZdg5mEX0dz
         xiNk3zqZQXWRqhjsYHmQKp2sTLAjmpFJVLmDIgUgzBpkD9sNTelFSxRZzX8bmLXKh19Z
         Exn2BlzpM5w07mIYx+UXjNiyxf6bVPLiAccbJ61kBTJf8ai/XtZHqVCe7cKmQLZy/+90
         yU897ievA6kQHEE1qDs2sdARDEH4MEKfouYoxfaamzkrrH/nZY7YIYbCfP3aCs1kNQVF
         s44Jy5ML3j49tgB0QUXP9wK9jvgpMCR9RwKiayZsZ51bO5+pMEDCHWYs71Eep1YNAc6M
         5U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779077530; x=1779682330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+3nxpGKAAJVujTKbl/ibTWmnRef3XHrcqZengS5y84=;
        b=FXnPgEBzNVC4rWXh6Q23/zjk7VA2hpths4nH4GYH4pRFTLOPGchcHebDZLgpA+9QkA
         I/L6DspeFYuKPXhLvRdIu59Hpz/IcLN9pg/XpL7v1+cTxt+k6isNswqv2dsG1gLEd/+e
         mjJ88N2cg9PTzNraEWc79kRHcnUfXlUKxzACVrZv8Bg/LxBUf8hx5SEwYjQp92K6aG8w
         OZU5q6wdNFXfRJyX0xrFu9+pTDZHlTurusa1mrMtildMBnZpXdpJ6JdOqjsvcag/d8V9
         8TEVNO/2U1qIp2dovzK6OIRIneZUKv3gmPCH8QEhCRHvI6Cr1fkqWecIErnRmTyD4Nrk
         zvHw==
X-Gm-Message-State: AOJu0YxVsvQUjL1jxaD35T05a73ekH4+nDT2NOLwXD5X4Cs7Hb3GVmXM
	88iYdIaBkO9WAky30Cq+rlL5me1dg/1CjPTSEUQSiKPx3VF4KcOSaoN/7qQ7NZqDbm7rgA==
X-Gm-Gg: Acq92OFMsBpCvCv5CC6JVNVf0kR5Vwlavrj5I1CV3ri8ha/t3UqOzU8Z0Bd0W2LcvxM
	/CXF6kkqaN53WS13riUvzG/MWtZli8wNM6oWKW9mwO/5j/wqtXXUSt16EhcKMab4YkPGKITROWG
	SjiA7CmkBUoLJVe5Hdc41vtc0rSti+ip4tf572DwNsqmvkkkzgy0oXk0wLgQqp6C5Blclp0T9I3
	kYbQgaDAa1+i0e0TfcEjM3g1A2H4eMr7HJxEGYrUsjdl+PVObRbOoeaZK5RcywwFkQff8nZV2Tb
	9bg9+wky677MBKzBwPI7h6FnvS04wbqIh6xWAhV8l/LuNR4V4rGMgXIaKoWrBKY2DMy1EOYDaDi
	+ibpnn1BCvKGKJUL7LukNCSA+pgc7d/RJgJeOkyPT78u+1c98oG9BclHRZXVYA+QJdh23qhf6lT
	7aVrlm1KjAot0rP3cuqD3jH0F38noTGG/Awzf1M9h1ZiCylUSpdHfs7bHg
X-Received: by 2002:a17:907:8707:b0:bd5:7c2:7616 with SMTP id a640c23a62f3a-bd51553bee6mr446184166b.23.1779077530143;
        Sun, 17 May 2026 21:12:10 -0700 (PDT)
Received: from moayad-Dell-G15-5515.. ([185.192.162.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c620cbsm513915166b.27.2026.05.17.21.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 21:12:09 -0700 (PDT)
From: Moayad Salloum <salloummoayad4@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	aliceryhl@google.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	Moayad Salloum <salloummoayad4@gmail.com>
Subject: [PATCH] rust: workqueue: add cancel_work for Arc<T>
Date: Mon, 18 May 2026 07:11:55 +0300
Message-ID: <20260518041156.93133-2-salloummoayad4@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518041156.93133-1-salloummoayad4@gmail.com>
References: <20260518041156.93133-1-salloummoayad4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a safe cancel_work() function for work items owned by Arc<T>.

In the existing API, enqueueing an Arc<T> calls Arc::into_raw() to leak
the Arc reference into the workqueue. WorkItemPointer::run() is the only
place that reclaims it via Arc::from_raw(). Without a cancel function,
drivers had no safe way to cancel pending work, and any attempt to do so
by calling bindings::cancel_work() directly would leak the Arc reference
since run() would never be called.

cancel_work() handles this by calling Arc::from_raw() when cancel
succeeds, reclaiming the leaked reference that __enqueue() left behind.

Signed-off-by: Moayad Salloum <salloummoayad4@gmail.com>
---
 rust/kernel/workqueue.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 6d665418b..daff9040a 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -871,6 +871,35 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
+pub fn cancel_work<T, const ID: u64>(item: &Arc<T>) -> bool
+where
+    T: WorkItem<ID, Pointer = Arc<T>>,
+    T: HasWork<T, ID>,
+{
+    let ptr = Arc::as_ptr(item);
+    // SAFETY: `ptr` comes from `Arc::as_ptr` which is a valid non-dangling pointer to `T`.
+    let work_ptr = unsafe { T::raw_get_work(ptr.cast_mut()) };
+    // SAFETY: `raw_get_work` returns a pointer to a valid `Work<T, ID>` field.
+    let work_ptr_struct = unsafe { Work::raw_get(work_ptr) };
+    // SAFETY: The `Arc` keeps the allocation alive, so `work_ptr_struct` is valid for
+    // the duration of this call.
+    let cancel_res = unsafe { bindings::cancel_work(work_ptr_struct) };
+
+    if cancel_res {
+        // SAFETY: `cancel_work` returned true, meaning the work was pending and has been
+        // removed from the queue. The workqueue will not call `run`, so we are responsible
+        // for reclaiming the `Arc` reference that was leaked in `__enqueue` via
+        // `Arc::into_raw`. We use `work_container_of` to recover the original `*const T`
+        // pointer from the `Work<T, ID>` field pointer, then reconstruct the `Arc` with
+        // `Arc::from_raw` and drop it to decrement the ref count.
+        let item_ptr = unsafe { T::work_container_of(work_ptr) };
+        drop(unsafe { Arc::from_raw(item_ptr) });
+        true
+    } else {
+        false
+    }
+}
+
 // SAFETY: By the safety requirements of `HasDelayedWork`, the `work_struct` returned by methods in
 // `HasWork` provides a `work_struct` that is the `work` field of a `delayed_work`, and the rest of
 // the `delayed_work` has the same access rules as its `work` field.
-- 
2.43.0

