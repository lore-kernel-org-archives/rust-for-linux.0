Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAF52BEFFE
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716922; cv=pass; b=BxkobmlYCVlNC9zhswSYoYSFv3icwQdnLbF6Fdfr6dK9NZsdHuApPlTyb/P4sELO/RxDE0wqXHdm1IUjxX59XxOscXVKWKhmONuiUU7EkL1gkH8cb9U0Ag7QiR8vLCVTSuQo2rBH3LarTg2h7unEukg8jUqYPAk2ig07ecg/z98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716922; c=relaxed/simple;
	bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqNkS3Sc50MiRFlPWzYFE12b54ur/peG/Yd6YFuhdynmVqrHNknsXoXl4OzBliuDtbeLPLHiIvRspJSKGLunpqCkElef/nXgSYzdLoy0vmh4qXl4weRZfcINr1jCz2fEYef7iylcHkDplecWJ5lByl9ixfAXh2phdAkjnyymszE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnrQZ9pe; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnrQZ9pe"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f5ae07e2b5so777736eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 06:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779716920; cv=none;
        d=google.com; s=arc-20240605;
        b=cb9BN2T/KfnJ57OqslK60m2XlbMWUOHb9qS3+kUlS7yiIKMJKuxsjI86LHMDS7aKuf
         xLffRg3WaxjQz9+15OvNCr2snuMjwkiDcqQCKLPhXOnE4r5XzwS/Rg1+eLjuhTAdTG/o
         UyiwqJrUsHqu/s2ySBPTo+69iWT5OWhMGaQqKNS5VUy0Cy14b2LNAm50H+wYPQWlG7tr
         FNq1j8D0WOfto1G/tG6lLWqcNxKzJU2le1IDDw8gJGlD1K3PPXgkYea+lb8O+UOBol2V
         nt3BoIeDrHqwB+nukQ5pbojAWTWwrugR9DvF40H2hXFSTq1TJUlcif5vOMi1lPTvjnom
         CrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
        fh=VlLYfAR3WqsW5f81jBcQzhLeOtFC9M7mbrvEs0SBWjg=;
        b=bHJix1PY3Jwinyqf39hYREUcb0CaMEdj7jb7Rg+v6/7ppBPTmNgD4DBZKzJ3nJImWc
         0ZSSUjLYeC/cHcseijIVnZ4/+aknjoBNLHbobswRME34pe91WmVceL5VRofq16LRul5j
         OpNJgEMxg/eS7qzJw+hLmnSzK3XMgMkhP/2x7uRj+xS4YN8gdjZrxLXjiNQKykfM1/EE
         6lSf5DgUpzpoYfTGeZYErxEA4L1uB5yxm/Ij/oAA4Q12BQZo4inmK+XMGa72GltBYvYd
         xZZgSbeQgbs9QaDoCZOd2gH1BC27DggPX5w6pWb7wNnq7P61L5NBpi9vFJ0iKNHQoS4E
         rA+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779716920; x=1780321720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
        b=lnrQZ9peMzw0edVCKUC3WM8EsyFq+kEvdnEjN0qKzYpZeQf2LvbBfKFnWULF/Mpjad
         7mLtyyYM0gM5lPCVHP0Wd+ueIKLRT8yM1SB8LFnhYvOkuS06y5CV3MSyQfNQkxAnnyiB
         YdRWND7mPVXsAtPwxXgUTo9NVltgI38bQljJ9UwqRExV3gBUv+gXO2tlU10lLc3Dup0o
         vVeRdOlvuUC0FJAYWjeme7QrC7JlZcQXSY7wY46eDbbQ3BF8JysfGZyM2hGzS1sTLMoP
         uT0CeBstDzfBjwMjM/WfJiuHcJ2krjaGfJY1HDMCtR356o6/xZJOSNhY8JCDdzp/ss31
         ZjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779716920; x=1780321720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
        b=h9u826MBdAUainkmZgojADZLJrqN7uXzDrse53UvGuWIb+AJpY3xEqIOtCyTeA2QZJ
         C3YmacD/59eYD4r5mTM0TYIZ78no6Go69WcErcMobTcljVwos4QmXZNX8cxb0FbdxHtp
         EEhtAXxYG+ifPRCnU4+sfGNm+aL2h+Ou/Qnui2gAeNKqLCF0PJkdiZtft4Tb9SI1I0yF
         ecD22bPJXHCS+Ouy9SPHplTP686E/rhaXyeL7nelHwFUOzqE+wc+G0nCteJdUMMgh7Tg
         1GZzAFiXtpfq52DaEJW3+Ilbz4CN/sAAjZv0IlFhsZ8DeT6+eOGUzRUD3rPoq2fevDtx
         OsLg==
X-Forwarded-Encrypted: i=1; AFNElJ9q4McHcsqe/Fzm3Fqx2azwxKPp/rfacdY88ZoeFvgwsblVVcjYkJjblBpMqYmXFPdSfPGggZuI/V655kkYYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzykRKA84D8C8K9LkXDpqFTJUBmesxw8UUvZD0/o50HGtZybZ3F
	eQq9p218hYpzZqfsYzy3jlWC6vw1e/mrYkzeOxRm7e0hUcTx6yXI48yjzwHppzh6ujaShxGWjIP
	5qePo/m5rZ66T20h9ZUedbKmF95U4rJk=
X-Gm-Gg: Acq92OHtlfJrn6ezGHTA5MEOU7Tqjxk+HdfNv77/5ywgm2hNDDL08ZUnJvstx5WEpLD
	RlFt0iBmjTQE3/pWZlEWCXfySxbK7xR/KlQ36yurZxBp+5GJ1Jp7dUJI28Ce9dokWF3686UI641
	Mf06nCURZyhaJNFq/UIyKaxKcJBv3GujkcH5M7uvwKVJkWGWxHv2He8MDNdb6gMdEi3FfmkIXTj
	i+KMK0NwKohx0raqWrx3E4ePSqxK1dlCyGYxgpWEXAw3aF7NBm1KjmDFBw5PMd2dCKGqh2Y8cLl
	06uaeiX0DCdsQEn2r6rJ0g/Ln+sbTfaMDe4vLjU89NqsU7z9oyJEEzgVZ1yD+tNj4cSbodr/6b3
	iJlJ45L2SSeb3dRoVUT8RF2s=
X-Received: by 2002:a05:7300:cd97:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304490ec25bmr3233212eec.6.1779716919856; Mon, 25 May 2026
 06:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-strict-provenance-redux-v1-1-0880b65fc17c@kernel.org>
In-Reply-To: <20260522-strict-provenance-redux-v1-1-0880b65fc17c@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 15:48:26 +0200
X-Gm-Features: AVHnY4KSxYqiTdhQ2JGDTcNoQ7xW8opRoeLvLR7fidZtFguYw_peTCo-of46_mI
Message-ID: <CANiq72kwRam1yk_w+B2n2osXLEVdofDbisBs+FYoukZ7GYNcog@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: use strict provenance APIs
To: Tamir Duberstein <tamird@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 7:19=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/all/D8EIXDMRXMJP.36TFCGWZBRS3Y@proton.me/

The linked suggestion seems to be about enabling the lints, not using
the provenance APIs (which we have been discussing for a long time).
Do we want to enable the lints after this? Or what am I missing?

In any case, some of these are not equivalent to the `as` casts, so
they are not a mechanical change. Could we have, at least for those,
the reason why it is OK to perform the change? (perhaps as separate
commits?)

Thanks for cleaning this up!

Cheers,
Miguel
