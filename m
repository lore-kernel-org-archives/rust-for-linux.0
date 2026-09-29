Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA40397352
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666457; cv=pass; b=kG3+yFG1jRajQkrE6AgvjKzLJ0Oig3bHrbMQUsvFLocqMdhHdJnnhKUNI7dkXUrr6HAwU9Ds6s0WI+M63eAkTi+dl4JVyPx2uJVrpPMG0kWEarlXqEE7yfzvWPoMzmuTTRkKDIItlwkBorBnbvhwNhhTl608Epha3VRAfyckGo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666457; c=relaxed/simple;
	bh=YIXPo5sDK++zye92vFkYMf2iMd3cbyUKcPD+7Xot4vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIHHGlowjFXDn0CxEd+E/eweUmO6CAUezxQoaPnaiDB7EDIzwmyPS3N6R3wLF7g0Pst7X+sgLKePS/KhdDSaj2BGq0I7vNXYuXySB4plfNTMSm8mFytVkceMvpuh7RD4S38Z68uE9N3Y0NUiRjgyvm4En3fFDxofnJpc7JSLBcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnMpJkLu; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnMpJkLu"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34ad8819612so111070eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 00:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790666455; cv=none;
        d=google.com; s=arc-20260327;
        b=i7zZpe9/zEd56CyuYQTIezw4RYuVBvW67aMkdRFNOg8/uVd1KckgBkyVrE94rHrzCv
         jo4fBDCJcVgfbDaYgWwyY+zNn/I5UaMGbWNa/oVs/ksG5WWBa+wO7VtTEQTqfqLleYUx
         ZBOT87zHI8yvIAoZWerP03VMJi7HEJADDjhr4GTQU/lI+68sdSv8m0ECtSlVYvcV/s5Y
         UApKOkjXwIrrf9W4TMO/Q3BAF/R55+Y21txBkm7er4OHZDERrxSkK+/l2HrTBdsbxXSC
         iBu0Occv3LHxIBThd7wpn8ejE1oN1GGSHkq+U/TFj8z8odi1/bJx5Fd72EU11vbkEOnR
         HqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPlHzJtptV1uSpJGdy+PWfBS1MZ9EUMKQ00b3icFMx0=;
        fh=ZlTRmiBBPR3WTXeY31wzpUENmDuLkrlY7qhe7Mt64oA=;
        b=KvX0J5EfZzMzHspIHGnTh+ieHeygWt7nR+IGR+rJDPkecHAoRYVgao2coUJTBDpTG3
         n4mLIPsi1hu1sO6UtVo65owKMLwUdxd3jfCv76PxFHIKnqKcsIqtVMi7ilrW4hafi+sW
         fodlKXTX9tCaET2hcuqa6GV60RRHC1oU3okKz3nyAPf+CxvMk77OHUzPIOvGBymNoixd
         Qkfiisyee4x8EmpgCL7dCGRLlciKhRdMbwhEyCpin43cjs0gQzDnBCBwqS0fyvsgvoZd
         wP5jCAM/aPa99OVAA/18/zsfz4AWOWhMDBbJXP3a7UQBKzcUOnWyDDIH3gywuleypbgX
         9e0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666455; x=1791271255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPlHzJtptV1uSpJGdy+PWfBS1MZ9EUMKQ00b3icFMx0=;
        b=CnMpJkLuHECctDlzwn+gkVy9ULXjVGUUKFkQpft1GrIL+o82Wrqum3Ns04vMlWg83c
         j3FoExoS0As0NJjk48o+3a6JT2iScZk0wIjZHCgzwFZy2u474+bZmzTPuaIs5KmNBJsU
         h/qLe+HIA8LASAGJMQWsMJXw2rLZd3bT0G8Fs+n2j8m2iDtm0C8aZXIF58/moriEug5z
         S0G7ZbbBAL9M2nFuQe4IBx/4kR71yQNwsSOxRIe235gVbF2WHfIRYKdh2o2YZGdvt9pI
         DKG2S0iTqHUjnucXgl2nFLg/K5fHqK1ylsqiqbjSFBJBpsVRoCRNphu67FjJn3kWytvO
         jDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666455; x=1791271255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPlHzJtptV1uSpJGdy+PWfBS1MZ9EUMKQ00b3icFMx0=;
        b=yHHbNr/7LCJuO6Vn0L8suFvjFVbY9KZvjsH2rAwYMIvQsiJ3odTfTe4QqgYyfEzxIb
         ZtiUNp0Ofdp0rV8RNXoOKxoXtE62ZxCsf+35c0fe+ziDlz2hq2+a6wM3vwG0mf+F1S/T
         aLsJMpNkTBnva9hM603KJvOHmT6AAdcQB+CqRlo8cGUdznRGsmU1bK6prP6uUwN1ouTx
         yTQtUeGPAh4nqif3Q2RVtvq3Zgpbpa1JdRF71wmzttT7sjNUdJK/aEo3LIR2QP5QMD2d
         NNbcE1LqvD8GVq+jjEWsjKar9Ola159Hp38dss9h5wlMLJS0Uq6nPgq2MVsOrUDh/I53
         sQyA==
X-Forwarded-Encrypted: i=1; AKwUvBzyyzPpssnTldq/xFytecfOdZtwW3Bgb43tXl1vz3AUsEHKNdOaR3tSbmMG2SgpCdilgND/nBgiZbToTjbLgw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJlCJFioejKUehTocvD6WRW9HT6tKbONRkL2SB6TNwZt2qbUlgZ
	0716uF3UpLDB+pHjGGwY7NgZBFIhHl+L6Fr7NVOGNEFj/sKAeN6+AuVdgoNraG+/lQRwXScavtl
	Ze294ML7zKlgsaAD4r3JwFKQ7r5sc79U=
X-Gm-Gg: AYBFou2BSV5ytjfCGH6sv/EFcWe6/sJ1ihCWIVM6bkSXQt4SOZvRGtoZLkR88eRXYjn
	ID5Rx8Eq/EY5bnaneSrrBWh9mwL01S/E2f581477IkF6+rBt0WSa42cL4+JmBMHOsOxSkZJzCkv
	Q59YTcpV7p+ICdswGzyaXfBOK9M+OiyM5/cooJ6yfskGErkIwwTplrGRh/3v4vtQ5tXUVk2PXSz
	umzqKesRaqjGc4U9Mof8hB16vSh5qXt64SKUI93AczLx5mX3OQPuJc5aUc8Jo7lU8ZfHAQDZq8Q
	enPxF1s7mrlZv/RiHyTHoNUumr2a/YjHMKy0FcaW+EwNzMGhFx6LfZT7jm94ye/6Q26FV9zPaYq
	dQnPzhwRXoSKA7JpBIAVOvaN4BKoXXpofX0CCqFCNV/Yj5991DgaxwA7QPWL1sA+NhXGITsuV19
	qEfN88PN3UlenQvsNGWWm17mAIlrhPvfje9zJXc8ZyHrxOIJ80y5w=
X-Received: by 2002:a05:7300:ff44:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34b101fd0d0mr2826129eec.1.1790666454575; Tue, 29 Sep 2026
 00:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
In-Reply-To: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 09:20:40 +0200
X-Gm-Features: AclHuK-wUp_w85qzn7Pr0GSkGHptuldoh-dgMIHDSULZGx7jOmU4Ks9a3o77QsI
Message-ID: <CANiq72=q0U1skGfrYWZQiHr9JmipZ+rpoUJ=-wH1kHW4H0E36w@mail.gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
To: chenhan <chenhan0017.work@gmail.com>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:39=E2=80=AFPM chenhan <chenhan0017.work@gmail.com=
> wrote:
>
> Tested on x86-64 and ARMv7 QEMU with CONFIG_SAMPLE_RUST_REPRO=3Dy: zero
> divisors and i64::MIN / -1 panic for both APIs, while 10 / 3 returns 3
> and 10 % 3 returns 1 on both architectures.

This does not add much information, since we don't have the reproducer
here, i.e. what is `CONFIG_SAMPLE_RUST_REPRO`? I would instead explain
what the reproducer is, if it is important to do so.

> Fixes: 4521438fb076 ("rust: time: Implement basic arithmetic operations f=
or Delta")

This points to something that could be backported, so if it is a fix,
then we probably want:

Cc: stable@vger.kernel.org

However, this changes behavior -- did you check all callers etc.?

> Signed-off-by: chenhan <chenhan0017.work@gmail.com>

The kernel requires a "known identity", is "chenhan" one?

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

> +        // SAFETY: `divisor` is non-zero, and both operands are passed b=
y value.

What "both operands are passed by value" is trying to say? i.e. what
precondition are you trying to satisfy?

> +        // SAFETY: `rem` points to a local variable and `divisor` is non=
-zero.
> +        unsafe { bindings::div_s64_rem(dividend, divisor, &mut rem) };

What happens in the `min / -1` case?

> +/// Panics if `rhs` is zero, or if the quotient overflows, i.e. if `self=
` is
> +/// `Delta::from_nanos(i64::MIN)` and `rhs` is `Delta::from_nanos(-1)`. =
Both
> +/// cases panic on 32-bit as well as on 64-bit; see `div_s64_or_panic()`=
.

I think the last sentence is not needed, i.e. if nothing is said, then
it should be understood apply to all cases. Perhaps we could keep the
reference to the function, if it were public, with an intra-doc link,
but it isn't, so I don't think we need it either.

> +    /// platforms, `div_s64_rem()`, takes an `s32` divisor. The dividend=
 (`self`)

Perhaps `i32` with an intra-doc link instead?

> +    /// is a full `i64` on every architecture, so the width restriction =
applies

Please add intra-doc links where they work, e.g. [`i64`]

Thanks for the patch and welcome!

Cheers,
Miguel
