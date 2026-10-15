Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9B49CF54
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073333; cv=pass; b=C0veb7PaE+wCQlg4ohv/JDQaECPA+/OgYzg9P4B7FJFDSuZdJDKtDVPsJjAwBliQlH7cUwzI5vt4/7SOvoeJJQLK5Xc34uf2w1t8ypVUYYSldZEj3EHNp8Tm6nT4Dztr45LlmHXFnTvnvW43C8IGYJZVcZtIjEIpmfbpWjfpKPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073333; c=relaxed/simple;
	bh=vbxoAbT3rNtvD7wTtzYhonXLa4aLnuYbiHskZUjD5mE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0tvZfIQVMngWDAOEst/u+HBY52CWDtnQot8uWVMlOxVOCeSY7RWvgZeIz2Led49o+ZynQRrbZHlfYn0mRNtZu2JW1nQR+pztGxRYvCDWVYB9uA8jD4QFSJccv/IEFeAIbTu9X3RUvjLju+NMiVq37rXNucM9l/iCZDna9btI9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEKU9M2W; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEKU9M2W"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35159e0092aso617676eec.2
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 07:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073331; cv=none;
        d=google.com; s=arc-20260327;
        b=E4ziEgoUcaiT+Enb2dnrV+FvuyJIyl7iZI3Vqcq+lm6QJ0G+7ZCIG7YykXTYDG3xAm
         S/6uKZke77fbPhPg4b/oDvqVKAWWkvs70gkdUgDJfpcPKK3hHES4rAbnscsKsQKHe+8b
         9P96w740peE8ILiPDls72QHShErjfu676CRcTCG0tuvExOCxiXliE+pVw81DqdACRJn9
         q/ZA2vFsnzGXyIR71O11b5XPtGmp33/9KHJC1v7ggm4UPgZH2eyp0sVZUrOziQUHCZAO
         uS837JYaYuhGETkU1HWm19PVKIcVPr1XX/0UTIwE+/KzJQaJKXzo4nyEtNFCTizbrzHL
         /fVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vbxoAbT3rNtvD7wTtzYhonXLa4aLnuYbiHskZUjD5mE=;
        fh=rdHqeM4kH9R9nmkbEFNdz/lZ05ak03VoBvlRACMEm9Q=;
        b=QmCLZ4v4vbaIvf3UNIbuv1FFJ8hWkcXTwgOZdVMMoFCpHhwZ35afSWer4mnpt2pyjY
         tTBWrlEKqXcW5XiGaArCfhJnYP8Gk0UJPE2e/Hwsp1LI7f/MXZkrgIxiELhThSFv2Vpt
         0CX042GnLl6FrukVcHTNQ3Im6uhgRmQmn1tML2dzchuRArXxGpezbIG/YdiE7pcf7k2A
         5OYoIL2h50iXaa8duMgyUmeinCY80H5r7x7GiubJzFkdFDMzjhU4DwtzNDC1CseLMUJA
         VzlpvQqD6UzGWZDYgAYjNHyhRE4h9IxD833v/IMkBoSb+97jCYwLiCXRgCrBpGUWmtbH
         ggHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073331; x=1792678131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbxoAbT3rNtvD7wTtzYhonXLa4aLnuYbiHskZUjD5mE=;
        b=pEKU9M2WV0pc0Vuw4GJkgi/BgZ+C2N5ptSa864aHjFmIpWokgQ4T4i/7zPD1wqQ1w+
         KZ501+IKD4slSCehDChGRuUgdlm6qedg1yqCsIkN2S+VybYD3azPaxe+0+FhYpa30x1X
         v4yzDyYbunmUwLRI5Qo8XWoo846CegDr03ktJ0YzOudNsiTV+JdbWEf+AAzOyQAUUGdd
         OwmXPUmGbE7QsZQKrIs2B6YVoqLquC9iqh3GRnmN70JjXXwoa2EVpFBn9yhDJLiC+ghb
         3OcNrXqErS7FRwoTCRAB/4udVVOKoWQ0qyo8YO9qu9Zz8ZGRDodNESHR5b6crP0H230t
         uVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073331; x=1792678131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbxoAbT3rNtvD7wTtzYhonXLa4aLnuYbiHskZUjD5mE=;
        b=VTrndu6mHAaKk3PHch+aEZTNMGZ06pWo9bERfOXc7H2JqbUsIq4kkwuNp6InbtQPpe
         NbpaRTbp1DvwjMZVYEAbqHasAD3oqb4bVM2hZOw/5czzpDQ3+D2xCEnOV/o5UuEKNU5z
         kpY3A+HpKDvIcaWoFAX65hn85fcec0h8v7ZIxdJuop4KjQHjkSMN+gMXl0hWRK5TbA25
         2khW/FhhHPCa5xcWYcpQRenFoZts5pyJKNvfgDgTHO/S1n1LiuVsTW1BB3waCE6m6NQR
         /aD/EiH2UQ2uF6LvL9Pfz0SYUkuUxdQ03zbtIa/8sJ2C9b6fiQmdhligqw7uV1KCCcQ3
         hyOw==
X-Forwarded-Encrypted: i=1; AKwUvBzdmWQtstt8MuUz6EKiqcFPYWrgN0oB13Ex6IMHPwn6w3MusmNJLmzvKJGuoVcWqaBrV+QK0k9ymz2w7KRZbg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHySSQFoEWuMPvOZ6JR8GB7mtt7+T4MIoNB5bIBVPomMmpQAnk
	cHUZQYjeFHqT6Zl4ATiqphRFO+MvPJvG7VKbKzM3igpUCv90Pc67jc7k49wUFjzft3d2x9sT7ae
	RSNBDfC1ASynP/N6t8zvlpYja/PYqq1s=
X-Gm-Gg: AYBFou3h+YnNoGuAmuzPJhRZoV7KaeOUnuLcFT/NQeYJto6qDfAY2JEPAitvXpWggs/
	xJzYHO+h1TGmgH/TXpP+Dk1lpDXJo8BwdJfh5lXwrw0U4HiBzqQhCxMz6UBNBFa652CRh2ZSPV3
	FYAOrALIflTSr1T0OKTfC3dJkpDHEPM5WHyo1G4P1bZD7pHpNNTtr0ZNy9+vjAqEO911Dru6TDK
	GQc0cZc5NaK/p/cZXgv5749DSAYlxymjzKpkN2iq3gX5MI2eVnFG3zE383FNv97Mlabf0E5U5W7
	+1dvwweqCqUMiLL+L080yvBQ7hd2z84oLiR6odyN7ZLjY3GrfjtqjGk/X1taSXbh6LTcuRCO7Zs
	XVwZxVbV8kb/YEouVo/gmV41FLhF4byRLTtJ7B8UTlWjt5oiA/qiAA9eTE5bUGxydbQID9GtL7B
	EnTvdCTx/gasDVwlnUxAhR3WSCE5hCpVFJxkzUHirE1+qXsv2XBdu95p6cSiotcw==
X-Received: by 2002:a05:693c:6215:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-35bcb8a919dmr21911265eec.1.1792073331421; Thu, 15 Oct 2026
 07:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me> <CANiq72nok4xoA6j1SXVdWKLEKAqj3MfzCa-Sse7NNbkrn2MXiw@mail.gmail.com>
 <DM4MPF17NSQL.2IOMXIQEVINKR@garyguo.net>
In-Reply-To: <DM4MPF17NSQL.2IOMXIQEVINKR@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 16:08:38 +0200
X-Gm-Features: AclHuK_XlicioiXGWwQvETod_9jtUxSCTVPxmzKPQqf2uV7O5F-LYF4JPjoHY_I
Message-ID: <CANiq72mn2Nu=j5xynujtRvRnCV+vrUxqYi3wYj34kBKySZX+TA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: non_empty: add NonEmpty
To: Gary Guo <gary@garyguo.net>
Cc: Lorenzo Delgado <lnsdev@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 4:25=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think in this case the meaning of "empty" depends on the container itse=
lf.
> Unsafe code that relies on "is_empty" would be the `NonEmpty<Container>` =
itself,
> so it just needs to trust itself (as boundary of unsafe is module level).
>
> I think of almost all of the text above can be removed. The invariant of
> `NonEmpty` can just be "`IsEmpty::is_empty` has returned true" and how it=
 is
> interpreted is up to the container type.

That sounds good to me, i.e. my main concern was the invariant text.

(Though we still mark things as `unsafe` even if private and within a
module, so if we are actually trusting it, shouldn't we mark it?)

Cheers,
Miguel
