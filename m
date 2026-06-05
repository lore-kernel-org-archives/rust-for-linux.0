Received: from mx6.ucr.edu (mx6.ucr.edu [138.23.62.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAA33DEAE3
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 02:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.23.62.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780626253; cv=none; b=gbpujR7SuJ/qQ3gFxPnvppFGYrAteDqZv4V4vpdZyqmMisGn3oBkd4tu2U7W8tAcVVrNRLEH5uDa8iWHILRiDzMRe0OlCRZEih7B+egw1Qnvmj9fOrXDkM66SDtZJekhlNLOTQfVOQzvVXEYz51ImK27GJ93tznEiNwvV6JXdZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780626253; c=relaxed/simple;
	bh=HB+SlFM/oJ6M/YFvB3bNQR4gXUPq98BNBncESdeIh+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GvjUDyejiiWcKS8/b5hv//WtOJoanRQp+8h0h2HEJ5q5f8FTvzjEuYK7EDHVLZ2f0TawMjtrWusL/HxWkfWNwgZsB+4+vnoIYaasE3NpYCsz5AyI0LzScVsMg/okhF/VtkOR2itwrGiy1nXDFa+KTTuv/euBnbcHNGK1ZuRiAHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=email.ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=e/ssppiC; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=qOJphIPz; arc=none smtp.client-ip=138.23.62.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=email.ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="e/ssppiC";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="qOJphIPz"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1780626245; x=1812162245;
  h=dkim-signature:x-google-dkim-signature:
   x-forwarded-encrypted:x-gm-message-state:x-gm-gg:sender:
   from:x-google-original-from:to:cc:subject:date:message-id:
   x-mailer:mime-version:content-transfer-encoding:
   x-cse-connectionguid:x-cse-msgguid;
  bh=HB+SlFM/oJ6M/YFvB3bNQR4gXUPq98BNBncESdeIh+g=;
  b=e/ssppiCr72a2zY/qJQVytpU9W0DoTa0Fs3Rtl7G8AlXvr7EWub/JL/I
   XFKUumemShgjMyeDli5h0RsX+tzbN9zysrCI4KAUvJJ1SuOUu7fZ1j0cW
   Y8t3bAQUZ9p/s6ppbyio/Tm2qfbjZ1sbDyH4iMmrl/uLqXphANEhSelzf
   gUDuTM/YigWQrmtfNPEhVwZLudNgfEobn/Fta7AmkY5NYQ1AZUu0dGSu3
   eseeaY5PVZ61qqZGSa4ZGyb0Q1Hm7S7dCuruqJW6wN4RYSWZwFKsYrn38
   6KT1CFQ4FSBg6NGQB+1wTmuneDuownNvgpV3zVQWFyjT6VenI+HlKMvVV
   g==;
X-CSE-ConnectionGUID: BS6hePP5QRmkSNqPPWMVrA==
X-CSE-MsgGUID: Q3mrh7YpTqWC4Iug6ytjRQ==
Received: from mail-dl1-f70.google.com ([74.125.82.70])
  by smtpmx6.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 19:24:04 -0700
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137f2083280so5404957c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 19:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1780626244; x=1781231044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TIf9sTw+x6lKIuHB991sq2okHhHs+jRnVDS2tTofi30=;
        b=qOJphIPzSS/Wqx6CyomsEq47+pow43UNhFBD1GXWEx+1Ojkn0/2Q90Qbb3rLo3ECMo
         /9PN1Ha53ehv9qZH+wxoxfUItY+wQcMxAVj3mvrmg5ibH1J3ZMhRF1X81hm2rdG6mQFA
         6VYjNbvXLLr6y1ayzGzSSHGbq6hiSiz8MMIl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780626244; x=1781231044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIf9sTw+x6lKIuHB991sq2okHhHs+jRnVDS2tTofi30=;
        b=me8isKntPmdfjg6OvzEoazLQyDIEDmmQ/at5AQDW/klQy997z2vhvw7+iwYgsRn9zy
         MX4JzDskWbsz4QunLdiHHl8EJzX8POCt2P89KXitYyev/xfphopSuvVNdzGr/B4j5fWF
         +DRdmJrIwndwyNP7op/d1wRKq8lE9JTz17htmBhtdLAoUwChS2iEUoaF076DGruoUhHJ
         ixjhsXO2lJwQRvSlnsezHIuiUtctsLIGujUCzAadpIb2cDHG+dRLXqqAxl71xestyR7q
         OKtEnKXe/FaYv4kEgCPVmCHLLEhFihuOwPyQd3ZjLfr7zq4/U1d64+HZ8S7GGBLe1esy
         xVBw==
X-Forwarded-Encrypted: i=1; AFNElJ/IXACHUU6EtIk4UTuOxLrUTxmZOgV9yrp3oIiRfq2kdSbcsau7yxBAOrtKmN1eh7cjBp6U/eodTTecAxoq5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0cRpw/FG+PdDY8pzJZwodm/7YPfjTGMFSPVvIUBcQSZOXzQ6H
	1vuKElOvFgkj/vNRyk7QsKRWjWppe5egCgumecF78Cq46dDIsoCwlFxczhPZq4H4neLI6cfPcXS
	QZymkKXo6DW/VA59QaHaDDJb2gowSBIm5T93U+8ywXB/wz2P18UuZ3wPRSEOB0TjgAFEwVR9Bc0
	yKPMVFjSY=
X-Gm-Gg: Acq92OEcGtEjxC7SeW0fr6z8XHH2SCH/VwsWlhm2B+UhWyFfkIx/wdmRMV/Nup2tgJ0
	1e0dLIaesLuR/mWSODGpWHnOp8nFY0tlX1kCGZMhTmeDG3nsXO/OurqY4R7QpPq7qp/m24ClgDj
	mg5xvu3CE8ZVZJEZvO/remVAvQwFpjUrRfbB9VkiBAtGsIpDxFT+KbAV7lvseuStyfJQbeKjxLv
	N0l8ECegz75tv/eHWLOpyIBNoz+tu5a+NJAlH3fOZZgThQ1qPLV179MpYj9G9kTMagOgbUDxp63
	H/ZKN9l2AjcC+UxH+wVGqcXy4U6Kkzgc8FzaYPaZMTOkn1QMzELt31FurqTCMxHwOTrzvdj0kn2
	O//CdxfKtBjTIRMmzOjMmwSynICth4gNnKQYBNfwAa96ESANZFeGZictm/Wa3l7zeEBlPzzNwwL
	uBhveXNyQgua6vQfKGNmMSLIwygu+Ad9l0eTXFHp2WTi7P4Tm5QE1V8z1Gt+CYad5v24uOZdIR5
	Ae9KQywiGU8BoLSfNZfPSKaHpg=
X-Received: by 2002:a05:7022:e985:b0:137:ec47:8fd7 with SMTP id a92af1059eb24-138066bd84cmr695738c88.9.1780626244253;
        Thu, 04 Jun 2026 19:24:04 -0700 (PDT)
X-Received: by 2002:a05:7022:e985:b0:137:ec47:8fd7 with SMTP id a92af1059eb24-138066bd84cmr695713c88.9.1780626243789;
        Thu, 04 Jun 2026 19:24:03 -0700 (PDT)
Received: from ucr-secure-48-10-13-243-195.wnet.ucr.edu.net (ftd-border-nat-ucr-secure-v348.ucr.edu. [169.235.95.220])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f549bbefsm5178518c88.4.2026.06.04.19.24.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jun 2026 19:24:03 -0700 (PDT)
Sender: Yuan Tan <ytan089@ucr.edu>
From: Yuan Tan <yuan.tan1@email.ucr.edu>
X-Google-Original-From: Yuan Tan <kentertan12138@outlook.com>
To: ojeda@kernel.org,
	gary@garyguo.net,
	rust-for-linux@vger.kernel.org
Cc: peterz@infradead.org,
	zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	Yuan Tan <ytan089@ucr.edu>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] rust: sync: avoid leaking the lock lifetime from Guard::lock_ref
Date: Thu,  4 Jun 2026 19:24:00 -0700
Message-ID: <20260605022400.31489-1-kentertan12138@outlook.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuan Tan <ytan089@ucr.edu>

Guard::lock_ref() returns the Lock stored in a Guard. Returning that
reference with the guard's internal lifetime lets safe code keep an &Lock
obtained from a shared borrow of the Guard after that borrow ends.

That is unsound for T that is Sync but not Send. Guard is Sync when T is
Sync, so a shared reference to a Guard may be used from another thread.
However, Lock<T, B> is Sync only when T is Send, because a shared &Lock
lets that other thread acquire the lock and obtain mutable access to T.
Leaking an &Lock<T, B> from &Guard would therefore let safe code share a
Lock whose Sync requirements are not met.

Tie the returned reference to the borrow of the Guard instead of the
guard's internal lifetime, so callers cannot keep the &Lock after the Guard
borrow ends. Also require Lock<T, B>: Sync before exposing the lock
reference at all, so Guard<T: Sync + !Send> remains Sync only for accessing
the protected data through the guard, not for sharing the underlying Lock.
Make the guard fields private as well, so crate-local code cannot bypass
the accessor and recover the longer internal lifetime directly.

Fixes: 8f65291dae0e ("rust: sync: Add accessor for the lock behind a given guard")
Cc: stable@vger.kernel.org
Reported-by: Priya Bala Govindasamy <pgovind2@uci.edu>
Reported-by: Dylan Zueck <dzueck@uci.edu>
Signed-off-by: Yuan Tan <ytan089@ucr.edu>
---
 rust/kernel/sync/lock.rs | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..6c4ebe7c6072 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -199,12 +199,14 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
 /// protected by the lock.
 #[must_use = "the lock unlocks immediately when the guard is unused"]
 pub struct Guard<'a, T: ?Sized, B: Backend> {
-    pub(crate) lock: &'a Lock<T, B>,
-    pub(crate) state: B::GuardState,
+    lock: &'a Lock<T, B>,
+    state: B::GuardState,
     _not_send: NotThreadSafe,
 }
 
-// SAFETY: `Guard` is sync when the data protected by the lock is also sync.
+// SAFETY: `Guard` is sync when the data protected by the lock is also sync. The lock reference
+// returned by `lock_ref` cannot outlive the guard borrow, and `lock_ref` is only available when
+// `Lock` itself is `Sync`.
 unsafe impl<T: Sync + ?Sized, B: Backend> Sync for Guard<'_, T, B> {}
 
 impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
@@ -219,7 +221,7 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
     /// # use kernel::{new_spinlock, sync::lock::{Backend, Guard, Lock}};
     /// # use pin_init::stack_pin_init;
     ///
-    /// fn assert_held<T, B: Backend>(guard: &Guard<'_, T, B>, lock: &Lock<T, B>) {
+    /// fn assert_held<T: Send, B: Backend>(guard: &Guard<'_, T, B>, lock: &Lock<T, B>) {
     ///     // Address-equal means the same lock.
     ///     assert!(core::ptr::eq(guard.lock_ref(), lock));
     /// }
@@ -234,7 +236,10 @@ impl<'a, T: ?Sized, B: Backend> Guard<'a, T, B> {
     /// // `g` originates from `l`.
     /// assert_held(&g, &l);
     /// ```
-    pub fn lock_ref(&self) -> &'a Lock<T, B> {
+    pub fn lock_ref(&self) -> &Lock<T, B>
+    where
+        Lock<T, B>: Sync,
+    {
         self.lock
     }
 
-- 
2.43.2

