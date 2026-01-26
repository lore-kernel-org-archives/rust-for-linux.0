Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4143016E2
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433447; cv=pass; b=gtf8sqZGGcgd3JlxaRpBit8agM/jCVzRpj1kvqeMnXUkzi+jzr1uB/Q2zeCilobrcgnTGQnJ14y9btvmV3twQ1RSdkuMvu7QZszaGBaqdDASVHhy8DXGLXoc0DeyuduqC6hLe7LAc4o1GzlQSaujcmgRXoeU/81VixXm8K9IB4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433447; c=relaxed/simple;
	bh=AMG2T3lpd0XBMqlUdukjS6wbao8vQSc84bfPIr3C9NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYuQ8btd4pTQBpEqAwe/NWoYBBgLZY4RwxOZsnbHncwgMRkXUVKBoIxYu8epQimHUXr0B7NqVneoFLJMvhR2YSqWeYwWGeqxyvNog+EL9mvQybi2LyfSXM/zj/z1LXemP09A3pJL56/vcfizu6earZy0fFo/HioOSePkbphU7cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Je1UnZyx; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Je1UnZyx"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ec87b1f525so2239358137.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769433444; cv=none;
        d=google.com; s=arc-20240605;
        b=ENekclFeluhreJ3stGh7idxOBSJFulFMbyD8kB7VlPWzFSr6RA74QL7pErWeWOoFJh
         5I+edGN2WBeeeuOzh+PQx/bpigkEzsBJE0OhPbktBnFl42sbnAltV0MQmyn0qhYXnJW1
         8K/njT1AaQ0tNzdaJSomroJHLEeeIdaRIb8MwJJZVQhi4vU6UnIxH4l+qp6SGhWfTzXl
         gVOePLZqUwMtr43iTiCvRNwQOnlmLDFX6SZFOhh+tw5tBUGtZnjPG+bANA130e/rfZHk
         ykM1P09NYgXiaf4s7mHrAmc5LfdW/cSh4DwpicxccKyVljSY9cKPUCkrJ9cUwJNWHPmk
         9MoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eZlGIw6S6onz53eabj+3K8aJbTWKr20cnaA169fkW1s=;
        fh=jmydvavroK7f6inxA+OjON/6xPzXZoPiRHIpPwEu+ro=;
        b=M7Uxc5XydNu3XhgtFRSEoh7kngcvVX+GNo3ZyA6GxItuJpIvKo16ivFT7raCEIVirY
         4+49U8oAt4RBbdioVTAw7P2/AuqIN4VeU9GX6NB6RHzZJkvJMbo+VL01Iej5Yj9Kn6WW
         S7VAr08sqxtRV3a7lWoyBNEHuI8+QNLfUgOsjndOZU5JwKKCXm87ymZZNrtnl95tntss
         I+k5xZlfbfqIbMh202HUN1s4eUssm8AlB+lnf+V0XYo0SymFc7BnqHuDGxeqel+ODDC3
         6axzWE6p+jLKI5tZ1Mq3prH+DQ+c3k7Fp3ZNp9ncITEYvarml6hOjnHNjuxLsNY1JYxY
         v2NQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769433444; x=1770038244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZlGIw6S6onz53eabj+3K8aJbTWKr20cnaA169fkW1s=;
        b=Je1UnZyx9wAlG8NBu4dY+actTdfZmMfB6Q7t3jZUUqWciVIEBjyeZHlL51RXiAZuAP
         aAbOlpbJxYYBKdGiHfPK1D/M4jFFH3gKFim0xwXXPErgv9L8Sbjoo595X4RlWOPJWm/U
         8PsRD8OlomTRgu3cWyocEwpUhLLorh9rcVOpS7jTGQdbbeGz1Ch4VtMDN+Se7vHWTmKC
         eTtiJsiwsIls1UBxXvFu/4Ee8Iwbc+wwisklgIiUZCpa+NP8lRv8vW2ZD7uqxULJnkwa
         TIDdSbRA2TWkOveu0/8hW2WoTGf+clPRlaQQpZLmQ1niuJLNW3cB6qtiqKDhRKKTbQvF
         VtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769433444; x=1770038244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZlGIw6S6onz53eabj+3K8aJbTWKr20cnaA169fkW1s=;
        b=ObM0p2xrI2ozKBIoU+kU3vhd/ex94/vgn/NkV8rgI8lt4j6TbR75Q3md3oKCdGgdDa
         PIylRyxiVQTTThfW56ytSEA/Cs6VZiFaUBbkxj7W2JUs3SRddkTWZr+p0pTC4FzfLr5y
         Hb1kZkHbdCARIWe/MKFTysCE1NQKRQmRCzOfzTT7S8ieckp7nN/HC66TW4TQ0se/HUCs
         dzj2GsosnBYnRhnjGiXp4XsZw1vnUPQ+aiHQd/2ALwVOK1Xv4vkTKOnplHjvvZHz9/ox
         gHnc5Twm2MRSQ2l8Dbk8Jb7Dl8Tj0L9crgxs7K07AOYEXsLXntKYiY0izBqvmGQxh1gV
         HlAw==
X-Forwarded-Encrypted: i=1; AJvYcCX9MvqUGKIewFSgkeN3lbnrlQGDKXCApQQfi4vPdNpwBVEniN5zLX3C39fSfNctYm3marVOpNBRhXp0xUn3MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWgMsVpVTQ+RZDZNCQzrimH0YTFEFgNnae8FhWU4oA76izSK3d
	HSJMTumzcNvJJKwQ68Dyvv7Wylt2CD/vk3aEAxMp5CwbgUlahTlJX063+RS1vkmN0pOcPOiUTPZ
	QBGMM83XE1MM2SjF8l/mZnjetO1G3cqs=
X-Gm-Gg: AZuq6aJtqgAOzNfle4o1dLsGYEhnle7nAx0LXla7uVxSnN6Ir1Of6Bc+v0ubG7w2Axr
	XTRJzi9u5tjrbMRlPndOb3wTtcZjLXt+Y0fVDjq1Et9hj+2doR404ageRV8N7QXZvpqKde/hBIu
	rWvo3uSNkXgvrwN+Asr20MHc/5syWYZlWK8lm9XAWqk49u8TeHAQ45+XH5Mb/bkc4UxuaXqwGYH
	SWn30h4/Paup8mM9Bb8MggEHCiZ95u05x1wArJHBxkC59Cm8OfPnIvSk4mzI7oxX1siWfkkEYLg
	TYiUGJ97gEhCipv0vT82jF+GWpPgnpTFEeaVVaZHwk2lcjYdlTPb5d531shDzr7BQgZWZsNUI/H
	ulyidC/gcWwqs
X-Received: by 2002:a05:6102:dcf:b0:5e5:6360:1f60 with SMTP id
 ada2fe7eead31-5f576549526mr1385640137.41.1769433444651; Mon, 26 Jan 2026
 05:17:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-rust-tty-printk-driver-v1-0-28604e7e100e@gmail.com>
 <20260126-rust-tty-printk-driver-v1-2-28604e7e100e@gmail.com> <2026012648-pungent-wackiness-0242@gregkh>
In-Reply-To: <2026012648-pungent-wackiness-0242@gregkh>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Mon, 26 Jan 2026 22:17:13 +0900
X-Gm-Features: AZwV_QgGco1Gh0C6m-W_ifT7dOa8mgWEj5DcLGB9SYOm8n4JowYvk9NUDm6I6Dk
Message-ID: <CAGAB6654qTfYBhZSig7JyRyGOQXrJD5US8kpVS1aX75d7e3aTw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] rust: tty: add TTY subsystem abstractions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 1=EC=9B=94 26=EC=9D=BC (=EC=9B=94) PM 9:55, Greg Kroah-Hartma=
n <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Jan 26, 2026 at 12:22:09PM +0000, SeungJong Ha via B4 Relay wrote=
:
> > +/// Major device number for TTY aux devices.
> > +pub const TTYAUX_MAJOR: i32 =3D bindings::TTYAUX_MAJOR as i32;
>
> This does not belong in the rust bindings as something to export, sorry.
> I see you wanting to use it in your example driver, but if you do need
> it elsewhere, just declare and use it there, the rust layer should not
> be the one exporting it.
>

You are right. TTYAUX_MAJOR should be defined locally in the driver.

> You also are exporting lots of other stuff with these bindings that are
> not needed or used.  Are you sure that's the right thing to do?
>
> thanks,
>
> greg k-h

I also agree that I should have restricted exports to only what is
currently used.

Thanks,

SeungJong Ha
