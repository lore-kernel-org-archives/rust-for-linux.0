Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D559A18CC1E
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Aug 2024 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923545; cv=none; b=cYFx+hV2GRIS8z3cYLRj/AxaIzfqqDxn4KtYH7E2R1lX/E29T4g2VB0y7WmmKAHeklPooERIGaN5hV0xxychZNypjwbiGkNENH4H7hhLFTx6v0iY3NK1ajmSqh+HeS1+TDinTfqSwoFmSraem7tY7FC8ghXPU/XAyaPlZcQ8WsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923545; c=relaxed/simple;
	bh=CT1NrinGO5014VpmYUcxqfnX/jp6PyGlishQ729IXKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDuXnmhwM1ST1J+OECY6ChLfaqenjSQ38q+nelDkt4E7hWcKYGAggua1sFtYUh32R6ibxRE2HVhjw7pQn2gOjM1nD3F2UOABpIvFKofw1qW/lz0Ltcbm1L5krq6p0VrJOIVyaiRi+EAm5UtnnVfkGVPAxFwjKiKqrAmuE/BgBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FY/nUrAc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FY/nUrAc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42bb8cf8abeso455125e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Aug 2024 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724923542; x=1725528342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CT1NrinGO5014VpmYUcxqfnX/jp6PyGlishQ729IXKQ=;
        b=FY/nUrAcFGIpGpkCqoX1+41esI3hYojrD3flUCBystVmjUPF3a8a2vwLnCFR8LZab+
         XNK/A1kdsKKVgD/tw3/JTg2BT1nI9FrURbXJt0TXEgs8d8ZQQkBsvPBFLgAc8rlsB4RO
         inazRXLbyuQHskcBWAXDBX2fXASBrY3ouqBWC1KoJlQaSzvpKFk2QzSUy/Rdna+M+UyA
         O5oKA6Ir1ovW1ZDJQzL0uCH1aBlK5S/U5t81a49X522XrxccX4i2z64cSCK6Yvbzl9Ac
         vBdUW28Ov7FQbYfW6ArisqbKjKguyvrtSGNRcEYzinJxSDvRy6eYcbSKQGoKwgC2x97+
         Lx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724923542; x=1725528342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CT1NrinGO5014VpmYUcxqfnX/jp6PyGlishQ729IXKQ=;
        b=CmAyZIAJImX0EE4v2OgrT+9XidTpQKzmGozwkHUeG929PeCsfdAg8PQmq8tHdSgNQ8
         wXoCLB3GBai1d6hcm/VTea6WX9Ph9Q5UlQnaCJzjwp2BPWAYDSU2aFfeXaST3ehXUl/w
         6E5OF1nf76FPE0J1+zLoMRaKx9WQ9MDMvN7gAVvtlyuKhUVJQyblYrwb1gNx0FaBNQTF
         chCViw2hhLjfoBr33/YkencBo8nfezF1GXsoGNp0YcPvBftgqzfLnM1AfmAmeZdXzb8A
         umM1+dVF6osmf4tNEWnrgWrTG7hBaTuQQZdglHVsNprjpkk0aUlunZgWONorZQvUnb+f
         Emtg==
X-Gm-Message-State: AOJu0Yyt0CYODqJbF1ZkXbG0bbzkD/UBGuFkp/IbMdqFc96KOU6QVZ4W
	gDVDlvsOCjdMPioL3PiU1b67BfB403Rj+dY6s6DOPxosYGzlfGu25Im8xMObcdql93JDIHzmsN7
	7I8CJWbqFy4ckQ/AAHxTWaPLLrBKvDrBw6uiW
X-Google-Smtp-Source: AGHT+IH286/cFVq6KBEsx6+MOl6k2ruznID0/auN8nOm/FgRic7fdxCibatkZrNQf/zCYqM9fW9KfGWwcgmHxSqxWF0=
X-Received: by 2002:a05:6000:124c:b0:367:98e6:2a1b with SMTP id
 ffacd0b85a97d-3749b526f18mr1600873f8f.4.1724923541861; Thu, 29 Aug 2024
 02:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828180129.4046355-1-boqun.feng@gmail.com>
In-Reply-To: <20240828180129.4046355-1-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 29 Aug 2024 11:25:29 +0200
Message-ID: <CAH5fLgjmUOLb63xgv85GLt92vr6ghSbp1T_vKjPK143061SeMw@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: Provide correct provenance when constructing THIS_MODULE
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 8:02=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Currently while defining `THIS_MODULE` symbol in `module!()`, the
> pointer used to contruct `ThisModule` is derived from an immutable
> reference of `__this_module`, which means the pointer doesn't have
> the provenance for writting, and that means any write to that pointer
> is UB regardless of data races or not. However, the usage of
> `THIS_MODULE` includes passing this pointer to functions that may write
> to it (probably in unsafe code), and this will create soundness issues.
>
> One way to fix this is using `addr_of_mut!()` but that requires the
> unstable feature "const_mut_refs". So instead of `addr_of_mut()!`,
> an extern static `Opaque` is used here: since `Opaque<T>` is transparent
> to `T`, an extern static `Opaque` will just wrap the C symbol (defined
> in a C compile unit) in an `Opaque`, which provides a pointer with
> writable provenance via `Opaque::get()`. This fix the potential UBs
> because of pointer provenance unmatched.
>
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Thanks. This probably didn't need to be an RFC.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
