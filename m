Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262C0352944
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763056242; cv=none; b=dNXuxeM7d/bS/4J4xkyZIEl6hmJc0YtbCx1ZnQr/D41MW74O3SIHRTzTirJztj4FQQ31jgvBamKwdTsPSIMtlyLb4+p/7sZghzx5b6Mvpb0Y8q6cd930ongsUOD+EebhwQvwHY7FDz0LjPqFHdmB75zZQntq1RzHOmRzO5Kd3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763056242; c=relaxed/simple;
	bh=G+pURF9WwdcBeWSWrxIp6gPYxG9iJRMNrP5VmKdPu7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqA9UryD7T8WN1A9G6INop0UwqHqqs7lUksbkRgOYle88GUOb6uGOJbUl2VMxxklpy6Ykf6ZQALH9p28Sd52lp9/uU7sJCJKAx7GW7KuFjw2tU0PrskNgoaYGzAOOHbYcOlSTmxjvjloJFctYINMPe+Ew6SVWbWeo73dPCX2Aac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXn3UgDE; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXn3UgDE"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78802ac2296so12440297b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 09:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763056239; x=1763661039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCiL4Jx127OKQeBjNWQG9vQfRbIsSIlUdnID04I7YSQ=;
        b=BXn3UgDEjM5uMMyeHdh10U/cdSJkHACBVPogON4QGV/TC1WaeYSsWRmLzBtMA5zwg7
         k5QIKDlhQu6piRD4vuKIJjU1ccxgl8/TMbnEyg2yB5eoRn80fyksWesA52fnUHajHO+m
         GWF1VbooPbJPhXo/J8ay43fkskC3w+bhZLwH3ERKsAmg1MfnIjti7dXHqQ9tmBz6LQn3
         s7TIClicClW9yZ8uI1z+u1pL+gsaob0U3AeruaYcBB1ug+LibG/MQpv+De+5/r2qAm03
         t1r98M9OcJhlaB1WaMj/u7GNvyz4TBhZIMixxS91XpobsTrVUjj77ro+yP+Zx8hUckEf
         B9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763056239; x=1763661039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCiL4Jx127OKQeBjNWQG9vQfRbIsSIlUdnID04I7YSQ=;
        b=uzhrHWZ/vEP9qgqLCEbZIKrVzQ0Dkl62NYDXwSMEygBAzuXApdtB5wNK85r4HmbxCK
         pIhybx6oCqMLvO18vSK6io+WS/KxVNLFelEIi+lh2Isf8zftI87VJQfT9XnIpw7mhemE
         mX/M6uMmDw6bOFMiUimJ4nEUOheJ73na1xB9fKE6aRIEPm2rQ9spelhPDaEizNrs3MEi
         RFd85BhENk+SqDBSUbFhtbirbr52OptYanpQzeSzeGuUnN0CCJORZ9gKsGFbjl3Alkvk
         j7gf37KFy22joM74x1Ldvk/WrQ5jBPdBIkwwVnj3fiZze0otfJo+coZv7I+KdCTlApG2
         4L7w==
X-Forwarded-Encrypted: i=1; AJvYcCUL7GiAKPGHNn3VhYq5HNabYEl7NuOXU781HaHyWBDndbg+SJK5Niloq/HmVHnjtrvLoV3+Fnw0T6ZIFcT8ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRTq5CRgWc7TjxLjuCxtwQX6ajkIGLDCtDndroWvGGtGCbLRNi
	kh9o1+obzWP2eJRwzznhw0mJeVF3f0bH8ymvOlgNG0PMtpk7eJqt4PtT
X-Gm-Gg: ASbGnctXEfccLiABRa5CYGN9ipsWNsy2aE2BSsMf8kFkHjuEKxy0Or7Y5OX+3sa0XHB
	bJkI50iYrY4dW0y6xKRPOzlEV50pHxbjYrcBgbCuTU9GKGGY0PvBMMJvtjLJ6dop8Psm6TXsuvf
	LMTs4f4IvB+Yw96pSMx3p8jDBoku78o03YCRQjzXYl+4wpfi4a+gJxZ9R5ulYcRJ9/C8wE2y7/4
	1I9JqlYbA47ykM1U0luPbUbBYJBCz7O4Efw1XwtxKMRIk7JrfCjWK6y6HLwd3n7BC21eGozuwlN
	8xxrGDk1ANQ/b6zIXSb+DtST4l3IPY3BTLLJU/iOoHJSGVBmVg4gFLVsodMVJ+I2D/bh8T59gSH
	IBsg2x0hZENu1K4i8vIHTiPuXVEUUp9tKkn2HgqmbrIWZ69TIddOiBcpihujFXYmfX2Jn6X9tXL
	Egi3TTTHcfg7L3bDsQzfjmvv73YPF+fnET6CEg87jkEnA=
X-Google-Smtp-Source: AGHT+IEPm4B/iq/qqXgrDVPIU5K84/ZfKDTF5zZRj1sXxMH/8gptFRhKDCDHGV8CL/sGz7P5y5DCYQ==
X-Received: by 2002:a05:690c:6585:b0:785:d330:e39a with SMTP id 00721157ae682-78929ee4186mr1632867b3.40.1763056239017;
        Thu, 13 Nov 2025 09:50:39 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821ddb632sm8544437b3.11.2025.11.13.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 09:50:38 -0800 (PST)
Date: Thu, 13 Nov 2025 12:50:37 -0500
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
Subject: Re: [PATCH v5 6/6] rust_binder: use bitmap for allocation of handles
Message-ID: <aRYaYlX1vQG_GUAy@yury>
References: <20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com>
 <20251112-binder-bitmap-v5-6-8b9d7c7eca82@google.com>
 <aRTbX6RPsFf0NW48@yury>
 <aRUZq0Fo6T1f3lOD@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRUZq0Fo6T1f3lOD@google.com>

On Wed, Nov 12, 2025 at 11:35:07PM +0000, Alice Ryhl wrote:
> On Wed, Nov 12, 2025 at 02:09:19PM -0500, Yury Norov wrote:
> > On Wed, Nov 12, 2025 at 12:47:24PM +0000, Alice Ryhl wrote:
> > > To find an unused Binder handle, Rust Binder currently iterates the
> > > red/black tree from the beginning until it finds a gap in the keys. This
> > > is extremely slow.
> > 
> > Can you share performance numbers? 
> 
> I have not benchmarked it in the Rust driver, but it replaces
> potentially thousands of calls to rb_next() with a single call to
> find_unused_id(), so I'm feeling good about the performance. And the

Feelings are good, but numbers are better. In the original dbitmap
patch, Carlos shared the experiment details and rough numbers, and
it's enough for me. Can you just reproduce his steps?

> equivalent change in the C driver was done because this particular piece
> of code was causing contention issues by holding the spinlock for a long
> time.
> 
> The characteristics of this collection is that there is one per process
> using the driver. Most processes have only a few entries in this bitmap,
> so the inline representation will apply in most cases. However, there
> are a few processes that have a large number of entries in the 4 to
> maybe 5 figures range. Those processes are what caused the contention
> issue mentioned above.
> 
> > > To improve the performance, add a bitmap that keeps track of which
> > > indices are actually in use. This allows us to quickly find an unused
> > > key in the red/black tree.
> > > 
> > > This logic matches the approach used by C Binder. It was chosen
> > > partially because it's the most memory efficient solution.
> > 
> > That inaccurate. You are adding a new data structure (bitmap), advocating
> > it with an improvement on search side, and that makes sense.
> > 
> > But now you're saying it's also a more memory efficient approach, which
> > doesn't sound trivial because the most memory efficient solution is to
> > bring no new data structures at all.
> > 
> > I guess you meant that bitmap is the most efficient data structure to
> > index used/unused nodes. If so, can you please rephrase the sentence?
> 
> Yes I can rephrase.
> 
> Adding more data is of course always less memory efficient. What I meant
> is that this is more memory efficient than the competing solution of
> using an augmented rbtree that Carlos mentioned here:
> 
> https://lore.kernel.org/p/aC1PQ7tmcqMSmbHc@google.com
> 
> > > +            if let Some(res) = refs.handle_is_present.find_unused_id(start) {
> > > +                match refs.by_handle.entry(res.as_u32()) {
> > > +                    rbtree::Entry::Vacant(entry) => break (res, entry),
> > > +                    rbtree::Entry::Occupied(_) => {
> > > +                        pr_err!("Detected mismatch between handle_is_present and by_handle");
> > > +                        res.acquire();
> > > +                        continue;
> > 
> > At this point you've detected mismatch between two linked data
> > structures. It means that one of them or both are corrupted. To
> > me it looks fatal, and your pr_err() confirms it. How could you
> > continue then?
> 
> Although we should never hit this codepath in real code, I don't think
> we need to kill the kernel. We can treat the r/b tree as source of truth
> and adjust the bitmap when mismathces are detected.

There's no such thing like a 'source of truth', and rb-tree is not even
close to that.

You add bitmap for performance reasons, but with that you also bring
some redundancy. Now, you cross-check two data structures and see
discrepancy. At this point you can only say that either one of them
or both are corrupted.

Relying on rb-tree over bitmap is simply wrong. Statistically
speaking, there's more chances to corrupt rb-tree - just because it
is scattered and takes more memory.

> I could add a kernel warning, though. That shouldn't kill an Android
> device.

Assuming, you're talking about WARN(), I agree. But it looks like my
reasoning differs.
 
You never hit this path during a normal operation, as you said. So if
you're there, it means that something is already going wrong. If you
issue WARN(), you let those focused on system integrity to leverage
panic_on_warn and shut the system down to minimize any possible damage. 

With that precaution, you're free to do whatever you find practical to
'recover', or even do nothing. But please avoid referring rb-tree as a
source of truth - it's a misleading and dangerous misconception.

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
> > Is it possible to turn this block into a less wordy statement? Maybe a
> > wrapper function for it? Ideally, the grow request should be handled
> > transparently in .find_unused_id().
> 
> I can extract this block into a separate function, but I think it would
> be tricky to move the entire logic inside .find_unused_id() because of
> the mutex lock/unlock situation.
> 
> > > @@ -905,6 +924,16 @@ pub(crate) fn update_ref(
> > >                  let id = info.node_ref().node.global_id();
> > >                  refs.by_handle.remove(&handle);
> > >                  refs.by_node.remove(&id);
> > > +                refs.handle_is_present.release_id(handle as usize);
> > > +
> > > +                if let Some(shrink) = refs.handle_is_present.shrink_request() {
> > 
> > This is questionable. Shrinking is usually the very slow path, and we
> > don't shrink unless we're really close or even inside the OOM condition.
> > 
> > In this case, shrink_request() on average returns false, but it's
> > O(N), which makes _every_ release_id() O(N), while it should be O(1).
> 
> The current implementation of shrink_request() will refuse to shrink the
> pool unless the largest bit is less than 1/4 of the capacity, so it
> should not perform the expensive operation very often.
> 
> That said, it does call find_last_bit() each time, which I guess is
> O(N). But my assumption was that find_last_bit() is cheap enough that it
> wouldn't be a problem.

It's O(N), while the expectation for release_id() is to be O(1). But if
you think it's OK for you - I'm OK as well. Can you explicitly mention
it in function description?

> > Consider a very realistic case: you're destroying every object, and thus
> > removing every ID in the associate ID pool, doing it in LIFO order. That
> > way you will need to call shrink_request() about O(log(N)) times, making
> > the whole complexity ~O(N*log(N)); and you'll have to make log(N)
> > realloc()s for nothing. If you release IDs in FIFO order, you don't
> > call realloc(), but your shrink_request() total complexity will be O(N^2). 
> 
> Even if we end up making log(N) reallocs, the total complexity of the
> reallocs is O(N) because the amount of data being reallocd halves each
> time. So the total number of bytes copied by reallocs ends up being:
> 
>     1 + 2 + 4 + 8 + ... + 2^log(N) <= 2^(1+log(N)) = 2*N
> 
> which is O(N).

OK, I trust your math better than mine. :)

> Of course, deleting the corresponding entry from the red/black tree is
> O(log N), so it's still O(N*log(N)) for the N deletions from the rb
> tree.
> 
> > Can you compare performance numbers with and without shrinking under a
> > typical payload? Is there any mechanism to inspect the ID pools at runtime,
> > like expose via procfs?
> 
> We expose the contents of the red/black tree via the binder_logs
> mechanism, but that doesn't show the *capacity* of the bitmap. Only the
> index of the largest set bit.
> 
> > Can you make your shrinking logic conditional on some reasonable OOM
> > heuristics, maybe OOM event driven?
> > 
> > And even without OOM, you can safely skip shrinking if the number of IDs in
> > use is greater than 1/4 of the capacity, or there's any used ID with
> > the index greater than the 1/2 capacity.
> 
> I guess we could register a shrinker, but I don't think it's worth it.

OK, if you're fine with O(N) for release_id() - I'm fine as well. Can
you mention OOM-driven shrinking as a possible alternative for the
following improvements?

Thanks,
Yury
