Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7AE18C91D
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431022; cv=none; b=SSrsNjw2TjXK18EgdobXzStLzL5diTxQ+T9BuRNOtbasPkzOUn+6OsgCn6CIUXJNvT6gembMv/iv8HXuWHL4k0yD031B8pb/Qy7hSHdpBy3jkioygyWbUR/rwI1/zVeLk0qww7Fy/xAKdKfT+RHOf6/aacHnWCjs1rc90N/ktCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431022; c=relaxed/simple;
	bh=QjAAO/FIRCsI79vVa0nGyyZSqRs/40H62xX39f2xrgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WlXvLAg9WepQyzj8MYJlgLjP/GJZva97Q22aBVgkp2un58HRSF8ub/QI+JRnxj+LIO/1LEq9wRhGBR0zeeEbSSgLAJJUVsQthXJW07xe1NmNB01HGmsilzRYWDO85/t5IfjzHkPd/ISGMOL+zFsVGdUvT8wo8w3JTCyIkjBMWiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FlI7bfj2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FlI7bfj2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36844375001so2531825f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 06:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722431019; x=1723035819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acDkdWfVikvUG5KIhJSwDrwQHKyOzy88X5OuufZnBu8=;
        b=FlI7bfj2h36F//M3biBkGksVUP6lIHMjg/VMBs/cOxqkO8M9wEE9Sg3EPZDhgaIg4M
         Equ9XjLZopk+zSieO4cRyxY6tiNmb/06R4fWK5WN+FYlHNqdDNbIYXmeJuzDxZ4HuyDz
         bLPXFS4De/nJ8Lz11hxM2Rxzy/4JQT9k4MWuCJh4nLFIPTAt3Dc7bVcFRvTXvuvZEP8D
         rszktMtFIUB/NvrA+U20Hs2EvN1UcFEhllLN9DMvnxL1LV4N/KOTM7tqV8Q4JIvi/egW
         JCGLF1dM4GLI78EOVcj8NR5AWdA8f6PicGyOuvQhom29SERo6Lp4ASBe9Rxy8vYK1O8q
         /X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722431019; x=1723035819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acDkdWfVikvUG5KIhJSwDrwQHKyOzy88X5OuufZnBu8=;
        b=HQq6yc7IOV7diA5JWeHbJpCA9h3KI2+86TWhuT3XHzO3uC/OBOCBGAQ9tY6gn/hUNv
         IHTVL+OLgUUdn4uh4m+9GgA0I3oknsKfiHs7359PONh+LySZX2Rd9eczXXKo+Hq2gLo+
         oo+xDx696HAAoYlG1lH82qewEmjP6nSeRBTd2+LRVLCiCy5yNFGnaJMVx+fdw61L+loN
         O4PgdHccD/Lq9Mx1Gu8TJcfspQFjfjjuYlmVc7qSL+M80/xPKg4yobTDYdmRbIEFb+sn
         cigAcKTJo0YLbLj5yK7tqEON7yX0u6daLqqFeq1ArQCpw5wBMoeZzsdtyf2axFGIWQxI
         Ew1g==
X-Forwarded-Encrypted: i=1; AJvYcCVVSoAioiJ6NtpJ1K0P3KBzHrA8g5p/BgAD1EM+LYwLysEXQzis2Fh4QAN4r1PQYqwZdlul5WvCvzjbKPxN61z/sVRdTTTbDdYCgMTWD64=
X-Gm-Message-State: AOJu0YyYppfZuEAYBCImI8bwhQRLoyQetfnlmEsC73I+nQUTOD9G510Y
	fJIwnk7Sgls6VNG5K1eJRFfkWNO7rtwzTNvLj3D5QHCjFI/RnWmfvF2Z9ePBjBwqS3KlUUQjpbi
	ASuQOPoqPRmGM3Ef6Gg5UebUl7LlhjMeY2lHG
X-Google-Smtp-Source: AGHT+IG7fagQeuv9MysJufo7I4WX+exkZHcDTKFLG87ES3MG0TZVHdX0um8RINT1N6epAZ5vXGD+HN2U6R/oKFQ7yN4=
X-Received: by 2002:adf:cd84:0:b0:368:74c0:6721 with SMTP id
 ffacd0b85a97d-36b5d0bc9e3mr8585993f8f.38.1722431018977; Wed, 31 Jul 2024
 06:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-linked-list-v3-0-89db92c7dbf4@google.com> <20240723-linked-list-v3-5-89db92c7dbf4@google.com>
In-Reply-To: <20240723-linked-list-v3-5-89db92c7dbf4@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 31 Jul 2024 15:03:26 +0200
Message-ID: <CAH5fLgg_6o5HTtLc7ngyRsa5gLM2Gtqm=QaBT+oaFjhdZg=O6A@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] rust: list: add macro for implementing ListItem
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Marco Elver <elver@google.com>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 10:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> +#[macro_export]
> +macro_rules! impl_list_item {
> +    (
> +        impl$({$($generics:tt)*})? ListItem<$num:tt> for $t:ty {
> +            using ListLinks;
> +        } $($rest:tt)*

This uses $($rest:tt)* but does not call itself at the end. This means
that trying to use this macro with several impl blocks results in
additional impl blocks being silently swallowed. The macro should use
repetition properly here.

Alice
