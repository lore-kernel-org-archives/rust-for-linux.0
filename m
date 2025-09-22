Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102B12FF69
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758575851; cv=none; b=IjbEm00xKfBtk23dPn/nZH7q9EuNyXoDZgGUav+OilPJcETgPMDsvSs6GYhD1gnyKr2tEeK6qDcpIThGoinI7bATZKk8ItMQmywqvydn5MouYOwnlY1UFM+N57C4AeeSWuSkWE30TfF7UAcpzhRksZaXcIsQNhD+w7CG28PvTjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758575851; c=relaxed/simple;
	bh=YE/XuXjyf9kdCciU/Gc9Y0YeKwBw/w4DEAQJaIFnGA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9ov1JYroQeaT2yQe49WUbWvxSngBURUTmiemQgVhjTazaa+czZTiVYJ4FHsaQFXyFDnFbi12vx2nVeULnvGAWEUsJT350SvNc90dk164osIYVhLBYZR6tWZCiH4IzEyPBGHXNENw6uEhxvQwiCKJ+QAXTRhZziZH31NsCve2vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xBKF3G3r; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xBKF3G3r"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so3419176f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Sep 2025 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758575848; x=1759180648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE/XuXjyf9kdCciU/Gc9Y0YeKwBw/w4DEAQJaIFnGA4=;
        b=xBKF3G3r7C37nIw7ZfPZO8i3Zk2pO3WXkg0dzxoTy5A5UVCWy/OwhaZ0VlECsHib7k
         CaSMpG4MDsIEajwVgIquSsFcuqU0VyCAB9fP3yWqSdI9GYyBuCDasO0bvBydaulsOnYn
         GSABfQ3mRVCGuFWLIANbt6mUQlPVaxncCyC5RN0pN/XyNhlQhhXbXPtQjHg7Tz6s0lwJ
         GF2CyaSQ68h6pFZ4ZQsT0blom9o1MmhSSnmRHV+Q9iwgbUPOMJrtHNloP7Q9vX3JS2Rz
         +kw99eue7/NfGbwbzVzPjeXRCREHLdU0iQrlm9CKlHxyaXr61iBTLMUs4gUPTZrmxzzT
         RvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758575848; x=1759180648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YE/XuXjyf9kdCciU/Gc9Y0YeKwBw/w4DEAQJaIFnGA4=;
        b=dllzQi78hbHZ3hHun3z7/HneHrGAnQkuSTuI1r2kiwyfxCWzCA15SOMFQyDxlc620D
         iDp+MzXXnvaIaNmh2eTkujvzfYbKgJOBfZXeXdqJOC18HawW8QEKtQA9pPG9pO12BwwM
         wFOiq6Xa9XihSzuwXSEPOPgWHCndzMygqsX/ufOkKfXylWqbC57bUepzWkaIN01z5aeH
         rBf9NujbP2kPCmizDkEsK+kSgwoKpc46zGCNkgyGs8nzg4DJmgCbcZxyceH/mSFrNn1p
         aYiLp85q4tiUnUzM3L6cXHbsoiGEQTlA14bm0dQJLvdaoLzhtnRRDC3hyx+/py2QE9UT
         juFg==
X-Gm-Message-State: AOJu0YzEjSi3syjuCRRHwCy5pS9q3i0LZMI5Ae2/m0jH/4jlGRW8rdlt
	dShhRW5ZNBnF5XjTBIi5xarKj1LK6RS7fyX0+kmXgU7NFHZkX9qTu8AYaYwMpW91wP8+erjtTV7
	/PKycku8KZJhpaApFYqvrkw8dkrtV0zTlSarF7XlM
X-Gm-Gg: ASbGnctUGaEBuNg0AKdn+1+RLqGhy2wKG4GdcC8brW6VLVvcyOv4aLKZQM0ez0unj7X
	22sKN0QtLMKLmxcXWPrxkzX9YJQU9mrR9tLKe3G4eO9YNUTumj9rHv17FYgLPg+u1wD4zAt1Sqo
	skkuhHIhUe10M+ZoH55Vgp8kN0GTctKcuVsOLXPyUpViVXCWhfEeps56yE5rD6Yqs5y1hUZM8/5
	CCAp+w=
X-Google-Smtp-Source: AGHT+IGFfQDiOiOTcseY76dFEJwdeLwzzEeu9kFerU+3PuuH69Q0zrP1RtnqvJHFmMg62gFwa5AM12ocDwpkjSDDnfs=
X-Received: by 2002:a05:600c:1d0d:b0:45b:8b3e:9f66 with SMTP id
 5b1f17b1804b1-46e1d98bfb7mr2416355e9.13.1758575848204; Mon, 22 Sep 2025
 14:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909065937.3433134-1-vitaly.wool@konsulko.se> <9b287ca0-fe1a-46c1-9510-03871326aecb@konsulko.se>
In-Reply-To: <9b287ca0-fe1a-46c1-9510-03871326aecb@konsulko.se>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Sep 2025 23:17:14 +0200
X-Gm-Features: AS18NWAGBsnmu6IQaC1BSV9I2a1X8mM7h6QAPAtyHzicwwtixR6PIYOvITz2G04
Message-ID: <CAH5fLgitaTFEhSMm3mZrinsjTktvqLFg6m_JyMxMAd0JzsLtHA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: rbtree: add immutable cursor
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-kernel@vger.kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 2:13=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.s=
e> wrote:
>
>
>
> On 9/9/25 08:59, Vitaly Wool wrote:
> > Sometimes we may need to iterate over, or find an element in a read
> > only (or read mostly) red-black tree, and in that case we don't need a
> > mutable reference to the tree, which we'll however have to take to be
> > able to use the current (mutable) cursor implementation.
> >
> > This patch adds a simple immutable cursor implementation to RBTree,
> > which enables us to use an immutable tree reference. The existing
> > (fully featured) cursor implementation is renamed to CursorMut,
> > while retaining its functionality.
> >
> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>
> I don't think I've got any feedback on this one, is there anything else
> that needs to be addressed or is this one good to go?

I would like to look, but I'm still tied up in my second consecutive confer=
ence.

Alice
