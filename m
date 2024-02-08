Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861996D1C8
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Feb 2024 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387343; cv=none; b=RfxBvNh3m2gPU+T3/ba8s/Jl6TOOGkO4YKfW7yIVdsDVtu2MG6D9D3ezljRlWuoQRGTmeDKWu6+gRDZhqYLD6SKprF20kInHtPasKFoYuawmF80YoBWu2Hq1SmChfU2h7f8D4geR9042gpjNDl4tkpf3Xi7YR7MCV3Mb77cAWVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387343; c=relaxed/simple;
	bh=vkEVVWZpBsrrMeuLKsGGiEh6EvvUyWvTDZL29fFEKns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Je2FJOAazpGy/K3RHsenL61rP2yvGbZDghNz+VzBqFomQS5XCbPZgBqe8kudqcdClT4MTXDAI28L8+PgwaKQzK+41s4oSyenEYpZvKloeT7KTheHEfkankwbw7VczKT9UO/wTPov44Dsvf10wsBRvrhYW5L0ZIq6uf0Wh7y2an8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKx1OTlM; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VKx1OTlM"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7d130979108so740540241.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Feb 2024 02:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707387340; x=1707992140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkEVVWZpBsrrMeuLKsGGiEh6EvvUyWvTDZL29fFEKns=;
        b=VKx1OTlMt8HEjkiJLj/3drPRR4Ag7pNc6xphHX45cTMyGoVRybK+5CjgUOo6ge5jiw
         qSP9SL+Sn5wYi6b66LzrEf+78HFc+v2zBfDrIzKH74/tfUs4bpUudGuYrsbacWCpDTP/
         artzHAmZEdCPjCBjqPJpagOoORXD5zEst9Mjd1ctOdxTFHW9ypWLGRCH2FR1rCk07LVc
         FYE6sFYRBydZ3QErAVdO0LREKhSslVolfs4o9rsOMuh7+66YmPLrUn94nABYQeo748wo
         TXQIIz/WmEzHMCBq5EvmQkpUVRjMgz1ImQ3NO9hynL2TpaQvmuO6yMK0TWLgpM/i+Dvn
         P4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707387340; x=1707992140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkEVVWZpBsrrMeuLKsGGiEh6EvvUyWvTDZL29fFEKns=;
        b=kj7KmWhuRAC8E4L5L55EUbLZf2WjvodCXoJsZlpp2dL/kOk1jhmh02NfpglJFaZn1Y
         PS9FfgWIZn1N5wnynxPGRw9c5AA1ShLV/gwgRYMMTwBXt60J7xl+poHNNSK3lnXBqq7F
         Q2bbD8tgVgiI7PKE5/GCNSdUgF/V+xtGxoOywtiI7cbJujLF1RxQbCzNPJeORK9uiTMJ
         SJ8WtG1cPd6ftQN4okVZOLDNqllOb9TT8jh8ZFEV8pbBicV/Ed0elsYjO98CN5saGFAM
         EMlvUTbRAcoSdXobH7+FdYeVkXQytgK9/8qXeJ4iSJ5olck5JS1EQzlcAlbJbKs7bksq
         UsNw==
X-Gm-Message-State: AOJu0Yyalvs6YFPB5OtDUn6LfZ6C7vgvWF71NTomeiAr5GPESBaMzsuy
	rvo9slzDySUYLtSo8KRyUQuXciSx7FjAZ2FWqXFp82L6tB82vdLmRhvTEKkDeYug4ApcG1eCvZc
	S0aapkAAYmwpFIJomqVqGuDgSs9Tuz7fvZ05C
X-Google-Smtp-Source: AGHT+IH9xrIrLtrSR79+bAqdjym99ReL8XboJ/rpbwv+XG287SmXfGeSoj1K7GDTxKorzqQUNZXPKMDK1CQOYvP8Yqs=
X-Received: by 2002:a05:6102:dcb:b0:46d:2647:93f3 with SMTP id
 e11-20020a0561020dcb00b0046d264793f3mr6822531vst.4.1707387340040; Thu, 08 Feb
 2024 02:15:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZcSlGMGP-e9HqybA@ohnotp>
In-Reply-To: <ZcSlGMGP-e9HqybA@ohnotp>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Feb 2024 11:15:28 +0100
Message-ID: <CAH5fLgj4JRjdjo5LHQxXFsON-oULChBzVnLCO0PdiSW=V4-4Vw@mail.gmail.com>
Subject: Re: [PATCH V3] rust: str: implement `Display` and `Debug` for `BStr`
To: Yutaro Ohno <yutaro.ono.418@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Virgile Andreani <armavica@ulminfo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 10:53=E2=80=AFAM Yutaro Ohno <yutaro.ono.418@gmail.c=
om> wrote:
>
> Currently, `BStr` is just a type alias of `[u8]`, limiting its
> representation to a byte list rather than a character list, which is not
> ideal for printing and debugging.
>
> Implement `Display` and `Debug` traits for `BStr` to facilitate easier
> printing and debugging.
>
> Also, for this purpose, change `BStr` from a type alias of `[u8]` to a
> struct wrapper of `[u8]`.
>
> Co-developed-by: Virgile Andreani <armavica@ulminfo.fr>
> Signed-off-by: Virgile Andreani <armavica@ulminfo.fr>
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
