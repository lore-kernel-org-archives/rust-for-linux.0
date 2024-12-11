Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176A71EC4C5
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910522; cv=none; b=jaC+5LtFmliR8ZCSrHo3Yo4yBjV8/hceqYox5Mfiz8I49RCbJce9htP5stw/VgSPK5b/Q2WP6LriAQguWqLWQRVCvyaGn8ltcw9w7hEbHDYn4KO+y6S4IFl3zrKFU6FlEHrIVjpi7n+A6SgrK9REA0z/QDrHbN0RjV9rufssdcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910522; c=relaxed/simple;
	bh=ZKaxjHmeS7EBCn4efUXAggiPsRojJiDnotoal15ttGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnUQ8CKlbg5x6O1wPOSwCz4eMPrUbXlooDQN/1wVT1C1tx2r3o8Jm0+ULPoNrg2YWE6ar7oddmaGodo2qI0HHOMwajaWXuT+CkuiXC+2efRu6hBD45fGPVfXz5Qhe7UNZD4s9eRiK982Go7Ns+nnb5vXUY2a01JXhVpVby8fINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=edyLe1FQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="edyLe1FQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3862f32a33eso2170776f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 01:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733910519; x=1734515319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPkuDVmQ8I0bPStjeQByqCDXTekXQdwOcRMPaf2EPFY=;
        b=edyLe1FQq3AnZlpeY1UASTnu/MEy3sHd/DrwDQvAssz1EZpCbZa14hxw4nRdAcXMxC
         Jkb05wyAFXkZv4QnDghirz7G8GMQx2A8MTq5xfEoAMTyr8qf5gCJ1X6FbXI5yPtu20B6
         u4BXun0pdqVQZCqtlTjEEFd5ru58Fp//Nhc0GzjK4zPerqWZMjL5P03tMZEbRDbjLT4j
         bkz8F4pwn79yMkho1DgDZC5cd8Hf/t38LhkkpnSY+bktmf25TNFEu19wve4ROf7qTylp
         c2JgGtInPnykvPOtWL+ve3NLA5WFfGPFZsDhDxq25dzNB0ZRKiAyTPKw0f4K9tY2hwmW
         KM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910519; x=1734515319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPkuDVmQ8I0bPStjeQByqCDXTekXQdwOcRMPaf2EPFY=;
        b=e2bYcraeHAdDI/xyR21ucJWuUJF0nFyo9uyfeoXhb0I9IyhpToTJvR707GSjRRrlh5
         DuZCo9cTcmiTtx3924dGjaQ87EM3RiaahMeNiDsoojX8yESYGfQEdWlMOHfTNtHy0zJx
         XqhtWff7UzeAmLLVE8BS6a0OHLUUMf8f+seBI/EmeZ6lTxSLcoCyOhxeeYioNQMS2zHu
         3hrCccVgGRvNIk9nX9ChdDa2GLmx3HJAFhhvYt4fsn0M+BrXDUG4TyEbdPp6DRjJXKsJ
         U4TbqIggY7JKd3mL9hTSD0GymzKtiTsQXiuPy7xYR3lEWnUoMUK1sBbEZ2L3INBJ8qdw
         Hbdg==
X-Forwarded-Encrypted: i=1; AJvYcCXyA03ZWkq361zkGV30mBbTe8hXJhZz+Pvep2NOSRJqMfPzxV2HA0bZMEIsz4bs9KCbFxOQyr+VF/8Ezl8QeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9aCayaej1uUxbjzOWBDuocAMMywLvM6UolYvAyMYNLehKIC7
	cUtk8AElT+pwT2IvfmwfbCr3wO74ugy2OC4+4ofaglo6Esh0nHEX+XO+yckJSNSr9Q+zrcRXYXs
	zFv5AkolOGArXo4OvOf8Jk9M2jZ8pM+q7nKMh
X-Gm-Gg: ASbGncvvNogbbRwdEJCcoRewsqQmx9EZijWDwr0cZPqw4Nc2PS4IkZUyJzsVHS5cpEg
	AXd63mF24/uLvmtTbHtY0bl78s0szQnXSQr0BydaO4wI86o7L2LBubP1K53+N2Xqt4g==
X-Google-Smtp-Source: AGHT+IGgLsoa3jV2scUrxGJs3M3c7OjkCrlHZsyu8jTWcAJIYLV9qXmSt5/Cg8qsliTSfr6/wIq7uJuo1wJlePE++No=
X-Received: by 2002:a05:6000:410f:b0:385:f2a2:50df with SMTP id
 ffacd0b85a97d-3864cea200amr1277675f8f.27.1733910519359; Wed, 11 Dec 2024
 01:48:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
 <20241210001802.228725-6-fujita.tomonori@gmail.com> <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
 <20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
In-Reply-To: <20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Dec 2024 10:48:27 +0100
Message-ID: <CAH5fLgj9rBOrcQa193RpuA708CFK1ojMqhmiNWF7dbyNFPJcJA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 1:41=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Tue, 10 Dec 2024 10:05:07 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Tue, Dec 10, 2024 at 1:19=E2=80=AFAM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> >>
> >> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> >> macros doesn't work so this uses the assembly code exported by the C
> >> side via ARCH_WARN_ASM macro. Like the static branch code, this
> >> generates the assembly code for rust dynamically by using the C
> >> preprocessor.
> >>
> >> file()! macro doesn't work for the Rust inline assembly in the same
> >> way as __FILE__ for the C inline assembly. So the code to handle a
> >> file name is different from the C assembly code (similar to the
> >> arm64/loongarch assembly).
> >>
> >> ASM_REACHABLE definition works in the same way to get objtool's
> >> reachable asm code. The architectures which use objtool (x86 and
> >> loongarch) needs it.
> >>
> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >
> >> +#[macro_export]
> >> +#[doc(hidden)]
> >> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> >> +#[cfg(any(target_arch =3D "x86_64", target_arch =3D "riscv64"))]
> >
> >> +#[macro_export]
> >> +#[doc(hidden)]
> >> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> >> +#[cfg(any(target_arch =3D "aarch64", target_arch =3D "loongarch64"))]
> >
> > What's the reason for this arch-specific code? The file!()/line!()
> > invocations? Could they be passed as an argument to the asm instead so
> > that we don't need target_arch cfgs? I understand that they don't work
> > exactly the same way, but maybe it could still work?
>
> Because of "error: named argument never used" in Rust inline assembly:
>
> All the archs define ARCH_WARN_ASM macro in the same way:
>
> #define ARCH_WARN_ASM(file, line, flags, size)
>
> However, only x86 and risc-v asm code use the size argument. Without
> the cfgs, I'll get the following on arm64/loongarch:
>
> error: named argument never used
>   --> /home/fujita/git/linux-rust/drivers/block/rnull.rs:54:9
>    |
> 54 |         warn_on!(true);
>    |         ^^^^^^^^^^^^^^ named argument never used
>    |
>    =3D help: if this argument is intentionally unused, consider using it =
in an asm comment: `"/* {size} */"`
>    =3D note: this error originates in the macro `$crate::warn_flags` whic=
h comes from the expansion of the macro `warn_on` (in Nightly builds, run w=
ith -Z macro-backtrace for more info)
>
>
> Any way to make the compiler to ignore this?

The error message suggests adding an asm comment. Does that not work?

You could even add the comment unconditionally on the Rust side. It's
not like the comment hurts on the platforms that *do* use the size
parameter.

> >> +#[macro_export]
> >> +#[doc(hidden)]
> >> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
> >> +macro_rules! warn_flags {
> >> +    ($flags:expr) =3D> {
> >> +        // SAFETY: Just an FFI call.
> >> +        unsafe {
> >> +            $crate::bindings::warn_slowpath_fmt(
> >> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::=
core::ffi::c_char,
> >> +                line!() as i32,
> >> +                $flags as u32,
> >> +                ::core::ptr::null() as *const ::core::ffi::c_char,
> >
> > I wonder if this could be written to utilize Location::caller()
> > instead so that `#[track_caller]` works?
>
> You meant that we could make warn_flags() function instead of macro
> with Location::caller()?
>
> If so, we need to add cfgs to warn_on and warn_on_once because both macro
> and function of warn_flags are necessary?

Well, I'm not sure! I don't know if it's feasible at all, since using
Location::caller() would mean that the file/line is not a compile-time
constant. But if we can, then I think #[track_caller] support would be
nice.

Alice
