Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCA776041
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Apr 2024 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712234858; cv=none; b=l8NFeQmKImAkcIAGDwAapMK11WFhR9bFUQz3bZTmUGSpgIkP+boqV851MXL2mF9vACLt1hgDFWKZsPaYLdH2izYRO9NnIytLiGwpQC4g5+jgQBGN+0ZdG0pvZqs6QAoLfcDN1eHM3eDXAlM1zFzU9ogbmD/gD4xvm9Qfzt5Adwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712234858; c=relaxed/simple;
	bh=OcWhq8YQr7wa7ZTE1m3VXpt+0logmlU/tma7Sc0giUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SByapBTmfy+LbtBJ1+FHcRJv8i8yoGPamM834dGVUHQVCsE8uRZPCCKSyc6WAyaXSK5Y9QmDnN8JZkFon50nDjaJPPu3F+v4ZKFEli0cg7i2ZpkGqXzwyMLKcZa5S5Dx/v9X7wzQy8/RXqlga4XZgwMYb4vNloqlYN1Bgl/cMVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mETcBg1f; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mETcBg1f"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7dacc916452so258913241.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Apr 2024 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712234855; x=1712839655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcWhq8YQr7wa7ZTE1m3VXpt+0logmlU/tma7Sc0giUk=;
        b=mETcBg1fzNJm+h9gZbSG+2mAFfC0Q+P/dcInHhUcy4KTlHwexzN7C1vv4f71BITRM4
         J1JIWmHePsxTEGeeyLWJleHLd/5ZdUkNJcIGtel1/O1Dz4EGk4Ej3XWkI/Dg0qZBFYN0
         420OqxLad046bkyb82LpDFkhbt+mDTfURwQRocDMzblZoAMRcZtVxUrd6hOoDuStENgZ
         iCCKaDGyXrI4gHpZxCGeaVQ6hYmvBIGnKWqxAPl1v6tQbjG+72SOW140l803CzT8LAcz
         XB1rx7CdmulgLHZQJVPlpOyIy7oRl5eV7icQlr6wIn1iZY/XVsxJUC2hDK6+RnrsxtyR
         kT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712234855; x=1712839655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcWhq8YQr7wa7ZTE1m3VXpt+0logmlU/tma7Sc0giUk=;
        b=UFV3OuXXLqrjEQ33ZtiJaktMOJsWRSgLF6mOAlei7kSn0PXKs+SE9QMflvXRq2vCY7
         rc1nRti2evGqRhJ4Trgkz8y0nZ4kBl96VCkJnQybl2TAGU5tzni6PLO48fbNoNQlQUhf
         AROteJt3x4QcJWH3azsiaS8qXN7HzhRvOfHM7FAS5q0J/Qx7HOPn5L0B5/q+8EDtdo3M
         VUvRBiJIxaWqzL4XHqQQreGRsVRJ+jcyrDJqAZ8vctZlGxp+zsj7h1ght9OvXRH5u/yE
         YTwBX8iWJdPdnJ+OffGrPyWxz8Es667mYQ2OLW35y5RRWHElvBRUA3N8y898RO8CxRwQ
         ujSg==
X-Gm-Message-State: AOJu0YxhxTUjyWNmFTNtnILff8K4GDWmVcKKk/KewsqiQQInz8GONcb+
	wNICy7DY8qyVsXBDP98kNjv9cVBdNJtg0+j0pM7bjRSdLe+DU7/rf2p+bdgUdk4Lm/74PPUHb75
	R5HXBfASojbbDr/2kKPp06CXgypZxGKWQH85I
X-Google-Smtp-Source: AGHT+IHBQNclBM1f1us+CEMtHN8UuL0uefxdZF11SHzXqyV0ypyYw9pZRiVxHT/OZE5zh+N2GquuRP6xBJC3usuDrF0=
X-Received: by 2002:a05:6122:4b07:b0:4d3:45a2:ae53 with SMTP id
 fc7-20020a0561224b0700b004d345a2ae53mr2160905vkb.16.1712234855386; Thu, 04
 Apr 2024 05:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328195457.225001-1-wedsonaf@gmail.com> <20240328195457.225001-3-wedsonaf@gmail.com>
In-Reply-To: <20240328195457.225001-3-wedsonaf@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Apr 2024 14:47:24 +0200
Message-ID: <CAH5fLgi9EUQ3Td2pxeiy9zz27sv8K-Q0dVJNk_c+Lyww+HtGRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: kernel: require `Send` for `Module` implementations
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 8:55=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> The thread that calls the module initialisation code when a module is
> loaded is not guaranteed [in fact, it is unlikely] to be the same one
> that calls the module cleanup code on module unload, therefore, `Module`
> implementations must be `Send` to account for them moving from one
> thread to another implicitly.
>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
