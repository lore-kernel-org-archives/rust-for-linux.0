Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD106341061
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855193; cv=none; b=bdCvHoS1Wc7Fn+DftsBlKzQ3dvCe1IaK+L/I8f0PbLebfuXjUFsbUInndTuwIw98jHzvvwpreRFhPMqap2GaXhfpEgqUPKDmbBOZPsdR3QOJiRT2Zy3+ulXNxsPi36XrXKs9mQI1o2OImaeAi8exI4Q7mh8IfYp9u+fLbRtBWyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855193; c=relaxed/simple;
	bh=nqKa6MXxPbkSVzOgaftBN8RAZqEi27FAQpGbsXZfk5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ljayYSeK3VdCbT0+HSqTEJEp/BwdD0ttvk3djPfW92msZ2AoUggJFZcRxjyZoaFFuMgXdNyF+eokVDTzzrrCWCnLXZz4ScDGlQ/3Eaxs/MLcqFEoIRy4ptsiJ4wZKaw+4bxv71StAtGkovVGCEapJmk6tGcnZ8LYocSs1i42bac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V6vAHSn3; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V6vAHSn3"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso6393875e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 05:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764855190; x=1765459990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPhDXSAVJf+S9A2jAXqCosJrNhUMeXmtBg95nUm/Myk=;
        b=V6vAHSn34cc7bhDo9b/XC3byIMfU9f1zM6dE7ESKEKskJxzvu3HUNS8uxKN8h3QCUC
         nnrJvJ/1jIrKmR3Bp2aC50pBtPMydg+Z04g/8FBE+dt9iMajCBpyNcrTX8IYnuK43pjv
         ABS+UACmkawUoUGSbry6uqaIP+rRt3KACOR96YFy2tLe9PpVNf1YLOELkjYoftKcXcIw
         CzXD6OEIfbU5GHUyIlu0FdK5VVC5TvYwARhWtHuhjQ+IOEAJmi9wWeg2vXYTzwpcoXLF
         mXpqNk35Lr4Sa55xr7p0kjDFWum5ikWk4o4e9JynSbjOee1xdFGqnVnJiJtXDWwJuMwi
         egUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764855190; x=1765459990;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JPhDXSAVJf+S9A2jAXqCosJrNhUMeXmtBg95nUm/Myk=;
        b=jmk+Try9TwB885BplBib+5HuswRnavOshC3LMg2Cx9P5fdSm00vG9DTLPSBXuXiHeq
         C5t/BpXRBjSWwjpEXeQn/EzOMP6QaFGHvaNGAglAvf+lgeKMEbB/sWbhqF6LE0UdR/TY
         juXCOwd5FFfWz3VvBX+5CxCvKLb3eKdar7bT0LMv0EYq1so37iov4wM9sk7GChCzP8iM
         vpF9CJmGI9+PTWeU8a6EA/YvGIizXgQ5/1DVWHCxxzmMaO2lc422GQDzbyLLrN3l4qUS
         UGLic5MN+DKngGnCZ/GH54KTC0plwSqlaBbjTE3D7wnT0ToOlQ/RzwQ6nXWJ57DOgj3F
         NH4A==
X-Forwarded-Encrypted: i=1; AJvYcCWtjQXZfQWZyK/s0pOJndRJGkSOvIBn+3Gl7RVVNBb6TtedCiYHJ4L3Ab4Xt98XkprYjpHbN6ivn8DWzcMERQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDAQNTuw6hWA5CEhan+ebCAeSoPc3v0wUCSpd8LN3ciJYeUBF5
	XwkETVmgtoK6UYUnXlpfNiLIWeCnTLHwcIeohrpDJ6rfD97Doov/3qriiNClab7UsR+iL4tAJPo
	D16BYvkba9t5zzyIV0Q==
X-Google-Smtp-Source: AGHT+IHvjBq2g1BIRWe+S6dnBKCQueA95Ie82NW8TWQv7rDRj6D7xMmFfsPAVZbqFa6wonFYR9VONaynaS7P4Ns=
X-Received: from wmbjj12.prod.google.com ([2002:a05:600c:6a0c:b0:470:fd92:351d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3505:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4792f244197mr26647205e9.1.1764855190088;
 Thu, 04 Dec 2025 05:33:10 -0800 (PST)
Date: Thu, 4 Dec 2025 13:33:08 +0000
In-Reply-To: <E1879F44-A852-439A-966D-F074AE48E19C@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201102855.4413-1-work@onurozkan.dev> <20251201102855.4413-6-work@onurozkan.dev>
 <aTA6f8gK60h6qaHs@google.com> <86E0C8EE-393D-4C6A-9C28-BB036A1FFAD6@collabora.com>
 <aTFPRv2ahM_KA3AB@google.com> <E1879F44-A852-439A-966D-F074AE48E19C@collabora.com>
Message-ID: <aTGNlO0C86pJMFdj@google.com>
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, 
	will@kernel.org, longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev, 
	thomas.hellstrom@linux.intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2025 at 07:26:25AM -0600, Daniel Almeida wrote:
>=20
>=20
> > On 4 Dec 2025, at 03:07, Alice Ryhl <aliceryhl@google.com> wrote:
> >=20
> > On Wed, Dec 03, 2025 at 02:23:14PM -0300, Daniel Almeida wrote:
> >>=20
> >>=20
> >>> On 3 Dec 2025, at 10:26, Alice Ryhl <aliceryhl@google.com> wrote:
> >>>=20
> >>> On Mon, Dec 01, 2025 at 01:28:54PM +0300, Onur =C3=96zkan wrote:
> >>>> Yeah :(. We could get rid of them easily by keeping the class that w=
as
> >>>> passed to the constructor functions but that becomes a problem for t=
he
> >>>> from_raw implementations.
> >>>>=20
> >>>> I think the best solution would be to expose ww_class type from
> >>>> ww_acquire_ctx and ww_mutex unconditionally (right now it depends on
> >>>> DEBUG_WW_MUTEXES). That way we can just access the class and verify
> >>>> that the mutex and acquire_ctx classes match.
> >>>>=20
> >>>> What do you think? I can submit a patch for the C-side implementatio=
n.
> >>>> It should be straightforward and shouldn't have any runtime impact.
> >>>=20
> >>> I think there is a better solution. We can create a different type fo=
r
> >>> every single class, like how rust/kernel/sync/lock/global.rs creates =
a
> >>> different type for every single mutex. Then, you know that the classe=
s
> >>> are the same since the class is part of the type.
> >>=20
> >> I don=E2=80=99t think this would work with the from_raw() functions. W=
hat class
> >> would you assign then? I think this is precisely what sparked the curr=
ent
> >> solution.
> >=20
> > There can be a way to create a type for a C-defined class, and
>=20
> That=E2=80=99s the problem, if we don=E2=80=99t have patch 2, we don=E2=
=80=99t know the class.
>=20
> What you=E2=80=99re suggesting seems unimplementable to me at first. Othe=
rwise, can
> you expand some more?

For each class defined by C code, you invoke a macro:

	ww_class_from_c_code(MY_C_CLASS, bindings::my_c_class);

Then when you call from_raw(), you call

	Mutex::<T, MY_C_CLASS>::from_raw(ptr_to_mutex)

There is no need for a check, because from_raw() is unsafe.

Alice
