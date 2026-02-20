Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B04C32D7C7
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 18:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771613485; cv=pass; b=PmKAAHZjBaz3bKKPTXLCK7NvkbKmL9hEqo1Pm5P3EvPjVL60B6p3iglVy1y/hNoOphmG5wE1ASb1UdWFXJzBc2KbyvMaVfqYmvjkc8l5sH3Qpo3vQhzDhMSJH9Ng/HKVcqzlhqozaAZzGm4DIgjm8OY1/hTKzJtm5ejiJQcQrw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771613485; c=relaxed/simple;
	bh=jocf8kRP02HJOV2vIvrRT060PR4Nt9RL43jf255c428=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/0FrU6Olkwte6f6N/4v5wJoP3sC7c27LuLhgHbB3V2E0nI47/p7DTGZSwPDQoHH68kzzWXdvyQoO4Y0Zva1MMMWUkSe/RuQ5nzI/x5Xz86r6LDQwYYX+ejkQHf78KHBwjosCCuNVGEj7uAKh4k4tynGJ1YfNgoU0n0KrCmJh3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHEgrzZs; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHEgrzZs"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1275750cfadso236597c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 10:51:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771613484; cv=none;
        d=google.com; s=arc-20240605;
        b=gOLd/atWozRxWgYOYe6yBBYUyKyG82NWeLMcWgVKNYMty9i+VGE43NxV8rTJdXhZ1W
         o+xZSakiS1o+BRHc5Vn3jr7rsXVZmyaUL55HkT607voIgSDoJ8su4t1n3cxki+htYucW
         2TknA4LzrdGA3BRD6B81OHbfCHZXIhkil/epGIprVWZjVJywtuUmo/aNUZs5MsOcQdCp
         t4c5c57q+47d++Zu5osrhe7Ii0CDFwsAqpRmLSOgoPSNn+aHPLBFT4aQMpg/MUg71ZU5
         +RZuXxLZdj9ykCKB17a4wcu4OiY3ol9Mqm2YmbjAuJncytda0wMKRnYh/TE98cLQO7Rs
         JGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jocf8kRP02HJOV2vIvrRT060PR4Nt9RL43jf255c428=;
        fh=tIqpcgA65siZwEwmSr6a2Z/b4XwJ0WdeZ3D3wbba2GI=;
        b=G4BmYNgfErFnY8E0fikM4Pek/HlhAQql5vnojfqfsRJrtI6l7yCCliLWzEltXShEEJ
         0n38XHzFCaT8LucB0MErEZ8GTMjnlozfid1Twlyj/rPS2T84NdWJVYLUCVMjIe7kud+F
         tG4Dy9xPZOzDspwR0arr6HkP+weaDUOOumoDDEbToZBysmupuER7mKBaXMXGE0tcxdhG
         K81GHt92SAL2WRujSxoM8/0oXAGFzOdh7ZRbolrZErr/t5skWoSkpxir45myjobj6f/u
         Ud3kUi2qnAxu8RkzlwYkc5ymS7JAoFrS5r/L30EPFtotnw4qdqtPuTlvlEMy8aQhlV7V
         nVkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771613484; x=1772218284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jocf8kRP02HJOV2vIvrRT060PR4Nt9RL43jf255c428=;
        b=iHEgrzZsWZM2SlhkCpQKDOLZbDpWFVlaCuMcVi2A7zlhfS1G7E+WoZlCu685+wLCit
         BmxfcbIQXCqHe4ookW3YBb1mLmc22FVZpzKQ2Ifo6ogc+s/eVJsIJcqbDWFCaZWcM7Qn
         0ASE9P6fuYQle5XhMYVYYv/b5eqrVyzIrm38Y4Pl7MYGHCuyMOIfcGw85HeDz+keb+FS
         /K/gZJ9pbIciTrI1415gRTqduaVrklOITmWuOAMJKhwWctBxmdIpAb7gPC4ZSStSbLY7
         O7oMPU7m4L5wdhErbjd16cBrup4OTnx1fH1GV7i8LTfMqTxCdRxiGxpmkKjO1UG4wjkd
         WLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771613484; x=1772218284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jocf8kRP02HJOV2vIvrRT060PR4Nt9RL43jf255c428=;
        b=JxJ1/MVtn8+o2HrworqB6oh6l7INRFYDWdHsS65akAfxXwu6f6HFqYmQbBRiQpqETX
         xhRaa/nKFY9lx6uuwUI1FkoCM923yhY1E46jBxxAhpq14LHBTVrPVXexmKSxSlUrDbDN
         dedtFwFRFnSmQ0yfzfILz+0slRMY404I+8vz7UKuqXsMY+WhK2yQJskelF0Pr7dGIfxr
         cITRuhanEWHfKag59H47SjhA4QA+406GGTflFn752KFdWBbz/zFnTAzqdU04MhQOynOp
         0Mngyeyf0FASy95x/eo5U36sXcZq72mloI37vcg/3IE4uy+ISmJXmGGVFipe3+mIR1uw
         dfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfZVUP6qJiAFHWkPcYQnwbvBjSzKdz2HtxJchtuFGADWOcTuroJjubKhtgrlt7FH3dLGUN3ZWgYxj8RE0RFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4fx+66VsUnLelzmqIO30x2YFM9O5eqyUD3fFU+v3cKf1lmI6
	vtZjdEvF2tOdFRjmp+x54MzHGEerPkrSNfFj6fsxZtQl2ZQHbygqQ3AdDxsh3OntZLdEji3cG6T
	zOb3vTB66ybWtY06WyKl79UxTgtZVCN8=
X-Gm-Gg: AZuq6aLUYZ/g9EXhDIffDyP/qUDh0SL8r3aprSOzIPGvijgebXbc+llRwaCUIPmvxZX
	3jTSzqT6EtTNU7LAaGXPAQbXE+WgQzn0jQm/QQWpNKAxutA51NFRWoiC/otsz5aV502OZnzIJlz
	lqqKvCCR0DhMs6DfOu1pamG3yIWFttFnUmgVI8oOz77GzyIr0Dz44L6UC5NIz/OVwLB4/6QwawQ
	RC9yprla8NYuGJX1IGpEK+I9pzeJNh7L3PbgTzijNmTu9n081OVt56abuNxzr6QNVqAh9A/KInM
	VPgZRZJ/o/9tFULfsHVpB3UX+Z+/Ews8fk+RMuNK6V7HVBTu205UeZZGmC6qbITFdzkI0Ch5He8
	wrDlATdnTBSntmuHCaaRwoFrM
X-Received: by 2002:a05:7300:cc0b:b0:2b7:24a1:865d with SMTP id
 5a478bee46e88-2bd7bd59ff2mr181135eec.3.1771613483585; Fri, 20 Feb 2026
 10:51:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
 <20260220-atomic-sub-v3-3-e63cbed1d2aa@kernel.org> <aZg1aSHfrvZPaao0@google.com>
In-Reply-To: <aZg1aSHfrvZPaao0@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Feb 2026 19:51:11 +0100
X-Gm-Features: AaiRm505LmtgjgPSHAChyEoD0PJO-ooXr_TzxKbgy-tSdnAjTDU3I-4pcHCRiM4
Message-ID: <CANiq72k=_M-MOuvp4ZT4-Uhb3VJ0STonoRyvE_4psFrwPHMJCA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] rust: atomic: update a safety comment in impl of `fetch_add`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 11:20=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Because I doubt `as_ptr()` documents these things explicitly. (To be
> clear, I don't think as_ptr() needs to do so - that'd be really
> verbose.)

It documents them, which is why I suggested it.

Cheers,
Miguel
