Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BA9154C12
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Aug 2024 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724499031; cv=none; b=NY1L7yNxTYsExDOsMGa3BY9OoLplOMdX6bA3rbaI9+A8yPJsTeZbLOy9eT3ihR/znkVGO3St/DKYfpR87YQy6GeEWHWwpK90+DABsl1vBR5SZ/eqe6mMDULNM2fZum/fD48i0UdRKHNiF2q8c3k+c90k2ndEqVoWbtrwSxerCwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724499031; c=relaxed/simple;
	bh=BwZJ07m5fDvP+xNF6j8iINAkVMSAYkM8ARI6wMYjAPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCSMnWHuK9A9WAt3crr7LIoLF5SOTnlpAtYZjiKAAx8YDvDwXpkSEyf1QHumuvCepnbFF8oEAZhhHpQxIHM+MFWGLOyNhAad3vNOsoi+dEYao+iZai1YEwBlD6y7/opFA7YNhpjc+vkZRa8dXh0DQ/OEOVGQPOVdoYytZMx1f40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=GLi6/OP4; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="GLi6/OP4"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c32daf0797so28858617b3.0
        for <rust-for-linux@vger.kernel.org>; Sat, 24 Aug 2024 04:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724499029; x=1725103829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwZJ07m5fDvP+xNF6j8iINAkVMSAYkM8ARI6wMYjAPY=;
        b=GLi6/OP45w+9ghJaThj9sIfeBW61k9CvlBjPiJvpdOOxNEuycXTAL1mJMSxr2rlsb6
         KAgTCy4S8xUebZY1tCQRmDwCG2VrRRus3QOSjthDh3l2zCRE7u+MrTg8GhVWvK5C0XMN
         Iz9tSvogDSsh5Jdz2g64EUEqrtGsRY2G8xrvLz9zJQ+4g4SPIp1MGE5qlyaQ5kVPyVB/
         ixf+5DgJZlQRcHJNISncED1Xs4p+hf3ErDUhqdmBsRWXu2D1F9paT5slHNIhL/ftLbpm
         ZZHP6sQKOdxmyWPZ+KoOdLVaUrmAOIIBJjOdTIsMJywZwa3ttepznCWDN3MAaCxsOynf
         QHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724499029; x=1725103829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwZJ07m5fDvP+xNF6j8iINAkVMSAYkM8ARI6wMYjAPY=;
        b=uBScoSrsaSoh+Rl+eWEYNvMY2zRyYV1dh8vym9EhiL6o99skZk5vcfgsnuzjDGg3fF
         WRUgaA5eXY1QAOI6quIwyLQDmX9Wn8qkbA6zjUHxWClQxlXEQsp0DzgeMFsQvUB86ryl
         kPb0Ywgyt539/NonN7QA+FCK2Hn6j3zFsNeetV3yKvWGPGhv0febRVPdjM5yBnSFyMC4
         o/EQGlPTyM9pUtZ5MIpJwamdvCLKQHmcaRiw2mGaYzHu9wQoHSav8OkzhzDIly3LfZM9
         4KN/LhyfuzJqs/xEmPcQKTGoFGeZnPSh76tMcPlu08zN7E5ai9Zvke2eG9OXIhgFmkUa
         oEKA==
X-Forwarded-Encrypted: i=1; AJvYcCWO90WzAOZtjvSTkGfHdQbZrP0P6ufKtBIPWoUnmfuUeOSBRKIo2yg7Aetwaw85bnIlyPpYDT1caqCSPcPESA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI2yxJOE4PGv4JqmVqcKgURoJ4cQH9FaRuWWqFypn6IKJz1jrz
	lHYimFuGdV92tIYi3NKGLGTEWKPCq5MCnhswQAD7u/0eYqJf2qY8iqdR1EwQmM9/85otKeD6qaz
	Ebqmca4vBtbAhEtiYAYe4Pf4/uY5sUaxELCE0BA==
X-Google-Smtp-Source: AGHT+IFJaQU8pLvevzDDu8q7NmXn+7PVuBa8CEcqMSFYp2+vaDk5A73hmg7JH+usAplnTl1ihJSaw5aKBYrNSmraA6I=
X-Received: by 2002:a05:690c:7604:b0:6af:c39c:da99 with SMTP id
 00721157ae682-6c629fd7827mr54072137b3.43.1724499029274; Sat, 24 Aug 2024
 04:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819133345.3438739-1-nmi@metaspace.dk>
In-Reply-To: <20240819133345.3438739-1-nmi@metaspace.dk>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 24 Aug 2024 06:30:18 -0500
Message-ID: <CALNs47sF1o4x-=wPdy6c520-sCX_+sA=158MMP9c0SByKvwXfw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add `module_params` macro
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Adam Bratschi-Kaye <ark.email@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 8:35=E2=80=AFAM Andreas Hindborg <nmi@metaspace.dk>=
 wrote:
>
> From: Andreas Hindborg <a.hindborg@samsung.com>
>
> This patch includes changes required for Rust kernel modules to utilize
> module parameters. This code implements read only support for integer
> types without `sysfs` support.

Also, I think the subject line needs an update ("rust: add
`module_params` macro")
