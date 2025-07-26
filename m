Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E5285CA6
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753548129; cv=none; b=Vd3ip0DBq920YzoekMPPFWklt4yZqNFrYMAhEB8N4zulfj0dK84FTlHbw/VRVJdzmLjNZw/f2yhnc0lmUI58nwCfmOqb2YRhhCXgJWMWiecEFP4aMcm4ZdHszgJcpA2Z546OTWb6EF9tZ5dtKRPf0WqgK2jRPgv8bEbzIJ55O+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753548129; c=relaxed/simple;
	bh=a1AO0aaJg6TA/fV1vLIlctD1Kmjg6P4VnJBJPvqtSQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iswLkgDgbkRJ6EMa7KiKGggNsj1m/0RBvIlmPUAAIyTrLKsmWap0sA4gJbN8g5yreZqz5fU/IoZGjOfetFJmsisvcKTOqpufa/usuUVP5adlW8LL2X5mI6O2ccj+M2u/FQdLmw/I68r7hU4q4RLkvLOUKHlA1fYJCSd6uDDCapk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xxUeAPAi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xxUeAPAi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b77b8750acso303293f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753548124; x=1754152924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVowoy9yXuuyjz9Y28xfyjUbBH8nqnAtp4z7aeOQXpE=;
        b=xxUeAPAiEEWr/ttMUFD760aYTxInzTtx+fcGeFHT45dBJR5tJX31sY2zHux9/hVwqE
         1mqsDngAAceZw+O5bltiBIIqPCT8AqfT0F+N1U0Wj9YQ+6cLzDod272Ofh0/JtmDIl8B
         Tk5Ig1MCHatBpimcZ8c4SQzoif/MQhoAV7fpsRmnxRn1IJoI1HrEUPeMGQHhb8bsoGwn
         iILDvbM//bBPyfZCYgFRE0ekqC8jF6yG+ob4QqdSK5hc0et7S/oJHPlRLZJvQsRJcgVF
         IzIk/AUb46vTiK/Sxj5kFJBFfP1loMGyp+d5XFC97Fixi9U7mX1GxCjXQqupNUP3i+/M
         GBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753548124; x=1754152924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVowoy9yXuuyjz9Y28xfyjUbBH8nqnAtp4z7aeOQXpE=;
        b=rCyKmhMC4VighzrdCpGzpyAsr3CO6x1pCVrbjUZY6LVis1rqWmpUxBd1PSR9xcQ91h
         cKeDI4Jt4NyvS1P5vDEisEHigl8XtqYzpYutHddqGKqH9OnDvRZawhMJwYvZV5jevXgd
         pGlq4NfKFp3Vi3JfljtolZC4v/uTFicfSlHtbyaj6Cwlzjm39H6mH9cKXbRujU+szxCZ
         oFR3zCzFoFxhV6WcYH9EswdaT9woLIya1AT6jxzhjCQOruncI/l/fNd473Aem79NazwZ
         p6fsRa7q7il5aXQNbw7XByzLSWh0fI/u4yhFUhvpao0Bwu/YhElHV6iF6tCsp0nFnu4X
         0fVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHDVU5JHCz37KhUlI+URGJxNKxC0lpydNl+xELV1R7+STTGC4jYmYZJZumIVQ/guQNEj25csarjuaNHtk2OA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZx2W74OXZ07cvprTWO8LNgnVPNyPkNc78Zrv9se2PJPSAahX
	VZnLanQI4aQzcKTJgVSB+Q4W+VQs5+QtgxtM53FnV9+ITuT2QMQukrjGu8yNJjvTwGpZFISYOeo
	b2vHNxIW3NQPsM++40gwXpgCZfuckke+KjrMPO2c7
X-Gm-Gg: ASbGnctt1PGdlrShqx5j7wC0xWhy9D8GxoWfEYEPeS1PCJxa1qu5jd6N+FSIlE1PruK
	mEk7Tb2MVAbkd5M04069f+BK0Oojt0ca6rOkvnJP58DT3aYshg5YNjqStCxECN8c7xxN2HIXfZ+
	bSq2/cRJbO7yasjtVCR/0Y7nXCJCli0X26MHgjmMs03q82+dTOIOEOK0Orzcgnn4FwmjnWmVMtx
	iC7ovUe
X-Google-Smtp-Source: AGHT+IHKtlVV1+6ax8KWh5Kp9Dj1RbPC7OFascTx/drEMtBpiZ7aEXwLkXXw7M9yya1yZA3wXzUXFkeg8MSM4MgMQ+I=
X-Received: by 2002:a5d:5f46:0:b0:3b5:f6f9:e803 with SMTP id
 ffacd0b85a97d-3b771356b1emr8410888f8f.14.1753548123995; Sat, 26 Jul 2025
 09:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726-maple-tree-v1-0-27a3da7cb8e5@google.com>
 <20250726-maple-tree-v1-1-27a3da7cb8e5@google.com> <aIUA_HFLXMYNxWDM@casper.infradead.org>
In-Reply-To: <aIUA_HFLXMYNxWDM@casper.infradead.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 26 Jul 2025 18:41:52 +0200
X-Gm-Features: Ac12FXyIP9paBBXsCG4P9QMFCVmav0Ib6KKVd8mim4mgY57RAzHx1WLjuMaq_mc
Message-ID: <CAH5fLghw=6VeXkJm29a0y6QX=--u27FT8erYxDceB8JyT4KTUA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: maple_tree: add MapleTree
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 6:23=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Sat, Jul 26, 2025 at 01:23:22PM +0000, Alice Ryhl wrote:
> > +struct ma_state rust_helper_MA_STATE(struct maple_tree *mt, unsigned l=
ong start, unsigned long end)
> > +{
> > +     MA_STATE(mas, mt, start, end);
> > +     return mas;
> > +}
>
> This seems very inefficient.  Returning a struct larger than two words
> (on x86 anyway) means that the compiler implements this as:
>
> void rust_helper_MA_STATE(struct ma_state *masp, ...)
> {
>         MA_STATE(mas, mt, start, end);
>         *masp =3D mas;
> }
>
> so that's about 72 bytes being memcpy'd per access to the maple tree.
> Sure, it's stack, so it's cache hot, but surely we can implement
> the equivalent of MA_STATE in Rust and see a significant performance
> win, at least on read operations.

Some of the methods go through the mtree_* functions that create the
MA_STATE on the C side, so this isn't always the case.

Regardless, we definitely can avoid this helper. It has the
consequence that if MA_STATE is changed in the future, then the Rust
version of the method must also be changed. I can add a comment to
that effect to the header file to remind people of that.

Alice
