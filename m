Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E5D2BEFF5
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769185454; cv=none; b=HY5Pqdoy6QTkViu3JbqNmgjCohQnPd76BklkRIHvFEnNXMxA//7ecRtdoaitOn4c9WrtZFoCq9UA88qESOrV7gPP6bgi8drbVdaSjUTiK/6LLXHQZLGW64+HJFlHJo+bDPzr47T523wdqgAovcNPyozOb59MF6DgIsXsTuCHbf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769185454; c=relaxed/simple;
	bh=QcCR6CAiq0FadPOO5YfJmMaLforRVQ62FwYyDpfMM1s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Umd6/0IMVZ+lxAFu0gHzbHRiGmERMAC4nBhhINMnrR+Lmoy2rVwfR5t55PV9cO+vBmHB7DrWnCE4lpCVohz7SMgcF97Z6uDtobPVjmpBhKEL4LwcSqx6VT5JAg51nPNvAI3sDmUwG6crogQxCLHCXWtRZKN3FbSkiu/KSkKBXSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iu40PVHb; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iu40PVHb"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-435a0fb0c9cso2096745f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 08:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769185451; x=1769790251; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OJSn0XRjBL2vBFJzXfObLCxOaT59HpV4z91cAz8rES8=;
        b=iu40PVHbgxKkSuKjXwA0YHzaYh6NyClspgj1QmN6dy1I7K3JjxYkG9FScOl20q2BO4
         XJMzykVvjjW0FqIW9jRbtrkZI9IiB3LzVJA/6QKHAVW1nHFDUyO5BGR2h6JlyIrrvtmb
         0t263khnVuWqtT0STIlEq/mtxN6t32Iy6eOUYmE3c0XZ4Hk2i1to1OLumYOXV6O3V6aH
         mPhokyNFXbyOvgNilH1OQcXiKhPzzZX/qo3ret9qnHSTXcyfkrZf5zHFo9htgyMAjpXM
         cedvMM9E/UMaJLceVSgOZqoqNG191OSZRQqji6EUDjX+KBlMxWoxxx6dbOS3mxrd9n0m
         NKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769185451; x=1769790251;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJSn0XRjBL2vBFJzXfObLCxOaT59HpV4z91cAz8rES8=;
        b=eiLys1vnsugQlkmXQpCUE8n/u3cQBBPYFkkK7b3gxWsfLLBGtAz6wWwu31mYpNKA1S
         j4onUgl/Q2QNoVQmVaiDJeI7ow99m73z47re4DRSBJV7telhnn4tGPg45qVysQLEHJ2p
         YN0EWTJxdB6YdYw257yK3wwDsD11pGVYtMGtty99C/nsuGGczX/mzknlT83RiN1KqCty
         LQE6J8wkEnKyyTYErfvQOsORDSMTsqV63NBCQP3eJD1bGCjM36ZdCjZV9i2D3AvT8OuI
         junjozqHxDy554JqbPSMu8Fkm1LfCdojdgr8XoXqosVniC3971C94pzimio7IC6Il0sC
         ZhTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtuR900eUn4rD7WV8fsmp+cmkOOJocp5c+MECYy9BMQsrhrHolVl8zGc62IVkxPAJ3wOoKgaUI04+Z0FZqlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySON3TYw1feW6w03O/bXUGhewU8ZPukburbxzqGm3nV/FZ5eiS
	+vxpgE9tKY+0oCXVADzcJDFg4ynZDMEY5LRCLgDCXCQjiIRF+z1waRoL+wNKZL0kehyR0/MhHzY
	UtekdU/Bxsvar7jkR0Q==
X-Received: from wrbbn2.prod.google.com ([2002:a05:6000:602:b0:435:95e8:26b6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:4a83:0:b0:435:bbd7:18e4 with SMTP id ffacd0b85a97d-435bbd71a34mr1352288f8f.63.1769185451329;
 Fri, 23 Jan 2026 08:24:11 -0800 (PST)
Date: Fri, 23 Jan 2026 16:23:56 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJygc2kC/x3MQQqDMBAF0KvIrDuQxCKtV5Eu0uSrQ3WUSSkF8
 e4NXb7NO6jABIX65iDDR4psWuEvDaU56gSWXE3Bhc750PJTNMM4LjLpCn3zuhk4zUivwu7qxy7 5+y23kWqxG0b5/vvhcZ4//SMejW4AAAA=
X-Change-Id: 20260123-binder-alignment-more-checks-041f6c198d3a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6723; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=QcCR6CAiq0FadPOO5YfJmMaLforRVQ62FwYyDpfMM1s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpc6ClTd2lbtOIAaHy/jJ7SPc94eNFKpsulv9hb
 9CFFLoDCC+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXOgpQAKCRAEWL7uWMY5
 RoVKEAC0JWjRzPxxpf0vH+4VVShSdajH/dhXQn83H2azvKIZ1y+czZbGnT1+sTBHuq9teXFPddd
 bSPmpMophgUAHxjSSaSj3DKdvay2ufyUSIy+Xy4l3W/87Gg11mOeYU1xc8t5DwMJtkRY5YL7iW0
 to8Im31u5a/wCsKeRfuQ4zd60iXMs15CkTyRgRXhSNEW0z2c/YiFqPtArVIB9vgSNz4XdIDfXMT
 h3UAcKzSm64j21zQVrW6AuLfrHKFxg9POYbjv0CxOsaKKIITthj+wfG9YsfypruAXa7624o499A
 CqpUDaeOkkaj791lnHwEd62frL6T3Qw7Jn4APSyrm+oclFOtuINNYbnOqD8RvffWeA4KaAc03f0
 eHz/HR03TbmfEo70S1O+U1cFN4gMbet+QnB5xhstY/VOrpCC3vsE0XVih9tOi6QW1Evoz/lXHHw
 zNLvbb2XmQK/u+XPS4kLwqjJr6vzqJ/XH7Fga3TXWqv+mxP/PwKhRFKg76C+Pbk9ZMFL2jWbFDQ
 BWVuf4JBHtPlqu5if2bzjwwc1gFYT98aajbK/G4+1f3WrMc7PboQrPb6gxCFL3G3gywJ1hXJo85
 3VwlrgJSgZGmSsh80geez6rB8y7NxAhql1YKjRsJU7C79yzw0v/aS86D0OwwVocJy4Ww7hL45PS kgeFLkfiDkicCJQ==
X-Mailer: b4 0.14.2
Message-ID: <20260123-binder-alignment-more-checks-v1-1-7e1cea77411d@google.com>
Subject: [PATCH] rust_binder: add additional alignment checks
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds some alignment checks to match C Binder more closely. This
causes the driver to reject more transactions. I don't think any of the
transactions in question are harmful, but it's still a bug because it's
the wrong uapi to accept them.

The cases where usize is changed for u64, it will affect only 32-bit
kernels.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs | 50 +++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 14 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 1a8e6fdc0dc42369ee078e720aa02b2554fb7332..bf3de22aaf64ce4aac312b73e1948e2aeb00d5ab 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -39,6 +39,10 @@
     sync::atomic::{AtomicU32, Ordering},
 };
 
+fn is_aligned(value: usize, to: usize) -> bool {
+    value % to == 0
+}
+
 /// Stores the layout of the scatter-gather entries. This is used during the `translate_objects`
 /// call and is discarded when it returns.
 struct ScatterGatherState {
@@ -789,6 +793,10 @@ fn translate_object(
                 let num_fds = usize::try_from(obj.num_fds).map_err(|_| EINVAL)?;
                 let fds_len = num_fds.checked_mul(size_of::<u32>()).ok_or(EINVAL)?;
 
+                if !is_aligned(parent_offset, size_of::<u32>()) {
+                    return Err(EINVAL.into());
+                }
+
                 let info = sg_state.validate_parent_fixup(parent_index, parent_offset, fds_len)?;
                 view.alloc.info_add_fd_reserve(num_fds)?;
 
@@ -803,6 +811,10 @@ fn translate_object(
                     }
                 };
 
+                if !is_aligned(parent_entry.sender_uaddr, size_of::<u32>()) {
+                    return Err(EINVAL.into());
+                }
+
                 parent_entry.fixup_min_offset = info.new_min_offset;
                 parent_entry
                     .pointer_fixups
@@ -820,6 +832,7 @@ fn translate_object(
                     .sender_uaddr
                     .checked_add(parent_offset)
                     .ok_or(EINVAL)?;
+
                 let mut fda_bytes = KVec::new();
                 UserSlice::new(UserPtr::from_addr(fda_uaddr as _), fds_len)
                     .read_all(&mut fda_bytes, GFP_KERNEL)?;
@@ -949,25 +962,30 @@ pub(crate) fn copy_transaction_data(
 
         let data_size = trd.data_size.try_into().map_err(|_| EINVAL)?;
         let aligned_data_size = ptr_align(data_size).ok_or(EINVAL)?;
-        let offsets_size = trd.offsets_size.try_into().map_err(|_| EINVAL)?;
-        let aligned_offsets_size = ptr_align(offsets_size).ok_or(EINVAL)?;
-        let buffers_size = tr.buffers_size.try_into().map_err(|_| EINVAL)?;
-        let aligned_buffers_size = ptr_align(buffers_size).ok_or(EINVAL)?;
+        let offsets_size: usize = trd.offsets_size.try_into().map_err(|_| EINVAL)?;
+        let buffers_size: usize = tr.buffers_size.try_into().map_err(|_| EINVAL)?;
         let aligned_secctx_size = match secctx.as_ref() {
             Some((_offset, ctx)) => ptr_align(ctx.len()).ok_or(EINVAL)?,
             None => 0,
         };
 
+        if !is_aligned(offsets_size, size_of::<u64>()) {
+            return Err(EINVAL.into());
+        }
+        if !is_aligned(buffers_size, size_of::<u64>()) {
+            return Err(EINVAL.into());
+        }
+
         // This guarantees that at least `sizeof(usize)` bytes will be allocated.
         let len = usize::max(
             aligned_data_size
-                .checked_add(aligned_offsets_size)
-                .and_then(|sum| sum.checked_add(aligned_buffers_size))
+                .checked_add(offsets_size)
+                .and_then(|sum| sum.checked_add(buffers_size))
                 .and_then(|sum| sum.checked_add(aligned_secctx_size))
                 .ok_or(ENOMEM)?,
-            size_of::<usize>(),
+            size_of::<u64>(),
         );
-        let secctx_off = aligned_data_size + aligned_offsets_size + aligned_buffers_size;
+        let secctx_off = aligned_data_size + offsets_size + buffers_size;
         let mut alloc =
             match to_process.buffer_alloc(debug_id, len, is_oneway, self.process.task.pid()) {
                 Ok(alloc) => alloc,
@@ -999,13 +1017,13 @@ pub(crate) fn copy_transaction_data(
             }
 
             let offsets_start = aligned_data_size;
-            let offsets_end = aligned_data_size + aligned_offsets_size;
+            let offsets_end = aligned_data_size + offsets_size;
 
             // This state is used for BINDER_TYPE_PTR objects.
             let sg_state = sg_state.insert(ScatterGatherState {
                 unused_buffer_space: UnusedBufferSpace {
                     offset: offsets_end,
-                    limit: len,
+                    limit: offsets_end + buffers_size,
                 },
                 sg_entries: KVec::new(),
                 ancestors: KVec::new(),
@@ -1014,12 +1032,16 @@ pub(crate) fn copy_transaction_data(
             // Traverse the objects specified.
             let mut view = AllocationView::new(&mut alloc, data_size);
             for (index, index_offset) in (offsets_start..offsets_end)
-                .step_by(size_of::<usize>())
+                .step_by(size_of::<u64>())
                 .enumerate()
             {
-                let offset = view.alloc.read(index_offset)?;
+                let offset: usize = view
+                    .alloc
+                    .read::<u64>(index_offset)?
+                    .try_into()
+                    .map_err(|_| EINVAL)?;
 
-                if offset < end_of_previous_object {
+                if offset < end_of_previous_object || !is_aligned(offset, size_of::<u32>()) {
                     pr_warn!("Got transaction with invalid offset.");
                     return Err(EINVAL.into());
                 }
@@ -1051,7 +1073,7 @@ pub(crate) fn copy_transaction_data(
                 }
 
                 // Update the indexes containing objects to clean up.
-                let offset_after_object = index_offset + size_of::<usize>();
+                let offset_after_object = index_offset + size_of::<u64>();
                 view.alloc
                     .set_info_offsets(offsets_start..offset_after_object);
             }

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260123-binder-alignment-more-checks-041f6c198d3a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

