Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8BE3019BA
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 04:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774154650; cv=none; b=qt77MHgN48gGm+7c6cw7Hvet7o7McvCwDPmywqX9kB+LNqfRGXt0oFQinCB7MOVbmh3VFiqA0O0I/e9jzq7sONfU0f5y0QmMZ2dQ1CjXVOp9WCRVjTfnWGW6Aint24w7PC2dKwK5rLjjzsHCVpCIRKhonJ6SPekuCOlcIyT/AOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774154650; c=relaxed/simple;
	bh=iklrSmc2eFXh465rqi8tjQ5u4HrKVniv0dcuPp1EWXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIF6KN1X71b9tkoGPZSrClBSoy0NxhpYlMlE2X5prxe3InV6qweupdEAqu18vw8fgQY4RTYJx9wL7OIOMFdu2kEQtPMUVDGC/ZVb/UCMQd1YD/rYosDm4iXc3LxLZeHCy/pBYmPigkDAZd4vRpDcRRKw8+Zs6we6y1zcgK5ttOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxU+RHUt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxU+RHUt"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82a3d3235c9so2992607b3a.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 21:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774154648; x=1774759448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qU8/bWS13MsftZvgahKfQGOcZwrz6izAI39Mi9cBNB4=;
        b=XxU+RHUtQbjZ3aK8bge26YL7rLubhr9f0rdTMo5w/t+Mo3GT4RXIO/QybqPGw9bC6c
         HfNvysqq+/0FkSJTJVqhit7Ipg2vbaSkM1Pq+2tO4E3Sj38xaDnyVmN3TBHM5+OLMpiP
         AUFaRU9IA2657TfIFpXI6/ykAVHWLqAN3p/1rG4GIy9yXIbxjHYvoKR+xJYUxQWWZkqC
         xar0lcLRz9aOzZ/mGt1WBBgflsNGTXEaGKUL4WM/CEuw0/MHm9ayEIZqlK7oAEK3Q7zt
         04QnLq6jjyxYhbS6kPY0uVAYb4vf5GbLwNHn7/emWtEhavDEOFK6BhYHVRntaooIY791
         59FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774154648; x=1774759448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qU8/bWS13MsftZvgahKfQGOcZwrz6izAI39Mi9cBNB4=;
        b=k0a0p0BWSxX+n33sSzg2DDRj7osbDXN5wdCXv4a2WDMJHuwXt/8ogaJiYF2gzNvSA5
         OR1Rwa33Q/pQmx8TJevWeKRKTIhxulr7zeP8hJbIdsKsN39EokWVnBMMjSl5Zt77IFjO
         Qwt0tq8KrE36Y05oFwEV7V79SjdZDZhUTDrA/2lFoNt6llf27WTdwgzaCK5Sepc80YQi
         4KGvOq4AbL1Enix1m0zldfp7TiX/esPVBT28GWHH4u8JU4/cDdkJgJeUZMnibUblr3yN
         F6QAJTD+EVi2XOA5gZQ0zX3FcTFUfDgA90TMD8RGxJc3JjVB8nF7li89g05bNYO2Nkau
         0+hw==
X-Forwarded-Encrypted: i=1; AJvYcCVgLASrvQ8tr5EoP5aSjv/CXMJCznLt32TrBosBJFOP11DjwF/Wksl5Hk6gFIw98DemA7joWLo4H85V+kv7mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCzwooAiwUxnHZzKVOBAm/XqVm2N+M9VMCb3U52uIEpLaLd7RO
	wZG7Xvqy82H/lz5HtSg0NyZ9CVjc+V6iSzhZAzcPv6FzkeakoJITmRLS
X-Gm-Gg: ATEYQzxlr9ePTn850wiY+vQ2cCsR2CcpBwLsPLl1gxWXWKbcyluPXrls1HiXw+0tUjl
	QraJOsLTlHh5aOEau34ya9k9N5kGf4vmOq88rcHH1+uL1f6zAvDYbxsYeiaxXtAPsZ1N3+IXlXU
	il750xBvXiz3GUL76OFLE/O5PxREmhbKp+pt8qSsdCEb5EZ2vSV2E6DCqt8bTZS395u5oVrkU8r
	pTv8GtN+LTd6Vue2V4lR7itvpi7bnw19ZtmPj98sYDisfZZ8mS/1lk2iEwnfPYBVPb1ceq0loIC
	ykY8Zp+HUkH3YiXZTxb7J2tgBPiFusDa9E9Cj7ucUrRR3QWg7nbjriBaFY4E42GvqtM+ATGPoXm
	YV0mlNbCDxSjpH0WQ5RvikyOX88FfIiz6GEaeeagftpd+p6cU3VZs5WBzbLnTAB++kYnnr8X930
	C0uqNKtEz4aHv98ZaGyCCHkc4HY6SBpMzzi6cHCPw9RZ7iEeixc7OC/8AVb8Y=
X-Received: by 2002:a05:6a00:1f19:b0:824:a635:4181 with SMTP id d2e1a72fcca58-82a8c21100dmr6602460b3a.15.1774154647760;
        Sat, 21 Mar 2026 21:44:07 -0700 (PDT)
Received: from albab.. ([114.130.187.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm6959559b3a.61.2026.03.21.21.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 21:44:07 -0700 (PDT)
From: Albab Hasan <albabhasan276@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Albab Hasan <albabhasan276@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: workqueue: add SAFETY comments for Pin<KBox<T>> impl blocks
Date: Sun, 22 Mar 2026 10:43:37 +0600
Message-ID: <20260322044340.129985-1-albabhasan276@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the placeholder // SAFETY: TODO. comments with proper safety
descriptions for the two unsafe impl blocks WorkItemPointer and
RawWorkItem for Pin<KBox<T>>.

For WorkItemPointer the safety relies on __enqueue obtaining the
work_struct from the Work field via T::raw_get_work and Work::new
ensuring the correct function pointer is passed to
init_work_with_key. the ID const generic bound ties the Work field
offset to the correct WorkItemPointer implementation so run always
receives the right work_struct.

For RawWorkItem the work_struct pointer stays valid for the closure
because it comes from a KBox allocation that is not dropped in
__enqueue. when queue_work_on returns true the memory is
intentionally leaked and only reclaimed in WorkItemPointer::run
which is the function pointer stored in the work_struct.

Also fix two inner SAFETY comments in WorkItemPointer::run that
incorrectly referenced Arc::into_raw instead of KBox::into_raw.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
Signed-off-by: Albab Hasan <albabhasan276@gmail.com>
---
 rust/kernel/workqueue.rs | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..769220b042d3 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -874,7 +874,15 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Arc<T>
 {
 }
 
-// SAFETY: TODO.
+// SAFETY: The `__enqueue` implementation in `RawWorkItem` uses a `work_struct` initialized with
+// the `run` method of this trait as the function pointer because:
+//   - `__enqueue` gets the `work_struct` from the `Work` field, using `T::raw_get_work`.
+//   - The only safe way to create a `Work` object is through `Work::new`.
+//   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_work_with_key`.
+//   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work` field
+//     will be used because of the ID const generic bound. This makes sure that `T::raw_get_work`
+//     uses the correct offset for the `Work` field, and `Work::new` picks the correct
+//     implementation of `WorkItemPointer` for `Pin<KBox<T>>`.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
@@ -883,9 +891,9 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
     unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
         // The `__enqueue` method always uses a `work_struct` stored in a `Work<T, ID>`.
         let ptr = ptr.cast::<Work<T, ID>>();
-        // SAFETY: This computes the pointer that `__enqueue` got from `Arc::into_raw`.
+        // SAFETY: This computes the pointer that `__enqueue` got from `KBox::into_raw`.
         let ptr = unsafe { T::work_container_of(ptr) };
-        // SAFETY: This pointer comes from `Arc::into_raw` and we've been given back ownership.
+        // SAFETY: This pointer comes from `KBox::into_raw` and we've been given back ownership.
         let boxed = unsafe { KBox::from_raw(ptr) };
         // SAFETY: The box was already pinned when it was enqueued.
         let pinned = unsafe { Pin::new_unchecked(boxed) };
@@ -894,7 +902,13 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Pin<KBox<T>>
     }
 }
 
-// SAFETY: TODO.
+// SAFETY: The `work_struct` raw pointer is guaranteed to be valid for the duration of the call to
+// the closure because we get it from a `KBox`, which guarantees that the allocation is valid until
+// the `KBox` is dropped, and we don't drop it in `__enqueue`. If `queue_work_on` returns true, it
+// is further guaranteed to be valid until a call to the function pointer in `work_struct` because
+// we leak the memory by not calling `KBox::from_raw` after `KBox::into_raw`, and only reclaim it
+// in `WorkItemPointer::run`, which is what the function pointer in the `work_struct` must be
+// pointing to, according to the safety requirements of `WorkItemPointer`.
 unsafe impl<T, const ID: u64> RawWorkItem<ID> for Pin<KBox<T>>
 where
     T: WorkItem<ID, Pointer = Self>,
-- 
2.43.0

