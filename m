Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C6C372AA5
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 21:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763589441; cv=none; b=a0dAKgNdJGduATgvpm5aDADahPf0qPbnb3zdbahgV6WOPPxx09adyEqZ9PNbdLynEgZB8hOpgkKsvOPuNwedLILp3KAY0hx+udN7+ipYcFA4zo1YRG7QHcTnBaRWmKtewrM75LuGtvBy8zh5WGGEoDzXy2iBhT6AvjMG+JFf2/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763589441; c=relaxed/simple;
	bh=/qAGvFjpsJQFwFjRXXKYt2fLlWs6HPaYZrh05Mf+aoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sq3cOIM2c+1uGGmOpR/XqYhfHMTt1nE1gAmIBBf3uOTP9f4frovg7+WqLy8qwalkbR4BcMp3WfRtbNAEUrwCaQe8BPk+KtmOS1Al3HnGIE26zVL9+KTxyiWSCQALJWyrDcxnucfqW9AAPYyYIPe2byJM+fz6lCUilJRLSa1oFdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuV6z6I7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuV6z6I7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso12875a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 13:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763589439; x=1764194239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qAGvFjpsJQFwFjRXXKYt2fLlWs6HPaYZrh05Mf+aoI=;
        b=YuV6z6I7cUIDgSPEteGy2yJtbYB+WSv2ukx6e9G3fsN24+isv/ptP3U+yED39M8Ivn
         bOv+lmdrR/GuYDXI9HP9SFAWSuKjp2u2RyrKlRxeO5XTaVPSa/3cbR8uqRkXeoTYiz2Q
         Q16i0chc6kfLj24l0LKx6MVl0Mt6aZafc4R4dR6AHimZZrX9TZj+NPU5Pp3tU7A1nnN8
         E8oWUWXPWDY5RTiP4DE/PxgXu2su55hJ77g5sLI/P8umWXMazvAIj0ALMDurgFZ9iEk+
         rXnFa32PKQ6LDi2m2h5PIHyPIq878SrAGk46mO8IX/Zm6BNQKVip3IXGjNPSo1yS6qE4
         fWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763589439; x=1764194239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/qAGvFjpsJQFwFjRXXKYt2fLlWs6HPaYZrh05Mf+aoI=;
        b=F7YO2fMy1kAPMey/Dy+/YJW1n2HXViro0evwCNbnDoFq9weDqqvD9IeSLjXgSFcOzn
         wzvUt5hw4s7TYj3WD09KwmO3JCuiAGxsoBzH5AjPimQp1dG76YjsqOJll7SiCk9LsAGJ
         frLDwpFTN8DsZPChz1ezN1hO/62KClkEMkWrzVPYsdCswNaE1kGiM1gt+mfH2qZ0B3bn
         EmnfHdVG8iFcmhe1cVmPTuYE76vzhW9liQTUoZQ+xKm3knttkmuXGguRaNirAHsPgpxF
         6J8qJBW0HvTUKUjIG5YnnhxM0E2enuw8K25GZGiKYYsmwQam09tBvZ4oYatQ9+vba/LM
         jN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQGD1BIqdvyl/fIlLRooDdnIZ99Uz0pR2hYFHieHWsyuzBwvPSX1ir8XBcdvoPIRY8WTpXnm7s9R3agcUSIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ct8vnvXxbMWU5HQ9tnG0pKsmYIwzyj7qGiS8qcBHwrGc3pt8
	47kQ1J1pdkotmtTuUrF3vIsFS49/CnD5MKZfDONTIsBarw02nWiI7UpqlvFjPHMQEWHc9FCaG6P
	YEHGqC17xJOQr2sMVAByWsR7PNjvISDg=
X-Gm-Gg: ASbGncv7UYBfCkr62RmXF1I2sIqIfYTwwsW6Biq7Yt3im5xkKQd/ayoGusVAQY2P+P3
	DTT9n5fyf02RQmPO9DPbX+lPJdKcwtwqhEH6Gxr2Eek7qePLaHVro3w7S5W+v95+pew49FgYuRT
	vaNltRdp2rqPHzpU0MWD5HHgZ4DubDBVTP2dhBV2051OFWiJmwBToOKLCACnh/fcD8ZTB8A7eid
	lR97KH3zsUDnJ3u0D+nufPtKdKVtI+JYMzFqpBc6qqpBILkNeD0aCjckZ6fqt5txci4RMhqyZ45
	sx+gURD1Nz6bVxo06hi2/4ofFd/cVspy8Y1oSsGpiMNZwurpyfH0i0t/R/dsQWaTqJIxpb8OwWs
	XuNGU3orxTbYcnls0yYFiTQow
X-Google-Smtp-Source: AGHT+IFV/wjvohYHRvo/GIAdaoEM5kvvdPTdZXNyVvPshAQiPBh72hRRFJrv3HmAzQ5OHWiRDYE/f2HHJn7f1ebRWkA=
X-Received: by 2002:a05:7301:28aa:b0:2a6:9dbf:bbe1 with SMTP id
 5a478bee46e88-2a6fd12db29mr218402eec.3.1763589438967; Wed, 19 Nov 2025
 13:57:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-core-cstr-cstrings-v4-1-924886ad9f75@gmail.com>
In-Reply-To: <20251117-core-cstr-cstrings-v4-1-924886ad9f75@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Nov 2025 22:57:05 +0100
X-Gm-Features: AWmQ_blnFqEy-R4TQJCUIqTEF4ZETcxskiCZns6bnP4oheq86u-5oQnscadf94w
Message-ID: <CANiq72kk5555AC4qdQeYBdcLC=Z4MwboVJ2MDc_h5h4sTd0=Pw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: sync: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 5:38=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
