Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6826E706
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 04:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779077527; cv=none; b=GJ8zH/vDdpmQ+wFpOJKwHA+lShlqBk9F3eLYdyEUELzqi3NPWrKpCw1L43WsTcLEgHF4vkap0FrsWmxljDWWqh8YhyVjlfCUdCFxaRQGbblXkvKZf33Pqavzp8ALkWT3NVbqqek7Upq8wWfCKqdE9/1n9JUd4EXE8JQrbKaFcco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779077527; c=relaxed/simple;
	bh=tV9y9h8tyQclWteeIaMREPy8u22ENHoAcERe5+G8hQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wy7WDAZpKsMPUNqNkRdNFdxPvWsvdSvqMc6uVAxTNR5DspiAxe8H5vzocmEkkbs3f0cW6Jassxl6bmy2Rm/iF+mPEVM6YBFivsWmIrBZ9YnYwkAXmH3iNPPlAS4QAGmGhKPhrflvGiSPG1I6WbrB0en7SWCELs00Hhth+fAf/uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIzT1Yau; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIzT1Yau"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd2e8931915so438771966b.1
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 21:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779077524; x=1779682324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgeeVSI8Dv/viF+Q8OmPFj9IAqT9Fzi8XwuORCK6h7o=;
        b=hIzT1Yau+xV1naP9ILK07XM4ykuulPT0I+e4lnXbVsXi3cBCx7qyDfWRxppGW8Eoxm
         Ecnm6IyVkWvpWwkw33PkMKkdTtO2xpGVgLSx8P8mMu8OZDiwLSC8awx6olx0IF+R9TPE
         DnDlbLZx9/RC9qkID+aNbKEQg5Cg3UjURJtAJ7YcxtXdV2AP5098tJ0kRzH367FrZj84
         zBlZ+R86BTYh+0dD9vuXT8YWiFd6TgqXG+pM1+u0JLDzaAqs+j5DOGVucuUZlrigFkfK
         zvotq7LF61A9FoeLfImkDsR8LwxwHb1oceMWsRPff1tI0fdUaZtBpkmkl0QVEEBCDxqw
         Vv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779077524; x=1779682324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgeeVSI8Dv/viF+Q8OmPFj9IAqT9Fzi8XwuORCK6h7o=;
        b=OuMRvv2GC60JW3TwNXUHn+GcZ9IHQDQzj59fwWAvef/Eb6To7ywsCp/qMKfvEUp5To
         cWDarla9E1qtDiTt3f6EmdTWPYGLDxT9bEfcEU7ZIBHjEyS1gmjPYQBuLivw1eqbAw0P
         stuRPyre5zsFP76czj3gJU78bKqB2/Rh4wmnnxtzJfrxCEYmXIFrLGBAdxa39oQgjTfj
         THsHlNiERA8KKgaZE15G7+KuUaCcd1l3UpsjmpUWhiEN7YCsCsPRbhWyfHSgQfDrdBuD
         BLtAzwrHNtAAnl8/7Cm5OrvwpZK/Uk6QaU3joXtkgYZ0VB/FLte27/+37JhZ8h4+IzCc
         6WNQ==
X-Gm-Message-State: AOJu0YwhDMl+Bf53ENrinwhXRdGrhK15wxSEBUlSt2eDgFg3LrEpWwyF
	0x0h8foal42V5JP85yKaHMJ92xl/ATMUxB6opinG/KztMGENjFn6SBs+o3VrIpC8pZvHMw==
X-Gm-Gg: Acq92OFlREjzToZ2OVLyqGzsed1m08oGuqjzv1D3zVQrMFPKcXVOgWaZzTLhHzl69Xb
	P2usAlZ+cMAerEOiFrTpRJxVzrpv4S4HBIhrhol9wEaYKDN6gJgdROfTyK8aDBFJxTsBdFJS1TA
	0fK7T/8N0huWAFiQ7jIXbLAH3QuWa96l9Tb6ORjrXy4Ov56Baj+bQTCXHYiX1TC+lrWvmIZ8pKu
	d4WBf3ohDcnWlqXdAo2BFGn+9Agpv1dGrZRCvT8zxPHIKStd+bCjXb31RQCQtwhF+coQ/9fEPJx
	sPT5iBJ4WEGJv9Ndoc6CXcxeRgEcPOniO/jXnSUAY4jWVKuwf76/B9EOMIY4OztSDDRlpulBGup
	NeeL4dCrSDdB4hxg8aIDjqFLbgobr3hMzYTWfc9fCLOjS1NlFnT/kx11WUo/RkUUmdV2jL+A6j6
	OqsHFYsoMdD96MFZGxuLZQnL6OMHHnYhdIWuwCH5wzdB6ECblF89fdxnSMtr1ddtNZZMw=
X-Received: by 2002:a17:907:3f10:b0:bd6:462b:1d6c with SMTP id a640c23a62f3a-bd6462b292dmr268170766b.0.1779077523468;
        Sun, 17 May 2026 21:12:03 -0700 (PDT)
Received: from moayad-Dell-G15-5515.. ([185.192.162.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c620cbsm513915166b.27.2026.05.17.21.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 21:12:02 -0700 (PDT)
From: Moayad Salloum <salloummoayad4@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	aliceryhl@google.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	Moayad Salloum <salloummoayad4@gmail.com>
Subject: [PATCH 1/2] rust: workqueue: add SAFETY comments for Pin<KBox<T>> impls
Date: Mon, 18 May 2026 07:11:54 +0300
Message-ID: <20260518041156.93133-1-salloummoayad4@gmail.com>
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

