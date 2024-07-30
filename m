Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7515196D8D
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722333079; cv=none; b=dXmYv3lbHOXTovrxK0NU6u1sdFnIUNyRa36iKBP6nw4C43BqwY9CzeGZhnIw9nSctsi085WR2tpuli+XWnS/DT1XqurE19L64sMWv4h/lg9RUvCF4CjLuwcYYOX14XxN6wqHUa2VeT/f6Nz+jmabWMo/bVnjWCwDM7Q8htZ0J3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722333079; c=relaxed/simple;
	bh=pG0/q22Jl93ehcd5L6RcUyPD4cxH1wdOucz6oiQ7oEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PS/RlpKiirCtq6tp6AOTw8RousVonCyF0WIiQZjp5SFEMjHjHo+upHrVL4vrIK9e4GJP0Il8Q7aUnaJ1ee/rTob2OQXhvWGlRqmATSQBnqheJEJT1uHNZn7FAiDAEAa8Wu1/Vhr9QslCAzYxo93yJ++iQIzKrnYQfIA8UEK2L2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SOSD2aEI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SOSD2aEI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso25313685e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722333076; x=1722937876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG0/q22Jl93ehcd5L6RcUyPD4cxH1wdOucz6oiQ7oEY=;
        b=SOSD2aEI9Y6QCL8OQZuej2rMi0QGlDnHJnIpWyz+DkoLPq1LzWL2FL5XzV0CE+TRad
         iz3wg4WSo4yCn2LlwtTfZUuVj8FmUChJwWixd/oOoudRjDGGUzC6PJd+YK0xQ2mU3qhJ
         4+G/rd99VAi4RE7KBVCdEYOPIv1hd5r2woo9THGWX0sATBTMF8xUg3wpIDSjU8gSRegn
         ilQk/LWTOtviuKP6r7K7f3yIJ1qw5x7iMj0fzuDhemtyiw0Yz/P9F36Aw8mkkXAmtSxJ
         OzSkTW9OGBTENv7l90jVF68NMK61EvRnb8eQnq/pYAh0CW4aQRKZXmDkAk95S2CCp4tK
         uc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722333076; x=1722937876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG0/q22Jl93ehcd5L6RcUyPD4cxH1wdOucz6oiQ7oEY=;
        b=Z3fYlpLl0Zf2N81kyfy3azEeY5oREbnqlkl3wsBA8xB6ZtHemf5QYssNpnBKg0eAGt
         31p91UXNS6jlV/sOSNsVci4awUaw2dgj2PqP4aBSONB4xGeWHwzZu59fmXtBSXZG9rLE
         d2+Y+WK4ZPuHdfBM81DBVoZ0RVGhcWe404FHA2xUM3uKTFygEdZC+9GF4GkSlnKNnsbX
         LrdjHBnQgrTMyYFOGHBnvVYAT4xbxaIyx3QsXqszDyuAwBFshMyhym28NzWd02vKY+AK
         U9qNns5a4cLjtRsfLOy+fOjNExAUDE3iMHFM75CmgTUe28uiRc6ltwpNbOkPfkl0rSeK
         co3A==
X-Forwarded-Encrypted: i=1; AJvYcCURKMS0fVL31cVVMKkzU+tl/xBX3MjfTW9dxoLOVLiTHjR8p62nKwZvAyh9ZCSqJuKf7vpXlsn4vmVBrL21krD6Qv45ic2rY0QUc2yAOX4=
X-Gm-Message-State: AOJu0Ywi+Q0wESRXkPls8Btlgfk6JAs7YMt0ygGRMIVWWPKKy8tPwqAd
	8e0hZ8OsMUtswn0GkGKf0nj9AfR0qW5Hw2Q1LwEzAzFhhiwWFD/YAECvi7agymiZGk07QzSjQ4C
	BBUeM55OVDD4gpKx8to09InGP7k+XMSznI8D9
X-Google-Smtp-Source: AGHT+IFP5k+X/a8etFEgTfWg0cxDTZKAXEQzGf1YY1CabSPV9fG2FeY05fu9q7Y4QTzlK3SCKS05MTgrpT9lmBurHNk=
X-Received: by 2002:adf:f7c1:0:b0:368:31c7:19d3 with SMTP id
 ffacd0b85a97d-36b5cee3060mr7555279f8f.9.1722333075916; Tue, 30 Jul 2024
 02:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-1-bbb948752a30@google.com>
In-Reply-To: <20240730-kcfi-v1-1-bbb948752a30@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jul 2024 11:51:03 +0200
Message-ID: <CAH5fLghz8psC499vVochcW-jC+utDXQonoAvwc-9Na4+31Hdig@mail.gmail.com>
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 11:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Introduce a Kconfig option for enabling the experimental option to
> normalize integer types. This ensures that integer types of the same
> size and signedness are considered compatible by the Control Flow
> Integrity sanitizer.
>
> This option exists for compatibility with Rust, as C and Rust do not
> have the same set of integer types. There are cases where C has two
> different integer types of the same size and alignment, but Rust only
> has one integer type of that size and alignment. When Rust calls into
> C functions using such types in their signature, this results in CFI
> failures.

This should say signedness where it says alignment.

Alice
