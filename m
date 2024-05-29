Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BC61C0DEE
	for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717008967; cv=none; b=I/kz92IzPfgbnJ9FfUGIOj3CWdGzpaCXJLtZdG5KWVwVz52cmrAZ5d8qpg/b101UKC0XWafAEv5UF3+nh7BQTFPAG5vKM5SZW/pdtfXeSKlxy9VM6ly+AIsL2vna7rbndr+5AcFV1NE24OnYT/oAtotADM+YxvtM64ieeFc0+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717008967; c=relaxed/simple;
	bh=1O4SjRlMTF2QrhErdJ+MeR7qjjl7rX/IA6vyiawGwT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A09p6kpvKo7e6PvwK/Sq9F3vQq0LiD7dDWw6OwBwPcZRcrySLMAK4NkSTaAx2ZipK2EJuBd1aId6FhKVKOmnPnfFueI+QJxpAhRry0gL0h59UtunNlBbKyXjaQm3GaxhxnKmpX63WwUkq0Z71qQ48Z2TprVmM2TGccRHmQKt93E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQ3r6985; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ3r6985"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ea82db9a1fso828671fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717008964; x=1717613764; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1O4SjRlMTF2QrhErdJ+MeR7qjjl7rX/IA6vyiawGwT4=;
        b=ZQ3r69850wlDBYcCsUGHl/PC7TO/4uhn7B4vaeIB/3oS51ElbcllYWWm3TEvMGgOYr
         8m269d7VzLO9g4TYBwz7DBSa1LMP3G/FfAd2M/m8RSGIc4AYjQJv5ty/Noq4URkpwt6o
         sETXn+bPFU59q633syHEc5Yq4NVKO0EVmVTHreM2FccUgqf8LsyrSikO+WYvINXYOXod
         2X+eGOImroxbYCva2z3jrl+WQMfH7T1ZuOwhzP+1YKKs1UiHd4xDwa/HwLoma0gef6S1
         jgMG9D4IH6eFkaec289QzFtQsaK8z6QZjpvorbsraC9CU2EkMjCwWXca+CKfJkeQPGGH
         QisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717008964; x=1717613764;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1O4SjRlMTF2QrhErdJ+MeR7qjjl7rX/IA6vyiawGwT4=;
        b=t6qO6jQFN6YIoxEg7WEOm5tYMoSYeMGr46GThPwf5uSeKb4sIZDNjIiBDy/i1BAoZJ
         Kx/8iB1DOsP+OpD6lYEvLhKX1QSzKuI5gh17DiQdUcP6SCd9+tKiAfS3FxWOarOSc7KF
         sUG/AuPLGeaOimkdaK7AhPfL9LLCOSiK/zfYnDp3rdDdbrN5THNgPrQUuDCIlFmfuNol
         S8503HE5mxvOk5ksrrT9q3eVPpphKWyELtn7HOe5xG5XbxshGYtj0SEnJ2gRPq5oBq9h
         9JDMf+/5yxHLg/zLYpfEp7SjSkU2TfQE+999d45SXqRd3RmbuGrdoJrxJB6CCrKVuzhq
         IWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5k/7Z/nuy26i1FukJDOoupl8MiccF5TMJicDAt/8kFlkgKdle9rZq0QEmf192+YnTpFQmMYM9qXU1VLuYAS4dNG0cODrtqCNER4fF+HM=
X-Gm-Message-State: AOJu0YzpIlaZ+2/Nt31fHDQ7cl3udblKtOCyMaNdeH2GtGBuuynRrkSE
	2f2tODICRvMxUp7vb+3ZNHjuMOQQg4i4zIQJ/Jn/FU+VW/uJOMvKmr6fR2QWGnRjkQJ4e9VscBz
	iHdTd8sZuwIJeDZQhTPazyWvPr7s=
X-Google-Smtp-Source: AGHT+IESNihG+93y8BMjuJNJBNqo9XeHzzN8+2PZdKCYusYBWq2A3oWD9hDHm9oE7uq8JEgiiAUrnlB3rr4eroaGW/A=
X-Received: by 2002:a2e:bc08:0:b0:2e2:72a7:843c with SMTP id
 38308e7fff4ca-2e95b24dea3mr122101121fa.36.1717008963463; Wed, 29 May 2024
 11:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240512112324.8514-1-aswinunni01@gmail.com> <20240512112324.8514-2-aswinunni01@gmail.com>
In-Reply-To: <20240512112324.8514-2-aswinunni01@gmail.com>
From: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Date: Wed, 29 May 2024 20:55:51 +0200
Message-ID: <CAKy8djSR76A+PGNBmsSLSyJ8Gnhq5dpLJ2TL7s6URWZ=ug0z5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: fix datatype in docs for `module` macro arguments
To: Aswin Unnikrishnan <aswinunni01@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Remove the mention of byte array as datatype for `module` macro arguments
> since the arguments are defined as string, and `alias` is a string array.
>
> Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>
> ---
Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
