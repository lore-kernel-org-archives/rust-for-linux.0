Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795716372;
	b=DXaAN4+jWy+uFJBgvb8MWXmsXBSfJWuxni+OhyHId9TghIt7bRm1GKn7K6f50FrPXm3I
	 Zte560nMrOGDlRHOUEU7052yMf4rlKHhwOP4MKfwF099dM5rjVQC9PWagPQppFxtht7Ar
	 8dFR1RoMTCKfJAA5MRzJjj/jS4cwSPUZkeP9Q6mmnggfx1EKXmkAserIVbLAHP6q328tZ
	 j7e7W0FRVDr67OSybE1KoteDfu83oTAyGjbOul+kUFObTmBG76t1lHNYiK/ZnJ7OeNuwt
	 IY5+LM3MvSD+ovbhMKo1Z0eCzQA6q+I/mhif+rBTv+uMHyoG2s1jaItiC8NWNawnSWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716372;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k+9pq0GBigUbns7KZYqZsmHGuwkgiYvvg3RgkVI+pcU=;
	b=M4gSTi65GKiejDJHuG7YO9qgadwN2lqGSjw1ID7JhSOlWNaIwAliUhM986hR3ZpwsXJw
	 ivUMh39wjG5S/aCF+dKiOeYzRgddtgYlWA3Ysj1Aj9l8OKXrNRXsCCRZm/k2CHPvi57yQ
	 eJh8CbvZ00vYT4H40lFGNUY1jpa7lzP6q4Z1oDH8VU4XsLWrDEkOLJYRuXVgjDWht0q7D
	 XgU4pDF3APVLWC/rBNY5Hplp56ZR/PDERhwnWdIaZ7XGRvuLlcJw46vPw2Oaq9TAL7uuv
	 4P4oz5lM8NF2chevQsZ5EYZ+NsRySOlDLuFEoC8FxpayWSXeeUtvLplyUmAK8niZyKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgpIvVYU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A038606A31E;
	Thu, 26 Nov 2026 18:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgpIvVYU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795716372;
	b=L5UpKUmNc+gHENXSg7SiOuY/mQd9mW90AMccDQi4Q6XHhnjk5IHvRpgxT11YTk3xwOcT
	 lte7hGVLoLl95gsygvBvI9KGXlTbsT28CUQEPYTFSsoRa/nQjpDF3TzSnlAW13vaRh+y1
	 V+Kp5GF970skLDYCRfQZJYF78UsKAY8kCzjjbDge7qPO0WrujgavD9n5B+X9v56JA/pIg
	 fgFY+M2K2UwK5ZgMgA7d3MSyzv2HoMZZbZwhBAhnrcH2eTcJuJ8hJb+MuTZW4bvMyoupN
	 hFO1OxD5ROQnCPUbRHKtmd85PblDwd8GIsY3OSD9W7NlhA/O3Bt59XQxfpcjq8pVOGw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795716372;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k+9pq0GBigUbns7KZYqZsmHGuwkgiYvvg3RgkVI+pcU=;
	b=sp+dFMlxu+8pTJ5YP6Cbg5Ys7MUHfy0Box0B7ERa87P/+YvyhzITYHSskKjG38UVTZ0R
	 zesuABhVcuuuxlI8v2idrprm8IdwzHt92bbQxdwd5NfUrQdqxC3RstSEJKBaUClHdNKkP
	 sWSWI00Vzn6MGOuDPnfwSRRNtg/WItAwOuATRyPk7I/Y0AVQaQEhmXTXAf9dwPNSWXAqm
	 gvYJxV60B9GLbfincSe3pJcg3ReS++ba7ggqBB7durwPajMG3FeQF9yelvaoQYs11NvWu
	 o68opYvTxCvOduDww8b+hitSOhCKKPnE8UrbwchwU6AaH/30ZstCGq0kWC7tVlkLTQA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 436D21F000C0;
	Thu, 26 Nov 2026 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795716372;
	bh=k+9pq0GBigUbns7KZYqZsmHGuwkgiYvvg3RgkVI+pcU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jgpIvVYUYPSibtuq4T43LFbChSuU4k/T0lsmyKVeZ+XSnZztxF/NCv/w1cdYc9lvu
	 suqZx8maWPETM/Jymq0Sudmz3bXj/lAArPqpIbTi5WE00WPRFXGXtEbgsYEg1NZ/g3
	 BdZ+2wL/pAdbDye+yWvLguIEkY9GyJU1kanTmH6j7+BMyaouUrdqupU9TAsmI5rFds
	 6rerYGg7kEBS3qu3dUwBjwHy6eXSbssCGC04KLZ3CYsctbTVwaJxWnQ0SjThukQfLM
	 eLKnbiPm4CROk8TA14OI7dQCkcLchb3Sib2fyvOdCsq9bvsSIuwQ6U6wP/s5rCe62g
	 OgTyucycl3Jqg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CBE644D77D;
	Thu, 26 Nov 2026 18:06:07 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 19:06:03 +0100
Subject: [PATCH] rust_binder: Reuse the free-index node in the range
 allocator
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-perf-binder-range-allocator-v1-1-7d924585d735@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAp1CGsC/3XOywrCMBCF4Vcps3bQtBIvryIucpnYkZqUSZVC6
 bub1LXLfzh8zAKZhCnDtVlA6MOZUyyhdg243sQHIfvS0B5arVSrcSQJaDl6EpRtYIYhOTMlwXD
 uuos3J3/0GoowCgWeN/12/3V+2ye5qZJ1YU0mtMVxfT3V3P/ByzuCL84OI80TrOsX692SZrwAA
 AA=
X-Change-ID: 20261126-perf-binder-range-allocator-f8339da7d4d6
To: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795716366; l=5590;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=3jMl1KWm85vv+EltZXMoB8Zdgw2mYRi6WhSgIiUrKJQ=;
 b=MTASfgjO6rL+lTcBKghWU+k9rP5hZ1Uvm7edBlMQMbJkNOvEVuO0oqZU6HmOTbXdCaJy8XjYM
 2MO6TjT36/sBAC0oqTvakpRjZmSyImTG/SlrMq6nd5dtcQQ4Rd5DCL6
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com
Content-Transfer-Encoding: 7bit

From: Peder Bergan <peder.bergan@gmail.com>

A tree reservation prepares a spare free-index node so releasing the
buffer can reinsert the free range without allocating under the
process spinlock. When the allocator selects a range, it removes and
frees that range's existing free-index node.

Convert the detached node into an RBTreeNodeReservation and store it
with the buffer. The release path can initialize the key after
coalescing the range. This reduces preparation from three fresh node
allocations to two and avoids one free under the process spinlock
per successful tree reservation, for both exact fits and splits.

Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
I compared the disassembly of the original and patched kernels.
I traced queued oneway transactions in x86-64 KVM guests. The traces
confirmed node reuse in both exact-fit and split reservations. Local
KUnit tests covered reservation and release, coalescing with both
neighbors, quota and no-fit rejection, and promotion and demotion.

OpenAI Codex assisted with coding and testing.
---
 drivers/android/binder/range_alloc/tree.rs | 55 +++++++++++++-----------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/android/binder/range_alloc/tree.rs b/drivers/android/binder/range_alloc/tree.rs
index f0cd46f223d56..5a225d9aa63ad 100644
--- a/drivers/android/binder/range_alloc/tree.rs
+++ b/drivers/android/binder/range_alloc/tree.rs
@@ -139,12 +139,6 @@ pub(crate) fn debug_print(&self, m: &SeqFile) -> Result {
         Ok(())
     }
 
-    fn find_best_match(&mut self, size: usize) -> Option<&mut Descriptor<T>> {
-        let free_cursor = self.free_tree.cursor_lower_bound(&(size, 0))?;
-        let ((_, offset), ()) = free_cursor.current();
-        self.tree.get_mut(offset)
-    }
-
     /// Try to reserve a new buffer, using the provided allocation if necessary.
     pub(crate) fn reserve_new(
         &mut self,
@@ -164,32 +158,34 @@ pub(crate) fn reserve_new(
             self.free_oneway_space
         };
 
-        let (found_size, found_off, tree_node, free_tree_node) = match self.find_best_match(size) {
-            None => {
+        let desc = self
+            .free_tree
+            .cursor_lower_bound(&(size, 0))
+            .and_then(|cursor| {
+                let ((_, offset), ()) = cursor.current();
+                self.tree.get_mut(offset)
+            })
+            .ok_or_else(|| {
                 pr_warn_ratelimited!("ENOSPC from range_alloc.reserve_new - size: {}\n", size);
-                return Err(ENOSPC);
-            }
-            Some(desc) => {
-                let found_size = desc.size;
-                let found_offset = desc.offset;
+                ENOSPC
+            })?;
+        let found_size = desc.size;
+        let found_off = desc.offset;
 
-                // In case we need to break up the descriptor
-                let new_desc = Descriptor::new(found_offset + size, found_size - size);
-                let (tree_node, free_tree_node, desc_node_res) = alloc.initialize(new_desc);
-
-                desc.state = Some((
-                    DescriptorState::new(is_oneway, debug_id, pid),
-                    desc_node_res,
-                ));
-                desc.size = size;
-
-                (found_size, found_offset, tree_node, free_tree_node)
-            }
-        };
+        // Keep the removed index node so releasing this buffer can restore a free range
+        // without allocating under the lock.
+        let free_node_res = self
+            .free_tree
+            .remove_node(&(found_size, found_off))
+            .ok_or(EINVAL)?
+            .into_reservation();
+        desc.state = Some((DescriptorState::new(is_oneway, debug_id, pid), free_node_res));
+        desc.size = size;
         self.free_oneway_space = new_oneway_space;
-        self.free_tree.remove(&(found_size, found_off));
 
         if found_size != size {
+            let remainder = Descriptor::new(found_off + size, found_size - size);
+            let (tree_node, free_tree_node) = alloc.initialize(remainder);
             self.tree.insert(tree_node);
             self.free_tree.insert(free_tree_node);
         }
@@ -430,18 +426,15 @@ fn try_change_state<F, Data>(&mut self, f: F) -> Result<Data>
 pub(crate) struct ReserveNewTreeAlloc<T> {
     tree_node_res: RBTreeNodeReservation<usize, Descriptor<T>>,
     free_tree_node_res: FreeNodeRes,
-    desc_node_res: FreeNodeRes,
 }
 
 impl<T> ReserveNewTreeAlloc<T> {
     pub(crate) fn try_new() -> Result<Self> {
         let tree_node_res = RBTreeNodeReservation::new(GFP_KERNEL)?;
         let free_tree_node_res = RBTreeNodeReservation::new(GFP_KERNEL)?;
-        let desc_node_res = RBTreeNodeReservation::new(GFP_KERNEL)?;
         Ok(Self {
             tree_node_res,
             free_tree_node_res,
-            desc_node_res,
         })
     }
 
@@ -451,14 +444,12 @@ fn initialize(
     ) -> (
         RBTreeNode<usize, Descriptor<T>>,
         RBTreeNode<FreeKey, ()>,
-        FreeNodeRes,
     ) {
         let size = desc.size;
         let offset = desc.offset;
         (
             self.tree_node_res.into_node(offset, desc),
             self.free_tree_node_res.into_node((size, offset), ()),
-            self.desc_node_res,
         )
     }
 }

---
base-commit: 917fcbf033154a6c8d83cfa6c88f012b71eb37b2
change-id: 20261126-perf-binder-range-allocator-f8339da7d4d6

Best regards,
--  
Peder Bergan <peder.bergan@gmail.com>


