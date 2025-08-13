Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D242D321B
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073546; cv=none; b=EAqR1hVDTPKs8IS5vXUYGng1n1Sn9MyM9X1ZTjVSs/YAQYctUpvbrXXncqh3AcJNj9K6fQHqUPQEPCLtoVm8NxEOra0IzVjVOdPjGTsdZJzGSAY3KXSrFPyUx/M67WA9ielhL+JVQvdwqkHVH4ESZ8NZjso5CBK+IBSbe0Zi/iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073546; c=relaxed/simple;
	bh=TfyHyM+aPoGATUw4nqeYMrokly0/0joq/A4xYGbqR60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjnGmKjnjC2kF8t0rram7AIHVrDYfAew+CrA71IIU9A09nykZtVc57Rc46TCaqkXsCUnD/FxYz9YKg1BTJrC/NMd0HQiuo9HHZsrp/oeq5jNbvCR8N8LA2orcm9wdhSegZ9I4wM0Er3oZghO3GU6IC0jlDyf+v+CA/L4aLVTRkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Zdb4IQp; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Zdb4IQp"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b783ea502eso412473f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755073543; x=1755678343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfyHyM+aPoGATUw4nqeYMrokly0/0joq/A4xYGbqR60=;
        b=2Zdb4IQprIJ0hjhgFxmzeKHBqFWu8DWwq8GaxAWt9Bt5tJpOEaR0J1vf3WSFQlvDyC
         wHGnIqA46v49qLZuu8YynwMDvYCGatGSj1A6cAhCf0CvdGAmvIMNbeovyniPLqHO/eK/
         oL26bjQzRoYOhuXQg60uAstIl0HBq5a4MRo0gXf6sqMaz03TCdYwLVMY7NfaJnl2vQVN
         p49gH3xag6EZnr2eSplkv1SC6REycYiF1P2BgVRv7VkUcyRWwvVINa10QH7UMDgqIaDR
         6aX85o1SwZ7sRdiJYvfvekTrgp7oR2z1T+gjnJPNqxqa2XPcc4x8BkpFRk+ykRfRDqmm
         n5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755073543; x=1755678343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfyHyM+aPoGATUw4nqeYMrokly0/0joq/A4xYGbqR60=;
        b=LorGQdtiqwcrdSAuFaLrpyNRnHTbZQidoSvU7vMEe0reXVMNU1Dl/DVPux6BqhDqGb
         MZSctkm8k4lxaY/AA7Vw6dLdU1rfr1Orn+C9ZOO3NrbGnPlEg+8Y3JV/F9jxSGhfYyIT
         CerPvQ+5WmXEEeFzrrKuFTUZfxXxHId5/qg/fD/Rx8I7M2C/cC2lzq5UOCtfxkoPL4R4
         LS38xjaE2MYBNXMi7PRuebJgDe+kE1mYXx7dUeBUpHpTY7zyxZn7cvWkPv1N+7VJsoNZ
         K4BBvO7hB79XJR/aip/6Y2nu9z0vpIc0quYImLJfenuXQdkBnIwdm/1QaKr4n4vI2nOt
         KFTA==
X-Forwarded-Encrypted: i=1; AJvYcCUEb60IR9r3gi1qtxEwG6v/pvxzXhARgIF/XIipFbXPkeXUHbyBNAFSBxK608lV7fgsGtUtCcdDkyTZBvC9Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhY/zpj21Ow8sE3OlOXh2ncVE1NS/OUXDxS6ZVc4i7mZ9tLRxw
	vv1ZK+Hy9J9E2reQHVO7rapEAremvzrF41gKWEYhzeom9hxOD8a6by9SrQQ1D59AX9AZ7dD+eSx
	YBxtwj6oNLkKhiCjrz9vOQ9EF3hShv745VsLX/MTc
X-Gm-Gg: ASbGncvRUf/32+IQJ37jBvcrOqSAoKyT+BXxyRp17+G9LVftFlOTR76cHQ3ozh0NaCd
	8QG2VQlXLXBmTzycBBOZdX7D46MqLgp1LDOsclmioYaPiYYdTLBUx8kkZOvyZ1Fny/NUoSsnWiK
	rHE+l0QI0bUelYuboFgoN5YxSwEf/wOQ7OVWLsyDD6UPz2OBmDVkLrcwfk5lYkITw1iR4TqUkQS
	4Mn52zVjcMKt17F+8LE8aJVc1V9iLo6yt1bww==
X-Google-Smtp-Source: AGHT+IGY8xOJhuxXer2/3Pbwrp1emdix1e/JoImlcCZrrHv9N9isJvPlPDtFtYalPYDTjWDI7ClusCqF8QmRUwherEo=
X-Received: by 2002:a05:6000:3101:b0:3b7:8ed8:1c80 with SMTP id
 ffacd0b85a97d-3b918bf96d8mr1067834f8f.3.1755073543000; Wed, 13 Aug 2025
 01:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-iov-iter-v3-0-3efc9c2c2893@google.com>
 <hpbmPd1Q-NkvYKLgqaQjVLXCh6FOGHnM7qKDqY2kMnrK27N9UT2w1xvS6x4c7aO9_lQNI_G83Jh_usDUF-BPEQ==@protonmail.internalid>
 <20250722-iov-iter-v3-2-3efc9c2c2893@google.com> <87y0ry80or.fsf@kernel.org>
In-Reply-To: <87y0ry80or.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 13 Aug 2025 10:25:31 +0200
X-Gm-Features: Ac12FXzKZ6feZxlTBnmeKx7gtVOW1A7zFEt6VNKxhvPnfB3R5NozAOUkzYS4tRc
Message-ID: <CAH5fLgjNu9YaqzEoaHfoxCA3Rh5_4t_AvTEMHNqb0vYKaRcpag@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] rust: iov: add iov_iter abstractions for ITER_DEST
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 1:31=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > This adds abstractions for the iov_iter type in the case where
> > data_source is ITER_DEST. This will make Rust implementations of
> > fops->read_iter possible.
> >
> > This series only has support for using existing IO vectors created by C
> > code. Additional abstractions will be needed to support the creation of
> > IO vectors in Rust code.
> >
> > These abstractions make the assumption that `struct iov_iter` does not
> > have internal self-references, which implies that it is valid to move i=
t
> > between different local variables.
> >
> > This patch adds an IovIterDest struct that is very similar to the
> > IovIterSource from the previous patch. However, as the methods on the
> > two structs have very little overlap (just getting the length and
> > advance/revert), I do not think it is worth it to try and deduplicate
> > this logic.
>
> Is it not like 50% duplication? `as_raw`, `len`, `is_empty`, `advance`,
> `revert`. It looks like it makes sense to me, but =F0=9F=A4=B7 We can alw=
ays do it
> later.

Well, maybe. But I think having those be duplicated leads to a simpler
API for the end-user.

> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks!
