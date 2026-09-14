Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125D8356757
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422425; cv=none; b=royXEomoj+ykgdQSMZrWjDk4X2oRTFtYkrFvkR/RrjGLC/J5HkIEe3gXhJYCMehiANjewG6DqWoTr4XAns3gAcdKPSKhrQNG7FaTt+dTSESzu8Wo+2zMGZCpif4n4yt78ultMmRM8NxpLpxV3Ufn5zkgBj5G2dxZezCFmrmqt9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422425; c=relaxed/simple;
	bh=f42E5u0l+h+Hve2lQ4M+ZsIJrYC/BMWNnCOrQ+d2sLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mYisCCHOH1oCguPlJ+00z+ls12igKZEvW81/mEeRCNsjaJz7l/EKSt7GGbp4znKKJmtdv1z7THyyrfgO6kdlAYWtU9zTd57HBe9JrulVy9NiliI5eDD6wnXBQY3q1FWMzBN6hIubjRasCgT9Pls85d8tGnEJznSv0QDT3663wqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=BwzXrWo9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="BwzXrWo9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-395cf2535acso355136a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1789422423; x=1790027223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kscG4kyx+WhCK/LBZ/NG4KOvXR0DHb/sBAonN/QJ1zk=;
        b=BwzXrWo9OUX/Yaakui4/LcoqlnrM6AARdul1cZiTXX1UaqC47aGdPuuSeELUiLQzOa
         ogodcO8FvDU9K+FnHAEIp/Ba3MpO9dK07BNOwnYbzuQVm5FO94d7AsypNG/U/0qlNoCW
         /bfYf1Ftj74YsPLXjs0/gqB2/0aynKQOx1bmrH5QbunyjpZTnIhWoXRChHPtSiEMSRPv
         DnGPJQglAqaWysqKrPPdKNhOMfmgWArCfnyCWifQ8aN+v56SKWMr7jJzBjastK9MvVkV
         IwVisJO4WXcGWgUbUq3w3d0EuikzkF2NncIaa+TWilGNA7fApT6mVxB3oCqSkCQL3RbI
         Qfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789422423; x=1790027223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kscG4kyx+WhCK/LBZ/NG4KOvXR0DHb/sBAonN/QJ1zk=;
        b=Ly4sFd/EiMC4kPMayI3UpW7ZASfU/vl/bj3WDZwDCpQY4evXuFg9uGQPHQDiXxsOwD
         HVFk74ue2CDHUYUQZE/KqDLDQLFTNEofCDD5We4urFPlH1nzh337Cn2p2QfrLhRED2XG
         0Llj5lJyFz6Yd1qLXbPRSVSC0nmc2jbg6ej56V7D7/wMn4Ysw11wvXjRDTj2EWD2SD+O
         TcR+OKPT8CEnpfYzK1np3Q0iXsBwZs/8Ty/JWwg4Y+ol9HT/426TOMOR6Lj5rGmx4r7M
         unvwRch5kp4bAIaVGiGf5P7hvB6W8J07hKYqKGdeoxCdepBiLosM3kul24O7jnFve4in
         +xTw==
X-Forwarded-Encrypted: i=1; AKwUvByZUQzjIr3Dq5qkHwlnKs9BwR4PqDnEL7CiM8vt4NZ0vooQGS0D50U7ApO/psnUV0Cs54Nih2MpBuoAWrKBuA==@vger.kernel.org
X-Gm-Message-State: AFuF++lZhE97MKC2cb5+pX/jfhnSoMTII9ScU9+mMjipwsfCgxpRX7TD
	S1p7y248cPbR/EcXIrvWW4y0H+IQwfrtFSbc5WMMt3UNKK0EZX4PNQcKRoextz9UwQ8=
X-Gm-Gg: AYBFou0SQRHBtAJLigVyGh0MC7ktcCwNh51JTZIiQOtoiQbrtO51EeVsCat1PdWhVNi
	yOa+7slv7xTC5vN6DwJ6WHYhkkRz6nTPE7ENL/9SRd2CXyRXtxrEB0+SYYNAj8lVdwFQzSu7JtY
	Qvv3Rpn+DYlMt5zxUmXo5AuonNFM0QjG5vSfI1X3syH/Y44Ir96lYgSJp1Mzwe6IKPgX3rLCEw/
	yPu84XpiG14sR74pUnU6UjNdv/8cODiVcNSdis3Peoe/SYBJKoM7PqOZ6bJgcrEsIPMxg5zR7A0
	PwIYEkZdI8c5Mb8O9Km3PbKfaLcTHnXzM6qPNRSV9IKKEXbUilK92FOe76cK7q/arZpFSGAEitF
	Bass9ZHS1xwbc3atTyma8KyoZA0BuYb/rskd5zNrPkTG6J3whSKE2c7EWMiwbRy/bH2epQ6bWs9
	Z9R1uZr8tCdTtGGemgziOKMwdEGbPCiE7+9vHn3JGmctq2DGDZSSp7pxfL4/C6bxn6/078Vwk6j
	mYexg1EoQzjBt0ZuZQZTGCvWDLk1pwtCOCs03qdUBOFQ0w=
X-Received: by 2002:a17:90a:e158:b0:39e:d2:460c with SMTP id 98e67ed59e1d1-39e00d25207mr535301a91.24.1789422423395;
        Mon, 14 Sep 2026 14:47:03 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33bdd76abcbsm4868640eec.22.2026.09.14.14.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:47:03 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: a.hindborg@kernel.org,
	boqun@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: block: Fix unsoundness in  `Operations::queue_rq`
Date: Mon, 14 Sep 2026 21:47:01 +0000
Message-Id: <f515b62bb05e7b6bf0bb06c8fdb362486fea25a8.1789420324.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1789420324.git.pgovind2@uci.edu>
References: <cover.1789420324.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A safe `Operations` implementation of `queue_rq` can retain a clone
of the provided request and return an error. This should not be
valid under the intended blk-mq ownership semantics, as an error
means the driver did not accept ownership. Therefore, if the driver
retains a request while returning an error, it leads to an ownership 
mismatch and incorrect reference counting of the request. A driver 
with such an incorrect implementation can lead to use-after-free.

The Rust `Operations::queue_rq` documentation and type signature do
not currently state or enforce the restriction that it is invalid
to retain a request while returning an error. Operations is also a
safe trait. Stating the restriction in the documentation may not be
enough as soundness depends on the implementation.

Fix this by making `Operations` an unsafe trait, adding appropriate
safety documentation and ensuring error path maintains the expected
refcount.

Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
Reported-by: Dylan Zueck<dzueck@uci.edu>
Assisted-by: ChatGPT:gpt-5.6-sol
Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
---
 rust/kernel/block/mq/operations.rs | 35 +++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/block/mq/operations.rs b/rust/kernel/block/mq/operations.rs
index 861903e18fbf..562c19a242f4 100644
--- a/rust/kernel/block/mq/operations.rs
+++ b/rust/kernel/block/mq/operations.rs
@@ -9,7 +9,7 @@
     block::mq::{request::RequestDataWrapper, Request},
     error::{from_result, Result},
     prelude::*,
-    sync::{aref::ARef, Refcount},
+    sync::{aref::ARef, Refcount, atomic::Relaxed},
     types::ForeignOwnable,
 };
 use core::marker::PhantomData;
@@ -27,14 +27,21 @@
 ///
 /// [module level documentation]: kernel::block::mq
 #[macros::vtable]
-pub trait Operations: Sized {
+pub unsafe trait Operations: Sized {
     /// Data associated with the `struct request_queue` that is allocated for
     /// the `GenDisk` associated with this `Operations` implementation.
     type QueueData: ForeignOwnable;
 
     /// Called by the kernel to queue a request with the driver. If `is_last` is
     /// `false`, the driver is allowed to defer committing the request.
-    fn queue_rq(
+    ///
+    /// # Safety
+    ///
+    /// The implementor of this method must ensure that if Err is returned:
+    /// - The request has not already been completed.
+    /// - No ARef derived from the request remains anywhere.
+    /// - No reference was converted to raw or transferred to another thread.
+    unsafe fn queue_rq(
         queue_data: ForeignBorrowed<'_, Self::QueueData>,
         rq: ARef<Request<Self>>,
         is_last: bool,
@@ -113,15 +120,23 @@ impl<T: Operations> OperationsVTable<T> {
         // SAFETY: We have exclusive access and we just set the refcount above.
         unsafe { Request::start_unchecked(&rq) };
 
-        let ret = T::queue_rq(
-            queue_data,
-            rq,
-            // SAFETY: `bd` is valid as required by the safety requirement for
-            // this function.
-            unsafe { (*bd).last },
-        );
+        // SAFETY: `bd` is valid as required by the safety requirement for this function.
+        // `queue_rq` is correctly implemented to not retain or complete the request
+        // if it returns an error.
+        let ret = unsafe { T::queue_rq(
+                queue_data,
+                rq,
+                (*bd).last,
+            )
+        };
 
         if let Err(e) = ret {
+            request
+                .wrapper_ref()
+                .refcount()
+                .as_atomic()
+                .cmpxchg(1, 0, Relaxed)
+                .expect("queue_rq returned an error while retaining or completing the request");
             e.to_blk_status()
         } else {
             bindings::BLK_STS_OK as bindings::blk_status_t
-- 
2.34.1

