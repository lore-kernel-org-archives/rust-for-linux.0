Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC014F7CA4
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897505; cv=pass; b=LwtGifYTWzVct02VceztjaqdyN4a/Qx34lRHd18N+tj69xg77bDQ0L0MXReVYRaFL2yXWGr2J7koA9fixIq+Fknj2YIC1smBWrFC9a7nVv6kPCKA0VccFb/g4e4/myLPXXwdGRU6Ktp8T4ei4BYITSluoJXKzyHdXNNnvK7RE6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897505; c=relaxed/simple;
	bh=hJKIthmcoSQplDJE0ksiUJ2iIxFkUQVvqygF1wIyD9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDfvYoau/YEvd91ID5DFdszdUNVfxqnIaWt0SrYWmGCNvzuWruiHk4WCWMPwUKDYUA4Fg0Hadxx25xuKxZoyMyef4iXM9naEGoNG7GwLP1bCQIR8Ic7NrDpirf3/sL3uAkvwYXJwfFfZY3oaARAKAoWC1q1t312VkHXbLIJexak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCT8EdU4; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCT8EdU4"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-313bab9cfe7so313014eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 06:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791897503; cv=none;
        d=google.com; s=arc-20260327;
        b=e/Bsq/iZ0sEeMNuNfwBBmbrJJFgl+CjbzD0XCJe1HFYS8YtAFFomLWtITkoGHxtrR0
         YCqhLNMQRwk20QjE0+aWJc9jgghwpsoAoNOYE2pZnjq9h6nz4FCEFKivIbuQO2bEOrdP
         xInK257YnVt/DiNtgu23gmk6N55ySMtFR1s63N3CrBX326mkA5Rcgo8SjULE7PgUP+tg
         9tBbNk+3HZi0nlXmH8oYUYPeKDF+yafqXCJYOYYl2O5MNadANb7QKkUyLeP0EQQO2Cil
         HzgEyQBsh+jQyGoKFwP8BCKZshekA2F8fnCGdK3VBd7t+KYJ5/5E8c6BK9jmMJPxxiJC
         pigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bL59kslE7Bvimc7NTbR0+OM7nidwyCwsipRxQthChUo=;
        fh=BRSH3Mvxl7oryxQUPviZznvlWV3V4Xu/Z6twmyv9FCM=;
        b=Kx0F0W93YwCsdwMOYv5iaqU+8eYY9L/hKlBbNDhfyc54iGiJklb3qM72Eir6dAcC14
         mNM5gUs8bBGe4dS7F3o+DsTg2iilrdLDTlqnOeZlLrMQAjRljQyOxs0RZUB79A7Bv8yu
         5y7adW2Zu+kVojjfOI9JJuwv5oWsCn/dC336tKSLQv/rShkFqGYg1L5pJ0sQ4WijV1SO
         3gFAwXnvPjdamiOJinJY3cYNAaaLeRqpP8iaeCXkRCAwRdxN8Vs0mokmcVjjw2NS6MJZ
         cRhMk4GClg47PEDb3Q009ZNBkdczOMBcehypurFGmVsew3cHOHZDH2Bgy3u/h4qsdO3i
         Vguw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897503; x=1792502303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bL59kslE7Bvimc7NTbR0+OM7nidwyCwsipRxQthChUo=;
        b=WCT8EdU4EbDHc3u7XUhEPCl0B3vko6WTS5R1Mj8cpz5p98yoT3qV5nZk6s2F9AjGep
         j5neg1n1GA9QPDVGdaVC1j7MYRrlKYBM45X6e7vIgKhtAuEEZ7wZ8eK7OWLBrtMaZjCb
         faIDNHke+fi1yPwxb3oVoLa4BI4aOV1+8esDuZZWcZpZImdYNFc3E1/CnRwgtbVoFUB2
         LQ1X4084MGzqkrbFvq5bcgddG1hdBb4NSPIJBSGwe8S/7bSkf3OB1npbHjFfQ0EIM6Ir
         DaynXObeLW+wHdgBrlVIgIb0k1wezc8PDzOgcGuew41uAevcCG4U0j2joDB7SPHNU1x4
         MglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897503; x=1792502303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bL59kslE7Bvimc7NTbR0+OM7nidwyCwsipRxQthChUo=;
        b=BAQ+O3+pwuELMGGeKATDDWy+fS6xAZN5cYpbsU5UzzMf84CLb+4+JPUpFXivNKMIV6
         rUyw9O2VUgifXuRFHa23qs4M28JGhE/X1YheZ8BkqcACKgDyFzyPkaFZ7jp24/UBm/aQ
         UQqppK0SruOJL+EiYDbJuERfTtYBQCBo4pDtqObLfyRytLcZQFApJV8wgr1Fi+1l5dli
         4IgmNYHdOXEC6lKlURpjv3f5fJvM+txbcbGTDYJGAHCVtFLoPTcNus6guoJS1I+EXW/L
         7aPcQAI4EY80b8h2B2Em3wQ34+9lBvYVY0tQ9NKK6MGUO1nNuyE9FsndzO4yjEKXMJ9X
         5mBg==
X-Forwarded-Encrypted: i=1; AKwUvBwxZCdkMJLwAEkqix1RcjZlxXNDPZ6NN9RVL7KJ9v36nHPihuFcvIr4HsEWtHZSMSxguH+eHBkwtiLlVcOxlw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKUt2JOtykCNPtY5JS9nXl8eSR79gdpWs/FyU3SVqZ4dLi4Sk4B
	esnpJRpj/HgFlZAdQ35BI2SUFJQnhqzCC++ndbvrHS6I7ztOP7WziH4An9YgkxhLnh7a4G2T2JS
	LQ+KOaCABhL90WtF6OL0gGE851SECGfI=
X-Gm-Gg: AYBFou2rPpINYa6ADzshsK4+MpeaSfSfsfHZtHS8P/ssbfAAHEWRfFaQB4wvaW+yBcP
	08+dLRoOw93IoYPHvSj4wUDCNag+6BjRtlwLCPVbocB89A6nEiwc6tcmqhb49T53mGIEkurYrCX
	15Z8P+8z+Gs1uhLjNsU/PMJtIIPZunqiqyRA4NIZuBfFwfi39tBSnzM21WlIb9ao/PEmz0M9ggh
	jNH50L3m1JXcFbS8B6m3l+uKJxPkjz1TWCTihwhrqm47aoF8McyTkoNQ0oRckf+2yQyWIDnMGgV
	csjOQ5/x8TWNv39yYFbH0HYM3gh1uRyBQwNSPoSq4J5IUSrPyU7x4x4Ksho7Ae6o7lwswcaKmWK
	u+CVlzknQTHCZr3qq0oEO9N8Bjs9CI83D8veqxwVxkDgYn0ciJTgMjMQToC7+6j+WIKPLd0fvs1
	+q8im/OygC6SYr5P8TkN46U2PgzqHV2yEg79RjY4Q4Y9pEUlgk3gtyH1fu73bGNA==
X-Received: by 2002:a05:701b:4510:20b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-16b4f520f3amr27369676c88.0.1791897503344; Tue, 13 Oct 2026
 06:18:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-cv-v5-0-113a538dfaef@nvidia.com> <20261013-cv-v5-1-113a538dfaef@nvidia.com>
In-Reply-To: <20261013-cv-v5-1-113a538dfaef@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 15:18:10 +0200
X-Gm-Features: AclHuK_z220Bvz1iedMpcDzIc6RcPj5ZS2ls1iZZ_k6lRJyNsSKpCWB6rOoIE30
Message-ID: <CANiq72kccCL7DjBtLw7AF-nNcKo7OjjVwZ7Ba4fZAQXVZaMkMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:58=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Currently, using NonZero/Bounded constants is quite verbose. It's
> unfortunate because it disincentivizes using it in interface boundaries.
> Introduce a macro to make it nicer to use. The macro `cv!` (for constant
> value) takes a const integer expression and widens it to i128 (at build
> time only) before passing it as a const generic value to a new trait
> `FromConst`. The value is then converted and appears in the
> associated constant `FromConst::VALUE`. The trait is implemented by
> NonZero, Bounded, and Alignment and lets values of each be constructed
> from constants without a verbose turbofish syntax.
>
> For example, `const { NonZero::new(1).unwrap() }` can be written as
> `cv!(1)`.
>
> Add the `cv!` macro to the prelude so it doesn't need to be imported
> explicitly to use it.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Applied to `rust-next` -- thanks everyone!

    [ Added a few intra-doc links. - Miguel ]

And thanks Eliot for the quick respin :)

Cheers,
Miguel
