Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F9B2AE8D
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 16:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769271489; cv=pass; b=StJiugDb4QX5j2yXH7TFNk0VdlNW45A20hvQQolZCJ73tDy3Q187l1czQjvKaO9S7bMRWxoyZpZaUZz1eOcz0BaeFsWALceWZgzb5AjmAXtHuaJy5avBHpdAzcs0TDy2HIXAqIAuB0ql8KuokMQf0nTkYcxuvqfKpGiGvP8pIvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769271489; c=relaxed/simple;
	bh=ygWaBknu0whTcHKv97TQskQEI53soE5MAMu1IT0FI2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+4Z+D4RKGC99dRk6uEe92vshv8ym3yOvzoQsTvxu7JCxMbtY5gtoWHS4KODgAA0Z4LsevqQOS5O4YrsVWbqBnb7rW21Q0GCvuPjYSxMTR1Vl6/3/sL5gFV0l4UB2O2+c5WniID/dr4DJqfyS2SyNx7uSA4I7EexH/j+9NeDAes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhznTP/O; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhznTP/O"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b6aa67a792so116341eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 08:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769271487; cv=none;
        d=google.com; s=arc-20240605;
        b=BJ+m0XiFA0X/iV4zEUZxgEqZ0/Ztk/Ut6og5laGOWBYkEWEuplaai7WOVEeU+l5rhB
         71Gr1uM6IHYClKQI0e6LMeq65j9OQ4kwBcd3zUA6+5LEviMvq8xBFIKBlAnpzd3wbF4d
         4e8MuGDezOtc4kBMzIfSyLeOLNWrpa0SXP+a2XNaVT7oFZYh4+YzXPm7W9IWHuqdZOyR
         7u4By5T7WMyfHoXZfEshnHxQY18cLm8M4+YoxD0VDDN4KCgzB35eql7WxbumbMOpcHEv
         qBaAJJm17o9WWvdRiT/wBSnhUjm/icRhrg5NdxFWnUxo5dJmkZBCHUGLUXhPNMN7FxPn
         SvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ygWaBknu0whTcHKv97TQskQEI53soE5MAMu1IT0FI2U=;
        fh=n4r8g8Jr/7tUEcyGwf/j16aMVtpxQ1F403VmkHgZBgA=;
        b=VIH62qJko23WWnEf7ZMS8RKf254bCRtEIGbWpn2EcvpxcZxxTtuJr+ydk+b205qQ2H
         qlpU5IXzRkgMAWdjqUDkHMWqYUP5u6Bocb4Ch2D3RupXoHs5ij3h/cYzhcd9/COFGg1I
         PdFR62Dcttvil7LuYVl0jOWdHBxcetyOWiR/z/2ZQC/gKpfA/HNhs0vPqfB2ykB/mJOz
         1OqDW5AZp+cS4Bl4xLuf+W/GgsGQxd3HkuXMN2zlwv6r7uRgyY+t7JOgu0XQV5bT57Su
         lruaGO45xITTZ2/6ZVcKypgHU/qtSeK2uAef7szziWeStvwz1x1Fs1tR6p4LYdpghLFn
         tklw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769271487; x=1769876287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygWaBknu0whTcHKv97TQskQEI53soE5MAMu1IT0FI2U=;
        b=nhznTP/OtL1Kl1qfbqLiiYpw3lV4On3kA7pbvdfY3E+k25Agr0bO1EdpLuBQcNMuKN
         CTOLCsTX4O8DO86ftQVJKEA4qX3NFs9VDduCzswl8+BYSFxlbDWRmbphjedQRjHEtIsg
         A8E58rT9Ws35naVE/VrTgFKsYljT7X15/C2AilVM8hSLDFjWNWSyBXRon1hW0jYXx9Bd
         ShYFNN/l+ZTYw63UauqmpabiJPIZ+wDcQ6eAoR7bRLZ0qoARiYGiw/vVeaDg9IoAWQB0
         APZCnRp3X/uJMNFaWFRw6vlLq9f45Xu2IoY6M3asNXmXRKiF8UT1zpOUyPOkd1Y8B9Qa
         hsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769271487; x=1769876287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ygWaBknu0whTcHKv97TQskQEI53soE5MAMu1IT0FI2U=;
        b=c7ngPzHpitzSm+CCjmxaTojb5ksSa2iWO51CAXez7RtsXSi/HQoNAC2K+YyMN00678
         J6m4ATKADOA8MuX9YBasRUv7jJZ9vXKmFxmv2kC8YTpAgrTL2RhetG/4giZC+zABOV1j
         aRS5DXQrBN334En9UhwSESSDdeV0VFzEi+3W+XZNhr65WYTXByOeKSOLtnei9rOCbUlV
         Y9vq+Dd7blj7voWCuJEeDn0+ZNDAJ7SohKiRk73EyRLCT+t74UDd5pJV1loni1gMPQWW
         TikXi/WyuSAmq9ggXTXxnefaZ/bDqKYAW5whQuPFR+frsJfiKsoDgtvFq9eOVI7prxnj
         Qkxg==
X-Forwarded-Encrypted: i=1; AJvYcCXrrmZSiETaoPmj+zw0NMA6pPvH//PLeedfjTpCTnQi/MkUx8X4aYrnhewxdS3nVPelNKDThsqzjFQ+1YloVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzShOp/CHleUGkJYnQF/zVC0GDkyNCfjyGINNbMsnHABVF8aqPz
	o8F96YllcGpgB/P9rLmpwC8RKL4kO/Y6JMUwqABl4qVJ2ImIXDQtJYmWJLyBv8/wHXrP1++N7UK
	a/43IlWiCqB1RqaUNlTQr3o3cqfRH+BY=
X-Gm-Gg: AZuq6aI6/ieRxqgezx8NEZwPNzn+MW8LBYr+kr1zB//zUuh5/Ax/wMr6C4a+SbZCWyv
	sXHvtEOnXNNRsM/N+tl0hBxQTbRfVVcxl/ybjEuthBxEObEmYOfFt17lx5EWkilDXT10rt9mbUE
	+d1M0VTUhwHnXj144W2r/Ebp1tLaxU6EWpNJ8GA0zeIUzBjThcy8A/hY2M/QzBdFwKKiuJNO8TC
	0T25V092oMD1yDNQISiFWK9KiyKCRVLNnEUgC8n7K+m/JaBnMJf+63k8Bnh2oWEt7o1yVkl5Vhx
	FfZXB8BzrSs/Y/876FWYpHpPOlgqufRm47gCKpM0QNnFQbM0xGCreCd3jydJlxDCBY2OCFfGoXB
	znlELfMC4h739
X-Received: by 2002:a05:7300:6ca8:b0:2b6:f142:44ce with SMTP id
 5a478bee46e88-2b739966791mr2236338eec.2.1769271485660; Sat, 24 Jan 2026
 08:18:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
 <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com> <DEYMFYQH2GY0.3HF506HL8OHY6@kernel.org>
 <DF1DP93V7IQ2.2BA2EV61WUA6C@nvidia.com> <CANiq72kc_SY9Nsy0kYDa__Uqjt3WqNnT-yfqvF=1La7ox2Fzyg@mail.gmail.com>
 <DFVXYNDE1USI.3B6GIBDMP36AU@nvidia.com>
In-Reply-To: <DFVXYNDE1USI.3B6GIBDMP36AU@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Jan 2026 17:17:53 +0100
X-Gm-Features: AZwV_Qh89xz_BSFzl0Wxm1B_-xJqUdlVVVsPyy2AajAgRp06_1bz9MfnQc9gG-c
Message-ID: <CANiq72mwvMBymD1Zt74o+isB1r89kdXZiq8fmX-9vOd9JFcY_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 12:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Actually, the nova-core code that depends on this won't cut it this
> cycle, so it is probably more appropriate to merge this through the Rust
> tree.
>
> Sorry for the back-and-forth and last minute notice!

No worries, I can do that -- do you want that I take the second patch too?

Cheers,
Miguel
