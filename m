Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NYvUOsoh"
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9104212E
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Dec 2023 03:34:06 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7cb0c9efbc7so1177438241.1
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Dec 2023 03:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702553645; x=1703158445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVpZi9LWxDndkG/jKZcYbbE5b7b5vMwfJTUTNSHguf8=;
        b=NYvUOsohI7nw2QtWaoeH047jWp1Uxl6M3HQdaJzfbtrfOTFaMWEikpy4d3xSh6bFNa
         nE8eZieUQOx1NalQ4XRJb76v0leaF0DBCh59Z6PL7wYgIBuXL+1dvRHjjKPxzJwNcfkc
         0oGRJ/v/6KIFR3NHPJKlXosU3BI9CjTlOWNZhN1Ha32masXnaZkI/NK+T8GiQLzk+bxw
         zgKRtHyR+N6UscsW/Vyf/RXxBfNgqqOV8jOlQOYo5gXh2OiYKx2V3TCzYwCbjiEaBQci
         W4X6p8IJTqdei//UqaZEw/AylD43vAQyiokbd/LVbWf9BiLtV1ftLHQhBA6WeB74t0Jb
         809w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702553645; x=1703158445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVpZi9LWxDndkG/jKZcYbbE5b7b5vMwfJTUTNSHguf8=;
        b=AjoHF/awT5DkSr1wq+2z8NK05/jOwfMw7PtFo7Pk7suSkJlnhwwApf2NQs3MWXenOX
         wVBTUrVg3jd/i6bwDWXw/WRPrQpBFGHE1A6ROqXNMKabP2PPgzzxPZM0x7zL9ppG95mK
         O5wLOHJWCcDsrhtSfSibW2x4uGPUXm9Y7NbNSJD8drnIDsqQKCtzlNHS40dTiCvzbTVK
         WmoAWMKf94bBkY8JLJY4Q2OsmV7hVzta5jUssghTyR7RFdTVFyT4fWbZtzZcd9H11jHh
         nTGN/1objqm0f7F1XNpyAQNJLsNt4IodhqMnGie0HQH0c/X1uGN5T3n6MRAKOGTjUaqu
         BMJQ==
X-Gm-Message-State: AOJu0Yw1e0dNkZ8Uh1a71nM9+Ju+JsC48CsccIb13d9EZbFfUBIbOK76
	a1nNy/sEYnZumGV5t+wOt+1ij3LODlta0zb2nHkVLFGyK104AqG+hzUCaA==
X-Google-Smtp-Source: AGHT+IGeIFMmkXzAkE9CquW7ofTFH0Rne6ZQ1/XSFA5z4R3Le9J9sRiwED3yszhOxfCM+mmsLl4seJ5a8HkLRjI4a9c=
X-Received: by 2002:a05:6102:3d90:b0:466:6074:122 with SMTP id
 h16-20020a0561023d9000b0046660740122mr544557vsv.18.1702553645344; Thu, 14 Dec
 2023 03:34:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214092958.377061-1-ojeda@kernel.org>
In-Reply-To: <20231214092958.377061-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 14 Dec 2023 12:33:54 +0100
Message-ID: <CAH5fLggnkWAVBmmeSk-DAbkLQU9QTApE_CqsMxiVm1z=h+uhYQ@mail.gmail.com>
Subject: Re: [PATCH] rust: upgrade to Rust 1.74.1
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 10:30=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> This is the next upgrade to the Rust toolchain, from 1.73.0 to 1.74.1
> (i.e. the latest) [1].
>
> See the upgrade policy [2] and the comments on the first upgrade in
> commit 3ed03f4da06e ("rust: upgrade to Rust 1.68.2").
>
> [...]
>
> Link: https://github.com/rust-lang/rust/blob/stable/RELEASES.md#version-1=
741-2023-12-07 [1]
> Link: https://rust-for-linux.com/rust-version-policy [2]
> Link: https://github.com/Rust-for-Linux/linux/issues/2 [3]
> Link: https://github.com/rust-lang/rust/pull/114201 [4]
> Link: https://github.com/rust-lang/rust-clippy/issues/11219 [5]
> Link: https://github.com/rust-lang/rust-clippy/issues/11431 [6]
> Link: https://github.com/rust-lang/rust/issues/117976#issuecomment-182222=
5691 [7]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
