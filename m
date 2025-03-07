Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35873221D96
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Mar 2025 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363118; cv=none; b=horUgMOglMM2RbLwahwdNRIy8mwUbfOUwdwVX4a/b28JHlZr/l9FjTh8JBmBY5VA4oLir7uDY69Nb7EaQhniMGh8FXIGZ9kGbN0drmN7j8VlzW98dNT3hk/POenkuDcDMNJ3MvxD40ajQ3/yPKzsRZ397V2m/0YopxSNcmXSZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363118; c=relaxed/simple;
	bh=dE0BQ5eQ2gG61bm4nmvokkvXWu5x37dPf7bjFaVcIFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KcFwk0TKz5dPxmFppQl25xqWQTbotjASyapc8pDMbTYe5Y0QNIo5WzAPCUFOPDN/xJwyE8BvZjvyVIfXC6/bYFt2vGHSBJQqJZSmHjg48P5cloHy4HEocD81hZd7h8DFwnNlux1zTOiJRawKxZss06jVPGT7mCvUlB2IfrhuFPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iBoonrFf; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iBoonrFf"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bcde3f887so13651645e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Mar 2025 07:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741363115; x=1741967915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE0BQ5eQ2gG61bm4nmvokkvXWu5x37dPf7bjFaVcIFI=;
        b=iBoonrFfR2FStgDEszZUjpgzWAITJCNkfF5R9KvG9vlNTTdgdlQHRO3Y2b+1lZEG6D
         3zLAtyFFC3SMfMbesbQ6CNV9uHzL93oDFdW4mhmYzJ7NV8FIDpIhZYt/8BF1w+TqijlC
         0u7Zk+fvCaymxjt/NyZGmlsZExK90MCfcg7yACJvTNu+YXcdcXzoG5cDfolhakkwQEhr
         LUFCoGC21jMCFRrra7bA9IAO4iTsIgCd5TPIlWCgoZBOpo5D66Uq0jgSOp4rCbTTxhQj
         n91N9g1nk4NMRirmpiXgSlZKj+X/xNTqpy6NEdqU+Li2dbwsM68xcGrWZtGl+OrVLwtY
         HasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363115; x=1741967915;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dE0BQ5eQ2gG61bm4nmvokkvXWu5x37dPf7bjFaVcIFI=;
        b=OZyqJ4Qy6y0+vsHxoIJcdQbd2HiLKbFgr830GbW54Le43n/vyfaRPL6qgow8T3tQvd
         XdaqBVXoCAg8jk44vq9cHdTw9NKdrbARA/2y75he3hNc1mveXUAOJKwsdnmHTNsQf5xC
         3JajMlsaZ6n/OZBprOyv/9jnnT2gqqbZiY2H/sYei6CNWUjpwIwWgbz0Io1AcVkraVgS
         eD1TIJdkyZeTCNK1mGyIQG7nUNJJpkO6qxro2Gk6bw5eI6seugEnD1oWYvfHjjXGziQ3
         Ga59bvmC+DLSonGKPF1YzQjnyXlJOgpZ+0LZ7s++GNawINbg/brhk/xmV2hW6iGNvaJL
         b8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWxk5IennEMVjyTmEnFHivkGmozrrlQm3zK0a7gteOIcyDT53QfeEIBIkbqO/nM71HNjyFeIavq71qKMgafyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0K/FaysRbaPXlOtv+LUB8rXZp+qBM3XPmoAGaC4sleJmRmJhg
	5dpndFdAwjwED8B/ZtcIleJ9NWiIwvvLBpx7WKPfuQKr08mOhfXschPcEH5H4ctH4SPf9e93Eq6
	tjl/uaFuxQ1j0KQ==
X-Google-Smtp-Source: AGHT+IHeTjfMptm9ASbuvmJo3K0E3Bs7Zv50W5LtSVFpbOJTKkaivp+rDcz3x/KoNgbzGuD96Xv7PbhMCeRp7DY=
X-Received: from wmbay42.prod.google.com ([2002:a05:600c:1e2a:b0:43c:9429:5ec4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba0:b0:439:8c6d:7ad9 with SMTP id 5b1f17b1804b1-43c601cab94mr31396625e9.31.1741363115397;
 Fri, 07 Mar 2025 07:58:35 -0800 (PST)
Date: Fri, 7 Mar 2025 15:58:33 +0000
In-Reply-To: <CANiq72ktwWOEBFB=y7xun-CDurwsSRe2_PE6RqGS4OhEyPGFkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250307-unique-ref-v5-0-bffeb633277e@pm.me> <20250307-unique-ref-v5-4-bffeb633277e@pm.me>
 <CANiq72mYfhuRWkjomb1vOMMPOaxvdS6qjfVLAwxUw6ecdqyh2A@mail.gmail.com>
 <Z8r0lVu1iwc9GG2t@google.com> <CANiq72ktwWOEBFB=y7xun-CDurwsSRe2_PE6RqGS4OhEyPGFkQ@mail.gmail.com>
Message-ID: <Z8sXqXgfhHbNpG6B@google.com>
Subject: Re: [PATCH v5 4/4] rust: adding OwnableRefCounted and SimpleOwnableRefCounted
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Oliver Mangold <oliver.mangold@pm.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 02:53:30PM +0100, Miguel Ojeda wrote:
> On Fri, Mar 7, 2025 at 2:28=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > It's only a warning on older compilers. We could just add this in
> > lib.rs:
> >
> > #![allow(unknown_or_malformed_diagnostic_attributes)]
>=20
> That is OK too, though we would lose the check for typos until we
> upgrade the minimum.
>=20
> Hmm... Since we have nowadays the way to create those conditions
> easily, I think it is fine to do it conditionally.

Another possibility is to make the allow conditional.

Alice
