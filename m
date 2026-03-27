Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F83DE45C
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607975; cv=pass; b=Lly+65cMYl9ULCtNBTsGnwD2lwgFtoZRsZIEhvjvznPO41hh370t+QRSaG2Um53Zz5edU9xw/rqnmVu/qQW5LKUTRACS3uXwEcAYGAV95By08cINhC6OTx7WLtTcAG0fki+wkIQtEIWOWhAaQHLWP3SX/I7aXcJzYaTQJbaY4dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607975; c=relaxed/simple;
	bh=KgmKnCUtJdjeKLpSmoc54lARtS0ABFL1HxE3vOF4+to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuxrHg+1LBhuy/G8ehJaqjmr60vlih9M+82BIMxHOO+Sot1Me0pcedaJeb5UeU4dWDDVnl8CGxcAORBnpN/Qf6UL7DC9k+jAGTYaXh6ZLq6yd8N+Zci1jw5qbVh1HAZrKDRjOYIuL7M2L3YDHSMbbV7IhISjKUbo21UaAIT2pmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RACxKXpC; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RACxKXpC"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c17b0a26a8so25193eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 03:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774607973; cv=none;
        d=google.com; s=arc-20240605;
        b=WsxUFrrTHX27pMdSvTi2S5inaJO0m3r2KmnBqhOpm4mTHF9rF6chpcj5nJ7gU8me3v
         Qd4zeml4atT2L1zV2puBWE/TRkFJj4EgFBj5LXkj3V7goBeLWVJU/TWmoIEV8aLRcjR/
         bSZe0x9R31wjK6TYmLSQMDi6XkucLT/xVWyR6NTDDpaKMKywLDBPKYjPl27jc3W8IFga
         pkdZvzMsFy9B7Meqpjc833MtgL/KqhXVKHzSqf7fj+CRVWdgQOS3owduNzw7nxUbUOGm
         WTBeb9ivEscU8ThFqjkHVNMqZkwnoBnQoWTqvb0spT8tqK2Yw2hG8+hSJ+92TfT3UuED
         o/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gaWnQAueb/Sgl9MJS7B5EK/iQLA8MIqRPnv/jLDrg+Q=;
        fh=D5x0wYyGjqQk5htA4e1fg1zeVEIKShSZLX6wav7Oryg=;
        b=Y4UiKGnvOEQnBzdXljeJpuvio9lM/9nUYuSjjA6XDR7QlIgvVrfatzOE6jbDtlkCnp
         K5JXhWMCOiexfZnGEob2WBA7RhGLhNqJpj2m/cOgPXX0lQOd+h1MMEo/JSv2SvBLVHcU
         6zmo2No9B69FskVIjSV+mUZmsvKrT7oWeJbUqD1c3VU3rGJNc91eWzVjVyU7qSaS2kPK
         9LXK3Tzn1IMvBb7PKDGc7o4HKA75JPdnCggGcERrB6eRnHcs4iGv6yF+Gnrap/LgWu7H
         MsR5WsUVl5S3gOJsElkqyhvOcwXKgB0oUAEVHeBke8VnroUJtqWtm7rwOLMoH7ISgZN4
         4v1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774607973; x=1775212773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaWnQAueb/Sgl9MJS7B5EK/iQLA8MIqRPnv/jLDrg+Q=;
        b=RACxKXpCnPL221GXqJYMps3RkZVJlMXc9v07kp5qNrSuFbGAyeT03vpxpJLclIelqe
         Ikk4x49t5Ws/o6o1OIQIw5vaZwIvrD7YjIsXxOB3nJJ+BqgqNpfYNCi4/7yPAvLPUwd5
         OiZc9Vzb2asxxufo0ewp2edo38EOuCuOAJt6nbLlvru4HqKRpLof0WsDy6XFfa4coeyw
         39lV6Mkl2QgCf5gHs4cdXL5ByqqkKD+SZDmRLK3SokQ7bvhMiSAKDY9k4nq0mOOpPlYi
         jVGTYvQH3bbdjf6EhTSdAcXmnhrZwpZjFJLDAxdlfPZiWt4yC/UVeiv79girULNZo8hy
         s9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607973; x=1775212773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gaWnQAueb/Sgl9MJS7B5EK/iQLA8MIqRPnv/jLDrg+Q=;
        b=UorhjpLLvU09qu7LyPnJf45+Z/uqrLq5jrpIVDNJUhjIdpasqvRvfWQ7GS+mu0xtk7
         ud6teSBlxx+4Jf3c2ebJBuIxKKiNc58oR5Pm9MKlCYSGsK30T0i31tvcTtJiILbOXUq2
         jvzhLhfJk6uFtil/44M9N4c1c4TpL2ZNIs43Uaok7Nl8L9Aw0N78tgrpQpkojZ6d2r63
         2v5fp2SAQgz2KOv9CFSzkSnkW1Y8Rm8h9GaMMJCZFzomS4paC61RYpHt2dBv7m2CFE64
         aVuk0CQHg7GyXR5bNW3jTBhJYQI5VirWURVORoN//qxdfy4t+vyoLn4IofnD7lyzUpBv
         faOA==
X-Forwarded-Encrypted: i=1; AJvYcCXoWrjMHfe80TllEQi3Z/eOFBcMTLHiqXHXZgzWON+gvP7TU0q0kn5aAycYZHwkhBEO13phrRim0LHY2skzEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7mUk+GyTiH5D2zweaKyksbiBJ5TwUUArCyg2KktD0GIwj0Ph
	8GKBAgI7OEIw/l1MCeeL0rxks4b0vSKZcq/epDFNRw+TFVeBfThHlSL+0fTtZzCSEpAAJ1xNWap
	TYKyGhlpnJ5ln/ZCQ1mcNhgxqmMP0oP0=
X-Gm-Gg: ATEYQzyD06/pPV6dTRXvx3H/gqSquicGLW5zRDkoK0l7TFBnEr8pqIDUvjMXMkNiI3K
	HYsxT+DAlOiYqHljqQBUEKyeyev2BFN9TRCZiSWRU90LNwJtvGXvaSJI5a0Xda+3WHgd1Qawz7b
	kYx87F6OqYK3XXwuVB5ej3C5d0+wJ6IUHXq91N7kSbmil4pIEQ/VUM4DxTWJNcYAtQeGLiuywaB
	trWa09ja9VhAbZ3Z7ttiha2AbHxivJyRU9VfV/m4iVXUW8t/jl/5+N1CRuYaAZCTwRN2sTYkk8L
	H9HSScOZPJOdHXdsa6+1g9qwYPA3t2Lct9DhjNUXLibQbPVR9FbfK1YA461kRT84JAeKNhNoRrQ
	yYAwH1yGIMzbvhOKUHpk3k0c=
X-Received: by 2002:a05:7301:578e:b0:2bd:a3fa:9bdc with SMTP id
 5a478bee46e88-2c185e5063fmr380182eec.5.1774607972924; Fri, 27 Mar 2026
 03:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-1-5cf18a75ff64@nvidia.com>
 <DHABINRM1861.3HQ3J4IZ150F4@garyguo.net> <DHCSXDEMMPZ9.FPPFUV6AMU4P@nvidia.com>
In-Reply-To: <DHCSXDEMMPZ9.FPPFUV6AMU4P@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 11:39:19 +0100
X-Gm-Features: AQROBzADerygp-PNkSCNfuM7KQknZIJrHT2zwp_Pm-Yy7FuiJN8HyeniNgPhMkE
Message-ID: <CANiq72k4ib+pXymM9Z2gGvVk3UoDSdrw8d61W5-x+zuV3542Zg@mail.gmail.com>
Subject: Re: [PATCH 1/7] rust: dma: add from-slice constructors for Coherent
 and CoherentBox
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 3:59=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Then it looks like this:
>
>     let mut slice =3D Self(Coherent::<T>::alloc_slice_with_attrs(
>         dev,
>         data.len(),
>         gfp_flags,
>         dma_attrs,
>     )?);
>
>     // PANIC: `slice` was created with length `data.len()`.
>     slice.copy_from_slice(data);
>
>     Ok(slice)

Hmm... I think I prefer this version because (conceptually) it has
less calls, closures and conditionals (i.e. 2 `map`s vs. 1 `?`). Of
course, it should compile to the same thing.

In general, I think removing wrapper types early is better than
carrying them around. It also seems closer spiritually to the early
return style of the kernel in the C side.

For this case, I think both are understandable anyway.

Cheers,
Miguel
