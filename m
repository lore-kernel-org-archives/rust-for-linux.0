Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D23283CAF
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 02:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197061; cv=pass; b=MzkQrQMaBxBzEJU6nASlQwTWxdy9xyFhytEaYQjgDJHLerr5kEQeNzxquYbIE0O700qzzQru8Gw+nvPlGF42tERNPv/18I9f532MFFJemqINwRFs60AqC8tHJs5iBfcYIUHtzkFV2Q/UOHHUyio+nRvftHzfFgkE1LTxHDY2jRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197061; c=relaxed/simple;
	bh=3JD0VC74mLxBvQCagNobJZ17Es9Rvor/QFxHcKAc4PY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izMVCfZnfieMYQReVxIheO0f2la9gj+PtpGdYC6q9K+RBMZGRAosvb8i9UEX2JFNPoX3ADMCsFgnvV4GhBhPSX1l45iavV6Q1zrwjpwAY+i3OBxtbIhPpK7OzEMgnnS58NEWM8y6NZWLSoLY7yGU9/icPHLJGiRLFWtmSDxTJXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hW0pOIri; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hW0pOIri"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso4376261fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 19:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773197059; cv=none;
        d=google.com; s=arc-20240605;
        b=IbJDrEWTynrZ7/1rktzfk6vlLKc9nJzvj87mIHg6ut22BqXtckDz9Sxi2YcUZcfVDY
         vJnGK6YXJIyJ0X/wdznJHxFG3rE84S2ErTjc+BdKFkDMck/zCaP7NyQfTFBnuel8pxle
         KmxBeyRU+2TwwnyOdzmLgmYoq4txzSWqLFc0X9TPIUOa8N7MIxetCiXGO9qfMx2KzeS7
         dEQGNRMHJPT1WYkRRrgHNOjJwYZ7uyxtNwxMNUSNkQzdPbyWfFMKma5w6c3R9mAaZpId
         oyeD8D/aJKmMPcebMLD8uGLH4sNAmNTQqqzJ0YCL9dFibmF3KDXnws6tdcPTKJXbmghJ
         iWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3JD0VC74mLxBvQCagNobJZ17Es9Rvor/QFxHcKAc4PY=;
        fh=Ciu9Jrc27QvNXdddoZ7sDfXNWWcDyvWTj/i8a2V0dxA=;
        b=dx+z7j4/Oq2Grxg3by+V5ZBZXab/iJNPiKTD97+q9etgp4m7Rcexo5lIWnPmEQp2Y3
         fWgu184nPRnqylagYhrtPqqnT3JfZmfZnBH8xGhD9EtfrqAMskg0QYE8Z3iRSBS/6yNI
         GSpUrtCgZSdN0UuLfcnZl4R3qjMO1QlLY5jPbTosLrAJ0UweMTSgpYxoorNZlHJnFfjf
         fGzlzqRrHlVN5EGegCSshCnYosFtwfOO3JyLgYTP2U6ZaArHirboy0F7TxflBHxqJb7B
         No3Dwvcc1bB1CdLeX7b5gQ83LIaGpHPc5/FUPC5xyNd7HSJZwo6wBtkIfB17wJI5lhh3
         c6yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773197059; x=1773801859; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3JD0VC74mLxBvQCagNobJZ17Es9Rvor/QFxHcKAc4PY=;
        b=hW0pOIrivUoKBvarvQSHvFc30V2jba3GJ0Qeou35t/ox49itSt9d0uV8GzqhrBRSsu
         SYnHTNWcRqyXMSlBkqBO6+rJCgXUylqcdk/GYvMzM0l23aGYc23sr1gPAfRSYasFSUnQ
         q0H12yqx9fV/rVZRT1g3HG5q/XUDuwUNvKYwJK7Bs8ah2qzKdWh0jcmKtbbc5UhuWet/
         WHiV/JvTC7dyodeOv6hJ/DgcKILxsze1O8/JtaVGAJc8vIZFNNbwfZTk1F/o9PvWKm+7
         u6nHQhE7rPzAHVYQLHYF6i9tlLy1y48jgdmzjguip6Ca5Z/ZaJBOsEhWy83JzK6eYB5s
         Scsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773197059; x=1773801859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JD0VC74mLxBvQCagNobJZ17Es9Rvor/QFxHcKAc4PY=;
        b=JYwI+nnfoDaA6IgbCXFX1FF8+vzcZdo9Os9WJNuIibp+4j3J7pJfthcNsyXAiIdDUn
         UQtrDEEBTt4rN9q1UfQfgWKBVPylkID4ZP+uAJf4v0bvWakDXY6rs6BWY5jNwZG4K8Wd
         VAq09k1YclzURKoXuXYgMXTqFvO+Yc0GtYZGvmkrD7z+39WoL2U7dDNtA3eacJv7uCuj
         IVKe5mnBxXCBhZ0ZuHk/mx/Ed9bAveRxYr+DbMQ8M6YdEnT1nO9DmoOoMx8C8FG/XyNq
         Qv/ASuA8wooT+og/6kap36AGU5EIW68vh1UNTfA82BoIgdhd6Sgkv9/VF2OKimffEcaI
         Unlw==
X-Forwarded-Encrypted: i=1; AJvYcCVBEPKkxB6ujE9s1xmU1kdQOrrF32r5e6frtyFwNZfql7Z/Km+TsS5jLc2uT6EWb0AftyoqescGse+h1thPEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDS+eRePeJVdoQk969a2yX3KKR4spQ/gHzt13TGwmvLKU1Ghfw
	BHtKj46cd81wjtstMnw1862PjEyAFjRtnUYXq2XiiX2W/oz9n70waapgOQ2liNtj4d1iZ7eyA8u
	DtkBBw7Keiys4xvq4SHMoD0v2yG7h30Y=
X-Gm-Gg: ATEYQzzMq2q4qe/jSuLLAG6QAhFSzTEBylriGIWocrFCFTNY0N4zsgMPmwFfxqWOs2H
	iySaJrwqjqhZdnY+vENJJhAGXWhY3U2h/7wBOjVKsAO8GGokpkl47AHV4jTq72z8JKd6xr4FiZP
	8zsPvi0qujDGQMUkU5BOB76cZW/Vd/G6ur272LqyAlIK3C8hU61igap3XslNBVh/ibTi2aOOK+q
	s9pqHxwXADW7YDepNYMUWx3xJEIb0osPKdec5uAsk2fRWko+MQn34+yAbwfzc3T4YKLoP6967Uk
	brP1f30jrw==
X-Received: by 2002:a05:651c:210d:b0:38a:4b80:e534 with SMTP id
 38308e7fff4ca-38a67f5ae8dmr2810751fa.3.1773197058383; Tue, 10 Mar 2026
 19:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310151935.33197-1-muchamadcoirulanwar@gmail.com> <917edd8c-cda0-4d35-8300-47205a975a81@lunn.ch>
In-Reply-To: <917edd8c-cda0-4d35-8300-47205a975a81@lunn.ch>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 11 Mar 2026 09:44:06 +0700
X-Gm-Features: AaiRm53tAPWLpPZROu49-q3oM4oJc3tl3njecgh8WGFnl9_yaaODnFwzAHb91iU
Message-ID: <CAO26r3S_zF4CWt1Ms3rwWqR-Rm4FCu4YRCTKVYbtJdmJEnVwQg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: phy: rust: add experimental Davicom PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, ojeda@kernel.org, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thank you for the response and for reviewing this RFC.

On Tue, Mar 10, 2026 at 10:52 PM Andrew Lunn <andrew@lunn.ch> wrote:
> How good is the QEMU emulation of this PHY? What features does it
> support, compared to the real thing?
>
> Adding support for interrupts to the Rust API seems useful, but does
> the QEMU emulator support it? What emulated board are you using with
> this PHY? Does that board have interrupts wired up? Can you triggering
> interrupts by changing the link state?

I sincerely apologize for the ambiguity in my commit message. There is
actually no specific QEMU emulation for the Davicom PHY. By "verified
via QEMU", I only meant that I booted the compiled `bzImage` in a
generic x86_64 QEMU VM to ensure the module initialization did not
cause any kernel panics or memory issues.

> Does QEMU have the scrambler? What happens if you wrongly configure
> the scrambler.
>
> What does the emulation do if you don't isolate the PHY? Is there an
> errata for this PHY which tells you why it needs isolating?

Because there is no actual hardware emulation, I unfortunately cannot
test these specific hardware behaviors. The logic in this RFC was
strictly a 1:1 blind translation of the existing `davicom.c` to see
where the Rust compiler and current PHY abstractions would stop me.

> I don't want to add code which cannot be tested. Ideally, it should be
> tested on real hardware. We also are pushing back on duplicate C and
> Rust. So if you want to write a Rust PHY driver, i suggest you find
> some hardware which does not have a C driver, and add support for it
> using Rust. Then i would be happy to expand the Rust binding as
> needed.

I completely agree with your policy on untested code and avoiding
C/Rust duplication. My primary goal with this RFC was exactly what you
offered: to highlight the missing bindings (like `config_intr`,
`config_init`, etc.) so the Rust API could be expanded.

I will gladly take your advice, drop this Davicom port, and look for a
new/unsupported PHY chip to write a proper Rust driver for. If you or
the netdev team have any specific upcoming or unsupported PHY chips in
mind that would be a good target for a first Rust driver, please let
me know. I would be more than happy to purchase the hardware and work
on it.

Thanks again for your time and guidance!

Best regards,

Muchamad Coirul Anwar
