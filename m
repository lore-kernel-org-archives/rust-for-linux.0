Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126192EC57C
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 12:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158656; cv=pass; b=OnfCSHIs4ek4Pc79c5CnODparAXOrBgLhtCm7oqZSsbnFAdYfrRuLvwZdHt9lGwbpr9qlmh7M3RSX6apF7EgwBbmOwhxYQqYuAw8Z4B/cYmPpfJeq5hLrg4PBtqCTQXnYjjAnT2hwXIdMOa01Tbhp7ugusVSg3vHnocJKriiHLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158656; c=relaxed/simple;
	bh=FiGtFYsXkTx+b93/ZPihLDSbFdZT+YKNvRLa1r+RjA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REeDswhDyE0yc+JU1b32zJ+syS2oCz2nukRo1T+eCM6YrZ4ZC+S9fl6cj7dUENnm+qQZAPaPEn+QaRdN5gvysxLE0x9vf1giW+Rg4BdzMyTrBK99N7kGy7rFXkJtVuY5+ZO6oel7no5W+Vx+R4g/83rWWWCD0gHdRWu9TB2oIdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkZMKlYX; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkZMKlYX"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7de4ed0593fso381859a34.1
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 05:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778158654; cv=none;
        d=google.com; s=arc-20240605;
        b=JyVlFISXXWEBNYzZGy/Rq6nZFn7CalhhGY5eIEzL4UgpahCkqvG9Kh5ICedRQL5hEx
         T3i0Q3L9traFt69hTkZMHUfMbDIXvgVNDA1JZ2cWRt3AAoO5cHgQ7LQg+mHTagC24fWv
         OPUJ/43RLTqmyonPi3Nk2NLlCREkOxvs6eTBrCa1JtAfYu7qdm8UYldMBWuya59EJyFu
         L/Ia6Ly8U7qW36+OPRKPw9xJit08QGrRmtKRqOpranQYhp+A4tGfZUgHIdYFxWMzqHg4
         9Te/s6Ue0wRhSi8PQfDdQT7dVpIl6VmS10rx+VpQtw3RseC5qhKYOwKtH13ILlNeoHNC
         cFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMBNpsw+E6gLkXI3ijEbQ0RB7z4G2EpyO0qlFGUYsdY=;
        fh=ttWjlq2vYxTtzGDvyA8oN/cvYk5a/IPMXw90OhnZYPA=;
        b=gyGixvu4ejo5NPOYnWf/woSrEmmEVx17GZfDouUF6aihrIWb27M9Q0IHJL4kjGe0kl
         FV+4UrjgrND/UTmSXHRJDBTp74eHFgZCEIXjYpZiVhVJ2nfIY6bkW47Et1Lo2qWMrNdX
         FqZd93SmBG+zih6EGMiMMyY0dy6sUHzPo/RfJt94lc74a5ZH1wacv0dE2DHBBV2Fenx1
         NfeyharhWKUSDemnzFm81/jpi3ifS3eLKZ+b+H+StxH2wdZJW784mzlT6U0ZpKzuCn5A
         SQIcQGV868iUiAicIzZSlz5CUO04jpm1qkOSvNOp6Qkuub8mcRzitRFTHM/IBnCC/8jr
         3loQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778158654; x=1778763454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMBNpsw+E6gLkXI3ijEbQ0RB7z4G2EpyO0qlFGUYsdY=;
        b=XkZMKlYXhR6fMciPOb5RJy5md1HvjNXSWUw06niqHXfyId0kfSijXi/Mf3iLj2YOb+
         xJDQTpgMDVAjkVW22l+VaKHFX2kZl7f2An33DI5LE6w/weW+WdjzRTDsP9qcLftqs9qB
         wNFirIVSXDnI3KrguKHtE9XQuCgLixPXfLIGqvJthqO8I2+t1m4dgubeb/EeganF3xlm
         QRtomcsVrCMdPq9TBZqLZz9xqlDALxCweKG8XjTrZ95HpSOzKVG/C9KytehkVrfbWwy3
         7Ha6Rzdaww8MSNpgMbvnLfFL+6v97Jw5SqxVq5J4S7Pn5auYDEHqpvTGDGIX5YUgjeN4
         IcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158654; x=1778763454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VMBNpsw+E6gLkXI3ijEbQ0RB7z4G2EpyO0qlFGUYsdY=;
        b=RLcu62yGfN8zmXpbSDNdSRxvXgZaI6KrHflcDkt31Tix1Hcwl81dPkbF+MZY4mfJ40
         +npvpVLrJWvEzqZrPO277GgcZfbaMHq3QfjJ+r0yp5QiqFIpmHxWfKzbDGQmrF87lZDf
         8BthnxsmXCtjLFat6ksUZXKW5zoq72RuxVHQbfBsPlEvugYyCmDZhF0ZsBXHjIuWGetY
         lsdHcsmVNiyYJtWVqC89jzSXbNv3nYLJmeLxKvlHJ8DSxmI9PLSi9RXSTKPQ+Tu0VFj6
         QgEZbMwOV1Zv/X7e5Oh4vcuqu14p8B8B3tkCfkblp9QN/JsG+pf3If/360pNYpT6Ga44
         C7XA==
X-Forwarded-Encrypted: i=1; AFNElJ+8lUHkL4K4PhcP7rAr0eVB66W39iiqnNYI7mqUhgHJJ0ze71Iycg1nv2/1eJMZ0CUl4ZsjCTS4cnBiw53DxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhirRiF8K79TN8RzEOzw+uFeMS4ChTV9W7GqE+rOD7Ma6fDAwf
	YR6mA4fBH7xZizZkukGN/6qFfEt3wGS2lpdpebiQqP6/IgutdFcxlwNIPcAJUpPKsGmzJuLe2K5
	jKCCHEVSTh2kiOyUERNAwChQYjPprd0I=
X-Gm-Gg: AeBDieuhrkB2HBSzGKTOHo4HCfU+2KLBUHpHIHo0hjnywSMPCq6vCYVgH6GK4fgdcGk
	6hMBN7sha4933OAQ2cJOAZApGOfHIp2vMqLlaE8mQbZiSggSR4CF9xpIxOi5tNxm73f7Mx5mCZ2
	AwQPYvqe6W91qr88pNJpfycH8MrO8tt/tR7ilOXiT5TkW8NeydTKWaO7kpb7a9rrZIdSJKjvNPw
	qqDINmK4SwORHoTmbAY/itc/irCZbgP+IqdnOLF437WG6RyWJhJ5OIt+au5hCV2xvhe2DYwjpsD
	FYoU9Ui6Y7Yft5xakQ==
X-Received: by 2002:a05:6820:f010:b0:699:981b:e794 with SMTP id
 006d021491bc7-69998d17b68mr4206151eaf.35.1778158654034; Thu, 07 May 2026
 05:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-ra-fix-primitive-v6-0-74cfc1e862d0@gmail.com>
 <20260504-ra-fix-primitive-v6-1-74cfc1e862d0@gmail.com> <177793208554.80529.7376377202991122733.b4-review@b4>
In-Reply-To: <177793208554.80529.7376377202991122733.b4-review@b4>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 7 May 2026 21:57:22 +0900
X-Gm-Features: AVHnY4L6gqr1RUxCze0aAaLm5dWfsj8ygC3AkqtuWwUTya6mZhi4Sn0RKs7C-Q4
Message-ID: <CA+tqQ4+McKwrZ7rHFs70Jh+CG1eMBciB18Nnt32ebFGzH90kaw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 7:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
> On Mon, 04 May 2026 22:20:59 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrot=
e:
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index d5f9a0ca742c..934698c7eb95 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -343,6 +346,153 @@ def generate_crates(
> > [ ... skip 46 lines ... ]
> > +    #        git -C ./rust-analyzer describe --tags --abbrev=3D0 "$has=
h"
> > +    #      )
> > +    #
> > +    #      link_prefix=3D"https://github.com/rust-lang/rust-analyzer/r=
eleases/tag"
> > +    #      echo "$link_prefix/$tag_predates"
> > +    #      ```
>
> I think we talked about this being a bit more defensive with (at least)
> set -eu. How's this?
>
>   #!/usr/bin/env bash
>
>   set -euo pipefail
>
>   RUST_VERSION=3D$1
>
>   grep_args=3D()
>   while IFS=3D read -r subject; do
>     grep_args+=3D(--grep "$subject")
>   done < <(git -C rust log \
>       --fixed-strings \
>       --format=3D'%s' \
>       --grep 'Merge pull request #' \
>       --merges \
>       --no-follow \
>       -n 10 \
>       "$RUST_VERSION" \
>       -- src/tools/rust-analyzer
>   )
>
>   tag_predates=3D$(
>     git -C rust-analyzer log \
>       --fixed-strings \
>       --format=3D'%(describe:tags,abbrev=3D0)' \
>       --merges \
>       -n 1 \
>       "${grep_args[@]}"
>   )
>
>   link_prefix=3D"https://github.com/rust-lang/rust-analyzer/releases/tag"
>   echo "$link_prefix/$tag_predates"
>
> Note I added `--merges` in the first `git log`, inlined `LOOKAHEAD` (and
> reduced it to 10, now that it's only merge commits), and replaced piping
> into grep with `--grep`. The second and third `git log` commands are
> combined.

I don't see the `--no-follow` option in the man page, so I'd go for
`-c log.follow=3Dfalse`. Should we also use that for the second `git log`?
Otherwise, merge commits might be lost, right?

> > [ ... skip 60 lines ... ]
> > +        return ra_version_output
> > +    except FileNotFoundError:
> > +        return None
> > +
> > +def map_ra_version_baseline(ra_version_output: str) -> RaVersionInfo:
> > +    baselines =3D reversed(RaVersionInfo)
>
> This is an iterator but it's possible for both `version_match` and
> `date_match` to use it, which means the latter will observe an empty
> iterator.

Nice catch, I'll wrap it in `list()`.

Best regards,
Jesung
