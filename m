Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9638930F92D
	for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 06:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997945; cv=pass; b=U3mtLRPDySxv0HSykuc4bNTv1Bb15aGeCw7GOva13eUFiSUbHoK74CvJ1HgGfza0ECokzP/sFiICN89ya2LKWXnHBEXa6q7k+NOgALc937HTBAkMpvDqCYQvDEmCpadhPXxHO73Kc4tM9LN67hb43Uj973ByMXanFHyRHxzM5H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997945; c=relaxed/simple;
	bh=NIfOp3H+fBf634aBcEEfMrRh5iS6XP6r1lQpzxgi98U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPjWOFUJfgzXXffE3yxmzN0/kg5FFMVCQT7uqigMTOTtFZtxBV3cf9ohwpX3Eajkx9tIJV9mAc221jr0wyDL/LaTxqOwrvmYVjyz0NQsYfIzIyM4ZQsRPrH7kmrnt/XkOi3G2g4E1u3EVSFzDgjkHJy7m8qNZoL5hHbGXmXzpU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcuHCFnD; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcuHCFnD"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f13ae64db1so39063eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 23:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778997943; cv=none;
        d=google.com; s=arc-20240605;
        b=l1IXNTn66OTlXlVu991PkdIu9lldiExFawoEKpRySxcwhpuh8aNBhUbx6LUcjFnMRW
         l66X9WV453luK95RNbDfG3FBD6d7ojbbnm9653erK3ki2UhmRMpBE7ZCnRmYzPSuJUyW
         M/zwnHgynBnYC2LuSbEJytsikvXSqrlA/1lrDBMbuop0eKyIemJuU0HF2Bd+8qbdd38c
         dDYiquWoDsSvdoBN/e1KQVIUwO5bJ1ErQqfUPpm9TdRTaZ0rEQIUFaLpgaynDgrfJhVa
         2tha7eIaEqi06V8b+qt8qn9bYMssEQRVlGm+vuVp5/OZUGSejw3dMFcQApb7Ls9YclXC
         WFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KVZVcv+iMQKvayZufdg9CpftdHG0Bh709nb+gr8F0U8=;
        fh=la0dfbYnQI59dA3hfJ3PwqNpaGFG+PdGaZkDEw97Py4=;
        b=hDr23DT2R3oZU6CAhIPQebEMrBdXgV++gV4uszXRfZchyeLXiIT6K3an71wXHtkLNt
         /N1rbx+Xbu2jiFdpFMD/lXNtCmZUMVXDd1PMd9IckTFW/jkFpPzj/JfuFps59c3JQE2h
         s4dxU95pcCxA3FolK9fPVsPoq9vwyzham2vbRK85yBLhkIebyL1n4Y7Pv6jAsHCUuOfi
         ncwm7y+7TUdaE9h1tf4ywE3zjibIVtIhLdWFpnLBUSRIYZn3YOiLf49xfSCE0xNds7st
         0YyiGCktHWesNq7EWBEkUiME89ez1m0zTOF0v72bZFAwRjf1LG619PeXS+6M3K0NI7ij
         u/OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778997943; x=1779602743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVZVcv+iMQKvayZufdg9CpftdHG0Bh709nb+gr8F0U8=;
        b=LcuHCFnDo9fASZNRc/LD1I8mMIlLz6PMOPZBlUZHw2C90QqGa7XOfqxzxQtuRJ+ESR
         85+ojIWtywR0nIhzzb7F5C8pRHHKBSILK9GaJaSyitFlSBRJdcFpLtC4gP1wcs90dzWt
         ulsfNDqCkyVEXHWzI5PkFUBrTOFTPoKZ8lURsk3xXoDYr4+1A77sSvWzkYWPULSA9FNd
         sq7eyvJiJf7CXYDoEdjhIdQqBrCt+ERBaqUA2zS2wi0rlMZWB8QH6znjRlITNfib5EUV
         bOw81M0cnbZs0FDWurjLhFUvPEUMvLlfO8ftF0+maYHk7VJ+7QttOEpKMnsbbTpURq4c
         CQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997943; x=1779602743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVZVcv+iMQKvayZufdg9CpftdHG0Bh709nb+gr8F0U8=;
        b=WYIARR6/rNAXGSMCpAcR5xyC13h0tpbwD1tuHs9aH85oc1Mtdg3EHJUMkHDWf5NUk0
         l4wRKYrPFEsT22d4hqCRGqYMUH8G+LLkGtpgbsfifoBYBz/eVBSawbE+oYMf945+FaTo
         wTYvwrW3njJY18RAwP67zEwft1b8U7KJj/q93ZqINek7uVjNguxdKcwhfH9JPncjGYIu
         2emwlEVOyzRxUeyWTDzcSotWZ/3Oiy69X6hgKEjWmcJZBoGQZHuzp5RDDxERYf3IRSL4
         S36rFoaebeSoFY8dXzBlcWAPnft0UuS2hXqzHUzyvLdzVmQ+9uaqj2/cIhGElYTN87yW
         M7HA==
X-Forwarded-Encrypted: i=1; AFNElJ81tSeg/FbZrF2SbArM6lt2HQDoRxetaN/Evjo42Fw7P1Uzee/0mIb0XIx/v6PJJNaO780EM16HDBMGMEUxgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY0wK9X07T7OkGYT4YuYDcvm6UEuZdMFD8G4EIM0/193u1DwRS
	R0MhhT+gwJ/ZGR7po2ZPkze1I+btImLuMQQt+tJIiEyBWAgm6DPthnUTH4lA/WyemMqJWo3wxzA
	HCVxEeaQbDdRJL0lzKmDypCzBKuQx3aI=
X-Gm-Gg: Acq92OGHdjZD01UQxcYGm7KhaHrOzDXdwtvp+ejGbIx7s5VW51HghqoGFPMzZFU05kF
	bu63y4hKt8vOl7g8fq4Zlr0YgBPC0gCrrGlNcpJZqD3Anfla9v+vf9Z6g7g21eI98HUKx/5uRad
	RqDXWGNwfBw0XF+4SbX7jP1ujdDEq0QfFWusq4WwhpfjvijVFHaTdm1s5cc7eSipu0rWPHP+duE
	ute35zRlMn7a0fo8K/90ovfEqka16X/1exBUcI3TwT7J9fYoY0XINRXms8f150XELfpMVNBsXuc
	vgMjDSew8ts0yMlNHXhaRi90kWFX6wE2jhPgtJj3+QhoUOSlhwlbVxbEaa9Vd+UqKuwWlV3xOLS
	2yN4OfvLcwTp5ccTXJQUJZC0=
X-Received: by 2002:a05:7300:ef82:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-303986d6062mr2073868eec.4.1778997943409; Sat, 16 May 2026
 23:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com> <20260516215354.449807-3-julianbraha@gmail.com>
In-Reply-To: <20260516215354.449807-3-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 08:05:30 +0200
X-Gm-Features: AVHnY4JDLNTOr7rmluha53m8xnMSfI_2zj_-n0FsyWKVI29ECinwLPYxnOOxaUw
Message-ID: <CANiq72=dKOhoLUoWRmzG9Kyv0jWY97Nx_O4rWV-UHjRtULz-jg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] Documentation: add kconfirm
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com, 
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
	corbet@lwn.net, qingfang.deng@linux.dev, yann.prono@telecomnancy.net, 
	demiobenour@gmail.com, ej@inai.de, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 11:54=E2=80=AFPM Julian Braha <julianbraha@gmail.co=
m> wrote:
>
> +kconfirm's Minimum Supported Rust Version (MSRV) is v1.85.0, because
> +it uses Rust edition 2024, and this is the earliest supported version.

Note: this means it will be the first code within the kernel tree
using the new edition.

I think it is fine, since in general no one should be copying code
from here to kernel code or vice versa.

(For context for others: code in one edition can have different
behavior than in another edition, and thus it is risky to mix them up
by mistake).

> +In ``scripts/kconfirm/`` run the following to download the dependencies:=
:
> +
> +  cargo vendor

I am not sure how important this is for `scripts/` and/or `tools/`
(Kbuild may have a policy), but this should probably handle `O=3D`
builds.

In some cases, the source tree may even be read-only, i.e. we wouldn't
be able to create `target/` there.

Cheers,
Miguel
