Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4B384CE5
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763919; cv=pass; b=FsxGnI46sJYtQvP3taX658bHkW6uufqCon/CCABFIWr2mVO6hHGmLsx2gqoaB/jCw4ExNuNECQUa6DM+hBg1eA2nyHugdZvSo5C/KSVowuhoE6ieAUvJ7TXkSy1sollMClsdixZUiwPhXPR1sXGPUphOy9Zucg/viIYcJUQpEzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763919; c=relaxed/simple;
	bh=+BckQeqCjf5DtL02w8iZxJTDEf4ptNGWbQZiIUkA1OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arqwX/kpfdmJ3cw8m4a/niOS5iJh3TwcdiQ0MFsX2fbAqgUh90rYWcV0kU6MuqbVUNJem5fDlMoe9xDaw3d/AADm+4mPEr5GnsHq456FWfz5mU5DxLSan/Ir3qntd9v7lQVOzGTQIivRvpgNP0XgwD6Dd1aYYQ4WI5aW6wnnDP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWtfpqn+; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWtfpqn+"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32be7127c64so586394eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 03:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790763917; cv=none;
        d=google.com; s=arc-20260327;
        b=pQjHsDf3mO9mES7NAIxxB/0QKss2QjB8b3BT1TJVKa0BEXxUpbjXxmo+7lpp5h6L4e
         YmDz5Dhp3oifvO8IeRfdD8lQR0x1iVmVIb+1mbn+p/GlmDazU6w5a2EMWRuoodNRI8A/
         HjGaPFRjkFW93qBEz3+rEP9kQi9rYHm1T2y80sfypWHEeOfNcSut/n5SKK/ZAMwqerln
         ptgNDW52eWewY++TzY7eVffdc2M7kzfQnUpBbnysrHqV6i7BAtizPCca68t8dEX4U29h
         mqiLGzy5zO3drOA+LTHeYqrizFoSs+d6sC0sDUshS2FwMy5SekgYcjkf8sB1isDE/bVt
         DZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+BckQeqCjf5DtL02w8iZxJTDEf4ptNGWbQZiIUkA1OQ=;
        fh=apFMUtRJQqznK+VDs6CHH/HJONdAQOcypgGD6zFFR7c=;
        b=CrbcmIPwYkudszCXDtVyV4YMlsjfQnTXstjnyAB+y629kXAQE3WJcKhIzBK6bZRSww
         AYI4s4JwGrQ1e/XmvcPlsNQsk64BXJb0TH4D4ld0yxvE+zHpXX0dL/LX/JVy5XPh7qdJ
         bTnyKP2s8DJRMD+jRreH6j33S2MeikpDMZn3e3CIjdX1fKBtuvC1J1dCvNt2et/A2qjc
         Et3EpspoSiYJTphG4TjxFC625eqnMvYS6QXLoZIgTBSnDnBlZ/EkiReG3wVrPIHHLbsT
         39DyY84u5elw/VcjOqm0t/8uX9KJEXXdWY9XEAEMMRBb+ec96Xb1Pe7M+TUsUUH84t2i
         10xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790763917; x=1791368717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+BckQeqCjf5DtL02w8iZxJTDEf4ptNGWbQZiIUkA1OQ=;
        b=KWtfpqn+MiEDSxElROEkXnhpxWnj/WeM4n+DWGyL9b0Vlym+6J/NW9IV+fI5aCsFIG
         2plL2ED3CWJWWBQNsX/zBCZjQyj9S5PhRLxkmlpmcvKAuDbfqf+ruhY3H3Omk4SY0B1q
         o1C0nxl9D9hzSATzyuOHMZ4Ega8XKYy8lA/9bNTD34UR5wOMAjx09vitDIPhDd+6tcrl
         QPzymo4Cj+P5Ld6i3SNdCaRyTEntzPql+KGYG1QCXWbIDL+OwmmcpzL6AOwk/1HDsJjD
         BBmN9xaFgbFGoJdbsob3NJncKDOBJLjP/MpaqtEg4DIkwDH8JJBqNU5wLFnp4IAPYwJ3
         qFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790763917; x=1791368717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BckQeqCjf5DtL02w8iZxJTDEf4ptNGWbQZiIUkA1OQ=;
        b=ZJiIIzxAplvDJpHTpEeYH4LEPK9ktQ6dvdacrojXbGcxwaJ4jf+q2zQ7GVhhc3I0HU
         UUbYvw2kXTn/KOeVx52UqUxKkIxTMFLKs+N6ANMoG+xAKhs072HwXLddFQwugSIFblvS
         62Y89O6tW4/Sisc6Gntw2nA9hESk0eawnV9pU0vJv7i/kwIAsBCPFoVfqUJZsSTt11wl
         uPcp6QwHXK+vw0B5dWcEE0vv1T4l765vDh3M9vZ+yrYqd+iNNiTtcz8Dxozc2Bt5nTkM
         tYDW+mOQUF/OJJRkMOnsi+1CbWjZoWaCRfWqPZyysg1aCZyXBHE+f3VHHVGWQtGZZQTV
         tV9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDBdCqLoWYRxjBaJQ5/Bt2jWLIrvRyEpHCxIC2QJrVUkghPDBqXziALeW+vcqlmBzex5Y30BODehdYztPs3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1sUvOYixfGVYZqd8QVDA3A7Ij+q1Tvz++uK3W+VZZrvWjcKQU
	JKxlfgmoc0yHa6YoJGNOIIX3d+jlnqpJ8aqu5qynld7CwRh2se+QsC7w8/pzlIH9J1WqtOdL8Wf
	stv87U9ieiiEV8YrpQVC4wfAspK98ZPs=
X-Gm-Gg: AYBFou1u8i1GMM7JYYva/zwGg8kiR9tn2p+r7Wo/kHzlP3gLvXhIDbeKlksEVYawXXn
	c7q6B7Ju9XWZSja+Th+/DxCozW6oIGF6vfs0YZUR6e7fVSbCIQPhM3DUo3zF7C2Oy4RLrpXiviy
	uPvRsC76gJmBpy3+gMr/6pgkBkk8sYCwOhQr4jINZaIFQYDekTXvoBDEex5O/evzNQTWbdACumo
	PPtFq081qXMMZJJPTvbc0C8FzkxhD33Aq8uOQ98djNS8zRZk/8n+bFiyOLxgn+CiHH/2PeEjaLd
	R8ke6nRGpNN35ZgQCntBLOYlmovMyfKb9iLKMUquzdk9JKMS2p+6dVHE7xk3w1OME6O8ddlHX21
	Z9sXpYSjFHdyKQULaXKht5Mo2xa8xSX2EnXyZREwXTOlaiTwT1YhuroSk3t0x3KqUVXaLZyGmGr
	za2NEbux/iXYCzBKgKYDoW5Uoo1OuaOmhgaCNIz7Wc/Vp4W0h0D/w=
X-Received: by 2002:a05:693c:2808:b0:34c:3ae5:ebc with SMTP id
 5a478bee46e88-34cd60f8956mr2288650eec.0.1790763916685; Wed, 30 Sep 2026
 03:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org> <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 12:25:02 +0200
X-Gm-Features: AclHuK-9soeSKJJsB6DKjyrXynv8FkCP8rCSGYJyZXnDc7m1U0RM0WwdazlNfrs
Message-ID: <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:46=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Yes, this one is independent. At v1 I had 2 patches adding helpers, that
> was the only thing relating them. I thought it was better to lump them,
> but maybe not?

Thanks for clarifying!

By the way, do you think the new header is worth it instead of using
the existing `cpu.c` one? If we do that, then we should probably add
it under their `MAINTAINERS` file.

tip may want to take a look or give an Acked-by...

Cheers,
Miguel
