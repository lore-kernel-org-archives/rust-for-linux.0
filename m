Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF8421ADB7
	for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779021343; cv=pass; b=A0BPOdvNsjpxiNs1tXhtjwt5Colbu+FceOnuy/nv1eD/lhAjiGG5DW3XDN1K7BoF0dY7dA0adTF1kyLvj6MVDADDWtYSrzTOqUBfX3KE53gvhTwqSbjBBK0PtSM3dAkm7BAl+iPoRxo0Myqfm8M3M2ZQEV9No181n0fbR2tA+78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779021343; c=relaxed/simple;
	bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZg48y1pK4sGRNdJQqb1NFHoWZjP/auZFRJLkqpDcBvmFoY6QtrLaMvuXE/n9p+GzBh33/r7Sgc0b6mHDC10Y+c1QaUp5HdGQbTUngw6+pRxgZRiRSDaTyCIgozgRU2Rl9hpvQdgmGGjt/0C87biIwvgDsUdKGiei4P7RXzFve8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjKGcA1d; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjKGcA1d"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f24905306dso70011eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 05:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779021341; cv=none;
        d=google.com; s=arc-20240605;
        b=O1m9KIWBG9TL8gmnPplBviJHIM/PzgOlX53UeZHa+xi0QlrWBlgkcETCBOqYGYL/J/
         aBNZbj4NM4PmJG8xDwYbMpPONh3BuDSryJZ+syVIJuVBYeNi05hOyB5Za3Kl2kZH4Jw5
         fV2VAYh3fp/0UnKX4abrSESA1CapHdI/M/RMbl+soDB+q67ViHKdynKx5SgNJrFBgoAo
         HDvREEhz8aUk3VkhHfBuNCJWyoi6h/5sNr9j5dJ9uB7zruN8SjOiQESoOU7aWokkG+iz
         +YPmuooTr3qdC9O8uipgaFIdA7qb+B1uTO/Ksm6Ha7YtCd5h9pXqYf0jt1yFtpLVl1Eg
         Oocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
        fh=yUAYcLFRPuwzhykoCThFP59BtaxQTLykBw5dWmkfdYg=;
        b=lMSQ4WopflvDsW4RwDH/FN5uENuOwcAqNr/0DyWvY8fGw6Pf2H3sAH0tOqZn+QGU0d
         +qfsTCnZOPzXU1y3QW9ej1fEWfiruTZli8UfqOxxOEFuhgQXqtK0k0vlITDnT9j/uGay
         ZNaIeO8TzpY/ESjdnafvvZ5R61AfuSpSdvIqvAWSI/BVYZGk+uUD3zk3ufBZ5d84B2u+
         wJiesc6/5z4O8C9n3EOG4G3s+UQ2XRz36zhcsM4ItkV+b60rRCqs+ilRfdsDZrDhGuaH
         6D0foZuk4emszwXxbpXM50kyckM9xnP67MScxVBRGsUB+QGjEFXn28Jx8iEuYBXhV/CZ
         nPQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779021341; x=1779626141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
        b=ZjKGcA1dSL5wVUTKvrIzCjFDf2h01d2J7ChDnaeITFYcJLDQWYhmRoPXDxVS4eR68N
         f4CI+3SI5f0LpgkG2iZFGfM6dz2MxyktVDFrl1HxTLnDBl08IF+uGDe6S7o6Iugy8Tbh
         +WhaWOrnyP9BooFnYjLOERAgA9ttFatntyMRqi/fXiK+38pc1zNokRivepbOlXFmlV7x
         bJ/d5vFnJLN9WYEiNWEoaRM1Ll9YeC1I4/e61YFOVW9FxzLI4KD0xAfaap4ZFxzvgOCL
         Pe5iLiocZSuJ7q1qYLGZLWBiHZVAC8XL+7Q+eNaCMy3A7ZKkG18Od4uwxjH/+AqjlDAu
         4sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779021341; x=1779626141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
        b=jcbJeCfhRIG8so8iomZojf/0AlHGSOqnDVdpnLtkgZ3PpIEiKuhJWbS4yFQJOrWcYJ
         +LYI7APN1YAuthascpTaYSAQj9M38JMf7pHvh26VHF+V/OTftXYGpE6/fk5JUrn33ApX
         Fg+iRFIbvrV9q5mlVXPEHySEym2nsVnLzR22HANQYYGE/Sy+r1iQi5fNEuXAtxBCE8NQ
         C8wsNqiRIe4oj8ikd3dWOxIaMnlvL6TU8tBI4eNWw3fQOg3sb++5FOF1FqJJBZeR83Hj
         no1ewMuccYZ3bsd9dWNnsEbL/TLHqF/w6j7+QJVLzt1N6d7/i/YcZWvfzSr6LiJVv2+u
         fXBw==
X-Forwarded-Encrypted: i=1; AFNElJ/EscOq6ay4XXV7fzQZlYoGvP9HRwRPum5dahPIIjGDhmraubLWYlguT8s2qNGGG89G6F6WHUTSoueKsznaWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjycTW68KMk/+w64PuXQDS8J/bJLBhR1fSsSVReffbSn83rqGE
	0Q/TMjN9wDXn7r+9A06pCMPgeOBsvkhuQbaa69aiDz9OQcCH8NQp0IhMsvfFBQylTz+YATuA9bJ
	pdnv+euZU9IZLUb/9YoF5146lKWxobCM=
X-Gm-Gg: Acq92OE2AaMztVoGhmwmWA9yPmXdcGhwR+UCNI9DQhsN3xAJQAQgjeGsdu0HI9TRiCp
	MHWdWePo2Y3s1DjZZvGPaoZEG9asv481OtHlsOui8mzHEab6xTps4PU0wRGIGdYrGBHnYhvmxoO
	KZBgF+CmxNu+HrNOYJVkSE9IR5SBZCO7eYfYbso3+GtOsB9cdTbX/z1WHiecV2vmVuSKPP2KAy7
	xEdBSDOpxBqeUvjfvvtwk7EJB14QlBURTwCdSgqfzcv6xPm54xWD9V0VQW9QaGfkqEtmKXD9MQK
	88rZbX8W3IJnPhh6On3OjoB9utKMBSo+qmJ32AqpecV1IhK6Zs/6hdqBAJpRqCko0n6pG+dxWN/
	XPdR8c+xElAKdtPLNZxpnxFI=
X-Received: by 2002:a05:7300:e6c4:b0:2d9:2896:2794 with SMTP id
 5a478bee46e88-30398737cbemr2263699eec.7.1779021341133; Sun, 17 May 2026
 05:35:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-3-julianbraha@gmail.com> <CANiq72=dKOhoLUoWRmzG9Kyv0jWY97Nx_O4rWV-UHjRtULz-jg@mail.gmail.com>
 <20260517094041.GC3773662@ax162>
In-Reply-To: <20260517094041.GC3773662@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 14:35:27 +0200
X-Gm-Features: AVHnY4IZSFNRtOREQTvbcPWlzfBHcED3UQFBqTP6EdleEX439u6RoJ3RvvnKjFg
Message-ID: <CANiq72n3Lz4QeNnEOWfEwXHc1+UdnsbsD-9wvR2OnhLsYBsnqw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] Documentation: add kconfirm
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, nsc@kernel.org, jani.nikula@linux.intel.com, 
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
	corbet@lwn.net, qingfang.deng@linux.dev, yann.prono@telecomnancy.net, 
	demiobenour@gmail.com, ej@inai.de, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 11:40=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I guess this is kind of a weird/unique situation. I agree that the files
> generated by 'cargo run' should absolutely be contained within the build
> folder; at that point, $(srctree) could be read only and I would
> consider it rude not to respect the user's choice of build directory.
> For 'cargo vendor' however, I am not sure. They are source files and I
> would expect that running 'cargo vendor' would be more considered part
> of preparing the source tree, rather than the build one (so it should
> not be read only).

That would simplify things, yeah. We could always start there and see
if someone needs it.

> At the same time, it might be safer for dependency updates and internal
> consistency that they are confined to the build folder. I guess we would
> only want to remove them with a 'distclean', rather than 'mrproper' or
> 'clean', in that case, to avoid requiring users to constantly run
> 'cargo vendor'. It might be more ergonomic for this to be a Kbuild
> target ('kconfirmvendor'?) so that this could be handled automatically
> based on the user's build command.

Yeah, it is a bit painful to not have the usual Kbuild
variables/infrastructure around... On the other hand, it is a nice
property to know that nothing called via `make` will ever connect (or
need to connect) to the Internet.

Hmm... Perhaps a good middle ground would be having something in the
name that makes it obvious it will connect, e.g. `fetch` like Git? Or,
if people feel strongly about the property mentioned, then something
like an environment variable that needs to be set to allow it (with a
message printed about it if it is not set).

If this were allowed, i.e. if we are OK having things in `make` that
fetch stuff and put it in the build folder (only in certain targets,
of course), then we could actually think about doing more things that
we didn't so far, such as other setup-like targets, e.g. preparing
kernel.org toolchains, setting up a Rust toolchain via `rustup`
(including `bindgen` etc.), and so on and so forth.

> Additionally, can we detect explicitly when dependencies are not
> properly vendored and error with a more helpful error message? The build
> command in patch 1 just throws up its hands when the build fails and
> asks if the dependencies have been set up but if we provided our own
> vendoring build target, we could add some canary that says we vendored
> successfully and if that is not present, error before even running the
> build and say "hey, you need to explicitly run this target before you
> build".

+1, good error messages help a lot. Something like `rustavailable`
that prints which particular thing is missing is great (that one even
tries to warn about some problematic versions testing for bugs --
hopefully we don't need `autoconf`... :).

Cheers,
Miguel
