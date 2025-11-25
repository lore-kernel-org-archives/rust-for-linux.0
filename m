Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082BF326952
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079206; cv=none; b=W3uLg6BbgZkfEpIb1YZID7anhZGyfqerPGglQm2AeJgODBWfzeyPtczcQVj5rzHFGp78hrSAVl/oZdbTcRz9TW327NIjtdRGvir7lUheVNlSbzHMhO6V4PWWaPWF8qKJNoADgSp9mkDii5pGkqvrjlihIVS5jKFvjQTPaalit3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079206; c=relaxed/simple;
	bh=o2N3QTu1+TpHMRp7/UKL4YXJK7hQjrcHGLKV8tDPliE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h7SbENyItgxjESknzUlctZxZdhf1zgh9PY5t57fGTmflWnGvLy5tB8HBDTq9YIrGlQeNsxD259o2FtMnokdl22rSPxAJMhvF6iUFyVWi4AsbsybvyhER/PD4Zi8IZBCK6etBQYIpy6/rnuUvjgX0QXywMDdeqrWAhg/X1zAhlL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MlOQMypY; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MlOQMypY"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b2c8fb84fso2960904f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 06:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764079202; x=1764684002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGRza4M1pvLiwn7tj6C+02QbTQCMU0dR2sE428029ts=;
        b=MlOQMypYBcFLiTgd/RuU0vn053tPNrFTqt0DMvdenkMmT2yV9B131MwWVMr9AbFCsx
         SFqwTteV3IdrIcdGv/zEcdYI2UIDGX50OmmVe1/nxSZL3wTrBQFjIs9V1DJdTLp0A3E4
         klat2HLCev3PEXOfVgi1XHnBosixvnBldPBC4xT8Fn+WVD9p7dRy0AUi12/VM+gnEZwG
         p15DN0PojYz23l5NhyVr6W4/d9kHYvfLMgmWTWSxdRo2DAZDfmNHtBPdm7j1PeyXnkos
         Vz6rorIHw1CU4KH2iuAr2j31kbyPwRLAzCxtMuRr9gPcCcPC9Ic0BFfRmvqHr3ufJDH8
         KZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079202; x=1764684002;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oGRza4M1pvLiwn7tj6C+02QbTQCMU0dR2sE428029ts=;
        b=GQ4WZD0DIUL1avC8S/lZ5Wc1q9Hvcgw/z9lvoeLsw6HpJMhAk+LI9gAPto2nMW4Oyb
         SwY+n68y1Ru55phZHUyYh2h3vLc0kbZ6oyDuaVvL3TUv0jEvg3lCiBd4YtnbU1jTiuGo
         WB7s+xSJVdyoC3mGkZl/lZ5IIvMbE519VG9aHn9yDxbjHvhMkPBe4u9VCQX9pubay/x6
         1lXoFgsFHeeIIATdB2Gi/Qx0T/ASq+YQK5g8vQFFPfHnx7Wveio3IGdPIjyoXIFWhm6S
         jZPrtG4rfy8u6GmHzoZN94PwMf8kQhC4ZDGG2pLV2kkpS/dF1Ez201TiwQ/fl5Y+E7Ix
         lfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVU6o/J8f+rPo7SEwwMr5xSUgvdOnmjPUk7cTe+oAax1bt4xK7xtVvqitf6rKPxSKcAsZPXTIYk4BzDsQ/eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGHXwK+izJECUqU9TEufxC9cjBpePv+aONvxsT0cIbfrWGN33j
	q7RCEF32OGUM0vhGNgF9QrxGhrwwrLJjaBPggOJU53J3dWVAfZs+3aqsbQhGokPKuoFT6VWqQWk
	FSmbwrXLjqHE80bQ6Qg==
X-Google-Smtp-Source: AGHT+IFqMq1h9VtUtjJ5kcjKhLjZ5lZrXHgiJw5nTw1vx/wOcwekxQ4A5Ui2hRyg2ND1oa2t6HYRjpic9BVbecQ=
X-Received: from wrwl12.prod.google.com ([2002:a5d:674c:0:b0:42c:c2d6:29c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:615:b0:429:8b01:c093 with SMTP id ffacd0b85a97d-42e0f213973mr2990207f8f.15.1764079202514;
 Tue, 25 Nov 2025 06:00:02 -0800 (PST)
Date: Tue, 25 Nov 2025 13:59:42 +0000
In-Reply-To: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=8245; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Ic10crWh9Vr+03Eo7YRbZ+ys+i8McD15VGekocwJfcs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpJbZYXXyMpUsJ9dQHttG2KSTBIdKZ/TQC57u+o
 o81t0za4A+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSW2WAAKCRAEWL7uWMY5
 RoOLD/9IVkKK/a1jvavrP5MKXLO1AOJOfnXR+oYb2JaJw8G2KD1zEJ7hUsoAoR7qe/oeXW8r2T5
 N2gqvyYrxyIKyD3U6hQ2EICjO9hhzoRZDZfvqSSEPlrslGpA+5zxAjY2wnKhiO1LodANN7yZ6g2
 WbawLbV/Y92v8rGoPLIEioy4V1xo+5qxctHhLbBUvFbmoxHS2hCt+3dzXaQw8rmlD0PUnIeejDw
 G1m6nDtndA9B8RVxuKcHuD1Zo4+yXqY+Wp/Z1dc2ELFCZGPyPYdmpfZpQu9ZShzMiCg8x6mYnZe
 neHQQP5hszYD/bkKGTX2tipFy9UtFrMIJgzi8v2iveXCrG13TOh6is49Jj9/GFRu8blclRxfjLl
 5zBk4Kq9VC4cBAmyf2tHbHVD14m4xKiiWvDvpUELSmJvcemxX3KBVjmir2VElLBkWjkkCfPDOu3
 h2r0xNb0xWUaqdd3ovDHzq2xqH3y13IctjiRKHGSDq1PbPYV9BUXJw/iaTKATbHLFp4/KxPYxba
 Z0dMNpHAcMJnGGKukNKfUC78CbgU11fYfTh5Hd+6PqUoxJ3AxY5dKIvanKfW4HUQtJKyNDAKUu/
 SqJVVPQhf4ijCidcfyrn4cnzM8hFUMMYjO5DlDt1Y+MWftoPsMuZsZZCVbv+m+LbJ4UQG4P+KyD TByLYIlFF21o4Jg==
X-Mailer: b4 0.14.2
Message-ID: <20251125-binder-bitmap-v6-6-dedaf1d05a98@google.com>
Subject: [PATCH v6 6/6] rust_binder: use bitmap for allocation of handles
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To find an unused Binder handle, Rust Binder currently iterates the
red/black tree from the beginning until it finds a gap in the keys. This
is extremely slow.

To improve the performance, add a bitmap that keeps track of which
indices are actually in use. This allows us to quickly find an unused
key in the red/black tree.

For a benchmark, please see the below numbers that were obtained from
modifying binderThroughputTest to send a node with each transaction and
stashing it in the server. This results in the number of nodes
increasing by one for every transaction sent. I got the following table
of roundtrip latencies (in =C2=B5s):

Transaction Range =E2=94=82 Baseline (Rust) =E2=94=82 Bitmap (Rust) =E2=94=
=82 Comparison (C)
0 - 10,000        =E2=94=82          176.88 =E2=94=82         92.93 =E2=94=
=82          99.41
10,000 - 20,000   =E2=94=82          437.37 =E2=94=82         87.74 =E2=94=
=82          98.55
20,000 - 30,000   =E2=94=82          677.49 =E2=94=82         76.24 =E2=94=
=82          96.37
30,000 - 40,000   =E2=94=82          901.76 =E2=94=82         83.39 =E2=94=
=82          96.73
40,000 - 50,000   =E2=94=82         1126.62 =E2=94=82        100.44 =E2=94=
=82          94.57
50,000 - 60,000   =E2=94=82         1288.98 =E2=94=82         94.38 =E2=94=
=82          96.64
60,000 - 70,000   =E2=94=82         1588.74 =E2=94=82         88.27 =E2=94=
=82          96.36
70,000 - 80,000   =E2=94=82         1812.97 =E2=94=82         93.97 =E2=94=
=82          91.24
80,000 - 90,000   =E2=94=82         2062.95 =E2=94=82         92.22 =E2=94=
=82         102.01
90,000 - 100,000  =E2=94=82         2330.03 =E2=94=82         97.18 =E2=94=
=82         100.31

It should be clear that the current Rust code becomes linearly slower
per insertion as the number of calls to rb_next() per transaction
increases. After this change, the time to find an ID number appears
constant. (Technically it is not constant-time as both insertion and
removal scan the entire bitmap. However, quick napkin math shows that
scanning the entire bitmap with N=3D100k takes ~1.5=C2=B5s, which is neglib=
le
in a benchmark where the rountrip latency is 100=C2=B5s.)

I've included a comparison to the C driver, which uses the same bitmap
algorithm as this patch since commit 15d9da3f818c ("binder: use bitmap
for faster descriptor lookup").

This currently checks if the bitmap should be shrunk after every
removal. One potential future change is introducing a shrinker to make
this operation O(1), but based on the benchmark above this does not seem
required at this time.

Reviewed-by: Burak Emir <bqe@google.com>
Acked-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 64 ++++++++++++++++++++++++++++-------=
----
 1 file changed, 47 insertions(+), 17 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/pro=
cess.rs
index f13a747e784c84a0fb09cbf47442712106eba07c..9264961fd92b33c07fcd5353740=
cc0b1ec978afd 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -19,6 +19,7 @@
     cred::Credential,
     error::Error,
     fs::file::{self, File},
+    id_pool::IdPool,
     list::{List, ListArc, ListArcField, ListLinks},
     mm,
     prelude::*,
@@ -367,6 +368,8 @@ impl ListItem<{Self::LIST_NODE}> for NodeRefInfo {
 struct ProcessNodeRefs {
     /// Used to look up nodes using the 32-bit id that this process knows =
it by.
     by_handle: RBTree<u32, ListArc<NodeRefInfo, { NodeRefInfo::LIST_PROC }=
>>,
+    /// Used to quickly find unused ids in `by_handle`.
+    handle_is_present: IdPool,
     /// Used to look up nodes without knowing their local 32-bit id. The u=
size is the address of
     /// the underlying `Node` struct as returned by `Node::global_id`.
     by_node: RBTree<usize, u32>,
@@ -381,6 +384,7 @@ impl ProcessNodeRefs {
     fn new() -> Self {
         Self {
             by_handle: RBTree::new(),
+            handle_is_present: IdPool::new(),
             by_node: RBTree::new(),
             freeze_listeners: RBTree::new(),
         }
@@ -775,7 +779,7 @@ pub(crate) fn get_node(
     pub(crate) fn insert_or_update_handle(
         self: ArcBorrow<'_, Process>,
         node_ref: NodeRef,
-        is_mananger: bool,
+        is_manager: bool,
     ) -> Result<u32> {
         {
             let mut refs =3D self.node_refs.lock();
@@ -794,7 +798,33 @@ pub(crate) fn insert_or_update_handle(
         let reserve2 =3D RBTreeNodeReservation::new(GFP_KERNEL)?;
         let info =3D UniqueArc::new_uninit(GFP_KERNEL)?;
=20
-        let mut refs =3D self.node_refs.lock();
+        let mut refs_lock =3D self.node_refs.lock();
+        let mut refs =3D &mut *refs_lock;
+
+        let (unused_id, by_handle_slot) =3D loop {
+            // ID 0 may only be used by the manager.
+            let start =3D if is_manager { 0 } else { 1 };
+
+            if let Some(res) =3D refs.handle_is_present.find_unused_id(sta=
rt) {
+                match refs.by_handle.entry(res.as_u32()) {
+                    rbtree::Entry::Vacant(entry) =3D> break (res, entry),
+                    rbtree::Entry::Occupied(_) =3D> {
+                        pr_err!("Detected mismatch between handle_is_prese=
nt and by_handle");
+                        res.acquire();
+                        kernel::warn_on!(true);
+                        return Err(EINVAL);
+                    }
+                }
+            }
+
+            let grow_request =3D refs.handle_is_present.grow_request().ok_=
or(ENOMEM)?;
+            drop(refs_lock);
+            let resizer =3D grow_request.realloc(GFP_KERNEL)?;
+            refs_lock =3D self.node_refs.lock();
+            refs =3D &mut *refs_lock;
+            refs.handle_is_present.grow(resizer);
+        };
+        let handle =3D unused_id.as_u32();
=20
         // Do a lookup again as node may have been inserted before the loc=
k was reacquired.
         if let Some(handle_ref) =3D refs.by_node.get(&node_ref.node.global=
_id()) {
@@ -804,20 +834,9 @@ pub(crate) fn insert_or_update_handle(
             return Ok(handle);
         }
=20
-        // Find id.
-        let mut target: u32 =3D if is_mananger { 0 } else { 1 };
-        for handle in refs.by_handle.keys() {
-            if *handle > target {
-                break;
-            }
-            if *handle =3D=3D target {
-                target =3D target.checked_add(1).ok_or(ENOMEM)?;
-            }
-        }
-
         let gid =3D node_ref.node.global_id();
         let (info_proc, info_node) =3D {
-            let info_init =3D NodeRefInfo::new(node_ref, target, self.into=
());
+            let info_init =3D NodeRefInfo::new(node_ref, handle, self.into=
());
             match info.pin_init_with(info_init) {
                 Ok(info) =3D> ListArc::pair_from_pin_unique(info),
                 // error is infallible
@@ -838,9 +857,10 @@ pub(crate) fn insert_or_update_handle(
         // `info_node` into the right node's `refs` list.
         unsafe { info_proc.node_ref2().node.insert_node_info(info_node) };
=20
-        refs.by_node.insert(reserve1.into_node(gid, target));
-        refs.by_handle.insert(reserve2.into_node(target, info_proc));
-        Ok(target)
+        refs.by_node.insert(reserve1.into_node(gid, handle));
+        by_handle_slot.insert(info_proc, reserve2);
+        unused_id.acquire();
+        Ok(handle)
     }
=20
     pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResult=
<NodeRef> {
@@ -905,6 +925,16 @@ pub(crate) fn update_ref(
                 let id =3D info.node_ref().node.global_id();
                 refs.by_handle.remove(&handle);
                 refs.by_node.remove(&id);
+                refs.handle_is_present.release_id(handle as usize);
+
+                if let Some(shrink) =3D refs.handle_is_present.shrink_requ=
est() {
+                    drop(refs);
+                    // This intentionally ignores allocation failures.
+                    if let Ok(new_bitmap) =3D shrink.realloc(GFP_KERNEL) {
+                        refs =3D self.node_refs.lock();
+                        refs.handle_is_present.shrink(new_bitmap);
+                    }
+                }
             }
         } else {
             // All refs are cleared in process exit, so this warning is ex=
pected in that case.

--=20
2.52.0.460.gd25c4c69ec-goog

