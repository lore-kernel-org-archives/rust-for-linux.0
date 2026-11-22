Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795343849;
	b=XF3Xa9l5hSu0X2CYq9GPXNYVHBiA1sfy/5c0xqTAVA8comiqonSAc5oRlC7RVP+1kdZZ
	 PhbPJUODe0wBMPcqMhR4ZzQgHxW0mjc1RZEdeo4oNtmRHPrHV9EbaNtfwillBvcYZTfOM
	 yyFyZhMXVp8/d6mlqk0xcCosvH7kBnHEZwCiTmG9YIw4CMyACVmdfTXDRTFJufPYKviai
	 0/T+2b7w5djj6520LkP7tlorgw/Xwt3lMNev8TNWa6jXMPpV6E9QSifRJi27EeaMiIBlz
	 bj4z2RH4R/GZAf8h6h7QgWCGrNznFyqUEhGL9HOXxC5lkRN5cgWo9eG96/l/H6FK6dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SkHThBbL3IF8/bZX9InG5rUd1TXxNJhC+NUu8na8ZaQ=;
	b=UiapGaDHKIWTyxbzzHMZhzeGSOT3lCvunRR5Y8oUUG7qBtdAKLx5Mz95Lu3vMPEtuG0v
	 Xlhm7QOR4wThHivUXQpauUS0TwjfgeIZUwLjA29PEtQZ72n95Ue7h4fxhe5VZ8Gvq+8cq
	 DeIyZVMYUerZco2scR4aiDqBkMJyoMvOUx1Z7D14cmnKnBDBccXu9cNlBU0ZL5bUSB7Fx
	 FaWP2QS5ADviheZihQmPjTBAVdxPsbTpwA11z64SbYTDV0uuRDcMNbSClrKL911ZGDzg/
	 KXfMry212CwrDF9Ikn82WbKktX+X5ugdLj5atVhwsUpD6S/NMfCzfv9mJSjeqC6T3kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxLLoHl+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF8606A33B
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 10:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AFF8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxLLoHl+
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso304744e87.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 02:37:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795343847; cv=none;
        d=google.com; s=arc-20260327;
        b=OUX+yY54YUS3o2jvopu729rSYftNjSyzXwLaxStWDtJW5Y9uTWDNMIIikYJxkUA3ef
         f8wmJW1s3nNeKZX79yqDxIjXrOyO7kxL14bVlIkGE+IXZ9nmyMa+3DIvRt+dJ32ZeZU+
         IbJqy9z4P3TAEO/8T891jRGaLDeeCLaOdXTzzfgHmCEw7JeUKGKYyVpWQkX3taSdghHz
         FQ6Wfh8lbHmlrwEj082LuWfOCx/INhUN6/Epn/IxMRenpYMpz1kDiQB91blBC0SwSdu0
         uX72scZJg1g47QBAaveNwjW/bJsH3ou/I2HnXnks+gSXYHVp1cF6/FafMzzJpr4eoTQi
         dxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SkHThBbL3IF8/bZX9InG5rUd1TXxNJhC+NUu8na8ZaQ=;
        fh=nBSJFtoHUHdeWwkmGfqvXt1L3DAeSZa592ripegiSzU=;
        b=iAhig44xjGinpkH96f5GMNCvqqRh+3WW0h3nArEKvmRTo5aSUvfQUtM2t8/dBB7oBr
         ol501VTIB8BXC/xTi1+s5GF24A72uSoXbXzNJ+rQTN63sw6wm1Ua/+8DC+7Gup3hWKY2
         J2KsF6Ydtf1kjoDI1bVgtWFBdwMQmy1V1ROMUwROLsi+5JvH6hItrrcWf/SO7KgHGNRo
         SXnhl4mLR014cpFq1iE8fxWH0QLCtAgMBpivN2Dm2VRF+N58KUeRup7J8YpQhDv1BBW8
         zfjuE+oicB2gpBpsAuIqah17pWjmEhwWZMBdZ+PVZaxUiLn0EWL22plRxldgFYna1sWC
         llSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343847; x=1795948647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkHThBbL3IF8/bZX9InG5rUd1TXxNJhC+NUu8na8ZaQ=;
        b=yxLLoHl+fwguCBO7F8phUX+J4ajaH2yEKHmMYDsOVnNp8aOaX/ZTmgqTlfVRzQp5AD
         c3+cb+EYVYZDj6pyBth/wuJR/VbKpDtEeP7AXRirOidtfMD8eSLVpXFS409ZV+pK+QMw
         Efy7wksgrj6RYGQL4aRD/bqpKMWnlJeefBxratoiTuzhTaDQqwNUyld2JJTjmOQkLMy2
         EbwNgksGLxvdBRgUwYioLRkK2XRAf02rjlY6IwlEBtLnR96OK83BF3Sw7Rssoqrecf8W
         NtHwN7veS0ESRl1tLbARdizJraCXBjyeO1eXJ0pfI87DaeRCnQ7Vj3XAl1BwKkx+VzNl
         bsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343847; x=1795948647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkHThBbL3IF8/bZX9InG5rUd1TXxNJhC+NUu8na8ZaQ=;
        b=ivN2IPYTgVqVrrY1Qzw6XNzjWFlduJdoXFeC7d7RSaednYZXISpGn2zGzuxgBAM2Qz
         k/J0MMuOBgpc5Lyf/vaVWKUfFEoKELiCf5ispxRisT/Q0nixlQXzq2nypZvIpHI1aVVk
         9R44yRh+JpNK5GObYRBuhJq+CIsOTWuqagkWarSObfX097Bgd5NrFuChCzUc9eiVc3Hr
         lcm/Svso9EeiF8vqrqgGYSzu3h934spp99+XL+BNedo+VASpWAJhTVWg+Irke7fT1CG4
         0hp3cSiZH7XnIUcqkbah+pPsSjGvSpPuHqGBVLxlY2xQRtLo03rGH0SWG6/9C2ky6tMU
         yCrA==
X-Forwarded-Encrypted: i=1; AL+hErH3baDZDbisLJkOXmmD2A8aR10hNvtJBzepNsOChuc7McSTCIYpPgPZRGnLY38KPYFyPsPuXtA7gEjvM2BkDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rmd4KCt4VrmLKtFkw3f3V5jshXN9m8AkdznsFHs6Fd8Iv6xQs
	c5Eqo5OxeUsNK+Mnt+SMpKeozCs5q1KAkpG7R6Pumz70jNT6yO61spDS4cTt/4oez7pAjZHL3mg
	wcyO8BE8F3iL7k7he6sj30m+z38Ojhuc=
X-Gm-Gg: AZFdTZcGQgxYOizZzkCv4sdkTX91n8B//XXJVClkpCL0tPxmbpSzihmH37xkPRdIXN4
	dNuT0uZgNATzml/VL7gt2x/NH4J3fndaT5YATmtHc7WQC8zleJBeX9xuDPaVhdZwcTai6iL1FMA
	w8OWgaRQLFltTrhVBeRsk9OM0yPe4BH/CS8aNLazPO9U107zanO9ePAhZehT3c/GtY+jP1y+eOj
	A3KUkJJZDL6a403RzD5JP+KhYrWdmtaoHXQ12tHlaI9562g11Jrb/YZsyxaeOHXwUTP/UgKzEQd
	GOy00BdBHlAMAoVDPWUJ3mCJzFh+I8i1pUjyByuYF9YNvQCWtldqhOPUv5IQFwXwWGccUD0DTKj
	7x3TIan092wQSQNqY4m34dU4+ik44558RD1PJxz1H//oEs7QWSjj938TCsnCqTS9jEl2WOlLbtV
	hMBgvrpnppDKu1vMiljZ6OlhPYqJlb8LZtxVfMRXoReo9EeWBcZAgq4ORA3vTmnADsJy/YFHoj0
	I1MkgEdjB9UxJUTCa8bA8Z1Kjs9fW12GzyT+u3pB2ykevPT5aO/NeX6ItiT51wCsLBQoooD
X-Received: by 2002:a05:6512:1384:b0:5bf:ce24:38c8 with SMTP id
 2adb3069b0e04-5c1bc797ddamr2535837e87.4.1795343846483; Sun, 22 Nov 2026
 02:37:26 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
In-Reply-To: <20261122-rust-dmi-v1-1-4ace9449f872@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2026 11:37:14 +0100
X-Gm-Features: Aa3M54p2K8gxR5qOYb2sPLuv86fFx9GH9QVVzKPq4L9N9ex9zsEmuZ3vk_xxDw4
Message-ID: <CANiq72mFCq01A_=B0gyaut1rPWeECOdDwP6pD3FBv7n4oH6TWg@mail.gmail.com>
Subject: Re: [PATCH] rust: dmi: add basic DMI matching abstraction
To: nick42d@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 5:28=E2=80=AFAM Nick Dowsett via B4 Relay
<devnull+nick42d.gmail.com@kernel.org> wrote:
>
> `dmi::get_system_info` is currently marked safe under the assumption that
> Rust code is always called after DMI is initialised. Would be keen to
> have this validated. Alternatively I think a minimal patch to C could
> actually make this safe earlier if required.

Please avoid soundness holes unless there is really no other way out
and/or it would be very, very onerous to do. The bar is really high
here, i.e. if this is just an `unsafe` function, then please simply
mark it as such, which in turns allows us to document why and to force
others to ensure it is correct when calling it etc.

Of course, if there is a way to make it safe (whether with a change on
the C side or with API design on the Rust side etc.), then that is
even better.

Since I noticed this while going through the list, let me throw some
nits from a quick pass at the code if you don't mind...

> +/// # Invariant

# Invariants

> +#[expect(missing_docs, reason =3D "C version of these consts are undocum=
ented")]

(It may be a nice time to take the chance to document these in C, but
out-of-scope for the patch, of course.)

> +/// # use kernel::dmi::{self, Field};

Vertical formatting.

> +pub fn get_system_info(field: Field) -> Option<&'static CStr> {
> +    // NOTE: This can be upgraded to cfg-select post Rust 1.95.

`cfg_select!`

Though I am not convinced we want this sort of comment -- it is true
that we have similar comments for explicit workarounds we want to
remove later on, but in a case like this it is the "standard" way of
writing the code at least at the moment, rather than an actual
workaround. And we can always grep/LLM for these improvements when we
bump the minimum version.

> +        if ptr.is_null() {
> +            return None;
> +        }

Newline after this?

> +        // SAFETY: If non-null, `dmi_get_system_info` returns a C string=
 that
> +        // lives for the life of the kernel.

I would word sentences like this stating what is known to be true and
why (since that adds information), rather than conditionally (since
that "repeats" the contract of the callee), e.g.

  `ptr` has just been checked to be non-null, therefore ...

Thanks!

Cheers,
Miguel
