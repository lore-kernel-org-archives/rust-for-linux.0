Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6C833557D
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 17:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780680189; cv=pass; b=B4TAmbRrIQh27Q3Mig3/btim6I9qq1EbbXksQsXk0HL1Ej6CHkFofTvqjMiHsgzZXC6eTdds5l0fWTsKVnplVlvPoKk69TF41OYd81LIXqcO67ILltzqvpNSiQb9MYcZ3XSC3PYBDRif/RwwrwUv9wa+CYFVMZQsQuvvIrg8wmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780680189; c=relaxed/simple;
	bh=i7KgJLF9GZ/FwqQM8eGgUNDLnwbwVyWRy6mn5814iEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXFQMAX9vd0rHSSB7nIyi7Do5lDtp90Y/QJ1ofEMXVZEY6o5wbnEEHutqwdOH8uvoqM2Ji7VHjiU7tn7powcPlC+YICS1kOGyUKiihaNtt7N1Kh5J31lp8POv64wvbmSZVL53N/IAJQ7Nds7vaa8QJHkYITHaWYpEwEEu8g4IE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDrf5ME+; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDrf5ME+"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304eb0fc233so192033eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 10:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780680187; cv=none;
        d=google.com; s=arc-20240605;
        b=bBlCWShXzsaDdZslBqf6d3zIUY8z+3wnBMY6zyADvGQlWY6F1p4o2UPj4Zo60JzF/2
         sO2vUQr826Akxs11bT4boy/MmPJnQHJgBxhx9qqJFqQMiLdMQ/diqm5cQAScoS1QqSo9
         VKrwXYnl3P1tUVI7Ru9g1riYQ/hus/vhd2JwLQRq6gmY78C6DJb9iAQPK9vQNehohH+A
         FgiZbwf6ruoN+jBRfJWiT4sbvIVGkBEuzzusoEH9BreU8AlVrZIVOyBhDcKbjHlt+W0Y
         NWHvYTnhR0vHHWGYYzPBKLkNzcb0gi/lY1l2dzuyOBafSCKig4+LCQC+eAhuk2uODZPi
         s+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uSx8CCu2zO3nvn/ay1oOlG5l2f1ymr7/7z56E0ctASc=;
        fh=1faVt6uzOoJiwW2e62DMe9jDn8N6lGfCv4k2mAKCpdk=;
        b=eW51YRQHQNsG5yLLi9fzma0uNj1OCbM+NppP1pVRg5oHBP5dpNcMlsZcqLyXFU/+eu
         stIPeomBNq6zorP99e/sLwqsDVzqxE+W6BPmYe8K7lxr+gE6tprx3pz4pqlNqb9dZ2lP
         xUtwSbkSZLKOJLgp98l6mROvNpEJLfNa/imQXNHagw+Pz9jUmmCpjneg/e1DNP9RUAWi
         +MgOjF3qR7uCpsfID9l99SPVvNrK7SM481AnGktVW1uqUZP5KZ/GhGXOfOmiK1E5d9PU
         lZljbZWAtZrvRY8Os5kenRnJfGHzuujtKceHia1yo6gJf/+VILpAxaEBmQpvrXTejOJH
         QszQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780680187; x=1781284987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSx8CCu2zO3nvn/ay1oOlG5l2f1ymr7/7z56E0ctASc=;
        b=oDrf5ME+Uw9oOKiSlgKV+3uY7yFSRFQO4epLArS8lYZ701xu2n3dBKlXBhDKc2s9/I
         FPqXbEOzhAUx+VZYCDVwpucOUkSgj3tU9LUR57fpi8jPkIHPsqKrAWQO9RjwIEBZ7g74
         IHIqiAXm2iFnyV/B0gWHVdXw03KpAnnf+gchylsUPeCA8Yriqns4i0QxzONwHtfyjV4U
         Ck5w3+SXVHKlYbTepz4ZDA7FZni+HRC6Hr3jLn7xhjH0YKmF/jHx4md2ahGc2VmepvLK
         5shQyOngqVA4MFGB60bZNZqU4X/+J9iUfxWtcxEPP+raEUTsIzZ74Ne7iZ8tebQyiU2s
         TBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780680187; x=1781284987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uSx8CCu2zO3nvn/ay1oOlG5l2f1ymr7/7z56E0ctASc=;
        b=UlPGiR4Id1io5YA5Xk8tMw/T63XMQd0sG4RgrJ7vHU+Uo452Wno0KoMMCmvSWQ7m/s
         cgFqct62ZG+qoeQ1m5qM+f6BMrNmgyOSOFoqS6+vWwdzlHLGne4fUDYmnVsjhFa+au6V
         OC3GqaL42+twtsrcS++VEzKtf8+gEFT+pFRxKwbT/rmuQjBoxg7HrwG1UNE71hKZ12Ck
         ScYFdovZOEGesQHNEn67MOjl1Q3RgMD8+BpA+BAf6xuQMQbugvzTerTpa0Blb8C2rEL6
         eYJrEhgG5ZFKi3mQgUFUTva4hDRlPMvI3omzLyipHcYzgTa/NbJAZDZTSvX/xnY2wGNZ
         ceow==
X-Forwarded-Encrypted: i=1; AFNElJ/VAQ7o49zObIAAE37LN6mciUl/CypYe88tGDpMmu68iJ+ivwNo9eowk2RFsGw94dAXY4tc2aBApfjebmdRNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1X5oKHtK7S/Ou3EJfwyFdvoGv/7aM8+gQ/Diz6nK+EwoiDSUm
	qSm5tqAvcbAWh0kSgO45sw71ywWrDWtNo5NgAlNfwCPDXynp1joSdDJKMczFythSp8mHNSn+8Am
	y3YHs3/AGQW0hZUZl9dPA+KOiz4aTOBs=
X-Gm-Gg: Acq92OEjwGKDRwxxaGN2jJ2P3Ezg1IfSHfcIhEIA+QaDa4UjKkp1OVBvDLgo6+crQ3o
	2K8aXdrHBBS8POUY8tnWuGCF8kAbfkbnD1WJuAYlGHMkfcB2ZA87UsP1sXKn1KtXg4Be7Fp5SSz
	QJnQkL3RtNoW7HRN6d4cqYMv/CjDaxfFPxJgt33np4QSRsOTYTAKq5e53U4+XzPKYWJJg3d+kvZ
	I6LfOBFFxfqcljgPouiXuo4SyEZaH9sde7zSxv/1gHj6IYVFFCiGBdRlmzRvD8VE8R4GhbMCEmn
	3jq+XDNpVM/Srjtj/yDTG4S3Nef/ciPQ/w5UZ/yVC3ghZfL9l8YrESxCaZKPMh4QP/PfrrYynDT
	VZIn2Ljf91+zj7V0Xhhy3Qps9XJUxCzmruQ==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr1071744eec.2.1780680187196; Fri, 05 Jun 2026
 10:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-rust-reverse-randstruct-dep-v2-1-93d38023b6f9@kernel.org>
In-Reply-To: <20260605-rust-reverse-randstruct-dep-v2-1-93d38023b6f9@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 19:22:54 +0200
X-Gm-Features: AVVi8CeXM8Ynb9CW_RjnoK-g1D5_BN8EaZTX5irzVwTw1c48nPyBVyCslPxXk1Q
Message-ID: <CANiq72mmzfBg0_y+TMTsUUuO0cJFE0=n60-ttwOynai06_y=zg@mail.gmail.com>
Subject: Re: [PATCH v2] hardening: Default randstruct off with rust for better
 allmodconfig support
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 6:51=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Currently randstruct does not support rust so we have Kconfig dependencie=
s
> which prevent rust being enabled when randstruct is. Unfortunately this
> prevents rust being enabled in allmodconfig, our standard coverage build.
> randstruct gets turned on by default, then the dependency on !RANDSTRUCT
> causes rust to get disabled.
>
> Work around this by disabling randstruct by default if we have a usable
> rust toolchain and rust support for the architecture, circular
> dependencies prevent us directly depending on !RUST. This means we might
> end up with a configuration that disables both rust and randstruct but
> hopefully it's more likely go give the expected result.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thanks Mark!

Kees, Gustavo: applying this would help Mark's testing of Rust in
linux-next, which is important to keep.

An alternative would be to move forward with `RANDSTRUCT` support:

  https://lore.kernel.org/rust-for-linux/20260323130224.165738-1-ojeda@kern=
el.org/

Either the conditional (on the Rust side) or the unconditional
approaches (modifying the C side) should be fine, i.e. whatever
Kees/Gustavo think is best. The unconditional one would make things
easier on the Rust side, but it is a "bigger" change in terms of
impact. We can always start with the conditional one instead.

Cheers,
Miguel
