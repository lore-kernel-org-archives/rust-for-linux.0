Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9453E717B
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420150; cv=none; b=SlBoGCphAntBQxjP/zZe7IimZ7imI1cHoPbtql4WdfR/RQaJ6GcE51zXedEr7u1yef4z+faxu9iX0amsqq2r1GSTeAVlDKGSWaOPJwW9ax65eNCz9avSiE5TScrKPt7wPOhDcsD8K9eIvLeLQzT+QNifCdfUQoao+P/Y3Tzyg3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420150; c=relaxed/simple;
	bh=OIOql2Ourz4XzU76mlFsSHHC5LOroakqKsicPvtBRyI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AEt42JUwBdGy/d1jrdJs/qJYWFDai2yqRuv2VRIJTeJPvNyx72QKHiKRLU7iyg/UZVmqJSQVS89ocvFAQaqhaFPFq0atTnmqdoid9+4vsS1otpQ4j92zGgqao4bw3jgSbacqgTwL45qlZIw0s7wD6vyAaH/gok2wCaynfKJrgwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c6rbXybf; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c6rbXybf"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4629f312a67so3775610f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 03:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783420143; x=1784024943; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7K+dTUmkn9rcgoO7/BPipiqBM7AbzjBaW4IFdcE78l4=;
        b=c6rbXybfJWe1l3qgeSy5V4/IuQGZAq2/Cp0jPe+y6rRiYQs2UsCQl05ng8/EP8ycql
         fsvc7xV1ZvgCq1xEI7tpK4BDKa3PRg2b5an/fPxtOlwDAzE9HIerkjfr1R3OeWLZo56x
         lIA6HM5fBqPC8aAL7UPvERcMseKFLV2WwwwTu9yIvYGUwNm5Mmw1skwj0+zgvKxaUF/x
         OooIgJBwyYtj+VIuWjdprsNmofXukNPseqWMjEkxNTsfC8Gnft7bYLTcK6An1qYv369a
         Hi1Is6tj033PoZjxggs7nOC/eYgVCbQHm9sqIiFQ8cBNxBncbCEM/cLMqZY36xlz7xic
         OJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783420143; x=1784024943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7K+dTUmkn9rcgoO7/BPipiqBM7AbzjBaW4IFdcE78l4=;
        b=JcYUXv5mHCDj/UEVu3/5nDvKVoyDSa4L1QAu4AkfP8wqZ2uge+vjjpTdWKJXdbviPZ
         hsCNIvd8SWaWzqhjOOOV08VrNdqjtcyZZoh2ebEYO1FpSQsJ4/gyZ3S5tZVzH3U2Jmip
         rq3XE1RRHw68zz2WNCtWkKC9j8ybT66h85ma+iGyoJNEJUbTYyM/dnzx5EIyX07WC9n5
         nBY2mLEVIJyvn94FZSdm6uOwrvFNoG/Jh0Tr00U24PfxjEGrqQjVMKUKp6bjpAF1CGok
         37Ny+yEQkiVdtuiZ39pdmqocO8nuRbiKms7IZm9NKC+IwTwARHqUNL4QWHUOf19P01GO
         zryA==
X-Forwarded-Encrypted: i=1; AHgh+RrnzS8TxPoxL6rDRIwgT+9t+rlBrBgctMIJeWB23FBZqrwQhG/geRqqEH4//J7U5Zh5EOFmwkHS02KQDOf2dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGgxjSRDEX9DxhpI9XOcNbR3gECT/nTzS/V622X9LwUqCX+Vaj
	5X9sq4NKT7XwlSNxBw3vqBKGKOm9W9LLd9Bmq46WCbC+JToq7mLyZYE7RNVKreSrYZXV8Lqrxgd
	Aoluw4aUhgkZy1mkWnw==
X-Received: from wmbds15.prod.google.com ([2002:a05:600c:628f:b0:48a:79a9:335c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3483:b0:493:c548:87fb with SMTP id 5b1f17b1804b1-493df0b594fmr43870215e9.36.1783420143300;
 Tue, 07 Jul 2026 03:29:03 -0700 (PDT)
Date: Tue, 07 Jul 2026 10:28:52 +0000
In-Reply-To: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2730; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=OIOql2Ourz4XzU76mlFsSHHC5LOroakqKsicPvtBRyI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqTNTqulADPZWsBJPlpOlmsrRhoRPS6XhRiYvlx
 Rd4fI3dQrWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakzU6gAKCRAEWL7uWMY5
 Rp+wEAC7W25QFKm9VfGunUYRGOdFgG74zBbLJTArmeh4G0IkIkmb3qzdPF8r8InqcunqqrpClq/
 xTQ8Kx9Ab4M4YTCaFiF6AXa95VvbA3z/iDEEaFarUubqeWI5AV0cnfbmOQY5M1zbWDZkYkl4TGM
 r2tUx8UJ1czj9Dg4b2EkKbQVO9wKcHnRXWH9gjpNbHBTDOUFc8Xz7crry8lMe5a4t3+AvQo0sI0
 Pvxw0+akLjaRk46Cx0tr2ZK5JbmtdN0nnDvK/j10vTeKCJUWPbmxohtsAyyt+FlN6eYDSG9Je6c
 xcg4WfV/DHX90M1RghCutKL/1DzWgthWk5KW1HK1oGs4rvkajlvBQYtFfZr9QVy02zJjdi+gEK1
 XpMudX8eHYK5GpFSMlccryld3lNzGOO+YEpCt7Aeh6Y37gI/jyPcgSn8S1BtM6sQCYuzPxHxsAN
 6MJkXHvG3ShxKQModUI64YXg1+GB4Mc0/iAa/XvtVHooATTlHyRctmmPkFFsF5vn1xw/6+fCteb
 nD0XcMaFeZrxZrDAmCEd5gy4uShebnSh2c3lbP/svRiTwx20XGxcrSybCz+9NxOKZt7WF8N1Jrs
 HHJ0rSrhUKVGgHb6Vz7boyCIoVtG7BxWhu293xos3EuXIi1FnNin+VhXG7yS4THFLTMoeGvT4nt 64nbRNmEKq80gag==
X-Mailer: b4 0.14.3
Message-ID: <20260707-binder-noderefs-spin-v4-2-7c3c8bc16339@google.com>
Subject: [PATCH v4 2/6] rust_binder: avoid dropping NodeRef in update_ref()
 under lock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

In preparation for changing the node_refs lock to a spinlock, move the
cleanup of NodeRefInfo in update_ref() so that it occurs without the
node_refs lock held. This avoids dropping an Arc<Node> with the lock
held. Furthermore, the NodeDeath field is kept in the NodeRefInfo to be
dropped outside the lock as well.

The removal from the rbtree is updated to use remove_node(), which keeps
the rbtree node allocation until after node_refs is unlocked as well.
This is not strictly necessary as it just moves a kfree() outside the
lock, but there's no reason to invoke the kfree() under the lock if we
can easily avoid it, so avoid it.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 3b8eeac666bb..da84c0072d46 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -946,15 +946,19 @@ pub(crate) fn update_ref(
 
         // To preserve original binder behaviour, we only fail requests where the manager tries to
         // increment references on itself.
+        let _to_free_by_handle;
+        let _to_free_by_node;
         let _to_free_freeze_listener;
         let _to_free_freeze_listener_cleanup;
         let mut refs = self.node_refs.lock();
         if let Some(info) = refs.by_handle.get_mut(&handle) {
             if info.node_ref().update(inc, strong) {
                 // Clean up death if there is one attached to this node reference.
-                if let Some(death) = info.death().take() {
+                //
+                // We remove the entire `info` below, so no need to remove `death` from `info`.
+                if let Some(death) = info.death().as_ref() {
                     death.set_cleared(true);
-                    self.remove_from_delivered_deaths(&death);
+                    self.remove_from_delivered_deaths(death);
                 }
 
                 // Remove reference from process tables, and from the node's `refs` list.
@@ -971,8 +975,8 @@ pub(crate) fn update_ref(
                     }
                 }
 
-                refs.by_handle.remove(&handle);
-                refs.by_node.remove(&id);
+                _to_free_by_handle = refs.by_handle.remove_node(&handle);
+                _to_free_by_node = refs.by_node.remove_node(&id);
                 refs.handle_is_present.release_id(handle as usize);
 
                 if let Some(shrink) = refs.handle_is_present.shrink_request() {

-- 
2.55.0.rc2.803.g1fd1e6609c-goog

