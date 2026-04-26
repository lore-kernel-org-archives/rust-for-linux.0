Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08602257423
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777226019; cv=none; b=uiZQHXThqSwJ0MWW7gfqhOG3ZNYiD2jyUe3T96b5xUQNTRSCAFYN0KlnWSSPhRpeXgfSGYVFizOGiZ2t9RBVhY333uDm8PvBw1GY8/gAR9ZfWHHQmXYdVdLqF9mYzkDyz/mFzMujjKFAv8HRFSvMsDSl8/92VAd5h8eCBLDiADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777226019; c=relaxed/simple;
	bh=K3PhdH/H1LuLbuZf9RFfbPB361BzmgW112xFwjwqE+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VLFNokknlx9Wm+yas+OHKbowK5KBewS+YLpketvZyn9/wx553el3yJRkSvJrrpqyiky9eRD36fK4REoa+x0wxT1MbPth55QRf+U7a91YmRalx8CNi7Xw+BhQZ+4U4oMd6813okp7dRD8blsEbPwgpe0WkMVhpbIfqu3jfklkXIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFdOGowt; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFdOGowt"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso2821441a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 10:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777226017; x=1777830817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJwj/aOjKyp0eDwfZBPm2TCTAMglOjfWhZzP5CZOSOY=;
        b=bFdOGowtwLnEUho2k7QeS1vmnoachmQq4uSIqkmJLvKY3TXORu45LXfSYpDzMHj5qv
         eceD171VQFKRE8Hrjyr7h/vMjFeU7t/QE266leyexSiXXAqrW2irABeuRoEYH9nwGZ/7
         bLEj4XEn2q4YUtobAEXONpXYGlggRm+AH/6Bc5fRnvd4MizyIEDGbc/di5ZMw1JvbJGy
         vHc/nb7vDZ2EyBdWIynrAxeVNO/M/5CYrb006wjZU1J3bPekG35XHYkP6rVYsyeWEgrO
         8av19ouk3imA7m0uy5DyYZjPgDsIQ2BWCuRVp44vnoOk7AEZgteD0DHjsJWgwi+hIECr
         Ajsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777226017; x=1777830817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJwj/aOjKyp0eDwfZBPm2TCTAMglOjfWhZzP5CZOSOY=;
        b=gMUarr/8hnB4PRICrMuZLjIeUuH+RBVFqj3w3shQLywc/q4sCrNxBAnDAFqj6MZPH1
         WN/yxu8Hji4I8k2R61nhhuGaJBOop2Kzpc4Or7kaoPwMKXvtxERN+unJMIa7o1wPUhws
         sCvYU60GvbIYMTYx+GtxhiHnQ3jqsT9MsMc1pjG2ysXpigET2OZEZU3rz3Nx8a3RUEbX
         Odvd4CYJMXdFL/ZLgAFAxDnT1cVILkx/tBZI85+rjt4odHxB9b1YBb4Oi3VTqQUG4Lp/
         7xiQAlI1XQPLTXUm4+9Uhwdi/wUqyq30GUffAKmd0uPtAIvTo3qmkCauvU59e75yNSy/
         PeNw==
X-Forwarded-Encrypted: i=1; AFNElJ+ls96lqgoI+Am6nrNcqPB5YqUy7TibQqBsZFmZw0V42EVXN7KiM7xkxPbraEprLbiCpgxqPa6XWyt83Tz7MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA13EaDX2/heJJj+U2qkJ/bjdkaYA1cEKvh7cY0pYu9j7J9+xH
	8fJFrekRaVEqlfqxKhP9CsF/w9xNnr0Xl/sgFbsugHdeVnna0fzRu3uO
X-Gm-Gg: AeBDieu7qTQRsFkmJZXbRss/UZGyuFti0Zt85j/+2wz4LIi9hh/JHWHp280CBHfU3UX
	xKZXnKbqinPKYZvyXGVHjl8cs++q8J4p9l41BQgV0bEojg6UwNFef7dTWG+HlBZC/ydwAvxL7sf
	fr7cZKjBAnhFFioSy9LLCRgGydHv1baOm6k7Bn6KstiUcX8BRCayKNJsIUdtGfq+yKKJKZ7TohB
	z169PBCisFlUXOnUuLYdxtGAGokGe37iaLS0fXSzme5HYlXLe1reyCOJjUUdHY/cjxqLohef4q0
	OJTVxREQEhtGkl7g6/gexQa5k0cz7AI9hs5Q+u/qlaJxNyDvWyH0J8SAkQQPSwSUjgz8MooFExP
	OAFFbexXUqu+xHiauycLZLqkYgObpS/0DgbGUOAyzg6m6K6Yi2yNVXHAIEzMkDbCMrwGM65Ksii
	twISSl3tYUWQT7jBJRgz6wGzW2rQmKPgsp/k2LE2bBq7vYYXAHzDc=
X-Received: by 2002:a17:902:cf12:b0:2b4:460e:6fa8 with SMTP id d9443c01a7336-2b5f9f61d45mr395585175ad.34.1777226017339;
        Sun, 26 Apr 2026 10:53:37 -0700 (PDT)
Received: from Nighthawk.localdomain ([223.178.220.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff409sm349672805ad.14.2026.04.26.10.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 10:53:36 -0700 (PDT)
From: Sagar Taunk <sagartaunk2@gmail.com>
To: ojeda@kernel.org
Cc: aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	contact@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagar Taunk <sagartaunk2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] rust: workqueue: fix SAFETY comment Arc refs in Pin<KBox<T>>
Date: Sun, 26 Apr 2026 23:23:17 +0530
Message-ID: <20260426175317.10171-1-sagartaunk2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The `WorkItemPointer` implementation for `Pin<KBox<T>>` contained SAFETY
comments that incorrectly referenced `Arc::into_raw` instead of
`KBox::into_raw`. This implementation uses `KBox`, not `Arc`, so update
the comments to accurately reflect the actual ownership transfer.

Fixes: 8373147ce496 ("rust: treewide: switch to our kernel `Box` type")
Cc: stable@vger.kernel.org
Suggested-by: Onur Özkan <contact@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1233
Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
---
 rust/kernel/workqueue.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..74c59f2b1c09 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -890,9 +890,10 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
     unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
         let ptr = ptr.cast::<Work<T, ID>>();
-        // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
+        // SAFETY: This computes the pointer that `__enqueue` got from `KBox::into_raw`.
         let ptr = unsafe { T::work_container_of(ptr) };
-        // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
+        // SAFETY: This pointer comes from `KBox::into_raw` and we have been given back ownership,
+        // as the workqueue guarantees `run` is called exactly once.
         let boxed = unsafe { KBox::from_raw(ptr) };
         // SAFETY: The box was already pinned when it was enqueued.
         let pinned = unsafe { Pin::new_unchecked(boxed) };
-- 
2.54.0

