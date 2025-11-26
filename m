Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D71334C14
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171069; cv=none; b=koTLNlNhPSArE0nk67lYu69tCNsIkokdL5+klicKan3eZqjTVSUStHuAOB7/0GRnc7553q6hWY6tcWy0m2WGrlnVTWQJmwPg1iwY91hyUM7i8CgQ5le8gJPRz+nw5n+g7iKetvklY4lEPuIEqwSUauXNEoQzReGWzTEfUSMBdJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171069; c=relaxed/simple;
	bh=xDvh9090C7mNzz7PopcOYySWGUEBAgGnEL7K4Mf49PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnT+bYVnqrPrAisas/oYnmVfkf7ll0qgIY77k0MfXVwXxp3ilfHztkzl62BPlihQH8DJxq1aA6TAaqWw2MvEUh4oseNaRxPbFckIWXna2kdmfJGMnYtiDev0Lf121I3vWjmvaI8swVSqgMgj/+R6UoV+2HSc8gMTFlqImng1v/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2P093oH; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2P093oH"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-787e84ceaf7so70926257b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 07:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764171065; x=1764775865; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rn7KTCsmg4xaLu1Lrfq0myNpQnETtQE4aZd7SljyN+k=;
        b=B2P093oHlJ/rpeIIvdCVd7X2n8rJ+GPIsn6jFptJ36ePYtuw06eKBz+YfmDhTKzpZA
         wWmejBtWbYUHIV2EHA2hq4fH/yiKTpbJJ9ent1HyMleFmPnGi48TQH74EWlf5+aMcHI4
         69HOs0Yu3oj2Agzv9agSCgt6tBWDWOVu0Mz/Q5RLDkE+3S/pxO7cfBRoIoZGwdXrVToO
         eGA6VtF7tGcwvDGwCKkc8JBeYCQPWEeclBQJizq9AWraAzI8vMd2B6y0NvYuCw8Mr2KV
         U9ViTvGDzga6P1gdWSuuAhGynt6eK7FN7cXZKf1fBqCKNU7GQ2T450l0TSZPrmC4EsLh
         YFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171065; x=1764775865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn7KTCsmg4xaLu1Lrfq0myNpQnETtQE4aZd7SljyN+k=;
        b=tnYx3ElAU/+LBGZg11mjpEg6r9zoXA5K1gLA+Uua2eq8VCs91lT1Xf5L7V7I10tRCe
         NSxlj54QD0Qll+EKZI5c10FJtwCyczx+DSw4TlNFZII+P+PgNdFrBu63AI96WkMSbO9B
         aLfCfnf9GQYqX+Atc0igP91l4fj/7z5hLYWy9AFvnPosNDeW7vTDVQHZPRoyelITJXWV
         4xxPoP8ihtJv9W9abII8Qtwv8HKhF18KyNSIKGwTIVesqdetixbmLjEQqkx04Kl1+SWh
         RNSggIaxUMQQWCivphHhxSLHRBy3ZSrvJ2hBAmyV3PcO5gPj/dN8j2mMxA/VDpNfMEEy
         iOIw==
X-Forwarded-Encrypted: i=1; AJvYcCXeLpCvn1/I5808a4SRiRR+AOh1thZ19fGL6X/dJC+FY+GbbR9a5jIn0GqRX9ip03fKh/MCho+bcx70Oor89g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj0t8ggE0nmlprITUQSv0d2GJqf27wvgDFCHRQ9RX+HJx48GI6
	Tgwh6UJTZgd6WQStOUgiWl6a01h4nXJhFU4QPSaPI/C2nKrrFSv01s7K
X-Gm-Gg: ASbGncsP6H5gPTUpCbV6ii2AH/1Ae27GFmdnXa65Bz816Oc0RXQKbaHiKO3mtjlWTvH
	Q0F9e5EBzaoUAC14HaqKQg22hbI5wdC8iW8zWj5UG+Oee2PQmlwrfNlgfwEDVfRRgLgRT9McBkL
	Mkls1FXhqW96WhwUEXgqoam4aJ1Uwv4ZC7OazSNDcyKX2ggeUfDvYL4sRsOATKIazBt6ydqgDVh
	7W+IbX50ZSVcHrPmwaeh1YrS19M++BlZYgBFXy1O/Olt2Yw8CZrEwtQmnVQTyntfAuMr+LXRKAc
	lrXyuW9IhaYcvdoZRIhwloAoeGiHfuJ5KgnEIz9fq3IZfB/5FO8T5pZh1F/rumLv0j9F01jc4bT
	8YrA59Tj1aJT2rJJqzk87iCHtCsO0gzJ6ls+IZZ8f5kDsm9feAXrtfbs0VHif6uFizy2M4vh4v2
	Z+ZkheMyA=
X-Google-Smtp-Source: AGHT+IHYvsLBx5bBDCF0ytpRWigRy2zzVfs4uktFnO51dpt8W5Bcr5yQX6Ydnr4/DtaQoe4P3Qkrjw==
X-Received: by 2002:a05:690c:88f:b0:786:5712:46c0 with SMTP id 00721157ae682-78a8b4719bcmr178020877b3.17.1764171064735;
        Wed, 26 Nov 2025 07:31:04 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:4346:c7d1:6a6a:a031])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a7f19sm67496707b3.20.2025.11.26.07.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:31:03 -0800 (PST)
Date: Wed, 26 Nov 2025 10:31:03 -0500
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
Message-ID: <aScdN-iBwazEBaFk@yury>
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
 <20251125-binder-bitmap-v6-6-dedaf1d05a98@google.com>
 <aSZlZu0SNycNvk4q@yury>
 <aSa764le50AiUe4p@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSa764le50AiUe4p@google.com>

On Wed, Nov 26, 2025 at 08:35:55AM +0000, Alice Ryhl wrote:
> On Tue, Nov 25, 2025 at 09:26:46PM -0500, Yury Norov wrote:
> > On Tue, Nov 25, 2025 at 01:59:42PM +0000, Alice Ryhl wrote:
> > > To find an unused Binder handle, Rust Binder currently iterates the
> > > red/black tree from the beginning until it finds a gap in the keys. This
> > > is extremely slow.
> > > 
> > > To improve the performance, add a bitmap that keeps track of which
> > > indices are actually in use. This allows us to quickly find an unused
> > > key in the red/black tree.
> > > 
> > > For a benchmark, please see the below numbers that were obtained from
> > > modifying binderThroughputTest to send a node with each transaction and
> > > stashing it in the server. This results in the number of nodes
> > > increasing by one for every transaction sent. I got the following table
> > > of roundtrip latencies (in µs):
> > > 
> > > Transaction Range │ Baseline (Rust) │ Bitmap (Rust) │ Comparison (C)
> > > 0 - 10,000        │          176.88 │         92.93 │          99.41
> > > 10,000 - 20,000   │          437.37 │         87.74 │          98.55
> > > 20,000 - 30,000   │          677.49 │         76.24 │          96.37
> > > 30,000 - 40,000   │          901.76 │         83.39 │          96.73
> > > 40,000 - 50,000   │         1126.62 │        100.44 │          94.57
> > > 50,000 - 60,000   │         1288.98 │         94.38 │          96.64
> > > 60,000 - 70,000   │         1588.74 │         88.27 │          96.36
> > > 70,000 - 80,000   │         1812.97 │         93.97 │          91.24
> > > 80,000 - 90,000   │         2062.95 │         92.22 │         102.01
> > > 90,000 - 100,000  │         2330.03 │         97.18 │         100.31
> > > 
> > > It should be clear that the current Rust code becomes linearly slower
> > > per insertion as the number of calls to rb_next() per transaction
> > > increases. After this change, the time to find an ID number appears
> > > constant. (Technically it is not constant-time as both insertion and
> > > removal scan the entire bitmap. However, quick napkin math shows that
> > > scanning the entire bitmap with N=100k takes ~1.5µs, which is neglible
> > > in a benchmark where the rountrip latency is 100µs.)
> > > 
> > > I've included a comparison to the C driver, which uses the same bitmap
> > > algorithm as this patch since commit 15d9da3f818c ("binder: use bitmap
> > > for faster descriptor lookup").
> > 
> > Thanks for the solid numbers!
> > 
> > > This currently checks if the bitmap should be shrunk after every
> > > removal. One potential future change is introducing a shrinker to make
> > > this operation O(1), but based on the benchmark above this does not seem
> > > required at this time.
> > > 
> > > Reviewed-by: Burak Emir <bqe@google.com>
> > > Acked-by: Carlos Llamas <cmllamas@google.com>
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  drivers/android/binder/process.rs | 64 ++++++++++++++++++++++++++++-----------
> > >  1 file changed, 47 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> > > index f13a747e784c84a0fb09cbf47442712106eba07c..9264961fd92b33c07fcd5353740cc0b1ec978afd 100644
> > > --- a/drivers/android/binder/process.rs
> > > +++ b/drivers/android/binder/process.rs
> > > @@ -19,6 +19,7 @@
> > >      cred::Credential,
> > >      error::Error,
> > >      fs::file::{self, File},
> > > +    id_pool::IdPool,
> > >      list::{List, ListArc, ListArcField, ListLinks},
> > >      mm,
> > >      prelude::*,
> > > @@ -367,6 +368,8 @@ impl ListItem<{Self::LIST_NODE}> for NodeRefInfo {
> > >  struct ProcessNodeRefs {
> > >      /// Used to look up nodes using the 32-bit id that this process knows it by.
> > >      by_handle: RBTree<u32, ListArc<NodeRefInfo, { NodeRefInfo::LIST_PROC }>>,
> > > +    /// Used to quickly find unused ids in `by_handle`.
> > > +    handle_is_present: IdPool,
> > >      /// Used to look up nodes without knowing their local 32-bit id. The usize is the address of
> > >      /// the underlying `Node` struct as returned by `Node::global_id`.
> > >      by_node: RBTree<usize, u32>,
> > > @@ -381,6 +384,7 @@ impl ProcessNodeRefs {
> > >      fn new() -> Self {
> > >          Self {
> > >              by_handle: RBTree::new(),
> > > +            handle_is_present: IdPool::new(),
> > >              by_node: RBTree::new(),
> > >              freeze_listeners: RBTree::new(),
> > >          }
> > > @@ -775,7 +779,7 @@ pub(crate) fn get_node(
> > >      pub(crate) fn insert_or_update_handle(
> > >          self: ArcBorrow<'_, Process>,
> > >          node_ref: NodeRef,
> > > -        is_mananger: bool,
> > > +        is_manager: bool,
> > >      ) -> Result<u32> {
> > >          {
> > >              let mut refs = self.node_refs.lock();
> > > @@ -794,7 +798,33 @@ pub(crate) fn insert_or_update_handle(
> > >          let reserve2 = RBTreeNodeReservation::new(GFP_KERNEL)?;
> > >          let info = UniqueArc::new_uninit(GFP_KERNEL)?;
> > >  
> > > -        let mut refs = self.node_refs.lock();
> > > +        let mut refs_lock = self.node_refs.lock();
> > > +        let mut refs = &mut *refs_lock;
> > > +
> > > +        let (unused_id, by_handle_slot) = loop {
> > > +            // ID 0 may only be used by the manager.
> > > +            let start = if is_manager { 0 } else { 1 };
> > > +
> > > +            if let Some(res) = refs.handle_is_present.find_unused_id(start) {
> > > +                match refs.by_handle.entry(res.as_u32()) {
> > > +                    rbtree::Entry::Vacant(entry) => break (res, entry),
> > > +                    rbtree::Entry::Occupied(_) => {
> > > +                        pr_err!("Detected mismatch between handle_is_present and by_handle");
> > > +                        res.acquire();
> > > +                        kernel::warn_on!(true);
> > > +                        return Err(EINVAL);
> > 
> > EINVAL means that user provides a wrong parameter. Here's a data
> > corruption. Maybe EFAULT?
> 
> Hmm ... EFAULT is used when the user passes a dangling pointer that
> copy_from_user() refuses to use. I would like to avoid confusion with
> that as well. Is there a third option?
> 
> > > +                    }
> > > +                }
> > > +            }
> > > +
> > > +            let grow_request = refs.handle_is_present.grow_request().ok_or(ENOMEM)?;
> > > +            drop(refs_lock);
> > > +            let resizer = grow_request.realloc(GFP_KERNEL)?;
> > > +            refs_lock = self.node_refs.lock();
> > > +            refs = &mut *refs_lock;
> > > +            refs.handle_is_present.grow(resizer);
> > 
> > This continues puzzling me. Refs_lock protects refs, and the spec
> > says:
> > 
> >     a reference’s scope starts from where it is introduced and
> >     continues through the last time that reference is used.
> > 
> > https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html
> > 
> > The last usage of refs is at .grow_request() line, because later it's
> > reused with the new value. 
> > 
> > If my reading of the spec is correct, after dropping the refs_lock,
> > you may get rescheduled, and another thread may follow the same path.
> > Because refs_lock is dropped explicitly and refs - implicitly, the
> > concurrent thread can grab both and follow with resizing the id map.
> > 
> > When your first thread will get back, you'll end up resizing the
> > already resized map.
> > 
> > I asked your AI, and it says that this race is indeed possible for
> > exactly that reason. But it doesn't break memory safety, so the
> > compiler is happy about it...
> 
> You're right that since we release the mutex, someone else may have
> resized the map in the meantime. That's why we implemented grow() to do
> nothing if it was already resized:
> 
> 	pub fn grow(&mut self, mut resizer: PoolResizer) {
> 	    // Between request to grow that led to allocation of `resizer` and now,
> 	    // another thread may have already grown the capacity.
> 	    // In this case, do nothing, drop `resizer` and move on.
> 	    if resizer.new.len() <= self.capacity() {
> 	        return;
> 	    }
> 	
> 	    resizer.new.copy_and_extend(&self.map);
> 	    self.map = resizer.new;
> 	}

OK, I see...

I expected that you'll switch the pool state to 'growing' before
dropping the ref_lock. This way, the concurrent thread would be able
to go straight to the new iteration.

Something like:
        
        if let Some(res) = refs.handle_is_present.find_unused_id(start) {
                ...
        }

        if refs.is_growing() {
                drop(refs_lock);
                continue;
        }
        let grow_request = refs.handle_is_present.grow_request().ok_or(ENOMEM)?;
        refs.set_growing()
        drop(refs_lock);
        let resizer = grow_request.realloc(GFP_KERNEL)?;
        ...

Your approach also works, assuming you're OK with a useless alloc/free
bitmaps in the case of collision.

So, I can take this series as is, or I can wait for v7 if you prefer.

Please advise.

Thanks,
Yury
