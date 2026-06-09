Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E068B3DF012
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997608; cv=none; b=jHhXOCZWP/H6eNNVDKOnpHgCjYfLQSOAhiDBRJuzva1TmfzFRt7nY0gkoZm4UtQYbfK0aXiTbmmK4A1btKg4nWc01Cj2a+MZLpUBdKfll1IQEVc9S1WLymvehSNAqfFQzsO0+FmenObnerEuZ5l695bQlMR+1r0xFzYU8vqw9HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997608; c=relaxed/simple;
	bh=eZXEq4KjkqrmwB1YdEEoczaA2pgb4A2oRk034uSVM5Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N/Sjq13knxn2xX1kWAaFIlAWz4SmOVG0V1lTYH5EK+cEBl/a8I3MX4aEFy4OAHDvniVFOB851y2b8KiReCY1hsdKjNsVAeYP35HkAttWBNNvB2U/FfgGxkxHH+J2OZ/RIMyVXbYa3R5GAn9fPVDKHC6aTktURpzJQPPgzxVhCiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T63CJz5z; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T63CJz5z"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-45ef6417092so4401186f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 02:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780997605; x=1781602405; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BoKQPcgiWE5FoS/jA+ugO/LsBXn1UrcImc14xjkvTms=;
        b=T63CJz5zH3S66KOBowXSXJoAx3FE72dHe8tkNiictb39uowjs2vCTTmDgzm+EcR3gc
         N01tMS4g/XLyjuYaolH2P90Y07KVO78DC8Bm1pEFius4vOpdvsjpC/tSqotfftFFa5DT
         1t9OVQAGD+DIryJse7qfX2CZ3Ra8Ne/kbsBttAoopvDgN6Y4icwc3sntGYTLCXbyRwZi
         K0tgS/hP8/baVDOzTaT2nEIzGwStYuh52f4YQl1gmuaFbFWdFfS2cAZjeGop+iqcix5J
         WCcKZnkmnuvIAMZPVqHTa4g5Yd+slYijnmBcuA0rNkk0ApT29BoGNCboCxdgvE1omhiv
         lCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997605; x=1781602405;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BoKQPcgiWE5FoS/jA+ugO/LsBXn1UrcImc14xjkvTms=;
        b=WKZSsHfguXSmW7uZbmeMjSkAU8UHjJVxxEwhg2MPTfB42g86EL8nFg9/Ewbwhgo94V
         XCpgrY0NEw78ZSTA/FOgiIwpFvCNSp1obGFFvDh0O2caFFvojr1OXRaBDM02SZWPZoqP
         ISTx+76WwnD2+tHWWv+IE4F0WFABGq+NDXMPqCtglaP9YxxU9mU83SeaVKfvvXsla29n
         S4c/vbjVCsIm5XrT3FKGwvKxhNvT6he6MsXoRHCQGegS/pdxsmWdOifvpGJWqxcx0dEN
         6IOz8UINyrOFLVlyjeqURazfac55POhR6IMSfkh+8OLLSgj8JWGW5Zt5IhGbOrbAHjVo
         6RIg==
X-Forwarded-Encrypted: i=1; AFNElJ8DnAAnaDkBvkA3C3VLwMeZYjl/2U2z3PdDaFlBw4ksCfi+0qE4+HcgRt6E/Jzw8EAo1JPZkx9D/fptEIDP8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSBbB9y7zYxwP2hZIFbSjs9+E3LubpSYJf7M4Ed5QLUjNhZXBE
	exJXvTVy8o6Olne5lzIxxLrIRKOFK/ojpl/oGfWF3mtEVeYZsrxXavmKbCL4aGWusKQHQ6x8ggs
	Qt7H3NbXEfEtya51V2w==
X-Received: from wmlv24.prod.google.com ([2002:a05:600c:2158:b0:488:9b69:9379])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:458a:b0:48f:e518:d110 with SMTP id 5b1f17b1804b1-490c2614beemr278507225e9.32.1780997604665;
 Tue, 09 Jun 2026 02:33:24 -0700 (PDT)
Date: Tue, 09 Jun 2026 09:33:11 +0000
In-Reply-To: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3114; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=eZXEq4KjkqrmwB1YdEEoczaA2pgb4A2oRk034uSVM5Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqJ93bPhzZdCDTh+oLRav5szBSWi6GpebCgRVVK
 KzQfpcAUTWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaifd2wAKCRAEWL7uWMY5
 RqtqEACawigaDs8rlXoCVXZmpnu55H0VnI4nyWremZQ3+Pjmj/0aAnJqKvbqIK+5rBlMSRG/r1Y
 P5ZcryliLvz1gT4PuPs4SOql6g/qgY4F+MNtFkphKSd8DeiHi+hdXK8lum64X/SEZUheEFyZQ47
 Xzjn5wqJq11h+OGBE6ne3gziZCf4PuAyeDpZ5+a0HLcrVZnk1r3lBoCFpIVErFy28HFwhyPh/b6
 +OHJzawNZloBewJgwQvON1F8H82fXuh5LXWWC+IjOCvnVOTKjRGPmJL+bhDR5WPj82QkQGiuogE
 XzUYFflStlKQ5gvJ8sdToqs7Hl+rynQFwWxoruv+4JndpnBYVOHcokGtESeA4VlUsna4k5U/NMB
 UF2b58IEa24YDpSaNP9WtCu0PrN9TC0/4cZoigwI8okUxzndw3rrY+DhEpa2gnz/qDPlqNjZKkz
 XhW9auZ4KuwCXJpJeOhIZkC0ubLn2D1whnexcspOdnIuKrg3HG2IjIUXuNb9Lzf1/7bQ32KO18w
 UgnZAfQ8TEP6I9nRwUeBNLyZjugSKoGns8TY4NeNVrGDaU+MYjDeqzAztxEkgCyYv1HKbzslCWX
 wX6vYskvbY/DLCQI2/6/mqdw4uX0XocnBNB+CUg+15thiYTwy5g0p7qOVTkGxWTg0P3YLq58TG+ j9MjRdbFUKh+aig==
X-Mailer: b4 0.14.3
Message-ID: <20260609-binder-noderefs-spin-v2-5-eafde2ff376c@google.com>
Subject: [PATCH v2 5/6] rust_binder: avoid destructors in insert_or_update_handle()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

The insert_or_update_handle() function currently has two places where it
drops objects under the node_refs lock. In preparation for changing
node_refs into a spinlock, update the code to either entirely remove the
codepath or drop the node_refs lock first before running the destructor.

This also has the side-benefit that we avoid traversing the by_node
rbtree twice. Currently it's first traversed to see if the new node is
present, and then traversed again to insert it. By saving the
VacantEntry from the first lookup, we can perform the insertion without
traversing the tree again.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index c8e9fd0d0472..268d78f8cfb3 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -861,14 +861,17 @@ pub(crate) fn insert_or_update_handle(
         let handle = unused_id.as_u32();
 
         // Do a lookup again as node may have been inserted before the lock was reacquired.
-        if let Some(handle_ref) = refs.by_node.get(&node_ref.node.global_id()) {
-            let handle = *handle_ref;
-            let info = refs.by_handle.get_mut(&handle).unwrap();
-            info.node_ref().absorb(node_ref);
-            return Ok(handle);
-        }
+        let by_node_slot = match refs.by_node.entry(node_ref.node.global_id()) {
+            rbtree::Entry::Vacant(by_node_slot) => by_node_slot,
+            rbtree::Entry::Occupied(handle_ref) => {
+                // The node was inserted by another thread while we didn't hold the lock.
+                let handle = handle_ref.get();
+                let info = refs.by_handle.get_mut(handle).unwrap();
+                info.node_ref().absorb(node_ref);
+                return Ok(*handle);
+            }
+        };
 
-        let gid = node_ref.node.global_id();
         let (info_proc, info_node) = {
             let info_init = NodeRefInfo::new(node_ref, handle, self.into());
             match info.pin_init_with(info_init) {
@@ -884,6 +887,9 @@ pub(crate) fn insert_or_update_handle(
         // first thing in `deferred_release`, process cleanup will not miss the items inserted into
         // `refs` below.
         if self.inner.lock().is_dead {
+            // Explicitly drop the lock so that `info_proc` and `info_node` are dropped outside of
+            // the lock.
+            drop(refs_lock);
             return Err(ESRCH);
         }
 
@@ -891,7 +897,7 @@ pub(crate) fn insert_or_update_handle(
         // `info_node` into the right node's `refs` list.
         unsafe { info_proc.node_ref2().node.insert_node_info(info_node) };
 
-        refs.by_node.insert(reserve1.into_node(gid, handle));
+        by_node_slot.insert(handle, reserve1);
         by_handle_slot.insert(info_proc, reserve2);
         unused_id.acquire();
         Ok(handle)

-- 
2.54.0.1064.gd145956f57-goog

