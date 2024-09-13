Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7AB757E0
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726246336; cv=none; b=dumHefpi1e4JVJHuGJPog+450pls4o+9wQ+ELG63f0BGlJKSUVODApIvDaWmTN9ZJA/9C30f14gm5v74U0dH5Cl/YTz6d42M7Dka9Ox/W7Six/PAF1xWDuN6DszsveWBrr/WJlykickradtHvGNzuMbn6JfBqxLpWETzOsT8B6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726246336; c=relaxed/simple;
	bh=NkfRuK05G42gxi/P3Ur/QBm3gz03FXJHhe16w81o8nQ=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CdG02/EYCKZ90NINWQ/hM2p89sV6L2ZMmXC8T0dvqAjydisVzjsxwKjZZwjWR/npQwRJH8oXC/2p10hAQ1baksOTwJkQnbgvM8rfzZDVsm7Fu7R6yF094eRIe10N8syxoqI7byXBCNwOKdVDoGCUDQ8zCfUFxXkwJfbbUgio0UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Oi7tVDUQ; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Oi7tVDUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726246332; x=1726505532;
	bh=pmUKiN2tKdM7v2+UQJgPTwbwy4xCGQ7zQ6ZenqKk7Cg=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Oi7tVDUQHyUDB7Efmpg+QDtNVubYBrKlkXG+z70+a2vVfEt8VgLYQCV8KJt9DGtK8
	 UHPd29Nf8GS1Mror/vUrS8yA49q9C2TtM647b1GHnLAD3GCwT+xENkv1mI/KVWFFld
	 hIWDk/9+IvBpgiV/2FMV6zZ59Faq7ciwGY14ZwO8JnUDGqKf2W10gfUucGsyKXOvLx
	 wyQCjj2gRQaKlwIEZjo9F8ai7VSVez46Bz/xVp4r6uaLBzPKfrV0PQvyoElMRvM+tB
	 BNn9s0jnO+ByvjWphjzWcjchXdy0HqslHKn+57V3SMWHElCOJclEE6AYyatCZGHNGj
	 xNgkWtiLpKOgA==
Date: Fri, 13 Sep 2024 16:52:02 +0000
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH v3] rust: add global lock support
Message-ID: <8c233e14-e380-417d-84f7-d5056a768427@proton.me>
In-Reply-To: <CAH5fLgiaPYphXE-Azfb0MU1EzsNpAMFntDeAt8YAMj5KAxS_xA@mail.gmail.com>
References: <20240910-static-mutex-v3-1-5bebd11bdf3b@google.com> <ZuRh9niSrX6E5CWq@phenom.ffwll.local> <CAH5fLgiaPYphXE-Azfb0MU1EzsNpAMFntDeAt8YAMj5KAxS_xA@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 908183d6695a87f8425fa3f43bec44c0efbb85d8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.09.24 18:10, Alice Ryhl wrote:
> On Fri, Sep 13, 2024 at 6:02=E2=80=AFPM Simona Vetter <simona.vetter@ffwl=
l.ch> wrote:
>> On Tue, Sep 10, 2024 at 02:23:34PM +0000, Alice Ryhl wrote:
>>> Add support for creating global variables that are wrapped in a mutex o=
r
>>> spinlock. Optionally, the macro can generate a special LockedBy type
>>> that does not require a runtime check.
>>>
>>> The implementation here is intended to replace the global mutex
>>> workaround found in the Rust Binder RFC [1]. In both cases, the global
>>> lock must be initialized before first use. The macro is unsafe to use
>>> for the same reason.
>>>
>>> The separate initialization step is required because bindgen refuses to
>>> expose __ARCH_SPIN_LOCK_UNLOCKED to Rust as a compile-time constant. It
>>> just generates an `extern "C"` global reference instead. In the future,
>>> we could expose the value of __ARCH_SPIN_LOCK_UNLOCKED to Rust in a way
>>> that Rust can understand. This would remove the need for a separate
>>> initialization step.
>>
>> Yeah it's just a raw C struct initializer, I wouldn't even know how to
>> move that to rust.
>>
>> An absolute horrible idea, and I didn't try whether it's even possible:
>> - put all the global locks of a type into a special linker section (we
>>   need a macro anyway for them).
>> - patch them up with a horrible linker script objtool patching with an
>>   example lock initialized by the C macro.
>>
>> Even worse idea, on most architectures/config it's all zeros. Iirc the o=
ne
>> I've found that might matter a bit is CONFIG_SMP=3Dn with some lock
>> debugging enabled. We could make rust support conditional on those, and
>> then maybe a build-time check that it's actually all set to 0 ...
>>
>> Requiring the unsafe init just feels a bit disappointing to me, when the=
 C
>> side (including lockdep annotations) tries really hard to make global
>> locks a one-liner.
>=20
> I actually have a prototype lying around that gets rid of the
> initialization step. The idea is to define some new macros:
>=20
>  #define __ARCH_SPIN_LOCK_UNLOCKED      { 0 }
> +#define __ARCH_SPIN_LOCK_UNLOCKED_TYP  unsigned int
> +#define __ARCH_SPIN_LOCK_UNLOCKED_INT  0
>=20
> Rust then uses the two new #defines to initialize the raw spin lock to
> the right bytes. As long as __ARCH_SPIN_LOCK_UNLOCKED and
> __ARCH_SPIN_LOCK_UNLOCKED_INT are represented by the same sequence of
> bytes, it should work.

I have no idea if this is possible, but maybe one of the C experts can
help with this: could we define `__ARCH_SPIN_LOCK_UNLOCKED` in terms of
`__ARCH_SPIN_LOCK_UNLOCKED_INT`? That way there is only one source of
truth.

---
Cheers,
Benno

