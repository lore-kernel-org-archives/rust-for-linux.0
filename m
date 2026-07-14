Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1D3B42E9
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 12:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033852; cv=none; b=UnPIZX7s74JCetb/JY3TjYezPfmjwHbndwBpuLymz1X5T3JNV4/j9opc2I/sp3Bc5wbBBtUR47zPTFPmhM9jYA9+CwADO7OXX/WFiO9MDXkaYhG9zkYYULmyvTtoDVENCfRWpswH+Aax4N2hyTS6EjqLJRsuK7HvaOrw/RdYgsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033852; c=relaxed/simple;
	bh=ARe7LddK4kQODUxx987O+Ez5ZoAkGSkRk3Xx6xm3W5g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BEPXJ4Q4gjVYpnj4ETMmiv6WirKgVfQc1rsxOk42GgxMSjVQqnPDAf7vXKA77vllgB+BbsCFQeP/l+G+lwDgHZ70jLGUF3DQGaDyNbIbR3fXEiGr8t+XXlxOqlC5FIjHgOEWNJ3JM+xwgOvnEJXvWauKysf3ATyVUpOIXUUbbC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uaa2HQoy; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uaa2HQoy"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4731a357b0aso895182f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784033849; x=1784638649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UEXN+K1nCWswISP0tvxOl/bCRoS1hNmn2vELZ2zFhk0=;
        b=uaa2HQoy2nOckmbcGHzhy5FeJXzZcpk8c9+AKLGugipc6el/lWal9uxOZpNztNRR+v
         s9gfd8Fi95RGVjib9ypAbGv00kgILTyj/5OgSxsLMfzpml/PiZWkFCNxN/BWA+Q5kJ7X
         BGs8PZjes0hrlhxfkBCJRVe39OoLLHkyita5fxFWqw4/duTSNQOZ+LQvoUVtTXTUEh7W
         3a2OJz3G2+aZhr6NZ+Uhxdvh1O5UHOR3T+PfBL+V5YmubKY0P6CpO4O0cRsK0zurb+xx
         Ubxc7FThigAky+EZmI613MHLrMMszLNjhkSG9Mox//ddQYPBfkNM1gQ8HfUQukAC4Cg5
         cbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784033849; x=1784638649;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEXN+K1nCWswISP0tvxOl/bCRoS1hNmn2vELZ2zFhk0=;
        b=OE02DAoPwcjYpFUuv6ZHdrF8A+pBIjU7VwkceZG2KLxlxnX8nWPnEJHSFIyl8JCFzx
         cRBqy8Ea1v6V0MPSuMpgtmPkWYI+8Mm2FbgCGH/WKPl67uKhrNzISI8oirEk5zGwai/c
         CZWn308aZIw1sUIV22kIrY3qBaDOpt/aY7piUo+o/ykNODpTjKM7aY64jJljWQPAbQQX
         eNGw4J/ibXin+UB7ito5sfP5TX17MvvBJ4Qr8DF/1pHQVlN+s2GZ//Sp1g0NGyvCbNox
         Cf8kW8OWY2AeuzKP7kC4kbI3fZTHRzI+3KIMm/6L/ntBAG9bE/sHwdmdL9CHWS9f6o8r
         12NQ==
X-Forwarded-Encrypted: i=1; AHgh+RovPrsqBhGoV1LRIkAYfbDls0NFFU/MlRaF8prcvOOQB/03jzDfxyIknbEozYjSMQBAQXYVexqKeOP3CsyPjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmV7S0PEZ89n/X9QE4K4u1T8iv9YckFsOuccZ0foMRfqj17pV/
	I6RHBYd0KSvTxDcEvY7NxHViPTiS5b7+eNCEletWwagKtjldd4Jf6r7tLNn9pQlyqGIKTAuxcA+
	Ek3BRn42tCIn3d5hIFQ==
X-Received: from wrsq17.prod.google.com ([2002:adf:fed1:0:b0:46f:a507:52e0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:59c9:0:b0:460:6a13:9131 with SMTP id ffacd0b85a97d-47f2dce92bamr16036542f8f.19.1784033848288;
 Tue, 14 Jul 2026 05:57:28 -0700 (PDT)
Date: Tue, 14 Jul 2026 12:57:26 +0000
In-Reply-To: <CANiq72mokH0-CnObPnFJWsSaofOmiAqtBuvGxPvXSruPT-Xn3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com>
 <20260714.194916.571807180513332641.tomo@flapping.org> <DJY8NM7TIHZK.15213B4MWETHU@garyguo.net>
 <20260714.211751.124079232269470730.tomo@flapping.org> <CANiq72mokH0-CnObPnFJWsSaofOmiAqtBuvGxPvXSruPT-Xn3g@mail.gmail.com>
Message-ID: <alYyNtrxK5qz7nxA@google.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net, a.hindborg@kernel.org, 
	ojeda@kernel.org, acourbot@nvidia.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 02:31:02PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 14, 2026 at 2:18=E2=80=AFPM FUJITA Tomonori <tomo@flapping.or=
g> wrote:
> >
> > Can we agree on something like this?
>=20
> Something like that example is what I meant, yes (i.e. the groups with
> a comment header, the N and N + 1 thing I discussed with Andreas,
> etc.). Thanks!
>=20
> But timekeeping should decide to what degree `9_223_372_036_854_775`
> is meant to be documented, i.e. public, private or a middle ground
> where we only mention it to explain the boundary case without the
> intention of anyone using it.

I mean if the goal is just to explain that values that are too large
saturate, then the example could look like this?

	```rs
	assert_eq!(Delta::from_micros(1_000).as_nanos(), 1_000_000);
	assert_eq!(Delta::from_micros(1).as_nanos(), 1_000);
	assert_eq!(Delta::from_micros(-1).as_nanos(), -1_000);
=09
	// If the value is too large, the value saturates to the maximum
	// possible Delta.
	assert_eq!(Delta::from_micros(i64::MAX).as_nanos(), Delta::MAX);
	```

This shows pretty clearly that they saturate without explaining exactly
where the boundary is.

Alice
