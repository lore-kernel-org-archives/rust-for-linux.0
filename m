Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F1A1A9B24
	for <rust-for-linux@vger.kernel.org>; Sat,  2 May 2026 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777703167; cv=pass; b=TJgbnsmPCYv0IYj64HuqUB31Qxbd+p8aXfVd5G9YFWSzpceRPYnW1eppanCenGjmKNZNd9tXAHP4iXXeX/wug/ZgqfylVv3cjc+5UaXLpUW3yv9IQ03iYOcUVOWJqh9TpUjHBGnNkIO8faFvJmbwOzgvvrRfEYcghWvIeNKoagc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777703167; c=relaxed/simple;
	bh=r5WJfmehBPS1pU6cLpPHmkkFTkVerNpOOD5yViHz+JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfjJiiZf/Es1CK48lzt5aFgjI17wQTOg3qThpPQYZuMDhoLmXiy2WbqzqDh3eI3BnN1Utn/i0BEIHsMbJarsxnL02ThAWxT8Vf9jSnMJkkVGCYfOqD+HVsg0202Kgbi+lUsYzETWUKuMyC3l2XkaiVyAy4iXImZaQC0kxvXkXro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYO4fTBn; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYO4fTBn"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-673ee2a98b1so1327597eaf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 01 May 2026 23:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777703165; cv=none;
        d=google.com; s=arc-20240605;
        b=XyTp51PDfeeWcfGqFq89oGk9EydqsqvsTiNUC1L9OzCnS0svKtsoXpBiAxVQQxzEjx
         mg3BrUuC1QRno3yhvXo2D25Bk+SO4KIqUhQc8Wg8zBaDaLWQq8CA+ViTHVkyKAHTr97+
         IggN+2/Ga4aC9hCIj3zP2xqp8ZbujvRCCLQcpUr7kWslO26cK+px0GmfUf3OmnGBjQqJ
         ArmhQBVOxVxiXLVH0irg3fO9U188GxSYaNoqjn1gyxg79zwFqNq6YN3dx0miH9GcFDTA
         0RAJEIKzV45dkMYKE+3+y5i19OKNIgS8LR7myxESqJfA6REonXaWJhVCdMg7kBkbJ8Qe
         ut8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r5WJfmehBPS1pU6cLpPHmkkFTkVerNpOOD5yViHz+JQ=;
        fh=sKmj9f4FfXwmctGmPaj9YXFz9rVuzISopFN0LZCaM8c=;
        b=j4SS/rGYp9gNUm3nDX6BhDznUDVKAyAVB1XxLiOdJHOZfES7iC8fGxj9rhv5hz1brO
         VjMzCDWzUl82ct+0s1966DnxDA+UHTmVi51Ld14mA7nE0uQIB9dDlg8s0GlTQ0H+aWpz
         AABYRrcB/v/Y/dsc1f+wsU2DGsrxlOjXkmJeexyqsFOrmHGGPXBfItqcWZfI7lOsVFrb
         /uLxHf6BYheT2Dfo5Mzo5VpwdVeFr3yytqavizNNZO0x48Ajh2oCCWsROyHdVdwr5A5b
         nJlipEQEGX2e0swLYUnc0ri6J8SBiqqqFtlHNxV0Ge24QQJT4oimb/U5sIVImq6Pileq
         McSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777703165; x=1778307965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5WJfmehBPS1pU6cLpPHmkkFTkVerNpOOD5yViHz+JQ=;
        b=ZYO4fTBnTY485pdtEHU/ncs4KX6RZJGQOqqmi0g7eKq7v0jAqnK997QOcx5RBDku5L
         ggJav5JeWHyvAr7mO5O/xgxJRmpDIBkw7YTwZKcV+R0ZX7FLJscM0hL3ooFOOChjJxmv
         BvvKa8xu0tbfEp3p2O0oR/IfHjEvCJIyXtu4su1H6Oo18NLLC7LRlwbsRSP4Ftlroatj
         akzuLuHFdcWMNBP2tcGk80QAmZHXXE11DM2pWKQc6+JnuO1IzPuVu6P9TBThyHLzO+G3
         a1+w2yjTVvB8Ke6QtAubGEq46JOTL+msIwzoUk5e4YvbbB+YisvlPssDNYrZ3X7yV9Bb
         lrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777703165; x=1778307965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5WJfmehBPS1pU6cLpPHmkkFTkVerNpOOD5yViHz+JQ=;
        b=KS3x77Bn294q3+LBajAz3YOaAdwKgFqzqSK+FQAkoMFvIeSjrOwjD/vvIQwZs2Qrov
         AyI7q7w4VsBUsDzgAVECdPLZwEPu7TpbnGuhyCb2qz5zmt0b0AXT3ebM6UNDgKxla/Nm
         CdAq8Y++OKJlCoXdZpTXHwKrxuO2RsnbvF9B58SZVHgWx/cz8Pdtc+tkjiA7a5rmW3Oi
         GNybJjynLnS1k/KLB6MNb7Xx+Ij8bYDREnM+5x0MvudL1Jruif4unxeriq0mcwQMzWOM
         vNgQsA9+LSB2lGsG3ehAVdMMzqxOgrjHuJGm9a8xG3OFWCBFuEgzTGhnRPQ4ycgaF/EH
         DKHA==
X-Forwarded-Encrypted: i=1; AFNElJ+DiNyTL/g7KJQNtu/0F/Y1Rfbw/fMwsnPEqgLHt5215U+TBvUSYxwbEmpXPwVuYiSxJfn+fEP8Iud9hicSxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPaWX20vVawmhJ7Gufu05+XpuksH1A8Q9IazS8wk1Tk4ruvBv
	ToX0/i7la1J48uxzyov1fWtEk5yjS5VM4LRimwvhkHWX9S40X3KqhUX1uLUiewGt3a+/Fg8eXhI
	K92pWJizP0SBAhbjezk346nbvstKRXgQ=
X-Gm-Gg: AeBDieuNinF+OLCwpQw3nTmLK6qtWoNMe42gZcKqAs9immRA06n24g67p8xoZ7PjbUh
	BKlZdHRPHs99d8bqK5B1lP6/lmQ1SXhKh4jmylkn+ChxWioUpZJhASvY0A1T5t3rAzm1lMg5U/N
	S6GUyZeeeZ0B6u11r/1RnzNRy18miXkFvPuKJsDM7PYo2Pz4ubCEnZqmJM4kwmE5rhk7bNHNUDg
	SDQy0PIiI2wQq2nkuVNJdP1lc2RYW94IcZ7dwgvDXa9pmCbxjnN41mVvJ90yKLhfVD96OGRP0ug
	x6u7P5q6kZ9gVba4qTqSbIgAaIM3
X-Received: by 2002:a05:6820:1887:b0:694:8b4d:5f8c with SMTP id
 006d021491bc7-696979cfe98mr991030eaf.12.1777703164750; Fri, 01 May 2026
 23:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com>
 <20260430-ra-fix-primitive-v5-1-6364d2258e14@gmail.com> <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
 <CA+tqQ4K+A0fh7B8LrBi6XAZDg6iLKcAbf31B-9+Kto==LsWVkQ@mail.gmail.com> <CAJ-ks9=OY2gL1ne8s07x_E19RO0cXGc8A9UJPWqLLmhbXbk_ng@mail.gmail.com>
In-Reply-To: <CAJ-ks9=OY2gL1ne8s07x_E19RO0cXGc8A9UJPWqLLmhbXbk_ng@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 2 May 2026 15:25:53 +0900
X-Gm-Features: AVHnY4LOOlL0-MPy7L1vBGrhqp0sv7T8m_-7aPgoHcHDqj7Cdc1c4aYQ4YQDLWE
Message-ID: <CA+tqQ4K_St=mF=4Bscawq52K+Ky_6-=-p2uJ8N7CA+4tXn_rDw@mail.gmail.com>
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

On Sat, May 2, 2026 at 12:39=E2=80=AFAM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Here's what I see locally:
>
> % bash check.sh 1.85.0
> + RUST_VERSION=3D1.85.0
> + LOOKAHEAD=3D50
> ++ git -C ./rust log -n 50 --format=3D%s 1.85.0 -- src/tools/rust-analyze=
r
> ++ grep 'Merge pull request #'
> + subject_string=3D
> % echo $?
> 1
>
> So it seems to never get past `git log` in the rust repo. When I run
> that git log manually I see nothing containing "Merge pull request
> ...":
>
> % git -C ./rust log -n 50 --format=3D%s 1.85.0 -- src/tools/rust-analyzer
> Disable some incorrect rust-analyzer diagnostics on beta
> Backport rust-lang/rust-analyzer#18760: internal: Workaround salsa
> cycles leaking
> Bump rustc crates
> Preparing for merge from rust-lang/rust
[...]
>
> What's also interesting is that when I use `--merges` I get no commits at=
 all:
>
> % git -C ./rust log -n1 --merges --format=3D%s 1.85.0 -- src/tools/rust-a=
nalyzer
> %
>
> Something strange is happening; my git is not behaving the same as your g=
it.

I tested the procedure on a fresh Ubuntu 24.04 container using git
2.43.0, and it works as expected: merge commits are not lost, and the
script provides the matching release page link. What does your git
configuration look like? Perhaps some local settings are preventing
merge commits from being displayed?

Best regards,
Jesung
