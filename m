Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FC73FBEA7
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733093; cv=none; b=NX1uUd8dzgG94x4eH81k5fipwyUJDC1gL93Gu0uphq2VSqxWse1jL3JLll5OfDx0S6JrywYPuDxGoL+MfVoZQ3nPlwEp74mZZD1rb8XU+IRxw8h+UOIOAo4IxEjThUn+26l3kc6TQ8oXHS4mWAnEB9H280jTgwAfK1BWZKRDhBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733093; c=relaxed/simple;
	bh=TePgk28pw9nEpIK9yqXWWcC9xjXv9gsRt+7mXvf+SgM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dVvtA9EB9ks01t+Jf7VM6B866k28ZdiHP8pvWtBZvFyX54KQBilvns+jvLJ+0x+GmRfPqhBMx3VOix/Qa8op9iyQsxX/UdcWuXgLrlyaRFMRADF+lQiIwzt4vrq70iaZzE49oAT7TP66kHCX28zhX5UHIV/3EQwpjwlz5AykV4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9wGwaS0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9wGwaS0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37d82f3a244so1287983a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782733091; x=1783337891; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TePgk28pw9nEpIK9yqXWWcC9xjXv9gsRt+7mXvf+SgM=;
        b=r9wGwaS0mIZO8U5jQa8rZLxOeBXBWqe0VrryZJoNgpeyozQNHjsX/y52Dvnk3X2ohs
         7yDRn/vX9+s46FWxF6pgQH7OdSsDWTVTV/iHXd2x0FWAlT75LHAepL8fENS9d5szsZfp
         5Cm+R4OsKpUsQcDC2zjjjG6AKRzWG8Fo20oo7NMaRY1XgAb7xJU10jlGH4YqMZOWXYWu
         eHZoiro8gJZ55yP4cQNIIi5PHv9LJwXc67I2v9GgjlMwNz9hVllkS7SRaL70k5bHOAZX
         WhF4O8HL7nqZeZLGZ33GOo+5L5dkgW6o8A6Wx2Q5m0Z7YEXx+rZD/mWpCXbxogSyFlHw
         57Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733091; x=1783337891;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TePgk28pw9nEpIK9yqXWWcC9xjXv9gsRt+7mXvf+SgM=;
        b=gspo4u8KguINUOIMZfXcs3ZEt8xwDDfAyKtrJh/3XuyoJvC77KfFTWM2IBbIsjbaof
         UkloofAf0wCozDMg28m2LPRNx44xn80bTqBC2VQODceiCR4mKP1IFWhx5wFTJ/1l+3VK
         SdXEgLV1xEm/+b3dSsytxNiFN59HhAflh1508o9LBBERx72utO52Wu1c0TUJsr4IwdoS
         Uyck3krTrQOa5Nnkd8lzgThCcu7dTibJ5LsYr1NwHnMMTk6PedY+IHIQ8WtpmGcZIJrc
         1H/f1SKkKvu/7/d6QCbc9hDAcQkVK2YpPx0AzwY28Vo9vKvKK+osWB6YKtDgpWbKG6CC
         i5WA==
X-Forwarded-Encrypted: i=1; AHgh+RpZk8m39jn3I/aLJ1BVqgFHeP2MwFw8IZXYR3SQwjFLp/spPKvH/wEP/M3l32NIigRZUz5DTC0qmPDrTFCiRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkED/lZDSAcB29HqxLs5ggEjpfgMMZ77PEIv8FKKgkmRTBUbyS
	u/YtPRSgcRaMmtqFad3yZRmSZyLwbz3Gj+xLDeXStqSaIQJrrvKDmzUz
X-Gm-Gg: AfdE7clibg4bT3C6XdK7L2K04SxMOz1OtjgAcVkyAvsIuOxUZpL8MfTFLGvZwBcBaRi
	UxtGSmwZa5jSf/aO7aYPG0jE4PYWsNSxcQeDH+PuHZJCdEjb7ZtortC1QjDHoNqDpStLy/NG0tm
	ZrFrO0gWnqC5PFNIJNGTLySqDebyJkSJAO9fthSUKAgJwl/6nOjm/xVFzvBWf9n1FykkorZgW/W
	v6rMBc5wHcUx2oAgoiAgANvPskrN6i/pancrU0WsSVck29+nEFce3PcN4UaC8nbKvWFgJw7R2Y+
	L8u2Ii4j0nqFaIdO0YA9v15Var3JKWPkhtpGEhY7FzkdXbdr2fbvaGLZ12E5PqcGxtgWtLTN6p2
	vXYp+V3mbBb+8guI48uouR1QguVBeG1Ydlc8LMZlc862Xo+x1aKt+2RV99UpQpsHsD0jAYdvRS3
	eyc1F3v6QJnwuEUwZxjfnLuiX410iyH5k+vou1bkyRTqTwaaupt1MyKy7ThIb4BZMxfQkr/4THn
	51HpxmFx2fC25SIj6DPfkMtXZHA2qDeXBWBFcpG
X-Received: by 2002:a17:90b:560f:b0:37e:1cac:d2f7 with SMTP id 98e67ed59e1d1-37f7a557912mr8306827a91.6.1782733091454;
        Mon, 29 Jun 2026 04:38:11 -0700 (PDT)
Received: from localhost ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e24b13458sm5549594a91.13.2026.06.29.04.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 11:38:04 +0000
Message-Id: <DJLI4X05N1Y9.322KEILB5Z6RG@gmail.com>
Subject: Re: [PATCH RFC 0/4] rust: dma: bridge zerocopy-derived types into
 the transmute byte-safety bound
From: "SeungJong Ha" <engineer.jjhama@gmail.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alistair Popple"
 <apopple@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "SeungJong Ha via B4 Relay"
 <devnull+engineer.jjhama.gmail.com@kernel.org>,
 <engineer.jjhama@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
 <DJLCLH7GDSBW.28J4PZW0FD60B@nvidia.com>
 <akIpejFWuKZ61n_v@nvdebian.thelocal>
 <DJLEQ0UIBOQ4.2AQ93XKMH49X0@kernel.org>
In-Reply-To: <DJLEQ0UIBOQ4.2AQ93XKMH49X0@kernel.org>

On Mon Jun 29, 2026 at 8:57 AM UTC, Danilo Krummrich wrote:
> On Mon Jun 29, 2026 at 10:20 AM CEST, Alistair Popple wrote:
>> I think the context is in the description for patch 1. It's not directly=
 related
>> to the bindings generator. Basically the problem is that these bindings =
are a
>> little bit unique in that we access them using the dma_write/read macros=
. In
>> other words we use these with Dma::Coherent which still requires the tra=
nsmute
>> rather than zerocopy trait bounds to be implemented.
>>
>> That said I think the correct long-term fix here would be to fix Dma::Co=
herent
>> to make it work with the zerocopy traits. Not sure if anyone is looking =
at that
>> or not.
>
> I think it can just be done short term, please also see [1]. We can just =
convert
> the DMA code right away, no need for the proposed indirection.
>
> [1] https://lore.kernel.org/all/DJLEHDNJCUD0.38PFZ5773D6BX@kernel.org/

Same here [2], It'll be better to make full transition from transmute after=
 the new
version of zerocopy[3] and auto derive is merged.

Best Regards,
SeungJong

[2] https://lore.kernel.org/all/DJLHOQA5UAP4.340P2TKXGMME5@gmail.com/
[3] https://lore.kernel.org/all/20260625231919.692444-1-ojeda@kernel.org/

