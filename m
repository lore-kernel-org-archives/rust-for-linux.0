Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31542F8EAE
	for <rust-for-linux@vger.kernel.org>; Sun, 10 May 2026 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420757; cv=pass; b=F+kLvLd2hsbzh/5eaOKBwhKmGWFufIoWzIzeL/1A+UrHdA0CbSeRU59RIM0yRmsDfitdOwbtwslmpJU0Ufv++aHbWBtFW1hT45koZ6/U44izYclFnMswzk8YSH/pwYjiQwDhsYuSgfmqISl1QTvfBxz0FKLKH3XWOkjrXWVNAZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420757; c=relaxed/simple;
	bh=/0r9gEMWWFseR2mD5AeG2GrSk2Mqp8tLNeT5+4Waloo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3abtjJBoneQepxZuUljUX96BWnc86R5LNyw2yWHh8XDGSCa+axUHqkISs/RUNZy1eys4eFTrH/BrL87sNHhR6nDVUajWN0KBngUYHbCZ1p/EHCUXn7f/2QmVmCzx+tj6WKhnT7l+poW+2Grbors44ahRPbi2UwuE9W7ztRs1Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeKJSogf; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeKJSogf"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12dc1c0b724so324856c88.1
        for <rust-for-linux@vger.kernel.org>; Sun, 10 May 2026 06:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778420756; cv=none;
        d=google.com; s=arc-20240605;
        b=AH+FuQvrPIANKVTJn/VeyrbRH2DCghRl1itTcvs1ZB2NufGOfZjMJfIyUgrBdrZZuz
         lM6D3lKpDUfZskU58G0TCe7aeG8rL0eHUURaf2IhLqP4aqAueGIeuawPho1aeW1db6gx
         14xlaQFlJJeUs8ADvN5UwcTIDlUge2eLziWsHig+BVl2T8/of/TIa2M5US9aNLCPdjbf
         c1vG4zkPFacVAEJPNd3S3PBXaFb9zTDobq8iR+Fe4EJ1aMxj/5AjOn31mMaWsQ11EIZk
         kaQ1RXQ5hz+tlXb1a440S9lMEOT8CZxz9YiD0YyPmQYjQCOgNawBmMldq8TqrIzMs4Ni
         XfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/0r9gEMWWFseR2mD5AeG2GrSk2Mqp8tLNeT5+4Waloo=;
        fh=fTp9WxN8IIh6p/RKy4Z24SFBVbGGe3xKdNtmhzh8U4Y=;
        b=iex+GVNZxXsWBtNfSVBZDuhjWUK7VIx6hc/GYXCHmt0CvNyyNGBIZ5TQNRGo2/cwoa
         gqHyASwrwCAGINYOwmxZwvU0Kbgbox9QmOAVvme4cDfgq+M55OqELMsCNUTlbnl6Ldkw
         HCpGipceUR6QpHwGqVEU0PZcxB+6ts0d/tf6uNQordQLh3C9n1QNZk/Xq/FqN32plhHG
         6qxTw0n6NT71UUlC8luK2N3SI5VvTs+HEHGgOWDfIc/nEH4hfaDh/yNMLr6STGJ2hPRj
         G54PcDi8TMXdkEELvvW5EYcvDbuRZ+R8Pl7zevV0if7PA0ze1kvnWCGuKVGh/a7IByOT
         Dmcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778420756; x=1779025556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0r9gEMWWFseR2mD5AeG2GrSk2Mqp8tLNeT5+4Waloo=;
        b=PeKJSogf6k481rLIWyu2fZxSucISZnuuFE4K2UGREXwz3/+JKxuWMB6/QPvm/TUtMm
         TSHBQqHgycvwM5LvKI1rDA9It1me2p3DorDt43cm2QKgnOALglyo91hcRs/rmClfsEPO
         A+2a8Kxo+eBoi3EENt7e0Nt97Nx5KPQ3JgLUy5tiPjL3rRyaBKL8da5jZuvcGfD0nkIN
         crtZCpd+POH3Q6odMUoRgvAMpo3bLk5FTVTU6btQxDsvDxH8TRcSJoIMxXjmURw/YLHl
         5OCgr1aRFPAtWD0aFtk+4ym8x4UmKr+b4tGdV4kNaMffqtGPtBXKg9L+JicOMOLRV+zn
         vVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778420756; x=1779025556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0r9gEMWWFseR2mD5AeG2GrSk2Mqp8tLNeT5+4Waloo=;
        b=F8ZglBh08vY0YtBqqc8tfArvbReg6jcQovC0s83cNP50raSwINf+3VmTE0mUG3BDFG
         Iq6I3ky0qXFa2w9yFqHHONM8QRNZwpjI+i2mfVL1ZY/6gnk7jY1BI6tX6JRBGupUvJve
         3+IPOj3+Q2+dlB06aH+j+bodWoK9BcjjMgyxkB0Z3y+Fc0+mPz96SIcxAp97BsrerJy3
         TwSekfK4D2ZMCliiRfGdChHUZx7IMUryTiAIPYUkbxaO2wFGIEb0ffjIlBWNJR29D12Q
         19E9LTtxuh4/ZsBIV5z5yI1PbQrErMctqG86El8e161hDzvAUyVOcgAMir2iYqbhbpF8
         esKw==
X-Forwarded-Encrypted: i=1; AFNElJ+1M9A6YOakQI8db9WBonrsYMMAH31GNnp131Y41cvw0v6oSZVBRDmz/iesgVCwC+hdFk2uiQTartwkw1pBrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6fM4JWauyMl7jYRW9oS+eK5+uhuvfmw1yU23Dlw9jxmrIBwFG
	+7A/OS6fA+gv5l5p7WT4QbaPlIx6sf1MLwiLa4mDneZWL7WlWq3wTldGQ8zzcg9vXGIVX73k+/m
	lHYr0XNdZdapSydEY3CWY9OgrkntX7+U=
X-Gm-Gg: Acq92OHd/VVuRDxeOvUtx02bAGJGkTFtMqituGx4gz4r9pcnRz1MDRDQQpd5JB9xyY3
	r7RJMT05p93VsSEdfJ/Z6wolo2c0zz83TYVJ4o6zIyJ98axc7YoQoY2bM6V7gTkpA9E1uVzwI2n
	uLxmkO6liJLxnQwzeHMtttdntXuSqdnFeS/by4Zq+I4Uo7LaMMq+ZnNseapbHsYhlXeeQp4yUfm
	QiskSxihr1Tdb8kDkPy8pn73vbFIswykrteZmJ3fhxsLsg9/6HAtBxoBL56eeOUY5qHWeioEzmL
	RyqEN7ruSsIerTJ9BsAcYjmdocpV5h/iI+t7VDmiIO8A59NFbWh2vRuw9skn2GHt6qe/X1IxNHU
	5UpqIzIiFX11TVnKFVbtIWaM=
X-Received: by 2002:a05:7301:3f07:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2f54bd97b6amr4813505eec.4.1778420755676; Sun, 10 May 2026
 06:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510-evolve-to-crab-v1-1-208df84e67be@chaosmail.tech>
In-Reply-To: <20260510-evolve-to-crab-v1-1-208df84e67be@chaosmail.tech>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 10 May 2026 15:45:41 +0200
X-Gm-Features: AVHnY4IDHKvJkaZ46jG_gKvwc6MLn6d7jrBmVNkVnQZoJbBkCpudWaBoflXe_no
Message-ID: <CANiq72mHGsatZLLiXAzZnKOmktOutQbC9bs1VexKm8yJ1w_p5A@mail.gmail.com>
Subject: Re: [PATCH RFC] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 3:36=E2=80=AFPM Sasha Finkelstein <k@chaosmail.tech=
> wrote:
>
> The current approach of silently disabling all rust drivers if the
> toolchain is missing results in users that try to compile their own
> kernels getting a "successful" build and then being confused about where
> did their drivers go. In comparison, missing openssl results in a build
> failure, not a disappearance of everything that depends on it.

Yeah, it is quite confusing (though it was done on purpose).

Personally, I think it may be time to finally change it.

Cheers,
Miguel
