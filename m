Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C36B165EEF
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067380; cv=none; b=nzAgIF2GBQZc7TDlFQ0AS6AudF+dL3ot72ABc0TsA7P69VWuY78wUyYOyvgG7rJWwZUF/+AhqE0TWznukyCzu8yovPAGaBKmf3lwm2+17uWKHmuqH5d0vxD6IYaR2EWm4naY8J98xtIKaVecomY/k+U+eXwbCzJWpIjjIvpG8jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067380; c=relaxed/simple;
	bh=Is3a7YI9bsfHr5amkPmP79YmIyb6qRScMG1uuzNJtJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHTzy8qe1LqniDDJyoJ5b0cWxbWCLqy2AiZE9hLXUTGuPRnBVvAyWvNLFTVlIM61JcFVNlnynrNiqxsY1//6bB6VMw3e10w5u9LeADXcBU1e1L4NZWZtcsW8Z4w7Ppksl9P5pHej+gYCcq6FPJHU0JFuWnZ5HW4uyCzKRu88MUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E9ODp0ZX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E9ODp0ZX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-371941bbfb0so1951064f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 04:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724067376; x=1724672176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Is3a7YI9bsfHr5amkPmP79YmIyb6qRScMG1uuzNJtJw=;
        b=E9ODp0ZXUDrHJYQ9LGJ4xI7NkHJe1hze/2ZW1KcFTSLQG0G00qGEApZgCXOwTMSp8t
         uRyTVYqaaiEd0qvC0/k4dReRDxs36VvHuyJubUVZ8ncr0qF9IQ2Miu+5w6pT+/jA0OAk
         /nyIxiDI08CkhWODuEiYEaybQkFJCj5gQ8A09EM10aDQjQfpYI+Op8DjQt6zZbtWjSli
         vuI6WyWuTF2FBkAEZQ/HnLaxB6yKqeXdYLcV+NtHdByiq0HGRfGj4+kJRTbYHrXGKxad
         j9lIz6idYxzfP2gSt5QFxIQvulYG++bxKyrA4LLGiGmHDyxJn5PbxEAns7LLU8+Y+tC0
         prBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724067376; x=1724672176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Is3a7YI9bsfHr5amkPmP79YmIyb6qRScMG1uuzNJtJw=;
        b=k/AyH/wYJKFqR8R9PtUE3p5j5IhaPnsmUux6sghEI8J71agK1sYUMYCG7OqNzJJh1L
         fjERRtlliORKEjxkLx7miZ1dwG3mB7yWDDpJ005D3PXMiLCnPu2MQBPLWADaokLTdmCc
         eoQ+bG3Ke0Ss6AsVmhq247T+AOQAnzLxsCJO8CvVqllRSgd1jikNrH8Xi01kjEnRkOlb
         tS4180jiAeQ1Si4aEnYfu3q+qGnYC5y4T2jBI9aDRF9TuPR+TjwC0+4jVSG6VSjQeuV4
         VtC9zoucyOcI1fZI7ac73G9oShB+Lp8ckvqlxVZFh9M0hSsTEuloFH3zGJjyzZed24CZ
         u30Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCUY9DIBvbRDbXS4LvsRhvsvba0a4y1GCZ1WjG02PCIh7o5Y6E/wk/jo0zLGXOtcS8cfLdoaljBoWZayjifKu1mFs4j4NB1ulL8tt3UIo=
X-Gm-Message-State: AOJu0YxBp5C3EGjqcLt3SilmMq+wtn3nCD+PTS7NDGpid+U5ZQzhDaAC
	0iCvEbsKh8KRFG3GrGazez8rK6o4ztq8SVteOqpKSwS9x9w9t9USNQcaQmuLqtvyG7kvlNxog3i
	2yspBE8+DrHpY30psBIVXhuLbiRgF+jYhUUva
X-Google-Smtp-Source: AGHT+IGkmSaldHSdjt/0H1b2v2/darnvLztt4cnDcC0mQJu7va7pCX24xcuRUUBktO2gxHmYxiPj1fDAsGJNjx282mY=
X-Received: by 2002:adf:8b12:0:b0:371:8a69:18b5 with SMTP id
 ffacd0b85a97d-37194676fe0mr7232822f8f.44.1724067375992; Mon, 19 Aug 2024
 04:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819112415.99810-1-benno.lossin@proton.me> <20240819112415.99810-2-benno.lossin@proton.me>
In-Reply-To: <20240819112415.99810-2-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Aug 2024 13:36:03 +0200
Message-ID: <CAH5fLggBN=KPdy6aghEmf_QSqZxSnN=_6MWDWrLPsqEg0SLpXg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: init: add `write_[pin_]init` functions
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 1:25=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Sometimes it is necessary to split allocation and initialization into
> two steps. One such situation is when reusing existing allocations
> obtained via `Box::drop_contents`. See [1] for an example.
> In order to support this use case add `write_[pin_]init` functions to the
> pin-init API. These functions operate on already allocated smart
> pointers that wrap `MaybeUninit<T>`.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/rust-for-linux/f026532f-8594-4f18-9aa5-57ad=
3f5bc592@proton.me/ [1]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
