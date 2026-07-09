Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C364195AF
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618870; cv=pass; b=ReqQ/YclvDsQ2ZwDE0Ih7RKNIYw8XVU6oez0n8qyI/ytDmvuisq4DtFfHZXt4wynh/ybsSqEbxK1odjIbqnUcPGLZ2eqIMs3zBiDZ4hOnpQA63TFxU7zAzYBvNZWzHo8Oq+AoKoMyOxfUVuIfwssqfnfhHIq7hlQVnHcS/NyOE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618870; c=relaxed/simple;
	bh=6BoerezV8C7htukeOXMMiV98AYcshjNetiu1stMmpwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhNtZwGr8VlXDoU5NraQLdhJP3Y8xedTd+4O/Jo3VHLW26vhRwsFbK9Sr1eD36FmfmN6kzbpsTSTKfo1XROq5hFAiy/NozYVHNwYlSaXazeEJFzk1l1+G8Q2PyKukfzQM/7OGQj9pe17VjZuAyFwL9Jq9FpcUF37HzW4Fpesjrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKxSiuvm; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKxSiuvm"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381d656c36eso33698a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jul 2026 10:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783618868; cv=none;
        d=google.com; s=arc-20260327;
        b=gaYWJvr7EPEBCRDlwb1DrxoWr5W5W8pa6lf9+ZUIC4l/bJvOT4pwLJ4yZu8Aa5Xlif
         ZwNAqtN1K789bJGQFbC+JOP7co8mMO1mDVk+XStFDxI6rBzZbcJfLNwMWuBitVD93Xnr
         u9Sgacsivqz8MiQJ46rPc+6paAliA8V3axLpAyKQZl613xr05YgHAhsk4DKquwYqIVnM
         0s8ptoy30CJpWkdRXLmeIooiRBrGUPeDiMgFBFCieKk7h4UinOWiR//5/hrQvQL44eH9
         aZ7lckbrnfy3Aa6YvSQTOcexce3x8ntDMDCzv1bKQOAPcufXf/FNG+GirEycSLGwopci
         0Rrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ORVEEUE5hlslbvMlBF8cYsXtop2ZgTrTecOHQOSZB8=;
        fh=29ZWUPCql6K5hckyl2h/6bZZwaEFd1bYECu72g2BI+o=;
        b=phWkdrHhaG/aHhbxyJ1rEZXxFPR2gxKzLVnkaarGa9P5y/KUlNLGVMwBVIDaepOOjW
         /y1qpE3gYkhxWiUna3AOaTIFfiAjoLCv8pBt0zO/jFi3nkdYmr+gyRcqgojrqsBDlv8Y
         kotPI8hh9eTmobqQ7L72OOlkXEtxaJiumGh1tPEdLogpyshXT2jfsXXjlqwAAMNBfcco
         sc7sBsTh+83tB0oP2K1cxOitfC7mI7DiMFIMIWZJu1zprycmzi99dB+62m1hX0K92DMv
         EzbaCK2YgekKQVFktCBSBBSwXNLJa8fFzS17XiDvVe6vJ+tjiYt1+V/wcZhpJIQ/f/Jb
         9u8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783618868; x=1784223668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ORVEEUE5hlslbvMlBF8cYsXtop2ZgTrTecOHQOSZB8=;
        b=PKxSiuvmEzW1uFibB/j++HJcv7mxSq8Ewt40u7nV5oYyzI9+qfUsHJfG+5M7nyOwrD
         /LKwgboc320NKdKuzjUpETk8MMbHFcpbfm5YLnpyEeS+ko62hqBTtWUfSm5qRdym/hgD
         2pvuJxTW6mPnoRhQamPyksxQzpCTEzf1qD6yOYuJpK6bqflFV2Vnj3ARAGqaI1Nymd8w
         jluyfJCfRwbU5sjOZE/inx71LA85jJGUfq1lWXR8PElBJy0eEt5KNpEaYmft/2QklMQp
         Jakg8ePXVH9QyM8RaH9zZsM6IIwPvxcr6hs7QnxoDxSHOnUZuA+C8scuBfY9LhIN1gDI
         a8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618868; x=1784223668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ORVEEUE5hlslbvMlBF8cYsXtop2ZgTrTecOHQOSZB8=;
        b=MTiXrbkC2dYXfhRIHYbLjkkwlkbR6eT7FFQqSjI0x5T6p3mSqVwBifCSnijAJZbvdB
         U2GVHYuoR1Kve4yrfCyf9+JK2QYRf2GYoZBuJCEuGRitXmYQvBYoQVtUGnB5b0+7AgIQ
         DFxEq3WTtSJIKEvuM8Lq4B1HX+VX3OXUDzPMRgHRSyXjsgCfosaahwg2+R4ZPUl/CZrx
         h8WGswcUKPzm6DPkt6WUsxrgRz76jGj/vPkaHoLUwGH9xla+rp9NKvdBdypxv3IbJ1lh
         xJogTgLxSdbQeVegZVKH2cLDdx9HjK081UMKJLweccg+LAK/q3KU9tgbMgEIkpc39dss
         Ra4A==
X-Forwarded-Encrypted: i=1; AHgh+RpIqUsMpeDMoSVarwr2cOFyOmIuJS1SHtv2RoPT8TznNmPRw3fwco+m0+Wq6X/uwh4esfufwMAtoXziLmKaRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhJN6PIOrPnJHEeMzT4vBUkd1XTEzDgDMVcKcXH6taw5E4ukEw
	T70bjqVZb+siyf34m3qfEqdfX4pWySMqC/G+MGmn7OXxLQehjtblqMfxq8wuFRVoEIpPPHPXRUD
	zY/LB9sBXNsKKBg77RIbKcUhi4GsfyLI=
X-Gm-Gg: AfdE7cmHzyizJfMel4Q/5GyD3hdGDPGFhGR+Bpl/oUVOpupM6vsd0eZ/R2L4Lp1IVd2
	GnFPPHOfIhVcRtZEjfPkJdhtSH45hd1gIk9CQ9+2zagmO9cpj8TaUQr6pxoQI4Wxj7nBCNmOoCC
	5QunZkNJcXEPj35Shjv3g0UdRhUxuuy1bfvMmbJxZdKlgPAjKSrQPhRm7ngrEZEQjnq3Ttr66xm
	CvzFtLyPTe1qxL3fCuYPhQlg25hsN9dRuUfDyNgDFr8tP7h0vkvdLOGARlNdCjxPV6SFGYEAgwN
	uWx/9Ivyt0XZpmU72w1TxISqvGCoR4lv67k5MBa7BNBcR17ynYGANjWGBxItokv7Lf8zZX7zzln
	sfgAvn5dGZGMYXyGsyqBtsj0=
X-Received: by 2002:a17:90b:58e6:b0:381:fa5:5217 with SMTP id
 98e67ed59e1d1-38a2170a4acmr4351523a91.7.1783618868411; Thu, 09 Jul 2026
 10:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org>
In-Reply-To: <ak_WOfpcaZIuh99t@casper.infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 19:40:55 +0200
X-Gm-Features: AUfX_mxQSr4PyGpetLCtfFcvd8ENbtSRZ87t7S47n2yq63GA6yMmASMYeu1Fh-w
Message-ID: <CANiq72nQ=BmM0GRVrcmXHfE6VqD2hsssxqJEE40TirDiy82+wA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Implementing malloc
To: Matthew Wilcox <willy@infradead.org>
Cc: Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 7:13=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> What I really don't want to see is a whole pile of Rust changes to
> accommodate having to pass GFP flags to memory allocations.  Would that
> be a better vehicle for the discussion?

Currently we already pass the GFP flags and support different allocators.

For context, initially we used a vendored `alloc` crate, because we
were trying to see if upstream could give us what we needed.

Then in 2024 (v6.10) we were able to drop the vendored copy by using a
workaround by Wedson that allowed us to pass the GFP flags and avoided
our reliance on upstream's allocator unstable feature:

  b6a006e21b82 ("rust: alloc: introduce allocation flags")

Later that year (v6.13), we couldn't wait much more, so we ended up
implementing our own `alloc` module and allocator support on our side
by Danilo:

  b7a084ba4fbb ("rust: alloc: add `Allocator` trait")

Cc'ing rust-for-linux and Danilo.

Cheers,
Miguel
