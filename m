Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2007470EAC
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303053; cv=pass; b=BrBBXbjZTbo9LjU533LGqHt2MSKNhC0An/9DwFTSyOySnZnVNpe8/hgiH4k6857fyBKY0qUcOVyTpBjnud4kueIuo7VcTcAGxQdTMPRXL5MTe2YSkVjB6pGBuA2Kg5kG/cu/krLEtZViY9xppU20IWNGM1w4bBCBRF1i6Mx0MKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303053; c=relaxed/simple;
	bh=VvAKI03UsQIUGCtxyHLAe9+ky+jwzzuetRGdfGzlXsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbKgkrC0n91aNN1CZHYHHVKYdTBAnWf6C3sywC15yNS2J4moIRZHAA/CuttiCB09QAR11+4M5rKTa7KAJkQ3sF3NuoCWc8tohEOoHQy2W7+KmxaSxP5e1Leb/7E8BHoM4epo/bGiVj/RLdSW1QDAi+ZUX0uKNuDJ39CakcRTfBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEpjkFBb; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEpjkFBb"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf110997efso1659685ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 02:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787303047; cv=none;
        d=google.com; s=arc-20260327;
        b=buM42jFBV418iK2MfmlD2pVip5As/3YPHiNvid+9DaSQBoHNta4jBOZObwjt4foECO
         J3HPniSIPfm+U/hM6SBri6EsvXlLu3aeQc7D+rEow0tnrma2kyt+CJPs2MmAdpoMK7kE
         AIwLkQTT7fVG65ZgeIEQ2Ilya0JZkXujrzR7nHcECVfD+moETTA8oqwXcH8Y8T5YITld
         LKGfV5k+fJLftoo9WI793QErNKuB16E27W0Ygz/rTkiJl2kWzFC2oHA2tfj+mnJAm2Pn
         TN6zwMFawSRaU06I6OmwAX8RB8tJlES8tCeZfNOkc3GvgUbdlD/Rd0kBaqL6UhPBBlgz
         nAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvAKI03UsQIUGCtxyHLAe9+ky+jwzzuetRGdfGzlXsI=;
        fh=i9GCZ+bQqhaRnpngjnExWqbg2CmuBJWqEX3yjlidNcI=;
        b=W6NLxi9qeMwz814TBBq+ggmvFOFcGFve6mXMrr+E4jMHEsp7LAmmOZVR1XpU+iCXEv
         3h3Om28GmN6dXntC0ES3AFUGVevaihtnzqQghYjatRE2Q/C8ZUiOS3O5+205QWHZ2BmU
         6edif8tjrVGOcEYZOIr6VBuZPLQy/0pHLsH4nPM8ZOaVcrz4W83tQVSAPnl1uxb5TsM/
         wv+2C5l/3BE3myR9JeLRupLKIs1d+VvG99OPmq1FqlY2sGfahol0zVeIzvwuGjtKN6QS
         Lsd0SPdblflZvNbvmkO6AndUoEkPy+Cp/KoefQondjozQTpO5ZDfTvui0fzNKGfKYXGH
         5Kiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787303047; x=1787907847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VvAKI03UsQIUGCtxyHLAe9+ky+jwzzuetRGdfGzlXsI=;
        b=hEpjkFBbFwiz1VLQFJHGJq3Pd2gbI7qY+KyHgUKtXXcifF3P86pXN0jOc+uftAP0tp
         wUaJHkgYC7KN5R9kZD7jVYyUhcO1HLr4mzhBfrpksBg9eh8T7ct6vPy2X2j1FdfrqHBB
         vkYrFTCDPCSaUb+1U0F4iVXMgtXfncdV1c/7SS2Z+Iun4UvQRCkcHIey4iL2Lz9PkIah
         1h5FpL9u6qZf435mxJwLPXKn03MNoU4VVlQhqdqj5zwQNzUc68AXoJhXflVSyCb9P08i
         dRG+UROBArOOhhucFaLNxNfj0NL5DXLRuP0JzH/6PwQqDvgO+DHdXlcFx8crcEkw0tiZ
         huqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303047; x=1787907847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvAKI03UsQIUGCtxyHLAe9+ky+jwzzuetRGdfGzlXsI=;
        b=cPZ1aleGg6qLBZ5HfIiiFelm1V9y5JpjWeqXIfrpRA21wz5xcxT2Kyu+1v9MdCl/Li
         NyugWxG4PMqY4MLQI1vPNZwD1hHwqd9ztSG9QJ1o6ozdn7987n3AAuLfWSKORoWoieBt
         rBpxerAR6LQif83DOGheWdBdp6QkNPGmwFr0DXItomDH6c5EwmH6L2PSDOAQFffMFgL2
         unxas9frZDPXj+fqv4bDZ3xYbQblNecJXLS+NMzWZZVxFLvWBG3AG40dqGxbMM75Y/oq
         zuRXKVyVV8+E9cYSO08bdCBH1Ey7Vi+3Ept45yWdU868Nd/NdsvtfUB1VdK/Hqd8SfKE
         1Gzw==
X-Forwarded-Encrypted: i=1; AHgh+RrTM7gSc6K4aEKGhgpwaCnkX4MsHsawsbCjBVfAMvphMRkX7fmRMeb+8RA3ExybRN2ImJETa/h8bm0q1dyPZg==@vger.kernel.org
X-Gm-Message-State: AFuF++ni+DV3ITuOX6+DPpCRbweOJqkpb/egXuOwFr6eCftcAGK1NQGU
	4LAOZp6sFyLzALTofCMMsHahzUmMwAlleFBG+AhiZmaZxXcWlK7pmb/cP3MBQWIeZvGGVrPm7Qh
	zqXKNBUG8T4h/t9EWmqsfe5dg7oP2fEI=
X-Gm-Gg: AR+sD10l5XpTsu+Pko+DvauS4tChZ64goJ07pOVZJptaQ94EROo6pS2DwAd62HheenM
	b4JE9C4LtYdFZ70uCoekZkdeg8mnmhOcKIHYeVpurFKXrpERths6z9RYlqIs9a0Da3zjhigRtlH
	+FQXncLfQRoYZpSPsGTpezZeZXbgJpBU2d+PiFkjm1M/Jx0+s+ceWd5z0nkwXIRSTntoU/FjZqL
	GIpMJpMliqP2J2WvfLbCkJQX4vuWtLoK31yUzsbDudKvgYcc0rCL+uuICd+bQIg5DGhgTzwea6G
	iSJRRBjAdW/SrnvKWHC4HTnu/mJJqpPTgPTSUC/6FRxqiRkHZ8OJvLPJiYfvB3avOuCyjC2e8GH
	d2Gf1W74yfp5r2k2gtgq4Whkp64600uYCr9ct5eQsOAAB17aTG2EOGjVPwJKf
X-Received: by 2002:a17:902:fc4e:b0:2d3:aecd:51f7 with SMTP id
 d9443c01a7336-2d64ae3a7c7mr46437205ad.1.1787303047375; Fri, 21 Aug 2026
 02:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-lockdep-kunit-v1-0-66ceb1a272e3@gmail.com> <09b0ce81-0071-4df3-9f0e-a54269d04c97@davidgow.net>
In-Reply-To: <09b0ce81-0071-4df3-9f0e-a54269d04c97@davidgow.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 11:03:54 +0200
X-Gm-Features: AcwNN1UF5lPYb4KttGv9cNqT5y8KhQwyrbryO6q90CkquGDi1vnrY2BN0Tnc6-M
Message-ID: <CANiq72nNVQzO9gUcj+Oh1xEBWJv1_YxKeYpNTdhoNaJyhvOtmg@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: add optional assertions to catch taint
 and lockdep warnings
To: David Gow <david@davidgow.net>
Cc: Malte Wechter <maltewechter@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 11:01=E2=80=AFAM David Gow <david@davidgow.net> wro=
te:
>
> My preference, however, would be to have these features added to the
> core KUnit implementation (in C), rather than specifically to the Rust
> bindings. This way, tests written in both languages will be able to
> benefit from them, rather than just tests written in Rust.

Agreed, I was about to reply with that, i.e. if this is a feature that
is worth having, then it sounded to me like it should be in core
KUnit.

Cheers,
Miguel
