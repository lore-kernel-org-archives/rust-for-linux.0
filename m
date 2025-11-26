Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF95A3019B1
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172582; cv=none; b=oCV/0CSghznwH3nEKUVRcd7o0eMBK8BXE2xSg7JWnB0YoP2p747eaXYxjZCE0CsOFSd/K3CLRcQGnQVbKo2FDUoHMGRYLcuSdfZUasEmOtlMlMj/XqsCpFRtGJ0QpARHtDL9L4jvXuJZ2yoYwgOZn0Mx9ht2+Aysg7TjeMcjEsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172582; c=relaxed/simple;
	bh=UwJyehoP4Y2XMfAMWtpdCSOFuhAUD33mqfLFRUFX/Is=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dp+2LfVlbf62mdI2IjXP7KijNLNz+twUx1cAnyP9TBgUqBpsLt85FVjizkxMnj3lumxR0TRqy7yTAKv+dQ+wZ4LBeVKUZKlI+DtmRRqFp6xTq1VSIxYurbm3o9Vk1XREw7qGrVahrDwsc55xLuQ8OE4KReZ3ttKMyfsWjhKpQhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fcrZ+e3+; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fcrZ+e3+"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b30184be7so3365990f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 07:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764172578; x=1764777378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdELtatd4ns6Xv3P11fU2D1lbge239E1UYYBp38T5dA=;
        b=fcrZ+e3+oL46Ed2KQkiPxluws/pdi4gzIKTSsybPMKvf5kOdki4cVBwZn6e57ILpq+
         h8zJOS9MgP2NNDOH9r8NiyLhnIZtu4zMcgNzbE9/mUE/9mtkd88BbQIrKb5TxJben78v
         yp3tOVXww/Gmr+fBUSj11OHS2LKv/eN58c/4FfOIWb4mBRUUB2OMuNzMbmR1kFRVZllr
         mdajEMOlFhe7w0K775pUHGMYNedb48zm6/hmsGr8OMdFh0VyESJqfwIK6yAeswofaID3
         Q3iAftkkIojRzSqIeYbGpBokAF7Vcpcb64myrgGaNbYOYQPi8WvCo0GzbkcjDPqLkuZb
         oHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172578; x=1764777378;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KdELtatd4ns6Xv3P11fU2D1lbge239E1UYYBp38T5dA=;
        b=CAKCC9eCD5ZUTVEgwr4sAvkxhFi7bsF9aTKVQZlO2hntKHqOIAi76gupwYn7dw7uhq
         ChdKAo5Bp+YOtYGKlAePcTIwG9bxkujHlA3tXSHWplsP5KSoktnEESbH1R4hW+oOUu8a
         MEhRB4DwmYn1dyzhv70quVkXqLK6GGJSMeHUkmPgcFRFyFdb9sw+4oOpA+bJhenhSCqI
         vI8mo1FfyMHqoC97w2QoRx5FCRVXgtC2WskJtwzWlBbizfhlGHtPcg7lxNCB96lwKuJ5
         Lbb0DW0Kx8A0cOyRtY23bumVjJrdCfTMfwQcPSBCZQae1bkQpu8y6NYqz9OA8tgWHsiP
         pDBg==
X-Forwarded-Encrypted: i=1; AJvYcCVpu96B3x7ug5dVC/LIHXlUk9141chHErLQ0J/kwP4+2kMxW+shbM6FV6MNJWkaVyS4AdTbA2O7AwtdwcEwmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRN8N6EYGmsk2mYnhy+4FJeFfv8fA5KyKgTIcOUCSP5Gey4Q+K
	N7Ess3cLOgeI77ZPl6Ij3B1J6yXZutzbqUNcmuEBADwUcqW2UzKh0AeZQo/1+aQEm2Iw8U3hBsb
	nw5ISq3A0aTqXk2dWTw==
X-Google-Smtp-Source: AGHT+IGiwEd7eTxZ9yownKmkq+95ckQThdGfCWdRYXL3VC8aaXA63NY3zD0XDMVXiR8uahjKd1m9eGxoD1qpmVA=
X-Received: from wrsa18.prod.google.com ([2002:adf:fad2:0:b0:429:c4e9:62a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d82:0:b0:42b:5567:857f with SMTP id ffacd0b85a97d-42cc1d525acmr22774950f8f.50.1764172578671;
 Wed, 26 Nov 2025 07:56:18 -0800 (PST)
Date: Wed, 26 Nov 2025 15:56:17 +0000
In-Reply-To: <aScdN-iBwazEBaFk@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
 <20251125-binder-bitmap-v6-6-dedaf1d05a98@google.com> <aSZlZu0SNycNvk4q@yury>
 <aSa764le50AiUe4p@google.com> <aScdN-iBwazEBaFk@yury>
Message-ID: <aScjITkN3sXT-pFQ@google.com>
Subject: Re: [PATCH v6 6/6] rust_binder: use bitmap for allocation of handles
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 10:31:03AM -0500, Yury Norov wrote:
> On Wed, Nov 26, 2025 at 08:35:55AM +0000, Alice Ryhl wrote:
> > On Tue, Nov 25, 2025 at 09:26:46PM -0500, Yury Norov wrote:
> > > On Tue, Nov 25, 2025 at 01:59:42PM +0000, Alice Ryhl wrote:
> > > > To find an unused Binder handle, Rust Binder currently iterates the
> > > > red/black tree from the beginning until it finds a gap in the keys.=
 This
> > > > is extremely slow.
> > > >=20
> > > > To improve the performance, add a bitmap that keeps track of which
> > > > indices are actually in use. This allows us to quickly find an unus=
ed
> > > > key in the red/black tree.
> > > >=20
> > > > For a benchmark, please see the below numbers that were obtained fr=
om
> > > > modifying binderThroughputTest to send a node with each transaction=
 and
> > > > stashing it in the server. This results in the number of nodes
> > > > increasing by one for every transaction sent. I got the following t=
able
> > > > of roundtrip latencies (in =C2=B5s):
> > > >=20
> > > > Transaction Range =E2=94=82 Baseline (Rust) =E2=94=82 Bitmap (Rust)=
 =E2=94=82 Comparison (C)
> > > > 0 - 10,000        =E2=94=82          176.88 =E2=94=82         92.93=
 =E2=94=82          99.41
> > > > 10,000 - 20,000   =E2=94=82          437.37 =E2=94=82         87.74=
 =E2=94=82          98.55
> > > > 20,000 - 30,000   =E2=94=82          677.49 =E2=94=82         76.24=
 =E2=94=82          96.37
> > > > 30,000 - 40,000   =E2=94=82          901.76 =E2=94=82         83.39=
 =E2=94=82          96.73
> > > > 40,000 - 50,000   =E2=94=82         1126.62 =E2=94=82        100.44=
 =E2=94=82          94.57
> > > > 50,000 - 60,000   =E2=94=82         1288.98 =E2=94=82         94.38=
 =E2=94=82          96.64
> > > > 60,000 - 70,000   =E2=94=82         1588.74 =E2=94=82         88.27=
 =E2=94=82          96.36
> > > > 70,000 - 80,000   =E2=94=82         1812.97 =E2=94=82         93.97=
 =E2=94=82          91.24
> > > > 80,000 - 90,000   =E2=94=82         2062.95 =E2=94=82         92.22=
 =E2=94=82         102.01
> > > > 90,000 - 100,000  =E2=94=82         2330.03 =E2=94=82         97.18=
 =E2=94=82         100.31
> > > >=20
> > > > It should be clear that the current Rust code becomes linearly slow=
er
> > > > per insertion as the number of calls to rb_next() per transaction
> > > > increases. After this change, the time to find an ID number appears
> > > > constant. (Technically it is not constant-time as both insertion an=
d
> > > > removal scan the entire bitmap. However, quick napkin math shows th=
at
> > > > scanning the entire bitmap with N=3D100k takes ~1.5=C2=B5s, which i=
s neglible
> > > > in a benchmark where the rountrip latency is 100=C2=B5s.)
> > > >=20
> > > > I've included a comparison to the C driver, which uses the same bit=
map
> > > > algorithm as this patch since commit 15d9da3f818c ("binder: use bit=
map
> > > > for faster descriptor lookup").
> > >=20
> > > Thanks for the solid numbers!
> > >=20
> > > > This currently checks if the bitmap should be shrunk after every
> > > > removal. One potential future change is introducing a shrinker to m=
ake
> > > > this operation O(1), but based on the benchmark above this does not=
 seem
> > > > required at this time.
> > > >=20
> > > > Reviewed-by: Burak Emir <bqe@google.com>
> > > > Acked-by: Carlos Llamas <cmllamas@google.com>
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > >  drivers/android/binder/process.rs | 64 +++++++++++++++++++++++++++=
+-----------
> > > >  1 file changed, 47 insertions(+), 17 deletions(-)
> > > >=20
> > > > diff --git a/drivers/android/binder/process.rs b/drivers/android/bi=
nder/process.rs
> > > > index f13a747e784c84a0fb09cbf47442712106eba07c..9264961fd92b33c07fc=
d5353740cc0b1ec978afd 100644
> > > > --- a/drivers/android/binder/process.rs
> > > > +++ b/drivers/android/binder/process.rs
> > > > @@ -19,6 +19,7 @@
> > > >      cred::Credential,
> > > >      error::Error,
> > > >      fs::file::{self, File},
> > > > +    id_pool::IdPool,
> > > >      list::{List, ListArc, ListArcField, ListLinks},
> > > >      mm,
> > > >      prelude::*,
> > > > @@ -367,6 +368,8 @@ impl ListItem<{Self::LIST_NODE}> for NodeRefInf=
o {
> > > >  struct ProcessNodeRefs {
> > > >      /// Used to look up nodes using the 32-bit id that this proces=
s knows it by.
> > > >      by_handle: RBTree<u32, ListArc<NodeRefInfo, { NodeRefInfo::LIS=
T_PROC }>>,
> > > > +    /// Used to quickly find unused ids in `by_handle`.
> > > > +    handle_is_present: IdPool,
> > > >      /// Used to look up nodes without knowing their local 32-bit i=
d. The usize is the address of
> > > >      /// the underlying `Node` struct as returned by `Node::global_=
id`.
> > > >      by_node: RBTree<usize, u32>,
> > > > @@ -381,6 +384,7 @@ impl ProcessNodeRefs {
> > > >      fn new() -> Self {
> > > >          Self {
> > > >              by_handle: RBTree::new(),
> > > > +            handle_is_present: IdPool::new(),
> > > >              by_node: RBTree::new(),
> > > >              freeze_listeners: RBTree::new(),
> > > >          }
> > > > @@ -775,7 +779,7 @@ pub(crate) fn get_node(
> > > >      pub(crate) fn insert_or_update_handle(
> > > >          self: ArcBorrow<'_, Process>,
> > > >          node_ref: NodeRef,
> > > > -        is_mananger: bool,
> > > > +        is_manager: bool,
> > > >      ) -> Result<u32> {
> > > >          {
> > > >              let mut refs =3D self.node_refs.lock();
> > > > @@ -794,7 +798,33 @@ pub(crate) fn insert_or_update_handle(
> > > >          let reserve2 =3D RBTreeNodeReservation::new(GFP_KERNEL)?;
> > > >          let info =3D UniqueArc::new_uninit(GFP_KERNEL)?;
> > > > =20
> > > > -        let mut refs =3D self.node_refs.lock();
> > > > +        let mut refs_lock =3D self.node_refs.lock();
> > > > +        let mut refs =3D &mut *refs_lock;
> > > > +
> > > > +        let (unused_id, by_handle_slot) =3D loop {
> > > > +            // ID 0 may only be used by the manager.
> > > > +            let start =3D if is_manager { 0 } else { 1 };
> > > > +
> > > > +            if let Some(res) =3D refs.handle_is_present.find_unuse=
d_id(start) {
> > > > +                match refs.by_handle.entry(res.as_u32()) {
> > > > +                    rbtree::Entry::Vacant(entry) =3D> break (res, =
entry),
> > > > +                    rbtree::Entry::Occupied(_) =3D> {
> > > > +                        pr_err!("Detected mismatch between handle_=
is_present and by_handle");
> > > > +                        res.acquire();
> > > > +                        kernel::warn_on!(true);
> > > > +                        return Err(EINVAL);
> > >=20
> > > EINVAL means that user provides a wrong parameter. Here's a data
> > > corruption. Maybe EFAULT?
> >=20
> > Hmm ... EFAULT is used when the user passes a dangling pointer that
> > copy_from_user() refuses to use. I would like to avoid confusion with
> > that as well. Is there a third option?
> >=20
> > > > +                    }
> > > > +                }
> > > > +            }
> > > > +
> > > > +            let grow_request =3D refs.handle_is_present.grow_reque=
st().ok_or(ENOMEM)?;
> > > > +            drop(refs_lock);
> > > > +            let resizer =3D grow_request.realloc(GFP_KERNEL)?;
> > > > +            refs_lock =3D self.node_refs.lock();
> > > > +            refs =3D &mut *refs_lock;
> > > > +            refs.handle_is_present.grow(resizer);
> > >=20
> > > This continues puzzling me. Refs_lock protects refs, and the spec
> > > says:
> > >=20
> > >     a reference=E2=80=99s scope starts from where it is introduced an=
d
> > >     continues through the last time that reference is used.
> > >=20
> > > https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html
> > >=20
> > > The last usage of refs is at .grow_request() line, because later it's
> > > reused with the new value.=20
> > >=20
> > > If my reading of the spec is correct, after dropping the refs_lock,
> > > you may get rescheduled, and another thread may follow the same path.
> > > Because refs_lock is dropped explicitly and refs - implicitly, the
> > > concurrent thread can grab both and follow with resizing the id map.
> > >=20
> > > When your first thread will get back, you'll end up resizing the
> > > already resized map.
> > >=20
> > > I asked your AI, and it says that this race is indeed possible for
> > > exactly that reason. But it doesn't break memory safety, so the
> > > compiler is happy about it...
> >=20
> > You're right that since we release the mutex, someone else may have
> > resized the map in the meantime. That's why we implemented grow() to do
> > nothing if it was already resized:
> >=20
> > 	pub fn grow(&mut self, mut resizer: PoolResizer) {
> > 	    // Between request to grow that led to allocation of `resizer` and=
 now,
> > 	    // another thread may have already grown the capacity.
> > 	    // In this case, do nothing, drop `resizer` and move on.
> > 	    if resizer.new.len() <=3D self.capacity() {
> > 	        return;
> > 	    }
> > =09
> > 	    resizer.new.copy_and_extend(&self.map);
> > 	    self.map =3D resizer.new;
> > 	}
>=20
> OK, I see...
>=20
> I expected that you'll switch the pool state to 'growing' before
> dropping the ref_lock. This way, the concurrent thread would be able
> to go straight to the new iteration.
>=20
> Something like:
>        =20
>         if let Some(res) =3D refs.handle_is_present.find_unused_id(start)=
 {
>                 ...
>         }
>=20
>         if refs.is_growing() {
>                 drop(refs_lock);
>                 continue;
>         }
>         let grow_request =3D refs.handle_is_present.grow_request().ok_or(=
ENOMEM)?;
>         refs.set_growing()
>         drop(refs_lock);
>         let resizer =3D grow_request.realloc(GFP_KERNEL)?;
>         ...
>=20
> Your approach also works, assuming you're OK with a useless alloc/free
> bitmaps in the case of collision.

Hmm, having the extra ones just repeatedly lock/unlock also isn't great.
I guess one alternate option could be to have a separate mutex that you
take while allocating, but ehh I think the current logic is fine.

> So, I can take this series as is, or I can wait for v7 if you prefer.
>=20
> Please advise.

Sure, go ahead! And thanks for the reviews!

Alice
