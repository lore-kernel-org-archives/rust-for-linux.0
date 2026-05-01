Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C68D256C70
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777645649; cv=pass; b=M6hxffAYiJXGag+XLduS6u3Eg0HC3eZAsrfVzUqhrxkVb97872ue5zYWv/yvi2DtOOTIQQdNOhZmsGjK2tMRGhozQW05FPK6UGMU9sIOAJFGDYzkv2mKvAIooiWTMusVU66i8KnphgWG4KP0zhbInp0s1id5QIZQRZNWqSBdJUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777645649; c=relaxed/simple;
	bh=L2db4Phi0o3NzbTP3mOGtWQNqzQsZLtttZSwjPFuHB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORJU/9a56EYayHZannMEFr5BLp2sB74jzwgWPp//4HaHtCB0v08APm+qW5gHChyTeLRwnDbq8kqvfMnbmqygVet8aGlCSB4slRXzaAXdwUfOyuzHL39+XzmkqFEmLRlj2vyInmrWPXLcya7J9oGfbX4cFVkkv9fvy8r+C9cW98c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=io0NF5dE; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="io0NF5dE"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6948ed7139eso1066187eaf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 01 May 2026 07:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777645647; cv=none;
        d=google.com; s=arc-20240605;
        b=P5i874t90ZvuO3MpURjsApHq4ijTvYKzNuqI/kVLQapAirR7IKe5iB5bALub0O1iWi
         lYoFZZXGkJzUh8kXspG4g4CnG9EiiSMx5KVhacUZpYVC1Twnl/obtDPLvhSopHTvvTKO
         Ua7ptqplOQVn4PhpBj6KGk4NF/4f7OGMT+sLjUnL1084ixuuBiczRuLI+EjXWbXWsHgg
         5ZzQKY5t817jGOfY1WQZHjJCqYPOK0/uDk/+yTMLNkorfu6VFTVanp0cOGr9oHC1GO/I
         bXuWfHFbPfMHhP3liOTJYVUz82Qsh5/kFQyphRtud/OlZe5CPS75gUfnxQAQ8Kf88mvD
         J3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J7uOkY88OVzSbN6UWWrRroyOLkitkLZVBTYiL3CZeYM=;
        fh=Lz1f0qaHrtCmj9Ex/gFiaHo0kipTw3YOVIJy9ULKCVU=;
        b=TGvg6AawWD6mBXK/6fOeLRGvBVr2+GtW+1bowVsm0n37zLSvHvgEo+hk0pOvaAkMcA
         nW3YF3HuHSuhh4Dju3nhdbE855BJ+e+0I9DnZ9ada6rb06VQtzKWS6WrAYY/RreK9AZz
         hrqWtIZEqQg2T6B/Ndg/60FZw/5juwL/APR0mhw34Mm6sUextiSp7I52uClFrPrV8MAq
         Ytqa0j+vOYfEOxgrnv5E43S9ZolyI2kxEQCCSmA0/b5F9+u7AGy/WFsR1E5bonNVk67P
         ef3EDqEHExIK233n6AHTcUL/eGHfYYkGMkfF4LtVjPZ76WBFneOuGCTyUcHkYNjf2KFO
         zGZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777645647; x=1778250447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7uOkY88OVzSbN6UWWrRroyOLkitkLZVBTYiL3CZeYM=;
        b=io0NF5dEOck2IpBs6RcuE5CL3LzsO8FJzvrdIo7yA4snEAkzZJ3ZbkUL21ydZW6HGU
         MTo5EPjZzD3wp02SpT+l/zVP7feus49uKVTQwN/qs+VzYKJxBb4NZVCV7BUr/UquGWtF
         8xsPSO5n9K+76PcmuvPZNMDaivYWcvqMMPIRoFm3Fgw8uMyGpLbkSxDB+rA21qH8S74M
         z2l9RT/WHX2IjreoKteRbICI+3BAcHtyQYvPJdSgnQambJzC0b/YNSfx+P2hHYx4kS3N
         ymd8X2zNg0VL0zWyG2wlFbbcPvTQx+PJboKcxn2miq4JpkkwwFxP9v6ejMV/COGfTARC
         VfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777645647; x=1778250447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J7uOkY88OVzSbN6UWWrRroyOLkitkLZVBTYiL3CZeYM=;
        b=kWbW1QxeqoZTkCxGeanago+5E4asJ7UIpNtHCyTrwQ0tKtzKP3hj7nJdXApGHwcHZB
         ptw1BNAja4dwcAq4MyNsgKAY2IQTjSyI0HpPI6x51cFt1bv6ve553BBhQ98GOoH8Toss
         Q3IDfsFMJnF895Y9x5FjD9EGstKTuon1eIcu3T+UGM0Lb3Q7u3cAjmdTDBhz/rnGiKQ7
         LGkco6/2SzFX7akFG4ZiIizF7ft+aSWz5tlS0tKHW6sMNEw6ZWabfR+bfD7IJffa4TXH
         OURY33du/9Tsko9fphNi/KGP1biE3M+rGWZHVnf7qT4tfZKE6n/EfZIIksCljeX1nFUR
         ovyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+K9nYxm85nPToet5hLyDRQBtMKXbKKWBFHMO30IretNws1vjyNEvE5GpdRp9zc3i6MPZsX73c8IYGFFfP2YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaVMnC3Yx6usm3YoEyuZaxzEKbYiqiqh8p/zZUxrJEFjhA73nz
	JHEFCZXUuJPygiNpTethalP4Vnuxi1UmazYqIXk6uXUz9Folv5uE+SMH0Uc4KCf5oTVffkXinEe
	w29yC/ISXZNrWkX/DY42TNExXCI/jdzI=
X-Gm-Gg: AeBDietti1u0lNfA6paahTl+ki3mOKFPJ88zbypOfTi7FoXzaxEM0ZCFHB79UGA/aJV
	HaIHWHta8sGUTPzSgYCvCjyBQHTwuvzTqnpXxy94KPAQhwAZbq8M1xmpYipgW1gulPNska9EGB6
	ECNSR6Htk0rp8jfOpKr/d0QGcCujHQ0YgsFv/5auyqo8siPSah0gbuhypjbIva0Up1eXFwJ2CDG
	GctZe0z1VTY9blkiM1jemCaPmakgL0ek06iV6kr8Um2c+RhTsCwEiScYWT0ALE384Etpx58rfVr
	dYndkz1kTVp576H0i/oCefMPbOZW
X-Received: by 2002:a05:6820:1506:b0:695:b571:e574 with SMTP id
 006d021491bc7-6967a6c77ccmr3624418eaf.59.1777645646872; Fri, 01 May 2026
 07:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com>
 <20260430-ra-fix-primitive-v5-1-6364d2258e14@gmail.com> <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
In-Reply-To: <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 1 May 2026 23:27:15 +0900
X-Gm-Features: AVHnY4JC-VvBx6Bp21i74kC6L8lyNPE4_MphpSRsLvSKagiL4eAQjNzRBH2L5iQ
Message-ID: <CA+tqQ4K+A0fh7B8LrBi6XAZDg6iLKcAbf31B-9+Kto==LsWVkQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 11:14=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> On Thu, Apr 30, 2026 at 8:15=E2=80=AFAM Jesung Yang via B4 Relay
> <devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
[...]
> > +    # NOTE:
> > +    # This rust-analyzer release should be kept in sync with our MSRV =
(currently 1.85.0).
> > +    # When the MSRV is bumped, follow the steps below to retrieve the =
information needed
> > +    # to update this:
> > +    #
> > +    #   1) Clone both Rust and rust-analyzer repositories.
> > +    #      ```console
> > +    #      $ git clone https://github.com/rust-lang/rust.git
> > +    #      $ git clone https://github.com/rust-lang/rust-analyzer.git
> > +    #      ```
> > +    #   2) Run the following script, providing the new MSRV as an argu=
ment.
> > +    #      It uses `xdg-open` to open the matching [1] rust-analyzer r=
elease page.
> > +    #      ```bash
> > +    #      #!/usr/bin/env bash
> > +    #
> > +    #      RUST_VERSION=3D$1
> > +    #      LOOKAHEAD=3D50
> > +    #
> > +    #      subject_string=3D$(
> > +    #        git -C ./rust log -n "$LOOKAHEAD" --format=3D'%s' "$RUST_=
VERSION" \
> > +    #          -- src/tools/rust-analyzer | grep 'Merge pull request #=
'
>
> This grep can be replaced with `--merges` and then you can just use
> `-n 1` instead of `-n $LOOKAHEAD`, right?

No, because of commits like "Merge from rust-lang/rust." Sometimes
those are more recent than the downstream PR merges we're looking for.
An example using 1.86.0:

  $ git -C ./rust log --merges -n 1 --format=3D'%s' 1.86.0 \
      -- src/tools/rust-analyzer
  Merge from rust-lang/rust

  $ git -C ./rust-analyzer log -n 1 --fixed-strings \
      --grep=3D'Merge from rust-lang/rust'
  commit 99894ccbccd63cd7480ac282ba636e84004427bc
  Merge: d105b7e0d1 f13fe5a4dc
  Author: Lauren=C8=9Biu Nicola <lnicola@dend.ro>
  Date:   Mon Jul 21 09:18:22 2025 +0300

      Merge from rust-lang/rust

Since "Merge from rust-lang/rust" is a common subject name for
downstream synchronizations, we've picked up a more recent one here
(1.86.0 was released on Apr 3 2025, which predates the Jul 21 2025
commit shown above).

> > +    #      )
> > +    #      readarray -t subject_array <<< "$subject_string"
> > +    #
> > +    #      hash=3D$(
> > +    #        git -C ./rust-analyzer log -n 1 --format=3D'%H' --fixed-s=
trings \
> > +    #          "${subject_array[@]/#/--grep=3D}"
> > +    #      )
> > +    #
> > +    #      tag_predates=3D$(git -C ./rust-analyzer describe --tags --a=
bbrev=3D0 "$hash")
> > +    #
> > +    #      link_prefix=3D"https://github.com/rust-lang/rust-analyzer/r=
eleases/tag"
> > +    #      xdg-open "$link_prefix/$tag_predates"
> > +    #      ```
>
> With or without the `--merges` change, this always takes me to a very
> recent tag. It seems like `git log -- src/tools/rust-analyzer` in the
> rust repo never shows merge commits?

Perhaps the MSRV wasn't provided as an argument? I see the nightly
release page if the version is missing or unknown.

$ ./check.sh 1.85.0
# This opens:
# https://github.com/rust-lang/rust-analyzer/releases/tag/2024-12-23

$ ./check.sh 1.94.0
# This opens:
# https://github.com/rust-lang/rust-analyzer/releases/tag/2026-01-05

$ ./check.sh 1.85
# This opens:
# https://github.com/rust-lang/rust-analyzer/releases/tag/nightly

$ ./check.sh
# This opens:
# https://github.com/rust-lang/rust-analyzer/releases/tag/nightly

I'll add `set -e` and a check to make the argument mandatory to prevent
this confusion.

As for the rest of your comments, I'll incorporate them in the next
version.

Best regards,
Jesung
