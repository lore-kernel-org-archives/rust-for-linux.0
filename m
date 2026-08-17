Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DEB38399D
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787002585; cv=pass; b=TeplJAdhCaUR712cfuT4F69SDRFe3xMov+71l5UcnepKdAXNPjss4gmK+6hk0hevhrJANO8WtJwSa2PGADJJSL25rFLeklZ6rVHTnnnKZaqBeBSHfTSZqrOSMR+rQAHVxxyp17jmzbCHOgJnwUZ6miM1ZPIe2VvpWdPDjSXQBRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787002585; c=relaxed/simple;
	bh=7Y68zBPMs4znH9swRVTxBCKPvlMjSod2fiik0Befd3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7U7LLf5rP8W8Gq0rpcrZtclGajfej8hMXnqwpAoXV9SQgbNFVdaMcoc5zsw5uB6kZg3tIuqyk/zyv9inehEaMzUQ2B+zdD8MRvPHLGZG6viqJ5mMufVfEdo+52qlQvGMfB8KgZx9BrqQhEiQApTscZ1wWhv3Ip5r9XTgdGzvWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTyD0Q9/; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTyD0Q9/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so52257265ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 14:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787002583; cv=none;
        d=google.com; s=arc-20260327;
        b=WYstjBtXdeTC1ILnTDdlhk5MD0XKVsYOZVgQc4S+v9YsM3lv95vqN7v0IAkF6gUfdB
         5p0+u5SaZZETs2rBEEOD4kNRvmJIPn750zB1GbvKQ0Wq9AAQVRY0EMCfL/jxgw1dIpvB
         2EhPL/ltVGrrQXyhHR4qhVUBO1O4nuSvWYAjrrLcZbZ7N1/rabD93Ih0IunhhcZoe7hO
         eEwnGwCTVGq+tDUIHMPRZ4wDc79CC6bGw9rTy2cf9z/Wj53OASsD4NMA7/RKvnu0CATw
         DwqF3D2cmSnScPaZWCMjUgCr8G2y4BdV+gY7L+2WEWnPk0I5vECD37bLCEjr4/cUovEI
         ZVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Y68zBPMs4znH9swRVTxBCKPvlMjSod2fiik0Befd3E=;
        fh=OCiy7CGi46W1MIkZ+yqSDuwlTdBubQzy8MWyFeta4ik=;
        b=Y3IbMGUxwT6LQouc6syTVXiHrvNicb7lS7uaDwgjqUH4KsThNDBxs3MqxyDuo9HkHB
         nOjnG0+1+rdwW8uOXkBKfPJwaGwpnCqIyr60tiNKeveXYSzcNO3mYlz7ci+ZssyrAFEl
         UBDHjzbjlIIQE8u8TfcfdLp6hjyAc4prVsTfcAfsl84B4glTEyneS44J/XIwWypvab/q
         y5y89RwUHzmEBsbtamTYIDlmWOMQ2SGbyt34fWAPpvHQ53l0VcVM9LhhwQGA6kBiyUod
         AqzAW9URPIqs/m10I8DrqMYMaQLCOHo6lvRm5hDJzmY8D/m3E0nP25GUmn+QK5jB4pX3
         Ssig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787002583; x=1787607383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Y68zBPMs4znH9swRVTxBCKPvlMjSod2fiik0Befd3E=;
        b=JTyD0Q9/6GhrA46PI6QrIaesswTuEQ8d7tqTDqGp/CTWgGCpuuQc1QwDv9hMM97z6e
         xUo1FgXyPtdzF4Y2HahKPmji+N4bJAteUhgNSCMb4w4ANE6IgLTNsHusPAbPZd8dPX2r
         4Bjn4aqnjueYCwzmD/SZNGJtmxdc24vLt8IbIUe4PHqi2SZ9OZqfi500sx1a+5xr9m6A
         iNV2xN1CqagyYoYmxdTCz1dKgL7z7VWEdbgi4CMt14THVmOsK0AZLYF+DwLtdlK7Vyvz
         4vQ43Ebbax1zpiRsyoDCMb/KsvqxrFZPNFkAZpurfUyn80u9nfklkJwqj4CEJbb9iIHT
         GPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787002583; x=1787607383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Y68zBPMs4znH9swRVTxBCKPvlMjSod2fiik0Befd3E=;
        b=eZnuT7TwEiBcQSPeNWBgeOrp8THjeNuaPfK4knNHHcIsR8sMHfTlRRR4zRoOCfHJa/
         Hnmq4zuKt1DZ4LAp72fKQwxVukKhYWZKsUuZSKBw6S88whpKuARoqWOrD6Bbt9hyTgKC
         ufSoBPhZ9+o6lgJWZA9Y5Dex3sShVVqQdV9yNdGslJkffprMQPXPnvhg30sN8dPfGUGY
         NQHYUSjeLb3ff1gWFkKGywxEa5AtEyzgHaKQFZ8ofTWCJixEz5rweClEvDIuGwZl4CHs
         dklzWF6s7Z2D923s9OLdYGHoy9wpb1nltMkl3yaaCHNX7KSnLEZhosx+WOFsP5cS+o/H
         jmMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcDGxsIUbbL92rqjzl2fZpXjZK1J/lRyTBDRciL4mxPaFFE5NKhJCEkTy5+gh9ADHP2+vcpAW6pcrx+f08KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSUPevM+j/d/nBZyTYfFStw8B6i5wUSrVpZilJsWSE+O/kaD2u
	wYStvcpLiIGWDFkYu1DLBh0f08EXle2dqDT1k3Qr93rfg+ufFg8ZZnF7UPr/iRDOtKXdQFmijCj
	42iSVXQ2mxcSompb/s5BT8Kj9Vn5at0A=
X-Gm-Gg: AR+sD10h2bBd0EnsM8tVV8LfUkaz8rUg7MDedvXyyXv2oKuO+efNf1ZUIkZJNLnfV82
	nAVnf6pj9JjZeMKeKT1e2OhVN1CzMzeAhXoSnr5L4HBgwRjLxBw7BFlgcu3eqLtxN3c9+kPXPv0
	kTusu1lgCWzqgi2Mp/+9qZRpiuL3cefXZkrfq0wwqE85m5bc+9YyxKxDGKuh5oYWgbu32lQ4TBQ
	Ug36IeJARR3ls03sJf0GACWVLrr7n0tZv/r+CeytyTXwPZ0+Q6ITxzY/VPdTc7q2/h6JMnQbfwN
	TEQOd/CWl2aNxmPE/3s8ucdB+KcmKesGknKeKFtJ0SiMqy3MWrKxHAq8XVVWHnIT69hTcH3Sx1a
	RupxJvq2mg2FXhYgBRn+DsbbDbi9dPGJsS9K3gGHc
X-Received: by 2002:a17:902:e54c:b0:2ca:329:3da1 with SMTP id
 d9443c01a7336-2d3b0f3e8b7mr293499905ad.16.1787002583324; Mon, 17 Aug 2026
 14:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812-chid-v5-0-6c767770b3f4@nvidia.com> <20260812-chid-v5-5-6c767770b3f4@nvidia.com>
 <anzxKO0X1OrNRD32@yury> <DKNN2LHZXRIH.5LUX95CZ8EA7@nvidia.com>
 <an4NvQBt3389jP6E@yury> <DKO414SNC0B2.248FUBGJGSPLU@kernel.org>
 <an4xDp29VX8Am0uR@yury> <DKOAY7J1IFTP.DMKSXK625EW5@nvidia.com>
 <DKOECWHEEAK1.3N3JXH9MH7Q58@nvidia.com> <an7bG2bEd28AbNRr@yury>
 <an8r4VECQ8iFP8ze@yury> <DKR0ZNGYW9IT.37N7TEN97GG3N@nvidia.com>
 <DKR5W5DGAWAJ.38LHLLNPO9R4W@garyguo.net> <DKR6EB8OWPXG.2QYAY81UG1RF3@kernel.org>
 <DKR724N9V3Z8.1HJP6NJC5A4ZK@nvidia.com> <DKR7N2LLIQZH.25F7VF4CET6PO@kernel.org>
 <DKR8MCRB76L2.1TV4D7261PVTH@garyguo.net> <DKRA0IU4WVW1.3AOKCY38VHTKZ@kernel.org>
In-Reply-To: <DKRA0IU4WVW1.3AOKCY38VHTKZ@kernel.org>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 23:36:10 +0200
X-Gm-Features: AcwNN1XmXhLOponMxlBCxSPGSKMVYcO46R_BeY41tQkqF8gOc9dMzRGpz2Bx5zg
Message-ID: <CABwQupNA=NuctKz0FRaJsWowf+=24C_o7u8twFFeUZ+dq6u+Jw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add ChannelIdPool
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Eliot Courtney <ecourtney@nvidia.com>, 
	Yury Norov <ynorov@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 4:08=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Aug 17, 2026 at 3:02 PM CEST, Gary Guo wrote:
> > Now, with `NonZero` or `Bounded`, we are doing none of that. The only t=
hing here
> > is that there is a range restriction. Other than the value restriction
> > themselves, they carry no other semantic meanings. How you interpret th=
ese types
> > still fully depend on the API that accepts them. Therefore, it is very =
common
> > that you'd be using these with literals, and it becomes an ergnomic pai=
n.
>
> I agree that NonZero and Bounded are on the weaker end of the argument. B=
ut
> there's still the flexibility argument.
>
> The API itself, i.e. alloc_area(), does not need to bother with how the v=
alue is
> checked. I.e. is it a runtime check, compile or build time check, or is i=
t even
> unchecked (or panicking) because we can derive the invariant from another=
 type.
>

To add a minor point to this, if rustc could figure out that a
suitable non-zero number literal can be treated as NonZero<usize>,
we'd not need a macro and it would all be very ergonomic...

cheers,
- Burak
