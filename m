Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B9B17A309
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Nov 2025 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762012454; cv=none; b=iWAGvWUFjT8t3drWhjXaihVNxmyF4AOCNp50C1ry/scSUQcuzJU+qj4+pey9cIZkx8VOI+D2H93ht9/v00xXmLHZ1Yog6WsTKU2tZmqbJ7evErV7OEHHg2btf5Uy51ED3kkyyDN5QHN0a8ym5spnC7e2cHIWlp/cBky+anDU270=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762012454; c=relaxed/simple;
	bh=DZxrvCuj4VcRfVXQNKcqrzWO2/nyvtlkEBnmNGrmT9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1d4B1lKackRaQswtZ8deGOANpLn/uuduVzww+081yvfzkeO/PkWxwJXpYzogLwKchKBjBCeAQyvMG78p7ASVpbg7Ho5/1MMuNogNqec/HvMhUpK5rHdNfWriUnFLpidNiP/3zKFfm4zcmKetbA4hwraghL+D3bFMa2VxypwO0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9zGmV4g; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9zGmV4g"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-340bb45e37cso229427a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 01 Nov 2025 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762012452; x=1762617252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZxrvCuj4VcRfVXQNKcqrzWO2/nyvtlkEBnmNGrmT9M=;
        b=J9zGmV4g5/ijhQUpjiIn1YuahtHv3SrKuxmFFkiSY5Ebje0B/FkNsKYXucYjzbmJ9C
         qvxz1yi/RmVK0qPjTgdmzRZirzqA+ayA7mgQaU2Rh5vse1vkqlInsKLmaYuUbp6Hb9i1
         4xCIPlqftSQZcWDh8yM26oe27ZXQViWfhon+HHnmQTsfqVlg2Xg/ClLtR9bmQ2svqBvl
         dePQxvtskIgHPcEq6/G2E4FEjBNCyaFSxwqkoAGLQNujj9wZYd+qpdvMYzuxW5RlSxVm
         aE9VkHh4t/k4X9GSoOmYr11Z57rrB7DT+73FOqR0uew2O/OVidbh2akTjHaii7JqM3Sz
         O1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762012452; x=1762617252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZxrvCuj4VcRfVXQNKcqrzWO2/nyvtlkEBnmNGrmT9M=;
        b=J9wbQxbFymxQIieNRGgTHQOoqxtoGE6rI0VO8eBaT9syp0WGxISWwiGfmYRQzl1YzX
         8GCYCtitcszzHN2pJAv1yjPBqR2whEcrmkBTA48OygQrRD9Cde2xOON7H/j8vH+3Muar
         m3RdHmrvScktBVMDEKYK3ovsrSAS+KIHLg+o77t9zZYyG49LMqgvf7RZXDgpMMOux63y
         HYQy9XuC35IkYDewyWoaOlNfc7qE530MrV79x5dYJozcUIgZ2GRj7QGioDgsrf6v5dY9
         BLRAaeb4E2EczMdVcONCZl6O1LT+0v8CqRiQWVNCtuYiByVlqLE9lOFlCYfCWYczGgz0
         oNPg==
X-Forwarded-Encrypted: i=1; AJvYcCVnhVl4YEv8W1aVaC/k1/4YIoKfNv07m0h5HAwBsDdQEfC91K7WuUPZ41CDyLvPmOA11dwnrGISAGKsC88dSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZaV1Ko3gVKIZT1yxXWlJDKgyB47LpR2cwEoCiugEsQ4H79X6Q
	i1m2TzHkjq5/l6O9bFtYaW5FxHHWilVAua8ZgHI/tBcRceGZJuToazC74iXsTFM3t26a18wqvpa
	ci3cVhEZIhCwjALn10fteXdyKKD7TXv8=
X-Gm-Gg: ASbGncvKlySLsxaxBb3NpoLYQeg4U56SRFCwYksupc9lD1nPck9nRngJcSLZwg9M8AD
	MolXp+qOXwQYwv7pgb2wSvaqJBnupPB56VaqB1N1BgTYOKF3QDH86u6+IDvoMjyBXDCP1VGf1Gx
	bU6gu04mq7pejNYQKfMWR2LEvekJJLmdOlmfaNVYi21/NtEgEEtZ6vl+Qm9buvgew/dfqRN9KwU
	o2ueHzWZUDweOquuQJMc+3GrTZ8ABBOO3ey6lxEjpiH74QQuW2A6nyoHDeyYyJPmRY6ddheq0ae
	33YBpgn3aEpF32HDKoqmgSY4jduP7S5yv3R2zivjA4XU7Upz1Jd+9U4Cr65tTg0gq1Vvy1GxMxS
	S1DA=
X-Google-Smtp-Source: AGHT+IH98SKG2dNVCAgDMWAsxf7IghHixGwIwUQXBJWnv1yD4/76UJbZrqEwBLzCN0HeDuDp9PdZmiEDyhXUpHiXB1s=
X-Received: by 2002:a17:902:d505:b0:295:3f35:a31b with SMTP id
 d9443c01a7336-2953f35a4edmr28620535ad.0.1762012452072; Sat, 01 Nov 2025
 08:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101094011.1024534-1-ojeda@kernel.org> <CAH5fLgjC20QmK0s_6ht1edL8wSR3d-yrJ_viuwdOxTCQRpMmgg@mail.gmail.com>
In-Reply-To: <CAH5fLgjC20QmK0s_6ht1edL8wSR3d-yrJ_viuwdOxTCQRpMmgg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 Nov 2025 16:53:59 +0100
X-Gm-Features: AWmQ_bmfFv9e45aUeUVbkE-t_FDmtneqkzR5nipR7SAGPuD1TLzugXVWW0zvQak
Message-ID: <CANiq72nBEkTq7vos1Lv5Z1bgdZHt+UQWbauC0nr8xwxhuVBJJg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 12:15=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Does this need a CC stable too?

Definitely -- I just forgot my usual line:

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

Thanks!

I will apply this when upstream's PR gets merged and send it together
with a couple other fixes.

Cheers,
Miguel
