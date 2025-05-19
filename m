Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9E57E107
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 20:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685293; cv=none; b=ohqfI7Cu4yDfqmO98dgvcPwHON13tXT744ARAC+liDxzdxohgAsWRrYeXySF5FZgqafbgBNNAsJ188gO6HUGQhYloc+fFdiydv+xoAWDwgOHRwMvsPYOEVSPnMnZoQNxo0RdY2/jSJqIjRu5biK8JJH+fa7zoF9dl6KeBP9Z+XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685293; c=relaxed/simple;
	bh=HjtgYC529yhheRDeyA7Y6pIa1ry09o9OXj3kNK1/7F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpRodbDHqxxOlzpf8l0+SZskuASMG8DTbAE45lllPQR/nyVdw+sFjypal7KdA4mHdOPTbSSdzpVmBHgUNudZGY/om1KDYBexNbI8EgLI+2kkzpR9agz4bXxsZUFQ0KhqtBws13mfLDmChclBJSLFUSmMfvQuWMo/zgPtbjlXse8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AmPIdqcY; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AmPIdqcY"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c13802133so1843092a34.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 13:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747685291; x=1748290091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lwV4LLzeGsIDMU8ys7dX22YnefI6DwFNd5lUXaoiKQ=;
        b=AmPIdqcYpnm9ZlWbJKZOAAMR5jbwRcld11Taf9rNPE0/XavfsK41h+UgSQCCP1KdCf
         WoL4P20yUBpJodn4V2B6tCJmaWTn+Pp00K45SPmBdchSd1TLK1DnUC7tMp738i6gKP1V
         lSVQixfmRyHL/Wvf+JTN6wie/g5sAQIWDf5jLIPF7IWCEnCn9pPy4Jo/6KEvHi6Z+s2D
         2+SmwqyJtl8i60keRlYDziWTnNjgn/W2t0I2ZqifWSRg7rkx4jI82xBAlUeaIOSO8xGH
         UdLKf1Mu/dBDhRAbSWIQvO3f8wU9toA8TJFVGLhDmrJMqwyy/HfsLGbePNGxWub9XHc1
         Su7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747685291; x=1748290091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lwV4LLzeGsIDMU8ys7dX22YnefI6DwFNd5lUXaoiKQ=;
        b=VEYxPfbwebl+pxtwGPQc8zl4FA6ia88YFwsdZa3OphdNARIFdRD5Fz21MspKYFI0jI
         OBoIirvEOOAP04es+pCbVP9qc9s7t8DfHiyvoqdl35ORfYP3Gd3+F2wdTebrsAF4Kb1F
         7idT/Yj0X4otK98+YcPhYtqaCBXnfspQin0ZfWPV5wG4dukM7yLo5xHld2QDkSfJliud
         Uhp/wYCjZ2RjO4JnCNcP1u6t8BFljm4pXvVa/Ozpmepv+uKCNTHTI+4NYSHSHbU6+HTX
         xD/Fkw9ZvQVBkA+0f2oNhVuZWEhlb/q+T0m+G2Mh5+mmPl3LmuemtxdQlrEoAqe2OStv
         1ULw==
X-Forwarded-Encrypted: i=1; AJvYcCVvd7kxZdGvI+vKdx6yA69ajpUqLgsmPBqSbhID6HnsKMQ0oKAcwwWSWE3sbpkyNMbFUPAGb+6YVCQQeRQfPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr3Wdjdkh/r2vgyxF1kp8nQN8N9XXpJy2nzMKf77u6V/+6/sh3
	BU/lRJFo0IilbuWBLqVPTNwmmRwPXUoS0TOKA5CSZcCpTFH/PyktFl773j1d3IMnEsHo7oaiCYc
	k6Yba1TwS07l3XseF2jrSBEXBh9UDeMmLirVd0uDz
X-Gm-Gg: ASbGncsZzk6ccXxSqzjTnzM1Fn5LKXmmXDzRaxgO2tp0IT3qeXqLFfbXv1I9dtPGABW
	EHiYwy1d/Yi1hRO+YaivyFqeW93Od4xksdAR+qG1uixivnjRrUHJCoAE/AAxgAwSqbWMoRV29fy
	qIo8qEqMaMxX755o0bHbi/LlXHYjI1Mk2NbjmqhskelwWf40KF3pQF7awXTtxv
X-Google-Smtp-Source: AGHT+IHCuwjQRNB6puPQEmq9ITHiNTeXys1I0czYfkt1yU/t2YS1V/y1seg5JemoLl3V5eI2g7tl+T3NOwmUzG4xA4s=
X-Received: by 2002:a05:6870:8301:b0:29e:40f8:ad9b with SMTP id
 586e51a60fabf-2e3c8216676mr8263787fac.14.1747685290483; Mon, 19 May 2025
 13:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-4-bqe@google.com>
 <CAG48ez0rGwFeVtj6AKg8YY=D9Atvp1h5FdW3szswEJsRmkR86A@mail.gmail.com>
In-Reply-To: <CAG48ez0rGwFeVtj6AKg8YY=D9Atvp1h5FdW3szswEJsRmkR86A@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Mon, 19 May 2025 22:07:59 +0200
X-Gm-Features: AX0GCFuY1miW4cxuYN_xPChpbf5zBWtSWp1x6spMU0BwT4d7_xRxItEC1vtlcPY
Message-ID: <CACQBu=UNAFjKw_m8oE5Mst_eThEf36zqgUWZ3a0u1m4zr6MoJw@mail.gmail.com>
Subject: Re: [PATCH v8 3/5] rust: add bitmap API.
To: Jann Horn <jannh@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 9:01=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Mon, May 19, 2025 at 6:24=E2=80=AFPM Burak Emir <bqe@google.com> wrote=
:
> > +    /// Set bit with index `index`, atomically.
> > +    ///
> > +    /// ATTENTION: The naming convention differs from C, where the cor=
responding
> > +    /// function is called `set_bit`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// This is a relaxed atomic operation (no implied memory barriers=
, no
> > +    /// ordering guarantees). The caller must ensure that this is safe=
, as
> > +    /// the compiler cannot prevent code with an exclusive reference f=
rom
> > +    /// calling atomic operations.
>
> How can atomic operations through an exclusive reference be unsafe?
> You can't have a data race between two atomic operations, and an
> exclusive reference should anyway prevent any concurrency, right?

The atomic operations take a &self (shared reference).

The patch is missing the implementation of Sync for now. With that,
one would get concurrent write access through shared references.

The "unsafe" here should serve as reminder to argue why it is ok to
not have any ordering guarantees.

The last sentence is supposed to say: when you have a &mut bitmap, you
can reborrow it as &bitmap, and then happily call this atomic op.
Even though it is unnecessary.

It is unsafe because if one has shared refs on multiple threads, one
needs to be ready to observe updates in any order.

Does it make more sense now? I am open to ideas how to describe this better=
.


> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if `index` is greater than or equal to `self.nbits`.
> > +    #[inline]
> > +    pub unsafe fn set_bit_atomic(&self, index: usize) {
> > +        assert!(
> > +            index < self.nbits,
> > +            "Bit `index` must be < {}, was {}",
> > +            self.nbits,
> > +            index
> > +        );
> > +        // SAFETY: `index` is within bounds and the caller has ensured=
 that
> > +        // there is no mix of non-atomic and atomic operations.
>
> Aren't non-atomic operations only possible through a mutable
> reference? And doesn't the rust compiler enforce that, if someone
> holds a mutable reference, nobody else can hold any reference at all?
>
> You wrote yourself above: "all (non-atomic) mutating operations
> require a &mut reference which amounts to exclusive access."

As noted above, an exclusive ref can always be reborrowed as a shared ref.

> I don't understand what's going on here, unless you're saying that
> Rust does not enforce that an object ownership transfer between
> threads has proper RELEASE/ACQUIRE (or RELEASE/CONSUME) memory
> ordering or something like that?

Indeed without the Sync implementation, it does not make sense to have
atomic ops that take &self.
Sorry for the confusion, I should have added the Sync implementation.

The normal scenario is that concurrent access would be accompanied by
synchronization through a lock.
For things where the order does not matter, something like counters,
using the atomic ops would be ok.

Ownership transfer between threads (sending) is not possible right
now, unless we implement also `Send`.

> > +        unsafe { bindings::set_bit(index as u32, self.as_ptr() as *mut=
 usize) };
> > +    }
