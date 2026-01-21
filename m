Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B4644DB8B
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 12:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997677; cv=pass; b=PySEHLqjLcXZxmllr82xEjzBG5sFFuDxvKGoP8gl7kMgDdyNwHpyK9NNNFX1N4SN9lcJE34qGd96zisjnDAJ4D7fGfUtwByUtJQv14Bu12rCQs0ilNreDt2ttrcu0ACNB62U2RK8VjdEUOi1NxY2SYHCddKMXbD81tBud0HF1N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997677; c=relaxed/simple;
	bh=QT5JLW9eYEpsOmAOwnp2GUulzcXGfwSdxy/nr0y3+KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHIncHRT44z6wCQJS3LsLS1mPyR37vqK+eTeYMeQbptdaILAAjNu4hulPd2moW5DSmUaLrd6xicVUGHjUryb8bgvoHzsD+hopXlzuCnnRRWF3Sbc5nbiJhkEH4HDNmT3nP2P8H9nk1dQzTp/KEbsLcClsTv8EZtRwY5NKpEarOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZrBGeQ6k; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZrBGeQ6k"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b71515d8adso517706eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 04:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768997675; cv=none;
        d=google.com; s=arc-20240605;
        b=LPnjBM1FCXIww8BOdAR5vPo37urPxIpm+2qSLbpFL+lHu59gCOXcdw4sNlRKQ5db0D
         NYr3xBtVexgvN06c6pZ8bbeTvMoSztNt9m59HKWgvXlqZgiWuvlBMT/30v6nxY6JeNzy
         QlBJibbneNXGCvENn7ez9eck9EA3uMUh6oUdYYvxhjRJvUSoS9ttok12VECR1hWtHACP
         geBnrAsaua0gM5u1cR/tESr58Wj+8QhbGELRkk7RmNso1tkEvAbLifg4eMOKsN8N+mbe
         LG7Gl0p0EYoJY7ZUWHN5Reb7rBMC80i+fI3nuWS8o2nf89j0ccT596HpKmYB2vCnpyeX
         i2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QT5JLW9eYEpsOmAOwnp2GUulzcXGfwSdxy/nr0y3+KI=;
        fh=EI7MJXV+eEvNAnuL6cprGdV7W58nC+T+z7238Qa/05c=;
        b=XYvJ+Zrh7UxPmqB3Uwm6wuCywrlHGBgFM4OyQLlwBNCU6+Uxm8U5YVwoTT7br9m7v9
         lLSM+a51bMNaVdYKrauHczvhCHlbSRwfJyxZgE3X/ZO4FokZQ4hqJ4s7I3SiVQY6Jq0t
         tRh9SuWjeeIHP2Kz9d91DC7Qr2Sew6eQSGxt9OrVgHR17NvKtSvcVvwksGSLBM/KwUiJ
         IUzipZ/z1wLc8aboIvOsz36vy3vlZ+uiNO75yTiR8uk8WCvBpT9TSZ+Z9JgWSOgKZ4K5
         F4rlVSuE+SgNhG1IZOsQ2xf5qeYfgDIpXBq3FSindJqzhjijMJY0rZAC0RTwleUTVKLw
         4UnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768997675; x=1769602475; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QT5JLW9eYEpsOmAOwnp2GUulzcXGfwSdxy/nr0y3+KI=;
        b=ZrBGeQ6kfNdJzYQRP1LEJdHfCT1HaMbsgAs5E6G4uDSHU1EFFbGzENXeGpfvg5S/c6
         X2UONltsCXS6bNIRmway17Xxt5hLBWyM369c2Nbg4c1dIXNrd9F206xpy/zYOqWBGOXm
         /GW2J+1iZ4hTgTpBt7biueYVAKzJyNmg2JMqOG7aLNkMaeOLiFb1UIyFYcMLlw1ujH1O
         gQPCeDwGrqFt73DiUAArW6/I1+ep6+PYgQKLVcKM6Xxw6VEJ3FAC//U+JMmJ2sDhZU3o
         DEjQlxUuY5xbdAB3emK1yVeXHDyV173uL5+ys9/n3q34Qgxbr/0VwhxVnNCvRoQDhim1
         b6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768997675; x=1769602475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QT5JLW9eYEpsOmAOwnp2GUulzcXGfwSdxy/nr0y3+KI=;
        b=Iy/SlT++QTPFZhLCnVLB6AeIlv5Sq2KE4/9kYONjhuhewYH2LadFKrHKVa6cAkeiFB
         H18kgIFehx2qlfSlC+YhmDZHNrtPIpIXvt2k3MtSXp51l6A4JnKBLRWHj1TwTVdpLVE2
         h0hJ4WVcVqLZkH+16zQe65IkVF5gYUS2Wx05Hi7hm2L8tJaUAKzAGYx5AO2zl28bP1q9
         GZvtKGEf+eXBoNmrGwxy+4JAv2qS79SFF8yOmxWC0MpM0N0PmR8cpporxjveBAYHZQor
         ih0c+ThMUD0uvByW2xRrDaYN9PwozcjBbBFRMfsfBMfw1jPDwy4IdKQZ/E51fnp4fsJg
         BHSA==
X-Forwarded-Encrypted: i=1; AJvYcCXfHNhndc4TG3/QD+hAjEy233RSM/E4YEWH4QJTnPSVey5XMBtJ1571gNwYqainO+dMMnIwG4Zfi8EIBuN+Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8kbpVnQOu5misbuqtEYBFw9/5PtlBoysUM7RDPcEMhGcH1n8r
	NpocIsrhSqT1H2SCGbIMWyVu++nabos9sU49ETvvZQYp5X8vCAaniABaVn7ExMA2PQdII41AEm+
	u44Y5kkrRShj95q+vJEFxiJjufudEyyKA/gVnChj7
X-Gm-Gg: AZuq6aLFUUTnPP/v1LGjFWLK/ebcQahH4faIYAnYEgatkkZsom+Tunb4VuIfMXrAAKt
	YRv6KpuoRTIQz9BOy2QpwpGiFQcPAjSjAeXdpslUkCCM7l4Fjqorxvnp0Em74eu6h9ue3ervuIC
	QiMJIia93OcKKbHLhXeVu6R8gVn3ITRShGYu4tfVm6e22+A+isJqY4QBegPpliPRoZDFaXXgbwd
	oZYQcv5mSAlpIJKLrncfbQT8K75oxov7myoP6fGmdCHnGSo1njS7CNtWZyFe3sKvMhZ9WPjm4fh
	o5CwVkS5lX0uCT2QSIFoWQNFKw==
X-Received: by 2002:a05:7300:ad06:b0:2ab:ca55:89b1 with SMTP id
 5a478bee46e88-2b6fd7bdf89mr2710322eec.40.1768997674493; Wed, 21 Jan 2026
 04:14:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115207.55318-1-boqun.feng@gmail.com> <20260120115207.55318-3-boqun.feng@gmail.com>
 <aW-sGiEQg1mP6hHF@elver.google.com> <DFTKIA3DYRAV.18HDP8UCNC8NM@garyguo.net>
 <CANpmjNN=ug+TqKdeJu1qY-_-PUEeEGKW28VEMNSpChVLi8o--A@mail.gmail.com> <aW_rHVoiMm4ev0e8@tardis-2.local>
In-Reply-To: <aW_rHVoiMm4ev0e8@tardis-2.local>
From: Marco Elver <elver@google.com>
Date: Wed, 21 Jan 2026 13:13:57 +0100
X-Gm-Features: AZwV_QiNdZftFkEU8_aSSpgL9dCXraNCslVH2OipOEvIiJlDSmBop19Ul7_z1dM
Message-ID: <CANpmjNNpb7FE8usAhyZXxrVSTL8J00M4QyPUhKLmPNKfzqg=Ww@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers over
 raw pointers
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	"Paul E. McKenney" <paulmck@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jan 2026 at 23:29, Boqun Feng <boqun.feng@gmail.com> wrote:
[..]
> > > > READ_ONCE is meant to be a dependency-ordering primitive, i.e. be more
> > > > like memory_order_consume than it is memory_order_relaxed. This has, to
> > > > the best of my knowledge, not changed; otherwise lots of kernel code
> > > > would be broken.
>
> Our C's atomic_long_read() is the same, that is it's like
> memory_order_consume instead memory_order_relaxed.

I see; so it's Rust's Atomic::load(Relaxed) -> atomic_read() ->
READ_ONCE (for most architectures).

> > > On the Rust-side documentation we mentioned that `Relaxed` always preserve
> > > dependency ordering, so yes, it is closer to `consume` in the C11 model.
> >
> > Alright, I missed this.
> > Is this actually enforced, or like the C side's use of "volatile",
> > relies on luck?
> >
>
> I wouldn't call it luck ;-) but we rely on the same thing that C has:
> implementing by using READ_ONCE().

It's the age-old problem of wanting dependently-ordered atomics, but
no compiler actually providing that. Implementing that via "volatile"
is unsound, and always has been. But that's nothing new.

[...]
> > > I think this is a longstanding debate on whether we should actually depend on
> > > dependency ordering or just upgrade everything needs it to acquire. But this
> > > isn't really specific to Rust, and whatever is decided is global to the full
> > > LKMM.
> >
> > Indeed, but the implementation on the C vs. Rust side differ
> > substantially, so assuming it'll work on the Rust side just because
> > "volatile" works more or less on the C side is a leap I wouldn't want
> > to take in my codebase.
> >
>
> Which part of the implementation is different between C and Rust? We
> implement all Relaxed atomics in Rust the same way as C: using C's
> READ_ONCE() and WRITE_ONCE().

I should clarify: Even if the source of the load is "volatile"
(through atomic_read() FFI) and carries through to Rust code, the
compilers, despite sharing LLVM as the code generator, are different
enough that making the assumption just because it works on the C side,
it'll also work on the Rust side, appears to be a stretch for me. Gary
claimed that Rust is more conservative -- in the absence of any
guarantees, being able to quantify the problem would be nice though.

[..]
> > However, given "Relaxed" for the Rust side is already defined to
> > "carry dependencies" then in isolation my original comment is moot and
> > does not apply to this particular patch. At face value the promised
> > semantics are ok, but the implementation (just like "volatile" for C)
> > probably are not. But that appears to be beyond this patch, so feel
>
> Implementation-wise, READ_ONCE() is used the same as C for
> atomic_read(), so Rust and C are on the same boat.

That's fair enough.

Longer term, I understand the need for claiming "it's all fine", but
IMHO none of this is fine until compilers (both for C and Rust)
promise the semantics that the LKMM wants. Nothing new per-se, the
only new thing here that makes me anxious is that we do not understand
the real impact of this lack of guarantee on Linux Rust code (the C
side remains unclear, too, but has a lot more flight miles). Perhaps
the work originally investigating broken dependency ordering in Clang,
could be used to do a study on Rust in the kernel, too.
