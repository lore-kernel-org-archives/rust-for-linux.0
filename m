Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1522F3803C2
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 04:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779078263; cv=none; b=CDWq/VjfkeXrfNeGkcxYr9uNfWa5Uhy+L5I2Iq2eFCGBzpqqmoKKi9G4uzQ7L/h0hVfBIeaYfYxIldJnh68GewKN7v8LrEj0unCqIwMmj1nroRBYWt0SlrCNjPh5X4HlCWszaYe2wfVn6xqG6YDd8LMVoeJVKa9+rXAwED+iIAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779078263; c=relaxed/simple;
	bh=94BYK/meaWRlBFsub8cZ3gCJ1k2jJpAZpuOvXBpdB1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JrBfDEXKg3GnikHeQpWArwEaiOTxPBdctrdipcPTfpGL/OhhBoWn+9WjtdeTxcAjZllA3z5jR2Tx9gwLXXheUWUxT5NPzX1/OtiGXHdEYbEIDsqjlSXHKbnBRWnVM7B2v2WI/KNVlBe/pINMTw2jlBJrQBaaH/YxQHAEBVN6YjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrHycDwN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrHycDwN"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so2673665a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 21:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779078260; x=1779683060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l+3nxpGKAAJVujTKbl/ibTWmnRef3XHrcqZengS5y84=;
        b=MrHycDwN874dq20Mic5qC4uAUKrt+oKX+hrf+KQdr3VXAtNIw9LdQJI8GQcYnm6oSF
         LX8DsW2hioue5GNqHWLF6Xb0oWcYzmBXu3Ex5mpmxwYBiX4muTp7+dhXj7CNx9c63kyM
         4V0rySae3Q75MYhyh8lUYaT/kuDN9NFTZBd7CpD/Isdx/HBf7CQ2/IgiuXd0o8eH5kPC
         AaoWVD0KDmPVk3aupvzq4QsO+n68aV2ngfO5nSTFP4xEDzXHHoK7mdI840yDtGsj/x3n
         FvYyuVJDjeDZBsDGWNSBmAmBG/tFLViTCgIOpUAM4z6ZasUYQHgptUOfMGnnnzY8oB6V
         afqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779078260; x=1779683060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+3nxpGKAAJVujTKbl/ibTWmnRef3XHrcqZengS5y84=;
        b=sU9wk+oyRT9cL4HvhnxtzKKyitdk0ek/OvfxB5kaF0OX+kMlYm1IG2op9xifuB3HvJ
         SK6ecTE1Dwr2dKgxDeeyeDx1vXi8Lu40dTbWmHDC6WAnJe1UsgqgM/BME66RbcBV7j9h
         suJ4kZp1EPOYFwWMGYgGt00MdSOn1fTpmyuQw+N4pjiVVNz32xzk4X469n6H1C5+IyIE
         3lta/s+jCmeECYPsAf2tXZAwyE23p2gp0/DMX1V5ZoZwSG7Ic9QIRHoL6byxH0NVhN0B
         no4y0OxL1zemWybSoaOFicAkD20CM7BN97Y2xT9QDqlAGpFkrxVe0ymYAdy8FJJbXQSP
         SMyA==
X-Gm-Message-State: AOJu0Yw6us9TE8NJQqDI7JdRVMV7UreW70cTYRjpJghOkLPsj5JnmJqA
	R54bHmyPbM9ZjJ/46aBkU2EtDbnuecN5koWCK3GljI9Igr7oamUsQyQVXEDgYFuf8IQSaw==
X-Gm-Gg: Acq92OGxMfxDz/EgHWoh8i2xDspxnZY6ojCgQcwFPBgzKtnjZPRuRj0kB8I2G0Q5U5f
	ne68GfxDWjKDELCt+q3C954Ns4C+eSFVhwKmuwsQrk6derf8eG36VpT/mcULhEo296k4mxS4hID
	xE2nWfRQ2Qc513ce0k/jsbwN3P/y3ZpLL7q8pO0OPD7xeOKfANu4VpCTvXXTzG3qfYxT8zMnHhD
	a/AnVJazGnYQE6yUQJUKeeq5juUOo6F6b06cEt2LPxv00hdoyX0Yxnn7mBbb3bcqGmD1cWSiXeG
	QidmAIk0T/wCmmQfpklOtpsI6fOaNownqkGp5U6polxIsphXZjGFSfqUcscNQdnyVaENxmZ7Y5L
	3ehTeRx3ppVBs04hQoF1spTt/MGnEtyyBUYQqbinp1O1fFZBiWundgH9X8/ljSSoctfBOQ1YY3W
	omnjeoODURWXee8t2qiOf07kr1Rb2MZe7aJMf/y3D6UPnVFp+yD+sGRVa0
X-Received: by 2002:a17:907:3cc1:b0:bd5:7c3:69d with SMTP id a640c23a62f3a-bd517abc6d7mr654993766b.48.1779078260197;
        Sun, 17 May 2026 21:24:20 -0700 (PDT)
Received: from moayad-Dell-G15-5515.. ([185.192.162.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c313f7sm525936666b.21.2026.05.17.21.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 21:24:19 -0700 (PDT)
From: Moayad Salloum <salloummoayad4@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	aliceryhl@google.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	Moayad Salloum <salloummoayad4@gmail.com>
Subject: [PATCH] rust: workqueue: add cancel_work for Arc<T>
Date: Mon, 18 May 2026 07:23:47 +0300
Message-ID: <20260518042347.95213-1-salloummoayad4@gmail.com>
X-Mailer: git-send-email 2.43.0
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

