Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA9377EC6
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985931; cv=pass; b=CdaHJwGvwPMUXyJKJx8A/7JJEV1BNSB3DcKNWBHXMlUcgBHbPay7d7SYc6lAQ9v/om6EPXo+YNmqD7Qr41t+VqO7227ScxMNTwpbvJySNfd7WlizovebYlOmX+wztRt0cJaVQSDkPJV+AuuU2tP561CuPXGSgWL7KwivYh7rV2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985931; c=relaxed/simple;
	bh=EWmFQ5Kd6n/Mh2fLZpbGLajAjPnq7ycmuxqvcm0e53g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6hRHOAqoatK+L2J2P/MnxU7h3bUPDzAH14IhH2x39P9pRdhw9jL0GXqkeWK4B9yWe3yjePJlcmcBqRY6RQvE4XtGZJIOJod2gmViH7WgahjvzvIDFN1C0cDy5wvLlMHgsyd0PIyZiFzxC4iH/PPsZh+1qMA/N8kB+9OdD/VI+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Or2GI2vG; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Or2GI2vG"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c16cd8024bso163704eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 12:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774985929; cv=none;
        d=google.com; s=arc-20240605;
        b=DChXq5Pn1uYUtcxn6U1VIBKlEZnPuPEbrvBmIk4muNYxmzUOoZXX/XnN9RI1kjB/jd
         H66G3Q5lp1eWltT3Qx/dYB9BF1zZUHaoURrDX3ayjJT/UtOLrZRckOSt/0Azep9d6u9q
         hR56T1UpIEj4O+aKv4M6C+I0aHMYP4o6yL9iBlrlHCfg/S1vX1BtDAXas9dMJX3ScqIR
         8HQacH3mvhmLHulpYjDfUuzg+zo06XbNE1oul1Ua+WQOFyQac3M6rKXF7GfJKiPtgr3l
         DtJTZocBiAxAuW7FUCZ8oXRgBzyBs8x5+ut3FWQ4jhkpM8JU27h4+vSwij+2oVKwgDnQ
         q6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWmFQ5Kd6n/Mh2fLZpbGLajAjPnq7ycmuxqvcm0e53g=;
        fh=weiD9sUJKip5lY31XFA62sAX7Dp+2OTfL2neniZN4eo=;
        b=Mfiw2kRdm+Pcgu4bycG7V5w23pt0+ij3c2kFBU43qlnIM2ZWEe6FbnW8HxcVU50omt
         ySehAdlKbTUTyqqVysbNSUhGIFmYPndt9cVki+Hn1MZBKYXeACxdqZ/p3XpQksXnNLKS
         vp8QOR0ujyaWjTc46BzSaTrTnDgAsziViusbP45V3rBI5ai01w1B6m1v7+ESQAaFKEZF
         SRqwgPOwVMdBUuqCyf8D7iGsdP1EfBkmXSf9LHh8ryoS0GSwPSFm+u3Kwef2U/cpBR0p
         wtKVuN3MFhH6pTR6fmhhCgU7gSNicMIy10ruMuZ91G0U+oYusH/VjoD/f6BNH1qheMQt
         4RNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985929; x=1775590729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWmFQ5Kd6n/Mh2fLZpbGLajAjPnq7ycmuxqvcm0e53g=;
        b=Or2GI2vGILx/0qc0yPMWKI2qc0WTG6G1hC1l3faVsWKj69lCA4k3cP0CHGqdI9cxIj
         yM77FHKETS0CZmQznWtqp+xJHbI6Dy2WY5Nkzdnx7zVaAWkxwR9bbU+CzxUFEzJrWUbi
         CRNydQenjqxsoEoeHgeAQv5HarT+C/CWyWmcxUBU4RMrrLjOXUh7GNSZHgIw0unvjBYV
         FD4o9Sh2ozbDMe45lxT6shNCGBHI8ExWfd8XtLnCkvJw15EQ4b29vFg/MZy2l9nr5OOn
         L+Eof88UUQUEI2O7T+VQC1EIoQITTYh6VZgZbgFviZp+2cc/tQeAo9v3o9pIXMmnIwe6
         PiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985929; x=1775590729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWmFQ5Kd6n/Mh2fLZpbGLajAjPnq7ycmuxqvcm0e53g=;
        b=cUweo+UlfeWBoHsVvD9gbdnbFXvC9AiTbroWKXBcvHajwGFSJo3rxd4tuJmpdCtROL
         xAdwfybOjSwiRXMogrU79zQImRYH2/CPcrFi5vHyC5OnLRTQ48U5xvFz+yKSm4Cop+l+
         b03d9+eSz2pkiVz9gTE0LhSe4oED0g/deKIzPA7hGfYjEGPaFU5nQHOyzBoDTHp717OO
         2Jq73UwDfbl7C4kKrz9YSSHcZGqdil0dzuvFpPC6KYN7mItetb9vWyw9tiZDsvhL490Q
         40J8SGpLRSqy3TVzQLfG7znvMgXTOcn2nKAA5DIjM0BDUYP2uLZ8WOk6t5iAypfWBub/
         pkWg==
X-Gm-Message-State: AOJu0YzNWt7jfzvo/gzJ7U/pESGUKtQIyOFNzBDVsNlZrmOpldZx41L1
	cyfD4DX793u0NhGl1/40wv8teGqe32YJCC91iKjcHOrixFj4pxGGo+HtFHVQCfOyFKWdITDuzjY
	6FyR9BS3tfFnaFC7n04ukhiBIYSCcVQI=
X-Gm-Gg: ATEYQzwQ7ecDT20PUZwRC4MxuuUFmQNU6nSs3O2SaUg2/DnBhwZPkBSckZv2ta60bUw
	k1xjCCzC332MUqOU3WIP28y7wpLul1OjY1nehWmriXUVCYfaSbUwEuhGYLR7MUr/8S4D+v+l+mG
	5vngRvtEPGdkHMST3Z0aFI//4jpJYpCX6mFzBJFwqoXmabvImvLD1X8qGrTCHHJe7wpeLhEiLlI
	6Df89nMDS93p+u1Tr+DLgabU4IYQiCN8uYB79YGpFSNgyG2QhWtZ7gpphwV6Gudc4X7Hpa6q8qr
	bpratKNm9w+DdVvcmIfj6qB0CnvxMMpBCCKqkI2ITWM4hhxRPIJSGnleutxUIXXuvorX1woS+bt
	MnVKZOyYf6cey+dyi2usc52A=
X-Received: by 2002:a05:7300:d70e:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2c930798a42mr149039eec.2.1774985929047; Tue, 31 Mar 2026
 12:38:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190308.141622-1-david@readahead.eu> <20260331190308.141622-10-david@readahead.eu>
In-Reply-To: <20260331190308.141622-10-david@readahead.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 21:38:36 +0200
X-Gm-Features: AQROBzAjHpcEwa8jcHc0HunDvfF6NLEeNceBT3Hv6BiyjtgFkae89U9V6iQ7k3E
Message-ID: <CANiq72=LtOc+m6hJwDRgwjxqbY0dpibzfAQ9HsxhStUm_cDr+w@mail.gmail.com>
Subject: Re: [RFC 09/16] bus1/util: add field projections
To: David Rheinsberg <david@readahead.eu>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Xiang Fei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:06=E2=80=AFPM David Rheinsberg <david@readahead.e=
u> wrote:
>
> Introduce a utility module that provides field-projections for stable
> Rust. The module is designed very similar to the official Rust field
> projections (which are still unstable), but without any requirement for
> compiler support.
>
> The module explicitly uses names similar to the ones from the official
> field projections, and is certainly meant to be replaced once those
> become stable or are otherwise introduced into the kernel.
>
> However, until then, this module is small and simple enough to allow
> very convenient intrusive collections, and thus is included here.

Cc'ing Benno, Gary, Ding, plus "RUST".

Cheers,
Miguel
