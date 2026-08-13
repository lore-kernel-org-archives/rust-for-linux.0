Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9693BBFA9
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613577; cv=pass; b=RaZeB4fh7r6ZxwvaaJ/F29qO3ja4C61d+3U/ExMpmiJg+QbYyfHHPYtMvXo18d0rEx4ioQ5CqnEpP8cFKbL2+0qbNmM1OJsN4AOdhw6JALRsJVSv1CbiPaTu87shFZXd/wo/2dJV498w3b2cnL0DdLyUXrMidtmoDvevYAZdSo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613577; c=relaxed/simple;
	bh=hxPH+ehBPzRCWk6w7xeKnqdyk50jcH5XyZCkn0NKK1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omtcjjLfBdfunTrjy72wuw5ala1mevCSAISm1jmhcenmyMVgn84w8Vm20l+/d7YFH2+yAmqrTQKCm4uct816HMej3YanPrmL1fnfxnmhp0DWcYwWL77x7Zih2ugyl5a7vwhQ7XTZIJdZ2pAsZ3ryaSfQT8XBBleXB1C2GCv7U4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki0S4C8W; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki0S4C8W"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d319b84213so4101655ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 02:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613575; cv=none;
        d=google.com; s=arc-20260327;
        b=MQihdiGODcl2u8HLErhv26L61gxEdt7bCZf/dgS8jJEJfH4H/YsWI4TdX1NwX61ArN
         PFsqXVAy83oF+8aOUALR1Opyxn9lU0Zwub7ox9M5EzgYRQqrJ5XBeW4ZyTInN0jokdVa
         /BSUiQKkz1AfutAAPUHWYt56bO8KN/vS/Q4h1q3pFpJn4x40ktrYpoWe+kUTJ48X8JW0
         A12yFbGqDhwqCkQAxVqOxo1C+hlu9zJKy5kK2xvSFtohsenzPIqX+bzmMaYYtqPkm47T
         /QJc9nEflJoGNpiz4emisHLxuIke9aj9TumALmCRDVlTxl6RWCx0GP81ZW+CtDmBhkZk
         oNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        fh=mLMVlEPq1wU3jYG/f8vsyhvfSKgsC2GMYy9Y263NAiM=;
        b=SuAwOybPrYGUPSUQWeQV564mNRJlqgdFgkylLHgzmsKfSNzcDGzuGee+7aMmDlsFAV
         j3kkaxT35JhTxBJn13g/6RTxtNvVgYXpWm1ZPw7Hw8TeYEXBowbVahZp1kEBEkx78Khs
         FsrfPawAfSzspc1hmBnd0WckeG7uINZFUSPcL0483yij79HbqgZPl7sVhOMvFu3S1Nhs
         uUiV6iJ0Ec01CHMJffU3JITFOuC13yoaR1W9b25Pc+v8uCa4Aa4DSZb/YyLHcZABx5Sm
         F0A5LKjuQXKzg5FK4bS3tFtzTgiZBOivL0Nh5SsurtARAUxJ3F5ATxL8P/kGhHxOgL/Y
         zz4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613575; x=1787218375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        b=Ki0S4C8WDWmasGaotvQ0nFof4wEoVQlo7An0ov6Gl0rUwXMSgg6XVEXZo6N2Goo3So
         O3/FgHe2UfkWJy/r6cN/eGa9shVxGjV8+Bh0wg8UFrL+p1qKMHJ28Yi8H4mkSOrl47YM
         3nAsY5Jw5yPDE6Tl6+UUx8L50Nw2GceIHZWxlSifOIY0qi81DPGXV1vCFZR4MyImM3S0
         9XraUocr2791q7nmxmZZxmE2r7aJ7qIEatOVqrjx2Orojbo0aklqiZABVkTYQ5o/JT0+
         DMg+Ns+B/w++Om6XoscYdrCTs/9WeCwcfWy+JqozQyENao+7695ruzUgy5KCSXK8V5Em
         h96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613575; x=1787218375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        b=JgiWpE183sS5bGncs5+iWPqKUx2/GiH/537souxlGO2H+Kgs1x3JD421nk1N0YKtps
         FGMcp0wHpTfGfvpUPv3qrJ/K1FtO4XxsNeMQk4ud5UpvsmyGvky0Ry54B1uYkMrcrZzq
         dOv1JjbVcl2Xg0pkv1C08KEgG3pfPx+B8pDLoKpWn6RkulVeT/sYXlx7jQzdds44qi2Z
         7GBnCIPd9+lFsCJRdCvBLF7wivkM6m/R/G7LSn78kCf1bdsrm+oSwUglclsslHHqAbc7
         T9Ry/k5opqxNnIQos07fPom6FXH1E46GWjkG21CRj0ZihcU+URs0+zDxN1ADhvqaZm17
         Tpag==
X-Forwarded-Encrypted: i=1; AHgh+RrFbS2B9DHJDUrVzCnrwF9dS1eeXaHX40vtnGzGSRl7QbzAYlg5eM2S3/yIdxUjrOBDUob0ULZRdsZqNC3MMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNcYtbG3ca6VqmflfmB3BmhSPF5MiTsfRL+/iSIWGgYRUeY1oO
	KrN+2iAfptw18wRf9z/FaATMLJq89jr7S35pXZ0/5JQzWa2bzgYBA+c+5+tvd6gq2wDQ+Gb6f7W
	dsgGE54YnFe+m3RfqkTPpY3EZTaSivwI=
X-Gm-Gg: AR+sD11N7lQ0ACij/hsHAPggukT+GhRaUq/kJv0GE1A6j/9HOa6wkV4F0QcnCA7JGo2
	UzUCjmkrjdbdhrgpbXqpIGOWW5cig5ToLn3LsUAUE07GJmFShAcwvfixTuyvYii1lOW/9nQwetK
	NaOQwSHoGG5o3U7kOvsGuGSHYG3KagMTIelzi19dbIEhQsP22PXZm0rehLLxhZPa+xM7gXBNL0M
	WSYfPLqvDBCzkBVWXrmBzSrYeUmEHmR2IaRIQxs2xAPRLT1G3oxllCxpF9jiHsB6dGB4lOFGP6e
	ZxOKwkxyz24aojj6ZNXtW9C0oWRyzwbhIOQP5G6ln2tS7x1uOybZo0x7cQVX7jfzLAz+AlKvbOd
	VPkyc5RAd6vxoCTKf0hO6qCxphgzcaKJNPs42/BsneKPzqVCJuK45a1P4xbHUuw==
X-Received: by 2002:a17:902:d4c1:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d389a366b2mr27617905ad.2.1786613574868; Thu, 13 Aug 2026
 02:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
 <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org> <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
In-Reply-To: <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 11:32:42 +0200
X-Gm-Features: AUfX_mwSjTSmX5g9cpyULDa32fuXt2Yd5-MIkCd-iXvVUBlQKiet4rzS7F5uPZo
Message-ID: <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>, Alvin Sun <alvin.sun@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 1:57=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> IMO this is the correct way, also consistent with
>
> https://lore.kernel.org/rust-for-linux/20260811-fix-fops-owner-v10-3-7e71=
776f9dbe@linux.dev/
>
> It might make sense to add this to rust-next.

Yeah, it is also consistent (in the sense of adding a fallback) with
the other fix I added when applying the series for the `macros`
doctest; and the `kernel` crate is not an actual module yet.

I guess yet another solution would be to have an even more local
fallback, but that would be too local in my opinion, i.e. we will want
to use it elsewhere sooner or later.

So I could fold [2] into commit 98f256e27262, but a commit on top is
fine, I will reference that commit from the new one instead.

Ok, done -- Danilo, I took your diff and converted it into a proper
commit, please double-check you are OK with the Signed-off-by:

  ec6fcf8a175a ("rust: kernel: add `LocalModule` fallback for
`#[vtable]` `impl`s")

Thanks!

Cheers,
Miguel
