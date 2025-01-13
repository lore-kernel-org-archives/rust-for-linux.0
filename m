Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F071FBBE9;
	Mon, 13 Jan 2025 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779430; cv=none; b=gBqYFrrdHTjkfIozZxijMR0WCTq0+FqsADLxyO/iZ/pVKNnyBqEQCBQjx0LdJc6TxKD8v5yf028bq2IZ4JuGsncPdekSedYTM48tR+5JUMc5Ij2AU6CuNoxdscvXEz58mMPzMBo91tD2NaFOP0gAvKjSDgpTfuixj31QJpET1t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779430; c=relaxed/simple;
	bh=J4SGg8YulABtmgOUhiMi2r5BWfpmPQBjGsI8cxVJISI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fm0YVpi1a6e6WhasKZw34YqhoZNbdWmBwy4DwxiURIBxTOyCiqzPWy/Y0JAcd5a7+V+lPx6QBWV3Nw1LfW1twI2tyhG70LIanouPQsMJBFudbYOoV3Zr5IknIKAbvB41DoU938p7PpfhOq5mjuXK6e/9Y/L1TgznG/2Wg04SZ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHzL+BYV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHzL+BYV"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so961912a91.0;
        Mon, 13 Jan 2025 06:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736779428; x=1737384228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBXfZFfLpQ7jUjgeH0vdKYFFvRQfM6G8E4Wkh6ozWPA=;
        b=cHzL+BYVS1+tgLq655tdgN+xp1/f/RVQclyN8kKdzBTkYsGcEDjegzT530L/FGNo4S
         sNMnz/Zt68VgR/E/biATQVAeNxkzI3c71uIdWoQQ+TPDWRQKebXsClwPLLECR3udNTEl
         8NCQQbhZ9ihBhykVycejTWchubSskCwd/LJWEGU0c8Y8hW1kvlNP0OnkAh+Jxuhdzatb
         NvV38yFB4+VDvK7AmEgx0wxncqdrU8ao+OqYOWGqH1t1Zx2MMSOtNSHy6VZ97aX906mQ
         qWXhI//Y+zpBU+VjDsP82Kltnkl0HwrC6EhNorIfAbt5cgK4TSDbD/hyoBD7lWZqAWtZ
         B/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779428; x=1737384228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBXfZFfLpQ7jUjgeH0vdKYFFvRQfM6G8E4Wkh6ozWPA=;
        b=mssDVRGWk2dIdQemLH5L5GTpBFLp/iF6JK4E+0yms5rcZY9kA1MxOPHclGJASjTpwL
         /xGqNd4mP7hY2osXGoinUq8++Uv74xAIqaghMkVMZCVv+YA7DcfIGM4r1546tDIRjjYs
         9fuh79dhjOUAtY+olPvDhBTfISiW3t35EChe9DMq9hhOWATJh09PFl8ubW1iSLXYDr6F
         oTWsEp5ZWAWkVobJ4KuAwQ9JgApq/+785P01osJsE6Ippbluymy75UGujOJZ/Rw2sppp
         XVXlX3hedTAOY8xyrelA7As34IHrHJfPVrgpyCOkCy8I2+//luO95l9hgGNGTe8+5bf/
         UJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMNJqkvBJ3jEXzbHGWBKpjJC4t9N18zAGkKiAFJ9+eazZEf4aPtJS2JRWX/hT64yT56v5jP8EP8m1DNmZqPis=@vger.kernel.org, AJvYcCVZgqLY4iwtza82oroczJdP+pBXlFga8imPKqfuhUZDaSE/+Q2lJ7N7ueb6Q3WGFP+uT3jQvi29xPntk7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz02RK8E8G/vCtj2/tiDFM3e4kXJv2hlw+0au7KkxHfxolJXxiF
	MYXAgKCYvYvolDC4UUc6isnnzkd6QfJ24u/o/878fYkB+V4+KRJnZVigknwB52iunlgRal3twrD
	BcqqMIA5bWvnw3GgSEQ3/q+b96Js=
X-Gm-Gg: ASbGncsX38jW/Ec0EIOd25Z1dIswypF1Id348itfk8TEuPJAW01Vv2nMro5TPVNwXfx
	/2dtIGV15mwLkT/sGi7EuqsGb8KbYVlVX08EJ8g==
X-Google-Smtp-Source: AGHT+IEp6SQmDuI3S+SSgBHaSjydbB9kNBepxvM7xj8GQ6Lsrxiy7dr8/+ZYPpOmArjldVBOpXt5g+dI5zVsiyET8iw=
X-Received: by 2002:a17:90b:2808:b0:2ea:bb3a:8f09 with SMTP id
 98e67ed59e1d1-2f548db69e5mr10801527a91.0.1736779427762; Mon, 13 Jan 2025
 06:43:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1734674670.git.jtostler1@gmail.com>
In-Reply-To: <cover.1734674670.git.jtostler1@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Jan 2025 15:43:35 +0100
X-Gm-Features: AbW1kvbhi4hm0fmJoT7Dhze_-XvzXg0RTbQz3PKVNmlfvEu71c97vQeXYiOIL_M
Message-ID: <CANiq72njXsC+Wiyuv=zXz2NNpVRy6OHjU52Nd51rrJ44FgvSyQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] rust: add kunit doctest with doc fixes
To: Jimmy Ostler <jtostler1@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Wedson Almeida Filho <walmeida@microsoft.com>, Filipe Xavier <felipe_life@live.com>, 
	Valentin Obst <kernel@valentinobst.de>, Daniel Sedlak <daniel@sedlak.dev>, 
	Alex Mantel <alexmantel93@mailbox.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 7:25=E2=80=AFAM Jimmy Ostler <jtostler1@gmail.com> =
wrote:
>
> This patch series adds a doctest for the `ArrayLayout` type, as well as
> implements `From<LayoutError> for Error` for the internal `LayoutError`.
> This change in the first patch is required for the added rustdoc kunit
> test in the third patch to compile.
>
> This series also adds a change to the `stack_try_pin_init` example
> documentation, so it correctly imports the `AllocError` kernel type.

Applied to `rust-next` -- thanks everyone!

    [ Reworded commit. - Miguel ]

    [ Fixed formatting of imports (still unordered). Slightly reworded
      commit. - Miguel ]

    [ Added periods to example comments. Reworded title. - Miguel ]

Jimmy: I tried to improve the wording a bit more on the first patch
following our discussions, to try to be clearer/explicit, but please
let me know if I made a mistake or you disagree. Thanks!

Cheers,
Miguel
