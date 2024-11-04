Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B5378685
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730735122; cv=none; b=MfWQU1ni2u1bxGKBuQB8IzsC+YxQkrk90L7h1oT1rwfWZK4g03hwLivTFj70DTXUfdnaWrnp/17LwTqpAvTVoXxHpkZ4KItewYvbrzNxgJWtmM4udMa5jntgpVpJzmZtX9p/nCGzvWvEKFXTyWSajLuWlwYVpm+vhc9PZqiFc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730735122; c=relaxed/simple;
	bh=UtQr1uDBySJ71KDV2EGYcJ59B46x0csqCAO4rkddS2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qSFoespOvIeCEO0eozUxzlsBK1uXqJ04RVFLx8hP6Mu1ab1/TIvDsHQyaRASwzyIAe5Dr04oRKXwszhSttFAo4Zx4rvKXYEqx7jUW7twMucE/3yJobexdyLOapmvmAZl8S+AaxNj9gjK7KTA+7fiUpfMAGuxd+bXrozvdpn9vOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flxO8GPC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flxO8GPC"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f1d96668so653484e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Nov 2024 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730735119; x=1731339919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtQr1uDBySJ71KDV2EGYcJ59B46x0csqCAO4rkddS2c=;
        b=flxO8GPChvNRp0WJzb5mjv9WYIKGIDOF5O9EzBvVi0vu77jKo/9Ru4PoSuDcKR6jJV
         5pws5VPIbPxI7P57s/vb8ImxzJBgRqjVHhJ4maY+JKEealqI/EHSz0I5Xb8vcUNlpo2R
         5sfl9pzX7rRP+TBSQKDVuFrWNH53Q4SeNaz0HixkFdDX7EX2P+FudS/2jHS4BsW4T22t
         Dp3vgAwgggEjPgO2h9c73hjD1nv8+7OXv9vTfs4BJgueUYZjuKvRXzmqsm+/5FLojPky
         ClKXPZ7O8RH4uRlBpou6lLFYfkBsSAa+zBmYnyWsRpS9SDK+SWWTUGj0YPiQ/A47GL0n
         K03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735119; x=1731339919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtQr1uDBySJ71KDV2EGYcJ59B46x0csqCAO4rkddS2c=;
        b=AbMj1WJ57PUoTHMW7HPDqtbmt+iQcSSlXipRY+R+9s0gPGr3lL26j9LQJ0OY8QEIVN
         RsoZgvl20o1/lWUUDdeyhpMoGHu+RbRDz5sQWjrzc7FSIJSbndfsaWe94+fUb15wAT1x
         WEHaMlN1OvxlFgNYnUjLUeX4Rqwld19B3ciAY7/cdQhp35bLxpI6O6U3ke7SwSfKD7So
         wYVbuO28l13yKCoHPJxgXNpMKOD3sDymo527B29xvDbFC1jCFOcGXSyZP7JpI4z15XEy
         mq2N3WzpSDi2G0SN5s5P/x4GJX/pxtC09lBNicW9W5BdYiiWjQQhlikDZCS38h9r4ovH
         yAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXtQKEU1P55+n6IAIvu1Kyu8daJ2VrMFGhNzJpl94Inlmk6DaqYB7S7/553g3RsWpN3eWjQU64vADtF+i0iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyJ/Yu1yEBT59hjHYE7teGLX6lcijuPi/k6ry53YtTWmRiyERH
	Ivbk9d2B40a6PTNWRBG2h2n/UR2xDcGmLNBlm1OlufxTukhuqWiBo+epdqM+MvmXbvqyWUIPBpc
	FyzD9ekeTaxqY4HgxM6+ohs/h9ko=
X-Google-Smtp-Source: AGHT+IFFIjYkqCcCzh81yVZOt7l4PnOZO3Abh6q8IFNr2OwrRva+fPkWn1ALfJun6puAEa6hHOmiKyKicrxwLSeQ/5A=
X-Received: by 2002:a05:6512:3c96:b0:535:6a7b:9c03 with SMTP id
 2adb3069b0e04-53b34911d43mr4864029e87.6.1730735118793; Mon, 04 Nov 2024
 07:45:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241103030530.76756-1-fujita.tomonori@gmail.com>
 <CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com> <20241104.110803.2105992905862489345.fujita.tomonori@gmail.com>
In-Reply-To: <20241104.110803.2105992905862489345.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 Nov 2024 16:44:58 +0100
Message-ID: <CANiq72nNMM5hCMa=hDbvpX6AVR5L2pswdQJ3AN05ynHx2Z3Q0w@mail.gmail.com>
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: jens.korinth@tuta.io, rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 3:08=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> The code to execute only once is very basic code like the kind found
> in textbooks? I think that his focus is on optimizing that code. Once
> the the basic code is merged, it's easier to send patches to optimize
> it.

It doesn't matter that it is "very basic code". This was discussed 2
weeks ago in Zulip. Most importantly, it was a new contributor to the
kernel that was working on it (as far as I know).

The issue is that sending code without any indication about the
discussion, without Cc'ing the author, and so on, is the sort of thing
that can annoy people. And if they are new contributors, it can drive
them away.

We need to be careful about this.

Cheers,
Miguel
