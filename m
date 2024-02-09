Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A07376F3
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707484004; cv=none; b=VlSkmc26ZFm4epLj+hVM58iaFdohZapUj++2yKPgfKxkA/X9yP1o1PHAG4KyeVT2vh0tufUaQbOfl7OrPqL1vmOr0a7oHmMg5z/DtZTgAtTBBpPE/rBa7Mk7SosY/T3nZqmKD7EsgyqWyxkwDi2/IPM8bFWgCWlE+f46gyMBmvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707484004; c=relaxed/simple;
	bh=PiyOPK6H5hKFq9MEvHKb1PtlMoTnfyodXrOPwEEtby0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvfxpoqZ5aNL2tIW7IRMkGQBn2aByG6PJQ1rBiJA9nChyl23Sx1vEN3s0RPfLJuPyOl3/cWIZ5/f6gkCKjdljAz+2hcuFZFzj2T1di9pCvmuvzuykZ6gDgH1bFwyJGKVsaLIL42GIkpvSM+AKGL/xOo+yQ/5ZaEisf1pHiOn5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lwzTvJve; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lwzTvJve"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-783fa618997so59700785a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 05:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707484002; x=1708088802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiyOPK6H5hKFq9MEvHKb1PtlMoTnfyodXrOPwEEtby0=;
        b=lwzTvJve3bzjSA0iX3NanIgmosVscSZ/YQlWtRvds8oMlooaIrm56hDEzoKP9KZzKX
         /yiqvxElHfx6HUbCQTj3HGGj6o3evunZhVulpK/9SwPKUWv/J/g5WDXiLv9VVz4Fvnud
         Rfavrpalmjwevj0dJh4eOOjwfiV58uyyL/8Kxkz9wAQ+/pGxCp8Ok0c6hzTIeTAH/yOw
         P9wtjuBLrh3YgseuXB73BprHGk/Tl6Tt8TAy/woTgCBz+MjnXEbQBPmppAhQKezj1Ryk
         RnPAWPnUlDp34roJ70GUBScrm0xct2/R8MtL+SK1L4dR2dUCC3l1tEqFPTJyrvwpMfSQ
         ZJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707484002; x=1708088802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiyOPK6H5hKFq9MEvHKb1PtlMoTnfyodXrOPwEEtby0=;
        b=xHyNh9XYCRtR4+MXSA+p0DT306CWOZaWWAknQrd4K34ZX5o0PlTYWhtcp8g8XmZ3mg
         /StZpn0rOdXCYPnAEuFCm+zn2JgnxlfSr1ZIt0+2bEBlseTGSkcTfrY64Ko6yQ3wsH+e
         2xekIz8XhfpzqWyH+DK09f+a2MhoKrXczgRNkRP3ijKzykr0t/Sdb85eia370YvIMjJs
         +pAHD+F6iB8wmqJwej5+Y/+EzwYlij7Ve0qp0Ex2i9HLGQdAX7KS9xB6H+rAEJnXQ/0Q
         eHm0/Zzw+Tq17/jllx5FkwSrJH1Nvrc7fOrOwnjvgZfra8McgaEVL4G1st6vG6ppXeLB
         vdzw==
X-Forwarded-Encrypted: i=1; AJvYcCW1KpYUV4JjUh+tQpsoqSze2BeRdf3Ff/Q/HQDtddEop5mO3JNZHi2CLogsKchpy0OeEyis0anyq6Ux9YrSQGxPz0KkfqhZPx5aK7owuFY=
X-Gm-Message-State: AOJu0YzQIsdMqJHD8PcApG0mzEjt/D+KuN+NMAaxqcEssM/l2qVmatDC
	1r3K/A24DSGMe7y1xugx6QI6PYyLFRTQID6Dxz9xk1WQeTjag41F8k9hohQgP/nZLwOtkV31waf
	tPO6sr3kYtA8i3i8RKlaQaJ5ZU2L1VVHmyqq9
X-Google-Smtp-Source: AGHT+IGOZffDviFPTdJ9PGBYfjKfh5qLieci1lHx/dX5DKWYVLVqhZMYrEu2/NJDAfHsfwy0dMyBGMlYd46duos/VvM=
X-Received: by 2002:a05:6214:4105:b0:686:a185:dc11 with SMTP id
 kc5-20020a056214410500b00686a185dc11mr1704783qvb.55.1707484001900; Fri, 09
 Feb 2024 05:06:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205-b4-rbtree-v1-0-995e3eee38c0@google.com> <20240205-b4-rbtree-v1-4-995e3eee38c0@google.com>
In-Reply-To: <20240205-b4-rbtree-v1-4-995e3eee38c0@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Feb 2024 14:06:29 +0100
Message-ID: <CAH5fLggj7jTirZZg6AdwOYESXtxsffZohmBTdDkO7HT2NPxerg@mail.gmail.com>
Subject: Re: [PATCH 4/6] rust: rbtree: add `RBTreeIteratorMut`
To: mattgilbride@google.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>, Rob Landley <rob@landley.net>, 
	Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matt Gilbride <mattgilbride@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 4:50=E2=80=AFPM <mattgilbride@google.com> wrote:
>
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>
> Add mutable Iterator implementation (`RBTreeIteratorMut`) for `RBTree`,
> allowing iteration over (key, value) pairs in key order. Only values are
> mutable, as mutating keys implies modifying a node's position in the tree=
.
>
> Mutable iteration is used by the binder driver during shutdown to
> clean up the tree maintained by the "range allocator" [1].
>
> Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-6-08=
ba9197f637@google.com/ [1]
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Matt Gilbride <mattgilbride@gmail.com>

I have looked at these bindings many times over the past year. They
look good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

These abstractions have been very heavily exercised by the Rust Binder
driver.

Tested-by: Alice Ryhl <aliceryhl@google.com>
