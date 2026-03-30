Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814F53C9EDF
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873044; cv=none; b=fGISH+IjT0zJE/xw9ySDjG0iG1VNApw6zSaIGHWn4TywrSC2MLsSUgmedz54Q0rx3ueNQz/xOrolH2XpcjT9zBKChcGMcbimDb/+mr4f46K2pJDSPuF6bEKzz6+1Tl/LrIsZ4Lhpo2kak/6/CTOdcn5uz0pOKSVsZJFAZWUJyXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873044; c=relaxed/simple;
	bh=mA3ZR1DLbQrQkL9PKCipYpYPc8aTCrcmFCztxVCijFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFP9RXkGVKLpywNDKg+tbPE6MLRVR1nStW93E0yHa+NCaWAeS4T/vOamLbX9HPzexgKH8NxC27LS6p1klJZTpanhISJ8E5DTpM/M2vTbqZ42ZcyMo/0S7HmbtKxrtOPrzDK2RftUwrp5C9OhBRQa3J33vGNh9uDHkKhcValjoOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6054aa7f6cdso60997137.0
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 05:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873040; x=1775477840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woUempTeRL+MJtlKxpfNaT94H+rNPuTZjIMDTveSMCs=;
        b=I+QzVWuyRJWbFMymD71L764DhfAhq9hlDdtcvB00I2yUqZzvnbGCwOcI3lsXqCjzXm
         Et9GtLw/7JhszWr+WBO5bov1WIaT+es9cobyOb4rjebVc36GTesCP1Zk6dEKE36goizS
         KcQDpo5K5xljJzW2oScz9iD0JNn6PEvp/0tY+OYKb/yAwdGzEePsiexzRp3dTBdxjCKU
         uZMpZ4++3awLzKiz6Lu7MipUUPMWtnYrqct1hl/1rOjA9tia7KvlUiCbs8nnTaMpDeYW
         zHM9eQsgaLz6Cu2xfl4foGaYFoi2sXuthjGx9ua7f3OFW1XawniHanpxZOj5Au2U4g1l
         7ktQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0R6b8uH0lqT4t3gNOmFhXdrrG4IZs2nATnUrWltMyr0lf3hmnzC9ub9zdI320Y+MkKj5d1kWGHXyt2Rip4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGXeBdbl+fOSTkpCpPoHEcS/Nd0kQJb2tFLYzb/fEEzhX4FBUr
	zZZqtQwmgLH1BbAj443ne9tEm2Xb87PsA9O4c8e4pC3uF+ljkRhQIwI4ti2RsfbJ
X-Gm-Gg: ATEYQzxXQ+5VzTV5qQN7KD78y7B6YUsEO9EMOE81O4ARskt7t9s4ZpvD1ajWpklK8sP
	Etdajo3F8bguMZfCohyHqCZ+IjVpUWPTEKLbQy3Gny7UBQWhukWDc5MA/gxeeHS8d1heAbUM8Ez
	COdvVDeD1wssrFTYBBYCtQ9/FOhsdMk0scMYh0zmoJ+rfMoUdP/BlChH71uRVcTcAcswduAUq49
	URNsf5lnP1thtqgGHohNCtnJ+06CXN5N2HBIf6BHIDB3UrmsZXJqyoVzPVof3OdLrE9sLIpyQpX
	tHECiZVwkvpkj2KnVF95Mr6Z19BzHQUxcVl0Jz9HM5Xq0WrsYDag2iYnIYXKCrDDbYzfaKz538m
	YrbeyW3AHVt+RmupdDt+Mr5/gBw2NdRlzSWVNjRUaJM98yHv7beyFxv4XAZ8oxtEMI4BBiMp5FA
	EVCxRiomAyezeEHfydLYQIvl8LgtLBVRbUsA5OdLBAx4ftjPlnYcvBhJZPCAc/gwmv9kR9Hq0=
X-Received: by 2002:a05:6102:5087:b0:600:3b3e:681a with SMTP id ada2fe7eead31-604e4d73978mr4980142137.14.1774873039976;
        Mon, 30 Mar 2026 05:17:19 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e2a0891sm6650065241.4.2026.03.30.05.17.17
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:17:18 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-953acf7ae20so1036978241.0
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 05:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUToP/5Vf4rAxm18m1ZH7ShsRtBdk89m8T0/CZzx/JK+w3i0xit2FKz/4/4jXNPghPd85xH2rOgirNdSf2AWQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4498:b0:602:896a:84ba with SMTP id
 ada2fe7eead31-604e4df3704mr5271926137.17.1774873037674; Mon, 30 Mar 2026
 05:17:17 -0700 (PDT)
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
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com> <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
 <26d690ab-d68f-401f-ae2d-7aa4de081bce@app.fastmail.com>
In-Reply-To: <26d690ab-d68f-401f-ae2d-7aa4de081bce@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:17:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDy9mNuzDaYfE6r+P8MSTBEGsyRzisLF_d_FWX+6qCVQ@mail.gmail.com>
X-Gm-Features: AQROBzD1En3iKQ5LsAPqOXpbj6O32MjUPo3QPwr0lgIQkMqaR2Lx1_ZSwol-K3A
Message-ID: <CAMuHMdWDy9mNuzDaYfE6r+P8MSTBEGsyRzisLF_d_FWX+6qCVQ@mail.gmail.com>
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

On Mon, 30 Mar 2026 at 14:14, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Mar 30, 2026, at 14:03, Geert Uytterhoeven wrote:
> > On Fri, 27 Mar 2026 at 10:02, Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-
> >>
> >> this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
> >> thought this was related to this 2009 change in both compilers
> >
> > Oh, now I remember.  AFAIK (holding wood and a rabbit leg) we don't
> > have any bitfield members spanning multiple base type instances in
> > the kernel.
>
> There are certainly very few of those, but two example I found in
> UAPI are
>
> struct dvd_layer {
>         __u8 book_version       : 4;
>         __u8 book_type          : 4;
>
>         __u8 min_rate           : 4;
>         __u8 disc_size          : 4;
>
>         __u8 layer_type         : 4;
>         __u8 track_path         : 1;
>         __u8 nlayers            : 2;
>
>         __u8 track_density      : 4; // crosses u8 boundary
>         __u8 linear_density     : 4;
>         __u8 bca                : 1;
>         __u32 start_sector;
>         __u32 end_sector;
>         __u32 end_sector_l0;
> };
>
> struct usb_raw_ep_caps {
>         __u32   type_control    : 1;
>         __u32   type_iso        : 1;
>         __u32   type_bulk       : 1;
>         __u32   type_int        : 1;
>         __u32   dir_in          : 1;
>         __u32   dir_out         : 1;
>        // 2 bit padding on m68k, 26 bits elsewhere
> };

So we just need to make padding explicit? Sounds familiar ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
