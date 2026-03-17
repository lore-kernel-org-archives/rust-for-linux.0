Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415CB1DE8BF
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731862; cv=pass; b=ix2b82qeVOOZIfqDw8fccPxA9HgEQ+QRMe10RNZBFkT7sKLO/ry2L/FuAaHab8U9hYXdcRP6ukRltqrQU95Qh16PkOm4/lz6DINTXzxyguHIBd4plUMkrgBnePG3fpBFT71jxMKNaNadKfMmpefbjHWIxug82vs6kMnuiQcVrZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731862; c=relaxed/simple;
	bh=JRjFojoQ+ay0ef4If4kUCgywrpzkrXMMzGRlp08g/yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPjFfrrf5bl0+30pDo4BkOia0WFpuMce+sySMjGfSb7hqNYddAjT0i4RKwKp19x1FsZHRsOS3TFWDD/znGPEgwbROufDAkxb4z79JI+BV4Q9f5xUZc37PcZVB9wEO65AZJxPRTPOnSjtgT0kxnK6DOEssHuwKCH6dUaQZYHiCn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKFechYH; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKFechYH"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0c9994199so66231eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 00:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773731860; cv=none;
        d=google.com; s=arc-20240605;
        b=HeFoR56LDDO8cfsH5fqRkT6UbNkVc56lujHobd1dMB0zbGI3MA8msZyFZiPt3gQLKh
         /LKhh+JyC9TlqpNmf6mwOvDzBf51KehZAT8jMA2Tea1yn8/YMy4WFWv7Y7kcMiBmjjlu
         oKXZccjXDsfu/pXftxO+mxHTHUpD9rOaPoyaO0/49XPnS77RLrFPU/EgC7+dB3XBjNf3
         YTm/pj17lFmrzoTDfEP/l6Bm0WCO3EDu3L4SrMF2LYCfm01GUkBraU5Vcep4/R2377zA
         qdbkAb+n9m2OKW4ZqXRkvYFP17CBW+uRfuOYcPuTf/b3cntyn3DB02OAManTYdH6a6lQ
         LqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JRjFojoQ+ay0ef4If4kUCgywrpzkrXMMzGRlp08g/yk=;
        fh=Fl7WCLyAlP97FUa4xywD6JG1NYzMH+ic9SEq7bjFzYc=;
        b=ZPLiFfC5sgVo95xkxLjEHVntytemBK89bBVRBSqQza0xkKQQL0pTb97i8QkKGoS+ia
         2iOlbwvEBDXEf+wv3mRp6vFxh6ZC7mtz2naod3Aw9kBQnZMuNw8SCXEr/R+PE5sTVhus
         B4nf8oqHFtWzI+C7GGrAFaPDP/YcCfVKyGPZ/iTVd5BbO4lXcba/54nYSeFa1DiU5bt8
         n1cWQ8AKMaT6Jy/SGAQCxaMk7A7Hj5DVuz59XpS+QxiC55Jkl1eg0db5I5C6aMWG0AQZ
         i7WQI5suTiK8Ha6jjr/lBVh0S/M/NeDOVjNYwK/7ds9/R3/H3zxjNl+DVYscOcby7IKr
         oeEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773731860; x=1774336660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRjFojoQ+ay0ef4If4kUCgywrpzkrXMMzGRlp08g/yk=;
        b=mKFechYHPpUPrg9Gx+3b8lGkqvUXAujDywqb1rqtAkat9RQk/guQpMmatBsBVjrkUB
         w0povWmGdYK5ALzIf1M2KNjzCD74RIqmOAf7F5sB9p2gF1/pDZpaLFez3ypZnvcrjWOz
         pvA2gs4VRTi2pp798rt0hWALcSLukxL/PPGetzuKOgcUggaNZtllyRdhYxaD2bXi0iTD
         bbVnl7CZNwvcY6UIixCZmc3B8Ms6eRWjK2BRJbKRkj0POmgzjlbD7gzIk2Xk1n0lC7v2
         sI6NW2wTVmF8U1psrZG1Db7ic5OT/UqBgoz5aZFJ2z+x9F3JkA0RlkDxEWkYXbwi9WvQ
         Zr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773731860; x=1774336660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JRjFojoQ+ay0ef4If4kUCgywrpzkrXMMzGRlp08g/yk=;
        b=KFWi8fbVI+Qv4HfPvqdOA+zJp4YJW3bULTizlGgYC64p9IH4m29shwQnPgBOqfnIVz
         CN/WNLQvUKyXk+d/Ok/K339dFjNWZ166LE1qO6/l8LWlwnWf5vF/XhzuzMQ9npDbk2Lx
         vdONIj1xGaCX9vxwh7lyNVIh0RoHLYKF6YM5LD4u+215W6l+cKMc5iNZkLEzZ2IUXjo1
         F1t/yBRL5yrVymgkrf+Y+9cjpJ7WhgIuMJWQ2GQb+PmxrCgQ+Y/NcpHeJpSVgiyZL9Dm
         eMW7+jrU3+8aa7r3KaPhyNN+dWccV7YjeR0pJXrZOyFGHlIAmsD5tv9U8ycsiKaj+Ice
         pAmg==
X-Forwarded-Encrypted: i=1; AJvYcCWCbla8yg6uQ/ey3LJPTJO4lBAe5KeDBN/aNT4nn4YwRe22t4vJ0G2tLbfqx5fv6eX4fBaYPA8X0FKwJjij3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBE26e5RJfi3EwTmf8HY35QiqmGu5Jwk/DQQmRajONW5qsVMoK
	Ffrc32+SR+HAUOc3BbPLVK0ePjD/xlotbfFaAIlgUn+UhxpawMTuln/YUfQz5wQmwakm8SRBAkL
	sGet9tEAdAobuFWH5n/QNsptVICnVNBM=
X-Gm-Gg: ATEYQzzPXr/sBgxvUzQzyytZP0cAARBAFYtIW8PmdFE6QHurRFoWDKH27aePZXuEL6y
	l7Y+Yi8881sUBbv3el1yXMCddT2vEryvYDeQHYeGNznV6AOT0rC36vUTF2pXhd5eIGu2LDO9TCF
	vD0VpbdANqYr5pq7UhzFx009lxY664VFULrN7tmOb708ihO5cDRjpHAlTHaKqrmb9b+MZIyOtfW
	gjbNO8vVSjA+i6x4sACY0Ie+fQRniFNS7CrNg8f6tP76zEVDiTtC43i2E84Un/uxbuSNITxaZzg
	i/aDLgyM60VdXUzDtFEbTAQtKxl5q+7PetNn073QBzC1Iqf27NEcux7qQOwF2lrzXoFB1oCTLuT
	PQFqVFjxZSVWXFigJDrevIcE=
X-Received: by 2002:a05:693c:2b17:b0:2be:6e6:e479 with SMTP id
 5a478bee46e88-2bea539710emr3854426eec.2.1773731860241; Tue, 17 Mar 2026
 00:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316043255.226352-1-matthew.brost@intel.com>
 <20260316043255.226352-3-matthew.brost@intel.com> <7A8108C7-7CF0-4EA4-95ED-8003502DC35A@collabora.com>
 <abjqfXERS6Xk4FAQ@lstrano-desk.jf.intel.com>
In-Reply-To: <abjqfXERS6Xk4FAQ@lstrano-desk.jf.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 08:17:27 +0100
X-Gm-Features: AaiRm53oFtZ4LcqzAMb48PPD1CPMNBFJZZjv3_kfdhsd5ZRjk5fQUoV8uzzbJKY
Message-ID: <CANiq72=Y2g_5=iEzU1L07pMPYD+wVapJXpp9rvYXEzCKEs59Zw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] drm/dep: Add DRM dependency queue layer
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Jeffrey Vander Stoep <jeffv@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Stone <daniels@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, shashanks@nvidia.com, jajones@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 6:46=E2=80=AFAM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> You can do RAII in C - see cleanup.h. Clear object lifetimes and
> ownership are what is important. Disciplined coding is the only to do
> this regardless of language. RAII doesn't help with help with bad object
> models / ownership / lifetime models either.

"Ownership", "lifetimes" and being "disciplined" *is* what Rust helps
with. That is the whole point (even if there are other advantages).

Yes, the cleanup attribute is nice, but even the whole `CLASS` thing
is meant to simplify code. Simplifying code does reduce bugs in
general, but it doesn't solve anything fundamental. Even if we had C++
and full-fledged smart pointers and so on, it doesn't improve
meaningfully the situation -- one can still mess things up very easily
with them.

And yes, sanitizers and lockdep and runtime solutions that require to
trigger paths are amazing, but not anywhere close to enforcing
something statically.

The fact that `unsafe` exists doesn't mean "Rust doesn't solve
anything". Quite the opposite: the goal is to provide safe
abstractions where possible, i.e. we minimize the need for `unsafe`.
And for the cases where there is no other way around it, the toolchain
will force you to write an explanation for your `unsafe` usage. Then
maintainers and reviewers will have to agree with your argument for
it.

In particular, it is not something that gets routinely (and
implicitly) used every second line like we do in C.

Cheers,
Miguel
