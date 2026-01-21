Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704A34A77F
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 16:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012253; cv=pass; b=Ee0g5naaAkpKcoXh/Z9VCXzTBgTkFLRjT/UEqIdoKW8PZd1dY8SrF3b0cYNB9ovobr2ulpcruNDlM7EQKS8wkyq2p2Y01tLESoviYu1yAW20RP7mJPjfmrmxBkQD6TPxZ/VJiKg9W23D5KIW/9LnkPNc/lXE7QchFK6tni0a+rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012253; c=relaxed/simple;
	bh=5poAQf/o6h0Afu2gdl0Rbp58IVNlkVoh6w2WOffC8oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqqoudtlO9f7WzN2I50AC4nKUCMzd+J/ivaJyRYR5SdywgG8nDWjzM3IAh1j9DINoqZOdi/9gW+2j8sT/vyJ7OQhJt7Odge9Bcgcv3uCuBa8Ekl/PQ1H5vh6Zy/py810xy8fCskkZwptzSwZ/11ZmqrKyj0nRbfvo5pWi2EgX90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNG3EV+w; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNG3EV+w"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b703e04984so125065eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 08:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769012250; cv=none;
        d=google.com; s=arc-20240605;
        b=JYyTaI2ykR3nMq/DkhrBOgvj1/oJBt+dTycmCdQPjzglqx68G/IhMWrHGfsdYSdeqG
         CcnI/QyqAi4s0Xj/H4EX0kdM7Np8+wsp7A94Jrm2cTCCNwN8tq02hu62D5QgLfubc/D4
         yFXgbxt6R57SLTZTGh0h/laTaW23ibnVV4JdihFYZyI5cGQRDIM9GxKH/G9VgXvTHJed
         WEY1aVOZtu+Lsn0KQ8g4IBNpVwVGldH2qYCUboUzA0b/rwMykm32MzjjLEXK/82Ozafv
         ivJ4zG+IjZ+IuDNFJ9cVxrvd5MxF6bikiDhFPM+tGvWR2yMSbU+mKaTxtekoZPhlH6ek
         3ojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5poAQf/o6h0Afu2gdl0Rbp58IVNlkVoh6w2WOffC8oQ=;
        fh=oUXwcwBltMV92Cr27wRRoNynOjUWwVswfAvesiZiJDs=;
        b=MIdGsh57BdzBUMfr704kv+oEb0/p41v2/qt72EdUABzsJeYnpUFefo3TDZMDqXsCTW
         jxS2/pPPMEXucYjUo49WrfWFu0EOmwGfU+fpU8UyU/nx+8S3INEvIoHjZuNEkm4f4sMH
         elFskWFUBFD1YkOC8PeiWSke8sLc2nLy7jhzidGooJdndajrin0h/77i6se360UZIHmw
         Y001QycCgnDc8xYOMtDHtBMJEU8UywFeiks46TVMOiP7sK/M1+Rvyq67kzcVICYgdhnD
         /Y4gMycOy9uhMT9T7XqEBmT0N6cTQxn0PFOtgA8lZ73gkEbKUgHmoF9yNJa1VnfKDZyi
         C87Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769012250; x=1769617050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5poAQf/o6h0Afu2gdl0Rbp58IVNlkVoh6w2WOffC8oQ=;
        b=hNG3EV+wMF3IVmXGFA3cXBGfEXiov32xV38cdd5C813rj3mMhPD2nco5IA9Ktw8zmy
         0Eb2ll0+b5y5kKWfGNs5IJE9xVQXijS+BBjvwWhUoWjiT+Yg/JYxvKh1okOTh9FdcVbZ
         +Z9qsD72hwZDnOIxRm2kfzXKw4v8FEjiCCB2LJ2VOyo6xxLnq0w1LDpOtMM/eD/r5tfx
         wFUL08eHOiuJ0s6xRAUqa/Btt/bSu5dtgnHao6GxxIAxOXXfYwN7PfN5wDKdCgsGfbFt
         vUb8sP/vluqm/NqtLPbtmYfGO63qGtbIEY3D6ow95G/L04bt1mgGkaQB4G0v7vkrDU5A
         y2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012250; x=1769617050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5poAQf/o6h0Afu2gdl0Rbp58IVNlkVoh6w2WOffC8oQ=;
        b=VIYf5eYHmTNJT1RxAzdVdAJ17dvzg7GrWD952XPmQ+WaS8nUb/kgjJ4AcMWI6QsK+s
         J9v0lD0NJG1iHjs55Y4+q0X4Rc+eXnuev8dIkOmHz+wL1dfJiAaHP+YGRc5AzM49hQGn
         UTm51fcuPzDhMZe5V9psmBJudd5M7sce8ALDAXFOMtL8wIeZWuLgvyjo8oxuJuRJHpTV
         NsaWQi3SmBUDrC64nyAMqXvkLfuqBmrrI5Y4SA4nY4PeypO0QKt82i0hJLlMi90p+wJA
         I1lCYCLjMOpwRg+w8AFr7Muo6imT9rkadKg+6p3m2bQOaHjvULw7hfC1qwJTRoKzYFca
         6ZJg==
X-Forwarded-Encrypted: i=1; AJvYcCXjxUaW8Y0AA7qbucXFrr+GapFln0F2+x+lpOyEvrBk5ih1FxUGPKDTKk94zigqUT7hEaLqB0Gx19NzuISSeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTd+X290bQ2O0mgx7O6mkVVHKkKRAfI9cS6uChj7vXFS0v9up
	BKbPsuI1hAV9gElsrXDdy7f/0T0Zqt+NgJVC4SA9HLXVAKPoP26hlTjEexMP6DqyEK/aqCTr9p2
	uSb8bx9rHmubdrQuM/2Rpg0qMyjQ0uUE=
X-Gm-Gg: AZuq6aKAdpa/F8xzp17i9vvFAacyF7ix+acmes+fAWzTrwVM48uGxwcJ1U6jo/9emOJ
	VtzSpPjNjFdTCREGTdGPSrzjGr8R4U1v/R1Fbn/TOXvKvbuPjxDSqfHuVnbLgSaWd0h5G6RkxsU
	wQbPqnXOeZOuNIYRTPQ5/jXBumDmlK/w0eJ2mLWhB5rzAc0DT4t19UPZVJJCG68mbC+Own69koi
	4IGUP5vMdyndU2vkpHB6H+tgRWRxa6s34wnKVVwLOP7l/YErGzHHT3qQ7NFvgvVEeopuk3Cjumr
	BwvyVYFC5/PjmKaNJ4+XsubAnB1ZwMrLo+Wz7ifZcHaQh5gBJCd5/4A+Stqt4TEuTC2VUQbRSNz
	xWxzP6XvF1GPe
X-Received: by 2002:a05:7300:324b:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2b6b3f21d84mr6927390eec.3.1769012250032; Wed, 21 Jan 2026
 08:17:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com> <20251203055923.1247681-16-jhubbard@nvidia.com>
 <DFUE9X1HQG9S.2YDWQ6GDLN36G@garyguo.net>
In-Reply-To: <DFUE9X1HQG9S.2YDWQ6GDLN36G@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 17:17:16 +0100
X-Gm-Features: AZwV_Qj17YDk0-i_ES8djSnLqOksAXttnD5kGQ26NHxsRmBdoPzhZqpAvLIhS54
Message-ID: <CANiq72=BmC8uykrnOZ4k6e51HH1_S+e9eTGi-LjOt9+XpmwGkQ@mail.gmail.com>
Subject: Re: [PATCH 15/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
To: Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 5:06=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I was about to suggest `is_multiple_of`, but then realize that it's only
> available in Rust 1.82+...

For things like that, a `TODO` there could be good for the upcoming
1.85 bump to the minimum.

Cheers,
Miguel
