Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8831A23B9
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 18:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765996034; cv=pass; b=aApWn6Q3BCdQ3OvktQDcMGQ65GyA9lEkbLJ5uVt3Z7KQv3OjDdVesS4UlRIWDfzkO9M2ATfm3Q4FRvuOGDLzVPZXtYqTXfEBS/1jyFhRPsj3sJQs7oMSE0bOVoU82u7pLTj09/+8MPw5OyhBMPY4fDt9GeDqgJpvCC1p/nMpJ9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765996034; c=relaxed/simple;
	bh=ewEYgNOm190ziCcM4ftuyL9f4S1UUql3Z66KiOur/gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maIyvY5TaDoYWO60+nZL537hDgfnRqnwt33PEr8rGDQxZSo2+Q4wGYzS88rBmVItTXibiAKAgXV4wAdYix5Uzqpuf+H8sg86rdeMrFBwap9yYRAcEMzh7lPJMyyd/0vFOMTOR4p3sdZ7sMIjUf0Fr9V2TQ+378SmepCFnsyqn0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G0a9yQF8; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G0a9yQF8"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so913a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 10:27:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765996029; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBEOuxRpJkmqDpJXjL7ElT4SOEi77BZeAN1c7VRastIPH1btbsKugKv1YWYhrt2TDb
         wKuSx7UU9krgGoy97NtDy0rWr0/6zOT3e5yVuWcI94NKmKjcF7o25TGtUKKFwpStHKZF
         PcMPH8Vb0XSc2hCTkhM/zlmQwaTa3Ahp2a5uNRK/35PZoHsFf1TAvFbgyTF/weKt/WQs
         LRxbYoQg6AltpJpMIrtOheJ1ZYpBvXuOIn57vzzptV8DbPmkVUR9gIxtYyoYG4O7EY4S
         J/bdFnnuj13dfIL9ASztn/Ks8QD0u4efPv8ybzQCKbN8oi8Qb00a6xajbq+mo6eSbRor
         oAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IWQoeAvy7a5qW8vA4aqOhFG4WVRLwSORR6OcQHoWncE=;
        fh=G6TKzGNkGZ3i5M3ZHjkHbUb5NQ8foUDyqHmBSuLzvdQ=;
        b=DeQKL6+STWIIJuTIRk4GdkzxLY4pvBp+vMGOwt1z5wETOzYxNcT4S0MsX18yDodFee
         LhEQYqKAGbXoy8mlMXI8mf50gpmigUgwCO5Wk+P3rXnxB5Nb6+rVb/8q7FsHioBEu4kB
         pzlJzguTBudDkaP8ZE8M6I8JFcb9LFUDpZmmVJkAGkCkyg1PUxWvyVMiy/xCcEXuA0lx
         0ombSyHlw6lf0c0vXwc2UrC3V7/c+AF/A41/U9mnyc2ycUuthTikbSZOtqsU0XP9tbSU
         y4qgRL49PewVIe92V7iBMvXR9LCStY0pWRiiN14FOE2e0DjiImgOSF2E7678f3ujQR1i
         oDeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765996029; x=1766600829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWQoeAvy7a5qW8vA4aqOhFG4WVRLwSORR6OcQHoWncE=;
        b=G0a9yQF8RZG/iAFrKWyNz4Q/2dPXqcR8Xxfvoexi1R3ficYhFEZ6SJA8JipaDQsDUr
         2qcHaxxlipnYvJ+6FoG/vpkvFPU7FGNe6p/ncbnbveY4CYwPXsf2g5q4Rq+zVk25LKv3
         AnPwKHOFnYerqyXwlS96rgGTPu/c8gTkGIaMIKDTvmYYVaAhm/OiDZCBzpUpAdls2q6a
         iqzCbwZoyN9Kma2YWR9SA0iogFfAj1Kd3Yx4PGLN5t5HMhHgrpOyOyhhG8W+wOJiY1OY
         1sJLOsw++6ssKe/jaMWAkE4ejEg8Mgdl2VODgu3Sr/1tCkXbxHSWB8kg4d6JMgYvILgV
         KS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765996029; x=1766600829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWQoeAvy7a5qW8vA4aqOhFG4WVRLwSORR6OcQHoWncE=;
        b=A1IU00QcRYYP6TsqCnF1OUi1oQkQIegcpkh/y7s8V0Yu30IIlSrP6jGoFwgH9pYCw/
         AS0utneDmilfDm5Peoeo+FX4bOgDTzYmL095hbCwpHFIeDyTzVCk2C3nfLTh8XNJft9u
         lEUCmrCtZ1hyyykxGTZxa/Mya66UP0StSUarxRsXc/ninnC5HHYo/mX/03lgEuuZZTdX
         j30/78PDoBOMFI6TnxDUAl34eNzks1LB+YSulkOt8RlYQ0gM+yvq4Ssuj0fOkIsR8RD/
         JgY/D1Xyf74Y49bVE4DyXUg73b0nm7xLsfpJBcYnqec3vAtZdZ5/Qzc74cgv6CsW3RhP
         aliw==
X-Forwarded-Encrypted: i=1; AJvYcCWjN6Xn1CXTTzwnlGcdsLIDWeYjLjOub3jaU2WQDzL2JCHlIkSTnGNMOMI4L+NPxW2LHeBbSRAvN4IArwMOKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfl54/FzP6MxHdlJZT1Di7AKEg8PRdcPcckkwJvd/puvEPR32t
	Tf/SfwlqYeV+a4Z96+wYvJ/6XnkAXXwIZJxDgWP0YPdC8IDkw290DabplT+RpjUf+9U0NeV0d4D
	A82/FPyT6gMBGMSiM0HTwiQzFjuw9SqWmjjiULj78
X-Gm-Gg: AY/fxX649ShVgrgqeahW7XkDGdDHxC2t9aIkdpH9S8nOnJzI1XWEiSKsaSCAkYrjAQ+
	XYCOHyo002mw6BU5gNOyC9FC1YbzkDns1ZZRVYTU45n7jcUccBKDqFIC3lyFiJC44DWHSYvTBTs
	a9pXAtCXMk9r4f1CTpx4py0ncWFv5gEbpVGcdt4yj/Z0nE+ug3SCfWfM3yMxbjTtNwwQs35RCLU
	4VdQ0Z1822/bKDRiE3Z+sS3Um4TlfIhM4iMcgO/Dx9zn8tXk9cHMNAl2wy1fUeRlUx4E8fvcBxj
	TXaIHwhNRUs+wMWj3lVjUPC7OhqeckhQCkKg
X-Google-Smtp-Source: AGHT+IHCxTmC8LT2jy8w8rvRx/4zrU05KTODF8jVez/OKavIx4f2bO4duA3kKZ2yoSkShjG6TLPm3AGH2CypMw3YWzM=
X-Received: by 2002:aa7:c757:0:b0:63e:11ae:ff2e with SMTP id
 4fb4d7f45d1cf-64b5a425c5emr1011a12.3.1765996028642; Wed, 17 Dec 2025 10:27:08
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-3-b23e5277ad02@google.com> <DF05YSVN174B.XRTT5CHPF0N0@nvidia.com>
In-Reply-To: <DF05YSVN174B.XRTT5CHPF0N0@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 17 Dec 2025 10:26:57 -0800
X-Gm-Features: AQt7F2rm_ioZJMPoeFkWZhqohuB_Yo3UWPBG3JRlf4FIFDBCq3pZHQUWSgugeRg
Message-ID: <CAGSQo02KiCBPCFfpv7xLqFM8znN9w+KfGhy62O3YLu2UfVHCTw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: Support deriving `AsBytes`/`FromBytes` on
 bindgen types
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 7:16=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Dec 16, 2025 at 9:44 AM JST, Matthew Maurer wrote:
> > To support this, we need to move the `transmute` module into a separate
> > crate to allow the `bindings` crate to depend on it. Most user code is
> > still expected to address the module as `kernel::transmute`, which is a
> > re-export. `ffi::transmute` is now available for use in `bindings`.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
>
> Maybe this should be two commits, one for the new crate, another one to
> introduce the ability to use on bindgen types.

I could do this if people think it'd be helpful, but moving it into
the `ffi` crate has no point without using on the main set of bindgen
types.

>
> I have tried this with the Nova bindings, and somehow could not get past
> this error:
>
>     error[E0433]: failed to resolve: could not find `ffi` in the list of =
imported crates
>       --> ../drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs:321:54
>         |
>     321 | #[derive(Debug, Default, Copy, Clone, MaybeZeroable, FromBytesF=
fi)]
>         |                                                      ^^^^^^^^^^=
^^ could not find `ffi` in the list of imported crates
>         |
>         =3D note: this error originates in the derive macro `FromBytesFfi=
` (in Nightly builds, run with -Z macro-backtrace for more info)
>
> I do have `kernel::ffi` imported in the bindings module though, so I am
> not quite sure what this is about. Any idea?

If you have the kernel module available, please set the bindgen flag
to apply `FromBytes` and `AsBytes` rather than `FromBytesFfi` and
`AsBytesFfi`. Those are only for the crates that are used by the
kernel crate, and so do not have access to the `kernel` crate.

The macro itself will generate `::kernel::transmute::FromBytes` when
you use `FromBytes` and `::ffi::transmute::FromBytes` when you use
`FromBytesFfi`, specifically to avoid weirdness around namespaces and
imports.

If for some reason you really wanted to use `FromBytesFfi` (you
shouldn't, but just so you understand the mechanism), you'd need to
add a direct dependency edge on the `ffi` crate, i.e. `--extern crate
ffi`
