Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A78154C12
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 08:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732697399; cv=none; b=cNXdiD/Y5LJHnVfe4exPYaVYFyqNcvHgF9p5Zcg3H37a9Pg8/u4DAFHz2ULSZdLjC3jC2O6COqEoGrnpQElMnDCi1Mceenl+LIi6IUGx1yl/jSoycF9TthoArLGicdezXCbmp3WRZJ2Xv7MQRhimG5WAgkQGCUdlpsicjrjYquw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732697399; c=relaxed/simple;
	bh=V91ku/MyaPMOiw4M50f44bbvKeEdDpGUccWHqDSSVUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXka7385Uk2M8Sty7FcZdZ9fxuLSXEu1zYoaOaO4AOjQ79+Zox3MOPlcKY0n0gYu2D28pvr8fW0GdlPwGP/wGIGDkqYN8IqXwrEBjDUKcqY6CrzuSkzxbwUGoR3sMOi8I8DhoSXTS1SD6O5ZK+PPTbCppISQrSWIsBaiEaLmJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Ygeh+ka; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Ygeh+ka"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a95095efso3032125e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 00:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732697396; x=1733302196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V91ku/MyaPMOiw4M50f44bbvKeEdDpGUccWHqDSSVUg=;
        b=3Ygeh+kagikSG/P81ewVexlEzRhk8+8AxSoAc2yTrbNhsvjR6GzPasyF3oHUSXQmaL
         FKWyMQgQO5n2f/VEnxLBCW3kzeMsXipnoJqiqDms4oxkJSlaeD3+SqdS5n6STL9b2OJM
         Q3iOXQva0y6dc99nVa91to/izGoFMfA80F65nss+ZWs5JWI4MiQLwf+Y38JH/xiLdjc5
         GeKzVfmes5WUv5W8o69RPvre2Siq/b7al1TtntuF4kNWaeZjp1LOc0ronq2STb2h2V1l
         H3k2d+9a/Wumcyv29kPkQNfTIeR92/n/ZgErA7hKY+P4830UyyV6VowHF9Z/Ho6iSDPn
         C1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732697396; x=1733302196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V91ku/MyaPMOiw4M50f44bbvKeEdDpGUccWHqDSSVUg=;
        b=fvkiFXcfpq2b+m0MKL/rPkepnHzT4Npor0iv9DYeO/y361XhxWOsskJ2rCajCy0Da1
         F7YaWQzJ+oP87GaM5VAPnmBdCDIQlgQamR6x5lvyqC66bEaNwHqo6mijLtM4xxpJ56+v
         IfW9Xsa8P5lLAeb3vSYYbcI/lqmcE1oyZsqrLWQarIbZU99xMdMW9/Gl+sQKwLNjGSnn
         lotIcSM8XdyRywhdvvB4WnPSWi1lNoLef0dQr6JoaNV1YnrEmw4gwa9oytJBsQVYQz6i
         1m1f5qmnvuvlnrw7h64qavERnuwa2y7N/gIAkAARbieolZkPRarrXGR/+UtPpISM1mhI
         jYYA==
X-Forwarded-Encrypted: i=1; AJvYcCUA6u5BiD8QvOkKS2txhPzsfUDxMpsj+0ZCw1O0ikSxCqEPJPzqCEEJjUvWrVC3gLEaehDxPERH4Ac2VZBbDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfkwS/jtWBkoQnzshPzKx6C9Cn9qDlPLHTvPq+87qL8O1qZmBc
	4VbxGOgo1J2t7NNfotenMxP6oWP6tkA1pkInj4BN4M10HFD0yxgBje2cLvaZZnPS7NhPXC5Ee8Y
	AbFFh6975EVL7Y0jIsiPrOdT3HjL/Fe4fL8r4
X-Gm-Gg: ASbGncvgPRrosk8iMyUfSbGFz/MjBFAgT6a5N91tt8Dpi9B4TUh4FenwMlOWleh0sVx
	V5dPTdWMctxsiufCdpzzKohVoq7kI42ClDUqt3zcq1WK6joAxKg4ZJ/eQELSdQQ==
X-Google-Smtp-Source: AGHT+IFY1WRi4ZS6yx0qvLGr5LN9u/qHnoBN4SkOticSFOnf5NamNXxPUUol1NZ/ndmM2UecpQ+IYBdPsivGs45lKXo=
X-Received: by 2002:a5d:5886:0:b0:382:3754:38e7 with SMTP id
 ffacd0b85a97d-385c6841662mr1703161f8f.23.1732697395564; Wed, 27 Nov 2024
 00:49:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127005204.713495-1-kernel@mandragore.io> <10078f6c-ce93-4652-b639-6f9c0ed845c1@sedlak.dev>
In-Reply-To: <10078f6c-ce93-4652-b639-6f9c0ed845c1@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Nov 2024 09:49:43 +0100
Message-ID: <CAH5fLghE2viv+3eajrCx5OJH+yk8S7YFFx3Pve7min0hGmQscg@mail.gmail.com>
Subject: Re: [PATCH] rust: add safety comment in workqueue traits
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Konstantin Andrikopoulos <kernel@mandragore.io>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Vangelis Mamalakis <mamalakis@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 9:36=E2=80=AFAM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
>
>
> On 11/27/24 1:52 AM, Konstantin Andrikopoulos wrote:
> > Add missing safety comments for the implementation of the unsafe traits
> > WorkItemPointer and RawWorkItem for Arc<T> in workqueue.rs
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/351.
> The link tag should be grouped with other tags.
> >
> > Signed-off-by: Konstantin Andrikopoulos <kernel@mandragore.io>
> > Co-developed-by: Vangelis Mamalakis <mamalakis@google.com>
> > Signed-off-by: Vangelis Mamalakis <mamalakis@google.com>
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> See [1] for example, the ordering of tags do matter. Your signed tag
> should be the last.
>
> [1]:
> https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked=
-by-cc-and-co-developed-by

It should also cc Tejun who is listed as the maintainer of WORKQUEUE
in the MAINTAINERS file.

Alice
