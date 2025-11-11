Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA572D23B8
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 20:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762894014; cv=none; b=PlQNGgB1prop6cnrxK2OAC+VgdG8+ubQiJJNft6bOpt+NQXNMNmYZXBRVEiIGF+EUmjrOqwmo5wMJNsyq7qaTcOeylzSn3+zFrOBEMkboGBpDLOkKi9u64Mv2wprVJEJFm9iT/h0TXvgkJqJ6SPgEUGepU5dU7m+KDLg4AHMD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762894014; c=relaxed/simple;
	bh=UnmrJNFh5uwNsZAyJRqYSz9Eybog28Whpwhvzqd3qCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Upb5cJ1ajzg+A9Kf/iXXn8okd26zcrKIJz9wtpPw2p2DpYI4+CisfcWts1+c6CDPO1mK8niMFQIwYN8/Cgk14BY3k1Bj+ySIYM8BEZaSX1iCJNV20bp71crM8I3ahxyBw85jcJxz3eFkdGc1oDtukCvfK29OrRWyZTk+AGVQPpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnZrN9oF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnZrN9oF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297e2736308so117855ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 12:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762894011; x=1763498811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnmrJNFh5uwNsZAyJRqYSz9Eybog28Whpwhvzqd3qCQ=;
        b=fnZrN9oFQtmJMlwzZYrO8tKGRyObtSxHJ4RoGdwBMwdfMi064QPG0RIzo/BoInbZfT
         qFn4DIcBsUT4Ln3+jpmZbZGVfR+UvoNyVSGek4tkPdQOcPhSEKMhxi9obC++q+9Pkuo3
         RX13NXgIgY6WUY5h1TwzMYbCbKaek+PPtCJand1CcEVK+BOngZybpa82GGJL5MGbuYeP
         O7KzruND1elIJs3KJroFKnyxEn5bZHVZLWXFKnE3GlHqRyAf5fPGIwFFcrKaZKjZj0nA
         cCvFzNsXZo3WJGd5C1Ysgdobmu9s0vKQmZRkX2xVKbNeYK1kh6kjdxQld5MsKfWKrBOX
         gBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762894011; x=1763498811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnmrJNFh5uwNsZAyJRqYSz9Eybog28Whpwhvzqd3qCQ=;
        b=TYZ0FR6YoMW2LEeWgXa11ZkvX1pNPFTS2F0tjF3rNAtYqvIaGMRQf3BL5lZWiT9KJ/
         3jU2dUsnRA4RZn/M1filf/eerq9CfHYkHiVjGLzjTqwPyQjdaWScOYvTBCdfuuj4qBV3
         h7vNp3DB/uFmSXDQ5sPppqdENI9PfeU1EIIjaojY7xpVAvdR8FdZcSE7qws2mAv/RosL
         X58MhCsTvMa0HBbAxOBw2I/6iqGe6E3UTqA/3WxIQohTOuCfuPxT9GUMiKOmUgjWane+
         MJbOZhV9e/iwTy/jp5hXw0p3ALgv9l2REovumd0nZXeRpudgudb31Oe/noiNciulMu2O
         zqXw==
X-Forwarded-Encrypted: i=1; AJvYcCXhomQ0z7BV/mtA6sOurbyFKNZ9FFjP+gwmpklNJqcjhF2zPg2ya3voVu+moYa5QAWigC/DuCSetsxcRlRMUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlOSM/lDRH6zvJvtDttYr+6jdeiRKl4XhJSrhBMIOHho4mX+Ar
	jiiMRBUu0mgvUcmY24NtnUzTlNL+2Jkzq//gvCDiiWVMPWtXHUOQV78p+0sMNItCnPI8TlloBqH
	qvntPuwvc5KUqp4KaMvFSVOxQ39VDtYE=
X-Gm-Gg: ASbGncu/3YgjuP9cBrXFpvIJas6u2GpE5Olp970sm1+wJfq+xqbgiEEiKZMOZok2JZY
	2GuYwV/odX69fg890fkBCnnP3634k7iZO5KPpHP/n1FNFy7E+ukc08msUYtas27A0qBamGnHhj2
	r93kCerLe8zF4y7Ec4Z1jNE7QBfgsWJrrHegjRERn091coXuTmLEpU9+y4sO0Z1VtcV6s6VZe8u
	74PyJqcJYvOr3c5nC88Unh4b22EEeY8GR97vWJ7vqym82pIex8RaGIAdTNSN2auNOzRAreb/0Eu
	nvmrcuQcJ8zVPJIbDUuWYhL0FbKDb1J+g/l2EJ1Lq87a4lKSIGMR7u2wMP4uCoFkxTTKspmY0Tn
	Q7UXeAgT5xTbQWA==
X-Google-Smtp-Source: AGHT+IHN94JtmIxHN9rzLf3rPXm6Pv6p3OVtQxAw7lqD/kLIt+UFSlitVjA3+blOuHUQSodn0SFbjWMtxcUyzXogkrc=
X-Received: by 2002:a17:902:ea10:b0:258:a3a1:9aa5 with SMTP id
 d9443c01a7336-2984ec953e3mr4844665ad.0.1762894011055; Tue, 11 Nov 2025
 12:46:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108-bounded_ints-v4-0-c9342ac7ebd1@nvidia.com> <DE5PQ3927GMS.31N4JGGZK3M1N@nvidia.com>
In-Reply-To: <DE5PQ3927GMS.31N4JGGZK3M1N@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 21:46:39 +0100
X-Gm-Features: AWmQ_bnepqni23BVP3fPyeHHA_HCKx7foH7uXjpDqrNPb0vXM57eeTTzvo-sJS0
Message-ID: <CANiq72nYgvsTLvaXkGDN6ZReHipZVSgg1BzCgjC05h+dmsFe3g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] rust: add Bounded integer type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 9:12=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Hi Rust core team,
>
> With -rc6 approaching, may I enquire on the appetite to merge this for
> 6.19? This is the last hard dependency for moving the bitfield/register
> macros out of Nova, so we need it if we want to tackle this for the next
> cycle.
>
> Please let me know if there is more I can do to bring this to shape! :)

Let's get some testing in linux-next :)

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
