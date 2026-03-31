Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A47C3A2553
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983947; cv=none; b=Hcni4NkgudZEOaOJOkSpPn1Xd3KQMIyCXCUuBlAXqe0atVZ3jMwOEPjcybBJ6dmurBPVXOWAYHYpvyVWxvKrAjXu+I2OQGkI5IEu2Dg1ufqwfBEVVzgsW7njVCEbypDR0GeHdHNeUubKzh0yCrFCH7qIGHM/AaRcwAlFNhSk/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983947; c=relaxed/simple;
	bh=lwKnP9AcUoI4XlC1kHKzYFBjiR1bGKZiRyU29DC//yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHW/XCi/T0gzfDWJlW1OMSIyu0F2K3N6ATbXJVZAMepKOEucZXGnGCB0qcbFIvL58stYUNpLxmZHukUaBNdiqPADZQmiv0AeGyx9bXoFBafKKg2PMX95BGS9ZNUmKtFtFzcFGTVgvNtlWkUYsVgBgI1OEVmsoAWCUYwnbJSzVtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=jAe5eeZG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mPiLuk7P; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="jAe5eeZG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mPiLuk7P"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 995AD1D000D7;
	Tue, 31 Mar 2026 15:05:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 31 Mar 2026 15:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983944; x=
	1775070344; bh=N3weLMwkjnFpdInMoaozR5EQv8zxWVzHKm36IMxJIiQ=; b=j
	Ae5eeZGCIZHzWF8HH07KTHDufWsl4Zyk/M8dmWRThybqKDcMJ0UjdaRsE5bXyKSI
	qbfNN60RN1OAmmtZta5E0gNothYpd6qFLP+vmp6B99mZbq8dhH8GsfdMRDVedYpS
	9l/D6K6ww06TkvxmMhKf8TUxDG2HA0cFMg50aHmEU43DUexuSW5DhTruOxvzSAjK
	dMHFyoJF5I3IskZFg+y2dJhJxVlI+attpwzG/WotCsRVbwYJSKQjtYVw1pq5mFA+
	B8r2h5AI1SQalhp0wJYwPkX45qR9hvJ0x1F8aMnCjDw0Y60CmXCv7+vst3Gf5OME
	VnBt6Xf8Sj85Cs/+zreAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983944; x=1775070344; bh=N
	3weLMwkjnFpdInMoaozR5EQv8zxWVzHKm36IMxJIiQ=; b=mPiLuk7PjZ1gbfmYk
	5Pmagwpo9hTbaw+lHz4+n2Pd+P9vbvaN4m7bCy5vkELATTSLELGl07TcxX0QrURN
	1lUYHIsrTHj1/+rKhDmchMdRNaBus87H8Ggw5jcQqhqUFU0DaqS7sLXJFTbgYLCO
	IkZImHVNbHL361s/1PPIoeCYz5n+D2zHhEARQDdsALmg7p710KDiCSrczno8IEDV
	8VViKNLG74K9TWWN+I4o5pYiLOFeg+UZ4EEQtQcS8P1uuiVtOEzmjlSdtuX/vqa6
	VB58Uu6Barr0v+l+5qqY23ocPE6tHGNOA+1Kq0XKj6GMI0gkpLWrhMcZLeP2ATW8
	BbpRw==
X-ME-Sender: <xms:CBvMaYtj7OMcvXPuz6l6cXGvE-DPVjOwLlcu9nDOTE8UseTW1chsqA>
    <xme:CBvMaccEaB5hikKb0uhwyKXqDaC9Se2wNioIwmItkBOSoDtNg-4j5zxzVDUnInIU5
    -pjnm7Hqsorpo_V8ISAjGprVbNfiCQAif_dXdOXYLD2N_-iR-7x8YKV>
X-ME-Received: <xmr:CBvMaYzg8s05iDw13OADYtdkUTjO45zs7V8wEuHwkdOTaKIRezLuIofqjBF5OGKhcLqP7T3JRzLcHhVcnn1wijwVNJGjbdxnSCRsz4d0Z0b1Uodj7Qd9DeONVz7GrJ8SsyAqAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhephfehgfdvueefuedvkeekueekieeutefhteetteetudfgkeetgfejiefhuedu
    geefnecuffhomhgrihhnpehpthhrrdgrshenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegurghvihgusehrvggruggrhhgvrggurdgvuhdpnhgs
    pghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqd
    hfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthgv
    ghesjhhklhhmrdhnohdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegurghvihgusehrvggruggrhhgvrggurdgvuh
X-ME-Proxy: <xmx:CBvMaaFxVyjHxKcKcVeY3ExuBZ52MbRJIwFTq_pSxcraEf4qweuUSw>
    <xmx:CBvMaUw9_8jRwXWWQoMrrdwinLs87qTlC-qFdHVInVHByCWasukcmg>
    <xmx:CBvMaTuvZZ45azxzneefNLcGXVYEtjVRjysBAG1Bescu-zxqVfGgIg>
    <xmx:CBvMaZ2xCQk1VKp3zBYuLBonNDLU1vYqmsUCoc5UAe3eRCiN1F2hfA>
    <xmx:CBvMaefj7IAVHQ3hwQr41kdtszOzCvOzCWQ6uVxMttQbOhtqRINs_mjY>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:42 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 02/16] rust/sync: add Arc::drop_unless_unique()
Date: Tue, 31 Mar 2026 21:02:54 +0200
Message-ID: <20260331190308.141622-3-david@readahead.eu>
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

Introduce `Arc::drop_unless_unique()`, a rust version of
`refcount_dec_not_one()`.

It is very common to store an object with `struct kref` (or
`refcount_t`) in a locked lookup-tree, but without the tree actually
owning a reference. Instead, whenever the object is destroyed, it
should be removed from the lookup tree.

The problem is, this requires taking the lock whenever releasing a
reference. Otherwise, a racing lookup might see a ref-count of 0. But
this is needlessly expensive.

One solution provided by `struct kref` is `kref_put_mutex()`. This drops
a reference, unless it is the last reference. In that case it takes a
mutex and tries again. If it no longer is the last reference, it simply
unlocks and returns. But if it dropped the last reference, it calls the
destructor with the lock held.

This entire technique is built around `refcount_dec_not_one()`. Expose
this exact feature in Rust, so it can be used to get the same effect as
`kref_put_mutex()`.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 rust/kernel/sync/arc.rs      | 21 +++++++++++++++++++++
 rust/kernel/sync/refcount.rs | 16 ++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 921e19333b89..ead021a0dd5d 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -368,6 +368,27 @@ pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
             None
         }
     }
+
+    /// Drop this [`Arc`] unless it is the last reference.
+    ///
+    /// When this is the last reference to the `Arc`, it is returned as `Some`
+    /// unmodified. Otherwise, the `Arc` is dropped and [`None`] is returned.
+    ///
+    /// This function will never release the last reference to the object, and
+    /// as such never call its destructor.
+    pub fn drop_unless_unique(this: Self) -> Option<Self> {
+        let this = ManuallyDrop::new(this);
+
+        // SAFETY: We own a refcount, so the pointer is still valid.
+        if unsafe { this.ptr.as_ref() }.refcount.dec_not_one() {
+            // A single ref-count was dropped, but it was not the last. We
+            // manually drop `this` without invoking `Drop`.
+            None
+        } else {
+            // This was a no-op, return the reference to the caller.
+            Some(ManuallyDrop::into_inner(this))
+        }
+    }
 }
 
 // SAFETY: The pointer returned by `into_foreign` was originally allocated as an
diff --git a/rust/kernel/sync/refcount.rs b/rust/kernel/sync/refcount.rs
index 6c7ae8b05a0b..2a65b3e3f961 100644
--- a/rust/kernel/sync/refcount.rs
+++ b/rust/kernel/sync/refcount.rs
@@ -105,6 +105,22 @@ pub fn dec_and_test(&self) -> bool {
         // SAFETY: `self.as_ptr()` is valid.
         unsafe { bindings::refcount_dec_and_test(self.as_ptr()) }
     }
+
+    /// Decrement a refcount if it is not 1.
+    ///
+    /// It will `WARN` on underflow and fail to decrement when saturated.
+    ///
+    /// Provides release memory ordering when succeeding in decrementing the
+    /// refcount.
+    ///
+    /// Returns true if the decrement operation succeeded, false if the
+    /// decrement operation was skipped as the refcount is 1.
+    #[inline]
+    #[must_use = "refcount release is conditional and must be checked"]
+    pub fn dec_not_one(&self) -> bool {
+        // SAFETY: `self.as_ptr()` is valid.
+        unsafe { bindings::refcount_dec_not_one(self.as_ptr()) }
+    }
 }
 
 // SAFETY: `refcount_t` is thread-safe.
-- 
2.53.0

