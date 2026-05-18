Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F64B1E25F9
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 01:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779068381; cv=none; b=SL7SLzgJF3tJ7Yv0eGtVGtc5jWBpKUAbBCGLwoCh/+hYNn3zjnrLqa8Vg9hGJ9OJDWVK3D9REXcZKynuD+VWyL/8OFuQgaMhyXd/NRiZeh7pRYRak/VRDpJN71u3XAFkjwDuk357JwT1xGL2jr4r9CpFIZYKpxiinT/10HZ7Uns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779068381; c=relaxed/simple;
	bh=tV9y9h8tyQclWteeIaMREPy8u22ENHoAcERe5+G8hQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GugHYa0CT1qxjFQqo3U8zCoyeEh/8ErAb3N077M6rX9GzgmGm60u0au5JrybpOxrTk01YYlDxu8ZfSMuB5Ig2m+ONF5ptlWDvP7G83y73Av7URPygV6dX2KiqKl4JybYmiz0OC84mqZtFBnIm1O4hyOh0z5vT93HFxAtvIUPeUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AB/5xGzo; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AB/5xGzo"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67e43a8996fso2232440a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 18:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779068378; x=1779673178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgeeVSI8Dv/viF+Q8OmPFj9IAqT9Fzi8XwuORCK6h7o=;
        b=AB/5xGzoKGPoPmulfCz1QuUsVbN3MY/1FG6SpiBUXQ9KUz+xDzon6rJS4Wi33Oe9QC
         YC2gLHnnQRwyjcKVQLnBCUri1tPSinp/xekrNxCZfHGT9SGEOfEo1OQfU/nQTBcHAHNq
         BK/JwN1zfeIAzb5tpcZDYg79X+qlzSuZLvE8vHQfUg5guc6wxrTASXjufkTLs8VOGfQt
         DKYXxT88sML8QLHlxFh1xlv79Lkx2H08VrXFSTBaKekUIWhQn1yTYpUhSQfUE3bNNUiK
         gKdq1Q0q2eZ7tAxtAMLbOur7CQ2ATp3FpzWooUQwr1xFHdgW5Vwd9t62UQtUh9HzjV+c
         Qnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779068378; x=1779673178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgeeVSI8Dv/viF+Q8OmPFj9IAqT9Fzi8XwuORCK6h7o=;
        b=ryUvEsChKEdGX/h58phw/yoc9pqUdaXkjfH16oiAtMdfkLpfsZ9fCnrErh0TNRvkPk
         4VguPBk0tp7JB3Xa+3yoJCddBXA9xS4D7yEU/OgVCosT6UpHz8amLl84GxeIyKVxzhn1
         UydfkL5T5RMQ/sr89dzm9Ds9liokxLjLqkkMeSENLG/6EZ+9hXmoAK7m1L5rch4Iorpz
         Cg+EG8Nhi1yl35SGuLz4Pkyl1gGXXuI4UC9JuNDX5BnBTF0k5G+NMHfoFO7NvFLH1s8t
         EsRmvK6azMlklhQMKgH2P/Y3Qb7EOP4PV+3O+1F9c8pJv+JGI8hzhlPajFcb1oBUn5xq
         6lzA==
X-Gm-Message-State: AOJu0Yyv2/eiyOp17rc9qtUJxNnqoWu7syIsXOnvf6i7sUBlZsmiXmsT
	kMzWgKObxE4t93IDJxO4odIc5ESDo/MdNeDtTQ3UwhMQa/3JC0ezH18reILg3Z1Jl780SQ==
X-Gm-Gg: Acq92OELxfthtJEsE+1j84V7uW8RF++4r37WtpKgkvq2yfiMwotTg7Yb7QGuJj+8s8S
	bAzyXk9p+rV3BMxRUpViVxvSMD+440eY9q3wZDK3Eu6CJ7uAnl4qxx4LT4SIMUEVlmdjQa8/ct9
	DEPb8WXnDclivup+FwhL3kC3OSMgOWpQ79Ld9yCh87vYGZV5qxMt3Ea5NujswPBn8zxFnvsATEk
	syzPYNpfaCHVjnpwOUnR4UGTMQplHiP4i3u2vsw5QTSmjTcJCg1WaRGyAz59cxJ5Ab9PVQYYzQK
	6+fqRN83iy0R+6hbG8HvgUeR+GgJv6TtR4WPYzl7rcgNhUxeJNTqjbqed517Is0T6/Lfo6kztuK
	PLABOkbMspTVRMhpT5emKJBwAWZuzeYgHJ8ocdq4m9KmczVeO+NrKhxg/gEfa67dYg8fjYqV9Ox
	zjhdblxX/Kr6SpOrGehyElS/s2IqK0F3elQ0t0Bsx//m08
X-Received: by 2002:a17:907:3e9d:b0:bcf:f292:9b04 with SMTP id a640c23a62f3a-bd5178419bcmr668808666b.22.1779068378358;
        Sun, 17 May 2026 18:39:38 -0700 (PDT)
Received: from moayad-Dell-G15-5515.. ([185.192.162.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1116sm507533966b.10.2026.05.17.18.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 18:39:37 -0700 (PDT)
From: Moayad Salloum <salloummoayad4@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	aliceryhl@google.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	Moayad Salloum <salloummoayad4@gmail.com>
Subject: [PATCH 1/2] rust: workqueue: add SAFETY comments for Pin<KBox<T>> impls
Date: Mon, 18 May 2026 04:39:25 +0300
Message-ID: <20260518013927.58481-1-salloummoayad4@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fill in the two SAFETY: TODO placeholders for the WorkItemPointer<ID>
and RawWorkItem<ID> implementations of Pin<KBox<T>>.

For WorkItemPointer: __enqueue uses a work_struct initialized with this
trait's run function because Work::new stores T::Pointer::run via
init_work_with_key, and the ID const generic ensures the correct Work
field and WorkItemPointer impl are selected.

For RawWorkItem: the work_struct pointer remains valid for the closure's
duration because KBox::into_raw leaks the allocation without dropping it.
If queue_work_on returns true, the memory is only reclaimed in
WorkItemPointer::run via KBox::from_raw. queue_work_on cannot return
false because Pin<KBox<T>> provides exclusive ownership, so the item
cannot already be in a workqueue.

Signed-off-by: Moayad Salloum <salloummoayad4@gmail.com>
---
 rust/kernel/workqueue.rs | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f2..6d665418b 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -881,7 +881,15 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Arc<T>
 {
 }
 
-// SAFETY: TODO.
+// SAFETY: The `__enqueue` implementation in `RawWorkItem` uses a `work_struct` initialized with
+// the `run` method of this trait as the function pointer because:
+//   - `__enqueue` gets the `work_struct` from the `Work` field, using `T::raw_get_work`.
+//   - The only safe way to create a `Work` object is through `Work::new`.
+//   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_work_with_key`.
+//   - Finally, `Work` and `RawWorkItem` guarantee that the correct `Work` field will be used
+//     because of the ID const generic bound. This ensures that `T::raw_get_work` uses the correct
+//     offset for the `Work` field, and `Work::new` picks the correct implementation of
+//     `WorkItemPointer` for `Pin<KBox<T>>`.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
@@ -901,7 +909,14 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
     }
 }
 
-// SAFETY: TODO.
+// SAFETY: The `work_struct` raw pointer is guaranteed to be valid for the duration of the call to
+// the closure because we call `KBox::into_raw` before the closure, which leaks the allocation
+// without dropping it, so the pointer remains live. If `queue_work_on` returns true, it is further
+// guaranteed to be valid until a call to the function pointer in the `work_struct` because the
+// leaked memory is only reclaimed in `WorkItemPointer::run` (via `KBox::from_raw`), which is what
+// the function pointer in the `work_struct` must be pointing to, according to the safety
+// requirements of `WorkItemPointer`. Note that `queue_work_on` can never return false here:
+// `Pin<KBox<T>>` provides exclusive ownership, so the work item cannot already be in a workqueue.
 unsafe impl<T, const ID: u64> RawWorkItem<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
-- 
2.43.0

