Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E561607AA
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738003583; cv=none; b=GgBuz1+dumqRapLG1gsviV8gzodZ9F6EkuT0/wHQB9A9+Zrrl6FuGrwFlWwa580YpglptwejmAvupmsIkQrTKllIJJ0rnZfNM2ckbVuNhmKBOKz8Wxq3mAYA7XA1wqj8tpGUnwTrq9A38lqn9vm+w915x/d3fukbkKbbHrlb6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738003583; c=relaxed/simple;
	bh=1/hEfhmsZwHtxBNgdcIE5tWv7Z4fLzWlapqB3RcloFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AiT467P4a5oyuDsd5BGk+Bf7/rIUlSOg7clRN5fbIWmbPf1lVEyzjK7WZbzSjLaQjxKestxEAm6ba0BfEXX896bJoqF1qHOO3clcmLf7g0WDeYmZ4L43qXznPO55ib0NotmhUxENoVYhuCLXQhw6rGsgr1Ss1/W5OzARxPYMIBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DQzFmZ2Y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DQzFmZ2Y"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21619108a6bso82185675ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 10:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738003581; x=1738608381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3azsXe/QUYCzk8M1oTs9RKLsapk8KSqNyNBvk1iWmU=;
        b=DQzFmZ2YdSV2m8rvcZZvkOvUGBRtNlLdpAPtkLWpSy81JbMwm6d2VwHgLCnM2jjvs7
         h3Wt0W8eYjYMqiYoLtReDO0i5gkEA/StTkUzv/eF+KPvDEwF1nFbnwxKVPqGdQ7Hd6PO
         5IGL2VFrLXc9ZTgqt3zxXFi196lSGxSwBxpmHfG5T/LeFzDyEPPqxMTVZppH7FHOccGx
         v6Ph8gl2Sg9XnR6MutOxa8jxlnuW97wLVr/un1UkMKFs4MT82GTzxQD6CieHqal/wm8d
         bzj5GtpiVMC+gjMh9M+Oi+jpQNvn6y+WRfm8bROafSmCRVUBJ4mpEKzlSVZkn4LxrxvC
         IYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738003581; x=1738608381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3azsXe/QUYCzk8M1oTs9RKLsapk8KSqNyNBvk1iWmU=;
        b=hMq8DWULpoeQvpIi5wVdHLT3hXgS9aMqRQpocaTUYGlGIbHSnrGKNty/BlsIcWDSgM
         LvRlvzQQjZAyOgrCPwLukGaHnkJJoDLZhATrqCkQiyYiuqwbF0pSt873epm8ySV92nIP
         lBZMTh9OM4HpW0LAdEQRNmCtKGeF2+Sxk7uMv3MhvsUBzyyeF1CSa9nDGvJ3MSSOEIYR
         V5hYwAhZefc+4yNU97xxH5vziBOAMD0lheR/HAfU/cw0YDFKPS1QMXzyLip8ENXLq6hU
         XCVBolC9ysBjdSZBal8uvwzwGh4PJYEpeL/VwGrIWVuMDuSCDFZ4JnzxKyB+dV4YL4RN
         9FIA==
X-Forwarded-Encrypted: i=1; AJvYcCVcgXMudKAzL848UtjHT6msy6J56z7GgkDdLniaAlF2eszyJTHrkyygBH5Ox8SXa3ft4QD5XCyOq5sjwSu2jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPwa0idZWbknpRbOb5gyMzsniQGBcl56PUSLfhoZy66XRHD4iU
	NyHSgqS3khhK55VInKATI91Xtjd2fNTZhrBwp/AW1OOqc/dy4fwd3G1V5g0b7XQQ4VUceUcxt38
	Vs10ITpTa8N5WO+y6pISXamWl7Y4mcrHEOgxz
X-Gm-Gg: ASbGnct3BFOBh8Y1n6W00EMlF9ZmNXWdVbX0QF9rW4hXMu3IWcYVA8c492MO7UjGbfL
	A2IyrAGxdrpBM64fskKqLbHmwkcO8hq1hMMGNVx20ht+UxIDQvszBbODJrGOcpKU=
X-Google-Smtp-Source: AGHT+IGu4QYWh50GzZRoKDRDPuCNNKTruerIw1VnfjD1UHWPumeaRIWh7QpjQK/KSsRvPmNr1LKk9phWck6+ZWVkMAA=
X-Received: by 2002:a17:902:e745:b0:215:5a53:edee with SMTP id
 d9443c01a7336-21c352d704amr553455545ad.9.1738003580773; Mon, 27 Jan 2025
 10:46:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com> <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <Z5dh6cSnNxwbefJX@pollux> <CAH5fLggMSiHZwHJ3md0eH7smyDNVL3L=Sre7F0SXSSnPrJiO-A@mail.gmail.com>
 <Z5e7Xv4Y9007Ia0a@tardis.local> <CAH5fLgh6_+yT36KQTML6wZTiKXO10HsueCDM5LvEbsD-8Wo6Jg@mail.gmail.com>
 <Z5fSrgLO0nO67p-U@tardis.local>
In-Reply-To: <Z5fSrgLO0nO67p-U@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 19:46:07 +0100
X-Gm-Features: AWEUYZkfr7mbpFbAiAcPPo688QAJfa8w1YftGsBfN33_tI8Nwk6gSNVDV7OUq44
Message-ID: <CAH5fLggQuuOfp19tqxYr=U-R+fyqgygYV8MeybvHLChk_eHPMw@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 7:38=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Mon, Jan 27, 2025 at 07:32:29PM +0100, Alice Ryhl wrote:
> > On Mon, Jan 27, 2025 at 5:59=E2=80=AFPM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > On Mon, Jan 27, 2025 at 11:43:39AM +0100, Alice Ryhl wrote:
> > > > On Mon, Jan 27, 2025 at 11:37=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > >
> > > > > On Fri, Jan 24, 2025 at 08:27:36AM +0100, Alice Ryhl wrote:
> > > > > > On Thu, Jan 23, 2025 at 11:43=E2=80=AFAM Abdiel Janulgue
> > > > > > <abdiel.janulgue@gmail.com> wrote:
> > > > > > > +    /// Reads data from the region starting from `offset` as=
 a slice.
> > > > > > > +    /// `offset` and `count` are in units of `T`, not the nu=
mber of bytes.
> > > > > > > +    ///
> > > > > > > +    /// Due to the safety requirements of slice, the data re=
turned should be regarded by the
> > > > > > > +    /// caller as a snapshot of the region when this functio=
n is called, as the region could
> > > > > > > +    /// be modified by the device at anytime. For ringbuffer=
 type of r/w access or use-cases
> > > > > > > +    /// where the pointer to the live data is needed, `start=
_ptr()` or `start_ptr_mut()`
> > > > > > > +    /// could be used instead.
> > > > > > > +    ///
> > > > > > > +    /// # Safety
> > > > > > > +    ///
> > > > > > > +    /// Callers must ensure that no hardware operations that=
 involve the buffer are currently
> > > > > > > +    /// taking place while the returned slice is live.
> > > > > > > +    pub unsafe fn as_slice(&self, offset: usize, count: usiz=
e) -> Result<&[T]> {
> > > > > >
> > > > > > You were asked to rename this function because it returns a sli=
ce, but
> > > > > > I wonder if it's better to take an `&mut [T]` argument and to h=
ave
> > > > > > this function copy data into that argument. That way, we could =
make
> > > > > > the function itself safe. Perhaps the actual copy needs to be
> > > > > > volatile?
> > > > >
> > > > > Why do we consider the existing one unsafe?
> > > > >
> > > > > Surely, it's not desirable that the contents of the buffer are mo=
dified by the
> > > > > HW unexpectedly, but is this a concern in terms of Rust safety re=
quirements?
> > > > >
> > > > > And if so, how does this go away with the proposed approach?
> > > >
> > > > In Rust, it is undefined behavior if the value behind an immutable
> > > > reference changes (unless the type uses UnsafeCell / Opaque or
> > > > similar). That is, any two consecutive reads of the same immutable
> > > > reference must return the same byte value no matter what happened i=
n
> > > > between those reads.
> > > >
> > > > If we manually perform the read as a volatile read, then it is
> > > > arguably allowed for the value to be modified by the hardware while=
 we
> > > > read the value.
> > > >
> > >
> > > Do you also assume that volatile read/write provide some sort of
> > > atomicity? Because otherwise even though the read/write may not be
> > > considered as UB, then results can be load/store teared.
> > >
> > > I asked because I think in case that we need atomicity, we should jus=
t
> > > use atomic APIs.
> >
> > No, I'm not assuming that. I think it's like uaccess. Under normal
> > cases, it's not going to be concurrently modified, but it shouldn't
> > trigger UB if it is.
> >
>
> Let's say my_alloc[7].foo is a (u64, u64), would
>
>         dma_read!(my_alloc[7].foo)
>
> and
>
>         dma_write!(my_alloc[7].foo, (1u64, 2u64))
>
> trigger any UB when they are concurrent? (Of course, the example here is
> a bit inpropriate because it's DMA buff, but still the question is more
> on whatever atomic expectation we want from read_volatile() and
> write_volatile()).

I imagine that it would be most convenient for it to not be UB, but I
also don't think people would have an expectation for that to not
involve tearing.

Alice
