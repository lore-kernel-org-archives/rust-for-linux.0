Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C3214A9A
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733728300; cv=none; b=bbSI6kV6agFwM4QiVzFCTLHZ05k34SDFolqMwErmzDVBwV3ffUBcDsSYMws26nQ22vNoHuzIAaJkwNTkfdHLP+KrUyGrPWUXiejcIhN5yQD80EsZtFzXgv/JzdJhLsz16gxah9k22pPHp8VWQk3XDFTAjjc2a+2c0D2NAKYOxX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733728300; c=relaxed/simple;
	bh=adU/8bZpopKi73H3sBB9VDjIy/l6bgTLEkenxjVfTX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIrD5Mol5VRU1lZOdt+gVLwurEXW+gaT3MFjwmO1rWj6NNsIAqnkFbN1PPy81EGOdC/qdpGTE8JZVHsskSPff5UftKY2CFXRqkNKeefJu9qQATDlhyLDXHwS3LDKvG10hoNFDyKp5Cb8qyvqWhjpkF0oVUyk043Lw46GustuxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=peI5Mesz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="peI5Mesz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38632b8ae71so1457293f8f.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 23:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733728297; x=1734333097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adU/8bZpopKi73H3sBB9VDjIy/l6bgTLEkenxjVfTX4=;
        b=peI5MeszNu5sjJGW04Mva5gHt2vLTgplwOA8UYaftsUGxzX0WbX6aVZ93D7CP8FKcn
         jCh1TPYVmrydr8iwHUNAnDOSazl3ObGi5K4kgTwwjW4k5usDdHqDwq9Y6nduC6wwUbNC
         tqINmlsJ8ULWOcNGDy40DCguNTJ5ci6sURIWiZopUWqOLIGinRbKyURIHd00URiemxt2
         onoRXg7tpMfYijf186cAp3zG3A6AUV5VMAWrMQ8GAg15BfmVnvCAwXGAnpe7RbpNLn/y
         1Vhj7iDMuec5oBmJ4bCizXLcYaOM+yhe8ff2iOeOw8BhgA0l/MaMyMI2w4HBpwZQ2xN6
         wDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728297; x=1734333097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adU/8bZpopKi73H3sBB9VDjIy/l6bgTLEkenxjVfTX4=;
        b=fqI5LjVF12LQCHzxjW8nncI/RNGv9ykDKsYikJoHDGpRr48ldvLBcXB7GHtQPYpK28
         IFa6LZwHb+HdOohWDCkh2oPj2eyzc9FafSjghS4c0jr5eP0iAktUfnZ4dfi7kAPvcUq2
         Qz/1lOR0h7XSDUM+3fOwY7sv1REfl7xWUGdnXKCb/pUU/JhpOUIkOTyrwtmcr3dNxCeU
         LJ5NXxw4K3c/eq+CFCv1V0z404amCemndwqh37vKsr/rVjtXyUwl/xjlAkpFJyxXwbFS
         cNgH2b0tv/wAFCDsabX3D34iZox5G89AkRyhCNGgIPqd/jeG5RGZgH78qp0sM9P8aHgR
         4fgg==
X-Forwarded-Encrypted: i=1; AJvYcCWCYlwnlzARI8lkOfdu9IhwEfkw0I4t8h/w5VQMeP7a0HRULqK2lpr9LtvMKbHPeR3gZCIxMasRW2iO7AeVOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8ggJVxLoEpLVIkoT3Qjw5ZA2fp4gW5crdQhq6lYlrbG2fCPG
	dg3pP9YpTVCPjQqm9gYTdEserS8vRls1BpdKqjAo6NXX87033udfQAF4btmX0vFjhSfQv/6SYuJ
	TOSV+wB0TAddLx4k5DnlIFL8JikRTekDaUB1M
X-Gm-Gg: ASbGncupj4c1EzEkr+ZgAmrPOBebuWL7E81VpgDjGRrOplCaWOrDBbg9DvY6ItGdYva
	yC/qxapwJwm+qASY3vonQI40odafnQLGj
X-Google-Smtp-Source: AGHT+IH4xdphgiXLSi6Aqna0qnMFGutHgbB0ZRbG1H9r2X10yVwu1dA+PdtAter9+Hnz2XcMwCjlWLTLN45hXb4NEqM=
X-Received: by 2002:a5d:5f8c:0:b0:385:e37a:2a58 with SMTP id
 ffacd0b85a97d-3862b33d115mr9163936f8f.1.1733728296974; Sun, 08 Dec 2024
 23:11:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241208184834.50212-1-dev.json2@gmail.com>
In-Reply-To: <20241208184834.50212-1-dev.json2@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Dec 2024 08:11:23 +0100
Message-ID: <CAH5fLghjR4fctjoLT9Zom3drNMQ6vdE9hUTnZZ4Ms1qQHGFe=A@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
To: Jason Devers <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 8, 2024 at 7:49=E2=80=AFPM Jason Devers <dev.json2@gmail.com> w=
rote:
>
> The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> currently does not issue a warning if the return value is unused. This
> could result in the lock being unlocked immediately, which is unsafe
> and unintended. This patch adds a `#[must_use]` annotation to
> `Lock::try_lock` to prevent this.

I agree that "unsafe" is the wrong word here. We can just say "which
is probably not what the user intended".

> Suggested-by: Alice Ryhl <alice@ryhl.io>

I use aliceryhl@google.com for kernel contributions.

> Link: https://github.com/Rust-for-Linux/linux/issues/1133
> Signed-off-by: Jason Devers <dev.json2@gmail.com>

Overall looks good to me! You may add:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
