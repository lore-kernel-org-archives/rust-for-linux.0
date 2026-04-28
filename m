Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B6A3D9DA2
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377084; cv=pass; b=qYbxDKEw1Wscs7iktm+7Q69//yzH0ujP+st1Q0LXJ2QLCeCv7VV8qNakD/BhRQge12PkW2/ImdMwC8IALCJJbAlrjVtufbaQQmeR3QjK1Zro1iGUqpwQucgyEfZTxVyVxtBY+0xPkqcpu5J3tNrI8mNPpB2YBoiWBqlscTD+h+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377084; c=relaxed/simple;
	bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDSqZPPPO5LVqVc8OLdYGP6M1tWBkVGgIqNo+V5u2yKS1IFAEu/QAszT1DcgIx681+MhlP/P5pdNwKfICJ+HcjjUffPy1lyGHrxdbX8cO/vJmIyrCGWZxV29Qxi639Sf/atYXuTjEZ/wp7cdlDbIP510YJeKTRgcm/3NCcU5WO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBT1du2V; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBT1du2V"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2d9b27e4aa3so685688eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 04:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777377083; cv=none;
        d=google.com; s=arc-20240605;
        b=fNV3AzzpngsfG3piiKDKqjmd2qeO7U9n7Q7CyqVMoQTzfnthWAVoaUO9qJtuF0cMlS
         kG/i5OCFT1ATy1KyhCJ/cOrGkkrDDlJsC4uIir7kzT7bvWwUEd/LA5W6zsWhMVUQSVpa
         mrXz+FwTW+Rz63RX72LS0aHF+VIaUx+JS4seSyV8zM+bBhUg1EoxMu7YHFy3DGRqzIli
         0uXNbxlE0Njcjg+gXnzCZoOM0xLFfmRh3YMCpUOmCofP+rl0zv8w++Yl7wL6bpYsWoqJ
         W/mhS+creJPgcr7UQUK2ZGLXTuTYcTIXI2Vpb1HlqYcg137rMat2N+ZZEigRRMOmxDDB
         DldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
        fh=QV0GT3bqGiXlCATGIrKbU3Ynb5aoAiRd8dDq+/hM6J4=;
        b=fITHNnI21K5VPzGJ4Ulc+cuCyeD4oXC2htysvlU6fxJxn3ITcAXT5TLo0SAtKBIWWM
         f4/ZvKkr0LK8IJOUSDntrVXn1gF0IUKAJY/XHQ67kPuP2wpHb/60vatIxtV0eVug93bz
         rqWHCV2ztpZgrudI983+kclcL187sZpF5vGNjY8MMRHN+HzaZo+mwJUZ6JQ+IIxTs+0o
         gjrj1hMY8z0yj3DxhLBnWJbtjAg5G5Zn4EYRV1SLuWkA1voAgYHSvYfJS0NJ24a6IrrJ
         z5QGhqbxS26OKtiHXxp7PUuhJzkXwyWhXZC7xo/cHhyOmhxwdHbinaK7wdHfCLpDY4LS
         rG9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777377082; x=1777981882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
        b=MBT1du2VPcosM1uWhj1auYgkyZBDXtcU0q3uRn0UaVRgtYuscxwKeLCoMRLexjMkN6
         /3XXhiEfld2SOlTQg3zBI7r/78CVn9mYxSQblYhTP38x3LkmCgcjI99T0CnRp2uoo9Gj
         8oYh09qg3kHmE4MEM5kBsFKWhZFto10Tee1J0SUuc9pC+uklcWm5zIbz6ZWEe6Pq63je
         f4DCTr/GjO9KLv1ApbTLcMYEsE9D9qdpSgPMMoxVlx5QcWyR7segCXODQ3968dscbVuP
         GAXVOLLCPhGDhKDVvR/T2eyOkomBRM4uwFqOia2Osal+MdqiNi8jo1S8E81MqAhEhfwL
         2h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377082; x=1777981882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0Mf6nu/Yyi2mO8vmqCFQQuDl4ubjEv9FtbDx7gQTGM=;
        b=k3NCyCkkRtQs8gTPE7JuUZfcCq7VJf7Br3CVHQYQ7/rv+mZtxP5Mncus8IJSymZL13
         m85ifsHvSyp21V+7Cn6LgYR71V7whQEHqi+IMdVuI5bTrR6L1hSf+ESl12CkBAJF3EFA
         02o3owxZaFjpQSfvXGC7elJ40zG7pQUhNGJ4+pOCc9xz5r8W9cOFQRZNH3pRpBEmSGER
         dxWbCiouAjnb3oq67MlMkc3SukN3tbpGjPNcpzMJwZj+v4N3X4y6S+3v3Tj+wEMSi4X/
         Z7Po8uu8IM8RxM7dwmjh1Qc9mokIlwFt4ncpH/PwAVZKGKC7qbxPOtDhObbDtHBwY8hT
         ODcg==
X-Forwarded-Encrypted: i=1; AFNElJ8HdmaOtjMV2tcdlQZtGQcZC2s3rBmSG/cRY1iymriIyXlq9EsuNocDLlz3R1Fw9vIAR3ossJR4PB6RtNZrLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJEwVeGclscKKeTs5UbzwxHFClG1GevbJ2calnAS/Su4FAXuh
	5dpBg51lDPAbll4ODsFipM3QYfM2jMBFXyA8QZs9+hT1FMLY6uvPOb+YekMEEZH5k3Iu/3vDdJN
	DJCzXy1pUTtDI9B6O01+xWfxDj8W8bxc=
X-Gm-Gg: AeBDies28uAxTDtPiAD/6QZ1qV6OKPT3KHtqC+suMS3yeJpDqZQOTzijZ4SgnZWAA3M
	b9RXzqXLWTt8sYNbAk3dbbPNMvZOKHckZzrnP0WVG2xViu+8oNcxo66OUYJGlZuGgjM31SzKbCt
	G/DrxRBT0rjOVDtwPxzX4vYIEOeZz9cexT2hTxrIEMUHbVAsE4eLIvTkAS0wThbcl2OdoUW6xGo
	0AUmsotgFG3h8FtGYoQcqpSdPGW7tX3noh7Jd+nJEzjoHLGGo3Eew6df42tW6AxohSWrbcFKcxP
	EeX5XhMk/Z0rd2UZW97w5L3SfhWAePznLcHE7cnvABiLAz/AUXHlseyOYgeV6Dbxlg/Fuj8CpQD
	9r0az87mKcxr2BCWLnsOocV+vSefZIh58VA==
X-Received: by 2002:a05:7301:3d10:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-2ed09bdc0ccmr579752eec.5.1777377082557; Tue, 28 Apr 2026
 04:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com> <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
In-Reply-To: <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Apr 2026 13:51:09 +0200
X-Gm-Features: AVHnY4I93jEEHcqLYwjkfMluqxrTct8LvxfIDurB2CADW-KHDEb5dYbjSTfetIM
Message-ID: <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Arnd Bergmann <arnd@arndb.de>
Cc: Julian Braha <julianbraha@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, ljs@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 9:34=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> It would also be helpful to reduce the number of hard dependencies
> and ideally only rely on packages that are already shipping in common
> distros.
>
> From the dependency list, it appears that the majority of dependencies
> here are only indirectly pulled in by 'reqwest'. I guess is only
> required for dead-link checking, so maybe that part could be
> made optional?

+1, I had the same thoughts -- even if the fetching is done outside
`make`, it would be still be nice to reduce the dependencies. Even if
it just means calling into `curl` or similar.

Then I thought if the same would apply to `clap` etc., but then again,
we may want to write more tools like this in Rust in the future (we
already felt the pain in the past the pain of not having a e.g. JSON
parser), and whether we could have a more general solution for this,
including perhaps even a kernel.org registry (either as primary or
not) etc.

Cheers,
Miguel
