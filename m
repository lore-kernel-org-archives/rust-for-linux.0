Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0691D7E5B
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396351; cv=none; b=JSYJjYcUl4J9QOkjeC1BfeDA8afyqFiLv6SzLfUgWxFqb9nTcn7tBE/VLeWO7Hp7guQUFKCF7iI3OAAqxX0D+ez/OZ2NhqwYqJDlardHp4O/RVWG8Em7Y5aTOj2y+m1KCUng6tYsKnQ/Di5XUcL6LodunNeGmTLpftvU6IsjR1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396351; c=relaxed/simple;
	bh=t/qKpjIAvvMGRq9pYhkXLitOWo4jaQH0UbUxON5HLm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcS74+mcpt/F72cVL46Rzh9ZfKyJf+qj52hawOw+XnMrhtiaKs2Thu2r4l2RRIqn8oc2lKbvETTtF2WUgUrjBzS8UkK2DniLCa7WyAhv7pzgNEs9PV+H5n4DF5RDO7kOkkufHWSSwZX0LsWarV7aN6taj/eB+eeOrhMtl96AGu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qwdIEYFP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qwdIEYFP"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b79bd3b1f7so3016481f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Aug 2025 05:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754396348; x=1755001148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/qKpjIAvvMGRq9pYhkXLitOWo4jaQH0UbUxON5HLm8=;
        b=qwdIEYFPzCGKwncrqSMG+zZtxvsXm8ImXA2u0z9MSR5/LYr8+7gE7Ne0f5rEbSHEQ4
         LDjHKObCRXyfU5AqI5Si4LQuyB1WzIPa866MVLxcyC/xOpO2MqgsowJaLCSw+7fdJjV4
         V46x9cMVi4d1mxVcVa2tvyJYI5yRFIwIVDBuwxNadW4t1e0Hv+mpICUiZaPbVOcN3qqn
         gwfayjwixPbciA3nSQy07Z8qxPCwV91IiIrgklHXdULkqXrg+8jQIGQZHYBNcbcdcleo
         nwfthKXGR5v61M9mzNKFe4cxnK01v+49BU0ECZ1QS+wVzr1eugqXXpGqJrHX9jZSC1+X
         dhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396348; x=1755001148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/qKpjIAvvMGRq9pYhkXLitOWo4jaQH0UbUxON5HLm8=;
        b=BcUVQh9GdzE0vXflRZvsYhj3xECZpBdbKFgZegqBFY1rgvZDsXCVpsgmwAvjJU3JcY
         co6tUUuDaG4FNbUmdcDnwIeP4zvVuti9AO3iKtbKZaBEFxmiIzMeyCAgakYVcaIkk4N3
         Kjc6Ijne0Bl1whN4OTkrGegNc7hgjXTVEuvLZ7GKH+XmMZMSxfoqEtc5uIFFjLWNYtwL
         ZU1EYSFtTCNVAIQiQkWo58x7vVO3R5y9sjZdRkEs/immEryLCpSrofo9BfWwaGEbCeei
         kLEbBffn97cCBycPhPcIJW+Zhys+9sPhYtL959YL4coQCxXcRVsLHlJ6duwvpelD8SSj
         JNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmI7gPT18cc6QTpx1TelI3I7BRY2bSpFL27HXMixXqTTXvrqiX/1ZACyHFg/VAdfBZqROBzz27dpGI8YglQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoTnas+DV3VVIb5/fpvpGXOYFAikK4xtS9UwJWyxwPtbD70pQL
	ABtwV78qWC/bNXbGQmruXIe8alm9QgPPFJfMsLaRo+LK62Xpb/pRITjlxbk6UuxJg3A+OAvVOxZ
	dLNZGUyiULVKAyGcnydJ8MaeLaMYE95cGJe+XBLv8
X-Gm-Gg: ASbGnctXpTla5RFsV7OA4y6NoQcUtG1azmabyobETvOFwl+Mc4f9nKqyqxughJ2PlrY
	AHM2XUVmFSLeRiNDhQdys7PMUOOT6m+Aw4nZvJqy6EBWKi4Y8z44Sm+SDPopnjpcRmkhdkzdLAv
	88R0o/M2dqCWxt3eEpYxZVhV03wyes2MqVKPPaOc60y4BxDuh1Hvi3Qy322Yfa1VNbvh3+zM2x2
	ajYCno6IG+LdUOI8IN0Y0XdCKHMuiU96BOVPx+36sadj2Zh
X-Google-Smtp-Source: AGHT+IGFJyr2bvCKL0LcZXTnjp71w3hl/uA1oCRVfVMx88ozfweGzE2gTInt6v71qLmVakanSGYXCFivKxkcckVWOJU=
X-Received: by 2002:a5d:588b:0:b0:3b7:9a3f:29a9 with SMTP id
 ffacd0b85a97d-3b8d94b6fabmr10867848f8f.31.1754396347899; Tue, 05 Aug 2025
 05:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804195023.150399-1-dakr@kernel.org>
In-Reply-To: <20250804195023.150399-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 5 Aug 2025 14:18:56 +0200
X-Gm-Features: Ac12FXzc7nb7nei-minV-AFt5DULm16fyw8gDEi4A3coIX-rZY_d47u0RJluT08
Message-ID: <CAH5fLgj6fFrY3Vdi5VvFShGTgk1y=RAm3LCzi3DAk8a9o9K9Hw@mail.gmail.com>
Subject: Re: [PATCH] rust: page: implement BorrowedPage
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 9:50=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, a Page always owns the underlying struct page.
>
> However, sometimes a struct page may be owned by some other entity, e.g.
> a vmalloc allocation.
>
> Hence, introduce BorrowedPage to support such cases, until the Ownable
> solution lands.
>
> This is required by the scatterlist abstractions.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>
