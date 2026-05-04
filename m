Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BB23DB629
	for <rust-for-linux@vger.kernel.org>; Mon,  4 May 2026 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900329; cv=pass; b=ZAdI3EuxCvtDyQWY3ql5NYZ88t926Bo1b+b9mT0B0xpXvEaZpcXuMwatDIXEOJDtkx3izLC1SBlt8BK3UQDLkA5/RAwU66e33+TOnYTYNEGPcWihTv94SPujVvCixVbpRB2GT+rajNgkFL98FUc2taxNf5fUgIPegMRMUiH+VeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900329; c=relaxed/simple;
	bh=HnBRU6LAeKBhablVmg+uVUQ4RVnSNQvEgp9nHSxXAHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lN12bUnMxsAUrHKsmG6wF/msPXwbPZccDQ5WUFVVuhrdpVtPjD1x0IoOSlejo90YH8t3CWq0Yb1Ky+hrISZwsLWhEsCB1bNtrvmtGuRI9xhh4V3ZKYklHvjeVQkowOKbwtrPGK/52NrloHhUKfV8230a2QKeZnQX8mIxoqtDT1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsRqQ46J; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsRqQ46J"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso3618391a34.0
        for <rust-for-linux@vger.kernel.org>; Mon, 04 May 2026 06:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777900326; cv=none;
        d=google.com; s=arc-20240605;
        b=F+7bZv2wjXh79kG4a4EmZz9aU3PkiCxOfL0JWsnNBkSkzW8AcRZCKwZJNAXPBdt+yP
         cMrQBGOFEJUseyUbbJP74+7/k60G898ON4BkoVMs7IEJkOUi0IVss0M3R5ClGnmWap0s
         yVM36TAOuJ7CFUgPPUkxlBFFDCsfczTEuK4jRpv3d8MO+R2ZmQkxxN6LhPel+jxCmlAx
         04BzhKW8FCD0sodMkkoG3YDLCvKiC5lTFrFLrGZ7gmYWaAnL1in0l3VQ+k/NQNnP1euQ
         DMBj3gRjWaBheofdkcWyAiz1JejYa/cEPcsq4Os3uMyUb7zvZSwSiKX6WP1uFRtoBU7U
         FiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnBRU6LAeKBhablVmg+uVUQ4RVnSNQvEgp9nHSxXAHU=;
        fh=XdESUKCXZiTZzHHZbiEMvYpMEEGVNFc6Zclh19JCnis=;
        b=B5Z8GA8ByjMd2WxgwA3SzMPaQfYHKWaw6hcn/BY4XLf6MzqGrHLcBN/eFbGuG1O+t5
         BWHczehmnTH3+3aINOWikVN3nJz0Psn8Hdu95KKPOTAbtkSmVFCRgLRsmFQ5iv8jz4L/
         shnYfTL0oq2YzwSHxXhwkUEd+MYH1JODXgp2+m5ALe/HcBzXmbl98H2SHNTN0UJNFeiw
         epwhoGWOQ6HGzj9vAfq627NtAEDB4Ao8pr5fbKHhPc+USmDa2R/dJaG0ikcMGIuxfdcw
         pfcoTdG7jT7GLmobU2kV+0UwvlDzLcIb+cH3NFmXx/ZNJ7huWS7Ar11yaHbedn79L0iq
         Zc/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777900326; x=1778505126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnBRU6LAeKBhablVmg+uVUQ4RVnSNQvEgp9nHSxXAHU=;
        b=CsRqQ46J/eXtFCywaI0pzWwyvq7qBlgtM2N5hBcEtaPgPKK4uRMZGSYkQmOi+kMEdB
         iXesNjVJb+F6ci8wdbnH8nIlA5TD4mhhBXsKoo/lUZjOXXvVgBUhkGTPmNV5N1cR2xqO
         8plnCzjaEdxxivbmWOIuDlrOXI62Bzzxh65k2QaNWY/AYQOh+zdOvzWj2mFUPZRvf/Z9
         gO+qjAwWxQVIHWcSKms1sUFKCcAjx2BK04vc+MDGQZhdQa+H9xsiyjaVfNJUojcyq8hA
         mQoY5y18sOAKJLbNXk0V6TAFtZUBPyj8Dm+ZBv5h444ac57bQzvqeEuWPxXWzLskkQlt
         LdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900326; x=1778505126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HnBRU6LAeKBhablVmg+uVUQ4RVnSNQvEgp9nHSxXAHU=;
        b=QT5n3cRZ3WcMB2sNlarRC4UOn0KHmTQ2NPa2nkTyPQkuZAdUNmezqdAkaMcQ7hX6Ks
         87h4GaUWReA2/THQA9PQeCdft4eY9BdAX/1qNTN8DCVjxSGdzkYr5DZQjlfsHotyreBj
         f4zhprcoX7cidjQ0FuEJMqWmZSXUq3KUVM06m5p86BtganWQXImsde8fv/Qsx3nRPkrz
         vocJCXtw4TSPxFR2EhAVzYRz3aV2A9TgvhwGnDg7XQdSkcUE3hYS36ZpjyYR4rMBsfGE
         3v6SWKDxlIYeZhhTY12U4hCIZ0zFrYvvlI5Fdxh5yMQ9twOtk8fWOuroGwtdgA5Osm9q
         1low==
X-Forwarded-Encrypted: i=1; AFNElJ+CFl0cjA/Vva66q+PqvkkRTJZYQ554K63XuIHsvpeamRoFQUq9m+HVW2O4jxdD63jNUJ7+yHujyj6B4Q2atQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPvVAaLqNd9zEw2DYJLBgyLYuZdwWWeAzuGpaf5b4I7DlQ440w
	Dg7GyLpd7D09fLHIpItY0cQ2LodRzDEG16J+F0XhaDin+4g6lEz6weh4yhuFnNW8WBuYkqGzJW0
	uAYKE+SONc4DwdJBGF0fuv7/+tQmSz44=
X-Gm-Gg: AeBDieum1CGzHuUmHBw6+aTA67GSETINKhpx7kaNhHFy0t91qnzb+plil8MOvbL7cag
	YeOT2oYJxA++2/67KijZUuyVe5yzs9EfaU4q9Dr9Wb4tZo8dUtRDUAB2s4aXGlXUpra1Z6+tNUX
	Mi3FDNMylwdY9DoXlbUuWcWOioZAS9PSBrAagvSqj4qmqgWhMmspE60DYDpFT2jXSaorHze13dV
	4a+btbeJZTKmfFc5IBfCh8vbQzzu8PqdRkhkIPJH40DQ2hbhR9+NX795JzMSNBYhysajGmoywsD
	21piVV1c0+mKYiR06w==
X-Received: by 2002:a05:6820:1389:b0:67d:f88f:d853 with SMTP id
 006d021491bc7-696979cf646mr4628499eaf.6.1777900326210; Mon, 04 May 2026
 06:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com>
 <20260430-ra-fix-primitive-v5-1-6364d2258e14@gmail.com> <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
 <CA+tqQ4K+A0fh7B8LrBi6XAZDg6iLKcAbf31B-9+Kto==LsWVkQ@mail.gmail.com>
 <CAJ-ks9=OY2gL1ne8s07x_E19RO0cXGc8A9UJPWqLLmhbXbk_ng@mail.gmail.com>
 <CA+tqQ4K_St=mF=4Bscawq52K+Ky_6-=-p2uJ8N7CA+4tXn_rDw@mail.gmail.com> <CAJ-ks9ki9ncF-6xkwk9UFqJcsCAgCeZe_Apt9=Jb7jfxEK5sTQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9ki9ncF-6xkwk9UFqJcsCAgCeZe_Apt9=Jb7jfxEK5sTQ@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 4 May 2026 22:11:54 +0900
X-Gm-Features: AVHnY4JYj8IwFsqBF2SQHj5VrIyEXAaxg_MEBGFquR9fd8PoGoR-KgIsB6MJ_Vo
Message-ID: <CA+tqQ4L0NHFBU9GLSGEF2syiB7tbEp-RVEvKjBvh2H-gVx-fzA@mail.gmail.com>
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

On Sun, May 3, 2026 at 10:21=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Indeed. Codex figured it out:
>
> The cause is your global Git config. You have:
>
> git config --show-origin --get log.follow
> # file:/Users/tamird/.gitconfig true
>
> That affects /Users/tamird/code/check.sh:9: with a single pathspec,
> git log ... -- src/tools/rust-analyzer behaves as if --follow was
> passed. In this non-linear subtree history, --follow drops the merge
> commits, so the grep for Merge pull request # finds nothing.
>
> Best script fix: make that command immune to user config, e.g. add
> --no-follow or use git -c log.follow=3Dfalse -C ./rust log ....
>
> Secondary issue: after this is fixed, macOS /bin/bash here is 3.2 and
> does not have readarray, so /Users/tamird/code/check.sh:12 will hit
> another portability failure on this machine.
>
> Mind incorporating these fixes in the next version?

Happy to :)

(Surprised macOS is still on bash from 2006... I suppose it has
something to do with the GPLv3 transition.)

Best regards,
Jesung
