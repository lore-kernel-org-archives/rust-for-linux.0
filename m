Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF95E2D6E58
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598577; cv=none; b=JbAEew4I8TcuLu8fiwkgo6SBfqw5h+NQWMutznmGUGaH4bwAvEZmqI0FYIOkSnUyjs7ygPAMJ3KmQZFLQov4ObHtOblo3EubwwtTm1Q/VrZ8SID02aXIF9EZlXh3w5quYyXuud6jcqHQ0AX1u9roe/SGausS5HfBmlsxNMFIzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598577; c=relaxed/simple;
	bh=u5VEHiJyZVoFEpzPp8IWhx3oSssO/QYrmWzaVG0pNx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8O/v7cs+3PhcMUQ+52diQEqvcLIrZLecpwShd4q8BU45olWt1gu6b5uNrukxuskWBYoikwM5xBojCGn8K1YVVWbRJlQuP913nWLQy18FCMEXp3IZQAm78wA6b94byU25CJuUywVU/bQVWLP+KmJrj1BeCYv/c5vLJJUmtmfZqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-67df51b26ddso1214611eaf.2
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 01:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598573; x=1775203373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJSO1Jy8gXJ3q0SyUcqZkfXUbxuRHoGqVtwy0Y1kZfY=;
        b=qI9x/E8ZA96pikhJ1KioDzdhHw0atGVTwof12Wg3pfqJN/XLQzhv1/+Fj9fixS0UbH
         /b6WJf4Leipdoz/DmFfSakJ6xLnq85Owk2nMqXs6JkhSq9iTEkQmT1FfcJmN/4rh3Z5I
         Tytv/vAXd+Fzk2S7xbtNVJvXiPA6VLhkpgnuv7vKzN9KK3B48nMagckxB++wB+2xuxVs
         iJA1+LbgsO0uUGSRFj2kTRvmCLJ4zrwHBwZ4Eheb+0ZDT2Judya0ZpQwnZpqUp18j+F+
         eEmyIyf2QBzBM42JOcgd5n8WsdsN94sXcSw8aQFoZ14BYo7DF6MzQoXlsyNkwAs+3VNN
         RCcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIh4EDRX2VcWsXSzShyWxGmC0bsn3mlKO74SSKt9mwo+yQnekgOl/8PvgDwUl+tVFyeIb+vi/Gjguwn76XjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc9GO960wmqMweTrxfPk+zKKO+0Fzme9sxdRcFra+D/EAcwO3i
	xNgzVrPS9/NFCtMS4JYvX9zJyGFKKUcF2FIh+L/Gh96YfyTDWDjj7KBd6V01Nrdrz/c=
X-Gm-Gg: ATEYQzzBFptNS5H98fFA1TMfEJUPaossZfTCm7bGxr25V/y2rsmuyT4DaoxOmosIJyf
	/cqaWTe+BbbA7x4hnsowhwsbEVcTH2fg2XZ6Abv9aYQKDZfnre6C30EnjbeCFINPAzktYad3uuT
	RCEnBxFZZozSolkG5G2N1KFvfGkYYJtuHnxloDl+wtfrgF/iwWi+SjKEUbE/977P/r4I0YPI0Lo
	YstehVJm1Lc+tn3rtDNGIbPAkz6UHPLgft5rxMCwEHTg3iStFRWA64Ac2HvD8iPLEmPCtqrwvlZ
	Qy2Fyd0AB/koRDiVWnJ//6jdH0TG2VCoAgYSrp38mk5ceo62mPsY+EIE5iS9ozAY8CWZHloIb66
	UJilqB5G4vpTVQPw42z5bL+2fRPvdI9x1Hmad+8/xNmq5ErQP0Rv1jIOscRc2Fqtzb/bZNLUZ5p
	snHhmAbhjMr3YHg+K0E46fAug5GVFtaa6MCtGWfqXxKiepYjr1qih2/D0uKaaF
X-Received: by 2002:a05:6820:1625:b0:67e:16b4:aa16 with SMTP id 006d021491bc7-67e1876fa01mr763195eaf.66.1774598572864;
        Fri, 27 Mar 2026 01:02:52 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e0aa31c81sm3413956eaf.8.2026.03.27.01.02.52
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:02:52 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d4c383f2fcso1711936a34.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 01:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEFnpc3bwU1um2xc5xD7lqYZ58pGE4X6HFnACpMZIQnzZ6B7DeMbMLo7cKYB+Hf6pmdH1G/T4xWozFUFZbLQ==@vger.kernel.org
X-Received: by 2002:a05:6123:132:b0:56b:5e7e:d3fb with SMTP id
 71dfb90a1353d-56d4a619a98mr460290e0c.12.1774598183104; Fri, 27 Mar 2026
 00:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
In-Reply-To: <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 08:56:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
X-Gm-Features: AQROBzCIA8XVkhuOJBqaPSt4vzM_veS-eZVPLLLcWDFZykO6P_Bu4uSiQhzQA0w
Message-ID: <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
	Gary Guo <gary@garyguo.net>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Thu, 26 Mar 2026 at 22:34, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Mar 26, 2026, at 16:18, Russell King (Oracle) wrote:
> > On Thu, Mar 26, 2026 at 03:31:26PM +0100, Christian Schrefl wrote:
> >> On 3/26/26 2:47 PM, Miguel Ojeda wrote:
> >> > On Thu, Mar 26, 2026 at 11:10=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> >
> > I'm not sure if this is still true, but I believe it used to be the cas=
e
> > that the -linux-gnueabi target has one behaviour for enums (fixed size)
> > whereas -none-eabi, the size of the type depends on the range of values
> > included in the enum.
>
> I checked Debian's arm-none-eabi-gcc, which indeed still has this behavio=
r:
>
> $ echo 'enum { A, B } x =3D sizeof(x);' | arm-none-eabi-gcc -xc - -O2 -o-=
 -S | grep -A1 x:
> x:
>         .byte   1
>
> and I see the same thing for the hexagon target in clang, but none
> of the other targets that Linux runs on. In particular, clang always
> behaves like linux-gnueabi even when targeting plain eabi.
>
> $ echo 'enum { A, B } x =3D sizeof(x);' | clang --target=3Darm-none-eabi =
-xc - -O2 -o- -S | grep -A1 x:
> x:
>         .long   4
>
> I noticed a similar issue with m68k-linux, which has a bitfield
> alignment different from anything else on gcc, but uses the normal
> behavior on clang.

Ugh, I wasn't aware of that. Adrian, did you know?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
