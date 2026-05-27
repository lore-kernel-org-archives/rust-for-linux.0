Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642533DC4CB
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888297; cv=pass; b=UEWWoeUsYHHFPaZNBKZNg0By6YKtkLIZxWKwHVcYi573/U/ESc/gfZUbv6dae8luKjdPxhWq46zUt1TsYETKSsZiwuS5QYGlkIGfYMwHSyjeUkjrn7lfyYYBSYleFUdTUJG3X/4PR1VgXAOdv3pOFAnOxSLdL/Awinv/PXYWw/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888297; c=relaxed/simple;
	bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkwkaMpKk60rCA+AO+7HBVcOZ/C58FbwfufCdA99rEzP+mCk8zvDU79dnhw36ghdp/AYc6f+7VprC/Gw8gzZ2fnAiBoYDY2tCQia1d8zrH9T+dgfq+o1NTsT/pOgx5mJH1SN0MwJ9xxMPxdbqzdv4jvPyxOU4QX2ruMlassn50g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNG9IRwU; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNG9IRwU"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f6e6a0a215so1033083eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 06:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779888294; cv=none;
        d=google.com; s=arc-20240605;
        b=Ct9riYJGH+2912l64jwAMJn7vi1avTkcRme22KgamWrBPVpnFxbHiDNp9U9zuoXV57
         u8YARuimvHQzmSP8z7C9Msa7wfXQdJmOwBaTJEiC771XQAuek5ABb5Y3Td6jzBiOBs+Y
         /8DVT6SdJiWKY07IylfJkqS3okNCcyzeJv0DXD7t3nm8o9qxiWFnh0QEwxr7JVtRSpPd
         NpWgYbyLpSlunYnhDVw/wclK93dl96pXDs4VKfiPTF0eXqisN0M/brYrakI2dWC2b9po
         NgyA3u9OjiPYCkrsTmB3OFDoe/I+tiysufznrKJ+bm/6ddnLIraCvkLoll+KGOE4zUgY
         jD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
        fh=lKW2kpHjUpumDRQfvaizuXofb57kyKRAddZM8EO1/To=;
        b=igN+cTVbn/w7seqE0PG99deAfxIUOeBwUsMCde+kafzvtwSUWL+TsJ/SUzHADmIvni
         eq5z7688Sx6OyZuhUwLFfihanqIsUNjlw/tsHkLICpbIVhE2tF2C6Ozs3FNF567DUATy
         u/QU8SHsj4kAXBOMyq4fS1hE3YgPU5oZu/1rfEs2tPCJX2sD9m86ywKN2xmKD+xqycXN
         qcGZpHevkhXzVz133E8M87s6cdwLifgTJ4Q2gpWVckAI6Ag2Snu0BLAWoi1YQOfYxpQ1
         3Dd4Ik8+U7ktyp8uuh2Ey3EG5S9CUUzu3ctH5NxhieSO7s1h5woIKFi2c61kv1pIa3rS
         dL/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779888294; x=1780493094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
        b=aNG9IRwU1/7mOiiz8Vut7+pcNi7b+RtJnv6OSiCOPy4Zvps8/r3LzyWjy1gFH5vT0H
         Xp3K6uebnVsUSvWsSroQP8G7ToT9sFb0RiyWD+yUw8lLJIcYLM5ysQgZWe7oPU8wGARu
         x6isdwpK3RKkrM36WDPJgZWuqDmuHPoVk8O4QyIyKKmSy1v+nBK1JkPWO2ib13RduEUr
         Yp7Y1qHz5upBY0gnBCiWJTTw0p1eNnSsMwUWVZ/I03KY8v04ChgzNJhRycJxfuAAHmIE
         l6hDrJkAq4/n4qryv8Zz/kLiO+2JCArPe6SaybcNeQ5pW8j2eOubYkQkrQGtOUsgROBU
         sl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779888294; x=1780493094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y91SSZvO94Xs78m4//mfKNGP73pabExBH+dm5zMT7hU=;
        b=qjzSfzqkOCKMPCNP1hMooSu0gxy5UIo6EHoH6zqFHWciUI3bcyPyBCsacX5Vy5qYQ9
         bba/GgsAiWrTEe4HOtJJUAzthHHBrbYaxe0dZCNG+Jy+WAzBdur2Q16eJRJkyzmfUYX/
         v2rPpeSOAx/blm1D2jx/Y6z/NW0btdSn7iv6jOVgSyTiCBDJtDN+B3PoYWBAz89OYpTS
         s+C6JIjW3NYy1l0K5jZb+y3HUW7U9hPomCxlFvp+mOFr0kHQ+O2PQTEGwUrCsykI3Gsn
         D1avKSG8260PYSC/zVM7wtc6uPJmxn58qy26WUwKeeaoRrNZBzcOEFvRpBDGBBKd2UEs
         UzOw==
X-Forwarded-Encrypted: i=1; AFNElJ+ARVYCYkG5CcmtIpna/wkdIGyq1t9Rr9Lu4FYHiE5qGtDu7gm+UPCfB1VL+Yunt2Ds6BIedwcY6kscjRjxcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyACAcA+/fLOD8i3sSDJkb/q1yq/1wMKtgM+qg1XtToEARitb8t
	XIp4jpV2+r7VWa71/Olwvivhgc3VRP3twmC1MtfY8QT7VQn0h0eO/ZJT/oLEbO134CyTBpz2SRY
	Bl0j59VMJm0J6PGRtqPW5kMn0Lu91+fo=
X-Gm-Gg: Acq92OFpoOU5IBCOPJvX9g6X2tZaJev6nMS502g1C5xZ7Q2k2QuQ4c/cyPTi8rxBHVf
	tfmFd4bjR09eCJHSFvUT6g+i0Cc3bTBDKbCTT/ZgaXvHwzVwTYlPEVQrE8zAWfbahd5IdQ5A8lX
	89UkSoqZLopv5q76vMiY0mwiLzmWLREosjSBC0oR7/oquNWvB+wHeQdHgV1mrjL6CiStEG5weId
	2MVKTjzLE2NbQgrby6FuNH6KXBO+Znpg1/skrqHuoic5KGlpsBAMwKD4dpF46p/eoBIZTRf44LY
	KFflWn7yOWUqokIqwr7iHneT5bwHaGm7YNClDVBaRDYV2HmYA1GGrRHpRO2cZLrXUpKKcMzqI3U
	iaAwj8NXLSIFP5Bi+fRGU80TABxCWxR9A3A==
X-Received: by 2002:a05:7301:3d06:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-30449040654mr4461690eec.2.1779888294371; Wed, 27 May 2026
 06:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com> <20260527-bitfield-v4-3-e8821d4efbde@nvidia.com>
In-Reply-To: <20260527-bitfield-v4-3-e8821d4efbde@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 15:24:38 +0200
X-Gm-Features: AVHnY4JsqmQr9qwBGoMiDhQionqiPv95QMqmQwU6hiT2GBpgjyTZd0EHweeVTfk
Message-ID: <CANiq72mSYh3TbVHTUvze5vs1uqJ0UxTBUDyUwPOdzPVRsLiRbA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] rust: bitfield: fully qualify types in macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 2:52=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> These types were not fully qualified, which could cause issues if the
> local module shadows them.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Should we fixup this into #1? (on apply maybe?)

Similarly, for #2, I guess it may separate to give credit to Gary (?),
but typically we don't create extra commits if it is still not landed.

Or what am I missing? Perhaps they are intended to show the changelog (?).

(Either way, thanks for this!)

Cheers,
Miguel
