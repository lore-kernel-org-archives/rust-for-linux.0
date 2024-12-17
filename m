Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A07C1DF969;
	Tue, 17 Dec 2024 23:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734479602; cv=none; b=le1DQAtikrmtQz5U8tQW2taXA1oiXoFWJ1i0V5B3ngf4VZnXJPQGo/Izq7hR0INSlM1M8sObz572PuauAb8mcAggkBgKyabvBLIkyYm/x4yR+02UIUDrCDqPd4LLOB8nFJnJf5vp5tEnbA2jyAoFnc0ekAIwfHBF8D+O3pa/coI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734479602; c=relaxed/simple;
	bh=g9XFySkcxFkLSbt2Ir+IAGAtPdSzDqxAR9wdfDxPxpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSgnQDd/qqrSautiue6zAWhItdku3Pp9qL1XiKxT9uowm9MXxufQiajVvgnkcgq7imA9XHqo7/rU72myZzLPgsulL4BaAIU5f3Cgb1WOOTmAyfwS768bxz6IYKguTT3F7N+OyX8W50ZzgyyA7T1oFjUBO1lO6F2Xlehwrr4kPto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9XZo7s9; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9XZo7s9"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef6edddf70so679719a91.2;
        Tue, 17 Dec 2024 15:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734479598; x=1735084398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9XFySkcxFkLSbt2Ir+IAGAtPdSzDqxAR9wdfDxPxpc=;
        b=A9XZo7s9Cg/SZhKWTx881iboyzNTWgYm/eL3tIn5HpwTAbT3u9cshpOgbrym4ofngN
         amdKIvdwBepKLJb1yjDamK8CtHahVBfpzYGJv3crun62m3hkxkRHBlJSjkBUY/z2OvEL
         9P6J3KW9qTs64U64vNJfDlXtaFotCV+SUSvWhj1Vmg7+MB15bk/I1OI43LmZP6L+VxBl
         JMARuk2+/aHEEVndTUPlOs0pOGmoyKcYYDoy9uJDRjJ/+yOn2X2gGxfKjuwODgepl/Av
         hSVCU3mZ1Ey9TIZomDk4pNuU75y7grvYVDzGNwqI+aKZyehwX/NCEOXERwY36iPpPQp2
         Pw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734479598; x=1735084398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9XFySkcxFkLSbt2Ir+IAGAtPdSzDqxAR9wdfDxPxpc=;
        b=Ol0Yl/7V2m8ZMKWpU+PX7qe/FpARjMaOXJkxIu5gNb9rq4eY1qt7MesfCcNo+G20r8
         5ll2oP1Wg/dsz05hSnYWqBUcCjWZx+qIMCktB4iAxx+LI2czfFWo+8ad5eURmyoeWJzv
         b15PGYE9Kb4vnftzLJiR4huHmUwclHDb6VRdwK8DMSVDT1CWQFMuQGyAv3u8zPqthIS1
         QnezFAvh50dJVOdcX3IGS9XXJ+E8tF3MSHGhczFl1DCwUgmXQgdRH9ornXmnQlq29RVS
         4oy89z7SGddQ4XcS9qxKxDBsDwn1W+GRIwAQwcGkJ644UsVQIbFSuA7LQnu1a7J1eTxU
         nH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCenMGysCYm0RMWVE7ACUXgs8dVy/dlOpgh0KWcTHcXp9UCuIuK/bMLfgkWWCP0NzHilRDe2YVHOIfRUs=@vger.kernel.org, AJvYcCX7wMr91GtS9S67z9Mjdk/UrIkN98/7xdJfXEZ37seMfUR2p168WdVYx6vgr9Oz1VxKKhMr7Sgk6xXCA+2eD40=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHjrzON+3MAT136kkBeIZxd/frNFnoO6Ms8z0tW7DttYIjnhw
	Gum0xPxQJ1MBHkTmBy3M5EXQi+8i5g0gAqb+i0bOcN4Q7fmcNJaYQUECUDfsQBPlrl/WghAijLV
	eiVe+37IDgsy6+NoSPYYdVaaZoNM=
X-Gm-Gg: ASbGnctyDylHIO0CPsqc/L5grEv1tYGt3Aj2XAv5x1FtRLSQu0QWO4zjxwcOllJultC
	ROUZZCMnxf0ZozAZass2oNbgrKiY8q043v/X7tg==
X-Google-Smtp-Source: AGHT+IHwEW5pqizX9Aocq+Xzv3re1ZfonN6tY2wSFjkX93xZGdnFNw1QvF3L8jTOr3ox9zBufiwZWWwThhdvtN4+bg0=
X-Received: by 2002:a17:90b:544b:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-2f2e91f1bb7mr430801a91.3.1734479597684; Tue, 17 Dec 2024
 15:53:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107-simplify-arc-v2-1-7256e638aac1@gmail.com>
In-Reply-To: <20241107-simplify-arc-v2-1-7256e638aac1@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Dec 2024 00:53:05 +0100
Message-ID: <CANiq72nCpc7aEJXyp_qmtrTcAL3fUhOC5AtgRT3+yZfuxYeAvA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: document `PhantomData` in `Arc`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 11:36=E2=80=AFAM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add a comment explaining the relevant semantics of `PhantomData`. This
> should help future readers who may, as I did, assume that this field is
> redundant at first glance.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
