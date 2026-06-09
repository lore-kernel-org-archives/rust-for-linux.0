Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60AC38E8B5
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997603; cv=none; b=gKUEWIfEwRomo7JLGpLRC/KR0piNziEaJHSO4Wf+UlXjq5m/2VG9x2AslCp1P3vaR1uN38DTS4l4T3/tcvolhbDotGUTgn7zDy4/BOA9lnwiPy0RWGuj0i90S5pgkAzLaWVZXTbgvT+3OCfRONY+qkZpiuaxq2dikDjq1eP4q3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997603; c=relaxed/simple;
	bh=7DlVhs2v+09wwQbIq3vKTHwN7sqokZhim3n4q+ptJps=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SEip1cOc3WZ+t+9yYyHRsJT2M5L/UMSUNgkIKBJipp2WbJDxT6QOuU5MwuPQXo3PPG9Ek5V7k2N+oGDX0AgffOX2BKBpnLElBJdNknlspSDuLMpA5KRJTw5UQpuPBrZVbHWFgcU4+XATREKzGnJVCbpwelRBFYTWB/mZ07ErxHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W55FWSVZ; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W55FWSVZ"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-68c8bba56d3so4551936a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 02:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780997600; x=1781602400; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cmiW05yEJa1lMYtt8rVgEmjX2wdEb+IHLvGxii7qZ4o=;
        b=W55FWSVZuD8r7rEGXPfTEp0zu2J78tdQkBC4ptiBEYvYLUaurw5UpkTNkpl1kYLMo1
         jBvosFLMvh7WZki0tsn+Uj0BYNoTrbuLbxcv/4kK673tcX4CsBIGXxd06A0qd0GHboIL
         fHNgZ6I4zoR4ATKWWeHnBPUiSI6j671bv/X+VY2T/H2ddX7AU517UiGXBjfdD52LWWsU
         FfD17K7rmjF09rY2QRox0fzpeKuGsWPUod2QuHiKBJqwcK17KKbpvKDgGVeWoA4U5dd0
         2hcGFaZ8waMJEMPpf/k10mj89pRvO0++EHQcnOk2pZNbfXNtK6fpJrfJc8hTc9Z078rp
         A7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997600; x=1781602400;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmiW05yEJa1lMYtt8rVgEmjX2wdEb+IHLvGxii7qZ4o=;
        b=kV4ZkCUGaEBthH5TERIOBu4BGOXziv8KOO/uFTP1VErX5hAH5M+/IX7x3Jy+QByMi1
         LNpIcGP6tZcJYVfIHgyoCFxWMq8+MDgvf9ZE0N+34SfB6eouWDJ0GGmP5pEPQgKdPVUm
         gI83CYTh73FbUOMKM20K5NS0ZQ6yE9oDXT6u2b/KDqSXX9KEspbMcEyeAV2DkB/B1+O0
         rPgiC8fABS0byW+OyhE/bKldeilCu/BE31boaQK6Y8WXHNihjsOEvz38nUjhfu/G7DC1
         78SVObmXEJC0avKJQjdf4oYgW6od1R7qKLrfIvFg8jkXkNMJ8RGkUVQuwt2tFSkVHcQn
         8sGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KFUoNvBQ8HW2R/DVHT/lt1PlbGYnp0CwTTciHrZIhM2AzfzUIj8egTuYpv8bs6BFJFWeIKprwhbZSxL0jPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vgsxiCVl6oQZcqN8O6u1+IvW5/2fNc8p2tbd99KjU9x5cjh0
	RUFV3j2CTJzO7QAKq9fBAnKxdBy3LcJjK19sEOmRtiG8TeCYBC0NJwgq2SeFPFOFumMniTtuMSe
	GeFhYo7ipXqulu9Ak2Q==
X-Received: from edqx9.prod.google.com ([2002:aa7:d389:0:b0:67c:954a:e42d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3809:b0:68b:a17a:f368 with SMTP id 4fb4d7f45d1cf-68fa46b64b9mr8099381a12.0.1780997600102;
 Tue, 09 Jun 2026 02:33:20 -0700 (PDT)
Date: Tue, 09 Jun 2026 09:33:08 +0000
In-Reply-To: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7DlVhs2v+09wwQbIq3vKTHwN7sqokZhim3n4q+ptJps=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqJ93aO7EgaKoxm7TvJ6RLnkEVLedd/0j3mDo1U
 GiyMQ2FrKSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaifd2gAKCRAEWL7uWMY5
 Rt5AD/94/VQTbimWokRjY6q2PaGIq15SvaZSnYoEsRgBySMPHJNRvM2dLWBAWAHWyCtiuR9jPHN
 xuqk4SsFs21iHRVbZ6FkmJGwlx2KFJ+w+PpRanZr6D00wVFrtAICDsL2T+1U/NtOxcBZd9y8LiZ
 H+v5EGcqSYSvaVurGKvp5SnyF4dUjpE9D4TKSRGPR0Iw6aPsTfmewJzXXwCOGyZGDA006PNyxow
 uqN/ocrSRxQoAMGvR5OtXT3IVZE3SlbaP8YwgdFs4fxB39qSzeHVYGIL0MQNRMl8V22nVDEnyQ7
 AefLjC3teJVoUeQZ/u113+e8SV+dOe0pVWP3zlwz0z7dQ8D3cvTrjOGbgfRUNk+7lTtDQFog53d
 5Sj/pfC/05wIJz0ph+zV3Hem4+hQvPVc7MNPRNz78D4vM5C2zYhWOwQLWwrKuwj91exq/VDrgxN
 DQfKbzUUav4Mryugcf7gOFt3I+gkzMR7ldU6C2K0dN8rRVRZh51sHbBsNguqzFx/RbC8S55FZhI
 UsjqelKHHnDI+en3GoUAOd1ggVcoVIpta3o87wEhTiCm97KRyHeo2+3Fa5aSHDiQ9NHrEAFjquE
 Z8IEyXxYfwNYdsLvOUcx/hRLsyEOVgLQ6TSLDIR+/62xvTvJtJmErN2/0arRSk/KJRV4QxiZRkX d20bxafcgRV6pIg==
X-Mailer: b4 0.14.3
Message-ID: <20260609-binder-noderefs-spin-v2-2-eafde2ff376c@google.com>
Subject: [PATCH v2 2/6] rust_binder: avoid dropping NodeRef in update_ref()
 under lock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 96b8440ceac6..f4f4d45e1ab7 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -942,13 +942,17 @@ pub(crate) fn update_ref(
 
         // To preserve original binder behaviour, we only fail requests where the manager tries to
         // increment references on itself.
+        let _to_free_by_handle;
+        let _to_free_by_node;
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
@@ -957,8 +961,8 @@ pub(crate) fn update_ref(
                 unsafe { info.node_ref2().node.remove_node_info(info) };
 
                 let id = info.node_ref().node.global_id();
-                refs.by_handle.remove(&handle);
-                refs.by_node.remove(&id);
+                _to_free_by_handle = refs.by_handle.remove_node(&handle);
+                _to_free_by_node = refs.by_node.remove_node(&id);
                 refs.handle_is_present.release_id(handle as usize);
 
                 if let Some(shrink) = refs.handle_is_present.shrink_request() {

-- 
2.54.0.1064.gd145956f57-goog

