Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0FC21A45E
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875778; cv=none; b=tvWYbs33V1Lq1NexqPgg+Z5l5J1roV0RckmFxb4tsRGTyEhCklBBwCYvhtimiYDRt1sjyCCHNcxc+NhtGZ5jcdHyn8OHsMEIZm+UaMxHj528E1qihDSRdRQcZ93an9i48ceae2ySKJqnJy4rUbI0tjSGVGxFa2niok7ZpJ8fLJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875778; c=relaxed/simple;
	bh=CNcn4woQIZLrsdIbg03pIeMyp9tzwT6D3/r2tfHdLZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCSfkQQTNltTocOHT6URCZLHvY/mObmuw8MXsAguKQmOjoSZtlGlRdZWR3GVM3APLpjOijxzQkZc1i8Szv4GwTkvNxBUDKhls4gsmq/Ov8VY1mj+e5YFuImDAj+hgOZMM2uHv07D1rfQ9uiH1KYxSmBNoB1TRW1iDs/PWpbCmUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=l8LtaysG; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="l8LtaysG"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e6405b5cd9bso449492276.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744875776; x=1745480576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WOU+H1TIi8Q6aYjz4JOgAYUN1rG3ktPEuRubSEJqro=;
        b=l8LtaysGC430hjtTwbt0/EFoDSOQpgxbVigQgwy5T7AUO7Yufxona5Ur/FMoVazaxy
         C9d4oxGW62wwVnZkZChTd+7AiW+njXCTuKCFPPzg4NbYPF9360hUXTbT+BZpW07lMOcM
         rtAJ46N66TXIoE4LYHlKuanuO+jZtGpCX0daicVfgINIZa2Tm9TLckU5bakUFgr/ohGI
         ZfzOFe8e3Wk70h6pztbLJH0BbZhj6QfQaJu5HlGUE+aDFQGmpzm2R3tuoPDthvZcALix
         SsJ/7X5z4xIuXnQduzS+YXU5HAeCfrUe8bWBSFDOdmAQn6efsGy/P/qfDWkCvkIN56Gp
         EPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875776; x=1745480576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WOU+H1TIi8Q6aYjz4JOgAYUN1rG3ktPEuRubSEJqro=;
        b=dtf6s74GPMHKSK+ZOJ+mNAl/rKnzZ4V6KYCVov2EPUrneEBZkkeZ8Izgyl9Z42XfxY
         4HjeU00lh1S/z15mH8V6WVN1LZuuPukBkLsi7jUv3B9VHmL3hRdJ5pK1IfbZ9atWfBSw
         UX9kcjTG62jd74CKYWRi6pr3O8Q9hIe/7428x/6IHBHdUglj8IUCqAceYjmydvw/720i
         MW1f9Qa2LfxiAIOcfpDAF6DymcbAJAC7rxkzWPmAQPi7D/zNWIRVE0l1Y+Ed6LK/3TH2
         VQFgwsq3trittydvzn08mobDCMlTCtfksAqfVUAYvbs5C6ug4+c3BbON9gyCINcpNlNz
         AQmw==
X-Forwarded-Encrypted: i=1; AJvYcCX2astzp3dsq6z/ogC27HUXLxZsDt2odqSTykhaSHyzI9RGA3EvctjvcHXzItTd0G0MZgBu2gGLGz3RXtD+3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFLoYO6WB6HW4w1xXyoIbulvcYTKCW21D742L5GuPx+eWoLazy
	U09hllTthNQgpFrfedCTMPcvIBXvtJ21TDMq7df8PtfHg1909wEt2YhUUmjtyYDTRrzyc/yEfYT
	kNg/S8U9GhChJRQIgFFVWK30VCXk+T0EJSwoR0w==
X-Gm-Gg: ASbGnctWXYajKvXMjjf/YdAz06GM2xTSPELWcFX8p3ZQ3CmJINTHoH+e/4Cm5qClVdj
	X9kYTTcPKdviiKBdjE/ecM5lQcg/Xfsla9udKu/emHjxjAYHJXJlxj0g/UQMtMQxi0tGLZ4MrY6
	xqEFRJ1DVNnJpxlSNKudv1v8dX14ux8ZLM
X-Google-Smtp-Source: AGHT+IFUlvaqzWkQUh9DcguhBTW7h8Oo+6qYvpZE4ZP0mQw+NYE83xBtqnT8IW4rhs9Ab5w7MOI+/pRWYNw3i8te6UE=
X-Received: by 2002:a05:6902:274a:b0:e69:18e6:6729 with SMTP id
 3f1490d57ef6-e7282c82b44mr2476489276.13.1744875775755; Thu, 17 Apr 2025
 00:42:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326202520.1176162-2-altan@ozlu.eu>
In-Reply-To: <20250326202520.1176162-2-altan@ozlu.eu>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:42:44 -0500
X-Gm-Features: ATxdqUHx7TbFyVkp1qo1f98SvkD-_M1ITzJ27DQv1jpWcbeaxk9XLNHA3VY6sgU
Message-ID: <CALNs47tpNTESodQ+4083oWMAS9hT2z8dmRy8nGDW1o74051dAw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: static_assert: add optional message
To: Altan Ozlu <altan@ozlu.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 3:25=E2=80=AFPM Altan Ozlu <altan@ozlu.eu> wrote:
>
> Add an optional panic message to the `static_assert!` macro.
>
> The panic message doesn't support argument formatting, because the
> `assert!` macro only supports formatting in non-const contexts.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1149

I think this could be "Closes:"

> Signed-off-by: Altan Ozlu <altan@ozlu.eu>
>
> ---
> Link to v3: https://lore.kernel.org/rust-for-linux/20250325211011.1093374=
-2-altan@ozlu.eu/
> ---
>  rust/kernel/static_assert.rs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
