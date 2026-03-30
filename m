Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1647C277C9D
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 12:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872654; cv=none; b=RMtRIZaoUFemCpiffwmsws/a1kkBSMWkOzjOvwmtm4yyk+ZGOOE53XO58zl62R/8jDA27XWY2hBhnLYNpG9GP6OXEoCdr4vlD9L7qvhhCv7z6ngzUFA4a4aHEGlwZ0ahF9EUdRUlONeZQzqrg5UFZzkSPa2J0ofW5z1nXdXzaOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872654; c=relaxed/simple;
	bh=uPLmde8JX94NOim8jdD8HXIjLFjFh2qnfPsVO0hzcyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epxU5tHdpMs8ovVHnPdDLiVon92lQRX7USN/GMsFwVIpuVZeMReK0SaRgQrtOZJmW+3Cqn5PawoxDH1OtSThRysIMCimzFlalzKXguFPqryZM2OsuQ/gyxc/Z0WFkVZ9oYa6CjfXXorMJ1SAaEflKrGk37LFjyzgl+NYL4DPgjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d9c7bf9a1so1262173a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 05:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872652; x=1775477452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7JyzGDh2V9hD5ppCKHdE8lqc25UY6zaRA17P+pQPiE=;
        b=k4I1ZPdsZCveZBQynOFSVCqWzlEqnDgYQ5yXdQSgreWG2O5f14pBL/hAoImf2tcGbD
         7BttOMQLFM3W/JTfe6fg/czP7DqAK4y8nM9Yi24KzDxt1Tdxy3nDCHfh+t53GKSYaiaj
         ndjYX5gNQqX53zrexb73gi3JK6j/kdoLjjUm+Y68dWzYOyFwgVFcPCBloEcE2pemI0ff
         yMmUWNWw4S+D0yMUPSfcpcybkj31W4eiW7GGIaFXN4ovB92Eei0LejaOCYW1ZXqABJSR
         Prtfhs8dxJXGfEV1binKvSXy9msf04Qun00G7j9i8uS20qQrbvp7p6SMYkpVXMC0I3Hk
         9+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp49pX4hYjBDZTEhX9cngio/eMs+K/CC3kASXl86fFxqfIkRGVOBOf0Xz8S7d+LV4wbX9pdjEjss5rkDKrZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyElwYPWxEvBxC6SBUOAxojWbMDXnOyfpt1+DWgjxb5wkByahkN
	yuJrfAaKiY1xi8oNN88PukeGj6/+fjtAtuD80XKVR9Mq3CayhcCgcw0/LLp8Jakl
X-Gm-Gg: ATEYQzwuaSbgIFZOPKYGEaaJQMJVkj002kFNMSsgU58v8zNvQn0FYxvPmCGcikkCjqu
	0efm1AkNfmPwJtFZxABGTpKkr2x4Kdjd9o6jRidP9ndFQMvz+YoEiMl0f6AoiX6HeFAiCzb/Hyb
	KWucSa1s04zMMYcTGIZgOx9bBEkz8x0DoOXTbMO/FubxRKag4uku8mWTMQwcW660ITFiy0bPIMW
	3iywABcHdJNPKsqB/sadfJEpjdd+PsrgOEC7MmRnVsu+yWbuU3F/57J1D9d8j6rlJUC4d5Flhfj
	Ny9pauD8JxY0lnU4OM4DKWJn4Syl6cnZGm43g4VjMDGcyIEooFDGDKV/3gAcVinxAeQqV7sCNK3
	hlgTFqWc/ERQBT6jpMAI98rzU8geB3vTULGvbj67m2Dhg96Kz/6LlJWErukI8c5ImKHOvtaG0yX
	t9HtpZbEQXmu8sT4bYmnngT2e0bqribTHTqQsYYpFm4MC7Vuu+YpCjx+EWaagGNiWW2yLaNw==
X-Received: by 2002:a17:90b:380d:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35c2ff08081mr10961239a91.1.1774872652417;
        Mon, 30 Mar 2026 05:10:52 -0700 (PDT)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com. [74.125.82.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dd72sm7312999a91.12.2026.03.30.05.10.52
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:10:52 -0700 (PDT)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12a695044a4so7028763c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 05:10:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhT6+JWK4Y6T1MBUfQsPIgKXfVsh/xAro/mqicVkdPajL5dZEWsSM9w38V8eHnqy90Nv39tSRL0Lwq95Q2sg==@vger.kernel.org
X-Received: by 2002:a05:6122:1824:b0:56a:e46f:2cfa with SMTP id
 71dfb90a1353d-56d4a5f2e5cmr4217124e0c.12.1774872216490; Mon, 30 Mar 2026
 05:03:36 -0700 (PDT)
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
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com> <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
In-Reply-To: <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:03:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
X-Gm-Features: AQROBzBixIQPiuCOL0pIFbgyC_M26WMZwTpKOw623Sg5KUyDyMzQqEZKs9RSoco
Message-ID: <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
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

Hi Arnd,

On Fri, 27 Mar 2026 at 10:02, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Mar 27, 2026, at 08:56, Geert Uytterhoeven wrote:
> >> I noticed a similar issue with m68k-linux, which has a bitfield
> >> alignment different from anything else on gcc, but uses the normal
> >> behavior on clang.
> >
> > Ugh, I wasn't aware of that. Adrian, did you know?
>
> To clarify, this illustrates what I mean here:
>
> echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-
>
> this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
> thought this was related to this 2009 change in both compilers

Oh, now I remember.  AFAIK (holding wood and a rabbit leg) we don't
have any bitfield members spanning multiple base type instances in
the kernel.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
