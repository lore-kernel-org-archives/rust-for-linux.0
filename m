Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7230F318130
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403384; cv=pass; b=FWuuyXaCFHsn8SfqNfaYWpPv4BCeg6OkR0y0jwuyGpOULZ7N8VLZ9U2HAE78RH6Z2+Fdod1nG/UBlN5rDUfY9irrcgIEsletpuYjEqhK1zeidstVxCMMnfyaY6bbYlwctI5nxc2JFpJpzTkzoXiFglNaRmr1PUJA0606p0fO5+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403384; c=relaxed/simple;
	bh=KXWmkpCoq7kLjpwGH2w0lCzbwrtLbjDzwhy8Fk/NvNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rz9tjS21gSsCC4WrGdgzOqLt/40KPZEV+ELtkzrqVJCjU2uUsXe5xxDw5a3yp88OJL+4PMFmWGPbNyLdEnEHaBSpygaM6bCp0IrLk3zOkO7TcSd3pEKaofjG875sP1WAGOsbg7hA3WRCIzEKMfp08MEq8ZjNV2+uEb9TwrFc7Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jl0Hf3dX; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jl0Hf3dX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359249bbacso379008f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 00:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771403382; cv=none;
        d=google.com; s=arc-20240605;
        b=csgJezqQWNdSvkt0T8rRRWSCBmimj1E/T1K7W43p9l+ri8yR/lKQM1/gmEnt+Om/Nu
         casEAUuWnf+38d3F/Zfs5ovO5fav+/Leashee+R7XSO50sf17mRlmK9Hehdra0kLs6ny
         GNq3X+e+Hf8T1t/lwhWokPC5ux8DndLa5NWXO/X8V2X+9MfAnXw/CoZEKUhMVzAr6a9N
         tiugo65Cr8XrojW9gPJQ3wHdRu99uhePOmYi/MNNdAoBAJXxCVcLB8/dZvrIXiUdCC+L
         VUdYFG7Mzb+eAqdoFUb+A3cL8LSoCQcOvuEYnXjBBPjZa7i8d+yWgBbVoFCXzGiMb44I
         G74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KXWmkpCoq7kLjpwGH2w0lCzbwrtLbjDzwhy8Fk/NvNs=;
        fh=jhsxz9ZAmWheQl+qZuhYYb0W/mu+wrDOoP1MBXBWWZ4=;
        b=OSXWFM7MTFtCdTfROSUrWtlv5NgGBMvj800lxA1wrlAIQc5e+e+4na1zeY770QB/GG
         0DyXxhgmM5pzUCOC7yrm4R+Jisvaiet6V4h3H4R4iC3GXBZNSlNdHfW73T1y5Vz9+nnM
         UBiiqz8QSMZbZrE0my257PNsfQfuqxGOPYsq1Cs7c4KX82xsv2i+clgIauYrtewsqro9
         HIdIUDJPdeRWNwKoBKMYvf1k9Arj48zwp5MVjskLXxmlHY2fcdtfVzILIUE10nl77SG5
         oyJ4JWh//X7h6wqo19WEBsxiSdWS1N52jeVCYlxzE1Dg3A+959f8vDEhJ+GZBBKnPolU
         kvEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771403382; x=1772008182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXWmkpCoq7kLjpwGH2w0lCzbwrtLbjDzwhy8Fk/NvNs=;
        b=Jl0Hf3dXD4i44V3yeyclWB+GjZr3jIAs6UbYhUhojn7/UGlUa4kSHKUkZFtTmiFSiv
         /ty1zoUsseYK+x73OpaGZm0krg35D5/2czszQl4eOn8BiiaMoHr+c9vevw08/ZU+Vu8m
         QHymVJlQzlyb7J52QitgRweWs7nvB9NVKz38JU2OFpQaslVvMQm2WlUDNMMQeXiKysjz
         aaPkk2nvIDzsAFq44FcDtwU+1VmRjsTJ/dZ1hKZ9sjgcP0sLZfoq/Y4MWtiIl900U3n3
         QoJFXahyRQnLrNPIm8gN3EQaUwn316/fA0ZKBoWSnOiwRN/xcpPNq/h314s4ksZbDv+O
         hhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771403382; x=1772008182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXWmkpCoq7kLjpwGH2w0lCzbwrtLbjDzwhy8Fk/NvNs=;
        b=XIvY5mdagiL9Ae4m6OMm/8R4/QPaA2FDSHCOWVOAXlvANJ2NCnpr6pocy6djtB4D6M
         mV21xrS8oPHJlCTDGz/tmyr165TiwbQWE901OW7SzxXpnyPonSW1gOFsl8aNYvj4eMpM
         0l3/e2PCkB1hCwbEoYdzCRA/8naeoHE9Kj0LzoHvUaI4d5MH08P6AnKxem+h2EtmOwwW
         5yqDf5fu4WRks9qP6O0j8G1HikVQFQizNbxAPbDP+uHKcnIERyxl2cir1h8qGvuSWLKx
         ni1vfE/PELYpLkXxQ7fXIvCCx3jAJj6ctxBfsojEGs/BAtsBTN80qxhzWZeGvtNSZIro
         mz+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxtchRCgxQ+AnrNh4AqxgQFPYeHow8ZlnwzlV7B82HYKSVBZSrnYO2H6tmTkYOTilC3XofNHRhobQ6sWbV+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjh5HyGGtW/FmB4jyZ8mhS3Wamq4gbxDXUsBliTjjPZIKfU2/p
	JWGCMWSXZNBmFCjXhpNWdDfmbGgb2woyzOvZYHZ3yeKBDZLJjKZBnyu/JsRM8fJYu1d/No4en8z
	yWaCfeVtmpNl98ZNBqZjGC3Yl5556gxRvlblzCii4
X-Gm-Gg: AZuq6aJjFPaLhTSGu47DW8Qt/kA3pmKjyKj2+UltKvbq96IJnz/F79tr8KQ9S5QwcJn
	Tn17xVb/gx3C7V7rccYAXe64dmcpIX42BuiwP4e3ocOeU+Ar7A5iLLytUPzjDxNuw1IkMifRegd
	c/noG6QdVKmhGxXQwVzSXPopZjJe60zlpRPdiVDG8IsECs0nmNDwQs0ubDJVYhH3lFRfVyJU/7e
	U2zkw/8xbBINm4CGCe386mChr7hPfdda+0g5IYyTvuPky+LN3ITBeSqiazWYJv1/6pPloUzMv/H
	AVM6w09iQLG15X7gyqWLB/tuNg7fVa8JNbMGE4B9O/d0wMoSupWYe4bQyAmDOlNS5AsCzflEv8I
	D/cnz
X-Received: by 2002:a05:6000:4010:b0:430:2773:84d6 with SMTP id
 ffacd0b85a97d-43958c4e66fmr1690358f8f.24.1771403381393; Wed, 18 Feb 2026
 00:29:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid>
 <aZMMyJofDKualqXw@google.com> <873430es2p.fsf@t14s.mail-host-address-is-not-set>
 <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com> <DGGFZX5JLZ22.3E1C8OVLNUDD6@kernel.org>
 <3D7C5FE8-CA15-418B-B2F7-D0EA4C37E1F0@collabora.com> <DGGGPFU9E9VD.8TT3HZUWS100@kernel.org>
 <U-BIeJ2bi8_e-eMwrNeo2r12w5jDIlGja9E3QSTg2bgL7JYAp1lJtO6sPCvTGQsL1PCfkEkMHfR5eLVG3JPJaw==@protonmail.internalid>
 <71F89D79-DBE1-4617-B58A-8552D0F2B3A2@collabora.com> <87pl63d6xx.fsf@t14s.mail-host-address-is-not-set>
 <L27n6JvhX0qd0nYoc7OSvJJHPPjYRdUHiXcqL4l9FKkG52HCMa-qnOS33uUJtDu_Iayel2UgLad7yc5cWsOGHQ==@protonmail.internalid>
 <DGHB1VEL6XTH.2W3803V58FUSH@kernel.org> <87342zchjb.fsf@kernel.org>
In-Reply-To: <87342zchjb.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Feb 2026 09:29:30 +0100
X-Gm-Features: AaiRm52ayL78Sm3Vd7A9YtG_M81zZQkVCzyzo31wP-bjgXqp4sCbn8YwKCQr-Y4
Message-ID: <CAH5fLgg4R28vqs7udFb5PtrQAXOzBGaNMq9aGf=W9cjVZEDGjw@mail.gmail.com>
Subject: Re: [PATCH] rust: add a ring buffer implementation
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 8:11=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
> * VecDeque? This kind of structure has always been a ring to me.

I suppose it's only a deque if you can push/pop from both ends.

Alice
