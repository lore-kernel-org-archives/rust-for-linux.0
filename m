Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168E8420888
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342014; cv=none; b=RSOA6wZEAzKVH1M7+oKVpf7aF37alLmkG2sDuAPQYraUItfJ1/YiVgKWfh2/tNYdbNsxCkRMlP9MwIzFoMYwvoKHb6lzNISKj1FzU6jhp9FXVDn73KdiQV6M5cmlDVxJ9cQpeWNMmcOOMR2u+mNEst0dTK5g5zQTsZwMgutt6sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342014; c=relaxed/simple;
	bh=/dqoTYg6+fCxwhN0KROjyyeiU+qZU4d6g5TG3/SL/p0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U+osSBE4VfxVY2ODqIQsD/sADpKKXv0thx0p4ynarbfXKnQrV761aBPsJ/VXldy2ukui5rEzA1E7P3i8aZWn19wwljiLd4u9zvBC3jbs18vApKni7FkwMBQ3Ua1d7XNIGaxoFsowskX0AS7RzvWIHMOm/erbmPl52uCAnd8YeaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p3WL0r4j; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p3WL0r4j"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-c12e5e49423so173016466b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 05:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783342010; x=1783946810; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4Q98ESFsm5V2q2RxX/fy6rfondgx2jkzF1eEys7nYs=;
        b=p3WL0r4jK7ulPYSusgEJ/R8hBMqWT6mBxeyHjqBHeRNJbFi69SWkRl/M2/TGe6d5/a
         jatqQOxwHzsX/OIE6gTPOY+JXSBiafM+Ln/go62tCShJqC/7ZVExqdZAEtWSsUnHTcuG
         sPbGJyG1L2twOKbKxwG0zrvshpaG6cKUlXWpaiNlrvJ4WAFqbDKjiVMEQfEzDC7AQMTy
         CZZlOkN7LLidDpp9Up1wFW6L41sdTagTtUOWV60eUtZaP0dvpzQrJB+DI5CMU1mI4cjq
         wCFXVbYAkHALs1gGGBUV/7NKfJYv5dOWgZGvY/xT7FSNG6f/HrrJZgfW+je48//DkC+h
         3/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342010; x=1783946810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4Q98ESFsm5V2q2RxX/fy6rfondgx2jkzF1eEys7nYs=;
        b=WcxNCVGFi1HgQPG3P89Sa+WZraSoePL40Op0kwrqTbwOA8vfczMHoqh6av95oiiKpp
         LnuFo2lmhEQl1I34T9O/eV8SKWDyoEFRvg8WHBnTPzfGhubZ67UNK3M/1iK2+Uq9VKW9
         ATbJ7IIB4Y+Ps4oeJKgzfaEk+Pi9JOh4D6X5R9/FjFG7eNrytTgyuSOGuInkNs53w86T
         /AEe8QwgTQpopIVz+Gs/IkDjE2JB3OUVMPuguJD3e3E8aHNoWstJz7p8x+QaTcFoobWt
         sGW10gnzLd0GNCVHAD4/42cwy4t61eypZIO8anuS/f5hkYF78ISenqePAH65Llb6Zs5X
         MDMQ==
X-Forwarded-Encrypted: i=1; AHgh+RplqT+Iz7Vu9zNVnaeGhmjwe53S1NPYXta9z8xZtfkxtwfpfdhVvJudzqKmt2d9j2VJfKqzUFSFTmQkYkTk3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW3Tan6s59IYup0Elq/CJtKRLM6m+F2UZYseV4Nc5HXSQZKQVP
	0+VI5k4HpOYtGTztxVB11lCupXpn0nlgfoXqlAntVYX8eC08/ws1jWzeeBcsYkBmlA5RLzq0Slx
	RFRPvsgG994AMn54MVQ==
X-Received: from edbev14.prod.google.com ([2002:a05:6402:540e:b0:699:e9c6:5556])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4015:b0:698:ad7f:9383 with SMTP id 4fb4d7f45d1cf-69a85b93b10mr266244a12.14.1783342009416;
 Mon, 06 Jul 2026 05:46:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:46:48 +0000
In-Reply-To: <DJRGUGMD8CNG.8DWRHJ3PRH3Q@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <akuV_GRAM4QPqf-o@google.com>
 <DJRGUGMD8CNG.8DWRHJ3PRH3Q@garyguo.net>
Message-ID: <akujuAJOZxRJlQZo@google.com>
Subject: Re: [PATCH 0/4] rust: Add support for reserving of ranges of IDs
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 06, 2026 at 12:53:24PM +0100, Gary Guo wrote:
> On Mon Jul 6, 2026 at 12:48 PM BST, Alice Ryhl wrote:
> > On Fri, Jul 03, 2026 at 07:16:03PM +0900, Eliot Courtney wrote:
> >> Add support for reserving of ranges of IDs, with a usage in nova-core
> >> for channel IDs. This entails adding the helpers+users of the C bitmap
> >> API for ranges of bits, then users of that in `IdPool`, and finally a
> >> user of `IdPool` in nova-core, `ChannelIdPool`.
> >
> > If you need ranges of IDs, perhaps you want the maple tree instead?
> >
> > Alice
> 
> Any reason that the current ID pool is implemented directly on top of bitmap
> rather than using IDA?

To some extent it's because that's how C Binder did it. Though I do also
think that the bitmap fits binder's needs pretty well. Almost no Binder
processes will have more than 8 handles in use, in which case the
BitmapVec is extremely efficient because no allocation or pointer
indirection is used. And the bitmap also performs well for the few
processes with many external handles.

But it could also use the xarray instead. Nothing stopping that.

Alice
