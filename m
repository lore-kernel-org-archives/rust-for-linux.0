Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF51443A87
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450865; cv=pass; b=IyKdJdLInVkNYtAe/notneHJiDHIOHFZkQWROfeGJxcedzIIJunqQINPR/XYLI2dAZTXZgVdQ2i/IZNBFzll11/OhgePdeJU+Lto6XIkGwSFN4LzJ3oqErD8i1CjQAW7G/1l+O/F5K/gmka1J0QmGfPbHXM/m1C5cLdR2b3Vj2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450865; c=relaxed/simple;
	bh=ql8A3rtHM+NQUqrzlSVzJ05Y2ne9Oefs6MH1bVuRUnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lb0/4oyRx9/GPOaVIiFPK8tHwLIDMFnCn4TM9xCdOofotLiB7+DgOM89ND1ixiEossvhmb96wqHRwCWQsRdHPpNMBrxztzXnmvSj/INvDUxTj1p9DmiPiMzjT8/DMLVruvjXbmYjYufMRqX2hsbG1LJApY95ICghbOzBwF08TQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgwV61aI; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgwV61aI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccdce28edeso3824395ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 05:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786450863; cv=none;
        d=google.com; s=arc-20260327;
        b=Ez2/D4vjsttQp2siFlIIvFz6abd3HYt7y74Ywssn179cFS2DAeBRLGPkBr0OIF7rxh
         CAj6e2kWBShAfIa3I+aG+Tl1+IoWDPDSPXW9PSx3bkDvVtWYfBqBw9r3/NJjiy5KnVwS
         EIvdxOSxdAloC3FSXvTlc27wdL2NA30MDzBSwjlSXqG7Cw4sCl2WYNg/dEfnzGFOMwNy
         7uIcQkJFPh44Pm5mzSsi25dY4YpwEMr2QQ2R+0BtuH+AbmnnbChQQC96awsZ/By+biAu
         FfX9T/BLEt6vsz6jcjdF440B4RgSLRrTloO7M/3q6dviz3Qoc2dkC0hw/f/AKGZiuG7F
         +a8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ql8A3rtHM+NQUqrzlSVzJ05Y2ne9Oefs6MH1bVuRUnM=;
        fh=d9ml9ul8d20amdoQSIG9gw2jChjbT6IV8FK4bRNrn4A=;
        b=ZjCHSYposG74+l9aN0PgaNXYmCogaSklWNY8Eoq0WdENg774ZHo95+8Yw1IcEGZPZz
         adMZYHeoXcyUEL/hDjcNfLIlcpMpCJr5+Ar0nkHrp2AWcjm8W5dGZ0KQMUoagEJ9E//i
         VDKs5OihsvjorFf09Azg9hKPtsvsQrKueIWESs/qHUIZBSZGZ+LYTLSnZzwqp+fAQpuY
         IiSlxPW9LZwTyifFn8lJ1NvBW/VC1hxNj/f+0U2jsmIZ+wtKxTc4ehSnFjP5/0mhhXQz
         G5rkPkRUZX3LEFDZqTA4NQtUiNyIf2Hi3xTdY55mw9OytGFs8O04TSeW4mKE8tUvu0VH
         fIig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786450863; x=1787055663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ql8A3rtHM+NQUqrzlSVzJ05Y2ne9Oefs6MH1bVuRUnM=;
        b=jgwV61aI49T8CTwsNMQgTMM5NHJSH/+xg8JK+oxmoZXXwZDq5+ARrVFHvzTex1R5pF
         UcbbuDK14RET/luK8VwV5Ix+5cIEit19wGH0A9LqMEkSc0aRYWrvMdhhIywKt3NJIzJ+
         xipa4N+KZYk0BrxZBevyJZIIeed8y+SUH9fG561eDxKXVzp3/HUM0C6PHRzUfFrAWy9M
         A1Y6O5oLvEN/4ZgP99ztGeo3T/Cu2e5a08e5Iv/1XAx8aFvhKVBvja7ilaULk8eHoS5B
         zn9SFM5odi3KOhS20wJ44Tu/EEqNCjcrqOa1Pp37qjqchQK+iPwh63+T1JmVeG1aO0pd
         awog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450863; x=1787055663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ql8A3rtHM+NQUqrzlSVzJ05Y2ne9Oefs6MH1bVuRUnM=;
        b=VB9eunCgdMtLrduptCi6nB2jmfMIYWN05Az4Qo6hyIAHSOZhnKltU2kfm2TROvJtAr
         v21IM3dWXvuCJ5DAeaMR72viFK0vaP5HbBuOJPFOIeVKIOrppGifrU0oClb/f7eNdP+0
         VtRMg/anWj4Y016iC4tcek6UY2FlTxDdmuW8dnTvg/u3+ZmBq0GEbd0VzlernZ2qdmDN
         ZdP5ZqZSbFVF28MYslsqDcC+69V5nIwfwTQALhAW1AWejF+vQcuzR5kGK9aCIGkkuoPo
         t37wvduq7qgdquqXwYo+xV8sedOGwSPn6RYLNdv0hPwS46EbPdWf6OSUyM9rZodSVoJX
         /RcA==
X-Forwarded-Encrypted: i=1; AHgh+Rqz9Z81/ApQ8vxAyStZlCmZKWTxh0xAc8MylgG9fePOi/vpfUQslnPEkz9b8rLYcFa2Z+bwwa7+Goxau8Y40g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/bOSgY4IgjCWBtNOQYlc30/jU0Zr+KCrBRKFXEmdUCeHJpHr
	mhnLleVYwythBx2QJ1f0C7EjpGwESo+U2jvfpbDGQc+I4Uob66Pv2KChqyM3DgwhBabCtJZzvt5
	FPtoSyOSULWaaHqWPWNLv69ZC89cN9L8=
X-Gm-Gg: AR+sD12/xmYevBy1AQBCv/wxH4Qk9MlQbMmk9y79coA3+Faq5IosYkmhtQPGRE+5mrv
	1MKkWNZozppME8b9Rf5Whk1Z0xT+XE2BSJnVm2IFaQBxHpqUzNeZLc3mJhzn7semH8g4zAUG66x
	nKaBG274xpDkgogkk/bg7NZKRP+P89TJjosiPgkIsITZFiEHDIsjDey969wr12kMbr0mTBfWGmK
	CQGzYZgdqJNQG2jZH8+ekt6j+FWrnv2yAbpX2fZv16HqMMzRWWEcDAuoWewbhbrRT2V9B1zpAiF
	h5z23DqnlWdOfgU1itAmmZIl4GhuYPByd7vD15e1xS0K6AlsM6qFozi7qtJ6bKm2s7REcYsX0Jx
	BjsmoCVUYkuS00yxTpRIXBAfAQhS7TLM4nR/dylbrdyiOswa8+Dl1DLQjKYAwSLszuMJ0bNE=
X-Received: by 2002:a17:903:234c:b0:2d3:b3e:711f with SMTP id
 d9443c01a7336-2d3176158bamr22126975ad.0.1786450863209; Tue, 11 Aug 2026
 05:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-gendisk-owner-v1-1-c0fe4a449ecb@linux.dev>
In-Reply-To: <20260811-fix-gendisk-owner-v1-1-c0fe4a449ecb@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:20:50 +0200
X-Gm-Features: AUfX_mwgX858ISyRxSrju8_-iXIGhuGuoOPR0M9UUR6UmwVl7OxBtn1Y5PK_2mc
Message-ID: <CANiq72nmthEu5HQG9B2yOgLvhEJ+PMO7OBG-ki2uUQiUTTgciw@mail.gmail.com>
Subject: Re: [PATCH] rust: block: gen_disk: set fops.owner from driver module pointer
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:51=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> This patch was meant to be sent separately, but I forgot to send it.

Do you mean "not separately"? i.e. in the series?

I asked Andreas for his Acked-by.

Cheers,
Miguel
