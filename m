Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57234A4835
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 20:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295982; cv=none; b=uAz2j2069ONa6r32bnG4isSeUvTSZPLzCcCszwWhPMIJs9szTHt+UqbZylHcRP27iTOLGbydLO0eTeKHOpst2w7ZfuDRS/3tp42/fZaI4aWyWSW6N1nRpiBCylRgWVCE6ZsXtbEolJrZVvQs828jzY8WgB/xTVuNCu+YYiDfwdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295982; c=relaxed/simple;
	bh=8YxYBVKp4QC6MS58T6jznUoadNYscBAXK9umwSVzAlk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ihixsoJyFb9S3bCZoQaFQsIIuMrrEGxX0/wCZqQE8w83FZiGuWI7yqrNSOlaTnqOY/3Lextzh/n7C00NCsyCV04jFKCwOWu//8g/4u5YNW+J+NP0ouEt+LfqSsE0dbfbKiQW5b/TNDB5nrTiKuOzF2Hn8qfY3MTNljJjBjWwvPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g6jEOv98; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g6jEOv98"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so2287415ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788295980; x=1788900780; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWyWDWfLZFwic6F4ZvVl11QlqA6Vmuy0wQNwElQAh38=;
        b=g6jEOv98s7WACaPPo0Hi3snTyvFMOmljYiq7Q1vAkX/DOnCijmTlfhpyAgksagCWeE
         vnpnk2SPP4r+k+9Jibobb5ApoSfQG/Org1KTLdRJyc1/fR58qXIKBsYO8SwuGnk3VwrT
         twNm5x+q/9KQ4cDmM8ihv0lSkFWZrKSiyGm73BkhykKg7SiK78BGTs6KPuOSVcnVwELV
         g6deda675qu4KpUAk2WZPOZURYXZhCy7QT9oNbVYFLLHj9SVQ2Y6aOjs+Ltl0wLPeCJT
         iNkVAIzDjvJMYxcoifu+UvOZ3OQ4Ma3CBcsRC1Hpsi2cijCI3tJaQelNT86LbnL+bzKf
         S4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295980; x=1788900780;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWyWDWfLZFwic6F4ZvVl11QlqA6Vmuy0wQNwElQAh38=;
        b=Kk7h5d8EmbaijTlP0D9ldQSHS/GVdvbOYnohsOt6+fFOPqaQfjJS+5y8ilb15ddYZE
         au8ICFNxKuIgbrXl6oa14rmk3tJFbpzEKFzI08FRXPY6BFzLPBCl/6R8bZC8PPe/NADI
         snsKFNIPixWJr2HF8l67ZfulvoTLbzeZlZLYJ5KvtmSP6xe31BAi3TKn7f2C7s3573SI
         qw99FEubBgKEgvtUkkiaQJvEcO3AxE6GaOqUjq9tkhWr6Es7J3OrKnxU+Ma8k6gouDQ/
         6SILMCJTR0o3uIzqRg/DnyGIIps4QnSglNXt2vLxFKxugfty4CUkL/yAWT2TGpZYCUtC
         Lldg==
X-Forwarded-Encrypted: i=1; AKwUvByonHsPiNSZh3MSYJs0LoFhx3yoR9NL9Amy8be7rDzKHG1FrDWjNdFgvT9zG4jejAYE95C85KaGRQaf+D+6lg==@vger.kernel.org
X-Gm-Message-State: AFuF++nZYJGfmOhzndXCEbx/qZO1TrrIr56XP0WGZP6hYAE65kQCyOYT
	B/n+HLJMGmGcIPx3fuFmQWDS47I+w0tLY5KJKfUzSQxRD9RcCp9hQvH+hF+Y+Qk98moS1yWKF8S
	4wNDuZjlsy/iu0w==
X-Received: from dyw18.prod.google.com ([2002:a05:7300:8812:b0:328:4817:a473])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:11c8:b0:2d9:26b3:547 with SMTP id d9443c01a7336-2d926b30c76mr207766345ad.20.1788295979822;
 Tue, 01 Sep 2026 13:52:59 -0700 (PDT)
Date: Tue,  1 Sep 2026 20:52:44 +0000
In-Reply-To: <20260901205250.1638304-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901205250.1638304-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901205250.1638304-5-cmllamas@google.com>
Subject: [PATCH v4 4/7] rust_binder: forbid vma splitting
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

Binder does not support splitting its mappings. Allowing so, leads to
potential attacks that stem from a partial munmap(), such as closing the
tail range and replacing it with a new mapping.

Close the loophole by explicitly rejecting vma splitting.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260901163521.1355535-1-cmllamas@google.com?part=2
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder/page_range.rs | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 52ffbf3504e7..d260b009c184 100644
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
+unsafe extern "C" fn binder_vma_may_split(_: *mut bindings::vm_area_struct, _: c_ulong) -> c_int {
+    EINVAL.to_errno()
+}
+
+static BINDER_VM_OPS: AssertSync<bindings::vm_operations_struct> = {
+    let ops = bindings::vm_operations_struct {
+        may_split: Some(binder_vma_may_split),
+        ..pin_init::zeroed()
+    };
+    AssertSync(ops)
+};
 
 // To ensure that we do not accidentally install pages into or zap pages from the wrong vma, we
 // check its vm_ops and private data before using it.
-- 
2.55.0.966.g6673acef38-goog

