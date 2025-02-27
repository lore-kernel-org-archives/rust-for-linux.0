Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F46A47
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740614681; cv=none; b=tKL3QY4uEpsdb6hD8e8L1uW6MfbcHAnHp87Gu7s+OvXkIoGHJeG+Emf26WrsAIuOE0BVJAJ/0f596jgEkjCT2NXWlCQjJmlsDHUvt2YM/dmdyvXuFG0WNAngG09+j7gyF32c+Y+tTMfzG/Y/kIipb6saaCyNwS5Bx+4mNzOXCkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740614681; c=relaxed/simple;
	bh=ebhWn3IvQK84c2iP54rZ5HLxq8SDs5x2uyrN0khsg8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhSABfqg6Hl6NwraM0J8LzUjqE+sGbl/78B8HlenrI+UsH+fAQvyXqsdNjANIT+bCv4cm6AztWmzNLR1HKNOanC9TaRfIVP81EiNnuevANsExIN7sLPyETzmTG0RVcct/iFFveGMp1v6Eutetz//SeYhLC8rbXKFhImegJPU9V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XRTQDj1c; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XRTQDj1c"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso411228a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 16:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740614677; x=1741219477; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=btG8mYMCiICkMqPGz84Q01oKttOQmb9UxH7nIH/qm+k=;
        b=XRTQDj1cVOm6nNrfA0TgX1A5guzzWXUJYMerXM6HygqZ6IWB9w3Rr9NrIjMt+pirXO
         AgNIS+dIX3KFhhbtbvGbgcw8NuAdoabgj1TqFzA1Ts2ZBu6evwsgSabg8YOdtg1j7cuV
         HjRqlzFT7WTM0QrfKf9XNvI/Wx6r0UEjENF0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740614677; x=1741219477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btG8mYMCiICkMqPGz84Q01oKttOQmb9UxH7nIH/qm+k=;
        b=VhWHfIP4sjzTQtFay19mzElMp0ERIBD3WKZ6vv6h4cXfZ/mbqu25UHKFp4RZ1B/qZ0
         y0Uy6yfFBi3cUcO9IASuiM7OaUte4a2Cb6ZBXCTkjIwGM+7QIOcsrADbzkWZ3yubNBKj
         90ftCXrL7KiJ2SBPu2borEi0W4Q5OsjzWg3v5Lf1haLbh1wTNPfvu1Sj/bByWMohtjZ7
         o/e8r1GAYZm0IsThoh35dNEyA/N2CnYwVDWVvJnOJtHM+E6EwQsTHQETn/E3cKOEFgDq
         wF1l90WqW4vDY7EHn7owb1Te9BViKIffZ1QVS9MXiTFRHDau/WrON9Uz/CB1fl2hMExs
         z7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCU4s+oVK80keMiyj4qLCw2i/XUmNibJUAhYjn5m5MfJs7ODeo3yjMmArVFpw3uJh+yOd9a+WhIbIJymJfRkOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHz72N/kc/yhPbKNTLImZeJ1raPz7D9SleOXVInCNMW1GiXHYq
	hxNnsF62pvJ/v0gsdSigxwi567QVCDJi25Nod2WnatRifpL9zbzXZmqyL3DG3QdgjVv/aq+y5xY
	md4kKsa1N
X-Gm-Gg: ASbGncuYJMvTEgM3WN6x4O7m5qYyrW63xt926NdRZf9QOA3y4EOwEgJIxjP9tayGIIG
	xAAd+CU4KEpHpKpsB7BjSurpyIWJUEjO3vmsstnO7QprK8cYkh+vZsyGpKnsWQ1gxskyfbi24X0
	HNHbksTCqH87EFy0eKYZeCtxt0EvTwlXfQ8UbhbTfIQeFwEpO8EwIfNc/enAanFQB/OmS+Syl5/
	BsmdNS8Zr0d/rEbXbDh1R20h1NjoNnbyfiHVu6OrgUq7VVVFo0BT2U2pFk2UQ/emWvCFtdV9yvT
	MOd1UE7ZW240LZEsM5RqvJd3EIwmECA+MEHst2aKrvTlxpSHKrgGPY6IL/3QqmUAhA6eb2sQdY6
	w
X-Google-Smtp-Source: AGHT+IHB/F+g5JAvFNJvg4BgocXTH329DL6uVrfx02+jtH/pbAwonSLJbbH91w5dNYiAMVyiHqum4w==
X-Received: by 2002:a05:6402:208a:b0:5e0:2e70:c2af with SMTP id 4fb4d7f45d1cf-5e44a2545e5mr10099529a12.26.1740614677104;
        Wed, 26 Feb 2025 16:04:37 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb4384sm221152a12.49.2025.02.26.16.04.36
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 16:04:36 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaec61d0f65so62446466b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 16:04:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzqKI9sN//xB50DUhwoVlZ93o45AN4Z3FBOVutwp6lVXbJGHp0RhQDpr+J8Tutzj4Vtq/t3Nkz83Ysk1w4vw==@vger.kernel.org
X-Received: by 2002:a17:907:97cd:b0:abc:28a5:cbe2 with SMTP id
 a640c23a62f3a-abed10fa38dmr1141732466b.55.1740614675833; Wed, 26 Feb 2025
 16:04:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <20250226162655.65ba4b51@gandalf.local.home> <CAHk-=wjAcA4KrZ-47WiPd3haQU7rh+i315ApH82d=oZmgBUT_A@mail.gmail.com>
 <20250226165619.64998576@gandalf.local.home> <20250226171321.714f3b75@gandalf.local.home>
 <CAHk-=wj8Btsn0zN5jT1nBsUskF8DJoZbMiK81i_wPBk82Z0MGw@mail.gmail.com>
 <20250226173534.44b42190@gandalf.local.home> <CAHk-=whvzK6ugXhCdrTfXnkFR+u_+sCtwz4aDODJ_h-RJ3kOKw@mail.gmail.com>
 <20250226182809.5027e483@gandalf.local.home>
In-Reply-To: <20250226182809.5027e483@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 16:04:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsAoXTR+7=SxHykUs3zYzjSkY8Up2MDpjJF_PK8yVYQg@mail.gmail.com>
X-Gm-Features: AQ5f1Jr4t0-VhZe9fJeoxS_YfOncjbgQB41_Y7QaZ9cZa_P903tC8ltOlxJUG6E
Message-ID: <CAHk-=whsAoXTR+7=SxHykUs3zYzjSkY8Up2MDpjJF_PK8yVYQg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 15:27, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> My point is that the compiler is free to turn that into:
>
>         r = READ_ONCE(global);
>         if (r > 1000)
>                 goto out;
>         x = r;
>
> and not change the expected result.

Yes.

It is safe to *combine* reads - it's what the CPU will effectively do
anyway (modulo MMIO, which as mentioned is why volatile is so special
and so different).

It's just not safe to split them.

        Linus
