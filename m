Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889B01FA830
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710428; cv=none; b=aG6Np7B8fRhXRM5nLr6234RjbeLw/3uHqUaIIFkhMVL+Kjzooheone0aIYvUSlqEmQk21oRwCM+QvYgRUF7vvXWwnivwC35bShmNjidyOQIiCXCgJmnwcweDwS+ED1zTeB7/ULb0goX27E5rQpnbk2qyINqk6yKa/TjbMJDO3uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710428; c=relaxed/simple;
	bh=9tcXomEL5hDFYb9pYCG1IynV24I+wMljj1u+owSimKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKDf8gPoxyiki9gbBABlWZPzTyYFq+LUjyuBcpWYNHq/Fylnelj5R4seQu1TaMOXyH0cpD1LqxdTznvsOGK6gza9dEfy3z88wPkyTROG8btk8aGxOlcqsherNkbj/HZEmTyrsAJUcoSkLuEC77ieY8SOfr5gwDR5hnuysk/dLBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XEa72S2h; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XEa72S2h"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-382433611d0so5618576f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 04:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732710425; x=1733315225; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NerEvXZ0IWkIR646OECjt+ladaCNDTIAbJWxZSh5tV8=;
        b=XEa72S2h5/Y3VFLh7/qXe/SIbDbWosT/dG18VHu8W9LHGg0rkBC3JvHUWsgCM1rTl8
         X6S3Wy9UNEOam/heg81kc5269mmkbqSQmbplNKrFBnvXf/sFmJxwrYUZec5EBKeXIixe
         Etl+TJGJTk0+tOeMgHTGR+49S9RY0JfpMp/2io2KtYpZFZiV0LF0uMCM63dfNES64Ii+
         0+50nMEq7sXWKBo/ZrmmDqBDzzzJKBaaBhIzCnf10LVcy2y21PIPpJV+hZ6E7Gu117di
         zCvNlWytCBTHlc54GevUTpwS0YuhIkwuJTW2As9+h46Xkq4d86qTpS2FeC66iTdM+CCr
         LgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710425; x=1733315225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NerEvXZ0IWkIR646OECjt+ladaCNDTIAbJWxZSh5tV8=;
        b=jrDi4B9eqlXuJb5i71BaDMgFWqCmzv0k4WAHSMoxQGE350YZZFpQByqN1FDLzYnAZm
         vvpabwkiVvUqXOsH0PXe5PF1wxCl4O4XRAu97EF8pzFa/VhIlLIPMq1rDUehzT3649P+
         zCCq8b+h1mvosyRfSawU9oUhDKkjAZdhQJkDw12Al2uWfdy9rN0KzwjWcMml5GwkcCUk
         y1xgfofP09CxelNfSjz5hxabATaKjOuNRZP4QdIlC2SzzJZIrIGfR5lQb/6mSWh9vZYj
         V4lHr2U0lpxxQW2qi4VBzex1myJfstFIcDyqO5cpiAnlLzO+1pqVDh0CITvRfIWz7Pdd
         HcSA==
X-Forwarded-Encrypted: i=1; AJvYcCWVAEx8VYshv+YQaBnYYXSLDlB47uw2yF+gr5zTmTv8ee+2C5oKSHBj2Rf512BR1KjroN6hPnKXps0QfamooA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt8zoBREQcAyFwVWpGO9h9dQQWoYQJXiWgZDLPGMF3SLJ4dkSk
	QZnvR5bJRXnZh80C/Xlplq1X1P5Js3wgjtUueI3TBwQvXuqgvlnXc7j3VqIC151vQ6Cs/RPjgs9
	4Y/P4alp60YWADEBwSwVIo2mXYRiEkWMRMxMV
X-Gm-Gg: ASbGncvtsKMrQmix7ECiGnOuwpDT827Vq4infvmcKBIwOEk0Qb/+qjaKBryWJvhD3Mn
	JeIdTTwcuIsg+Qdw9w9MzyBuq8wVPAlkmv6XO0hEcpLbU5XlsVZzfu9tk6orP3A==
X-Google-Smtp-Source: AGHT+IE3/u6hPTwoMgl+sPnAg9L3GbfPlv/O5UbGqSwqJkkq12a3v1N1YaIJiNotHeACN+FFjZynzfAYly8sFv9S5N4=
X-Received: by 2002:a05:6000:1868:b0:382:46a2:3788 with SMTP id
 ffacd0b85a97d-385c6ebb9a2mr2270198f8f.25.1732710424749; Wed, 27 Nov 2024
 04:27:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io> <20241126-pr_once_macros-v4-1-410b8ca9643e@tuta.io>
In-Reply-To: <20241126-pr_once_macros-v4-1-410b8ca9643e@tuta.io>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Nov 2024 13:26:53 +0100
Message-ID: <CAH5fLgj30AmuobugAgzG9vOhSOrk5SqWwguOoNeh3J2fmLRHCA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: Add `OnceLite` for executing code once
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 5:41=E2=80=AFPM Jens Korinth via B4 Relay
<devnull+jens.korinth.tuta.io@kernel.org> wrote:
>
> From: Jens Korinth <jens.korinth@tuta.io>
>
> Similar to `Once` in Rust's standard library, but with the same
> non-blocking behavior as the kernel's `DO_ONCE_LITE` macro. Abstraction
> allows easy replacement of the underlying sync mechanisms, see
>
> https://lore.kernel.org/rust-for-linux/20241109-pr_once_macros-v3-0-6beb2=
4e0cac8@tuta.io/.
>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Jens Korinth <jens.korinth@tuta.io>

> +    pub fn is_completed(&self) -> bool {
> +        self.1.load(Relaxed)
> +    }

What is the use-case for this function? Why not just have one atomic?
