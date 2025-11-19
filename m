Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117B5285073
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 23:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763594199; cv=none; b=igQq2NS+5zAGaWpI/CHE4flwRrLwUS0dO5zXRbFzRmRJJjgaRVf/7hPMzKBEoQq8de4yzzp7DSxoNwYx2PqDWVZtNxXviy5k1OEoZtTFPeheD7RB3OB/zjDrxZAeGK96AfBky6hFpChIjv2KF/w5+biEeAUCpuS6hPNzpmURPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763594199; c=relaxed/simple;
	bh=6819ew1JTDlq8XM58WhGI/6mR6nYw+O/0s7I4LZCP+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YIh9sAVv2WEpkhOfkBp7tnM/ActF1rUg18EI97ApqCokId9ubkR7XL4ciqA9aDBvHGsfRh4Xvin1XHJrQiI94jL3oOBTBiIbknYUKBllSY7kgJmh84YUJtnrgxk4IKOt7iG31c0h16hm+Y2iRDbRwQmbGQY4gnA4hvZp4SEGzp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KVle52Q5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KVle52Q5"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so1410715e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 15:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763594195; x=1764198995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0Y7lpsUyEob9okgJWe1nZjmuawPW4ZJgLTZU7r5XIY=;
        b=KVle52Q58jU2YJPjOLaDDVzQrGS7PzNygRq+bPjDqtvFiIjbVP4Anx6T2ifNmpMKtU
         hpg0legYVZlG/X9Hba11cb6JqVC1GpF+aUXFYvr+AYsJ56JZtjFW779GcZJ7GLjmhPBi
         /VqLPl+yggD86YYYOdkF5YGfpuqOiSQnu7hb9wMRP/zeYJYPGWmf0xAJ/8aX4JBzu0Go
         M35vyKdZgL+S0jJJh2neMBWo9VPVJU5WNrwcZGac/wq463aXkee+qfiutxvm2V29hVwM
         LHT/kyxcOyNtAwiJDQgSUvW7D1dyGeQmHrkwOKkPwOJWUFE4qGZvX6fRcS/w2s1W1egG
         h0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763594195; x=1764198995;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M0Y7lpsUyEob9okgJWe1nZjmuawPW4ZJgLTZU7r5XIY=;
        b=AWwgH77vp8/gGxK6zZ0uDJcZMzXBMvBUUfOEbAVym9T0ge4Mic6rTHu1wg7MtvNE1a
         e3DrtWPmW3kB4zANIIrzMtnzmki1E6mcGSrHYZ5IOQFAj+W0NtYzXjTciFtZ2zrUzzgF
         P+CTuq+mrIRwlWAGdR7qxl0yoETPWlWwA8+nwCovj7F3kJWgv4jHh9ouhN5zLPyv0l4S
         7z1gxDrMjtp9paIjNDrROvpyb8/UmpG8J6gRzKkIF26lr5SPGfU2HcEvMCAdKdFU6f6H
         E3ha6Tg/LdyA+/nhgGX0SSYzFzSQ8OwgpawhAx07/YH5d+9LnXZTmBsSv5pPq5Kcew75
         DRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2x54ouFxkZpBLV9k6MFwhVZSBWnejvK6KANw6nnEVTIZI3RYjEMNRN3PTTcjYi6WiL9uUStwgilXonNsAiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzM14AtmF8qR0htNMyf26xu+UveaiWknr0vgt4dLAST/Xh4NT/
	9MKBMWyH/KgDy3NsEH1V9NbW9WNIWg36ZIQl9UneN98tZiUEEMkBuKbgMvJcngkrdb55gagnwmp
	njHPawyirqL2+3lrWkA==
X-Google-Smtp-Source: AGHT+IEAOHtWJGzitBQX2gXZDgWrZnmSYfHRAxSGmUv+Ah5idax46Q/YOhOCs6vu8203eWUfTXYkiDOThZMEqNg=
X-Received: from wmoo13.prod.google.com ([2002:a05:600d:10d:b0:46f:b32b:55f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3115:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-477b8a9d734mr7277525e9.29.1763594195556;
 Wed, 19 Nov 2025 15:16:35 -0800 (PST)
Date: Wed, 19 Nov 2025 23:16:34 +0000
In-Reply-To: <aRYaYlX1vQG_GUAy@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112-binder-bitmap-v5-0-8b9d7c7eca82@google.com>
 <20251112-binder-bitmap-v5-6-8b9d7c7eca82@google.com> <aRTbX6RPsFf0NW48@yury>
 <aRUZq0Fo6T1f3lOD@google.com> <aRYaYlX1vQG_GUAy@yury>
Message-ID: <aR5P0p-7SQ8dGrmz@google.com>
Subject: Re: [PATCH v5 6/6] rust_binder: use bitmap for allocation of handles
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

On Thu, Nov 13, 2025 at 12:50:37PM -0500, Yury Norov wrote:
> On Wed, Nov 12, 2025 at 11:35:07PM +0000, Alice Ryhl wrote:
> > On Wed, Nov 12, 2025 at 02:09:19PM -0500, Yury Norov wrote:
> > > On Wed, Nov 12, 2025 at 12:47:24PM +0000, Alice Ryhl wrote:
> > > > To find an unused Binder handle, Rust Binder currently iterates the
> > > > red/black tree from the beginning until it finds a gap in the keys.=
 This
> > > > is extremely slow.
> > >=20
> > > Can you share performance numbers?=20
> >=20
> > I have not benchmarked it in the Rust driver, but it replaces
> > potentially thousands of calls to rb_next() with a single call to
> > find_unused_id(), so I'm feeling good about the performance. And the
>=20
> Feelings are good, but numbers are better. In the original dbitmap
> patch, Carlos shared the experiment details and rough numbers, and
> it's enough for me. Can you just reproduce his steps?

Unfortunately Carlos doesn't have his benchmark files anymore, but I
made my own benchmark. It's a test where a client repeatedly sends a
transaction containing a node to a server, and the server stashes it
forever. This way, the number of nodes keeps growing forever. (Up to
100k nodes.)

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

The numbers measure the roundtrip latency in microseconds that it takes
to send the transaction containing the node, and to receive the
response.

I would not necessarily trust the precise numbers. Rust seems slightly
better here, but I ran it on an emulator so it may be noisy. Regardless,
I think it's pretty clear that an improvement has happened.

> > equivalent change in the C driver was done because this particular piec=
e
> > of code was causing contention issues by holding the spinlock for a lon=
g
> > time.
> >=20
> > The characteristics of this collection is that there is one per process
> > using the driver. Most processes have only a few entries in this bitmap=
,
> > so the inline representation will apply in most cases. However, there
> > are a few processes that have a large number of entries in the 4 to
> > maybe 5 figures range. Those processes are what caused the contention
> > issue mentioned above.
> >=20
> > > > To improve the performance, add a bitmap that keeps track of which
> > > > indices are actually in use. This allows us to quickly find an unus=
ed
> > > > key in the red/black tree.
> > > >=20
> > > > This logic matches the approach used by C Binder. It was chosen
> > > > partially because it's the most memory efficient solution.
> > >=20
> > > That inaccurate. You are adding a new data structure (bitmap), advoca=
ting
> > > it with an improvement on search side, and that makes sense.
> > >=20
> > > But now you're saying it's also a more memory efficient approach, whi=
ch
> > > doesn't sound trivial because the most memory efficient solution is t=
o
> > > bring no new data structures at all.
> > >=20
> > > I guess you meant that bitmap is the most efficient data structure to
> > > index used/unused nodes. If so, can you please rephrase the sentence?
> >=20
> > Yes I can rephrase.
> >=20
> > Adding more data is of course always less memory efficient. What I mean=
t
> > is that this is more memory efficient than the competing solution of
> > using an augmented rbtree that Carlos mentioned here:
> >=20
> > https://lore.kernel.org/p/aC1PQ7tmcqMSmbHc@google.com
> >=20
> > > > +            if let Some(res) =3D refs.handle_is_present.find_unuse=
d_id(start) {
> > > > +                match refs.by_handle.entry(res.as_u32()) {
> > > > +                    rbtree::Entry::Vacant(entry) =3D> break (res, =
entry),
> > > > +                    rbtree::Entry::Occupied(_) =3D> {
> > > > +                        pr_err!("Detected mismatch between handle_=
is_present and by_handle");
> > > > +                        res.acquire();
> > > > +                        continue;
> > >=20
> > > At this point you've detected mismatch between two linked data
> > > structures. It means that one of them or both are corrupted. To
> > > me it looks fatal, and your pr_err() confirms it. How could you
> > > continue then?
> >=20
> > Although we should never hit this codepath in real code, I don't think
> > we need to kill the kernel. We can treat the r/b tree as source of trut=
h
> > and adjust the bitmap when mismathces are detected.
>=20
> There's no such thing like a 'source of truth', and rb-tree is not even
> close to that.
>=20
> You add bitmap for performance reasons, but with that you also bring
> some redundancy. Now, you cross-check two data structures and see
> discrepancy. At this point you can only say that either one of them
> or both are corrupted.
>=20
> Relying on rb-tree over bitmap is simply wrong. Statistically
> speaking, there's more chances to corrupt rb-tree - just because it
> is scattered and takes more memory.
>=20
> > I could add a kernel warning, though. That shouldn't kill an Android
> > device.
>=20
> Assuming, you're talking about WARN(), I agree. But it looks like my
> reasoning differs.
> =20
> You never hit this path during a normal operation, as you said. So if
> you're there, it means that something is already going wrong. If you
> issue WARN(), you let those focused on system integrity to leverage
> panic_on_warn and shut the system down to minimize any possible damage.=
=20
>=20
> With that precaution, you're free to do whatever you find practical to
> 'recover', or even do nothing. But please avoid referring rb-tree as a
> source of truth - it's a misleading and dangerous misconception.

Ok.

I picked the rb-tree because using the bitmap isn't possible - it
doesn't store the auxiliary data that we need.

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
> > > Is it possible to turn this block into a less wordy statement? Maybe =
a
> > > wrapper function for it? Ideally, the grow request should be handled
> > > transparently in .find_unused_id().
> >=20
> > I can extract this block into a separate function, but I think it would
> > be tricky to move the entire logic inside .find_unused_id() because of
> > the mutex lock/unlock situation.
> >=20
> > > > @@ -905,6 +924,16 @@ pub(crate) fn update_ref(
> > > >                  let id =3D info.node_ref().node.global_id();
> > > >                  refs.by_handle.remove(&handle);
> > > >                  refs.by_node.remove(&id);
> > > > +                refs.handle_is_present.release_id(handle as usize)=
;
> > > > +
> > > > +                if let Some(shrink) =3D refs.handle_is_present.shr=
ink_request() {
> > >=20
> > > This is questionable. Shrinking is usually the very slow path, and we
> > > don't shrink unless we're really close or even inside the OOM conditi=
on.
> > >=20
> > > In this case, shrink_request() on average returns false, but it's
> > > O(N), which makes _every_ release_id() O(N), while it should be O(1).
> >=20
> > The current implementation of shrink_request() will refuse to shrink th=
e
> > pool unless the largest bit is less than 1/4 of the capacity, so it
> > should not perform the expensive operation very often.
> >=20
> > That said, it does call find_last_bit() each time, which I guess is
> > O(N). But my assumption was that find_last_bit() is cheap enough that i=
t
> > wouldn't be a problem.
>=20
> It's O(N), while the expectation for release_id() is to be O(1). But if
> you think it's OK for you - I'm OK as well. Can you explicitly mention
> it in function description?

Sure I will mention it.

> > > Consider a very realistic case: you're destroying every object, and t=
hus
> > > removing every ID in the associate ID pool, doing it in LIFO order. T=
hat
> > > way you will need to call shrink_request() about O(log(N)) times, mak=
ing
> > > the whole complexity ~O(N*log(N)); and you'll have to make log(N)
> > > realloc()s for nothing. If you release IDs in FIFO order, you don't
> > > call realloc(), but your shrink_request() total complexity will be O(=
N^2).=20
> >=20
> > Even if we end up making log(N) reallocs, the total complexity of the
> > reallocs is O(N) because the amount of data being reallocd halves each
> > time. So the total number of bytes copied by reallocs ends up being:
> >=20
> >     1 + 2 + 4 + 8 + ... + 2^log(N) <=3D 2^(1+log(N)) =3D 2*N
> >=20
> > which is O(N).
>=20
> OK, I trust your math better than mine. :)
>=20
> > Of course, deleting the corresponding entry from the red/black tree is
> > O(log N), so it's still O(N*log(N)) for the N deletions from the rb
> > tree.
> >=20
> > > Can you compare performance numbers with and without shrinking under =
a
> > > typical payload? Is there any mechanism to inspect the ID pools at ru=
ntime,
> > > like expose via procfs?
> >=20
> > We expose the contents of the red/black tree via the binder_logs
> > mechanism, but that doesn't show the *capacity* of the bitmap. Only the
> > index of the largest set bit.
> >=20
> > > Can you make your shrinking logic conditional on some reasonable OOM
> > > heuristics, maybe OOM event driven?
> > >=20
> > > And even without OOM, you can safely skip shrinking if the number of =
IDs in
> > > use is greater than 1/4 of the capacity, or there's any used ID with
> > > the index greater than the 1/2 capacity.
> >=20
> > I guess we could register a shrinker, but I don't think it's worth it.
>=20
> OK, if you're fine with O(N) for release_id() - I'm fine as well. Can
> you mention OOM-driven shrinking as a possible alternative for the
> following improvements?

Sure.

Alice
