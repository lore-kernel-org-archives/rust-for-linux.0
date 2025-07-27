Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4C21765B
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753651253; cv=none; b=r+4F89da2VzaAWqXYNrFd4ZaLdZAegZDMb9/LHYtnTlYRiuvJlZKnLvCEjwMAv1MFLI0vG22ulfdraiSGS7p9QdmldT3kfKNh22LMFMI3qM7pMBkQgRxIs/FvZJOH49qP63o75wdyT7h8W6KvUPt6XOsVvjZOsUuB6z25K73BQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753651253; c=relaxed/simple;
	bh=tw3bto1OBCQXTYqneHmsEqVD9hSmEukOy4azb3KVc28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VL2YjpvAus37Z6j/dGtw52xzT+PyIghBmUmVJmdo7FbU39zPoIgLo9B7/DPXgNo7mfbzMt9cRsYnOTwJqcvxIS+wH+JGjSIeEF0ZVsdXPLWv8S3HXTqNOuzEVpJfHBqVHLyggE7ezBVVsKE6gF89WypAmgcyCgoJPrdrpW/yCSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY705lFI; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY705lFI"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-313067339e9so597493a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753651251; x=1754256051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw3bto1OBCQXTYqneHmsEqVD9hSmEukOy4azb3KVc28=;
        b=iY705lFId7sP/9bg7pj+s/wHoIrnMKyAqyNYbVxNWOI37FjxZ/4mBTy7NfpL0xpo4v
         GPoH5A+WA2mtR8KuKQkSZUAqyl2aNNEH45+7CTM7uVuP25a6LPyDB7om4cL62m+PtoHe
         axdYw+C4QXgLvv/5cqjXsE69KkibCuHuAFmxBdoZUNFXsWTzLeRQZJJhodrMBW8qCdg4
         +Kb9QcmMqmz8FK9enY6ijvazLYyLouFBkhsGV8thZgWYNAdur48ltTf0jb24w0nWZWSn
         C2AztpeTDdkMWpqBavTpwQM65NOK5sAeuHbiuux7KIHBd0phsjN0WYoiF7yUrxkO0tLI
         iOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753651251; x=1754256051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw3bto1OBCQXTYqneHmsEqVD9hSmEukOy4azb3KVc28=;
        b=w5a13F0AHeN+wHPo02q3cUDFWvUIYANDRVx5a2Ay0Z2bx5uhSlYOeez+eI5fD5Hh1y
         Or8V2FHyMrGIdO+IIfNwDjXbx/R+sy7Ijd8jRDGQDcMWDeU3p8FTHF4i2l7mhghFOqRm
         /2Skbcc8FKrsj7BezfxxgUeIN+MCs7UVBfLGruQA/pUyYKCk3yYLefoX3gF2ZimT25Xp
         WzyV/O3lU1vH39gu41SSKZTk04mocgm2cvo33tfdlZEHzwLlJO1379F6ItlfFwfn2mSg
         9qCob8v+bPMHp9/6Zv8NXNIVGZCyTE82gbrDZGEPPsEWa6gw+tD74xbGmdX4as88mOAv
         mSIA==
X-Forwarded-Encrypted: i=1; AJvYcCXpGTcHXi3b9rxUihQ9EB3x96UVpJYzV3hYV9jjcDTYCyT8N0o2978Scden3tgKwZuV/KAKxN4p1kYEdusg7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9at7VitTqJ37CXkPgXQTypiPXdQl3BMrvMIPtIHb5lutdYf0I
	ubUNGI/st+8/3rKXC2eAZ1sT6c7IedxVGpKrUVzhF/vOaRsNTZWdTUMyMhvk5eXm+NgJm7VnMXN
	CEnTFqREOm4Jw84Lb0mVXZNQ4/mrmTwU=
X-Gm-Gg: ASbGnctxDipVeYOtoigUtOJ5spIxnaoP+4yPxvNqlludCtv5WwY/U5RqxCqRncA1ecb
	yL4WnYktZdhdRsXFBjKStnv09bilkm8S8312pSjLVVtfrukyT9bZm1y2frdV7HgDiTSusu5m7on
	5lIOPeaVjj0TlaybKwhu7ZN60VI3uisGLGjak65FhmLDlRvjjHc8AJwANJerYHxIqhs7Efra78y
	R77D5Wu
X-Google-Smtp-Source: AGHT+IHGr3K6AUdyuNec1rhFwa2/6JFHrNQg57um/C8fmWIofqeE35m/EqDtp84tllG3YDAttrr3q18BQ8nbpRxlH8M=
X-Received: by 2002:a05:6a21:4603:b0:235:6606:6840 with SMTP id
 adf61e73a8af0-23d701797efmr6385708637.6.1753651251104; Sun, 27 Jul 2025
 14:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523145125.523275-1-lossin@kernel.org> <DAI9KRPT45EH.RD7AB7OI1RTR@kernel.org>
 <DBN0E1JW5JHS.2RU9ZWYJ7TBVM@kernel.org> <CANiq72nzG98-5qtmnf6t6bKctUTnu4tbAwM-_EmZmrZ=-NeUPA@mail.gmail.com>
 <DBN4KU6Z1RRD.2PKQX314UWR95@kernel.org>
In-Reply-To: <DBN4KU6Z1RRD.2PKQX314UWR95@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Jul 2025 23:20:38 +0200
X-Gm-Features: Ac12FXyfUyZSXTtTUgQErlZznafmjVYwL_GzEEnLVY7W6wBefO16Gry3n9je2k0
Message-ID: <CANiq72kmdS4Qx+LUTqbingD4oVqEYmrWyxDRHyOm44AHn+WF8g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] `Zeroable` improvements & bindings integration
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 10:38=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Yeah will send them, but probably in 2 weeks-ish.

Yeah, -rc1 is at least 2 weeks into the future, so no rush/worries.

Thanks!

Cheers,
Miguel
