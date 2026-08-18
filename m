Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1B27FB1C
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037543; cv=pass; b=NR+LbmZDZvJceRpRRdNrOIDH68cWTGLG8XLrjC6AkE+RVo6FnBjij6twP2v1Re0lCl1ncJvR49makgHfAfAqsZOCvODe2ErEq8QtsUgwMkt//6lryUnKMEsPp/hw/5jX+9yJXPPnEaVSXidjThiKiLnpm2O6yRaiQvJ83r6AZo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037543; c=relaxed/simple;
	bh=WhPSBBPQGGZbolI+iA2pgFPPV7f1s1z0AqjG9jtoWO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgeBjubDHJmu0Jc92PXUpegnku+jZL9N862YPXg8pOa1wt+y3eYIICo1S1qOFP7xPLo0iqz6kTutml8un0j0jdU2OfP+7RwsZuU+sq5qP4FZ19bxkJHHDVI10zmEZtOTT2QqLe+rAbe9K6WSofVEsUmeZb6L5wGfD2tgubCW8KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+pN9sS+; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+pN9sS+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d01548ac96so571565ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 00:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787037541; cv=none;
        d=google.com; s=arc-20260327;
        b=dATHXhMIJdi/030cg6vYQrmt6xQRTPkK2Qjz3AmNlXcLjSfRtZiPX6qY3PRaEZyRii
         CayNoWJVxcpHAHxYBd0Lldv0UKTXb/OBbik2UpN+RQ8OszRrYbIuz3NsW9pCThpkRAMq
         h5TbxujNZuVVlydE9aIP4fq2X7p1LMcawe0Q/sTBrlkfTqUE8WvxX3q/08GBOPKM3I6F
         0mYNGRMMxreQUd7JCrENZttVHq1FDyl2rKVl5fT5PHBSIfotZFu7gG1WA6v8SexRaia8
         4GUDFbJP0YHJdS4tQ/ucYuWcwZpfjKZyPyf89wF+No009AGoJFOaZbu3Cy0SL1pmNPH9
         aI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhPSBBPQGGZbolI+iA2pgFPPV7f1s1z0AqjG9jtoWO8=;
        fh=GcadTzqzT0QI6krSkEh1ygG7VgPPRC0lqRdPwhQNvS0=;
        b=hhHwLdxaEDJ40/q79qqWCVHMlqdRJ88L+daVLJp+9SXEMKIkEAFjPLMLux6ekLcWUl
         4ihiqt/DgqzoNRLbP6tEAV0l0zfnGiWMO5GP2wnsMheKE7qCKtO01fplZdFmKFG2ElG5
         RDB3uaZ7hh1YrJOYyNZ8K3tDPqYRPT6W5XQ72MW8sV64AL1wT/VasfSKXGmGKNvxrH1p
         H7KzGRYIA12GEiCF4BSzLwdA1ufJwLOIvu7w1qPGRILuuhiTFNfjqT1WEDzQnJxE/APu
         TWWmIanghO1kK12bqvjCMNdQI1RLe6gpnPOb4h0gaDP/qE1C4QNpdLef3QpWHWDxS5QI
         twew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787037541; x=1787642341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WhPSBBPQGGZbolI+iA2pgFPPV7f1s1z0AqjG9jtoWO8=;
        b=o+pN9sS+rWew1ZO1SjswR/1N+fxoNPvFwSU6zCB5vC4GfcgNK+35X/Yl9NRk7/8KbT
         rwh9BONWXjicMtZr6YzL8TUyqn0mWDk/ovmNMMiYxTH2QefWR7Bi+T7Anr6o/F/QCZqg
         fIPzCmCqm2SZx33lmnvWWUTKxm7doIUfdOiCH/S3mRRjCl2w95ixziSPNgGh1/jM6wgE
         yNLI3h5VFR3LhbDG8OryClx/yxO2p/uf8Un7IrnvTCi+0f6rXUq7Rk0EWHuLuf2W8D+f
         NZsumjGaAwjx+dSWYVk3Zn03gIB/sUOBulHv5bcbcFCNkQ9i6Oa6kFNPIHVrJejXORGF
         J4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787037541; x=1787642341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhPSBBPQGGZbolI+iA2pgFPPV7f1s1z0AqjG9jtoWO8=;
        b=dWMz7kL0pkulaGe4IygYXCIWCT6gE5ps41fIqXTIFHb0Z6YMsJ/E7/3SZWvfMxqqPg
         DoUQpUTfoXnr4SZTlhILgjF9sAvoOC0Dg+Laov5edia4Cs3jsRT1h9tXYyYAUlXhLZnm
         phwXStCkqhac+QdHe/3DTiSIuwzXkBPs13kZ/OT16PCB6TDhmtzYJVIBuh2C6/x8mLzC
         mbePJpu8hiv6cztIw7MU02RtSDPu07wWqqteomUQj0TH45vyxOZoiPsrKoUy4pK0qXXJ
         65odLbZ0/YfoF9FL36KyUX8wIE/d87IfdLU6dZF1Q13i+2Y8Y4skr2dkPmMVA9aonzdN
         50ag==
X-Forwarded-Encrypted: i=1; AHgh+RohEC094W4xzkkDK58QldhR7q6keuzr8uu5aOZYBvxXvu1i6mpUQNJx8PiMcbEmuHTVPXNre43K7ZohUzIENg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO5wfgqsddRdQAn/4Lz2+DA8A4EoDRGYNcfBdb6MQ3hUIU7lf+
	WNCJouUJeuwTQiiQxiv3aKQHPkuSMFzpLWU7yUmUDFYUEPLHSK8Od8hbwobX+jN5JCr7ftqhn0t
	VcYnB2Dvkxc53kqYgpvh8yMy6xgl9V1k=
X-Gm-Gg: AR+sD12wiDKnxSgB5O9S9Rf7pRLmkIs9H3qhH2X9m7667SuRen1V8sckIgJxLT1okF5
	R51F/NpLzQguNBXm7O4ucYHGdX15yaRLhIOI0ZjUFwt/kMznmqngDaPrqcGXAcIh67c+qdiDSUB
	lEAerd6PoF78A/7BvSL7I5QEetED2BP/MxbN6B4ciKGTE07aOiQXTVQ+BzB6PJgGUPGEIcDTthz
	VL871FyWPZvqsga8bQYv5LynHuldxPL6nnCQJANthDPsvK7HOvc3qf4SLwS+oPKR+7NYlNsu328
	MlbBb6BDCDYkvB6V1ZYPM1fV7FqmrZHsD748s7N9vsmVU1MqadoZ5mQ6qlmxW8JjGBwEst0LsBj
	FNK9wKJXOIur/gyomCZEhBMiHpAP8enbWEOyI/fxkD4Rk3Imht8LShwF9mr3F
X-Received: by 2002:a17:902:850b:b0:2d5:cbd3:8eb1 with SMTP id
 d9443c01a7336-2d5cbd38f48mr29929495ad.3.1787037540543; Tue, 18 Aug 2026
 00:19:00 -0700 (PDT)
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
 <CABwQupNA=NuctKz0FRaJsWowf+=24C_o7u8twFFeUZ+dq6u+Jw@mail.gmail.com>
In-Reply-To: <CABwQupNA=NuctKz0FRaJsWowf+=24C_o7u8twFFeUZ+dq6u+Jw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 09:18:45 +0200
X-Gm-Features: AcwNN1URGomC3yROmR3KTAJ4h6I32rNk_7AiTcL10HUoEZg2QkO9YMIizAjUoJk
Message-ID: <CANiq72m=bbjgMZy-BCsB0hajMJcKb+j=jeMN=e4++B-XSUOzeg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add ChannelIdPool
To: Burak Emir <burak.emir@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
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

On Mon, Aug 17, 2026 at 11:36=E2=80=AFPM Burak Emir <burak.emir@gmail.com> =
wrote:
>
> To add a minor point to this, if rustc could figure out that a
> suitable non-zero number literal can be treated as NonZero<usize>,
> we'd not need a macro and it would all be very ergonomic...

Yeah, that and/or `1nz` literals could be nice. It may be a bit niche,
though; and we would like good ergonomics for our own custom types
too.

Nevertheless, I will ask upstream Rust in our next meeting about
https://github.com/rust-lang/rust/issues/69329.

I added it to https://github.com/Rust-for-Linux/linux/issues/354 as well.

Cheers,
Miguel
