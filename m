Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B6D422555
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432576; cv=pass; b=N+EerPREbrhtTrOtG6LuxCDLP2u3vRnOfsLSngawzNSb9BKUJGwlwGH09gutREQ1Gj860lsCvLW8ZXFR/vD7zQJb1E3agETN4jwZ5bSgIDmHyclrgo7BVZGKlno7uEbMu3KLLcwBAqzxmB5LirFlExF2ftrFvTHzITN4rkdKHbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432576; c=relaxed/simple;
	bh=nNxmK9/0e1DDLDiWJdtnZznbYGrC+zqRTQAuKd0PNlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zw1q5UPvEtL4BfYrT9TxicONMYDMRVT4e88JkaIL6O7jC5bRsYTuK/hNLwq7lyOpf8qGYs6EFnwbLX7iFEGge8MC6Ppl5C3oviV1w39x270yJ9oYahyR1RnsAoRmq/Qj1ehM8C+VT2IECXxz7BuRj83I6uEFAVE1Ado/dSJqlj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxih5OwS; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxih5OwS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso4268870f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783432573; cv=none;
        d=google.com; s=arc-20260327;
        b=VWnHSii1JhcqNaQkZrYuTykVZgGv0Mcs2WV40y63D2ZVnsZtNbb7G7baKrbtDKyXZF
         3eVw2K0a2wpfP2GrfUMvuOiYKR9+mO93f97ih/PZafD24DcJMgQHRwP66N0sH62iB/P6
         yBsOZPikk00KB0+lRQVQDTObIMcykPsx7i/uW1AtcVPnfa7asEKWvnMf8zq0vkTOscBJ
         qKsTq4QfXDp4oSSgIYzAKgPf0niRQULs/pL2kH4oaDBzJkEi9X57c2vi+9XkNbb6bqTw
         nazkjhqrEC+8fx4m0wfLPnKXNYaS0XJSSJRKZje35XQ8euXPSSc5laHWNlgEJjmBJr6I
         DagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nNxmK9/0e1DDLDiWJdtnZznbYGrC+zqRTQAuKd0PNlk=;
        fh=ZnrgkMdyLgcVvC+Hkl+bbVzBp7CDEnoFVgJU5ZxebzQ=;
        b=G8AzvZAt4s/e6JGMpB70O8xkUdmLBbsrMAzPpBTWPGHk0U5WGVED9EToXmamF/E2N1
         KZ3dGfT/fWEOeDbskDGvefyC+H6AbQuoCZ2mvFgyGYpJjVbWDH/ABGPtJ+gqocddXDpE
         Zxyao5A6QCHzUfkzUWJPB6UoNMYwia+ghhejZa2ip57oUcmQ5nZdRIQKNwzQsFgpE8Kv
         hMhyOOyN80EhTZ4OKsM3p4o0VY2XUlL/ZNqFyYMms/YoWxFTPywe+DmPHx35ST7/D0Am
         ZvxwYIiNaPDJY9BQsMwxy9xpyeobki4aHwBQI+FF/lU1A36gWV1si0LuEPtqqfUSEc/r
         FBPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783432573; x=1784037373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNxmK9/0e1DDLDiWJdtnZznbYGrC+zqRTQAuKd0PNlk=;
        b=fxih5OwS/HrI8IMvED9feGiG3CQFQxWrCeIbqZKdZyFQsmRmnBx8+NZZ40HcBRnw9H
         2Pgh0ZwoC2lfiij+g7xHB3/3wH7wuLUL3peWrqpSzWmlbY/as0xnAxXCTUHEySzY67Oi
         wfxdt++Ca26JBgx794eCzinjxN696/8XL6owclpix8Xzj330sMeO06rIIjhETRQs7LAd
         RwDB1smLBvPr8eXoEZRRICQMZDXxKwrC7rDPu0ancpFTgQMo8wdJkU7yCodLTf/3mqU2
         5UGPuRllAh7e8mDUoR31VlsXb1oT4VzuvvOC8JXgUqXQ5g+bPfOYW8M1UTI3ppJg/0QD
         gGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432573; x=1784037373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nNxmK9/0e1DDLDiWJdtnZznbYGrC+zqRTQAuKd0PNlk=;
        b=i5rFL925gTbbXETIpubAePkvfzq7IhwVXKlBDZ/TqnKA1t/mofFW2paObyr5c8DKDS
         9/dBKFh27FoYox6MhclxE5YkxgVeE/p0gHfpGOzsmItCcUyQI7DiUxmgSjubrt9JfX88
         bLvNv5tYyBB2QAM8WogTBg0MSNi99q1W+Znt1PbCulYNV/G/9wQr1CnLD6bixa//ZXK5
         PcxNbj3JPMvsTlmZIqrAbwcXJ6PuD9S3P5nRkP7KGUs2uq4S1OZW2FGvai3D+u2bb8wY
         fHSgc6rV9d8PEIoy3X7RC5EF8q8EIVK242PACzsNmYig2zqsZcA66ZNdfx6LRuETixnf
         oZDg==
X-Forwarded-Encrypted: i=1; AHgh+RoRZSicoFyKF2sPd0YfCb92LQ3cVau+GW4k0dR12JrcLljI6ooGxRbuZ1UbZbnbxPidGLmAmNV/ieEBNW4bzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7ChVdohVGi78lR6V7qU5DbKoBWvv/qCKGqbofD2kx/hLmwUW
	AQEpu9kYVG/Dmzyeh9zOXC8DjxkeTGxZgfxmDk+HVZi/nEPcq4gw519Ed4GOuKMp6LSDSrBqaOl
	Rea0adxKpH+s6oUEUvQqFm2cDS9dfzPTghw8ou9VK
X-Gm-Gg: AfdE7ck3rixOIY9llQ5mxd6aWqPA7DB3i2Oqcrl1WeSQZrzAHmFS9tD33H6MIsG8wDy
	qA4b8h/l56+CBItI+Ohjh+4LuclDOaCC8L+xKCIQfgZxPQCgI4IPQcQEFF6jQdjQ8xNHM7Wbt+E
	qcmIe6ccy+oZFYj0DYVp+sBwEgavIXaAv9igl9HKvFZKmJ76LOD9T/NyknHLh33Uro9ak4qTfsc
	5ZjNSFWoZtVIuUZ+aiLI6J7Asr18BKt9hZAMghAKhjppdjW2ZhVjleC2SHcplAcobCoOIdYoQHs
	IJmok7MTVUzXpycgL8CVEMsK/xlSgGL2um1N6w==
X-Received: by 2002:adf:f290:0:b0:477:2e75:522c with SMTP id
 ffacd0b85a97d-47de66cdccdmr4577090f8f.28.1783432572316; Tue, 07 Jul 2026
 06:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-1-84fe8259e46e@nvidia.com>
In-Reply-To: <20260703-chid-v1-1-84fe8259e46e@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 15:55:59 +0200
X-Gm-Features: AVVi8CdHfosGlUDJEhRFxdK1GHnnIUmv0dXkgaoEgKtaKne6Vk4-CO1ueEwiEf4
Message-ID: <CAH5fLgh1Gh0ypT3R9E1NrDHXha5G-BJJdTzGxz240QJ0inZ5wg@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: bitmap: use function-level cfg on kunit test
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 12:19=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Since commit c652dc44192d ("rust: kunit: allow `cfg` on `test`s"),
> we no longer need this workaround.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
