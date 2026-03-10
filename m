Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC213C9443
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 19:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773170015; cv=pass; b=i+/HbrRIAbPVqSC/kuRaXsoa4X6AD3D5v7eD31OXR4pqlgFF5OwTG7Sn8X1L02UFszUKEcCF4ohWxtWZPzS3mv7qWRGLk+19I58AzslryF318oY46SfYLxlHNRjpkP6h1+BDEl9ePToPN1cCpYvCjoIB798SGR4msGzIp0i9Ews=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773170015; c=relaxed/simple;
	bh=ELjFNUMy8+s7K5MZsIwaa5SHuun4uAi5d7KQ2v+LWf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGG8EYfU0WW60JUc91Y/KE3fh0YY7ID33Oh0wjcMnlpFDhfU/fF6o1GE2YlItsoAHE1SfEz5o9qYWXn5sOWr9wJiNg1Kk9ZZIiMt9rFgFHsmkga74iFsv0hlpXC2gK26Of9wAhmhd8A263a33Tw6E8IdvnttfY/yP8zBQePE2Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCX6aZ6w; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCX6aZ6w"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bd801b4078so983227eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 12:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773170013; cv=none;
        d=google.com; s=arc-20240605;
        b=ThWizxbKnERZXxWJBRDI8a6PtWoK+0Y4NSwW9BfBQHUyqLCEOlfgphqc7ady8OIjIk
         HojJqaf+wJAlYGE1tXX96pdarl5yrxcu4xs0AgQx+Zy0m1tTIrAKDYeyPa2I9xZOfONL
         tHKN1fQvShmhD+nP412N3pNwiAY2JE/BBgYB/Z9N9ciikpzGwn+sq/Pq/L+XE4UiCTWz
         nje3EplULen64JzH5TlIGpcbdMCJPfsdQaTSdn00jddgp2DR4qQ8DkkrD6UuNBBBso1r
         tTGmwWFwAp9NluGh1PgzuzvXhE+iEXIY3g4fsJCQjmK26T3y91vWKZPSllIhyETuep6C
         8Nqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ELjFNUMy8+s7K5MZsIwaa5SHuun4uAi5d7KQ2v+LWf0=;
        fh=fubbeVdcqy/yG0nqSSfULoH9d3etTk2I9ZbGYaTP8DM=;
        b=MsKtDsXz9ziljOIQY+h9+xpbunpyle6JpkTw6LOM/cag4Du3ECxevyRNwjkj6DHVvS
         YWD4rSQjOL04+e7gJjBPveCu5aIjFya3aYBWiVJTQQnazfMI+st8Wdffp1MBktD8kwr6
         RpFxb08qSArzzxkznJq7yLHDfUjdFgB6AhdfHRA5bEGMRUo2/ZgyIqOnFvngVKTnoDks
         ZNZ4NjRXOb2P51vy5JtDbZg4x9GAAiNkGKph74rHen9jXhjnb1ObBwi/m7Js+Cu8tbJb
         ZOz/BPu3fFfDusgZg6Ri+DD4VFn+GyXqL6j9qj+Qb5ptfurAVdDy8QiFGTasDU3YgG9s
         nwzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773170013; x=1773774813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELjFNUMy8+s7K5MZsIwaa5SHuun4uAi5d7KQ2v+LWf0=;
        b=YCX6aZ6wA6p49wTesWmY9opPIlNItf9f8/I8rgOdgMTKbjwCJvHWlySKhpnqb9BOU0
         cTJYi2eKA1Yo/74z/TteUmDb5w+XHiIu7BZvd5zMXWgi9Rhfv319g7VQIeFkqjpXsnNZ
         mqsoGx66ft4oiQGhGvcXZiCK/w5Lck6YlV1KzgzF8/sdI37xDzHVwoSHBgmYF35KRycA
         4Q/Plocry9dMo9oiVRQAJKDj/iIv5vFFsvWribvT86F7FMThtJbWPTaFkT4/VrAiA2FB
         bWGd89NzTPDYEC1IyZlJegX4V/r9lzDB4DJHhSxQ8qYlYCiiqrjWSL4nUpPFAuzZDB0i
         5hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773170013; x=1773774813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ELjFNUMy8+s7K5MZsIwaa5SHuun4uAi5d7KQ2v+LWf0=;
        b=m1AZztVp7P2X32RYXUnpsosyha6nyufpjxn9bEI5QtQxReV/u70l0pgU/gv9LHsl0o
         cUr7acq1ApXl7JkC+dbMXoWEpB3u6mq2opU6O6oVdbd9mp9kv9/gu4G45Mo0XbvAomdY
         AR5+5aiqA7CRqcIq+FHL5EHZ+3z2Ie8ena2I02wNGzUEoqTGYl6XeiDlLiNuiDfB0lkr
         79B1DReHXMenWqOm4tXkHKyx7rt+QOXc0YBaNXYwYkaVZ0/6yqC60jur7x+OuLOv+RNB
         h9x8OsBivALDes1FHPTTswvoo5h/agMDWSyvCfJvy2zMi+CHTLX0JTpRcVkXreekqYp7
         zUcw==
X-Forwarded-Encrypted: i=1; AJvYcCX/MnRxX96ZlHNlG0YrwS6XwLuOw506OTYEcWgegqUWS/CrhSVeGOrmXe8+dmrHeV4s25OSTUtrVuJS9e+4ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7GTp5VcHxRN2BXlrFmvorluBPAD3HQ/bz7P9dWMR/DfTN/tb
	1njgLMqcWQQCkxim1Yr9guTqfgRjKpuuu/mPBEq/044P0RAnnfD/mun40VCd8yTEII4kGYM1N2c
	F+LsuP0jA/swHsbqtAPTXh3P3KEn6IiL1YoU1uFhWhA==
X-Gm-Gg: ATEYQzzbJvCO/bsZjidMKnnZutLE7bENrnthz/4V8VX3jX+G7Yk9zpnITCeJhQaltpe
	DuJ8ROyn0vwTfkXU3zZvp7JLX/Cw4DwXZQo58eUADPnbGJMfjj4baqRwocvnumNaFjiXLhAmkV6
	Yh/lLWopx9hxLSi+i4mEDckcqSCt6rIbPU79WS8Bj8v/rwAWqvWL0uJYqzjU4qz7nVQ4zg4vzQO
	O49uw/G4Z6qKusYPuq1pok7DwEiFJVyTLaOoT0waUa3cn4EGWfsMkXLAihpkCBFNXJP/ER6DkvV
	Ngp+CNyZlvwGOXW+DgWVxHaFAKxzfXTjMBAI00Rz4Cq6iuivodCXS3xm/8io61PkrNJxbIeVTKP
	hv7JgIueVXhSohP4YwClrBeA=
X-Received: by 2002:a05:7301:fa13:b0:2be:80c4:2c60 with SMTP id
 5a478bee46e88-2be80c43508mr633066eec.8.1773170013040; Tue, 10 Mar 2026
 12:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com> <abAzTFLYsUxK7VJ6@google.com>
 <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
In-Reply-To: <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 20:13:19 +0100
X-Gm-Features: AaiRm53DDGVgL5CoTpBeNVWwk6s_QxgxPeVBI4q2KZlUk1l4wOd7Dh6PfVBh49Y
Message-ID: <CANiq72nM6ECBE+iiKrBRzCwOyd7BtQ4w6o9AH4+o5rcrcY30kQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 4:45=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Did you want me to take this part through rust-analyzer-next? There's a
> significant rewrite there that adds type annotations to this file, so it
> would be better if this patch could apply on top (with annotations).

We should ideally avoid breaking it between commits, so we could apply
it after I merge your future PR, with your Acked-by. Another way is
next cycle, through rust-analyzer-next.

Cheers,
Miguel
