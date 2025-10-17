Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C32F30F956
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760683270; cv=none; b=t51wkWicG1somTsMejYImq20TRfpSJ0GG5ibAc0SOb32EldETpdnf23Ds1XTGXal9DAKcZ2+z58UC1Irio+cuOxCe44c6DnurnzEij1gcPP9nsx8UuKAmkk9+Bk2HL63eiQeMnhcw2pUIhZvYKVN2+LCF5zrfRiJ5cHZ2m6vXrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760683270; c=relaxed/simple;
	bh=HEI/VMPAQm/lLBFNuj+LnsxSRZt1uuVXLn4zoDoHKcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVseeUrHFecUe2tTCAaY3OgWyR2PFdLF4hvoOzGHH3ME7C0kjULX59vafYgczX+A9WpUJ+SNEmToihhzopYM0pKtxhApqkWE7XrI5wNwsDBiLk7ovjZQurN7JZ9OIWfl8/1XHjr2C26foBqw4UVDAwq9MR7xv5I9Xm+l/edyJLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sE9rFpJO; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sE9rFpJO"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-30cce892b7dso726263fac.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760683266; x=1761288066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEI/VMPAQm/lLBFNuj+LnsxSRZt1uuVXLn4zoDoHKcA=;
        b=sE9rFpJOw9BZSwEqrQJkclgfnuM/G+sYXQIBvAlgU2TujXaOYyX4GmOqvd8YZYBX5P
         OLEvTYtaN19xCbCfC9nXHvu2g0tlOjcIJZCukhkCC5g+ATmKbUuEJq7ES6UgDDK9PUc3
         U2B4BNfzF+PIstNo9kYuT0e1TeiREbipWMEQPvKih6nH3Nb9pRbaSD25VYY2OcDLCdoV
         5JjLtnzkRdkzt6kwpsaohFRsfIyMq9kSjg1A+52eu9REEmPJ8JEONe5Dq4Rnc4dDWkmo
         30ZXdbmR2/BouWEGUwaAUnXo0v2yWI7TP+4PPSDafqjiWsz41CJesNH+RQ4Yu9/MJhzq
         h1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760683266; x=1761288066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEI/VMPAQm/lLBFNuj+LnsxSRZt1uuVXLn4zoDoHKcA=;
        b=WN00XLKhx4ZdlCcwQXHXpgyGgVWWVgaBRfJOJ1Addts47sqKTNxZ6bkl4csPiQ6aMP
         bBZuMJqRrSI5Qgurt2DONflUlvj94tsyb26vRpTlWGbJ78/GNnAlmyVelR5vNPW+KSgG
         UaTS+pguWHLavOpSIWphySKt5vRtS+YDkQxUkfhVDmJnTPO8eXDBq8dZ/D0jt+56ajOs
         AMtKMAqwOZiqcwohh0KrYB2e3NY0/5vq4xdtazrqgW6jwQNu6Kd2f+Kdz1MU6vyhVown
         CZFeRm/Yd5SSvf8CChosYm0M/3f1qSoRpEJnb0Y11lwhc3icZV0g0WGbYWPGimUMtpkI
         cWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXhBRrfDEfyFK1At2FEBAvcZTAa5ZbPTEuaObn2HIVSLAa0jL0xWHFRSs0lRTkaNQ6HZEmuW6qenpkCFWCjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrwVw0izUVmAe9Ws11oAVSaY1fPBU3pw7NKk/E3E2KfiOUwM2D
	UGFjAS1PyPpUnAu398KJWb8FTCJcnz2YIFk98yVoai782mtvbctK5w1CFgmq2HTfxIbhx/fDqAe
	Qh0dnexZZ5qK9Btt5ac2C/j1N6Yfuv6h2wW3bFajk
X-Gm-Gg: ASbGnctlpNLJirVGOlegUzf/HqXyUrJO6BCzpMh5LZPrwl66MvXxTD0N7Ns5QKfsXLC
	YIccUE5542SaLnvNGFqThX34L7RG5yRbhIraMxW6mNmxsfBesyR2Vi+Eh1Ts3qgxOOROHSTAVRc
	97+2QnaYSJqAtFoZODbl3ZByLMkLu7rT2SPOATFsPxB5gw1YdF3K05CxS/yycaTvqCJBE3ASu3C
	9gK7tHfnCDLlxRvwEdby83pAaatp0QckQmlTNWhwu5j2l/X1T5AgR0qO/HsamP3Qi0xsAtnaaFh
	mXcg+fqYPZKNpw==
X-Google-Smtp-Source: AGHT+IEVtA11UBYxqTUAD8SJlzk4igtsVuiFNGs1Vhi/4XOyirUuja1zneYwNbjp9heEcW9jRoymFU8GQqzMWhfMiik=
X-Received: by 2002:a05:6870:255:b0:368:e03:c3d5 with SMTP id
 586e51a60fabf-3c98d0fb311mr1107954fac.38.1760683266224; Thu, 16 Oct 2025
 23:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016232118.1419895-1-ojeda@kernel.org>
In-Reply-To: <20251016232118.1419895-1-ojeda@kernel.org>
From: Burak Emir <bqe@google.com>
Date: Fri, 17 Oct 2025 14:40:53 +0800
X-Gm-Features: AS18NWAA1df5ukuaz1ezqHuBrLDNG8qPNJzmhm1IkYGRA3GoDbqAJNDFS4-e_5w
Message-ID: <CACQBu=U6fDA2MHB3PsWe-+gEjcGKZs_hGftFKuLjhW2z3LnkhQ@mail.gmail.com>
Subject: Re: [PATCH] rust: bitmap: fix formatting
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 7:21=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> We do our best to keep the repository `rustfmt`-clean, thus run the tool
> to fix the formatting issue.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#style-formattin=
g
> Link: https://rust-for-linux.com/contributing#submit-checklist-addendum
> Fixes: 0f5878834d6c ("rust: bitmap: clean Rust 1.92.0 `unused_unsafe` war=
ning")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Burak Emir <bqe@google.com>
