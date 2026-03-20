Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB50371040
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 10:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774001050; cv=none; b=Ch+lwsTu5Z7TtOy48MaMo68n4wAaQOh2GlZ8VrqfHhI+t9SLu4AtASsoRNK1S0D9bsjVuJhMMsU13tG5l1+9Ld9Y2GylsrGgZN+czKeV5Tg1TRKHsozZ0DT/isNADWasrryAKhO4EDou5w/4HhypYOeV4RjISTFJHevHR420c4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774001050; c=relaxed/simple;
	bh=pUZM51P+s35keGbJ3K0YOR/u2sXloBZ/B/2/e0lWbIs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VqgNXlBSaIsrCvcnlMYFrkrDTz7IjcVT0C/o3PCMQSzDmQLEOU5Z5nMWl3wONa+muu01aTAew0f5pfD8q+vDTuPNi9EETNz6cxMABeathEZ8PKChkegrPAPeXsPZ/uGb901mzwVFve0vM8Cjr+GpOslrOCjOOjS5aMXqoCYityI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cy69ZqCo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cy69ZqCo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so23407895ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774001049; x=1774605849; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Izdm/7D68g40rNesT50ueXh6Akh0cFui4OgMPqSoSys=;
        b=Cy69ZqCoqKM0b7uD+iRcDnLkrkfFLXJqKoV7mz8G+g0lAid002Qxl+vbdPLnm08YI/
         EImBuY9v7iBjHNdwx3AIEcKnz4UN4mKpQl58Blm4eDsFJ1fvRXjzl69AsN6hAmL566HT
         RbQssHT5RSD0CQFDXFdyzSsqtHk/r80jxv2J+ukPWUY8/rFweiTAAdwnu3g73hrjtbt2
         OqG22u+TTkcW5ph+42MZqPFxMUgmYfudXuOCS71MH+8/LBzOHrJffd1BA41GdtMvEf8K
         0D6wSuuWetsUKW+OEq1IAes7QyS6NeEAixej8lf5IUjXtr8Jmnn/ax/3ReRpM5nk6dSG
         jCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774001049; x=1774605849;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Izdm/7D68g40rNesT50ueXh6Akh0cFui4OgMPqSoSys=;
        b=HHZGt12enbBkXmr8y8csf6JC4H8LnvpgG/y29KW6SHIFPIBikqV/t44TDsnmW9t1c8
         StvvT/uHX6pvGfVoJRFMnas6+NN8wv9yVhzCXPnSkvJ8mFdi4K+XBtZytIjxMD0ORrsv
         z4PpPcYJmaHBcXZ52TDAOvCycmIyHjZTQdTjg9dGaZQMwKjxmV6Jseeabrb05UpmLRAV
         s6Ve7VNdt36QKkDfuMsozka/rwh/E0Kmi4rF+tNxDRtTHWFh1Xdtq/JkchIFkIifuN0l
         uJIdCZh5a4b8SFdM8pugnMJSZQy9uRB4Ug8MaH70uUaYNbV688gQpzZg6tkCAlAAKSej
         sVOg==
X-Forwarded-Encrypted: i=1; AJvYcCWoTVvh3fQvzlnI1LEJz7cdsrQ3HQbwHgrAiyNfPTiMom8JVLAb9qEjkdWDBfPSaTo9df3MLLXOAEyDt8aG0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK6CO9soW2iYApWMxiYU/yIx6y/HiiZ0FMhHWiZVHuNozjY2IJ
	3fA+YA6pcGYfSrcX8oxpO8b5N4pySl8VJm9esIkRbQObB9c5VPfPWGTI
X-Gm-Gg: ATEYQzyhdLZ9RY3VYLtnzxNJEmx5Jc80k5zHGMZg4+tjt6xVvfW/V9ecj+u2+RFJDnP
	eQ3Jn7AX8hgBNM3PtQDUUeHUiBN4slkdYhPCeBhkaK9Ju/9GLDEt4FQhdUFXZW7aYHLaMtj0BlO
	YNi3G75FWSE3OJTGrkn3M0RrkiRaT0YJcRb8him8WLy0cUmWOMP/78I2STh2EinPiC8YctZElqQ
	W/jAkmoW95uzixfjpS6dUJac2bBuBkRN3weG2yY/O75/Xj2OUnvvzb1tdJ0eajEJDGId/v9EbCg
	tyG7LD9W4OgiNdWpxO+WpewPTb+JEJRguyzLarjzFuPfrp1hPtZY6h2DED1S8qIJgYG1uUwiKS2
	kWYnJN0oA5ZnoyFAuy59s5XOS63xHnuhxISqU+iMbSEgXIvkv64dnfxOZFzwhuJ2Toz5nmw52yp
	yy29s/02VTHzmyCGJgNg==
X-Received: by 2002:a17:903:244b:b0:2b0:676d:973e with SMTP id d9443c01a7336-2b0827e3593mr22392635ad.46.1774001047271;
        Fri, 20 Mar 2026 03:04:07 -0700 (PDT)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516400sm16756525ad.11.2026.03.20.03.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 03:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 19:04:01 +0900
Message-Id: <DH7IVVURBJ8G.QP1WRFTGS556@gmail.com>
Cc: <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Jesung Yang via B4 Relay"
 <devnull+y.j3ms.n.gmail.com@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
In-Reply-To: <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>

Apologies for the delay.

On Sat Feb 28, 2026 at 2:31 PM KST, Alexandre Courbot wrote:
[...]
> FWIW I have converted nova-core to use this, and this results in -200LoC
> delta. Obviously I like this very much. :)
>
> A few pieces of feedback for things I noticed while doing the
> conversion:
>
> - Very often we need to convert a type from and into the same primitive.
>   Not having to repeat the same thing in `#[try_from(foo)]` and
>   `#[into(foo)]` for these cases would be nice.

I think I can add a common attribute that works for both `TryFrom` and
`Into`, e.g. `#[convert(foo)]`.

> - In some rare cases, we want to convert an enum with 4 variants into
>   e.g. a `Bounded<u8, 2>`. This can be done using a `From`
>   implementation, and that's what the register macro expects. These
>   cases are not covered by the current macro (they are few however).

I think you can just do the following?:

    #[derive(Into)]
    #[into(Bounded<u8, 2>)]
    enum Enum {
        A,
        B,
        C,
        D,
    }

    let a =3D Bounded::<u8, 2>::from(Enum::A);
    // or let a: Bounded<u8, 2> =3D Enum::A.into();

This works because `Into` actually generates the `From<Enum>`
implementation for `Bounded<u8, 2>`.

> - When converting from/into boundeds, the number of used bits is the
>   only thing that counts - the backing type (u8, u32, ...) is
>   irrelevant. I thought it would be cool to be able to have a generic
>   TryFrom/Into implementation that works irrespective of the backing
>   type, but as far as I can tell this would be difficult to achieve.
>   Just throwing the idea in case others are more inspired than I am. :)

Yeah, it seems difficult to me as well since those macros need the
full type information to generate the trait implementations.

>> One last point: the current `Into` implementation relies on
>> `Bounded::from_expr()`, which utilizes `build_assert!()`. So the
>> expanded result looks roughly like this:
>>
>>   impl From<Enum> for Bounded<u8, 4> {
>>       fn from(value: Enum) -> Bounded<u8, 4> {
>>           // Compile-time assertions to guarantee `value` fits within
>>           // `u8` (Omitted)
>>
>>           Bounded::<u8, 4>::from_expr(value as u8)
>>       }
>>   }
>>
>> After some experimentation, it appears that the compiler correctly
>> optimizes out the assertion if (and only if) the `Bounded` type covers
>> all enum discriminants, though I'm not 100% certain of this behavior in
>> all cases. Can we approach this better?
>
> I think you should also be able to have a match arm for all variants and
> call the `Bounded::new` const method - hopefully the compiler will
> optimize that as well. That or rely on unsafe code and a (hypothetical)
> `new_unchecked` constructor for Bounded, since the macro can infer that
> its invariants are respected.

This looks much better. Thanks for the idea!

I'll update the implementation based on your feedback within this week,
but I'd like to ping Benno first to check whether he's satisfied with
this v5 before I send those new changes.

Thanks for your patience.

Best regards,
Jesung
