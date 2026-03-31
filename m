Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4A3A255D
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983966; cv=none; b=eRZ5BekWhLxNvAS7azDi3g9JF0fuIGFFS+LEcOAJ3Ori3TwpEUWYYMdgs9EGjCGg/+BOuBARofYFoPLPiYVflKJEZsSJz7baoz88Mk92LN+/xBHNGH+qmTpxRu4IVzoztS+Svp5k8I1pq6EImRdNYgXZIC4PLMV6e5ErANvyKrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983966; c=relaxed/simple;
	bh=MlBjtNryex3JgB1+VMsGlA/uHqyb4i+UxDBnCRXseg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHcXYwH9SPScN7a3bwWgPStpHaG3XA2jQawZjuUTm9VXQt3u1V+1Jl3nYb/rhauQ953cbGpvb4Q4XBJuCRv5Lo3bTjv54dcijsWAIVpVEwaBtJUjnAbp0WEwZszKHC7SiWvwZZI7/izlUDat672+cCBBEFPXFEBdX0IELpTd4Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=f7o05tWJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pfPZUrxu; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="f7o05tWJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pfPZUrxu"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 86A647A01D9;
	Tue, 31 Mar 2026 15:06:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 15:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983963; x=
	1775070363; bh=85Kepg6PRg1ImDmwSLYOcBwtPOCXCFjcMcq4tYOnrp8=; b=f
	7o05tWJPGqAlXx3dIhkVE2BivLJlIotIWwxAPZy9izdnEYVIm8dum5bJMoh58IhO
	F7eEBs3LnW5R7TywI5PLLZn+N6IoJt303yRqsyglLdebZZHtzhzj33VUcGWDixBX
	MYGyOuUD7vQQowvBR6NT1e3ASxCj6kAOqxrWAIhCgzSlppAYy4hhLXtAYCipcCUW
	C5l9gS8pqImhRqEcxN8Rn14XkFloMueL0BDoC4/Md70f1jWVTsBZoqz5ZR7rdeuj
	zuNrRVK+hGfMlAmIEBaQe6Oi734STY6PkBtw+T8H9Xbr0DTD5hYCoinMfeUT0zAO
	8SSXzznJco5yvhBQDhFug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983963; x=1775070363; bh=8
	5Kepg6PRg1ImDmwSLYOcBwtPOCXCFjcMcq4tYOnrp8=; b=pfPZUrxuSEezuYhid
	qQVsYHZMiO4vVhtDaJpZY7hSh/oY1YigiGiefaUaCm/dHoHMYkO2ga1zwXUdI5kM
	arRRIbG/TUxNdZD7nYuxaQBHaWRm/QDtFv88ZVoGItsU/OHy5duLVXKSKRx2s3Fs
	GoHOna3xCch+weFx+EGOk7CPP+oXFUBi+jRbRnJrDpzhbrwzazqBV0SBkpZVCwZ/
	G894xf2OfhQXImSwLwmPdd/kTYaZ9+auQN0QXwwKrfu4CeWtOOiqBJ/EcTlMP61a
	R2bGH34+tB/Mk8MGr6y7GwZeJ1/uIXdFaBQTTdQj/8ZhodArA0bpHkbtPbPEgvKR
	PP4UA==
X-ME-Sender: <xms:GxvMaQhrY8bUuhEbWP-VDcV0aE1rYteJAo51Sy2LApbkSw87-16Vuw>
    <xme:GxvMaQCDDMnIrfuOGQIlCAvjtmszGCxfC0FJleOFU5sLNcpdJLD5GQ03OYMuObkEm
    h64CKyYXWGWF9RldUJS7FJIas4Z-hClRc2g_vkzp98fxh6TSTTLpQ>
X-ME-Received: <xmr:GxvMadHU7wlMfWp2tN90A58qfl3ZYjx7HbCvZCDDgktNF10GtKZRDCgKLZE7H9hfrmYC7l34ramn-7_-_6KLLy3_2mcJK1i901aKzsnf41_KpqCTmt9IZlcgOyB4bpUMRqgcXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhepvedthfduheffgfeiheduheefudetjeevueekleelvdffffdtfeevuddtvdeg
    ieelnecuffhomhgrihhnpehnohguvgdrihhspdgrshgprhgvfhdrihhspdhunhhlihhnkh
    gpfhhrohhnthdrihhspdhpohhsrdgrshdprghspghrvghfrdhnvgigthdprghspghpthhr
    rdhnvgigthdprghspghpohhsrdhsthhorhgvpdhgvghtrdhishenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgusehrvggruggrhhgv
    rggurdgvuhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepthgvghesjhhklhhmrdhnohdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegurghvihgusehrvggruggrhhgvrggurdgvuh
X-ME-Proxy: <xmx:GxvMaQJxHfxDYStAd3ZcFmz4empbagM9ChUIXSacegRh7LXqLGYeUg>
    <xmx:GxvMaZkfKmP0_9wEgzEp8LU26Y1j6dBvF9zZxCNJaYtieBCQbBjIGQ>
    <xmx:GxvMaQQ49S4_aSOqE6O62oaPO8bcRAjDtkiqwRqiHkBlv-esiaMovQ>
    <xmx:GxvMaTKFV_KhH6JaK8VAaaI-eXHGUCtjfQE_3M_nCErjVFMDPE-cGA>
    <xmx:GxvMaRTt8B21xzebtvJa7SVtA9igul4PNiZ3cojhEc_ioTcLYHDuR5kz>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:06:02 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 12/16] bus1/util: add intrusive single linked lists
Date: Tue, 31 Mar 2026 21:03:04 +0200
Message-ID: <20260331190308.141622-13-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331190308.141622-1-david@readahead.eu>
References: <20260331190308.141622-1-david@readahead.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce two new utility modules: slist and lll

`lll` is a lockless-single-linked-list similar to `linux/llist.h`. It
will be used by the bus1 module as message queue. `lll` uses the
intrusive helpers from `util::intrusive` and exposes a generic
(non-lockless) single linked list as `slist`.

Since clearing a lockless single linked list returns ownership of all
entries in the list, `slist` is provided as a generic single linked list
to represent that list. However, `slist` is useful on its own, even
without `lll` in mind.

`lll` follows a standard lockless-linked-list design, but has one
non-standard feature: It can be sealed. Sealing a lockless list clears
it and prevents and further entry from being linked, thus disabling the
list entirely, until it is deallocated. This is required by `bus1` to
ensure circular references are broken once a peer is deallocated.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 ipc/bus1/util/lll.rs   | 378 +++++++++++++++++++++++
 ipc/bus1/util/mod.rs   |   2 +
 ipc/bus1/util/slist.rs | 677 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 1057 insertions(+)
 create mode 100644 ipc/bus1/util/lll.rs
 create mode 100644 ipc/bus1/util/slist.rs

diff --git a/ipc/bus1/util/lll.rs b/ipc/bus1/util/lll.rs
new file mode 100644
index 000000000000..cddbe6ead4a1
--- /dev/null
+++ b/ipc/bus1/util/lll.rs
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0
+//! # Intrusive Lockless Linked Lists
+//!
+//! This module implements an intrusive lockless linked list. It is similar
+//! to `linux/llist.h`, but implemented in pure Rust.
+//!
+//! This follows the intrusive design described in
+//! [`intrusive`](crate::util::intrusive). However, it only offers a very
+//! limited API surface. For a general purpose single linked list list API,
+//! use [`util::slist`].
+//!
+//! The core entrypoint is [`List`], which maintains a single pointer to the
+//! last entry in a single linked list. Elements are stored by their [`Node`]
+//! metadata field, which again is just a single pointer to the respective
+//! previous element in a list.
+//!
+//! More generally, [`List`] can be seen as a multi-producer/multi-consumer
+//! channel, similar to (but very much reduced in scope)
+//! `std::sync::mpsc` in the Rust standard library.
+
+use kernel::prelude::*;
+use kernel::sync::atomic;
+
+use crate::util;
+
+/// Intrusive lockless single linked list to store elements.
+///
+/// A [`List`] effectively provides two operations:
+/// 1) Push a new element to the front of the list.
+/// 2) Remove all elements from the list and return them.
+///
+/// Both operations can be performed without any locks but only via hardware
+/// atomic operations.
+///
+/// This list is mainly used for multi-producer / single-or-multi-consumer
+/// (mpsc/mpmc) channels. That is, it serves as handover of items from
+/// producers to a consumer / consumers. The list does not provide any
+/// iterators, cursors, or other utilities to modify or inspect a list. If
+/// those are needed, proper locked lists are the better option.
+///
+/// Elements stored in a [`List`] are owned by that list, but are not moved,
+/// nor allocated by the list. Instead, the list takes ownership of a pointer
+/// to the element (either via smart pointers, or via references that have a
+/// lifetime that exceeds the lifetime of the list). Once an element is
+/// removed, ownership is transferred back to the caller.
+///
+/// [`List`] uses the same nodes as [`util::slist::Node`], and thus can move
+/// nodes from one to another.
+pub struct List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    // Pointer to the first node in the list. Set to `END` if the list is
+    // empty, `NULL` if it was sealed and can no longer be pused to. All other
+    // pointers always represent a pinned owned reference to an entry, gained
+    // via `Ref::pin_into_deref()`.
+    first: atomic::Atomic<usize>,
+    // Different lists can store entries of type `Ref` via different nodes. By
+    // pinning the field-representing-type, it is always clear which node a
+    // list is using.
+    _lrt: core::marker::PhantomData<Lrt>,
+}
+
+/// Metadata required for elements of a [`List`].
+///
+/// This is an alias for [`util::slist::Node`]. That is, this uses the same
+/// node type as the general purpose single-linked list provided by
+/// [`util::slist`].
+pub type Node = util::slist::Node;
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! util_lll_node_of {
+    ($ref:ty, $field:ident $(,)?) => {
+        $crate::util::intrusive::link_of!{$ref, $field, $crate::util::lll::Node}
+    }
+}
+
+/// Alias of [`link_of!()`](util::intrusive::link_of) for [`Node`] members.
+#[doc(inline)]
+pub use util_lll_node_of as node_of;
+
+// Marks a sealed list. This is different than `slist::END` in that no more
+// entries can be pushed to a sealed list. Otherwise, it is treated like an
+// empty list.
+pub(crate) const SEAL: usize = 0;
+
+impl<Lrt> List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    /// Create a new empty list.
+    ///
+    /// The new list has no entries linked and is completely independent of
+    /// other lists.
+    pub const fn new() -> Self {
+        Self {
+            first: atomic::Atomic::new(util::slist::END),
+            _lrt: core::marker::PhantomData,
+        }
+    }
+
+    /// Check whether the list is empty.
+    ///
+    /// This returns `true` is no entries are linked, `false` if at least one
+    /// entry is linked.
+    ///
+    /// Note that the list does not maintain a counter of how many elements are
+    /// linked.
+    pub fn is_empty(&self) -> bool {
+        match self.first.load(atomic::Relaxed) {
+            SEAL | util::slist::END => true,
+            _ => false,
+        }
+    }
+
+    /// Check whether the list is sealed.
+    ///
+    /// This returns `true` if the list is sealed. A sealed list is always
+    /// empty and cannot be modified, anymore (nor can the seal be removed).
+    pub fn is_sealed(&self) -> bool {
+        self.first.load(atomic::Relaxed) == SEAL
+    }
+
+    /// Link a node at the front of a list.
+    ///
+    /// On success, `Ok` is returned and the node is linked at the front of the
+    /// list, with ownership transferred to the list.
+    ///
+    /// If the node is already on another list, this will return `Err` and
+    /// return ownership of the entry to the caller.
+    ///
+    /// On success, this ensures a release memory barrier before linking it
+    /// into the list, matching the acquire memory barrier in
+    /// [`List::clear()`].
+    pub fn try_link_front(
+        &self,
+        ent: Pin<Lrt::Ref>,
+    ) -> Result<(), Pin<Lrt::Ref>> {
+        let mut first = self.first.load(atomic::Relaxed);
+        if first == SEAL {
+            // Sealed lists cannot be linked to.
+            return Err(ent);
+        }
+
+        let ent_node = Lrt::acquire(ent);
+        // SAFETY: `ent_node` is convertible to a shared reference as long as
+        //     we do not call `Lrt::release()`.
+        let ent_node_r = unsafe { ent_node.as_ref() };
+
+        let Ok(_) = ent_node_r.next.cmpxchg(0, first, atomic::Relaxed) else {
+            // `ent_node_r` becomes invalid once `end_deref` is released.
+            #[expect(dropping_references)]
+            drop(ent_node_r);
+            // `ent` is already linked into another list, return ownership to
+            // the caller wrapped in an `Err`.
+            //
+            // SAFETY: `ent_node` was just acquired from `pin_into_deref()`
+            //     and is no longer used afterwards.
+            return Err(unsafe { Lrt::release(ent_node) });
+        };
+
+        // Expose provenance, until `Atomic<*mut T>` is here.
+        let ent_node_addr = ent_node.as_ptr() as usize;
+
+        // Try updating the list-front until it succeeds.
+        loop {
+            // Use release barrier, since we want all operations on the node
+            // to be ordered before the node is pushed to the list. The
+            // matching acquire barrier is in `Self::clear()`.
+            match self.first.cmpxchg(
+                first,
+                ent_node_addr,
+                atomic::Release,
+            ) {
+                Ok(_) => break Ok(()),
+                Err(v) => {
+                    // If the list is sealed, no more entries can be linked.
+                    if v == SEAL {
+                        // SAFETY: `ent_node` was just acquired from
+                        // `pin_into_deref()` and is no longer used afterwards.
+                        break Err(unsafe { Lrt::release(ent_node) });
+                    }
+                    first = v;
+                    ent_node_r.next.store(first, atomic::Relaxed);
+                },
+            }
+        }
+    }
+
+    /// Clear the entire list and return the entries to the caller.
+    ///
+    /// This will atomically remove all entries from the list, and return those
+    /// entries as a general purpose single linked list to the caller.
+    ///
+    /// Note that [`List`] only supports adding entries at the front. Hence,
+    /// the returned list will be in LIFO (last-in-first-out) order.
+    ///
+    /// This ensures an acquire memory barrier matching the release memory
+    /// barrier in [`List::try_link_front()`].
+    pub fn clear(&self) -> util::slist::List<Lrt> {
+        let mut first = self.first.load(atomic::Relaxed);
+        loop {
+            if first == SEAL {
+                break util::slist::List::new();
+            }
+            // Use acquire barrier to ensure writes to the nodes are
+            // visible, if done before they were linked. The matching
+            // release barrier is in `Self::try_link_front()`.
+            match self.first.cmpxchg(
+                first,
+                util::slist::END,
+                atomic::Acquire,
+            ) {
+                Ok(v) => {
+                    // SAFETY: By clearing `self.first` we acquire the list.
+                    // Since it uses the same nodes as `slist`, we can create
+                    // one from it.
+                    break unsafe { util::slist::List::with(v) };
+                },
+                Err(v) => first = v,
+            }
+        }
+    }
+
+    /// Seal the entire list and return all entries to the caller.
+    ///
+    /// This will atomically remove all entries from the list and seal it, so
+    /// any new attempt to link more entries will fail.
+    ///
+    /// A sealed list will remain sealed and cannot be unsealed. This also
+    /// implies that the list will remain empty.
+    ///
+    /// If the list is already sealed, this is a no-op and will return an empty
+    /// list.
+    pub fn seal(&self) -> util::slist::List<Lrt> {
+        let v = self.first.xchg(SEAL, atomic::Acquire);
+        if v == SEAL {
+            util::slist::List::new()
+        } else {
+            // SAFETY: By clearing `self.first` we acquire the list. Since it
+            // uses the same nodes as `slist`, we can create one from it.
+            unsafe { util::slist::List::with(v) }
+        }
+    }
+}
+
+// Convenience helpers
+impl<Lrt> List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    /// Link a node at the front of a list.
+    ///
+    /// Works like [`List::try_link_front()`] but warns on error and leaks the
+    /// entry.
+    pub fn link_front(&self, ent: Pin<Lrt::Ref>) {
+        self.try_link_front(ent).unwrap_or_else(|v| {
+            // Warn if the entry is already used elsewhere, and then leak the
+            // reference to avoid cascading failures.
+            kernel::warn_on!(true);
+            core::mem::forget(v);
+        })
+    }
+}
+
+// SAFETY: `List` can be sent along CPUs, as long as the data it contains can
+//     also be sent along. `List` never cares about the CPU it is called on.
+unsafe impl<Lrt> Send for List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+    Lrt::Ref: Send,
+{
+}
+
+// SAFETY: `List` is meant to be shared across CPUs and safely handles parallel
+//     accesses through atomics. It never hands out references to stored
+//     elements, so it is `Sync` as long as the data it sends along is `Send`.
+unsafe impl<Lrt> Sync for List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+    Lrt::Ref: Send,
+{
+}
+
+impl<Lrt> core::default::Default for List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    /// Return a new empty list.
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl<Lrt> core::ops::Drop for List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    /// Clear a list before dropping it.
+    ///
+    /// This drops all elements in the list via [`List::clear()`], before
+    /// dropping the list. This ensures that the elements of a list are
+    /// not leaked.
+    fn drop(&mut self) {
+        self.clear();
+    }
+}
+
+#[kunit_tests(bus1_util_lll)]
+mod test {
+    use super::*;
+
+    #[derive(Default)]
+    struct Entry {
+        key: u8,
+        node: Node,
+    }
+
+    util::field::impl_pin_field!(Entry, node, Node);
+
+    #[test]
+    fn test_basic() {
+        let e0 = core::pin::pin!(Entry { key: 0, ..Default::default() });
+        let e1 = core::pin::pin!(Entry { key: 1, ..Default::default() });
+
+        let list: List<node_of!(&Entry, node)> = List::new();
+
+        assert!(list.is_empty());
+        assert!(!list.is_sealed());
+        assert!(!e0.node.is_linked());
+        assert!(!e1.node.is_linked());
+
+        list.link_front(e0.as_ref());
+        list.link_front(e1.as_ref());
+
+        assert!(!list.is_empty());
+        assert!(!list.is_sealed());
+        assert!(e0.node.is_linked());
+        assert!(e1.node.is_linked());
+
+        assert!(list.try_link_front(e0.as_ref()).is_err());
+        assert!(list.try_link_front(e1.as_ref()).is_err());
+
+        let mut r = list.clear();
+        assert_eq!(r.unlink_front().unwrap().key, 1);
+        assert_eq!(r.unlink_front().unwrap().key, 0);
+        assert!(r.unlink_front().is_none());
+
+        assert!(list.is_empty());
+        assert!(!list.is_sealed());
+        assert!(!e0.node.is_linked());
+        assert!(!e1.node.is_linked());
+
+        list.link_front(e0.as_ref());
+        assert!(!list.is_empty());
+        assert!(!list.is_sealed());
+        assert!(e0.node.is_linked());
+        assert!(!e1.node.is_linked());
+
+        assert!(!list.is_sealed());
+        let mut r = list.seal();
+        assert!(list.is_empty());
+        assert!(list.is_sealed());
+        assert!(e0.node.is_linked());
+        assert!(!e1.node.is_linked());
+        assert!(list.try_link_front(e0.as_ref()).is_err());
+        assert!(list.try_link_front(e1.as_ref()).is_err());
+
+        assert_eq!(r.unlink_front().unwrap().key, 0);
+        assert!(r.unlink_front().is_none());
+
+        assert!(list.is_empty());
+        assert!(list.is_sealed());
+        assert!(!e0.node.is_linked());
+        assert!(!e1.node.is_linked());
+    }
+}
diff --git a/ipc/bus1/util/mod.rs b/ipc/bus1/util/mod.rs
index bcd6eedff85a..4639e40382c4 100644
--- a/ipc/bus1/util/mod.rs
+++ b/ipc/bus1/util/mod.rs
@@ -10,6 +10,8 @@
 pub mod convert;
 pub mod field;
 pub mod intrusive;
+pub mod lll;
+pub mod slist;
 
 /// Convert an Arc to its pinned version.
 ///
diff --git a/ipc/bus1/util/slist.rs b/ipc/bus1/util/slist.rs
new file mode 100644
index 000000000000..e6ca6b078fb8
--- /dev/null
+++ b/ipc/bus1/util/slist.rs
@@ -0,0 +1,677 @@
+// SPDX-License-Identifier: GPL-2.0
+//! # Intrusive Single-Linked Lists
+//!
+//! This module implements an intrusive single linked list. It follows the
+//! intrusive design described in [`intrusive`](crate::util::intrusive).
+//!
+//! [`List`] represents a single linked list and maintains a pointer to the
+//! first element in a list. It is an owning list, which takes ownership of a
+//! reference to each element stored in the list. Elements must embed a
+//! [`Node`], which is used by the list to store metadata. Nodes effectively
+//! store just a pointer to the next node in the list.
+//!
+//! Since elements of a single linked list do not have a pointer to their
+//! previous element, they generally cannot be unlinked ad-hoc. Instead, they
+//! can only be unlinked during iteration or if they are the first element.
+//! Therefore, this implementation does not provide any way to test list
+//! association in O(1). It is possible to check whether an element is linked
+//! or not, but you cannot check whether it is linked into a specific list.
+
+// XXX: Since `kernel::atomic::Atomic<*mut T>` was not yet stabilized, this
+//     implementation uses `Atomic<usize>` instead, exposing provenance. This
+//     will change once atomic pointers are stabilized.
+
+use core::ptr::NonNull;
+use kernel::prelude::*;
+use kernel::sync::atomic;
+
+use crate::util;
+
+/// Intrusive single linked list to store elements.
+///
+/// A [`List`] is a single-linked list, where each element only knows its
+/// following element. The list maintains a pointer to the first element only.
+///
+/// Elements stored in a [`List`] are owned by that list, but are not moved,
+/// nor allocated by the list. Instead, the list takes ownership of a pointer
+/// to the element (either via smart pointers, or via references that have a
+/// lifetime that exceeds the lifetime of the list). Once an element is
+/// removed, ownership is transferred back to the caller.
+///
+/// [`List`] is intrusive in nature, meaning it relies on metadata on each
+/// element to manage list internals. This metadata must be a member field of
+/// type [`Node`]. The exact member field that is used for a list is provided
+/// via a generic field representing type (`FRT`). All elements stored in a
+/// single list will use the same member field. But a single element can have
+/// multiple different member fields of type [`Node`], and thus be linked into
+/// multiple different lists simultaneously.
+pub struct List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    // Pointer to the first node in a single-linked list. This is never `NULL`,
+    // but can be `END`, in which case it marks the end of the list. This
+    // pointer always represents a pinned owned reference to the entry, gained
+    // via `Ref::pin_into_deref()`.
+    // Only uses atomics to allow `CursorMut` to treat it as `Node.next`.
+    first: atomic::Atomic<usize>,
+    // Different lists can store entries of type `Link::Ref` via different
+    // nodes. By pinning the link-representing-type, it is always clear which
+    // node a list is using.
+    _lrt: core::marker::PhantomData<Lrt>,
+}
+
+/// Metadata required for elements of a [`List`].
+///
+/// Every element that is stored in a [`List`] must have a member field of
+/// type [`Node`]. [`List`] is generic over the member field used, so a
+/// single element can have multiple nodes to be stored in multiple different
+/// lists. All elements stored in the same list will use the same member field
+/// for that list, though.
+pub struct Node {
+    // A pointer to the next node. This is `NULL` if the node is unlinked,
+    // `END` if it is the last element in the list. This pointer always
+    // represents a pinned owned reference to the entry, gained via
+    // `Ref::pin_into_deref()`.
+    // This is an atomic to allow acquiring unused nodes. Once acquired, a list
+    // can use non-atomic reads. Writes must be atomic still, to prevent
+    // temporary releases.
+    pub(crate) next: atomic::Atomic<usize>,
+    // List nodes store pointers to other nodes, so nodes must always be pinned
+    // when linked.
+    _pin: core::marker::PhantomPinned,
+}
+
+/// Mutable cursor to move over the elements of a [`List`].
+///
+/// Mutable cursors mutably borrow a list and then allow moving over the list
+/// and accessing the elements. Unlike immutable cursors, mutable cursors allow
+/// linking new elements, and unlinking existing elements.
+///
+/// Single linked lists can only be iterated in one direction, so this cursor
+/// behaves very similar to standard iterators.
+pub struct CursorMut<'list, Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    // Current position of the cursor. Always refers to the pointer to an
+    // element, rather than the element itself, to allow removal of the
+    // element.
+    pos: NonNull<atomic::Atomic<usize>>,
+    // Cursors borrow their list mutably, yet that borrow is never used,
+    // so provide as phantom data.
+    _list: core::marker::PhantomData<&'list mut List<Lrt>>,
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! util_slist_node_of {
+    ($ref:ty, $field:ident $(,)?) => {
+        $crate::util::intrusive::link_of!{$ref, $field, $crate::util::slist::Node}
+    }
+}
+
+/// Alias of [`link_of!()`](util::intrusive::link_of) for [`Node`] members.
+#[doc(inline)]
+pub use util_slist_node_of as node_of;
+
+// Marks the end of a list, to be able to distinguish unlinked nodes from tail
+// nodes. Since the initial page is reserved, this cannot match real nodes.
+pub(crate) const END: usize = core::mem::align_of::<Node>();
+
+impl<Lrt> List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    /// Create a new list with the given value for `first`.
+    ///
+    /// # Safety
+    ///
+    /// `first` must either be [`END`] or point to the first node of a list,
+    /// with ownership transferred to the new list.
+    pub(crate) const unsafe fn with(first: usize) -> Self {
+        Self {
+            first: atomic::Atomic::new(first),
+            _lrt: core::marker::PhantomData,
+        }
+    }
+
+    /// Create a new empty list.
+    ///
+    /// The new list has no entries linked and is completely independent of
+    /// other lists.
+    pub const fn new() -> Self {
+        // SAFETY: `END` is trivially allowed as argument.
+        unsafe { Self::with(END) }
+    }
+
+    /// Check whether the list is empty.
+    ///
+    /// This returns `true` is no entries are linked, `false` if at least one
+    /// entry is linked.
+    ///
+    /// Note that the list does not maintain a counter of how many elements are
+    /// linked.
+    pub fn is_empty(&self) -> bool {
+        self.first.load(atomic::Relaxed) == END
+    }
+
+    /// Return a mutable cursor for this list, starting at the front.
+    ///
+    /// Create a new mutable cursor for the list, which initially points at the
+    /// first element. The cursor mutably borrows the list for its entire
+    /// lifetime.
+    pub fn cursor_mut(&mut self) -> CursorMut<'_, Lrt> {
+        CursorMut {
+            pos: util::nonnull_from_ref(&self.first),
+            _list: core::marker::PhantomData,
+        }
+    }
+
+    /// Link a node at the front of the list.
+    ///
+    /// On success, `Ok` is returned and the node is linked at the front of the
+    /// list, with ownership transferred to the list.
+    ///
+    /// If the node is already on another list, this will return `Err` and
+    /// return ownership of the entry to the caller.
+    pub fn try_link_front(
+        &mut self,
+        ent: Pin<Lrt::Ref>,
+    ) -> Result<Pin<&Lrt::Target>, Pin<Lrt::Ref>> {
+        self.cursor_mut().try_link_consume(ent)
+    }
+
+    /// Unlink the first element of the list.
+    ///
+    /// If the list is empty, this will return `None`. Otherwise, the first
+    /// entry is removed from the list and ownership is transferred to the
+    /// caller.
+    pub fn unlink_front(&mut self) -> Option<Pin<Lrt::Ref>> {
+        self.cursor_mut().unlink()
+    }
+
+    /// Clear the list and move ownership of all entries into a closure.
+    ///
+    /// This will invoke `clear_fn` once for each entry in the list. The entry
+    /// is removed and ownership is transferred into the closure.
+    ///
+    /// Entries are removed sequentially starting from the front of the list.
+    pub fn clear_with<ClearFn>(
+        &mut self,
+        mut clear_fn: ClearFn,
+    )
+    where
+        ClearFn: FnMut(Pin<Lrt::Ref>),
+    {
+        while let Some(v) = self.unlink_front() {
+            clear_fn(v);
+        }
+    }
+}
+
+// Convenience helpers
+impl<Lrt> List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    /// Link a node at the front of the list.
+    ///
+    /// Works like [`List::try_link_front()`] but panics on error.
+    pub fn link_front(&mut self, ent: Pin<Lrt::Ref>) -> Pin<&Lrt::Target> {
+        self.try_link_front(ent).unwrap_or_else(|_| {
+            panic!("attempting to link a foreign node");
+        })
+    }
+
+    /// Clear the list and drop all elements.
+    ///
+    /// Works like [`List::clear_with()`] but uses `core::mem::drop` as
+    /// closure.
+    pub fn clear(&mut self) {
+        self.clear_with(|_| {})
+    }
+}
+
+// SAFETY: Lists have no interior mutability, nor do they otherwise care for
+//     their calling CPU. They can be freely sent across CPUs, only limited by
+//     the stored type.
+unsafe impl<Lrt> Send for List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+    Lrt::Ref: Send,
+{
+}
+
+// SAFETY: Lists have no interior mutability, nor do they otherwise care for
+//     their calling CPU. They can be shared across CPUs, only limited by
+//     the stored type.
+unsafe impl<Lrt> Sync for List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+    Lrt::Ref: Sync,
+{
+}
+
+impl<Lrt> core::default::Default for List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    /// Return a new empty list.
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl<Lrt> core::ops::Drop for List<Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    /// Clear a list before dropping it.
+    fn drop(&mut self) {
+        self.clear();
+    }
+}
+
+impl Node {
+    /// Create a new unlinked node.
+    ///
+    /// The new node is marked as unlinked and not associated with any other
+    /// node or list.
+    ///
+    /// Note that nodes must be pinned to be linked into a list. Therefore,
+    /// the result must either be pinned in place or moved into a pinned
+    /// structure to make proper use of it.
+    pub const fn new() -> Self {
+        Self {
+            next: atomic::Atomic::new(0),
+            _pin: core::marker::PhantomPinned,
+        }
+    }
+
+    /// Check whether this node is linked into a list.
+    ///
+    /// This returns `true` if this node is linked into any list. It returns
+    /// `false` if the node is currently unlinked.
+    ///
+    /// Note that a node can be linked into a list at any time. That is,
+    /// validity of the returned boolean can change spuriously, unless the
+    /// caller otherwise ensures exclusive access to the node.
+    /// Furthermore, no memory barriers are guaranteed by this call, so data
+    /// dependence must be considered separately.
+    pub fn is_linked(&self) -> bool {
+        self.next.load(atomic::Relaxed) != 0
+    }
+}
+
+// SAFETY: Nodes are only ever modified through their owning list, or through
+//     atomics. Hence, they can be freely sent across CPUs.
+unsafe impl Send for Node {
+}
+
+// SAFETY: Shared references to a node always use atomics for any data access.
+//     They can be freely shared across CPUs.
+unsafe impl Sync for Node {
+}
+
+impl core::clone::Clone for Node {
+    /// Returns a clean and unlinked node.
+    ///
+    /// Cloning a node always yields a new node that is unlinked and in no way
+    /// tied to the original node.
+    fn clone(&self) -> Self {
+        Self::new()
+    }
+}
+
+impl core::default::Default for Node {
+    /// Create a new unlinked node.
+    fn default() -> Self {
+        Self::new()
+    }
+}
+
+impl core::ops::Drop for Node {
+    /// Drop a node and verify it is unlinked.
+    ///
+    /// No special cleanup is required when dropping nodes. However, linked
+    /// nodes are owned by their respective list. So if a linked node is
+    /// dropped, someone screwed up and this will warn loudly.
+    fn drop(&mut self) {
+        kernel::warn_on!(self.is_linked());
+    }
+}
+
+impl<'list, Lrt> CursorMut<'list, Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    fn as_pos(&self) -> &atomic::Atomic<usize> {
+        // SAFETY: `Self.pos` is always convertible to a reference.
+        unsafe { self.pos.as_ref() }
+    }
+
+    fn get_ptr(&self) -> Option<NonNull<Node>> {
+        let pos = self.as_pos().load(atomic::Relaxed);
+        if pos == END {
+            None
+        } else {
+            // Recreate the pointer with the exposed provenance.
+            let ptr = pos as *mut Node;
+            // SAFETY: NULL is never stored in a list, but only used to denote
+            //     unlinked nodes. Hence, `node` cannot be NULL.
+            Some(unsafe { NonNull::new_unchecked(ptr) })
+        }
+    }
+
+    fn link(
+        &mut self,
+        ent: Pin<Lrt::Ref>,
+    ) -> Result<NonNull<Node>, Pin<Lrt::Ref>> {
+        let pos = self.as_pos();
+        let ent_node = Lrt::acquire(ent);
+
+        // Nothing is dependent on the value of `Node.next`, except for the
+        // fact whether this operation succeeded, so perform a relaxed cmpxchg.
+        // Any data dependence behind `Ref` is ordered on `self` (and `ent`).
+        //
+        // SAFETY: We hold `ent_node` exclusively here, so it is convertible to
+        //     a shared reference for that long.
+        if let Ok(_) = unsafe { ent_node.as_ref() }.next.cmpxchg(
+            0,
+            pos.load(atomic::Relaxed),
+            atomic::Relaxed,
+        ) {
+            // Expose provenance, until `Atomic<*mut T>` is here.
+            let ent_node_addr = ent_node.as_ptr() as usize;
+            // All nodes are owned by the list, so no ordering needed. Atomics
+            // are only used to prevent temporary releases of the nodes.
+            pos.store(ent_node_addr, atomic::Relaxed);
+            Ok(ent_node)
+        } else {
+            // `ent` is already linked into another list, return ownership to
+            // the caller wrapped in an `Err`.
+            //
+            // SAFETY: `ent_node` was just acquired from `acquire()` and is
+            //     no longer used afterwards.
+            Err(unsafe { Lrt::release(ent_node) })
+        }
+    }
+
+    /// Get a reference to the element the cursor points to.
+    ///
+    /// If the cursor points past the last element, `None` is returned.
+    /// Otherwise, a reference to the element is returned.
+    pub fn get(&self) -> Option<Pin<&Lrt::Target>> {
+        let ent_node = self.get_ptr()?;
+        // SAFETY: `ent_node` was taken from the list, and a list ensures
+        //     those were acquired via `Lrt::acquire()` and thus valid
+        //     until released. Since the cursor is immutably borrowed, the
+        //     entry is valid for that lifetime.
+        Some(unsafe { Lrt::borrow(ent_node) })
+    }
+
+    /// Get a clone of the reference to the element the cursor points to.
+    ///
+    /// If the cursor points past the last element, `None` is returned.
+    /// Otherwise, a clone of the reference to the element is returned.
+    pub fn get_clone(&self) -> Option<Pin<Lrt::Ref>>
+    where
+        Lrt::Ref: Clone,
+    {
+        let ent_node = self.get_ptr()?;
+        // SAFETY: `ent_node` was taken from the list, and a list ensures
+        //     those were acquired via `Lrt::acquire()` and thus valid
+        //     until released. Since the cursor is immutably borrowed, the
+        //     entry is valid for that lifetime.
+        Some(unsafe { Lrt::borrow_clone(ent_node) })
+    }
+
+    /// Get a mutable reference to the element the cursor points to.
+    ///
+    /// If the cursor points past the last element, `None` is returned.
+    /// Otherwise, a mutable reference to the element is returned.
+    pub fn get_mut(
+        &mut self,
+    ) -> Option<Pin<&mut <Lrt as util::intrusive::Link<Node>>::Target>>
+    where
+        Lrt: util::intrusive::LinkMut<Node>,
+    {
+        let ent_node = self.get_ptr()?;
+        // SAFETY: `ent_node` was taken from the list, and a list ensures
+        //     those were acquired via `Lrt::acquire()` and thus valid
+        //     until released. Since the cursor is immutably borrowed, the
+        //     entry is valid for that lifetime.
+        //     Since we own an `Lrt::Ref`, we can mutably borrow the entire
+        //     list to get a mutable reference to the reference target.
+        Some(unsafe { Lrt::borrow_mut(ent_node) })
+    }
+
+    /// Move the cursor to the next element.
+    ///
+    /// If the cursor already points past the last element, this is a no-op.
+    /// Otherwise, the cursor is moved to the next element.
+    pub fn move_next(&mut self) {
+        if let Some(ent_node) = self.get_ptr() {
+            // SAFETY: `ent_node` was taken from the list, and a list ensures
+            //     those were acquired via `Lrt::acquire()` and thus valid
+            //     until released. Since cursors always move forward, the entry
+            //     is valid until destruction of the cursor.
+            self.pos = unsafe {
+                NonNull::new_unchecked(
+                    (&raw const (*ent_node.as_ptr()).next).cast_mut(),
+                )
+            };
+        }
+    }
+
+    /// Link a node at the cursor position.
+    ///
+    /// On success, `Ok` is returned and the node is linked at the cursor
+    /// position (i.e., the cursor points to the node), with ownership
+    /// transferred to the list.
+    ///
+    /// If the node is already on another list, this will return `Err` and
+    /// return ownership of the entry to the caller. The cursor and list remain
+    /// unmodified.
+    pub fn try_link(
+        &mut self,
+        ent: Pin<Lrt::Ref>,
+    ) -> Result<Pin<&Lrt::Target>, Pin<Lrt::Ref>> {
+        self.link(ent).map(|v| {
+            // SAFETY: The entry is convertible to a pinned shared reference
+            //     for as long as we do not call `Ref::release()`. By holding
+            //     `self`, we prevent `Cursor` from doing so.
+            unsafe { Lrt::borrow(v) }
+        })
+    }
+
+    /// Unlink the current element without moving the cursor.
+    ///
+    /// If the cursor points past the last element, this is a no-op and returns
+    /// `None`. Otherwise, the element is unlinked and ownership
+    /// transferred to the caller. The cursor now points to the following
+    /// element.
+    pub fn unlink(&mut self) -> Option<Pin<Lrt::Ref>> {
+        let ent_node = self.get_ptr()?;
+
+        // Borrow `ent_node` as reference. Update the list position to skip
+        // the node and then update the node to be marked as unlinked.
+        {
+            // SAFETY: `ent_node` was taken from the list, and a list ensures
+            //     those were acquired via `Lrt::acquire()` and thus valid
+            //     until released. A temporary conversion to reference is thus
+            //     safe.
+            let ent_node_r = unsafe { ent_node.as_ref() };
+
+            // Unlink the node from the list. The load could be non-atomic,
+            // since the node is owned by the list. The store must be atomic,
+            // to ensure no temporary releases of the node.
+            // No data dependence, since everything is still list-owned and
+            // ordered through `self._list`.
+            self.as_pos().store(
+                ent_node_r.next.load(atomic::Relaxed),
+                atomic::Relaxed,
+            );
+
+            // Release the node. No ordering required, since any data
+            // dependence is either ordered on `self` or up to the caller.
+            ent_node_r.next.store(0, atomic::Relaxed);
+        }
+
+        // SAFETY: `ent_node` was taken from the list, and thus guaranteed
+        //     to be acquired via `Lrt::acquire()`. Since the previous entry
+        //     was updated to point to the next, the pointer is no longer
+        //     stored in the list.
+        Some(unsafe { Lrt::release(ent_node) })
+    }
+}
+
+// Convenience helpers
+impl<'list, Lrt> CursorMut<'list, Lrt>
+where
+    Lrt: util::intrusive::Link<Node>,
+{
+    /// Consume the cursor and return the element it pointed to.
+    ///
+    /// Works like [`Self::get()`], but consumes the cursor and can thus
+    /// return a borrow for `'list`.
+    pub fn get_consume(self) -> Option<Pin<&'list Lrt::Target>> {
+        let ent_node = self.get_ptr()?;
+        drop(self);
+        // SAFETY: `ent_node` was taken from the list, and a list ensures
+        //     those were acquired via `Lrt::acquire()` and thus valid
+        //     until released. Since the cursor was consumed, the entry is
+        //     valid for `'list`.
+        Some(unsafe { Lrt::borrow(ent_node) })
+    }
+
+    /// Get a reference to the element the cursor points to and move forward.
+    ///
+    /// Works like [`Self::get()`] but calls [`Self::move_next()`] afterwards,
+    /// thus returning a longer borrow.
+    pub fn get_and_move_next(&mut self) -> Option<Pin<&'list Lrt::Target>> {
+        let ent_node = self.get_ptr()?;
+        self.move_next();
+        // SAFETY: `ent_node` was taken from the list, and a list ensures
+        //     those were acquired via `Lrt::acquire()` and thus valid
+        //     until released. Since the cursor was moved forward and can never
+        //     move backwards, this node is valid for `'list`.
+        Some(unsafe { Lrt::borrow(ent_node) })
+    }
+
+    /// Link a node at the cursor position, consuming the cursor.
+    ///
+    /// Works like [`Self::try_link()`] but consumes the cursor, thus returning
+    /// a longer borrow.
+    pub fn try_link_consume(
+        mut self,
+        ent: Pin<Lrt::Ref>,
+    ) -> Result<Pin<&'list Lrt::Target>, Pin<Lrt::Ref>> {
+        match self.link(ent) {
+            Ok(v) => {
+                drop(self);
+                // SAFETY: The entry is convertible to a pinned shared
+                //     reference for as long as we do not call
+                //     `Ref::release()`. By dropping `self`, no-one can modify
+                //     the tree for as long as `'list`.
+                Ok(unsafe { Lrt::borrow(v) })
+            },
+            Err(v) => Err(v),
+        }
+    }
+}
+
+#[kunit_tests(bus1_util_slist)]
+mod test {
+    use super::*;
+
+    #[derive(Default)]
+    struct Entry {
+        key: u8,
+        node: Node,
+    }
+
+    util::field::impl_pin_field!(Entry, node, Node);
+
+    // Create a list that stores shared references. This allows access to
+    // the elements even if stored in the list. Once the list is dropped,
+    // mutable access to the elements is possible again.
+    #[test]
+    fn shared_refs() {
+        let mut e0 = core::pin::pin!(Entry { key: 0, ..Default::default() });
+        let mut e1 = core::pin::pin!(Entry { key: 1, ..Default::default() });
+
+        let mut list: List<node_of!(&Entry, node)> = List::new();
+
+        assert!(list.is_empty());
+        assert!(!e0.node.is_linked());
+        assert!(!e1.node.is_linked());
+
+        list.link_front(e0.as_ref());
+        list.link_front(e1.as_ref());
+
+        assert!(!list.is_empty());
+        assert!(e0.node.is_linked());
+        assert!(e1.node.is_linked());
+
+        assert!(list.try_link_front(e0.as_ref()).is_err());
+        assert!(list.try_link_front(e1.as_ref()).is_err());
+
+        let mut c = list.cursor_mut();
+        assert_eq!(c.get().unwrap().key, 1);
+        assert_eq!(c.get_and_move_next().unwrap().key, 1);
+        assert_eq!(c.get().unwrap().key, 0);
+        assert_eq!(c.get_and_move_next().unwrap().key, 0);
+        assert!(c.get().is_none());
+
+        assert_eq!(list.unlink_front().unwrap().key, 1);
+        assert_eq!(list.unlink_front().unwrap().key, 0);
+
+        assert!(list.unlink_front().is_none());
+        assert!(list.is_empty());
+
+        drop(list);
+        assert!(!e0.as_mut().node.is_linked());
+        assert!(!e1.as_mut().node.is_linked());
+    }
+
+    // Create a `List` that stores mutable references. This prevents any use of
+    // the entries while linked. But once the list is dropped, they can be used
+    // again.
+    #[test]
+    fn mutable_refs() {
+        let mut e0 = core::pin::pin!(Entry { key: 0, ..Default::default() });
+        let mut e1 = core::pin::pin!(Entry { key: 1, ..Default::default() });
+
+        let mut list: List<node_of!(&mut Entry, node)> = List::new();
+
+        assert!(list.is_empty());
+        assert!(!e0.node.is_linked());
+        assert!(!e1.node.is_linked());
+
+        list.link_front(e0.as_mut());
+        list.link_front(e1.as_mut());
+
+        assert!(!list.is_empty());
+
+        let mut c = list.cursor_mut();
+        assert_eq!(c.get_mut().unwrap().key, 1);
+        c.move_next();
+        assert_eq!(c.get_mut().unwrap().key, 0);
+        c.move_next();
+        assert!(c.get().is_none());
+
+        let v = list.unlink_front().unwrap();
+        assert_eq!(v.key, 1);
+        let v = list.unlink_front().unwrap();
+        assert_eq!(v.key, 0);
+
+        assert!(list.unlink_front().is_none());
+        assert!(list.is_empty());
+
+        drop(list);
+        assert!(!e0.node.is_linked());
+        assert!(!e1.node.is_linked());
+    }
+}
-- 
2.53.0

