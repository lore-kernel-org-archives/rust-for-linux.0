Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A00A1F192E
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Mar 2026 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774720888; cv=pass; b=rImDJsL+6gw8J5OsTBaGP/0YeGQNPuQ+Hn0D7nWhhWlqo0+B2peRx30jZQpRyIZjw9X33LbnGN5fcBxTNtsF6v48GcpW/+9Dc8fTpZWUIRhCOF1vdulPfxCdAiWwcql7ZS4enZ6RUlv//mMmeNOT9LYb06PSPe4Y6qTOAmKbieM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774720888; c=relaxed/simple;
	bh=qLEu/lCLunJt/QqzKETLVl/b7wR8NB69G3zWj1afkAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qo6QeBbT148q4GCPQBdUY6eW2t4L2A9lidqsz/C0GdjA5G5LciU5Y5Ncimw+tO6EiCZdW65rmHfdE5Xw2/GtfT2ih2+sMCjXs0oB8WGdCzOqM/K0TN+uB1lvKgwzeBcwlxMyZajt5g2Me17A64Wbgx7Q9OqCjrE5dfqmqKJctAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVDnvn8j; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVDnvn8j"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bda3b4318dso254818eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Mar 2026 11:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774720886; cv=none;
        d=google.com; s=arc-20240605;
        b=FSQnlSl6Ebncjla/VIETmTrpxQ+ZxoAeokD5sRfssLhyhASoVaOOx4HS1hUJ76Uo5u
         pX+H/WUexwPJZH6RLFXvEaoqQqSImwyHmysvWqpEkHONAhhT1MakdufVshfcMdGL4i/b
         r4cJ3GPvKJ/kJWePNq6r1DgdOdXXmUcCigGH/yKuQurJLtpfFj6SuRKJMXot4qU3CSTG
         GrggkPGwZsx7heyD5FRHS2deT+xDAHkJK012B6IFE3E1nZWGn6R8ysuUW3sACxNVLxod
         W9UxIcTQ2q2KYxwgkoaxncv7fDKmsNKYNBvL86gC7UlQieZW+/sX1JewdzBO9MU+89JT
         sONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D7tURlrFRo7JKmy5Om7Y3FGkSfV2yw76BVJwE/nZUus=;
        fh=zpLZLiPmyZin4OGeEQxfFPqbfSn795K/3hK0t3zwUPU=;
        b=Mj9SAmIFhWclYWRqlMVD5Qcb6VTL10962znVC2oN2Vv8GRD9msRxiwGuXbIjug4y86
         cIO9ge3dZ6b1LlgkNYJ+ooiVF2H4MS1nt4JBkoKOkZGHm133/SD5uywansy+0P4ZEIHt
         C41tZ+nSpsR1FpUhln7FyNSyvAc8TYVdzOymBB0jDK5hRax1vMgVtU/GxhC6XpEDqgYe
         JUwjIJe+Pe4lcPftnkg/bDA9GDbi6/3wzYT+wEjzpAu8ZC+/l5SMSDDhp3SwE+AMR1Mz
         OQUv9qYinklYzRju3SM1c01wyUnCcasPs4utm0xWcRiZkhb+NQBH+o4VfOCqpsuKqDMC
         eYcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774720886; x=1775325686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7tURlrFRo7JKmy5Om7Y3FGkSfV2yw76BVJwE/nZUus=;
        b=KVDnvn8jMma8N5cK/+RXyAHN3sBlu7i64gIZ7AyZDl5HGN5UY0sjlXMUVmp9alpz7F
         ZkehfLKZBHG4hCFUWQC99q/MZq9JPD9WCEtEn+nocIe+smecFlNDIeLzNgRjNqIiqyNm
         st/x81EMYaV/SJH2+Bc0Zihnx/jZ+x5rhlhVAjiCqiDCKa46D5+wGK8LFIsOA7ab/C8n
         s0KJL7z8sMR4MB+s31dgprTVGLTohFSQyg6uGfyt8gO9UEPXCGkUFwqEkISpLQf5Zn/B
         U/qtO+KWjaO+zKI0UMT8Wuu/Fj6oX/jgm5gBa/z6zAfhnFym6FSpCgNWcf7CsT92e94Y
         BKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774720886; x=1775325686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D7tURlrFRo7JKmy5Om7Y3FGkSfV2yw76BVJwE/nZUus=;
        b=IWalGSC97BBKQgWp7z+n1aFlX6NGojZeTaNGR4/DudiBDqbUCsCtCz0J6OA026fkrh
         SsvIZzIlYUjy4AmUpCBfDiqif1TSHvVL6Iqq02E30ASszS+7y0etpK6Z1wCSAvtSfRzo
         se1DT+abgTT+zH8YCgeZ4DSLuhgROFAqW2UVP5ylgdOeHoVJ9+IrDziu7iiW6/HiyMJo
         YFvyp0b6acsQYDMjz4CpqEa8ncTAyxXax/bsx3vmValCMWcjS2gUXnbanRKhCuupeIPO
         S5oa1TD6nCQ9nrpOnr4nq0H3MwX/zPJ3Il49AgxDzAw0UQfkdBDXxawWX0vlb4dB0rUv
         FVsw==
X-Forwarded-Encrypted: i=1; AJvYcCVwDZco2GI1Q9GIhRrR0gqoMwjQmQCnCItqLs3rXt1jlAc2tGyN4HnQpk/TE2/p2NU4LbR6TY88Ak9V/MZXPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/F5YJM2got9ES7IRo9DfTAU5YsZRW/nLHWN/kq/YYAK9FnXof
	c0qSywgT+X3nKV168qpdr3sOFEkG09vpvlELa7bzMzRIYId7UuBIhnE4JTgSwYdOpIanjmkLkz2
	8/Mm5NjJqUdhnzVtfApjmPFdYIMoBll4=
X-Gm-Gg: ATEYQzxDbBxNkkxynPrnhIcWeYldF8R/aOOb7Vm+Br6+utTbLEN2DWRvExfzDxkMt1m
	AqTR6w3Mc1XNYvRRT/FD+X/WSiRg0PiFj3YZrLotdArRVMsQZ02Z5SSbCPymZGW/yfkKKJsZ6sY
	bHZuEbQg37JLRoUqe4rOASyt7CbGl/3q9KGL5xKlW0g9cpGOsXi7NTot6x4KySsTP5tjzLqRMo7
	FMUWS8kT4v6EPmYofPYRN1C361Tf/c6IITVsgF/RckzodtpDtAmgxAt/uztj7IOC0cyT4+xZ3mv
	bljrqtJkkHFqIsFXQ7yAxEgwgo5jHrbUE/96xZuJWRhYlBRabOPMnhF3s2GO6BGdqzDAPW7WdZB
	8/lKDiFw7sLKRc5KQSSV78zY0bInMGMji4g==
X-Received: by 2002:a05:7300:fb8b:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c185fff821mr1595118eec.8.1774720886079; Sat, 28 Mar 2026
 11:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328114005.125617-1-adzicmirko97@gmail.com>
In-Reply-To: <20260328114005.125617-1-adzicmirko97@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Mar 2026 19:01:13 +0100
X-Gm-Features: AQROBzDN8ocXk-Hxdr3B_EV2ebysqPvBv5CBi1H7WTYgxWi9MHNTE44fIypXE6k
Message-ID: <CANiq72maj2TqANaAxr_k_TuSFWdGSbZkyQzT_u=TjGEkKncmKQ@mail.gmail.com>
Subject: Re: [PATCH] rust: error: clarify that `from_err_ptr` can return `Ok(NULL)`
To: Mirko Adzic <adzicmirko97@gmail.com>
Cc: ojeda@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
	daniel.almeida@collabora.com, khali@linux-fr.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, tamird@kernel.org, alistair.francis@wdc.com, 
	acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 4:51=E2=80=AFPM Mirko Adzic <adzicmirko97@gmail.com=
> wrote:
>
> +/// ```
> +/// # use kernel::error::from_err_ptr;
> +/// # mod bindings {

I see you followed the way we provide "dummy bindings" from elsewhere
-- that is good, thanks!

> +/// fn einval_err_ptr() {
> +///     // SAFETY: ...
> +///     let result =3D from_err_ptr(unsafe { bindings::einval_err_ptr() =
});
> +///     assert_eq!(result, Err(EINVAL));
> +/// }

Like you yourself mentioned in the GitHub issue, code inside functions
is not called, so please move it out -- you can keep the "blocks"
separated with a newline so that it is easier to see the different
cases.

> +///     assert_eq!(result, Ok(0x1234 as *mut kernel::ffi::c_void));

Since you are asserting the value, but the bindings are hidden, it may
be best to just assert it is not null.

Thanks for the patch! Please feel free to send a v2 fixing those.

Cheers,
Miguel
