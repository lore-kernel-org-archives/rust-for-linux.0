Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABBD3DA5B0
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783521; cv=pass; b=jclPrp74xIys+Hl9moc+CUd8Vl1uL4CByhic9rJumx1oYoqFoLm6p8ibATr2VhmTgjO87x5c1n2/yt/03ULSLIzLkGxLZ7sL4JtQ+DnWugVFgUORUOUy7B1nxpQ0ahjQ9b3OHICzNNaP25fjJpwV1n9sOPSwnIhgwM6ZNvaJitw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783521; c=relaxed/simple;
	bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWBsfqgph99prz3vp+IsF5v2XBaI4rFoQHOQRoMsi1w290r9NVesrWp6d3ZO5DEuKH6C9k4FzWMzhYp/ed/J6avZXitbCmfwbRYVUDV2m/OkMYQKepnZO7RKHmdDPnVVm9pB7zCO8mrAu5fpdyIrHq+eq7HKylxQ3bOVyCvl70E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaFszFYD; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaFszFYD"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a3ffd11fa2so390407e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 07:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776783518; cv=none;
        d=google.com; s=arc-20240605;
        b=PlObJ6LQNRBENIWyfKy+tf5qx8ijYyNqzQswazoNLB/PYhjwkh6m+dHO2oyILqihRe
         zpjEJ7YEnYCtXppEsfNfkzZ/I8GWTWSrd9TxW1K4mJHtWluRJdw9nQqwHjTfku5w1iIq
         lQyOqTnVPK7ABWO00yl/s3Fhf/zwcWpDxOnC/z0LlFOlyg49DcwQ5k9VBb5mmeoBZNsS
         OlWZjVrRuTKV9HeKJTMx6aWjHYOPvPxvdZbsDi7a9tkYubl1Lw0Lu5CWnjNZ5Wv52JnJ
         r0ndKnLmdLNdEi4774n6IZVunx6Crhhu5DALbO8AY4jx171hJZSdx9EeH923a7tS0fI7
         yalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        fh=K2YcyZSFcx8mkdI1dgvzcQioSy4s/3mNNpNQIPKsrRc=;
        b=HBiSumC8bCmKj2kqSrqyp79bGRhr2AQVOgzf1wSYXuvYVv3zvhB+Xz51sCDaggRj65
         W26yJ0XCYA1z7VAw3a/7bHth2Tdh0p0m41uVt1kvaEgb4vikyKoC0CU9gOAdR6audsLG
         DW3gatrHU31TbEJB5U1q86762le9UqlTxckEZsHVHQHlQP0q0GPvCkYTqVqi+5OuLIfS
         bz9oq8LGwT97XxIsoSI/c8t2a91mGE/hSA38Vq37fVNlKWHOAIsXMTPioN7pMI2DsZVp
         S1LAxpjM2TeSiE9nwGF2+MKfOYeOazPLwrrHjdLXQEqn8qElUE6DINNwu0ecTIz0+gzH
         OdPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776783518; x=1777388318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        b=JaFszFYDrshnwzFa3kQyqTJBIHAvDFqsjJcqq5bLvELWN0bwQQ/zDZ/tY7pEZdp7uo
         TxFX7zmJhMlmeQy64Lf6yyBm0n9V5P6D2Ik/De2Z1Z4hIH4ENXJP56UmkPOkfWNokCjI
         9wjSgCuEmpELtoGvM0+49oveIm2ECy394HDPeb7qhNxnB12/laI4jUh7gN+8U2vAlVDK
         V97lLZLHpAFw+PuFqlYZ6SlOUO+ci/Dwa8tJKgUR2QtKKBUEEedxxxHYztLe19AzIY5L
         5UidHlWqhfyt/zbea7e48poCO5Eh4VKb3j0PTITd73ELQLaep+xll1HTfCdAQwYjfD9G
         KR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776783518; x=1777388318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IktK0Ma4XtmCMwxrPYV5R8Ct/afKMQQHV4KvpEVehJk=;
        b=sLbcKet8o2hO2xe+9YkWUYbxyFik3okIiP0DpcTrvDjtyxRD79UVpiNdpHzPYMLAcq
         wCNdUZ5rI8M19muLPFR7CHfVKm2VcrutAD7cNnb0pKV9RMUC7P9l2fh/wYjstwUf6+Rf
         CZe4SWGyl8shTE+SmvKylt4OCPUCR40gIxB6qbWhe9pVE8raDWi3gW31/S4lHoL97jAc
         TtFQRqtRMDS9yhpRhqeKgzNs0gJ918NGm2dTxwNfgpHBeKVMZB3H3YFRQsbFujSLG5oy
         OyWZnwU/PNM6vwLfa/bJjsHmiVJ52+tsM9hl/40V5EGJSmEpVCY0BUf/cHWY9+WtSCZy
         kOGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+egEQY0BB2G/VP1b8v5nGkrjzee6/p+WpE21swo9tTY91x1/PJ04/MN1kxI6wOX+NexgbrlTQYS3tef1Q7NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZt0YbZm98xVzAOrDxvp5bTq3QHyvcb8nOxpBb0+NTbBYdYYF
	YUG8RHi712jtJpwpmPiwwkDPM2y7dYjLJnXPenzx1wyc15MtLRBdwHN3VMbAJrOUQ9JKQxL36nK
	nCLbn3W0dJq4y1lkGopj6cfrbo+E2mqY=
X-Gm-Gg: AeBDieuRfhPKv7J5DZAd99y2OrGQYgXmwxUhgmLznqd8GOcXFkd4qJdQtKj+yk4gEih
	Josf4EzqhQHz1Hi/xLaeaB7hC6A0F6fM6pyv5dPr6XhwtBHlgHsafi3kygPmuqUD6oLl3h2fsnp
	3Ikwdt+/PPYMk+EIdJh3B1QbMsW9pEm4EyvX3See9nI2GExYKvyPNjr7qztWvRqGty8PhgcrxuQ
	WvMlpWFzXOFPHCojUNCFh4x2vbK3H4Efa9Q1/P9a7hDMTfCZJCT6pzkxOqBDdLeTxY/CIws3IVp
	dIAWP99ugUuxdeFNaGBMN8R/qDlI+qzDYqPYPdNGq4JZL16J2cD0Da090tMA4Cva91ubNMtiuTl
	jpzpsZv56/IqF5rz/FfpCB9qcz+RRgZ3qug==
X-Received: by 2002:a05:6512:3087:b0:5a4:1099:b16a with SMTP id
 2adb3069b0e04-5a41728bbfdmr2620883e87.0.1776783517486; Tue, 21 Apr 2026
 07:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
 <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com> <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
In-Reply-To: <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 16:58:19 +0200
X-Gm-Features: AQROBzAd0frbr7R0K910eLnzr-MgLF13a89W0lNL0YdA7DVIARYBXkrGGHdY4e4
Message-ID: <CANiq72=P+bA_eR5xd9rCXio_kBY_p8ehgRyCWN-KTpZDVfiusQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 4:17=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> How about `const BLINK_DELAY: Msecs` ? The unit would be implied
> through the already existing type alias `kernel::time::Msecs` for u32.

Ideally we would use strong types for things like this, i.e. Rust
newtypes, rather than using type aliases.

e.g. see our `Delta` type.

Cheers,
Miguel
