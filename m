Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0F3C0637
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216115; cv=none; b=Bk1ToqZahmYh82GPTrIA85jDijOrLDwxOo7OEoBkwi0xxDVrG65eWz/QDDX/97Lk9wVkmloKP3aLz3BN0qOgQPwip+mtdvilyVOQvYpBSZZxtRCBhFN7P0WACjY/m4nLs3YsH9+GKn2+Wljfyo/Hyt6Qj05mu0uARStErchmrcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216115; c=relaxed/simple;
	bh=8KcSgffxAkB1OeS3/kdkp5OoiPWVBES6SdR64YQAb54=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oet7+NKxtGHYmhtld85SE8YMOHfP3jFzhFf6QGiYtdmy31Mnd06lADBdOvHJkS1K6/rNvX1LOGRjPDk8ibu1av9oEeGhefE3mZnRvePYhsIjQi2OWK1ts9hQlfeH7SUKcOX7mNPzA3mk3UKG6iLFJKtIrPvfV0BqkcOdA1nMulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jiyY/yvL; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jiyY/yvL"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d292eac1so3822055a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 15:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788216114; x=1788820914; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgNVfGlbCEyq8MC5JaRKbxi7I9+N7W9TiHIhv9t8nRg=;
        b=jiyY/yvLq8zk3oUJC3zOdbHSqm+FdrxR+ukT4OdfNd4xjG2FVzB9p+g8DlkulPIlHS
         1wWWSJrIVCtWjVx7aCU5SXaR7Kf/7fTFuUpd2oL5/uf4ZDlAN2zoa51mxfcLoK89YcKF
         s5dRicloBc8VOfGf18dofHObNKoN/1F4vAijTWQXvIsw2UpD1kBGEfCEH8QB/qW62mt/
         ywhWb46RhSkUQDFHl6mpHYJ0rBmFhMULbpo46T4i7rzc8Bm66bLha2ZWUn+pvccsl6Mv
         pHFf5zWtEqKiyeHtYMSm/hd2RPxkkFmBAyiT6/C1n1f+ho0VBTL40k+7MRQ9B/VVpNG7
         1+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216114; x=1788820914;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgNVfGlbCEyq8MC5JaRKbxi7I9+N7W9TiHIhv9t8nRg=;
        b=riogn3HzJpvPtiQ3iNA4nZgMiEmwdgL/yltF/u7XJxJUlhSPuLHWFBN1tNdH1+uOvf
         NW/L3N1qmsI26DYE3Zrwrqma2KdQte+MALfDWh+4MHe9t5S6+j9Jr2PAFZTF8h38O15t
         dbzltnq/GsnCVHef0jM2kNsrzxGpGY6Jm+Qv+2vfVTMsRRXV2KOfxoiIHpv//R6gOyl4
         KiEKiCYadb2VLr5JdWwPZCQcKfnBDAlhAT0PHFSg1WXTDt/PE2ewS0ko/mrAAdyRw6gu
         r2hr/mE1cxL6hq/WDjjNK6umrPMObL+zL/7yBtg5kwcHDYWa0wKiX6VxUpTImV/4UrqK
         34DQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7qExdBx0YierLq+SKZTBZVADIumNl2ZVCDij28HGSAFH6Ul8piDtjhQRLbht6dSpHir1cxOnzWqj8c6NxBQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m96bH5gEY3ac+go7bHkXUx2W+yFZEtg9WDzsng6XgxgAGdwuq5
	5AUrFBAH2QPq5mF78/f0wh+3RMojURcuPv9oJ2rpl35fYZyUKX1lZSZl9+LSM0eGKJQsRnHsy6d
	5hP9qzJ+mWFR0aw==
X-Received: from dybgt40.prod.google.com ([2002:a05:7301:2228:b0:327:adfa:8682])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4cd2:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39907d0970fmr5248962a91.10.1788216113543;
 Mon, 31 Aug 2026 15:41:53 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:41:43 +0000
In-Reply-To: <20260831224145.169403-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260831224145.169403-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260831224145.169403-2-cmllamas@google.com>
Subject: [PATCH 2/2] rust_binder: reject mremap()
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

