Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0316EB79
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 11:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724412223; cv=none; b=bN9O0SPq/IyFXE/nrGJoUbMjqT7OJiSg3JhK7dEET8eWqg3bP4xNSAj3XGacSd6bXsLZ6Ud0Pjbyvn+zsHwcoiTVpog4YhEAXqJR5yLYlKryi+qR8MH5z3RrvjfG2j1M/sGqTDbwX903Ri9yyZXIqlmLWpzKpZ3QslsD5uqLWck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724412223; c=relaxed/simple;
	bh=XeKIk62Mbzchw0HTz+5vzjGQOBcsTd1wCr4zjuAkGQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfvVkNn66VViawQcGvMRC5Ica8Qn1UOXd2i25tsMPLWxiymm+4yYrPlWDIaD2JQ540NYYJgYRfLGvhZ5CQOoPgFzkE83xhfoZs4SuI0bfXHSLr40lZbfwtJeblkVNI3ZjUsb6CQ4br7y2iEqdnq2jIKw0xnV3UZzuUhEi+4RYeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnnmlLKS; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnnmlLKS"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5dca00a809aso277428eaf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 04:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724412221; x=1725017021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeKIk62Mbzchw0HTz+5vzjGQOBcsTd1wCr4zjuAkGQ0=;
        b=TnnmlLKSDs06JUPF66EBTS3e6zdDsa+IbSGzBdSl9K99Dx0Bl65q+jTMC2R/75OoZP
         ulfX3jRkyb2AW1WMrFIzYuvD4hQLhsEu6kepyeCMpqDY2yEVbK0dv4jK8HLnBr0NL9Ml
         NRQ2dEjgelsqkXS2IqACM2KrZgWOqY07qKsWyAar3CwfDKzb+gRHMfBeJEH78Az9XOk0
         FkLq+3iPb1fVIfLoa6Tx91jvMzhMBEOMWWZ9qR3BPihHegIbHlIfh0NPqurB1haCRGGu
         wmt9ltPP3fOegw3uEfiD7zf/jWsIFesLegv8WovaKDRV1hAN812SdEcH8cKpnPkOuT9H
         F+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724412221; x=1725017021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XeKIk62Mbzchw0HTz+5vzjGQOBcsTd1wCr4zjuAkGQ0=;
        b=IzFB3IUaa7lftRFT6M5Onr4adPrf+/0yNwG1fhFUCoSI5+bwbI1Wh4EG8IuHLPyATA
         6pDnmmvGN0cc9FGR871SHGL6gUPj8Aks7hMDtGjadCwYGjxPRn8WR07h8zIfLc6/lRLu
         0pvSojDUTaz0vW7j6dXIjyFPiGto1UCaG4qx7R5qIa/858KmbZLW/zt4ZBlWZVYvIpb4
         EiS/c6KY2uD0Gn40n4YbXOeBWBeYzmhJGmJ3U+HjQxS0EsAKBXjdktatwto+UTJMUlbt
         HDZu+fIEK/2P/9InJTQ6kvcuntm3LXAb3QYO1o7jp0gGTbIKYaKS4jGcr/aE6rwuWMXm
         P18A==
X-Forwarded-Encrypted: i=1; AJvYcCURZqmWyFjZzfvIAp6EK8yy4TPWZv9f67mLZ2wjmHJiaSbYFN+g2qUZe47KITRGBBKxsM3hUyP2dFlaW6Hoxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhM+hXoQhIEavP4qMY6nWa0jaKAtEfkiFg+zGXSfkKwngcj+a
	1e+vAg+Tn8uKWPOklBIj4+Z1R062nXreEZXOfCA8/Yxvrp7hpotUXt+ugRQKNURw5PIHJLMAyXH
	zzTCmYbWj78AVOxF9a2yLTemGPQ0=
X-Google-Smtp-Source: AGHT+IFKDZ+c9aM3GsI3i/+nwBhSKFCDdNknsjQDjRgSE4/oD2HhFprLHoftm730SkTjioHn0XJ4jW2UebyzDPSm9tY=
X-Received: by 2002:a05:6871:713:b0:260:23bb:1087 with SMTP id
 586e51a60fabf-273e602277amr1172612fac.0.1724412220883; Fri, 23 Aug 2024
 04:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823050359.1737893-1-workingjubilee@gmail.com>
 <CALNs47tTwECK_pX=RbC3Rj3AVovO_a3_ap3ctCQj724FJVQ3Wg@mail.gmail.com>
 <CANiq72=jR0d0jC6Pzz8CS0gmgfcKp-=nBebGWtbAO_rYvWegUg@mail.gmail.com> <CALNs47vP=D__NHj83kM4o+z7gv4NhKSpr02Qjx2vm-qEmUqEQA@mail.gmail.com>
In-Reply-To: <CALNs47vP=D__NHj83kM4o+z7gv4NhKSpr02Qjx2vm-qEmUqEQA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Aug 2024 13:23:29 +0200
Message-ID: <CANiq72n9bWaD=yNUDR_U7-Cwv-seKmaKcDfZq2fxqUOQcgAa9g@mail.gmail.com>
Subject: Re: [PATCH] rust: Eschew `Box<MaybeUninit<T>>::write`
To: Trevor Gross <tmgross@umich.edu>
Cc: Jubilee Young <workingjubilee@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 8:25=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> After [1] I was thinking that staying on a tagged version was the
> goal. If this isn't the case then sounds reasonable, thanks for the
> clarification!

Definitely -- if such a tag exists in mainline, we should use that.

Cheers,
Miguel
