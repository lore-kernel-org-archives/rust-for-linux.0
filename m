Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5F833A719
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764173624; cv=none; b=mMR3vyEACUDQGkRdxBIgBZ7a0WqUOGHNXjRTcnq4x4CTRX2BNGPE5dvIc1rnzUwmXF5gmxgWMbmmag3S7wYoTiyw28fWQWsRKq2e02isGQLBkwuvVTAkPKoB7IoLrEwvpsVsSYMcTdNP5NTUO1wDEzBxPL5HG0F/p8MACWhiBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764173624; c=relaxed/simple;
	bh=SeM7a5J/HUfV4hvrtj8Tp9EXjEqZAd2iFlcNLqIAcLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtxCBPyXbzjajUDiwpvx1hjWWbp5vVgVckOkFURM8gm0pK+UsqVdkxXd963p2y0Tq6cvfIODqiKYQmAiFif7DuqTdjPIR8/XY52U+ZNZfmYiyzUSuxCUiekRst04AYUixIK0+ST5qXe96Vd873vYdTff7PteIJPrSeDkwEN4G6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9gV5pZh; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9gV5pZh"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-787c9f90eccso73070057b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764173621; x=1764778421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKIl8cIYvmiNWUhFqpl8rewKYEsSu/gcCfvEm7XZWEI=;
        b=b9gV5pZh7OMT7OI6OPkmWWYKeQAoNuQfI5f9Zqcc2zQen7SLAx/Ret86ApgqtyvIJy
         9bueEMtohUJLdHMEO6rcHO0At4L/GUKO2MOkvuX0oHinS5IKa4GAOjihlcc26kjpZldu
         Sf6ZK2gMMYF8p2eRG1VuTYZ402lnJH34pWQaxT+NdUzUiZHt15i+od33BYF1w43abHpe
         tN1aZ421qVKnUgPbrQ9rvQgwx/Q+qgBQbJY7qNustfmzNcIi72rtdpQM8nLTaugqUHQN
         eZWiNo2wAV5LAcMtHGZTyjBkmTcnQptI69tuPt+4RB2V+ieA5A9doBWMEocJjHIaj613
         nfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764173621; x=1764778421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKIl8cIYvmiNWUhFqpl8rewKYEsSu/gcCfvEm7XZWEI=;
        b=tIqt8EDSjGX/CtGDVlS/2rMeCXdDhymJ83Qa/Rr835pwgPQGQgUSady2THoFCqzD7p
         tWXtyuVahc2yZ7TVHoQzIIS02xSdekjHSaJll6Fm3QP04B5GjinKoHCIKMMNHwGdsFXS
         c8aHMhZMt5RxqKI3vwDOlHInpyaCruqbCqgj1UCslTng0EFRbCP6nMy2k3hDTcHW7G1W
         dahy0jUE0y4aSL1XodKgelbSSa5IHd39YMu4UZXKaZTEPzIXn4KYlSYMHnAfPmJmbrJu
         7OYLN4lX274rdL8Fr8Y3b7sLJbqwr4Bduj5lpfWp93tQ2LS2ihe9UBVuckiwsjxpO8Uz
         kYLA==
X-Forwarded-Encrypted: i=1; AJvYcCVhIsDqxPOIbbAtsoGK54s3OwoO2lEtj1P2WXQuz5h1Hw+kJwmDt4i4oBugU2GE6RHjfho+LCP23xetAssazA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXFlFkCiffPA944D1tAEF0r+4YYM25hOHzi+jfIQmtFgg773Ka
	5qoBSX+ZfVqDufxPWsQzr5LBeY64CGfEYFisG8B4z8yO/jpyvsGtX1Lx
X-Gm-Gg: ASbGncvMG3AcJW6bQAOsUlIHX16J44saFLCJN506fc6CjmZDcU1aEK0Io0GcW9X/wVK
	7ithQ4q4BV63O0eI8kwgbOwLpboqCZwQEDAE48KSgU08gAdVdDuD8KDlfF+gCsKGBEvaEP8nwvT
	U4KHKtqtXGF+ffpApD2+ClfrQPC6HTuQ99M+r+GVuWm2ouwYXX4jM4w9SH1tDiFk6lTEFzcO7NZ
	iOCzwobtli02la8IRMvsOV+FNj/EZ81Eli5P8NKBLzdKojIB7wGJAeohEQq2SbwUS0mzy4SlK8B
	YRPQp3Q3jpag0BBS+3u+TBa57lvTYm5pjTltRVzdSeRVaQjrOuworoRlua96+VUweuKeQtwOgBW
	xIVBwCjNqDfnWHVM7AF+vj9EYL1Hai+xjLWZou44qpi4NkQdJSkvQTiFN0jURCkhZ+CNXRr37hU
	fK1SYEZqU=
X-Google-Smtp-Source: AGHT+IGvTwplC5X8/CA0AIJM5mDbd9mwytLBumy5gyCfTMeykIAgoQne1HoYELi4koSNbqbY1s+ggw==
X-Received: by 2002:a05:690c:4806:b0:785:fe77:ccce with SMTP id 00721157ae682-78ab6f3464fmr58189347b3.44.1764173621241;
        Wed, 26 Nov 2025 08:13:41 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:4346:c7d1:6a6a:a031])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a799594f7sm68232257b3.54.2025.11.26.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:13:40 -0800 (PST)
Date: Wed, 26 Nov 2025 11:13:40 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] rust_binder: use bitmap for allocation of handles
Message-ID: <aScnNCZRc9ZCGbpr@yury>
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
 <20251125-binder-bitmap-v6-6-dedaf1d05a98@google.com>
 <aSZlZu0SNycNvk4q@yury>
 <aSa764le50AiUe4p@google.com>
 <aScdN-iBwazEBaFk@yury>
 <aScjITkN3sXT-pFQ@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aScjITkN3sXT-pFQ@google.com>

On Wed, Nov 26, 2025 at 03:56:17PM +0000, Alice Ryhl wrote:
> On Wed, Nov 26, 2025 at 10:31:03AM -0500, Yury Norov wrote:
> > On Wed, Nov 26, 2025 at 08:35:55AM +0000, Alice Ryhl wrote:
> > > On Tue, Nov 25, 2025 at 09:26:46PM -0500, Yury Norov wrote:
> > > > On Tue, Nov 25, 2025 at 01:59:42PM +0000, Alice Ryhl wrote:
> > > > > To find an unused Binder handle, Rust Binder currently iterates the
> > > > > red/black tree from the beginning until it finds a gap in the keys. This
> > > > > is extremely slow.
> > > > > 
> > > > > To improve the performance, add a bitmap that keeps track of which
> > > > > indices are actually in use. This allows us to quickly find an unused
> > > > > key in the red/black tree.
> > > > > 
> > > > > For a benchmark, please see the below numbers that were obtained from
> > > > > modifying binderThroughputTest to send a node with each transaction and
> > > > > stashing it in the server. This results in the number of nodes
> > > > > increasing by one for every transaction sent. I got the following table
> > > > > of roundtrip latencies (in µs):
> > > > > 
> > > > > Transaction Range │ Baseline (Rust) │ Bitmap (Rust) │ Comparison (C)
> > > > > 0 - 10,000        │          176.88 │         92.93 │          99.41
> > > > > 10,000 - 20,000   │          437.37 │         87.74 │          98.55
> > > > > 20,000 - 30,000   │          677.49 │         76.24 │          96.37
> > > > > 30,000 - 40,000   │          901.76 │         83.39 │          96.73
> > > > > 40,000 - 50,000   │         1126.62 │        100.44 │          94.57
> > > > > 50,000 - 60,000   │         1288.98 │         94.38 │          96.64
> > > > > 60,000 - 70,000   │         1588.74 │         88.27 │          96.36
> > > > > 70,000 - 80,000   │         1812.97 │         93.97 │          91.24
> > > > > 80,000 - 90,000   │         2062.95 │         92.22 │         102.01
> > > > > 90,000 - 100,000  │         2330.03 │         97.18 │         100.31
> > > > > 
> > > > > It should be clear that the current Rust code becomes linearly slower
> > > > > per insertion as the number of calls to rb_next() per transaction
> > > > > increases. After this change, the time to find an ID number appears
> > > > > constant. (Technically it is not constant-time as both insertion and
> > > > > removal scan the entire bitmap. However, quick napkin math shows that
> > > > > scanning the entire bitmap with N=100k takes ~1.5µs, which is neglible
> > > > > in a benchmark where the rountrip latency is 100µs.)
> > > > > 
> > > > > I've included a comparison to the C driver, which uses the same bitmap
> > > > > algorithm as this patch since commit 15d9da3f818c ("binder: use bitmap
> > > > > for faster descriptor lookup").
> > > > 
> > > > Thanks for the solid numbers!
> > > > 
> > > > > This currently checks if the bitmap should be shrunk after every
> > > > > removal. One potential future change is introducing a shrinker to make
> > > > > this operation O(1), but based on the benchmark above this does not seem
> > > > > required at this time.
> > > > > 
> > > > > Reviewed-by: Burak Emir <bqe@google.com>
> > > > > Acked-by: Carlos Llamas <cmllamas@google.com>
> > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > > ---
> > > > >  drivers/android/binder/process.rs | 64 ++++++++++++++++++++++++++++-----------
> > > > >  1 file changed, 47 insertions(+), 17 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> > > > > index f13a747e784c84a0fb09cbf47442712106eba07c..9264961fd92b33c07fcd5353740cc0b1ec978afd 100644
> > > > > --- a/drivers/android/binder/process.rs
> > > > > +++ b/drivers/android/binder/process.rs
> > > > > @@ -19,6 +19,7 @@
> > > > >      cred::Credential,
> > > > >      error::Error,
> > > > >      fs::file::{self, File},
> > > > > +    id_pool::IdPool,
> > > > >      list::{List, ListArc, ListArcField, ListLinks},
> > > > >      mm,
> > > > >      prelude::*,
> > > > > @@ -367,6 +368,8 @@ impl ListItem<{Self::LIST_NODE}> for NodeRefInfo {
> > > > >  struct ProcessNodeRefs {
> > > > >      /// Used to look up nodes using the 32-bit id that this process knows it by.
> > > > >      by_handle: RBTree<u32, ListArc<NodeRefInfo, { NodeRefInfo::LIST_PROC }>>,
> > > > > +    /// Used to quickly find unused ids in `by_handle`.
> > > > > +    handle_is_present: IdPool,
> > > > >      /// Used to look up nodes without knowing their local 32-bit id. The usize is the address of
> > > > >      /// the underlying `Node` struct as returned by `Node::global_id`.
> > > > >      by_node: RBTree<usize, u32>,
> > > > > @@ -381,6 +384,7 @@ impl ProcessNodeRefs {
> > > > >      fn new() -> Self {
> > > > >          Self {
> > > > >              by_handle: RBTree::new(),
> > > > > +            handle_is_present: IdPool::new(),
> > > > >              by_node: RBTree::new(),
> > > > >              freeze_listeners: RBTree::new(),
> > > > >          }
> > > > > @@ -775,7 +779,7 @@ pub(crate) fn get_node(
> > > > >      pub(crate) fn insert_or_update_handle(
> > > > >          self: ArcBorrow<'_, Process>,
> > > > >          node_ref: NodeRef,
> > > > > -        is_mananger: bool,
> > > > > +        is_manager: bool,
> > > > >      ) -> Result<u32> {
> > > > >          {
> > > > >              let mut refs = self.node_refs.lock();
> > > > > @@ -794,7 +798,33 @@ pub(crate) fn insert_or_update_handle(
> > > > >          let reserve2 = RBTreeNodeReservation::new(GFP_KERNEL)?;
> > > > >          let info = UniqueArc::new_uninit(GFP_KERNEL)?;
> > > > >  
> > > > > -        let mut refs = self.node_refs.lock();
> > > > > +        let mut refs_lock = self.node_refs.lock();
> > > > > +        let mut refs = &mut *refs_lock;
> > > > > +
> > > > > +        let (unused_id, by_handle_slot) = loop {
> > > > > +            // ID 0 may only be used by the manager.
> > > > > +            let start = if is_manager { 0 } else { 1 };
> > > > > +
> > > > > +            if let Some(res) = refs.handle_is_present.find_unused_id(start) {
> > > > > +                match refs.by_handle.entry(res.as_u32()) {
> > > > > +                    rbtree::Entry::Vacant(entry) => break (res, entry),
> > > > > +                    rbtree::Entry::Occupied(_) => {
> > > > > +                        pr_err!("Detected mismatch between handle_is_present and by_handle");
> > > > > +                        res.acquire();
> > > > > +                        kernel::warn_on!(true);
> > > > > +                        return Err(EINVAL);
> > > > 
> > > > EINVAL means that user provides a wrong parameter. Here's a data
> > > > corruption. Maybe EFAULT?
> > > 
> > > Hmm ... EFAULT is used when the user passes a dangling pointer that
> > > copy_from_user() refuses to use. I would like to avoid confusion with
> > > that as well. Is there a third option?
> > > 
> > > > > +                    }
> > > > > +                }
> > > > > +            }
> > > > > +
> > > > > +            let grow_request = refs.handle_is_present.grow_request().ok_or(ENOMEM)?;
> > > > > +            drop(refs_lock);
> > > > > +            let resizer = grow_request.realloc(GFP_KERNEL)?;
> > > > > +            refs_lock = self.node_refs.lock();
> > > > > +            refs = &mut *refs_lock;
> > > > > +            refs.handle_is_present.grow(resizer);
> > > > 
> > > > This continues puzzling me. Refs_lock protects refs, and the spec
> > > > says:
> > > > 
> > > >     a reference’s scope starts from where it is introduced and
> > > >     continues through the last time that reference is used.
> > > > 
> > > > https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html
> > > > 
> > > > The last usage of refs is at .grow_request() line, because later it's
> > > > reused with the new value. 
> > > > 
> > > > If my reading of the spec is correct, after dropping the refs_lock,
> > > > you may get rescheduled, and another thread may follow the same path.
> > > > Because refs_lock is dropped explicitly and refs - implicitly, the
> > > > concurrent thread can grab both and follow with resizing the id map.
> > > > 
> > > > When your first thread will get back, you'll end up resizing the
> > > > already resized map.
> > > > 
> > > > I asked your AI, and it says that this race is indeed possible for
> > > > exactly that reason. But it doesn't break memory safety, so the
> > > > compiler is happy about it...
> > > 
> > > You're right that since we release the mutex, someone else may have
> > > resized the map in the meantime. That's why we implemented grow() to do
> > > nothing if it was already resized:
> > > 
> > > 	pub fn grow(&mut self, mut resizer: PoolResizer) {
> > > 	    // Between request to grow that led to allocation of `resizer` and now,
> > > 	    // another thread may have already grown the capacity.
> > > 	    // In this case, do nothing, drop `resizer` and move on.
> > > 	    if resizer.new.len() <= self.capacity() {
> > > 	        return;
> > > 	    }
> > > 	
> > > 	    resizer.new.copy_and_extend(&self.map);
> > > 	    self.map = resizer.new;
> > > 	}
> > 
> > OK, I see...
> > 
> > I expected that you'll switch the pool state to 'growing' before
> > dropping the ref_lock. This way, the concurrent thread would be able
> > to go straight to the new iteration.
> > 
> > Something like:
> >         
> >         if let Some(res) = refs.handle_is_present.find_unused_id(start) {
> >                 ...
> >         }
> > 
> >         if refs.is_growing() {
> >                 drop(refs_lock);
> >                 continue;
> >         }
> >         let grow_request = refs.handle_is_present.grow_request().ok_or(ENOMEM)?;
> >         refs.set_growing()
> >         drop(refs_lock);
> >         let resizer = grow_request.realloc(GFP_KERNEL)?;
> >         ...
> > 
> > Your approach also works, assuming you're OK with a useless alloc/free
> > bitmaps in the case of collision.
> 
> Hmm, having the extra ones just repeatedly lock/unlock also isn't great.
> I guess one alternate option could be to have a separate mutex that you
> take while allocating, but ehh I think the current logic is fine.

Not sure I understand... In case you've found nothing and need to
grow, you anyways have to lock and unlock, at least to allocate a
bigger bitmap.

But this doesn't look critical to me because probability of such event
decreases exponentially as the ID pool grows. So either approach works.
 
> > So, I can take this series as is, or I can wait for v7 if you prefer.
> > 
> > Please advise.
> 
> Sure, go ahead! And thanks for the reviews!

OK, will do.

Thanks,
Yury
