Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626061B652E
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 00:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775263032; cv=pass; b=a4UwMhDcFspRJAe1BBmqk1YHwPclNtWn5zTvYaNEYQgS2nzwCi2rgIOhBoxPK5DisUvvaO882lJT/FtLpJjSDs9lGx1iB6EGXSy1CriZSChv6dcBCNT/sibomaYn6dTXQnRMSp8LDRrZ7+sp6768hweqiDAiVJZELv2846uJli0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775263032; c=relaxed/simple;
	bh=GzpO3f4ynSasovRbUcOl5ifTQbUlKzWdGoSo+Piixf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1MIZaKSmKyihjIsgGgz0ETIBCIf+o1nNhSaxdn55s5njLUM2+2HBDGmBU25/jhqsyqfWKYt2qHczZeSuggZyCF2J1j1sSDwlF9b33pcsu63BfbLzpguZ5lxAn1y0YjhNy3MYvk0L+iaptL3iGZa8zeKkEeJvo2juhiAWfQMDS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axKTX6xb; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axKTX6xb"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so86023eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 17:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775263030; cv=none;
        d=google.com; s=arc-20240605;
        b=eoScBuSyRPlZvZsWN7Zd0gqn3QjtG6NKfmvADrE0Bxyti0klJssCZQqd8m+JVTYpC+
         V2ZzTmHBUfA7GRX4GeuzSb3gAAFAVcbSHjgTbRCSj+IAShZVreaSrxL46Gjj9z/Wgowm
         beMsa6YLU8rsFPI+873FgRC6LXetCZagS4eQSqQHDEVdy7NXZooZfnxepJZx6RVQZWaa
         A7d5STSwGrUOSExO7oWUXze11k92Bah79tlE1W+gX42VsSccO136sVSASggbXr/61BCn
         ghpVNgRvhjX0hXBTbordKbB9jcDyBWzXZmJKBiCXEAb4UdIMCdJDxt0Y6bwCFrEsJQGg
         PuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GzpO3f4ynSasovRbUcOl5ifTQbUlKzWdGoSo+Piixf0=;
        fh=xWAv75EWwet2hgnolGELJsT4EvtuK/8TiGkdVCxJJe8=;
        b=EaRuZWqzWUXjDX5cZjFjLU2/jMFq0Q8V89Bxyun8dh07SQYnnm3qhmd7GagOg24QIX
         hsjZRkC6KNEfgsR6La37s1bJhzrOtD24OiY6+SLx3+YLQgYUSWlOrM/VytHEiyJPmYj+
         CtPKWcRAV+9VCkMAeZh+A9OMQnowcDOp73ctoaeKb7rVm1mNiow+eoYcTdW+ab4KcX+8
         LzqtpGvmupSAPcsfaZt0w83eQQ4xfkAwZCKju+fA7R0/oXU1mcUEzCuCNvFlyfRk231V
         LNLyBHwIQQ89O8okL/g16PM1N/Wpz8ENpOGLNYd2A4SEWOA9pIoQ4xcn7n2DIFGW7Nz1
         DoEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775263030; x=1775867830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzpO3f4ynSasovRbUcOl5ifTQbUlKzWdGoSo+Piixf0=;
        b=axKTX6xbWy0YIM826uJHMyPpMRGnDlkYSQr9ZyYwS9ZP0DljPhBdHmpczhCMRSaTmz
         nc2ZS/C/awAkORhnnZydGl90CuH5ut8qVXoCENokYSXt7UEIBAFiX3y8MdFbgIqXHjcr
         Rb0oUkYgfkKIQCpD5F0XT7mrHN85xzDzUH9U712mT2RsPKwWXllh89mIMDWVifP2RFW/
         zRfizjMo85yf/pTASkIDbdJfCFWVV8WjeRtTYsTjMXAFsqjSDQMUT+B6E5q36oKIW7h9
         XLeI5Qgim3o++43v2iwlMSHSEldHdel6ZdXb/jJbA7HHsPOMqSv88s0pm/+I+yEAUr4u
         fZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775263030; x=1775867830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GzpO3f4ynSasovRbUcOl5ifTQbUlKzWdGoSo+Piixf0=;
        b=EAYx/Lct219Ng5E2eOJJ0G/NT0QHB+cKJsP9neSEpJ51hNaW++dOor+fkFWtoWvMJ7
         u8WRhU6GaOWTYDl0wFdnEqAT0FAGDPrsv/YsQbm1N/lhKzHo8dxzNKX+9kPCC0wEH/Bk
         fYqdqs0ygB1XUuw8GyV6vn1SdYz3OVuhevurb5LsoHG19N6h299e/5VxP5mpBpgiWuyd
         nhSMVdrGF/eNbWxlU8JwYbIU6pEaDDPC7K9Y1szVSE/p6He7xbCwSUbzDlcq5LYLvcK9
         gzEf5M6jECFe4nEhnzt1RfeYWTSCUYP0HtXlau+QzUvgL7eh6ElcYs0THyG7jC30QnKa
         zDEw==
X-Forwarded-Encrypted: i=1; AJvYcCUye18Sp8tz6QIHMfAMaWjo/pYUHo5+LpsCLDKsBc6sEBT32ZrBi7v8OkKHy8TC/dw3zxoKbk5cHD/+qroQFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq7VPZegCyvhdPsXmzBmur9RuZ7GyV58qYdt89p1zkTX7vs5QB
	Svnn9ECDDqlCPMlYcqeCgqMac6N+NHUeifm68zHAE1Gfff5PLOmQUGj7nGpmKDI0vDZmeVBBXIB
	AvN3jPLavPpmEWbdf9BXujfsb3mtcE50=
X-Gm-Gg: AeBDiev3GRz4KPDMXsXskgy1q4o1QDSKcaTZBt66F20CvrO0uYO9FTMdBQbThG7OApc
	ZYubPSrbA/nMDGiqdHDBX6X+/0mEEgNFOstEMerFuFphl4F5Hu46/w/IKu8LkXfTfn1LDSnZPqs
	P4aCio+lujRIQu7WpdGh4eI3vRgC3xkDcoOy6SPDJ4ukylfszfXS0/TnoNI6klLFvGKpFfc1/oC
	5fz1iDmWVGhg+yavZRbA4JeeSj/+IFsdkmOuE33yJAgaPWbM8WUgMPVCYMGtSLw21OzP/xyXugi
	Sj2WDU1xLIAOpC8aA8fYM5c7WJ+Fwb1eJ4WA/+yZvTqx6qmjaXo7qo3BHV1kQa4uSrCgnAqbHA1
	iGr9aDkHPZm8Nhl1Te7FOUX4=
X-Received: by 2002:a05:693c:3005:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2cbf96f8978mr1130174eec.2.1775263030372; Fri, 03 Apr 2026
 17:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404000254.284467-1-jhubbard@nvidia.com> <CANiq72nZv=yPswYJ4anOxhe2Vt7rjBF-5dxvawsUMWDrq7jMqw@mail.gmail.com>
 <19601749-9e89-421d-a2df-399b3758ecca@nvidia.com>
In-Reply-To: <19601749-9e89-421d-a2df-399b3758ecca@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 02:36:57 +0200
X-Gm-Features: AQROBzBlrRgdcumyn0S-9CKYoaC3rxMOVTrldUHec5XYnnNW6Ub4Lt9HDoHTY0E
Message-ID: <CANiq72nbHtFpqgC-CGyLULSH9C90U2bw7bmovscqffd4HP0Oxw@mail.gmail.com>
Subject: Re: [PATCH] Revert "gpu: nova-core: gsp: fix undefined behavior in
 command queue code"
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 2:31=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> I was really confused about which cycle 1.85.0 would land in, and
> still want to confirm: "this cycle" means Linux 7.1?

Yeah.

> That is also good to know, thanks.

You're welcome!

Cheers,
Miguel
