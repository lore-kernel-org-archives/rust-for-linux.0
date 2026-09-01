Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F16C48422E
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280534; cv=none; b=SOH8myuBB76dzaegA/ObPgbqsZgHw5UAV5J3qKoM3bO41sy8pueva9eLl8PqlaDlAWCzG4sxF/GcMxH1FSeOo04AiBsB/vTuN+MnZ2tdK7FPDGp4KIaKkz5vC2hrNiPE30c5SEn6qMysiQqxdrGA7daozk+wFCkbZh6UtVJU4eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280534; c=relaxed/simple;
	bh=xMfXa4JJaYVx9CY7Y6p7EK/bnTHLTV7vxrHNWHGqnw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L7g49fggVDUaJJ+NGUecdKvajTKTwmLaRCkF6EV3iYTzmBBJ/EitQ3qCy7rkbWHWfiSROjmQ+qm2ImMpFH1tsNtQojcwVo1txQ0m1yQ8cV8AW6KjthnJw5NesHMmW3nnYSdnHKq7olcgaBZqbxEDtEPWl5mkAkBxj3xf2ty7Nhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D5afQhUS; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D5afQhUS"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so4261a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 09:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788280532; x=1788885332; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLMvfa5EimRkqQR6s886FTBUek6ludb5m9DiCXoQ59o=;
        b=D5afQhUSM5tSEqF5VeLaVVdHPhn14vTgeoQDIGVf9cY3mo1+mcw6SfROFMsNxsOYNi
         igXoHhQwYCb5+CngqmaFqmjtueUcHtZ7S0EcnvFUXBJelYkYu0vAhX29RRSEn4rV/iWS
         3OSedlfAxJth/HgvP6dDshYQEhWaDAVPuFETkdIFv588O39+bn0aXXm1Ug2tME2K+Kkp
         TaUvb+Kaf37A3RDW9MntKAW2hQpCRSoirwiV4djgVS9Dk3wMktCTO/4tjsIXvIq14lni
         eeyEImBp3F2yteBP+FUgw127Za6tSQTnEHxVVHAV9QvoZZaItk5N9NNWZTg1UDNAmJWz
         A+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280532; x=1788885332;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLMvfa5EimRkqQR6s886FTBUek6ludb5m9DiCXoQ59o=;
        b=jdeMp1pHNjxpvo24CDLMQHfYtD85vNswHpTgP8kOOTDcIxLGxEL3dZYAK93zvmQGP1
         MpUgqB3AyQ/scnE13HMP36rTHRGRZ6FNqBY9IJ0CotHa8R324uUWEqJKGb2zM5P4CY0m
         +OXynDA1rLMxtK/MH/4YZ2RdEGu13nOmcvpR97B4/ALSQ9A5Oe6cjeql70bcgX3WrYOW
         Yd12AK36TniwRPnR5Qy5w8dln53ezii5TDEYCRn2PsNXVAoy18NanhdnKYFTwAuOoK+U
         yZJH3r0I88qllymKaRTCw3drmnutr5VaSWw6xOSexQZgIXWVn2og3E1esg3cLRWPvaIr
         MR7A==
X-Forwarded-Encrypted: i=1; AKwUvBxj9IkPwIS+R54kIa5Yi5k71E0NPGBnInyZ6KUWbwQVHP0FFdIDI0ZAVeI2qsNogzveWKNNN+1Joy8Z5LbsxA==@vger.kernel.org
X-Gm-Message-State: AFuF++mqf7bJcMKQueY+hgUaLUxextBIZIdh3RlMrUaiWWSVuUKNE5Sf
	3lUKnkQNmbY/RhIE/HPGkUjAwpEOwMfwgNNGWFNyug0Yth7Sk6i5cuciB4+Ns1PBdwrHQoSguwu
	KARkPyJIdk4GNqQ==
X-Received: from dycna14.prod.google.com ([2002:a05:7300:ea8e:b0:328:665b:a9ce])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d407:b0:398:e73e:5a13 with SMTP id 98e67ed59e1d1-39907bbe00cmr15099714a91.9.1788280531343;
 Tue, 01 Sep 2026 09:35:31 -0700 (PDT)
Date: Tue,  1 Sep 2026 16:35:18 +0000
In-Reply-To: <20260901163521.1355535-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901163521.1355535-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901163521.1355535-6-cmllamas@google.com>
Subject: [PATCH v3 5/5] rust_binder: reject mremap()
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
2.55.0.966.g6673acef38-goog

