Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F51035DA45
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773324779; cv=pass; b=bD0f992gqhWV6Uh9QZ03LSfS8b1s4d5tL0BNgNHgrZpCT4/UO+PuwAxp3q4o8hSMPEUmLfAvZeHb2ELZq7vVE2KQada1FLOsbpcKnFgmflTTwI/2esxcgdACD6tSLcho8NTKmUy145xKnoxnDRC1x+f4m11ukdNp5hW9kfD5xbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773324779; c=relaxed/simple;
	bh=crp4nXRTSnQxu5DrXrn4okeAwkLZ7jy6iVWODJy4Gjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnx6jRj4qaATAzRF0ilWadv1oMXVZA+isWLq9ZFgL7xVcZh+r7sfXnAIVfqzGQFL3PwiPX6sicTrJ29OhaHJmxOhdzLH7puf2Uy8JadBOOURaCfhmFvFKvAyXCHebKAV/3XNpB4dG5ecZX5mXDRA7epgbEcYRJ/r3dug7XRxnEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sojfnhlo; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sojfnhlo"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bd801b40dbso65601eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 07:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773324776; cv=none;
        d=google.com; s=arc-20240605;
        b=Q1uj1PY5jUcdIIJ2hQEDQe6Ex2HumJXq6Phn3GaOABPYEvQxfBGXc/hfQ6dDJJOZuC
         NX+zaG3HlLSsUhZ5gbvSvOMtz760InNjvNolEPh1CxhetP6XAP/yPdxNIntNkn3w/ck1
         Rzd5Od9FTo64s8LXS7qngV4Ud+1qnojW+PlvkIzudoD51Yj88T1dDuAd06iqbmRF8VdT
         nGS4e32eBYwJpOoISg/IK/vHw6+5jZ+ubg4ozvpXD4K/cA1x9bS3y4TLjkMuoksgIAgn
         IgITW15kK8vlDAW7tPRSU75b2R155LqKtyLoWEOj+Md9CFMx4qS8hV6sSEiVJ83a1/BE
         9zbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6eOWrX69/YZe4aFBkH+waBiPUXBOMXCfZ8Ty7gGvlRg=;
        fh=RpsdQh0t0m+P8ai6s7JphIDK8XDa6QoeeqKhP+1hzNs=;
        b=Dx3fkEQvA+XPcKIhMDfRtQdiRfE1UMKs1Kn2C5DpDmdUCW7OSxCSpv9ZRx211LLhGQ
         ZMREX6Slpot9OmMqDVZIb2d79M5kajiq5LmrI3Xjgkvd6riS6QLAIk2jFdJR50k+2r72
         vIZlTOBjfw/vIsfYN2EugMkC7c0jAMf6wBpTBOd/1V/LntrG7bQczXntWC30VovM9Gvy
         lBNsF8Jppz61N0Vso+iEZZo9z3P1gMpQk3l+4tYnuBx3zefyLsSAXE1IDaCVAW/YJd62
         PUIq8UJwHX/upyFV9Za4gnN/zSBdsnLi/86gQacDXpPHuw1bmJBDMqwbGhJnaWvJsw+h
         MsMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773324776; x=1773929576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eOWrX69/YZe4aFBkH+waBiPUXBOMXCfZ8Ty7gGvlRg=;
        b=SojfnhlosruICIDHrT34kuOviz5EgoPYCimgfL8Pibf58jQovTKT04SFv8kWWaaqvF
         9L0qrCqSGeM2brfXliScUcPXBiXAS9YKx2MtaMdBftp0yHDxwG9E8ojQiZtDnmNnYhRN
         OHvdfG1zqSl2yRjCiv07Prj7sELdH1bTVRg5Xvm9w63y2Srhosl4wsHPMOn/Jtpra5za
         hL+Tn2MhochJfuWwG6WbBs1+1fK6lQoCSTCK05qbuQpula78nMjvNOB9zmZDwzlPQ85u
         Gl/pOnzxrG+levfU0CjGCKCu81Sfo+zs4Eu1EZxWbxDkmDQz62SZxSDjjWdytcn5IlXq
         3GVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324776; x=1773929576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6eOWrX69/YZe4aFBkH+waBiPUXBOMXCfZ8Ty7gGvlRg=;
        b=b0Qtxeom2rNMAtsgIHmJL98ljqAFlfMz8y3aS7qDPX2tAAkCWNZgR2GrV5ACgoD6J/
         g+fPXf3dQ3uBnioQO6cTOE1L1mCkDlYhZQbvHJhiENf2gs7ScTHa6G+yvj8Ge+rqnc8c
         Y2y/vK1jRYXVHxg/FhDoIsoDhQ3RXLfZh7djypIfzQTrRU0l7GLvhvSUvJ11FBPd7lV9
         my5L8wT8HpuXbAVPaBv11i8Lrmp8gRTLGOMK1MeDE0Kaao1DeWB63MbIOvXsCnY4uMwx
         wTZ/OmjPMEo0jel9zVjc0wTIPjEh5a9j1wUOqx/RohqTYl+v93M9dgAlyUclac1o6LMq
         gidQ==
X-Forwarded-Encrypted: i=1; AJvYcCV11jlVwqqjCMsv/pRBvXIxkm2QzUYaos95gKxzQhe2EQowy7oUVUQegA2Ju4m9NuPmiQkAoe1tDhqTQjlnGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkmmz/0iNGVf3exjP+K2cQ6JB7/N2zYY12NjJSssRKUjD7fJp
	UDaxCy6zZ+CtsbNOC0yNEw/BGiaULuQghrERW0c/tqMIgIrsIH9IaNKIfztFrRAoyNbCDgEH9mK
	nW9XQVLPtWndamCc/lkn87QAnmYq7JD4=
X-Gm-Gg: ATEYQzx4sFuIo4FfR1+36lqmR7PsW8qwrZoWJysDN3rvce42yxJypn6fjFtrC5FHLkf
	H6T+qxcFaw0KTE2C/kTD/fONGZ2Rw1Xjpu5zV3DpfC4UmR43bw0pNndx4yeCugBEZBaHtZy+Xr3
	9Ym/YHK7dceC4w3jzdjzMEzsbXJy5yC33c4Lxmgg1rzla+IG7BkLrXE78CexCotQ9IGm9k/xjaM
	qzsREQCLyfqrmX/Ew6FqdT3zmfs419iaJRaI/xbdPe9Chgy93GTJUPxAENaVtdF4AjVNrYy/hte
	yKr4v6glsDsUKf6Ph7B018I7stsULF4u9racKf5RdgzOt8leupPzKWmraJGdbG6vtF3VQE/srpZ
	QzK1ZlHq6oSWWCW/BT2WK0BQ=
X-Received: by 2002:a05:7301:3d18:b0:2bd:d17c:b0aa with SMTP id
 5a478bee46e88-2be99a92ca7mr517960eec.6.1773324776231; Thu, 12 Mar 2026
 07:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203221224.GA2703490@ax162> <20260205131815.2943152-1-mlksvender@gmail.com>
 <20260205131815.2943152-2-mlksvender@gmail.com>
In-Reply-To: <20260205131815.2943152-2-mlksvender@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 15:12:43 +0100
X-Gm-Features: AaiRm51IHWWN5UTrr_5ZnPWocBFehwqVL5SrUFu_N1GxcI2hhpEBsuGv-tlBNm8
Message-ID: <CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] rust: Makefile: bound rustdoc workaround to
 affected versions
To: HeeSu Kim <mlksvender@gmail.com>
Cc: nathan@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@google.com, charmitro@posteo.net, 
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, nsc@kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, stable@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 5:18=E2=80=AFAM HeeSu Kim <mlksvender@gmail.com> wro=
te:
>
>  # Similarly, for doctests (https://github.com/rust-lang/rust/issues/1464=
65).
>  doctests_modifiers_workaround :=3D $(rustdoc_modifiers_workaround)$(if $=
(call rustc-min-version,109100),$(comma)sanitizer)

So I was merrily going to apply this, but sadly, this is not so
simple: the patch doesn't work because the doctests (the variable
quoted above, no the one that the patch modifies) need to take into
account the other one, which appends the sanitizer case using a comma.

For instance, for Rust 1.94.0, this would expand to just `,sanitizer`.

And it is not as simple as adding the flag there -- please see what I
wrote in commit fad472efab0a ("rust: kbuild: workaround `rustdoc`
doctests modifier bug"):

    By the way, the `-Cunsafe-allow-abi-mismatch` flag overwrites previous
    ones rather than appending, so it needs to be all done in the same flag=
.
    Moreover, unknown modifiers are rejected, and thus we have to gate base=
d
    on the version too.

I would suggest we take the chance to introduce the range version
check, and also to gate the doctests check up to 1.92, since it should
be fixed in that version.

And perhaps it is simpler if we split (expand) the cases explicitly
version by version for each variable using conditionals with the
version check. That is way more verbose, but it is way easier to see
what is going on in each case and to later on remove the cases when we
upgrade etc.:

    ifeq ($(call rustc-version-range,108800,109000),y)
    rustdoc_modifiers_workaround :=3D -Cunsafe-allow-abi-mismatch=3Dfixed-x=
18
    doctests_modifiers_workaround :=3D -Cunsafe-allow-abi-mismatch=3Dfixed-=
x18
    else ifeq ($(call rustc-version-range,109000,109100),y)
    doctests_modifiers_workaround :=3D -Cunsafe-allow-abi-mismatch=3Dfixed-=
x18
    else ifeq ($(call rustc-version-range,109100,109200),y)
    doctests_modifiers_workaround :=3D
-Cunsafe-allow-abi-mismatch=3Dfixed-x18,sanitizer
    endif

Cheers,
Miguel
