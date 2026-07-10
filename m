Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B01367284
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701983; cv=pass; b=tBu3JFUiTWNbebtqTA0DLccW9RHc49phiVfW0TXQvuUSp+sAALLhCu/UhzZuxKSvYYzmesyzmCeCSeH8BVr5cfIL1m8AeeqWegzud5YtGMsnB/CrCkHJBSkbV+YXWKrwxmhjwGLYCP6icmJEs298tHFIqwcyaQ8q22s8W0mZ1rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701983; c=relaxed/simple;
	bh=RELhPPj68qdpI4XPjzcHAfIHD49InoF1tJlAkT5QJWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mg8lgaDvPVGyxiYVUNHTKcH6uEHHTm/M5NJKwlT8cBZ0xoARdhCxZTLww0byOqGLgIGI+H4Wvnj9i3CWzqlrZ/GEW1RyHBVOCdBiTGcEiECHHqQpZp64CdHL3OHDQGe+6k63kRdPxt8D/RuJ9SfidGkd3Q0r9NUmKeb35riMilU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEy3pKtx; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEy3pKtx"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca6d9c91206so121055a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 09:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701980; cv=none;
        d=google.com; s=arc-20260327;
        b=XjTTkwPf9i+6euVF9vY27jglvE9a3P9XvwEt4n4Fm+3huNf9za0tr0Z+kamJwyENdd
         6m2R8SE50PYjbO98oQcy86+yL+Qyn5Nb4Esawxr9hlQxu7xVzfSeiDmrIkUk4H8RuIZS
         J4yF0tpO2n9nPMXO6psjf756wPXdnD+J43sRboWUsIIIE7GI5pOJjSBa5u00ndlxyla+
         xPYFclKHGPsOqd62Cw5GlyZfNnyJ5VFgJse8YakUzqHR9FrjDQYScCG8TPzwbxrABt12
         b2rI2NOaAbgb7vxon8NeAUdZ3In+hs0zHiiK8fSfpcGqLVnTmgEFipTHNg6+b4cC7IJx
         f3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0tCTXXFgcUgKeYSbSejv56PgeQomqF54AvOL4XpdOFc=;
        fh=bfs4sV1B2ZViIvBBEL6snOx089Pgpqle8uhU1mkEaAo=;
        b=Bn6hXcD7aVfdUBICHV4OUoRF/48TJszSAMsZa8HPIHVFYookNG+eWhbUvpEl7zdgFg
         wAs12AXJxy1dVhEDAM+epytqQ6QcidJ0tsnZBd6AxusDngtkDvxXKuRn495zXO/oIvJq
         EV/Nx6reSGuaI3DZULVZWbPxM0M2kiqn9p5dzciK4drJL0nYUmE3dg9Mq1cZIIdwHWG1
         psKRoVP/fHESpuUOND76epUsGyOC1/GOK6bZsEyk6lJlC+JHbSApnbN4sWFenSwp/pxY
         wyCpHTCd/OymqDUp5n9E0hPkXrEKCaQJJ6cVAKM9UsWcesG7XC8N/v0yG1KE49xtpSP4
         6gdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783701980; x=1784306780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0tCTXXFgcUgKeYSbSejv56PgeQomqF54AvOL4XpdOFc=;
        b=iEy3pKtxtZip+692jYYackGhjEfm4g0WFkDdqqEKR93CcnLFRqYYrdbvgZ6/GYpt5l
         ecZgaJoKQRSQqwPzPdOvP8bNchsxetcrIIkzqPqM8U0FjdMJJLnBgfN77Sz55D9qBwTs
         WkFh+efkGeH0+y5m3BJ1ivujZbsyWr8bY9zjxrThVM6rToiLNc7Oy9RPT04InLThE7vK
         M6gwOnEV7M3MfRCyirqGd3qVDwGCnoiBV00+VIcrvsF7ECkxIapG+1qc03id+4GZ2puR
         9uWTkzXiNEVGZHPLyRrG0HSlV1+oHC4IBWIoj31Wom7NiVxvBNuPjJoruv/7Y5HRNPj+
         gGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701980; x=1784306780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tCTXXFgcUgKeYSbSejv56PgeQomqF54AvOL4XpdOFc=;
        b=C2YzcDB2yUFWBwvPofEnwT0Qe9mwHS6pWo7ij9nI7CvHRcgy2bP4Meq4k5zw78Vwoj
         VwfSOv5gwTNiqDCyF57VQOVOeHxYzdm7o74byV5ybC6HD/epPUuvkCynYyMO5VD1/1DX
         e5gW9G4zaDEabVyQ9ZHDNZOHlxb/beQsIsKg1fTtFkooAbjlAK8npHh4XokzYteeHMLZ
         8oCWzWj+HENv7irUGICcuWZugJK5jVV2OgMSoxcW4MxQw9j9BcZ3zzWxY9wgrHOJfSPy
         GjixNubWkXVxU/y0pnXsfEOpzjB1/gjf/YmoZT1X4TwkXQMF9jSpXW375lifB9H5eT7G
         rn4g==
X-Forwarded-Encrypted: i=1; AHgh+RougXlOXF8LPgXUj4egz7p0tDSbz6hkt28C1bl+0671Zf1dlfulgcYgNytgc1DOrPA/++BfBcC1Vpa0qOCCHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB+Abd3TD8JWPUGiZpbNYhihx4WXD+wxsCTJrqPq4oGNTz0M3H
	41Ck4tToarc1JShFuhIY7os/mM3mixAzU5h/GK7w2L6g4ctZDoyv0eZbmPcryazcs2HiqrqnfZx
	SzRGQCkwRaJ1AgrJCwxmt0gGFm95OjxM=
X-Gm-Gg: AfdE7cnqgihqPVakNQP4oOW4F77xrE8tKKEK6erVbTNMLs1XB/fzrY5+w6Em8d3Ib1f
	VSvAZ2WE49xMewiCR4Q0BrnpHRjfLBjoCny3xQOporaBUv+qUxtk/97FQL5f9Lz600ZGNY2bKmr
	DmToqRf6dQ55GFfckXaGQ6e2FyEdIydCZ/SMP3qnyPy59on5JXNDPd3eG+NoYaHV5CkYoUr1dqC
	g/1hz5lIJwu7TB1HcriRlF1GZGkNlfXjjF34yByfny0/1ODGqZgWIu8odW5DpH9u/M10VZz8Clv
	jFm4VH4xz7YcZKUXQf8CJXX6s1gfpJlRDAZLvBnTNTQvM+rg+rNmq01/4Z/7cTUfB56F0zupKvi
	E3vg7s2fJKmtU
X-Received: by 2002:a17:90b:3881:b0:37d:f70f:fbf8 with SMTP id
 98e67ed59e1d1-38a1c1b0a81mr7223814a91.0.1783701980415; Fri, 10 Jul 2026
 09:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709211311.142544-1-ojeda@kernel.org>
In-Reply-To: <20260709211311.142544-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jul 2026 18:46:08 +0200
X-Gm-Features: AUfX_mxQgoTi_hC5vfgx9j6nNnEsF59wP2SWxVL6OXFgYuVk0wCeeXTMb4Ch1e0
Message-ID: <CANiq72k8aUaq2cXtnM8RRj2O3YbbK_sTzjL46q2AN4E8aq4+1Q@mail.gmail.com>
Subject: Re: [PATCH] rust: zerocopy: update to v0.8.54
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 11:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.54=
.
>
> It is a very small delta from v0.8.52, and most importantly it resolves
> the unexpected lack of inlining [1] which triggered a modpost error
> under `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy` reported by Alexandre using Gary'=
s
> suggestion [2]:
>
>     ERROR: modpost: "_RNvMNtCs5wX7wwEUCR9_8zerocopy6layoutNtB2_8SizeInfo2=
4try_to_nonzero_elem_size" [drivers/gpu/nova-core.ko] undefined!
>     ERROR: modpost: "_RNvNtCs5wX7wwEUCR9_8zerocopy4util18padding_needed_f=
or" [drivers/gpu/nova-core.ko] undefined!
>
> It also resolves `most_traits` being unexpectedly documented [3] that I
> reported and adds a missing SPDX license identifier [4] that I requested
> to match the kernel version.
>
> The following script may be used to check for the remaining differences:
>
>     for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name READ=
ME.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/zeroc=
opy-derive/src/$path |
>             git diff --no-index - rust/zerocopy-derive/$path &&
>             echo $path: OK
>     done
>
>     for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md);=
 do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/$path=
 |
>             git diff --no-index - rust/zerocopy/$path &&
>             echo $path: OK
>     done
>
> Cc: Joshua Liebow-Feeser <joshlf@google.com>
> Cc: Jack Wrenn <jswrenn@google.com>
> Reported-by: Alexandre Courbot <acourbot@nvidia.com>
> Link: https://lore.kernel.org/rust-for-linux/20260708-zerocopy-export-v1-=
1-2bfc355853c6@nvidia.com/ [1]
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/rust-for-linux/DJT6235B3DOV.222XR5O6VHG4M@g=
aryguo.net/ [2]
> Link: https://github.com/google/zerocopy/issues/3466 [3]
> Link: https://github.com/google/zerocopy/issues/3457 [4]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone for giving it a quick look,
I appreciate it!

Tags still welcome for a couple days (also for the v0.8.52 one, which
only had an Acked-by).

I changed one of the Link:s to Closes:.

@Gary: I didn't include here the change to avoid linking since I
thought that would be best through `rust-next` as a separate commit
and in case you wanted to send it yourself, but I think it could still
be interesting to check/guarantee.

Cheers,
Miguel
