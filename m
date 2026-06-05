Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2930A378D8E
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 04:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=169.235.156.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780635007; cv=none; b=JoDSRa5ZKvupG2855whdzXu6M/h/hw4BLdvYx7wZEHSTLFFnkgJRTUE57/yjaAWyaU6VDuF3Ub96tYXvdKcnTZmwsfl84yzd97YPgotNjdyDFnnHHcv7J3CEcxywqIu1trBtv8HzShsqA9qbPNzCwj3Q4pXxf1tK5tnCvd3cC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780635007; c=relaxed/simple;
	bh=BvsfmQZGexTwt31Ke/qD4tBlI8apaQsexRSTnYusyR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UotqNIPScOhEltM/lI+zaNHxY+Wlmz841TG15PZ+aXYic/S5LzkyXuFP/aLF+mG/Xj1FMUOMHUllLITXifrlwgOSUl+tEV1VifH8Jk3vs/EMUOasbpZbw3FBRopQDIWKJP2GUvAk3B0+ObBIvKNYfX6fkmYiZml4t8FmLfF2K2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu; spf=pass smtp.mailfrom=ucr.edu; dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=FZEDHyw3; dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b=BHavKA/4; arc=none smtp.client-ip=169.235.156.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="FZEDHyw3";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="BHavKA/4"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1780635006; x=1812171006;
  h=dkim-signature:x-google-dkim-signature:
   x-forwarded-encrypted:x-gm-message-state:x-gm-gg:from:to:
   cc:subject:date:message-id:x-mailer:in-reply-to:
   references:mime-version:content-transfer-encoding:
   x-cse-connectionguid:x-cse-msgguid;
  bh=BvsfmQZGexTwt31Ke/qD4tBlI8apaQsexRSTnYusyR0=;
  b=FZEDHyw3of4ooFh2Df637We3HIQgRVmzP0igYtq+dubVMoyeic0XR+CC
   zMrpbIlktWLCopNZ9RcHrMW0hLmpvNTcrLqvCjjRcjjqIh2uitvQEkl45
   JGwK7IZ+FpAKAsfv+9cPV/h8WGcXmiRZ21meV5g2vy4SnferdQbsNh19u
   UB5tQwFBLn8IXFOxEG9bW1lKcz+MJ/OsFV3eIP2vexC/xrlyxXLowlTiU
   wWQs2Yoh95cgdg72pUrgtETHWYtyc2xHLDNA/On10WQjoKb7TYbJIJvlT
   mnAgbIPs5j3n1gqedHLAf1ERDS+1yY5X6dWV0gz7mqrlpelOY3eDPX+PE
   w==;
X-CSE-ConnectionGUID: bJEVr4yIQby4S/PqxhjlQQ==
X-CSE-MsgGUID: lWWIJjR6SPuufq5a0cVI5w==
Received: from mail-dy1-f197.google.com ([74.125.82.197])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Jun 2026 21:50:04 -0700
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30762d67a64so2039529eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 21:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1780635004; x=1781239804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNqTnDpUXASOfx5K7wtm+COurinxRQS3wPHTzESWaQo=;
        b=BHavKA/4D8MeSXHIelZgaqUvCIwp1HQ506uv/JqSllorivBEtVXiOuruVaRntXtLil
         zW5JZC8HCP0UHr3qtndDyanlOkKw02GRJOwlCPYR/YZfpIK15ZNMLwdiPSJ1esrUT2rs
         andpRu9GzhvrhRoIrZyxHL0v1vv2aw9+eTA64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780635004; x=1781239804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vNqTnDpUXASOfx5K7wtm+COurinxRQS3wPHTzESWaQo=;
        b=ig60Q+YhXEb1+xdsa1aewJiT0QczdXQkbducGD5Su34YRGtkNQzcBfnKk9FnrY5cCS
         i2zjWigeAKz7oOZKgniwDvsSSs3JlSRCnL6yOhFNqmnynm1fnNc6R8fdXNjty947cypv
         RgcFvwOuhFWkqN7X8AdqGseoxBv1tEjZTPToGQnJXmtmu6qqNH3EzFSOip49MyyIWfZ5
         w+5hbW/A+Y1nWnpfHtBVZwh+dQxzt0m1cQxXa6jL7De/LjYZPKReac2djOXpjNEhsJ4U
         dkEAA0v71nGZdT66EoVpqqaXRPGY1SibS1KRO6HQdK5/3vYThlY1XetjNrNQ1nPkkGyZ
         B6XQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VjR0nUqM9o71lMOprayOEDWYwHd8QreuGzTcUZo+okkC/wpDMEkaglc9SojfspnHGAw7jfxdEIIQ+qgSMag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjiIcYnVy5RMPEAL9vDJgQXn+jSA5fbu9cUdxIEBpiNOJEj0t+
	0cO7Wz7VXq6FFx9lpq0182cAfj7zX3bKCvDTghY5EEuflRaf4RW2KF7SYR/JNIauxXzHQ5+XOF5
	iHIES1cqAESVLaDiXlFRWPo86Zxr2UwOg3C1TRGJ8J8PwhvU1DpE1g8O3oComSGC2nhxeGjuROW
	r/p8WXh2c=
X-Gm-Gg: Acq92OFwtDTWOEqmwvpAuPnnXoEacvJGjIdQ55SuoFQgkGTh3mP+g7OQ6/do+CxvgUz
	atMXhZwxeEDgSNqz2Ss8bWErURuXg6FrbEubAY8RfTeH+/XxTHgMVQpC3VaLlNEfwpa4fc+OTup
	LEeoT8NSt8NziBY/HA2tGBnsjnMrXu2N+MbGr6i3v5+SSiE/2l2QEIce7UVTW4t5LrzULRI7In5
	87Ap1henHS9xgv9YzHNJDIhxIAUpw8g6HxRnSBG2KWIZ2ZZEfUo8EVFHrxde2a+dtK2RlXRDgdm
	oM4iAa9SuRUJVRs1weSEf8LUdK5Liuh/hmwmF3sVF6KSL9iFHOVE10dzS+6FjC/FnosV31VwRag
	DlXXB2EwKYPd6Fk/s9Du65wT2TJsq063Wm+2VTp5x2BJtwQMw2+YddDN1uMCmY/3q5Fdaed/bc8
	xY2lhcYZMjhG3uJ4woPGW6BHHWkrDFPAJEo0Riz/qYqbUnIgqlxy8tidVz1OMfZqYn3RvPuXMrM
	yjfg520DnRc
X-Received: by 2002:a05:7022:111:b0:136:6230:5834 with SMTP id a92af1059eb24-138066fe7a4mr866380c88.31.1780635003597;
        Thu, 04 Jun 2026 21:50:03 -0700 (PDT)
X-Received: by 2002:a05:7022:111:b0:136:6230:5834 with SMTP id a92af1059eb24-138066fe7a4mr866362c88.31.1780635002935;
        Thu, 04 Jun 2026 21:50:02 -0700 (PDT)
Received: from ucr-secure-48-10-13-243-195.wnet.ucr.edu.net (ftd-border-nat-ucr-secure-v348.ucr.edu. [169.235.95.220])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13805ef12bbsm1056181c88.3.2026.06.04.21.50.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 04 Jun 2026 21:50:02 -0700 (PDT)
From: Yuan Tan <ytan089@ucr.edu>
To: a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: zhiyunq@cs.ucr.edu,
	ardalan@uci.edu,
	pgovind2@uci.edu,
	dzueck@uci.edu,
	Yuan Tan <ytan089@ucr.edu>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] rust: block: mq: make GenDisk Send impl sound
Date: Thu,  4 Jun 2026 21:49:56 -0700
Message-ID: <8839ddc5ff54bf454d508cde91d27d00fc3e2dd8.1780633578.git.ytan089@ucr.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780633578.git.ytan089@ucr.edu>
References: <cover.1780633578.git.ytan089@ucr.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GenDisk<T> has a manual Send implementation, but it stores an
Arc<TagSet<T>>. Since Arc<T> is Send only when T is both Send and Sync,
this relies on TagSet<T> being Sync.

TagSet<T> wraps struct blk_mq_tag_set in Opaque, which is based on
UnsafeCell and is therefore not Sync by default. This leaves the GenDisk<T>
Send implementation claiming that GenDisk can be moved across threads even
though one of the values it keeps alive does not satisfy the corresponding
thread-safety requirements.

Fix this by marking TagSet<T> as Send and Sync. TagSet<T> does not expose
safe Rust access to the interior fields of blk_mq_tag_set; the safe Rust
APIs only pass the opaque tag set pointer back to blk-mq, whose queue and
tag mutation paths provide their own locking, RCU, or SRCU synchronization.

Also make GenDisk<T>: Send depend on T::QueueData: Send instead of T: Send.
GenDisk<T> does not own a value of type T, but dropping it reclaims and
drops T::QueueData on the thread that drops the GenDisk.

Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
Cc: stable@vger.kernel.org
Reported-by: Priya Bala Govindasamy <pgovind2@uci.edu>
Reported-by: Dylan Zueck <dzueck@uci.edu>
Signed-off-by: Yuan Tan <ytan089@ucr.edu>
---
 rust/kernel/block/mq/gen_disk.rs |  8 +++++---
 rust/kernel/block/mq/tag_set.rs  | 11 +++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 912cb805caf5..77f9327c0d4d 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -198,9 +198,11 @@ pub struct GenDisk<T: Operations> {
     gendisk: *mut bindings::gendisk,
 }
 
-// SAFETY: `GenDisk` is an owned pointer to a `struct gendisk` and an `Arc` to a
-// `TagSet` It is safe to send this to other threads as long as T is Send.
-unsafe impl<T: Operations + Send> Send for GenDisk<T> {}
+// SAFETY: `GenDisk` owns a `struct gendisk` and keeps the associated `TagSet`
+// alive via the `Arc`; it does not own a value of type `T`. If a `GenDisk` is
+// dropped on another thread, `Drop::drop` reclaims `T::QueueData`, so
+// `T::QueueData` must be `Send`.
+unsafe impl<T: Operations> Send for GenDisk<T> where T::QueueData: Send {}
 
 impl<T: Operations> Drop for GenDisk<T> {
     fn drop(&mut self) {
diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_set.rs
index dae9df408a86..2051f4305e6b 100644
--- a/rust/kernel/block/mq/tag_set.rs
+++ b/rust/kernel/block/mq/tag_set.rs
@@ -31,6 +31,17 @@ pub struct TagSet<T: Operations> {
     _p: PhantomData<T>,
 }
 
+// SAFETY: `TagSet` does not own a value of type `T`; `T` is only used to
+// select the blk-mq operations vtable. The wrapped `struct blk_mq_tag_set` is
+// only exposed to Rust as an opaque handle, and concurrent access to it is
+// synchronized by the blk-mq core.
+unsafe impl<T: Operations> Send for TagSet<T> {}
+
+// SAFETY: `TagSet` does not provide safe access to the interior of the wrapped
+// `struct blk_mq_tag_set`; concurrent access to it is synchronized by the
+// blk-mq core.
+unsafe impl<T: Operations> Sync for TagSet<T> {}
+
 impl<T: Operations> TagSet<T> {
     /// Try to create a new tag set
     pub fn new(
-- 
2.43.2

