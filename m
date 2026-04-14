Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA63E51EF
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168184; cv=none; b=G6d0MpkUamrOw26J7RMMLhZVjZiPJ1+0FiHeqiJdh+87YxvmfHL4Iaw449GZPJsp73U6a0wpgXxOWZz7X7BL6IyvCZSq37ijwxzNN5/Z+65XNMK3Eh10RjPLPIJJ/doCcYRE3DzqMK0WtoFJBugB1pI7D4XZ5/Mip2FJAl1tMcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168184; c=relaxed/simple;
	bh=4FJaKiDGEMaWTC+kGIkRYx5ITQdW3TsTYR6GPTTfO3o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BJ3OqIkR0Y/aeHX6F+2gZJuhstl6STFGda0PmlQjLlGTPOoIcNuZyFI5gXTrNRE+jfEhF6AZaZAxwldVpiGTR2k08fLJYPW8raHYj60UMNqPFkK8AV2FFPPn38sxpITzRl6DjyESm/JKZTloVbSkrugpL4QthMxYBgOBvtmq/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fUItfXgH; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fUItfXgH"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-488c0120047so36170615e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 05:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776168181; x=1776772981; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ViJTQch/9jQH94tFT6FX8S/Yb3DKA2t1jUpmBog0UEo=;
        b=fUItfXgH/lOUqmZElzuq+DXbX4xi9Gm2ESPq5JicbGUsOyzvicotKsXaD1TdfJ+c5M
         Y0PhUtFIrD22rn1Kv4dNue5e91fQu9w2SXsVvbzt9M5kmmcZcJ3uc3F3QYC4vBQljZHw
         V14STHelQEkFZYOhXjEPXfzkll0zcUt2rTo9GHdgupmi5P6Xni/kkkYmZ+G6Qpqh3d1Y
         NtN/lBEbRGu9RWqSR0sFsiuqsrkGrIHEnsQced+3waaII3LvHVYVGC79olmXHA503Ih1
         XwYgOu5sVnpHv17+usGBTEvUU6Wrmn9Mft/lDNM4UrSBOXvK4Qph5wGeCE3NQJOSaPnr
         IjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776168181; x=1776772981;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViJTQch/9jQH94tFT6FX8S/Yb3DKA2t1jUpmBog0UEo=;
        b=CC4sSWFGZSPRIPEO1yglzbBVyw3Z8lESz0O2NXfXOOV2wdvOzxQJjm6Dk4Tu+CWXK7
         Ycx8Fxri2EDAmusI5itf2BmgvLIv+XldVVktyqFMO9vLUtvsFAOmzm2NckMm8fsI9ity
         RgWT5yOWecuSXAuVoO6+7AW8sLPQQVT3Xui/B9wl1IqZQ/trJ9v/gJTiCP4RkYE93Gka
         VssMWfrFdzNEfFy/+yDgVEwlKRANMdpz+XiRvZxRFI5NRBeTSIdRE4ox/4wH6ZhlG+6S
         wwtMNHEBtue7VCJyk1DM8/xU5zzyJK75UZ9GKo/7qJJu5CUQ12BjF0ePCiIawA+XbCJe
         hq1w==
X-Forwarded-Encrypted: i=1; AFNElJ/Nwy0fMO/PuytWBWQ4hHMG1ebXQviUVJVHrtXY5KikhqxKomUMicZGdyBQp4b/0Xw5nYVZ1L1TT4XmTZJSqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwR6WiASXlpY/RFycwZw9LK/g+YH0x0F8oBiBHv2pneePFuNi
	wRRCMjF0SrjCgdLjdM7c7tIBG53Gj1zaujb9rqi128fr/rdV7K1lIZiIoOkrtqvEuWsWW6wzWeM
	pmB0r8B1RIWTnuIFDrw==
X-Received: from wmbf15.prod.google.com ([2002:a05:600c:594f:b0:485:3bc4:b1d6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:890e:b0:485:3dfc:569 with SMTP id 5b1f17b1804b1-488d683665dmr155625785e9.16.1776168180510;
 Tue, 14 Apr 2026 05:03:00 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:02:34 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANos3mkC/x2MQQqAIBAAvxJ7bqEVieor0UF0rb1YqIUQ/j3pO
 AMzLySOwgmW7oXIjyQ5QwPqO7CHCTujuMagBjUOmjRmj/flTGbMJaCXgpNlP5NxjshC667ITf/ Pdav1A09FHydjAAAA
X-Change-Id: 20260414-tf-update-txn-fix-8cef91add11c
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4032; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4FJaKiDGEMaWTC+kGIkRYx5ITQdW3TsTYR6GPTTfO3o=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp3izeh3ygB4/Esd+KGZxj3BG+j0VZqmavvd1Oo
 LeaAjQcVAyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCad4s3gAKCRAEWL7uWMY5
 Rj+iD/0V2xBomDP/96mnE/wIgrtRPU7rCZ0OguZ5/g/Q5kEHFauLPoXC+w65UfIbEetdGnxnEvk
 VJyBRfblPg14DPrnJq35LhWKCpXvwuLR/asozyQTpchumJj9P8hHpsv/Sn6Dw+tfSasZfJZmfCl
 W91a+uUzz/QbhWl2jN4u5zgE6CT6eDFTV3eqtwb930Ev06HZzXGJSj6Va+D+I6dpKnA7sgVguaa
 C4opDV01cgMRPGB/WmmNgi4xOYwd1a713jfN6uaWdF2PNOagI3EVrYmaB1mkfTtTvLXUatn+/3h
 Y+OegM5PGE5FrMd/SMRDdCTBXCDxcf+pWUkQTeon42478V110QvJrkBRJmky+ybjN4QqkJ3EekE
 794ZUHUQt1Skk3n6sEmX9Lh4yjFBSShNcVWIisGG3xMHSujHlCvfhO1aC70LvkpshTtFl9K2S3B
 KLBYDtvLmPGiX+QDoPqRrpgUOYJQuTbublfp75QEh85qIJbZsKfGxpK+H0xa/Nz9WV7hIu2rFXY
 S7ZVdQGj2cdUqXyEHwg5toCGbKE7pil2g/0KqCEI/MfsmsbdQQDxfdQ74jq9qOIUWupasZe9bH6
 BeYytofu8NvwIwJ4jVbQSnw5OdhjVLdcDNh37mI6V+XpmS7w8qdev7LWDYR7NtttW6uSWhvsNmy PBz2XqTStvpl+4w==
X-Mailer: b4 0.14.3
Message-ID: <20260414-tf-update-txn-fix-v1-1-d2b83303acc9@google.com>
Subject: [PATCH] rust_binder: avoid calling pending_oneway_finished() on TF_UPDATE_TXN
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

When an outdated transaction is removed from `oneway_todo` due to
`TF_UPDATE_TXN`, its `Allocation` is dropped. The current implementation
of `Allocation::drop` calls `pending_oneway_finished()`, assuming the
transaction was executed. This leads to premature execution of the next
queued one-way transaction.

Fix this by taking the `oneway_node` from the `Allocation` of the
outdated transaction before it is dropped. This prevents
`Allocation::drop` from signaling completion.

We do not call `take_oneway_node()` from `Transaction::cancel` because
it's actually correct to call `pending_oneway_finished()` on cancel if
the transaction did not come from `oneway_todo`. This ensures that if
`BINDER_THREAD_EXIT` is invoked and cancels a oneway transaction, then
the next transaction is taken from `oneway_todo`.

This bug does not lead to any issues in the kernel, but may lead to
Binder delivering transactions to userspace earlier than userspace
expected to receive them.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Assisted-by: Antigravity:gemini
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/allocation.rs  |  8 ++++++++
 drivers/android/binder/transaction.rs | 11 ++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 0cab959e4b7e..b7b05e72970a 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -157,6 +157,14 @@ pub(crate) fn set_info_target_node(&mut self, target_node: NodeRef) {
         self.get_or_init_info().target_node = Some(target_node);
     }
 
+    pub(crate) fn take_oneway_node(&mut self) -> Option<DArc<Node>> {
+        if let Some(info) = self.allocation_info.as_mut() {
+            info.oneway_node.take()
+        } else {
+            None
+        }
+    }
+
     /// Reserve enough space to push at least `num_fds` fds.
     pub(crate) fn info_add_fd_reserve(&mut self, num_fds: usize) -> Result {
         self.get_or_init_info()
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 47d5e4d88b07..1d9b66920a21 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -270,7 +270,8 @@ fn drop_outstanding_txn(&self) {
     /// Not used for replies.
     pub(crate) fn submit(self: DLArc<Self>, info: &mut TransactionInfo) -> BinderResult {
         // Defined before `process_inner` so that the destructor runs after releasing the lock.
-        let mut _t_outdated;
+        let _t_outdated;
+        let _oneway_node;
 
         let oneway = self.flags & TF_ONE_WAY != 0;
         let process = self.to.clone();
@@ -287,6 +288,14 @@ pub(crate) fn submit(self: DLArc<Self>, info: &mut TransactionInfo) -> BinderRes
                         if let Some(t_outdated) =
                             target_node.take_outdated_transaction(&self, &mut process_inner)
                         {
+                            let mut alloc_guard = t_outdated.allocation.lock();
+                            if let Some(alloc) = (*alloc_guard).as_mut() {
+                                // Take the oneway node to prevent `Allocation::drop` from calling
+                                // `pending_oneway_finished()`, which would be incorrect as this
+                                // transaction is not being submitted.
+                                _oneway_node = alloc.take_oneway_node();
+                            }
+                            drop(alloc_guard);
                             // Save the transaction to be dropped after locks are released.
                             _t_outdated = t_outdated;
                         }

---
base-commit: 0990a71f678aa0f045f2c126b39b6b581844d3b0
change-id: 20260414-tf-update-txn-fix-8cef91add11c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

