Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01EC1DF24E
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503570; cv=none; b=BYUNZzM24gYGGInC2O2t71DVZUrhHQesm9on0OhvfgyrbAcj8nUvkaothUvVgzc8eZCeVdnFVr5JdZYwMRk6glgXnU0AmUFKU8/Ay/w3kp/dLRKGdBKOPw8CbG/nYcLJfkLLz0mMlG7BzoM6nSN7XILkR0AoeWXwLJUok+K6nSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503570; c=relaxed/simple;
	bh=ednjTSjvw9Gt99tA22MMvDogCLInNdUvhE7Mq9C+1L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxS76n0XgV90XoswX2EBp/I9tAJqgv30HilqgR4JNBK+rqlhfU7KQs4N3y5L1451ymBWzxM0KO9gTaPrCyk4/yDUMXNJdyQteA14Wr+CAaRxkJTIKpwS1sQtISC0YktG8KOg9vjhGyz1MCbuOfzoPYOVfmtw4nxNoVzp9hLKd28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r0mOhkKe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r0mOhkKe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390cf7458f5so860980f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 09:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740503567; x=1741108367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ednjTSjvw9Gt99tA22MMvDogCLInNdUvhE7Mq9C+1L4=;
        b=r0mOhkKe52C5HSBcSuZib+01ooiaaXSa8OeULguCFDcuOUlBBec4b4bsNwAmhh7LhX
         pImjvjtHsEUr+NIL8ekHZHzIFmnjHK7RAP19zt65Gv905ZFC+9z9s9spGvti+jwlE3h6
         sWtl3AF094JttZd8Zlnu+E9OCTdv0UwdxE1c/m0OAjMZA1RRsuDzhzashXa5RY1NWdeX
         P7+o3ugmbKIKha43Qmw3KLGS+YUrTKYzt77gJ1Jx0kP0viM0FFo0ev5IwQhlSWY1JOsY
         ucO9JdJ5flqRygi0xl9nsd72kjwjkUWErL6K8unClBs+33NWuBD03oVhjdN0wN6qfC2T
         FHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503567; x=1741108367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ednjTSjvw9Gt99tA22MMvDogCLInNdUvhE7Mq9C+1L4=;
        b=g/9r6FXWqentK5w8/FSyfS+wAmwj2w2mvBTbisSF/yb2LuV9jBaNSS4uLdGCgoMXud
         bDdfRUX55bYIxF1KlLOJWa9Q0Gw1hgPDLYU1hwDSQXE35vGj2KAjk6ABD24tof2pK2oZ
         a8yVIvFcnIgeVGFZ3kBC/8BbzqK2J1sh9g5qb0OZPNn9taEPtZsFx+btAIOmnLs4JY9l
         yWL+mnn2GMBLVahKoO0zxdSYTJhqRHDNAa22iaqH7309SA8+s2Omh80ZMAooqbB/LI2a
         ePeScjcFfZC4vl1hbzQSeaPk7d94atKvDQoAsQmW3vorQWFAxlf1LNRQ6LgVz9Mo/2Kg
         dPGA==
X-Forwarded-Encrypted: i=1; AJvYcCX319lilmKdJ46sq/TzQiuVipY8UKWIPYDKBcXEQYxIzBzGZCtWM7wtLe21UZVZUziWKtwRHUVD1+zMnu/TIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlaB0RSAZW2uW7EtX2eyCfYUEgBorYqadD8Rv8sTATNHKxJzdG
	r5SnlVLPywKZWZT+X1VKGJzLrRlVD5nZa3ZPUrlqxVZoMten20VPbpZJ8RfQm7mJ4igyibprunJ
	lRcUvvILS9Y1q9Oo0/4rVguWKhelThvP/hzMP
X-Gm-Gg: ASbGncvj1E2ek496k5/BqV4YWWgMbiQQaCz4D4yfoAUCAU/uBg0GQms7liSQ0OTQiOE
	OTLvD+vPHcfpjk9b8rss+Px8/HckFZd/Vn+l867LNDg0GGpydAaJJfLPSycC6gf1O7LafmT20Xk
	THJyCGmDo6AJRMuNIKCKj/gNAlPlHEJAE2Gfm/mQ==
X-Google-Smtp-Source: AGHT+IENL3tkr5YY1W1LPao/+fxPS1FpvFsCT1UPYovJTPV5D1zitQeIdtwEVZnuTIAS+IO71JyVmXj+d+y+IFJL6GI=
X-Received: by 2002:a5d:6c6e:0:b0:38d:dce1:f207 with SMTP id
 ffacd0b85a97d-390cc631a3emr4656547f8f.44.1740503567098; Tue, 25 Feb 2025
 09:12:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740475625.git.viresh.kumar@linaro.org> <68ac0f0ee3c0ebd3d3cc078a6270752778a1b732.1740475625.git.viresh.kumar@linaro.org>
 <CAH5fLgg7o7hs5B4mMzPd6RzYm+RcX8gw1Aw8voJqnmfnA_aM4Q@mail.gmail.com>
 <20250225114830.64p56bndn4hkkkgq@vireshk-i7> <CAH5fLghUDz8tpkTuvWZgwT2_VKgxuS+iZKnoT4prKwS9tbp8wA@mail.gmail.com>
 <CAKohpo=uiCS6nyissb3ugiyniwnZYu5kCf4+bp32dDzRhgGfCQ@mail.gmail.com>
In-Reply-To: <CAKohpo=uiCS6nyissb3ugiyniwnZYu5kCf4+bp32dDzRhgGfCQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 18:12:35 +0100
X-Gm-Features: AQ5f1JrsvkSYfxf47nMcctFkIDr7cuUGNXZJBCZDafLE5kFdCo2jxMcIoSYI5eI
Message-ID: <CAH5fLggyEXyyaFNnmBCPOSX051TiFyAp0B8GfahbPg=+LrtUWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: Add initial cpumask abstractions
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 6:02=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On Tue, 25 Feb 2025 at 17:23, Alice Ryhl <aliceryhl@google.com> wrote:
>
> > Is it a problem if a value of type struct cpumask is moved? It looks
> > like it is just an array of longs?
>
> With the current code, if I replace the Box with an on-stack variable,
> the kernel crashes.
>
> In my usecase, the pointer to the cpumask array is sent to the OPP
> core, which may update the content, though it doesn't save the pointer.
>
> But for another usecase, the C code may end up saving the pointer.

I don't think that case applies here. Variables that could be stashed
like that need a destructor that removes the pointer from the relevant
C structures. This is because pinning only prevents the owner from
moving the variable - it doesn't prevent the owner from destroying it.

Alice
