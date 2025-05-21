Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE0C239E62
	for <rust-for-linux@vger.kernel.org>; Wed, 21 May 2025 22:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747867228; cv=none; b=Y/ErPIjVbyYfoS6cCG4WXByRb38jEIUqEfhlgdqU9llXdDMVRw1f0sd86gp4zUq9mVV9ViJb4oh8z2YxlI1ylGI79IOxQgJn6cwHZkVsj4HikfY8s7teSq0U4SeMYd+uFRwVbY57CSc1kEHf/o3oiuDlOe7bnx8px6JseDVXN84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747867228; c=relaxed/simple;
	bh=F4TUNNkSdlkr8t9q3Z3MT3g+NNfMKFvdORSGoJ0bvFw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZFT7tFqraTR2IoSvI/vB2ATKUFMzD5WMN4PxnAw7mi3KspEqs4CFGJjXgrQJDk+JZmSyXSt+R7DbuR09xiS1BOZB4qQxDkZS8NcvG0nww7vM+AuOxB5dvEp10kJz3SYTeNm8UO3ocIYmErG0CE5fMX8E7NZqviA/nBW+YVNGNZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CO2sMfVM; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CO2sMfVM"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a36bbfbd96so2055186f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 May 2025 15:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747867224; x=1748472024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeyfoSdrjT500rt7W8gHkxdV1/qT0T253oIZuxVzNcM=;
        b=CO2sMfVMN1IjuGajAesuZNSoEmhHK3zcVKrj1QNnkU1vNo9FSFqT3edvVb5TQNt4yn
         RDbByFr6ARpzf+YKVMji5BS5odnoTIMGFdczX27ih122qiR2hIMVHfY4nSoGbeYw4Rdz
         5o4lSTq11jidyMR+oCCJYDY6/JLyVLCOYdH+WYRsIvXZfr3B8/S7uCfH4hq5qprGy8qw
         8UkqchjJMd2Dzy6Gg/qkYb41foUzh06La5zAVSl8Zf2wNUA4IGX0+bsRrTHpa3qcDAYQ
         026bsyI99YrGozIB2R+rX/+zVUpLGlN0zM/4oiwj1ky8uvRg01QydjmuigTtVM5JeFWR
         BsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747867224; x=1748472024;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JeyfoSdrjT500rt7W8gHkxdV1/qT0T253oIZuxVzNcM=;
        b=nno34Kmr1drW1JnUpMmNu19EhzzmS1r6b0kxB/ZOoogpcIpkIgBTs011IlMWRnqKrC
         nQ+fPoeLYa5mflTXMg/dE4IrLxA9tmC83Dpfe7KJC9vv0BEH52wVpNuGfD7yTQZRiCKd
         ucRRJGC/J/JDV2QxTbHKoAMFS9E5izwkpJEVm9f2c4sHjjohfSFWl5lruRq8caAYgosW
         guorwGkAltjyTamcnd3zJpgvr/D7TP0LArSkUIsMqbwEDrer/0bAbhxo2PfmOPIL5qj9
         UUKepGML5Bqt3oprGxPC4p1ylxN/m+cOIw7FJD/Ko4e9wuECNdIelzQMRIZOuzTPvX9W
         pLDg==
X-Forwarded-Encrypted: i=1; AJvYcCXA/8A6yLJs0qAvDuVNstD0myR9HyvUWp1rzmE4ViHEDmj173odqEixPgPrfeVKO6cAqLABnXGFRVJ5ZdKNcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHH7QllGllNOn0KM1clJ/vCkCGr0mTvCdtNSTQykNxi3QBtJ49
	qcf6AMUVN9oM8pXy9gCln1HUsRJpXbWgQ0l0xJngLs+ovZhRXQyQ+pzNEbUoAwz+o2ID2SaXUEw
	lUQcMwwef5xEAa7iGqg==
X-Google-Smtp-Source: AGHT+IFkc5ma9H5Ql4lDi9DIkUwgKb5ji7hQh7JWeeel8ZTiKf9PND+wMCUhMELv8D2cl3E0lQdTENZQ2Jup0SM=
X-Received: from wrbee18.prod.google.com ([2002:a05:6000:2112:b0:3a3:66c9:9231])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4308:b0:3a3:75d7:585f with SMTP id ffacd0b85a97d-3a375d758b0mr11092710f8f.55.1747867224588;
 Wed, 21 May 2025 15:40:24 -0700 (PDT)
Date: Wed, 21 May 2025 22:40:22 +0000
In-Reply-To: <2025052148-copied-riverside-6187@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com> <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux> <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org> <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com> <2025052148-copied-riverside-6187@gregkh>
Message-ID: <aC5WVgf7PlvmsAfO@google.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benno Lossin <lossin@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 06:47:40AM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 20, 2025 at 09:24:21PM +0000, Alice Ryhl wrote:
> > On Thu, May 15, 2025 at 01:43:09PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, May 15, 2025 at 10:59:44AM +0200, Benno Lossin wrote:
> > > > On Wed May 14, 2025 at 11:55 PM CEST, Matthew Maurer wrote:
> > > > > On Wed, May 14, 2025 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@ke=
rnel.org> wrote:
> > > > >> However, I really think we should keep the code as it is in this=
 version and
> > > > >> just don't provide an example that utilizes ManuallyDrop and for=
get().
> > > > >>
> > > > >> I don't see how the idea of "manually dropping" (sub-)directorie=
s and files
> > > > >> provides any real value compared to just storing their instance =
in a driver
> > > > >> structure as long as they should stay alive, which is much more =
intuitive
> > > > >> anyways.
> > > > >
> > > > > We can't easily do this, because dropping a root directory recurs=
ively
> > > > > drops everything underneath it. This means that if I have
> > > > >
> > > > > foo/
> > > > >   - bar/
> > > > >   - baz/
> > > > >
> > > > > Then my directory handle for `bar` have to be guaranteed to outli=
ve my
> > > > > directory handle for `foo` so that I know it's didn't get deleted
> > > > > under me. This is why they have a borrow onto their parent direct=
ory.
> > > > > This borrow means that you can't (without `unsafe`, or something =
like
> > > > > `yoke`) keep handles to `foo` and `bar` in the same struct.
> > > >=20
> > > > Is there no refcount that we can use instead of borrowing? I guess =
not,
> > > > since one can call `debugfs_remove`. What about a refcount on the r=
ust
> > > > side? or is debugfs not used for "debugging" and needs to have the
> > > > performance of no refcount?
> > >=20
> > > debugfs should never have any performance issues (i.e. you don't use =
it
> > > for performant things.)
> > >=20
> > > So refcount away!  That should never be an issue.
> >=20
> > What I imagine would be the ideal API for Rust is the following:
> >=20
> > * For each file / dir you create, you get a Rust object that owns it.
> >=20
> > * When you destroy one of these Rust objects, it disappears from the
> >   file system. I.e., dropping a directory removes things recursively.
> >=20
> > * If you remove a directory before the removing objects inside it, then
> >   the Rust objects become "ghost" objects that are still usable, but no=
t
> >   visible in the file system anywhere. I.e. calling methods on them
> >   succeed but are no-ops.
>=20
> Why not just also remove those objects at the same time?  That would be
> more like what the filesystem logic itself does today.

I mean, if I write a driver and I store a Rust object that holds a
debugfs directory in some random struct of mine, how is debugfs going to
go remove it from my struct? It can't.

At most we could enforce that you destroy them in the right order, but
actually designing an API which enforces that is difficult and results
in something inconvenient to use.

Of course, drivers probably shouldn't keep those ghost objects around,
but I don't think the API should hard enforce that.

Alice

> > * Possibly we have a way to drop a Rust object without removing it from
> >   the file system. In this case, it can never be accessed from Rust
> >   again, and the only way to remove it is to drop its parent directory.
>=20
> This too would be nice as that's how the existing api works in C.
>=20
> > This way, you can drop foo/ before dropping bar/ and baz/ without that
> > having to be unsafe.
> >=20
> > Whether that's best implemented by calling dget/dput on the dentry or b=
y
> > having Rust keep track of a separate Rust-only refcount, I don't know.
> > But I think this is the API we want.
> >=20
> > Thoughts?
>=20
> Sounds reasonable to me and should be easy to use, which is the key
> feature/requirement of debugfs.
>=20
> thanks,
>=20
> greg k-h
