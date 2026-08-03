Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED824E4C3
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785745155; cv=pass; b=r+IY3tlP7HWRUltX/bh3S3WzfB66+cbRvPBlmUvGdmihHVxfd+LGWjnkXApq5IWliqDeUWFR/eC5aogNXmlUFsDpKhmG22mR7zkbpdBJPrbsu5xFE/TOBVFwgaSTMxUdzkG19NPhFg3SQ80ERcsMe+w4BUBt2ZUhF7eMshE1jNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785745155; c=relaxed/simple;
	bh=vsRL3Yexg6P3G1Lx2Gv+y/iBXXcmViqLpXcltvWgv6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bz+FWI0kTElybYogaAqa00C+SHu7C9amqnA5gAhbJcN3ujUbNl7kqb4Lz8pvZGaxBHa6xHQaAJtaaZZb2buU73ZF8xwEKXJDE8YgRwk9BVuFklkk2P2O01Kwm+wapd5H2v82LabmRSmy+W92ogHR+y3TqPDWLoHHt37GBBCJQX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acPvY6ay; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acPvY6ay"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2864465a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 01:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785745154; cv=none;
        d=google.com; s=arc-20260327;
        b=sTU6pIoeusbcGJVJvO23hPRoZ3d3ceBDmqLcC9KiK4wvzbGARWDxrthSrGYoaGw7q+
         Ep27ufYt0Gm+sZHzPHI3wnl7hn3FtTkyflm/vUZXHQDf7kTywxeNuLVioGy0Z7lK5nvC
         r2SDgbm9SuebzGDzC/FJjP8h4SPGixse1i0ATNWINmd6mAzvhDaqlk+eMqfd+RvJVw05
         o6rz8NrBfNQ/UElc4VVhladTiXipggEcgvqCWeF/Zoxbiono+Erx6HsySZYdfQo00V0R
         6rLMm+PWm9TYFJAA/txDliA19xQAorBeHhPz2g4WNUCHqHZegVk+AjV6KJwns+tZNB1D
         2GrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vsRL3Yexg6P3G1Lx2Gv+y/iBXXcmViqLpXcltvWgv6I=;
        fh=kU050lNO1uR78rBcX4mBg+qSyE1cQTVpd8ObH9QmDoM=;
        b=LalxbnfwYBjjYhSE0LdfCHLY/+ktDyMQldwJjf9UiEjUbkjr7+YrVws+jVxKyE0Pnp
         YjB8IdcpAGJkZa203uOooknjKfTARoB46jq2YGL2avRZjFJ0E8ZMF9J11rZ2BT7QEvlX
         GxvghIC8HXEAAB+bGL1GWv1ePWpxZqAouK3ILsb82ltbMR1lh1NhVDiAXTX8yuTjS/B3
         VypeIcFXMJ530HQI/t6sc+dsm6UpRauGkODWhvrt+y4XkatgwGBR6M7rA+FOlLQzSgJF
         hLU2azbiDk/eDLHVA1d96RGYhFJ9KmHzNjcmm8NspoHqNyi4/ugOCLAjUoHQLp/LAN47
         NU4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785745154; x=1786349954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vsRL3Yexg6P3G1Lx2Gv+y/iBXXcmViqLpXcltvWgv6I=;
        b=acPvY6ayaTUyH0D7bpraEQl9teUeTDiPvtPIgqgtX1CeAyHOE5Aw/3SNE+18PiO8Ul
         nrOXKKtI+6jgxjLpYoSFx8XJf/uXQOy9K58D/H6y3cL4lSbFExIQBy//6YtjXWed6QCb
         bOPJTp+9xfHFajwsYgdCW/s0NiFziixCI34hSBs5UXrun4W9Le/CbSOTabZeLCgBLTSH
         a6fFNJ2nRy0W+U2+EVswB7VYi1Uy6kk5hNfeBePoEWG/s7L5+gtDRY/4rD4hCyyRyAaF
         dzRyBi2L9O9wZSnIHIIUSafU1ukkZg3yzZLy3Ej4n2MKPRyozMZ5SFSfGy+DGCOZSYE7
         w/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785745154; x=1786349954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsRL3Yexg6P3G1Lx2Gv+y/iBXXcmViqLpXcltvWgv6I=;
        b=L6NZEioDXxGkag0q0YqGKxIRQsm3YrJPYaEMUSpeRS9cSVfD8zMsbCBLCVtdGeCCcP
         THXN0BPYnNX6SnwgVqHvYkS3Q6LLCc1lwaFu2OYFJlhEAa7g4nBuTpEHHUmvayufRr/Z
         9+J7W/Hi2LkiRiXoffKEUEK6+WDd9BPx7ajhl4FHR7bkY/e7mXnLFbRIZ9kbPts6c4v0
         tC55pzeUasvGOIBg3zj44HnD2iWzwq6JWcJYVKjKE1v3ArFdwjoGyEPZOl/gZr7Yr/Ji
         XCLbZaz/2X12OUdcit+cywiNyu/74ydU72w1ILjdZUPqYTYEh7aLqF5YMf3R/KU5YESN
         Dx3g==
X-Forwarded-Encrypted: i=1; AHgh+RolinIWq2R8Z1YTtknPLeO83ioz92H/cqnLLG/iNbwJhJGLmh7EgT7yKcEV/rURimqCmTlcD6ofSQSCMMCFpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYxx8DL+ZIKmqLh3eXn8xOpnvn9qsuW7D3Zb2XdTAnkeu9+0+
	FW9Pu8mDQliRBaaYf7/fPBRB66t/4E+8i74F6E4iydaevfH1vi0F98BylkJIUFVj5VIiijgoVTl
	iSS8iOWhA5oVxgjKUsTTYa7Lc6/iSyOw=
X-Gm-Gg: AR+sD124AEeNjk58E16029AxRbKYHOcO7KtCciCpEfihy1syHSh796GUavEB1nZNOMB
	XlJsSp8JjlERIl4CoavoXlDfx9yRxKSe3HMfO/b2QrBGarGYvHDxZUyl8d5ydXR5Au7lLjvtfQJ
	G8K0+3bvIptBKxiteGgVcjYwFHlJxJufLWoYNKomGyYOGo2LTtWn5kHjFfz73f/8hyuf0XVjZkz
	RSksUBOGTiwBtiiyF11kCroLMcZy+ygdzSTq7UbKFsN6u68o/C8tghN32+JbDA6PYKfqrIwyZzC
	HeOAUgXK6pBLJKr0CC/tgKS9pvnv1abTtVdNmc3U6sGgDiSaS/1t04p/SSWlZy+Ox0KMC556fe/
	Y
X-Received: by 2002:a17:90b:590b:b0:38e:8896:4024 with SMTP id
 98e67ed59e1d1-38fbc56c5d8mr8636911a91.40.1785745153913; Mon, 03 Aug 2026
 01:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719120514.159914-1-ojeda@kernel.org>
In-Reply-To: <20260719120514.159914-1-ojeda@kernel.org>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 3 Aug 2026 10:19:01 +0200
X-Gm-Features: AUfX_mz5GbOLeUAnN0MXV9nrJx1dw4VDksfRqeoBzmYwN_UpfZ5WZxnd7WCsBcY
Message-ID: <CABwQupMVPDXcUCugu2GmVM8JgoFr=NA5ex0=GYF9p1_tt0moqw@mail.gmail.com>
Subject: Re: [PATCH] rust: rust_is_available: warn for `bindgen` < 0.72.1 &&
 libclang >= 22
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 2:05=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
[...]
> Would you mind confirming you get the warning?

Tested-by: Burak Emir <burak.emir@gmail.com>

I checked that this produces the warning, as intended.
Thanks again for adding this!

- Burak
