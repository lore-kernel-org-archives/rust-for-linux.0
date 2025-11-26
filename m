Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8230D33CE91
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174154; cv=none; b=LQ8idWpAk9g+29r8M8zBNVr45a1e4LrgQl15Wgde1lzyIajt2WOQUFF7FToiUJohKiknA9YS2rQRr7JeYkwNzf23esJ4Ri77cTfegpv5c69Ux+JOVi/tTnn7gnf8jyVA+s8KWGCJ1/gZ857+1gxuBp6InTR92wHjCLsjO7BYins=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174154; c=relaxed/simple;
	bh=T9ZZwppGmyyrv7O7Qo7Gsd6S7bK4jXJiajs6bHArKtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rt5Zt/9GqQxW3xHs4vJmstPa2RDsbzZUDivwADPrgKj7IWnDxsi1lwNW6tlvvKYEUrD/iDze7+o7w73tsMb793XumBFR1ZmLU26IVDdLF16ww0eVVGcPBxiP/nDXWbFqcr4hc8C6VVrPgzOCMCdtnI9p/YQGEed4rqsjCCPYLaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pxokWTtE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pxokWTtE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477563e28a3so7698105e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 08:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764174151; x=1764778951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJr+OwUyLYoVw8jTFhKyk0td9xyGpzlApdCAB3AQK9s=;
        b=pxokWTtEWrMhb1hZeHlL40DrRTOZ71nzTFhanlT8syB0nNtZybAnT9Oq/qfUCvWfVt
         nbd75Tulp8adxpGEfPUt8BGCDZhDgBPhsdFXIDFLVca8poOB0UkEXQdA4Z+PStR/DqVx
         K6TGrDWNAeyzbZS+iYc8hAW0IvNvQBFJxshrOp6Jl56NF07zulzRDHF2tK1r5LiYuh4X
         yYCTz7DPm/OFZsRfZpoVpSqJSBRrq7236PkaCctC3v5Jo3H8sIrEDV8CkZUKVwYwrb+s
         MW+wYjqXx0ts7o6jrazhtUM5qJ8z82xYUPJLEyAbu4kqdggH0ssa2YmL8SztnICBnXs8
         3lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764174151; x=1764778951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bJr+OwUyLYoVw8jTFhKyk0td9xyGpzlApdCAB3AQK9s=;
        b=ggHwawL2HlxRTtHEnqSF/VkaZc5oTPKY5MRk97DTk3z8K6xMHrXZiv9rmQbq6Wgnb1
         iqnfk+XC80e7j0mhspCGY40ttxSdoHRr7lHqsyoDjQo7apjQZXwoGZnTlC1zctRq0nco
         9D3+95AUUTchnU0qXUIgfuA25AbcVeOitJIGqokrRP14jD3jQXMhpi+2mQ5JlcPiO48f
         SQ9EeSqlR7kdnW+BtPLPTCxy2owZut8XR3xZt+avLAhns1dpzVbNRF0+0LVpZ63POu07
         KqqD29yBOqBOdAxpWfKL2OjmPI0sdtmEl3CuDC5GkqfUNqDNa6Xpp3N+lBYxxpLSuZKo
         R7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV6eAIuiH4qwYoiSccGGZdKgon8pp73xehxYluQY2Rx3UeWcMsFQPBRWy8PewZpzuPSCTN5HFcypjG9a3Glrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0giUpz4vhz6eJ3ngpvBkPbpqGufHD6F49/+t15DSqZCTnxEiO
	uu7dRfjFkFjejWZJ90ekZwHsD372yeImwmC86EAoMeCRVLqas8HB5yhiPdVEx069o4gLhMODu+U
	9rUO/dHz3ret50OYSCJdNWuuY/7r2J8OfdLEbMeMz
X-Gm-Gg: ASbGncs5KCU3IVH5Dzpstn3e5PF6f/l819VeKXr8PZ91io6qI2RyC79DHr1sYrWho09
	Ag5tyAP+X2j1ZcCbrbzh65N1/NBrHAkspkLlhV/RZDIOGT22r2o4WwqGbIRIop7sjD7ox1E4xnu
	kgIeR9E7bHRhRsMoY9KBJ2fr++K2PV6QSSY26LK9+hPHSyzJ0cawbvmvA/Flw4OmUBf62mgaint
	2BJinBQ+MXi260gVPANpjDlixWtFEVoZhdpEoy/Rg6FqqKpT/+VpzyluNcisI3muHBFPAg/yKTF
	mtqIxju2+7pZzxlGiec3ROnQqw==
X-Google-Smtp-Source: AGHT+IE84Tn2022QvSUJGsPtJH49KjYoJ18zLsqxLKaJpS7gcoddf0n5K17id2JZRAQ6N1LNTLU7mtXzwfaQAkiZ5D0=
X-Received: by 2002:a05:600c:4746:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-477c04cfa31mr207893505e9.5.1764174150520; Wed, 26 Nov 2025
 08:22:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
 <20251125-binder-bitmap-v6-6-dedaf1d05a98@google.com> <aSZlZu0SNycNvk4q@yury>
 <aSa764le50AiUe4p@google.com> <aScdN-iBwazEBaFk@yury> <aScjITkN3sXT-pFQ@google.com>
 <aScnNCZRc9ZCGbpr@yury>
In-Reply-To: <aScnNCZRc9ZCGbpr@yury>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 26 Nov 2025 17:22:18 +0100
X-Gm-Features: AWmQ_bnGXgsh5jZhYw-EngZaobnuj4JEhzZohgvCmFiv6wqUToAGNU6qSEoxkm4
Message-ID: <CAH5fLgjZ_v8UmHg5R0bBfY+GLWu0WkcNYN4UWkG_Z_9=O=FZ3A@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] rust_binder: use bitmap for allocation of handles
To: Yury Norov <yury.norov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 5:13=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Wed, Nov 26, 2025 at 03:56:17PM +0000, Alice Ryhl wrote:
> > On Wed, Nov 26, 2025 at 10:31:03AM -0500, Yury Norov wrote:
> > > On Wed, Nov 26, 2025 at 08:35:55AM +0000, Alice Ryhl wrote:
> > > > On Tue, Nov 25, 2025 at 09:26:46PM -0500, Yury Norov wrote:
> > > > > On Tue, Nov 25, 2025 at 01:59:42PM +0000, Alice Ryhl wrote:
> > > > > > To find an unused Binder handle, Rust Binder currently iterates=
 the
> > > > > > red/black tree from the beginning until it finds a gap in the k=
eys. This
> > > > > > is extremely slow.
> > > > > >
> > > > > > To improve the performance, add a bitmap that keeps track of wh=
ich
> > > > > > indices are actually in use. This allows us to quickly find an =
unused
> > > > > > key in the red/black tree.
> > > > > >
> > > > > > For a benchmark, please see the below numbers that were obtaine=
d from
> > > > > > modifying binderThroughputTest to send a node with each transac=
tion and
> > > > > > stashing it in the server. This results in the number of nodes
> > > > > > increasing by one for every transaction sent. I got the followi=
ng table
> > > > > > of roundtrip latencies (in =C2=B5s):
> > > > > >
> > > > > > Transaction Range =E2=94=82 Baseline (Rust) =E2=94=82 Bitmap (R=
ust) =E2=94=82 Comparison (C)
> > > > > > 0 - 10,000        =E2=94=82          176.88 =E2=94=82         9=
2.93 =E2=94=82          99.41
> > > > > > 10,000 - 20,000   =E2=94=82          437.37 =E2=94=82         8=
7.74 =E2=94=82          98.55
> > > > > > 20,000 - 30,000   =E2=94=82          677.49 =E2=94=82         7=
6.24 =E2=94=82          96.37
> > > > > > 30,000 - 40,000   =E2=94=82          901.76 =E2=94=82         8=
3.39 =E2=94=82          96.73
> > > > > > 40,000 - 50,000   =E2=94=82         1126.62 =E2=94=82        10=
0.44 =E2=94=82          94.57
> > > > > > 50,000 - 60,000   =E2=94=82         1288.98 =E2=94=82         9=
4.38 =E2=94=82          96.64
> > > > > > 60,000 - 70,000   =E2=94=82         1588.74 =E2=94=82         8=
8.27 =E2=94=82          96.36
> > > > > > 70,000 - 80,000   =E2=94=82         1812.97 =E2=94=82         9=
3.97 =E2=94=82          91.24
> > > > > > 80,000 - 90,000   =E2=94=82         2062.95 =E2=94=82         9=
2.22 =E2=94=82         102.01
> > > > > > 90,000 - 100,000  =E2=94=82         2330.03 =E2=94=82         9=
7.18 =E2=94=82         100.31
> > > > > >
> > > > > > It should be clear that the current Rust code becomes linearly =
slower
> > > > > > per insertion as the number of calls to rb_next() per transacti=
on
> > > > > > increases. After this change, the time to find an ID number app=
ears
> > > > > > constant. (Technically it is not constant-time as both insertio=
n and
> > > > > > removal scan the entire bitmap. However, quick napkin math show=
s that
> > > > > > scanning the entire bitmap with N=3D100k takes ~1.5=C2=B5s, whi=
ch is neglible
> > > > > > in a benchmark where the rountrip latency is 100=C2=B5s.)
> > > > > >
> > > > > > I've included a comparison to the C driver, which uses the same=
 bitmap
> > > > > > algorithm as this patch since commit 15d9da3f818c ("binder: use=
 bitmap
> > > > > > for faster descriptor lookup").
> > > > >
> > > > > Thanks for the solid numbers!
> > > > >
> > > > > > This currently checks if the bitmap should be shrunk after ever=
y
> > > > > > removal. One potential future change is introducing a shrinker =
to make
> > > > > > this operation O(1), but based on the benchmark above this does=
 not seem
> > > > > > required at this time.
> > > > > >
> > > > > > Reviewed-by: Burak Emir <bqe@google.com>
> > > > > > Acked-by: Carlos Llamas <cmllamas@google.com>
> > > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > > > ---
> > > > > >  drivers/android/binder/process.rs | 64 +++++++++++++++++++++++=
+++++-----------
> > > > > >  1 file changed, 47 insertions(+), 17 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/android/binder/process.rs b/drivers/androi=
d/binder/process.rs
> > > > > > index f13a747e784c84a0fb09cbf47442712106eba07c..9264961fd92b33c=
07fcd5353740cc0b1ec978afd 100644
> > > > > > --- a/drivers/android/binder/process.rs
> > > > > > +++ b/drivers/android/binder/process.rs
> > > > > > @@ -19,6 +19,7 @@
> > > > > >      cred::Credential,
> > > > > >      error::Error,
> > > > > >      fs::file::{self, File},
> > > > > > +    id_pool::IdPool,
> > > > > >      list::{List, ListArc, ListArcField, ListLinks},
> > > > > >      mm,
> > > > > >      prelude::*,
> > > > > > @@ -367,6 +368,8 @@ impl ListItem<{Self::LIST_NODE}> for NodeRe=
fInfo {
> > > > > >  struct ProcessNodeRefs {
> > > > > >      /// Used to look up nodes using the 32-bit id that this pr=
ocess knows it by.
> > > > > >      by_handle: RBTree<u32, ListArc<NodeRefInfo, { NodeRefInfo:=
:LIST_PROC }>>,
> > > > > > +    /// Used to quickly find unused ids in `by_handle`.
> > > > > > +    handle_is_present: IdPool,
> > > > > >      /// Used to look up nodes without knowing their local 32-b=
it id. The usize is the address of
> > > > > >      /// the underlying `Node` struct as returned by `Node::glo=
bal_id`.
> > > > > >      by_node: RBTree<usize, u32>,
> > > > > > @@ -381,6 +384,7 @@ impl ProcessNodeRefs {
> > > > > >      fn new() -> Self {
> > > > > >          Self {
> > > > > >              by_handle: RBTree::new(),
> > > > > > +            handle_is_present: IdPool::new(),
> > > > > >              by_node: RBTree::new(),
> > > > > >              freeze_listeners: RBTree::new(),
> > > > > >          }
> > > > > > @@ -775,7 +779,7 @@ pub(crate) fn get_node(
> > > > > >      pub(crate) fn insert_or_update_handle(
> > > > > >          self: ArcBorrow<'_, Process>,
> > > > > >          node_ref: NodeRef,
> > > > > > -        is_mananger: bool,
> > > > > > +        is_manager: bool,
> > > > > >      ) -> Result<u32> {
> > > > > >          {
> > > > > >              let mut refs =3D self.node_refs.lock();
> > > > > > @@ -794,7 +798,33 @@ pub(crate) fn insert_or_update_handle(
> > > > > >          let reserve2 =3D RBTreeNodeReservation::new(GFP_KERNEL=
)?;
> > > > > >          let info =3D UniqueArc::new_uninit(GFP_KERNEL)?;
> > > > > >
> > > > > > -        let mut refs =3D self.node_refs.lock();
> > > > > > +        let mut refs_lock =3D self.node_refs.lock();
> > > > > > +        let mut refs =3D &mut *refs_lock;
> > > > > > +
> > > > > > +        let (unused_id, by_handle_slot) =3D loop {
> > > > > > +            // ID 0 may only be used by the manager.
> > > > > > +            let start =3D if is_manager { 0 } else { 1 };
> > > > > > +
> > > > > > +            if let Some(res) =3D refs.handle_is_present.find_u=
nused_id(start) {
> > > > > > +                match refs.by_handle.entry(res.as_u32()) {
> > > > > > +                    rbtree::Entry::Vacant(entry) =3D> break (r=
es, entry),
> > > > > > +                    rbtree::Entry::Occupied(_) =3D> {
> > > > > > +                        pr_err!("Detected mismatch between han=
dle_is_present and by_handle");
> > > > > > +                        res.acquire();
> > > > > > +                        kernel::warn_on!(true);
> > > > > > +                        return Err(EINVAL);
> > > > >
> > > > > EINVAL means that user provides a wrong parameter. Here's a data
> > > > > corruption. Maybe EFAULT?
> > > >
> > > > Hmm ... EFAULT is used when the user passes a dangling pointer that
> > > > copy_from_user() refuses to use. I would like to avoid confusion wi=
th
> > > > that as well. Is there a third option?
> > > >
> > > > > > +                    }
> > > > > > +                }
> > > > > > +            }
> > > > > > +
> > > > > > +            let grow_request =3D refs.handle_is_present.grow_r=
equest().ok_or(ENOMEM)?;
> > > > > > +            drop(refs_lock);
> > > > > > +            let resizer =3D grow_request.realloc(GFP_KERNEL)?;
> > > > > > +            refs_lock =3D self.node_refs.lock();
> > > > > > +            refs =3D &mut *refs_lock;
> > > > > > +            refs.handle_is_present.grow(resizer);
> > > > >
> > > > > This continues puzzling me. Refs_lock protects refs, and the spec
> > > > > says:
> > > > >
> > > > >     a reference=E2=80=99s scope starts from where it is introduce=
d and
> > > > >     continues through the last time that reference is used.
> > > > >
> > > > > https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.h=
tml
> > > > >
> > > > > The last usage of refs is at .grow_request() line, because later =
it's
> > > > > reused with the new value.
> > > > >
> > > > > If my reading of the spec is correct, after dropping the refs_loc=
k,
> > > > > you may get rescheduled, and another thread may follow the same p=
ath.
> > > > > Because refs_lock is dropped explicitly and refs - implicitly, th=
e
> > > > > concurrent thread can grab both and follow with resizing the id m=
ap.
> > > > >
> > > > > When your first thread will get back, you'll end up resizing the
> > > > > already resized map.
> > > > >
> > > > > I asked your AI, and it says that this race is indeed possible fo=
r
> > > > > exactly that reason. But it doesn't break memory safety, so the
> > > > > compiler is happy about it...
> > > >
> > > > You're right that since we release the mutex, someone else may have
> > > > resized the map in the meantime. That's why we implemented grow() t=
o do
> > > > nothing if it was already resized:
> > > >
> > > >   pub fn grow(&mut self, mut resizer: PoolResizer) {
> > > >       // Between request to grow that led to allocation of `resizer=
` and now,
> > > >       // another thread may have already grown the capacity.
> > > >       // In this case, do nothing, drop `resizer` and move on.
> > > >       if resizer.new.len() <=3D self.capacity() {
> > > >           return;
> > > >       }
> > > >
> > > >       resizer.new.copy_and_extend(&self.map);
> > > >       self.map =3D resizer.new;
> > > >   }
> > >
> > > OK, I see...
> > >
> > > I expected that you'll switch the pool state to 'growing' before
> > > dropping the ref_lock. This way, the concurrent thread would be able
> > > to go straight to the new iteration.
> > >
> > > Something like:
> > >
> > >         if let Some(res) =3D refs.handle_is_present.find_unused_id(st=
art) {
> > >                 ...
> > >         }
> > >
> > >         if refs.is_growing() {
> > >                 drop(refs_lock);
> > >                 continue;
> > >         }
> > >         let grow_request =3D refs.handle_is_present.grow_request().ok=
_or(ENOMEM)?;
> > >         refs.set_growing()
> > >         drop(refs_lock);
> > >         let resizer =3D grow_request.realloc(GFP_KERNEL)?;
> > >         ...
> > >
> > > Your approach also works, assuming you're OK with a useless alloc/fre=
e
> > > bitmaps in the case of collision.
> >
> > Hmm, having the extra ones just repeatedly lock/unlock also isn't great=
.
> > I guess one alternate option could be to have a separate mutex that you
> > take while allocating, but ehh I think the current logic is fine.
>
> Not sure I understand... In case you've found nothing and need to
> grow, you anyways have to lock and unlock, at least to allocate a
> bigger bitmap.

I'm mostly concerned that it's going to unlock/lock many many many
times while the other thread is busy allocating.

Alice

> But this doesn't look critical to me because probability of such event
> decreases exponentially as the ID pool grows. So either approach works.
>
> > > So, I can take this series as is, or I can wait for v7 if you prefer.
> > >
> > > Please advise.
> >
> > Sure, go ahead! And thanks for the reviews!
>
> OK, will do.
>
> Thanks,
> Yury
