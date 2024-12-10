Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF657230D36
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Dec 2024 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821522; cv=none; b=VcK4aB2Y5fDTSR7HHYFjKW2uj8VDdohENbx8ryqKde2373XUPELf+JKYtBkm/KWDXjQ0GdTfPNh8vFwn/nB5p7A7ryM8THKMXUaOYE/ZggqzbI4KHfAbFzXYjffEKipGjzKpWTPXdZGuoobAfcW234yOY1wW9y6Em78DZ8sQTYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821522; c=relaxed/simple;
	bh=3NtIMl1DjCiUo8OeDU2MLnM1AfkfRHex0Tmo2GMo9SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iblestn6ojBU1rxsUgYO4DDzluzcp0SnulwLtixp9aKv82y/7gbTI2Actkhb3xauxO2az6n3FEFvhBl+8hpPYWNNcDrVzheidmhtqp/ZWlX7cQ26z9kEvDwgyF61fB+pxhHoiF2/tNzpMMeI0QMhoWcn35s7TMTEjJ73sBjK3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0j4pNGwH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0j4pNGwH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862df95f92so2693990f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Dec 2024 01:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733821519; x=1734426319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep5OKFJpfszekExX4/IRcefemdiT8s+lNUZhAL6lYhw=;
        b=0j4pNGwH+ea6cCJmstueJN4Zf/3m7JjiuSf+umWQ0PyT6FnPqDqi03YBPx3FmuZDS2
         uR/Ng2evyBE7dvBLD89C207AqsI9gJ19EZ0cq7sNgVnNshEqqIlehCJAbyu4YV9l7+99
         jnBa3te3GvTEb7wSJqRJbVJf4++j1ngu1P78rOail6EH1nTkaBShDLDq5y6XwdsckGK8
         QUrD3OixSgxIiQW3UFS8eeHTk2HpHxgRMpYB71RuHm9wnS0RDKF5ypjD8DchU9mZwQ2S
         i+G0p6MsulvhkvRIMlcHmN+RMt3EaYNJBjF7N7tcfuf5Cv0jch9PTvjIEAfgVyZLKqk4
         Ba9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821519; x=1734426319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep5OKFJpfszekExX4/IRcefemdiT8s+lNUZhAL6lYhw=;
        b=Lyi31OvxWYVP/YlgcM0QmJhitp1cD2oAZhfHp89rCbVyI0g3E6fNrcoAn3BFyfavot
         bQ2Y0v4tIiSfppRCswgUVsv/+QfKycj8SG+8pJaKNyWMFE/HU58cYM2Wva7xUHRxYLUv
         ZgRv7gtEFpEDGwwwuunOL9HeuL5QJwVIj+WNlQZDSDMcWD0EB3zqYW6wlRQLPM8znzOm
         t5lV4ZDDkYVCubhpvJHYkSXL69vHydl9CAj4+OEKNGyTFe0vtwvs7Zb3d3SHKencEumL
         x40W5hdtvcDdRgWC9xXMTDWPdghm01iPh1+VCmi1fNuyHKHshGtv5S+3XqJbx52WQ3gq
         mjqA==
X-Forwarded-Encrypted: i=1; AJvYcCV6rXt+9uWRvKYf030mDibRlsm72ehF4RWBQQwphoOzvyI6Xf6ZpFN7CUfsbiRTwWaO4tijdyiRhJp6ACEicQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfwID/+YdJAeUyEK6ycnYOlNRILn3RI2RRNbVhTxqQ/icmENB5
	Kyh+29kuPuJYWwJxi4DB7CdZJghqK3dt9D2UJNbOVoveJ0GxdpoaRuDy2IdM8Bza5ae65l0qM04
	4ELCTjvK2BWHbnWy3T//fnuERMh8hxn/Wuqzw
X-Gm-Gg: ASbGnctSwyogfXDovHdhqRSIRidQtCrdoujHFLoQTYybNgRCvWKTIA9/Gqf+M3tLLSn
	CLlHJIgJc8K3024ezWvjQvueeqEWf4xa8AgxNEUcEndffcHCRCsbh46+rfOQM/TNEYA==
X-Google-Smtp-Source: AGHT+IGIVjgo6xFN35HYB1TgvILbI9Al6TSHNEWYp3ypNeyi+o9RjYaXrxzLsc97Z2zDVdAJ5OXIaoQOhG2vsZwboeY=
X-Received: by 2002:a05:6000:156f:b0:374:c4e2:3ca7 with SMTP id
 ffacd0b85a97d-3862b33e3cemr11655971f8f.5.1733821519043; Tue, 10 Dec 2024
 01:05:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210001802.228725-1-fujita.tomonori@gmail.com> <20241210001802.228725-6-fujita.tomonori@gmail.com>
In-Reply-To: <20241210001802.228725-6-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Dec 2024 10:05:07 +0100
Message-ID: <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
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

On Tue, Dec 10, 2024 at 1:19=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> macros doesn't work so this uses the assembly code exported by the C
> side via ARCH_WARN_ASM macro. Like the static branch code, this
> generates the assembly code for rust dynamically by using the C
> preprocessor.
>
> file()! macro doesn't work for the Rust inline assembly in the same
> way as __FILE__ for the C inline assembly. So the code to handle a
> file name is different from the C assembly code (similar to the
> arm64/loongarch assembly).
>
> ASM_REACHABLE definition works in the same way to get objtool's
> reachable asm code. The architectures which use objtool (x86 and
> loongarch) needs it.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +#[cfg(any(target_arch =3D "x86_64", target_arch =3D "riscv64"))]

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +#[cfg(any(target_arch =3D "aarch64", target_arch =3D "loongarch64"))]

What's the reason for this arch-specific code? The file!()/line!()
invocations? Could they be passed as an argument to the asm instead so
that we don't need target_arch cfgs? I understand that they don't work
exactly the same way, but maybe it could still work?

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::bindings::warn_slowpath_fmt(
> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::cor=
e::ffi::c_char,
> +                line!() as i32,
> +                $flags as u32,
> +                ::core::ptr::null() as *const ::core::ffi::c_char,

I wonder if this could be written to utilize Location::caller()
instead so that `#[track_caller]` works?

Alice
