Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F523EA74
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Mar 2024 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710327968; cv=none; b=mSvziTzAkR4vM6bfMLl8ZJc9lBxI9QwKKcXz3KTYl5JD2nJMemYJfcta2tvNfyg9eU8NuPsfNPNZgc+g8y1r2uA2IQWWNlsNErN/TTdv/j10YXS3Aj+k4cFhnS/xl4psvMLr/gw5fBDMQLQ18bb22bTY8DS/eeIbQG7J2VFDyo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710327968; c=relaxed/simple;
	bh=0nWQWFCl6B4xYKkDm97E2SVl9EyjGoZdLZ86Sb/jU9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C42FUByfeUpZI8Jo/7g22DhTZ8Zso8VAPpHjDztP0dazIgtxtQCM8kULkoSzKc97L45FClO0XI6ON23kNUpnt0s9JjY2D8QP10xxKe4sEwJoSs+Qs10P2R26KSEsMh7k9Jyia9PV32e+ffYrq2Oyq3lG+CCaUhCTFosCifZovtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=QpGPgSSu; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="QpGPgSSu"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563c595f968so8306342a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Mar 2024 04:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1710327964; x=1710932764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9bZI5MgzNqcWYjN2D6bG0PRoNDep28qrRC33Rpd138=;
        b=QpGPgSSurQeAV00kBohfIDQQ/sRbcn65+FgAjpsiTxNjEekBpJMerxBs2t3phB2iwJ
         KPkkqNlIK+ifJR+HcW+SqLy5RmnIwuy/B87lJ0e0pRYw+xsxG0Fv8/ucTq2YXBVu/pXG
         0bb1k4K3/b88I9bCvm7GrrAEuz/jHnruh5RFztsAoRdsDgreIMZPKJ0pRid4a1jR/SDN
         2hmavXdRUOHAq68FvSK4sgI1ZtM+lt/kgWQzbCaYlvKn/uXhlODQEtfCBkSHeBdF9S3q
         rZaEJkcsswGeR1RuA1XOu76bMkzWyD5+fS0BKfY4IV9TRBqr24H3z89Ze97+c0xVKKUL
         s0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710327964; x=1710932764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9bZI5MgzNqcWYjN2D6bG0PRoNDep28qrRC33Rpd138=;
        b=UYWnt2VhQm1rqA+DUjQH+pCKPBMXQz8yWK3ffwQQdXfSbxSDEHhGTkq1I0EIBX81z9
         38lBw3+94No0qLQv+VW6/X2cOROU8A4kUJj9oxxlNsBc6cncvuqhtVDvpBetZ4zlCHox
         1qKEMJJYk0XFmi+ocRlBy8O2JdcKCKtZaWGMjOQfUcWRtFYNGHsDA4R3whHkAQmlZnZt
         VCVjHzlRbf4jCtvtF8zdHo0w4BxdDvKRaJcFC1DogWRJxq+LEoR/rO53jRdO500v3VZl
         AIuCoqTHwkHD4HKt5rVIgn8KmG949LWBXrUnuyZgCq5gXAp3dYwQnLFI+S71tIauUD7Q
         6qVA==
X-Forwarded-Encrypted: i=1; AJvYcCUDOsZtwKsK58KDg18KalhKXYKwCwseDeb1bN91kagaj60SVmVYnwT3BtERztOlxTgLBIfut4N5wabaN5iie984FxYE1cPi+tpCMN8ZlBo=
X-Gm-Message-State: AOJu0Yw338QUdxalSG8nbHaGXej2SzyfNM9OXeE+D5syoBpRVJ+A06Aa
	0KQkqV1ufS/gZ4txxZBfhLM8YM2xhsQ9j+WJHalnpRHGW0MAHuQWQ4Jh7BsIo2U=
X-Google-Smtp-Source: AGHT+IGELi8A7Ge1QGtgoog0Js/kx4/CnhNpUUdBbM6NEhHLHoRBcFT6jXqrv9OjTLpIoqQcdAlmcQ==
X-Received: by 2002:a17:907:d049:b0:a43:f587:d427 with SMTP id vb9-20020a170907d04900b00a43f587d427mr9420734ejc.34.1710327963467;
        Wed, 13 Mar 2024 04:06:03 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id o18-20020a17090608d200b00a461f6da4e3sm3367049eje.94.2024.03.13.04.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 04:06:03 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Damien Le Moal <Damien.LeMoal@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Hannes Reinecke <hare@suse.de>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Cc: Andreas Hindborg <a.hindborg@samsung.com>,
	Niklas Cassel <Niklas.Cassel@wdc.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Chaitanya Kulkarni <chaitanyak@nvidia.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Yexuan Yang <1182282462@bupt.edu.cn>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>,
	Joel Granados <j.granados@samsung.com>,
	"Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	open list <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>,
	"gost.dev@samsung.com" <gost.dev@samsung.com>
Subject: [RFC PATCH 3/5] rust: block: allow `hrtimer::Timer` in `RequestData`
Date: Wed, 13 Mar 2024 12:05:10 +0100
Message-ID: <20240313110515.70088-4-nmi@metaspace.dk>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313110515.70088-1-nmi@metaspace.dk>
References: <20240313110515.70088-1-nmi@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Hindborg <a.hindborg@samsung.com>

Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
---
 rust/kernel/block/mq/request.rs | 67 ++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index cccffde45981..8b7f08f894be 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -4,13 +4,16 @@
 //!
 //! C header: [`include/linux/blk-mq.h`](srctree/include/linux/blk-mq.h)
 
+use kernel::hrtimer::RawTimer;
+
 use crate::{
     bindings,
     block::mq::Operations,
     error::{Error, Result},
+    hrtimer::{HasTimer, TimerCallback},
     types::{ARef, AlwaysRefCounted, Opaque},
 };
-use core::{ffi::c_void, marker::PhantomData, ops::Deref};
+use core::{ffi::c_void, marker::PhantomData, ops::Deref, ptr::NonNull};
 
 use crate::block::bio::Bio;
 use crate::block::bio::BioIterator;
@@ -175,6 +178,68 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl<T> RawTimer for RequestDataRef<T>
+where
+    T: Operations,
+    T::RequestData: HasTimer<T::RequestData>,
+    T::RequestData: Sync,
+{
+    fn schedule(self, expires: u64) {
+        let self_ptr = self.deref() as *const T::RequestData;
+        core::mem::forget(self);
+
+        // SAFETY: `self_ptr` is a valid pointer to a `T::RequestData`
+        let timer_ptr = unsafe { T::RequestData::raw_get_timer(self_ptr) };
+
+        // `Timer` is `repr(transparent)`
+        let c_timer_ptr = timer_ptr.cast::<bindings::hrtimer>();
+
+        // Schedule the timer - if it is already scheduled it is removed and
+        // inserted
+
+        // SAFETY: c_timer_ptr points to a valid hrtimer instance that was
+        // initialized by `hrtimer_init`
+        unsafe {
+            bindings::hrtimer_start_range_ns(
+                c_timer_ptr as *mut _,
+                expires as i64,
+                0,
+                bindings::hrtimer_mode_HRTIMER_MODE_REL,
+            );
+        }
+    }
+}
+
+impl<T> kernel::hrtimer::RawTimerCallback for RequestDataRef<T>
+where
+    T: Operations,
+    T: Sync,
+    T::RequestData: HasTimer<T::RequestData>,
+    T::RequestData: TimerCallback<Receiver = Self>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::hrtimer_restart {
+        // `Timer` is `repr(transparent)`
+        let timer_ptr = ptr.cast::<kernel::hrtimer::Timer<T::RequestData>>();
+
+        // SAFETY: By C API contract `ptr` is the pointer we passed when
+        // enqueing the timer, so it is a `Timer<T::RequestData>` embedded in a `T::RequestData`
+        let receiver_ptr = unsafe { T::RequestData::timer_container_of(timer_ptr) };
+
+        // SAFETY: The pointer was returned by `T::timer_container_of` so it
+        // points to a valid `T::RequestData`
+        let request_ptr = unsafe { bindings::blk_mq_rq_from_pdu(receiver_ptr.cast::<c_void>()) };
+
+        // SAFETY: We own a refcount that we leaked during `RawTimer::schedule()`
+        let dref = RequestDataRef::new(unsafe {
+            ARef::from_raw(NonNull::new_unchecked(request_ptr.cast::<Request<T>>()))
+        });
+
+        T::RequestData::run(dref);
+
+        bindings::hrtimer_restart_HRTIMER_NORESTART
+    }
+}
+
 // SAFETY: All instances of `Request<T>` are reference counted. This
 // implementation of `AlwaysRefCounted` ensure that increments to the ref count
 // keeps the object alive in memory at least until a matching reference count
-- 
2.44.0

