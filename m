Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AF02798F8
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758822884; cv=none; b=iYm2z3lXU9QTW5Eqb0GH5yAPRluMTYyoBmvzp/G1W+HJjTB/9hgB7PWUxG2UrWrgBIIIkfcF/7vjj1XKCRNj7ujjBh/DfyPqp13UbbHIb6fPlDK51xrycYHOLx9UkhagBHjsLyM2Tfk1WZQWjTpscmVt4fEif8B1IcRVaply3/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758822884; c=relaxed/simple;
	bh=lIUtbjbIbsfK1r4Xju185bI0WV+9cWBrGEyQD1jmbPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1Z1t2E3rKNVma0SVj9SxDEOx+tAQk1JEcDo3V9AJvIYpRGhC+C7Zj88lhjYDyV1Ajl1tFk16PijtXhqFPZyb71SDFbWRqpLFco35TOCFFj3euFKJewwRvcdY1vz12IIkSgyIDqRelg+q+I423UxwVtUprrB5KcctY2qgiJFej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T0AWV+MI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T0AWV+MI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso1322705f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758822881; x=1759427681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz/FU9gMOI1RQz/pPYAELxAXstJ4fI13ftJQ5KfyUQI=;
        b=T0AWV+MIzGZycvSFPOBnEkGhRISCcZGDIE1M2v7rVwqC+P0bAY1lqFh2DSluBRUr0e
         EtALEq6DcqhOraMrH4uJiPUWd7cMZOagYSfnQaUI/kZM5Nbxd/YPx37mI4TbIIR3gxfe
         Wj5EjNupkGKf7VglGpgRjhpqVHLGGE6JACkbQh/2fFYD3AaiLZ1ZWG0KVL1F61eX6BQt
         YhUUSWXs2ssrMRKKCeenwPsVKB1iYM1WzZxaMghI/yQRfzrOcmI9GABvMHtf4LgzX/Dc
         Q/hZshE2WmPcHPwtvH9ypRRyEIoXnQ0jjQhQaxFkX5JIHsIUFLrWkald4m2L2H8duHFM
         q7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758822881; x=1759427681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz/FU9gMOI1RQz/pPYAELxAXstJ4fI13ftJQ5KfyUQI=;
        b=eij1WXaFoF1hjfIDt3wBJ9IaWUROGqR+qxRuliCi8PsU4UgKltzIfPPMP1iq02JZN1
         kPI5Vhd45Fq2um9irTETTUfeAzE7w6BNA3MQhNhUVgwx5GU+Pi2xpU7fxWr+v/UDIhLQ
         pSEAHPYnCZmxQBgxhgqQ0vMNNn8lR7fvXzvc/57S/6U1TqINFwGZdcp6RCUIJjDplMT2
         GI/57iPCkGdc6ZWdq8Jho/PSE1yOGd+BHuMb5HbwgFJc/N3trY/IZZBUz8/fvyAaHD3z
         Ie3Hqk9N2h+INfkxXqYHSaGv2JSUFHF++8kgNm18K9eZWSNoK8gECyB0/YXXltX15VMO
         /rgw==
X-Forwarded-Encrypted: i=1; AJvYcCXv0KPF7hPSkOOMn04wqUKGPhdm7H4cvj36z0eNL06JkA6OCgBgpfCAhGREBdu68rPrYV0mmwyTJDH7Hyf6Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrvc5G+MoYJIO2Ncf/G0dkhz74Od6sE4yElcu1NUjwftBlbuDy
	//yKkjbcQT3ALoKSqBY/YaXilmI0NSdTlWO1LwxmI61/mIiHaND60oiO/Trb74ckEQ7QmMy19ED
	/GI/V4S1s3CY/fO0SkQWHRRRn4glJHpLJTjTUGaX9
X-Gm-Gg: ASbGncuZZzh46OrUboYE3PD2SxjNRUi2FdJOY9K3B7fS6mBUFm3tmxK24AN5Gq2hh2U
	2C8VKMOIgi1ONmZiFegRK8SsJ6OP9quhvSrVfU9q2zCAquKbv3HKhiP4iYLs0k+G8arwsnq7s7O
	RFiUCMuhAXtMK7FyFFlMgqpFXp4U7zQNeMAThDa97agjWUQYsktVMMqA9lRIputKzcmwwllzQ8l
	zs4l4MI76EBmSWDrw4waoSQ0w==
X-Google-Smtp-Source: AGHT+IFzhjepmcnkySqZnqtGL/digFIArYndMvrBK8eZnF0PUW11M75uUihTaOx6kNBLQ87MKzuyVbx9HY7bWhwTHhk=
X-Received: by 2002:a05:6000:22c7:b0:3fd:bf1d:15ac with SMTP id
 ffacd0b85a97d-40e43b08da3mr4411702f8f.20.1758822880702; Thu, 25 Sep 2025
 10:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924193643.4001-1-git@elijahs.space> <DD1SGLU4180C.361W5XLH76XNC@kernel.org>
In-Reply-To: <DD1SGLU4180C.361W5XLH76XNC@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 25 Sep 2025 19:54:27 +0200
X-Gm-Features: AS18NWBiws6t4fAdWzQ-PgXG_fzqdadithN1M-LZqvce_KX7s1jnm83BsVbdFZg
Message-ID: <CAH5fLgiRFMyXkcx-CngRQOdYuJMkoTdXTOjGsdTYizvApArrmw@mail.gmail.com>
Subject: Re: [PATCH] rust: slab: add basic slab module
To: Danilo Krummrich <dakr@kernel.org>
Cc: Elijah Wright <git@elijahs.space>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 11:54=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>   (3) Implement a macro to generate a custom KmemCache Allocator trait
>       implementation for every KmemCache instance with a static lifetime.
>
>       This makes KmemCache technically equivalent to the other allocators=
, such
>       as Kmalloc, etc. but obviously has the downside that the KmemCache =
might
>       live much longer than required.
>
>       Technically, most KmemCache instances live for the whole module lif=
etime,
>       so it might be fine though.
>
>       (This is what I think Alice proposed.)

Yes, this is what I proposed. Most kmemcaches live for the duration of
the module, so it's no issue if they are global.

Alice
