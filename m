Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A001519B4
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 00:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781137967; cv=none; b=hLVFt2YfOy7duQsWcU00m5YMq+745fKlRM8OAOSK09KpvTTIwAUbb8ZYf4vaM5ZVPlZqDsjHCA3JoXi95w5s2oOUERyaLZ0Dd67jsqdkNySY/z3XPPFd9eDaNKRr1fOHG1yx4H+c3ZBhTbbrTGJpqa1fGx2c4QQzJLcGYHSHtiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781137967; c=relaxed/simple;
	bh=S1tHIvOieTU4j9LzjzSL3pWXo6mgEStorgewiv2OtHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WZ3MGtcEbaV9AXdDIbRMe98QNqAd8OANAP3/9noqf+LrbAyU+igKlD9iNrhlU7eC1s1ePVQy9/GIh9led+JnqR/1NSrbWqyKLx49GJm65VIvo8j/vCKkdgYexIjxJ6MVTJj6CAWF+AsXz2rE6hCvhWRR6IsjhMUftZYfybsozT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf+JxGEF; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf+JxGEF"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-137dd3af345so6929579c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 17:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781137965; x=1781742765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ToIQfCnhhxhc6DD1qH3fv/EmwmlVtSC2+ooZgMKNohQ=;
        b=Mf+JxGEFIKFNCjg6fNlaCBusZ3U+nCRIzmTR+Yoe+Oa860cIhjKz2cGgSIEXTrk4s0
         R78Sq3AKL0f9YAh2DiPUr4PhTLLwUM1MF5MI1qoMPHXS4yVFN6cw9Z/DgObqJ0QauMjc
         rDKzpRexKDpDhimf4WUDBQEl1Yd8thOHPyWo+wHbWJ1OXxr8PKlyL0ESMw7TOf6lh07n
         lGdrlUS2650MOmJLJMVBHSQnKeuzCIPFEyNwrnaX0OGpn0Tq/y/zY3pVIvwAk+jivrUw
         OAbtjVXoJSoaLXkFuNMrHs0rZVo/eBa2+Ti9TRVSisOP7PneuNmo6illE6IScc8gcQBw
         jAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781137965; x=1781742765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToIQfCnhhxhc6DD1qH3fv/EmwmlVtSC2+ooZgMKNohQ=;
        b=HyKOOBDsNRgYydJhRZMfs7/qcbnjnk2okbzzCJRmrhYVY0E1PLTVdBDimmSEYu0UlC
         isgqGz+xxCDBieIhu7vSAxH1r7yeJiavL1hwDHeS9gtBcafi39QCCQ7CP4ILBIoRRkzq
         dl9RFUexhd9M5PcyrTdwjm/A/HlQ1GB6h8tpf3XoGd0pIxwy6gNmyIAEkIOGsTZoukgF
         WpZjXIl86oD+z9COoURcXgM1QGkqUXBYyUupUqA9tV8qMlYcodn1Mg2/XqaD+huHktle
         Z6HjlUltt8IDmNe5E6WrCP2H+R52BT269YyZGi9m9ouBRW+P8Mv/pX7vmWgPc4mggmbp
         s1jQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LElRxu2+lhFlCHNUfe6ubfIT2gzedV3h+0qgylh6kLdGowckPY/fBtQCdJIs6FD3F1M+HewXgdrPS1WETtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydL4s7WEt0D0TEgK+0rZFrTBnSg/KV+kFNdngB8+ONGh/bnmkf
	D1Kc2nAU5es3l/crU4dEIali4KE8E7xQyCVPyEIGUDODzAJJf60Pqt51
X-Gm-Gg: Acq92OEE5IIFCeMrFGEUnVgfqhPHsbf50fqEfu93hz30nQFHSNYNwyGjtP5ZaF+wZYt
	f7V2amHJ5yb1zZAOh6EII96+8VJIwQaVHpy2T9kVcQIiNNHbFNfrUamm0HLk+HYO2hDaJH1J1dm
	dSsLrYoac+WMWw+QPmp2Q7rt+G1qwtNXNerAkfU2He9lx+uVPjjFeAGpTAeTUNV1OD4W2oU0524
	NSxtG3vUvLmEig8bwt+8FaDUcTUYRIG1xn2DC8MAumNIk8S/F3Q37i6CT1TpWNizIH82P8iinsE
	Mnuc0fvFOEj8VZkXcSzbCnE7jeSZKhe5ciAeIc2VBGP/BEUqj2emJYCYuQg8irDvN9Asdi5kzV2
	+TamqfLc9eVc2XnOD9GJ2c7uED0SgFRJqbQKrdM/Q5jZ+WgIXDNizS2HMG8WGrF3PZ+EBvpm99b
	ycfmEdpnY2Oo2bfX+Ua5/iiLdx4w==
X-Received: by 2002:a05:7022:3d86:b0:138:62a:270e with SMTP id a92af1059eb24-138421396afmr356720c88.11.1781137964641;
        Wed, 10 Jun 2026 17:32:44 -0700 (PDT)
Received: from homebox ([66.75.253.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13842ed1ccdsm208047c88.0.2026.06.10.17.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 17:32:44 -0700 (PDT)
From: Yuan Tan <yuantan098@gmail.com>
To: a.hindborg@kernel.org
Cc: boqun@kernel.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	yuantan098@gmail.com,
	Yuan Tan <ytan089@ucr.edu>
Subject: [PATCH v3] block: rust: fix `Send` bound for `GenDisk`
Date: Wed, 10 Jun 2026 17:32:20 -0700
Message-ID: <20260611003220.3512652-1-yuantan098@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuan Tan <ytan089@ucr.edu>

The `Send` implementation for `GenDisk<T>` was conditioned on `T: Send`.
This constrains the wrong type. `T` is the `Operations` implementation,
which is typically a zero-sized marker type that carries no data, so `T:
Send` says nothing about whether the data a `GenDisk` actually owns can be
moved to another thread.

A `GenDisk<T>` owns the queue data `T::QueueData` (stored as the
`gendisk`'s `queuedata` and dropped when the `GenDisk` is dropped) and an
`Arc<TagSet<T>>`. These are the values transferred when a `GenDisk` is sent
across a thread boundary, so the `Send` bound must constrain exactly them.
Bound `T::QueueData: Send` and `Arc<TagSet<T>>: Send` instead.

Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
Reported-by: Priya Bala Govindasamy <pgovind2@uci.edu>
Reported-by: Dylan Zueck <dzueck@uci.edu>
Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Yuan Tan <ytan089@ucr.edu>
---

Changes in v3:
  - Add Priya and Dylan's names to the `Reported-by` tags
Link to v2:
  - https://lore.kernel.org/all/20260609-rnull-v6-19-rc5-send-v2-1-82c7404542e2@kernel.org/
Link to v1:
  - https://lore.kernel.org/all/cover.1780633578.git.ytan089@ucr.edu/

I am a bit unsure how to handle this v3.

The change in this v3 is adding the missing trailers.
Andreas' v2 already addresses the TagSet issue from my v1, and his commit
message is also more appropriate. Therefore this v3 has no changes other
than the trailers.

I am not sure whether it is appropriate for me to take Andreas' patch and
only adjust the trailers. Please correct me, and my apologies if this is
not the right way to handle it.

 rust/kernel/block/mq/gen_disk.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 912cb805caf5..b36d24382cc3 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -199,8 +199,14 @@ pub struct GenDisk<T: Operations> {
 }
 
 // SAFETY: `GenDisk` is an owned pointer to a `struct gendisk` and an `Arc` to a
-// `TagSet` It is safe to send this to other threads as long as T is Send.
-unsafe impl<T: Operations + Send> Send for GenDisk<T> {}
+// `TagSet`. It is safe to send this to other threads as long as these two are `Send`.
+unsafe impl<T> Send for GenDisk<T>
+where
+    T: Operations,
+    T::QueueData: Send,
+    Arc<TagSet<T>>: Send,
+{
+}
 
 impl<T: Operations> Drop for GenDisk<T> {
     fn drop(&mut self) {
-- 
2.43.2

