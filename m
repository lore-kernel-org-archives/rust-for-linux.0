Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0483ED5B3
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111463; cv=pass; b=hBYoT2Mpa+k8xlT/LN+6/gSmNjvgUtQMOJap3WtLX7cr/vS/Bls2hM7mXXgkaQlD5UbH5OV8IYCTol7+8ESbkRJ998WHpMi+YqsqE9XqQlhMQ3iSvWXVPeBFp2sRlzGIUwu+CBXyuwXPs2hm1MuqS9qYiPZDmtKqMRbdEjyUUoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111463; c=relaxed/simple;
	bh=zCVEWbgPtNQZ1Mf0SSgc/9MVLe94ygEvCMPHUAjF2Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unSuIZ6QDdaf2I44w5GtE0X53s7KS6LQSgX7JknaoUbGjrGyObykMXK6z+eQDzQNg8qqocgze61koUCcO0qUn94GKYtfuXSGWKHSun29/4kReX9HKn5onLNSmR4KyhSBPxp0B8R1GOUZYrAerqiSxHmSrDz3uRai6ZgFdRF4wXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClVGaUhF; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClVGaUhF"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-384caf7b168so665004a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 03:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784111461; cv=none;
        d=google.com; s=arc-20260327;
        b=H8Ttz0PI1IvWoteBsI0Mg1G+MfOI4A57wbKwZZP7t+TI9n48bCkswzmR/4mo/AcKh6
         r5kvFQFVxhmceSL9LzNhIZy8FYypD6EarQaQWnjOnHbBcEv3KVeGdxQBKxyDeUhn6ktR
         6i6CcyfII45cVqdd1NZONy0Y7klr0pmwfQPQq/0kSMKMidGql7TfxoUEJPvnoOcY3LtH
         l2jXNmfRtZn7VK7mmkoQhnR0LEUQSx/aVLQ/UXwp9NrObdO2mxEsyre07ZQkMwURz9RW
         KeT+tHNX8Dxyseb2sXcb6kt2n2l76PBRL4nZxk8EOpqIBV9c+OExZ8SFLOjioGYpI9He
         wmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7I5s1r4zbwdDnFUPkYxXrynK0Xpz2B6Wc1hGmhEooeE=;
        fh=V6m03tkn9tnG46uI/GAGtt+PJKYNbeH6lvUuSkRzej8=;
        b=H5/KXreZCFeDzPUijVG9MTOhCgwEhFTDaSahc9HFn8KFZUkYKgN7jly5gQxEWpEG6C
         4ivx/HiWlUe22HAeynISZVyoo4N10v7k9tglTE5POJZvBFAFpyZ2oqhA4Ul8qJ74CRmi
         yaAmVtjA4+vO5rt0Kuxkn0emolg+ivr+BMBrXpi1jRSv5CzDV57qOMJNUlEBNXrRyppa
         D1NGTe9pS/8jnDdsvmKZ/thKLwKd6U3OK33hKCRxLja8D4d9CekxmBZgomk6Q5nTz9VV
         u22YjNsQqWX1i4tHUNjKWWmoeFUkPw86n12mlXLURym0O2hznyaw6WeWL4gBnHGZL3K4
         231g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784111461; x=1784716261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7I5s1r4zbwdDnFUPkYxXrynK0Xpz2B6Wc1hGmhEooeE=;
        b=ClVGaUhF6WpO8z2Yn90X89Qio7kq7FZtqBOpZGVUPZU7HvFM3y/WgL9KmcZsOHowyp
         k59F9LwYQcihBqKg+SIN2zqg1sMQRMEPug5WP8FCbbsPIiF1cHCpynJ+7fQ1+KBuaCWR
         Y0lx5qUE/7R7OTJrtobidRwDWwx91+WCQpX+0rMmnc76tXRkpLtnNw6j7+NjloudhhNk
         fFfg5tSo7txJGj8hoGEcyiLGgkI1CiSxSyvRnqqw4azVUZ9husZSCD4YTrQInDM0Hoo3
         3zszl/SfOSOemoL1qt/ygtvwmoNE1PrM5VRrW5xVoTg8LY/ZrTEQHJjUojiiDe8aLsaS
         Ax9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111461; x=1784716261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7I5s1r4zbwdDnFUPkYxXrynK0Xpz2B6Wc1hGmhEooeE=;
        b=Nge81QyuAPxV9sqOcJ46+365kKEfJaB2QDKxZY7EOUKKNtvQFM1HRM/1A+HxSelTGn
         Qvypsf+Na3kzOuK1kwrAaHshbEJGCm5Bt60T7OKGeHTZnik/nSu4P3cUzKyAHzHpQxFl
         N1aFaxHletXJB/VPUQDRqoFFGON+J2UKid4HFXLldTkQOGV4/Rpszy+qLzh+Hx1HZjMi
         RUYEu1sRi+YtuCYbny+eLn1AkWN6UVik2viFZmmGgaxCISEIHx9sEQ3hMo9HRlKVNzAv
         8EJHzdT4FJCXf7mKA22Ap+pkMCpYFomwX5awFvjxm/VeK0kVWcB1uFtAB63Hw3IYQB22
         jtIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqqnr+mHD/6S+K9NMbToG/7qtdAqzN09gUFk9TgLpPSOEgZ6+yCQs1ffbkANEps0f1SJy4gpHiwKpzLLAjFQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGd04VDL5FRwiYaDjdOU1uQ4EduO2BJqvHZm+/bJ4fX3lIC3bL
	yHdDCGBWXnjUs/5KI56c6IOhOXyqLLP6uITKgV2+DBIKtnuwtikiI70lmz6Ku3ctqNTr+SuBF4F
	eS/WHmN69oFpihnOIFTNpeDmvDxTBuwM=
X-Gm-Gg: AfdE7cm7m96ZWKgVR99nTyEl+qKhFNup1vYvF4BbcGhzGLnWyBRIyRDnsV2l8UQXsUZ
	v/Y6JPRXaIxunmnYQThQ0jC7R4BlcuVEBgyXnI/xz6gcJpDBSZ2+2L9ZimWUXR4wyQC1x8HeM0Z
	0RdNI+MhIr2FJL+sogPzdpyh+SW7f5/BsuLnXYSBGMX0oalU3+DuZzDzb32KwVGhkFLopXRRiuZ
	i7hs4tr9ZWFXi5n7gbtLu+gvFlp0M1fTbu27i5oHpwxZ4JmcNlM5RXmCN5X5U+H+2l6coYnCgBI
	eTJs09Fpr309jnv22nNbTxqe8O/8XMCwW3zLHef57hTKYlxeNw1ubckJGnQoREXd0KQCARkvvLY
	5s1QAtv0I6tHL
X-Received: by 2002:a17:90b:4d08:b0:38d:fe7d:2a83 with SMTP id
 98e67ed59e1d1-38dfe7d2abfmr8330874a91.3.1784111460832; Wed, 15 Jul 2026
 03:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708211435.402426-1-chang.seok.bae@intel.com>
 <CANiq72=-HjYOoJPd=B+0OYrHuyCO+NpcjRvmmhT_ecVZj8q97Q@mail.gmail.com> <b705ef27-e87e-432a-ad1a-f425fe66887f@intel.com>
In-Reply-To: <b705ef27-e87e-432a-ad1a-f425fe66887f@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Jul 2026 12:30:48 +0200
X-Gm-Features: AUfX_mxOa88utfElFRyZIrS2LgzsWoibXzzaSNpmHupISKv8tKlcaf7D0e6UA7w
Message-ID: <CANiq72kn8F-pnd-YxBiPN9nr02jagRk4NL-3vyX1tERCQjqNHA@mail.gmail.com>
Subject: Re: [PATCH] x86/build/64: Prevent native builds from generating APX instructions
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	Omar Avelar <omar.avelar@intel.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 12:15=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
>     JSON avoids the warning but Rust versions prior to 1.93 instead
>     produce another noise:
>
>     '-apxf' is not a recognized feature for this target ...

I think that warning may be coming from LLVM, not Rust, so it may
depend not on the Rust version, but on the LLVM backend being used
(Rust compilers support several major LLVM versions).

So I would recommend double-checking that -- and if so, perhaps you
may need to restrict the LLVM backend version. In case you need them,
we have nowadays e.g.

    CONFIG_RUSTC_LLVM_VERSION
    CONFIG_RUSTC_LLVM_MAJOR_VERSION

Also, from that
https://github.com/intel/apx/blob/study_rust-apxf/study_rust-apxf.md,
I notice you checked object files, which is a good check, but what I
meant is to check the LLVM module attributes in the LLVM IR emitted
from the Rust compiler.

For instance, if I do:

  https://godbolt.org/z/sMaajjYao

I see:

    +egpr,+push2pop2,+ppx,+ndd,+ccmp,+cf,+nf,+zu

being added to the LLVM module attributes when I pass a `+apxf`.

Also, I saw in your file:

  "The generated `rust/core.o` object was selected as the insepction target
    because it appears to represent the core Rust support built into
the kernel."

To clarify, that object file is "just" the standard library. Which is
definitely a good target to inspect, but since you scripted this
anyway, I would suggest checking others. In fact, you could even
inspect all and filter them out by the language DWARF tag. Or perhaps
you can just do it for every single object, since the C ones are
expected to behave the same, no?

I hope that helps!

> Indeed. This is very helpful!

You're welcome!

Cheers,
Miguel
