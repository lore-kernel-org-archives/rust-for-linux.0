Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF4411A1B
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 03:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231874; cv=none; b=b1oypoMVUnvP4ZfhUXhpF4MdrhpbzWKqP5IcEdVZtsd0OPoz4+uh8hEgH/stVw6hx3qI/+4ME+ffXYSFdOV9mdUAK3Gpds8qpUHn5YLSFY2/pnC2rieDzan73ewrlcq/MlZQ8Se+RqpyyRfve0Hql8q2CQp14gdy/g1a852vcDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231874; c=relaxed/simple;
	bh=8KcSgffxAkB1OeS3/kdkp5OoiPWVBES6SdR64YQAb54=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CaN5iKbI/30Y0i5myncVKlVAwe9y0PCkkOGTiKiWCVFhyktf2k23jj+1nb+yHQR+mLIgQfV52HZMrrm83cE0akzPkA7ySX6rIC3gffuRqEQputAZ9Jw48FyQB9jP3yAXO54tzlCOV95Fe6+0q52tk3qzzrIv5ZwgnA1Zol6rpog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s8Y436D5; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s8Y436D5"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso5999788a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 20:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788231869; x=1788836669; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgNVfGlbCEyq8MC5JaRKbxi7I9+N7W9TiHIhv9t8nRg=;
        b=s8Y436D5DrAn6S4iama2Vq3ITv2A86+qPIGZlFc6tQf/O3fyDbdYNTNd6O0w0hi5nk
         +mY+04o4xQM/PFjhF2KusvPSmPdi2rlwnA2l7AGPLnGKK00955RuN7pZT0zFZSZu4iG0
         JY4gmE+j7Q/oSypTYXKqWBNebBMM5LorMjmHaxqXZT3NHFw356CJl9K3W6Iq/SQ2NkIh
         TQSjVoT1vBy9+0XGCre3QVVGm+3hTZN7X/o3e87nVg4eghfLqIDmNBxWsH7+tYQ9RYbF
         2kQQImkBTxdcUIrUZEEVAd2AMhF7+RNBdZYfNDPl8krUUooCAObn5FpEtmxmdez2QBKb
         3Ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231869; x=1788836669;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgNVfGlbCEyq8MC5JaRKbxi7I9+N7W9TiHIhv9t8nRg=;
        b=dKNjvzzf2hbIWS08YwBD0chOBfZMeWitNLDz53OGBQK84GqcWvTy3WZ11GIuAn7S1b
         uT5/IoyIwDTG7cGu/1aYxyVJoSsUU/oD+wVpIzKkk4z/JPI+cmGIsiue6X9l9lwHypJ/
         sU4Py8NY/KwmdYb5NWEDRsRmGnjvzYoo5xi491G0V6bzZkmm3jUAg+Pf8i5MuPV9OhKl
         TyCY1qE5Dpu6dvOgdNTd7m/eTRrsCB0NIQha3NYN0UkFD0u568W00EQ6oMFkMGHoxx4Y
         RorbGYr3EGq0aTyBJ07jfcTQNN7aL9WVGTrGozuuuDJEWoZbSgmcum+VmEcKVaXGOPyG
         kgMg==
X-Forwarded-Encrypted: i=1; AKwUvBxuONzJn+sn1/8FJaRProiTylb1RR0imNGOzM3+NEx4FbETzEE8+Ltc5In+ZJ2NOhtrqeasQqt79RxJVJu4pA==@vger.kernel.org
X-Gm-Message-State: AFuF++lPQOfL+dz/LOA3g5zikYYxlkqJTJn3Gqiby9t0qiht9FLv3DYP
	1R4cUtf7Fnt3ZA5ssFXwaNwob+xAtBFd7kjbhG5QGpVnk1mTRM2na9eQUJq9tj4fhr982FCIGpg
	kQghCW3X4ioC5gQ==
X-Received: from dycev8.prod.google.com ([2002:a05:7301:d588:b0:328:5a01:ea69])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d887:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-3989c0c7fdcmr33560585a91.24.1788231868274;
 Mon, 31 Aug 2026 20:04:28 -0700 (PDT)
Date: Tue,  1 Sep 2026 03:04:16 +0000
In-Reply-To: <20260901030419.470246-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901030419.470246-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901030419.470246-6-cmllamas@google.com>
Subject: [PATCH v2 5/5] rust_binder: reject mremap()
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, 
	"open list:RUST [PIN-INIT]:Keyword:bpin-initb|pin_initb|PinInit" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Binder does not support mremap() as it caches the mapping address in
Inner::vma_addr. Moving the mapping breaks the IPC communication for the
process and can temporarily leak pages during a shrinker reclaim.

Fix this by explicitly rejecting the .mremap() operation.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb%40google.com?part=2
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder/page_range.rs | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 52ffbf3504e7..411efcc2116f 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -24,7 +24,7 @@
 use kernel::{
     bindings,
     error::Result,
-    ffi::{c_ulong, c_void},
+    ffi::{c_int, c_ulong, c_void},
     mm::{virt, Mm, MmWithUser},
     new_mutex, new_spinlock,
     page::{Page, PAGE_SHIFT, PAGE_SIZE},
@@ -144,8 +144,17 @@ pub(crate) struct ShrinkablePageRange {
     _pin: PhantomPinned,
 }
 
-// We do not define any ops. For now, used only to check identity of vmas.
-static BINDER_VM_OPS: AssertSync<bindings::vm_operations_struct> = AssertSync(pin_init::zeroed());
+unsafe extern "C" fn binder_mremap(_: *mut bindings::vm_area_struct) -> c_int {
+    EINVAL.to_errno()
+}
+
+static BINDER_VM_OPS: AssertSync<bindings::vm_operations_struct> = {
+    let ops = bindings::vm_operations_struct {
+        mremap: Some(binder_mremap),
+        ..pin_init::zeroed()
+    };
+    AssertSync(ops)
+};
 
 // To ensure that we do not accidentally install pages into or zap pages from the wrong vma, we
 // check its vm_ops and private data before using it.
-- 
2.55.0.897.gb25b4bd76c-goog

