Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078394;
	b=iuWLuzuwSZTeI5+u89UgZ/ceOXuHtQ3iz19z8ujINV038NkrZlDxhje7ciCEzGRRmuxN
	 3GfDLou1x/n+hMC0FsGC8Dm3RRDdfxC3KQHsdviLwAHYuVzQNAZBA8CS3yRZpRlPmcPkK
	 H3Zo0cfSIcFlsSoEVPfjHhXBLa76dJE6+TrrpBxkwK/jW8rfRecFYPsvGk7idtlehbEsx
	 jnAZOt8404jpKUkgH26aIX5fpfaaMUSQt0Ed9Y7WLeqCkZCQXcuL5GWd5r7a/rwTM+iHZ
	 +0k97fXeqpJoCNeFenF572R4T3zF2LIdOaNoSDuZwwQTDxZ618EEekiUqKJV6FTS+KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wfP9MO2UqFb8Vm4Vt7CpNERZfJaN3jidxxklx2/WXmo=;
	b=KoMG6XTBPdMZfLQVWQJAP0EWH1s5nnWCgRvSVY7XDbv4ZR/GSIu4aTIiZMnETve9vtLP
	 1jgRskdkhk02VcXqik/qkfE8vTRpDoSY9EUN7AhtR7jTHQmquBmqS0wykTXtfwe3gMmGW
	 ZtyzJTSulurY0EVDWIH8cNOpH3lWXyIu+cI4/SYptdIZ7bvGxm7YN6DxEj3NKKnQthwpf
	 gzo26Oo41Xnu3NGLknSQ4OaslW2wmIFiVCxQuTorzlrw0vWBbTIVZbncsV+F0oqhNS+l5
	 lxm2y7t12EUhDol22sVUBkhuwxM85sMEPHKo2amo6FHNg9UKLv7PEydiNE+h7CUK/kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hvk12pVa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C865606A326
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 08:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C865606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hvk12pVa
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49412eb1474so1199380f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 00:53:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795078393; cv=none;
        d=google.com; s=arc-20260327;
        b=GQRqG8iOoZoiTCfkr1WZrzbNzLKdapiNa2VyYQck5AN3RU08mFsgfgXoUGUOWWqpXk
         nlWYHFUmcfC2OnLa9v0zEJO67tHaT9QK1O+X1MLwFqlEdFBw+8ngO8MMOb1bawmcY0E3
         L0OL1yC5ZBRp+0sYmqeQ+W+r9i/+tjrmVrkQZ3Jyk0E3aovuvkD1u9jEhWUC7c8Sh+Rk
         m2XeYuXesU9FN/QcxlI4UNDjoLO6FvyWXty0v5fjUgN7cmF9ESym5N4o75jeMUi5qIVL
         pp0m7EaGJaYnhKafu0PDA9iXsP5FXh272uKw8OrpkWdL8jN2QIai/tw5OCJP61slvAmW
         qHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wfP9MO2UqFb8Vm4Vt7CpNERZfJaN3jidxxklx2/WXmo=;
        fh=c9V8ESl5a07ZEgwRm+h8B/ufSdLNaH6IIvY3wZOMSM4=;
        b=RkAeFhMybcCae/V6oNwiMz0WUarffKK3EpE6rTK1Kt+JRarCiJpONAuMCA68NsW0RX
         jIVXnLi/Yfh4yNLIYVFHqQfD4614jM3TYOf/uh7c+Rd+I+WKADDDtdNubYV2kBprCUhF
         mvFJUBQ8DtLCMTBaSEHvP0A7tArCJ9oPi6W5fzLX6aJVJms3OgepzLHzTmIN5cxZESmy
         sqwyhwmYWqejqUUFuPaqOg26k4FdM06yygbWt6YMVtM05N8SxKlYpwgXf8qAHM5XHXvA
         7sOSCylatwwl6dsEUw1N/ek4ojUDm7luGqhPTRrkjG+9yMcCtP9RE7HiaVj0U3qGwZLK
         j15A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795078393; x=1795683193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wfP9MO2UqFb8Vm4Vt7CpNERZfJaN3jidxxklx2/WXmo=;
        b=Hvk12pVaWSUpS5IGqzjYVweLfTNcFXLn2RSK5tV0Kg+Zi76R2QEvyA9d80HY5lz2Il
         o6C/CKbFqMUTpB9PNHQ7cp1scGSOLK8+z73Ratq+lymmh0+qc6ZPiEegSNCUBgcT+m4e
         ICR/C2gLaW5OrbH0CAXYZ3IA/E8j6mUgHmOHRnw4axF1fd5G0ILfJAybiza1CGntuiCu
         cOljNS+Do5KGJtl+KKtTRDSnDguA0+ekZ0/B3DhXSkn+J+GpUxsAN2B7ZoVcaxaLc25X
         Z3UdyPBNrDKGHGEmFBZ8bB8Q70O4zgZZkhiBDA0r/dtHLyNVMUNRpH08KSG2NikS2333
         qdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078393; x=1795683193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfP9MO2UqFb8Vm4Vt7CpNERZfJaN3jidxxklx2/WXmo=;
        b=sjNWTjlcPmDe7I2Op5Rhd/WFPb7oEO9AWqIoXbrrdviOU85f1C92SpIyLT5BrD2JFD
         Mk/P/72l4laxbe8LqBxKGMxTPM/uIPgEOKU3wgXgDNXEIGi/ioY8PbIGWW+LoI44yZz6
         UhPZzMxNEErUr8ntPFn5Cp8gaNk8E3gzU7xs+6hq31Q3vn5OdSMAvKzMKI7J1tY3k+8t
         B5f1lOOm1mAHc79m2dLXQD2SwzzK8TVY3Q0HRrkLXWgFFxm4nxu97KJOQ0vV7KdCw40w
         H5nTW86EYa4qN1GuhbN0Sd/igeAzUEc3O5RCrUa4PvWFpU93W1dwmcRhH2GoNqQ1R8t+
         kPbg==
X-Forwarded-Encrypted: i=1; AL+hErE77Bwg6in6xUt3ngV+aC4gjsmZ95Q/J32PLdZGoX+zkH2xeBZLMG3aXOO8zuDU3f2FX2OLYo7PWA0RrOF0ug==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vv3RY2q3NYhKsxWmfPQXGgay9Y/JkPgXwKTf0q6D1mUE4Rzgl
	Gc0GJgzYb2d9XMtraujRj9MgN/aoH2uxxWG5wfjdP6eDHxq7pFP7g4p3dh9gTcXPEuTGVw/DMA2
	9OFr3teYDxnvnSKhMy2iwGEgouT4zecwWndeyns6/
X-Gm-Gg: AZFdTZekImF/vj8IiQ2BtrRzGtAW5i3Tr5MAPX39F3mPsfoPiZl0KWLFAJqiC6/hDmE
	sP+pdofrJYToi0ifvxZByfnB90h3hNUQIQ0+dpiBz9cERoL6CsdmlnwHhGDEMJz7yJWM97x69yp
	6XZxyRqxTOvzQo457pRXR71MrniHgfy/2M2SZMGBEW4RkgMdKmcw3wD82w4+pJGHaauyfuWSyJg
	p1opV8iCH3Z4voIARghx8wwtFHryDhO+8XJeO4y7HozoAlIeMYrEZtNg88HWllZsJ8np3RXxsPW
	ylCxFb2x/0da3+mp3jVd+QaIVfaI+vVMl1RXBi5DblsfQyGo4ZtWoI3hTg/lyQ+qEFc6qELIyIQ
	1HmrPSu+OvGHNlDtBynEOMcm4nwxOpwENPCfq/ze00nI23ZIi/PUxxBcXGmakafL1LYRAci3HSq
	0gQjH4MLad3OPX4MHGwSKr8OJ0Qipu4Sfcen/PxgkF1Pb8xw==
X-Received: by 2002:a05:6000:200c:b0:490:411a:1eed with SMTP id
 ffacd0b85a97d-4a63d2cf93emr11007405f8f.39.1795078392254; Thu, 19 Nov 2026
 00:53:12 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-formatter-lifetime-v2-0-e216d86ffb57@gmail.com> <20261117-formatter-lifetime-v2-2-e216d86ffb57@gmail.com>
In-Reply-To: <20261117-formatter-lifetime-v2-2-e216d86ffb57@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 09:52:59 +0100
X-Gm-Features: Aa3M54qWXf-BecwMhD33FC_LoK5lSzu5f6uP1S-mq1j8HfpLtedDHeIgEaf3kUU
Message-ID: <CAH5fLgiye2b7qVDLRgi1rZaOKvVb=V2u-XbrQEH7PtB78+9V_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: str: add an example for Formatter::new
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Georgios Androutsopoulos <georgeandrout13@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:57=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> Document the exclusive buffer borrow held by Formatter::new() and show
> formatting into a live buffer. Check the number of bytes written and the
> resulting buffer contents.
>
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
