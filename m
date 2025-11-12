Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A2B303CB0
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762944909; cv=none; b=WcnQh+gBubdD2/v/0MHjIdHELOf05onfwo4xoyurSXbVW4V+kzbyURAaL6wynCtaOxqOY1EQ9lNPPJG9nalg4BemogsEcEizzWV7xIfcAnGDZZUozc7af4/JiHfK5P8FndNJvVCN1vu1r4s0gUX0QAGMtxK+YJL+sH5lyUyCQ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762944909; c=relaxed/simple;
	bh=82sfAS4BKz1KNiaLNqx18bHdwdUYK8X02FBvH6vmN1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGyIVVOo/eU075kl4h1WUGn1IxYRsxK+PRjCSKvZeMIx38MmkYU4D8bQrYN8ZAvblfyOSLSz6sh6FgXkqVrcZaincVkcyHnrwCthmjja/Eq3HM7Bci/9NIGtpGa0LPbW31TDQ4AVOmf7MgKz3hVbjcccdcJvaeo+O9MuR+u2194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ED27z4KD; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ED27z4KD"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b87171370b5so93302a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762944907; x=1763549707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQJWtPZk17V4l48RMFU2vUfDUBcuLAHxhxXOZo4IqCg=;
        b=ED27z4KDla66atEkRYysJmuTML+lQHJxLuAp3jhRIY1+XlSwW+hrhyNhdm0TrxwI41
         iBlsA13sWRigSXpGnp9wOKsIhOi79fY+8GWGAg/2xPPHITEM4I6Ao+gB/jOUHJUFTVVj
         TQkwS0vY2dv8SKDri2fAeJe9ThGageatQMLTcaIm9jKEdqvsQDKdC+OQqWvXN8ctirmd
         GQH0gOU5QuNuhBkqkdeYagovW+jnqwiJEQ4adTMDi9LqLpJ23QSrIfb6Pu1pkK5N18RB
         5IRMoTMy1qE45ThKmUaMd/5hReGtC2MaBdD6k7Eci97Cb79IDn8lQZiN/kHZ6r1geQ/x
         lQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762944907; x=1763549707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kQJWtPZk17V4l48RMFU2vUfDUBcuLAHxhxXOZo4IqCg=;
        b=njnB88xeFnbZwI0uU5FBN/GC/X54oHFOZBeq4D8g82knVqDBj5uq6Z14jWjBEUGi5B
         8nw4rGvtgnim5o3iAbKxRUZma/vi61qB7JB/863XLpSdIub5/XmT6Wi1QxMboDUNo09q
         IiXoIcWJbxSKMa/4UtcpVQgqZ1Dgog9NWOs8SPy37sJyJdTHOUlsryOHZno4LuQLdVN7
         yp5MO1GE5U8zZslB7LfpfQvAcFxY3O6YQpofrQxQb+hYrUQbrri6RJ+YjN+5EOqBpAbn
         bbdYQwz4UbDiSQSBe9TZW4ZccKp8FuGBvo28HljB1RLqwyONoqdhaeUkCxlVlVzkQ1U/
         TObA==
X-Forwarded-Encrypted: i=1; AJvYcCUbs+Z9iqihWmEXXOMGgZjuljaQBmhK2QQT5V+qCNXEPN0wmcQJq5gYrYTTHzBRnSD/6iNZnZKCO4U8uSddCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi0Dathrlj1GFJesFEC/aD/+E6Heuh+LPfML18JesJMlsExB/e
	rsyBLEEZDgBcMmfWd9jK5wZvyvpAH9Jmh/nPWa5yJNhJPZJME94d6QLs1LzobT48EyB1z6gq6Ui
	odrqG/3/sKfHzgr+eAGxkjFWrntH45ro=
X-Gm-Gg: ASbGncv2EEN4aNMr0qhsuZooLWwyV1F3TqMFwySSdRMQYB8rZyjs3xk/7jMFqkDRAMT
	twjRyB1Z7x/tPvi0h+Y2x4YER67DsIG1rk7sg+Q/hPR3SeD2ooyza8RtGKOhnPsG47ELL9ninAx
	+/RbFkHRBo9nKytBLd+eTmFU5JZJabVXOSRaRcOq0oS6QgvGaG8AP1my/owIPyUB1yd/b/e9mwR
	X6VVJsUJ+6VcNMPlQ9OKqZ/Q16gfZAtzmUYPFZfCZXIn77vcUZapc+ALKZegdXN5Fdwy1Oeij99
	Z6P8IwVHT0mTqumCOjBpbl0hvsu7V7R3Amd4jJhL4aGbyOAqJehBSZRLmmhcZzVZQ4bkeUh7uhz
	+HNg=
X-Google-Smtp-Source: AGHT+IFsTy6OYScG+CerWDpgPGJvvrpZZa2slmzCw2p2FhMd++qGQwfMjY8XkE5BZNsi8aZK27qX30hA8hzulfn8Qac=
X-Received: by 2002:a17:903:2282:b0:297:df7c:ed32 with SMTP id
 d9443c01a7336-2984ec8fb37mr19636225ad.0.1762944907518; Wed, 12 Nov 2025
 02:55:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-resource-phys-typedefs-v2-0-538307384f82@google.com>
 <CANiq72maV_j1uV=2nPGbTgRabnk8cpc7TNN_FQ+ou52OpZ=k6Q@mail.gmail.com>
 <aRRgbZ67cuW4ZoBN@google.com> <aRRkzrUw1iYNt8KJ@google.com>
In-Reply-To: <aRRkzrUw1iYNt8KJ@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 11:54:55 +0100
X-Gm-Features: AWmQ_blEy9lDgXUuRaA9PFmJsOL5mkEF1Q6ty6i4iYdlOSuG0l-50NngYkbjG7o
Message-ID: <CANiq72kEYWbQ_yqJKHoa=ffereCun4A6rMudrcU+qBK_Npks8g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Rust: Fix typedefs for resource_size_t and phys_addr_t
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:43=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On the other hand, I think that the first patch qualifies as an actual
> fix.

Yes -- for that one we should add a Fixes instead:

    Fixes: 493fc33ec252 ("rust: io: add resource abstraction")

Which means it may go to 6.17 as well and the "# for 6.18" part is not
needed in the other tag.

Cheers,
Miguel
