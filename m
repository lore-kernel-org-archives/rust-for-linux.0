Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67147CC6B
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038627; cv=pass; b=RhZKHKCs6zqQXwMAw8V+cVbERVfOVNQ8F3pG1r7sfPNLRTgPLE8pzJvb2N/EH7XUAOc2NWJYXCpiHXneOx3YEqdu8JOPfulIAlCrSSoHY5lwf3lIIaviLoNYTgFLgP78n6DJN/MbR/sJECSFmJt5IGCJ2RML5LS24AmGApxnf1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038627; c=relaxed/simple;
	bh=VnJA72k9lL4Zd6VPQiNnCh0TjFUPY64epwMsyfCiVQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxL8kLLps0jPv2fG1wpMgUNn4reWMDLmLzNWE94OtiTr8SS7jV1yK8jiSaOeIjOrzSALQoGls9BrD+xcYa9vPuictqrMPKIVvjER/tLVcJmdZQcRCB4tkuIi0m3J9oalB2YxYAlGAm7WsZIWorRi5n2hjpmpOBj4V/kPGgb5LSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWtt+BcX; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWtt+BcX"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38115bbb83dso362425a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 07:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784038626; cv=none;
        d=google.com; s=arc-20260327;
        b=WNI303Ny33qYItQM9c+iljAnUMn/6lYtM9NUPvPkmoiGLKDfYlqta3SmAmahRVsuzM
         4Mw2XVEG7rpD/jEf3Ew1iJEgJQlYGKeP9k0j8BIfwrGQ3sphLfKTtjWpyL/UMejVnxBa
         D34x4GqW6HlvAfiVWTg6GntLPlvPm2jN6L69ZalXDngts5kpqpsWl2MyGgd4B4l+T/k5
         Y0qyxl5lXe23/SzFJ1vU3oQ9dj/0AZysULxwxkjZT+DGKWlB6KZSp0dJC6QhsonuhVl/
         eQ6PEWZpY9y2WjmpRov+Yh8BU5mPFrlExONndSj2yPqIAmI9gsDN7M0V2xZchAUlJD6Q
         mbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnJA72k9lL4Zd6VPQiNnCh0TjFUPY64epwMsyfCiVQU=;
        fh=ygfuDLPBftCv+QcsK3dubgCt+Da+7lhrbZkmAsiH2Yw=;
        b=eYYQ5jegbgo7vJXOuqKBpMBZ5fuEqF+GQdSlP8iPVeZzg2wQcApV1sgo1oFf/jTQsM
         U9pgNRuvrn6MkDSeN5v1oi4LOOiCu3CSranr1Rdg/gOon5k2XL8JriLHr4QwCRtbOFCz
         CvGY98mcjFjzDsaWyKSFQUNhPDy7TtSLQsx86nad7GFWl/hbDibYI/C8DmLdFznGh12K
         b3AbZXBA8WeRkREN2wh5PFtIJkIplEGohlE8ezy1Q6m+ihyn3J5M3O7JpKkJ01tHXeAL
         i0dBm+dhiaidnY69tlv2FImMIVq0reaLsUWcxqmnzJCBrpOcRHrZbQyjSor7oUJ27TIA
         9p5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038626; x=1784643426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnJA72k9lL4Zd6VPQiNnCh0TjFUPY64epwMsyfCiVQU=;
        b=gWtt+BcXhKLzsCbQ5S4HP98wQurfRJLkwGhecBxa6BoNDhwgONWqe0sD/9vmBiD8b8
         sXYoj1DB+O1s0DZr4AhirazwzsGmTe3DksJGRj0mk5rbV0MrotPVx+rhL2xu810xFNG8
         1KRhHoJABZbeZu2J5/1SUYBT6A7udOZhCeDHnrqskMEkuxRlL2eFybDZrLOVEzI1gxa5
         pdqSJwBia58jVBXR7rNAY5ItMc8731cuVTowM0JLC0tUKi4lQU5SdXq7sxeD2EBbdrd2
         1K8xir1KT0bsn+ELhfqqYdXvLtPACwrvsZTOxIn7uo9GJ3iFrYViUNVl1NU5EgcyM8ZL
         FUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038626; x=1784643426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnJA72k9lL4Zd6VPQiNnCh0TjFUPY64epwMsyfCiVQU=;
        b=QS1TOmQJIhMFOubRPmvhRQoV0xHerhA3dgOAYlJhSidC4xnMYQnPTDJ7LVkUMT5W80
         cO5RSc2z6J4MEKEBAHTKP8tpsRVBs8Lo5h0es47yoW6Vi+O0ALsE1qUuBKQCnXkHaerx
         jIEE3lgJwqp57DwS+s3fhqnze3/ym/dstoVcBMgu+NHvYrWF9Mz8hnjRwTDwpDssTmTX
         Lu0UGlFTdHiOdntP286H0D/hSUIs1XrPLVpaJJWeCi+wqvzOWkRNzu8PCYIOvj3UkqAx
         602UEZLVxhUmvY3ut3F5lCxdiYWODHWTKc977duBsnzptAggEQ/YFADzoN/Htp+kYOkE
         ARTA==
X-Gm-Message-State: AOJu0YxA+O0uiqSrRFGxb3SPKX1o5VNtXCYTN8ZWHdCsW5WBvKdGtEh3
	F9a8iKWkY0zCPuF9DNMWwRsNX25c2Lr/7RpmrBV8YYnQYEmN7iJ5+BJ6p1NM9/DZYXPLzw4fD//
	5n59HrEeFQ74O8abcvnlNXt3R9PasPgU=
X-Gm-Gg: AfdE7cmLA5cEBUh/yHNb3s6PBQIQX4o/suJzCCQrgDW08AlnKHlPoBR0irYox4YEN7j
	hVfLEOvaSheUpBp+UbEA4v3eYlNmzg+l+Ud4qKPHrMeklhOh/VBed1yIWZmwtSZ3B/qNLrFY4zC
	z15TRbOugd5AGnHyGwRXDV5/K1zVT7rwqe17ySEPcBfOLDMu0hdVp3eavWMeE3yjmlzQC0q3oJN
	4B04Us2EfzaCeM0QSkefscaYXRQ1UCCMihC4cMLkm7Vx3npp4bzpNb9P/kX00gD6n6XCd1SuS8c
	703EpRhFhl0R4dUrAYOjnX3YL8+SCSJl2/I1nCO3zdHbEEB2hi22zQXxDRMTPT8g72ZohJpvgCR
	SKyxFRtNisC37LbOZuZAj/ko=
X-Received: by 2002:a17:90b:3d87:b0:381:fa5:5217 with SMTP id
 98e67ed59e1d1-38dc7848a6amr11189317a91.7.1784038625887; Tue, 14 Jul 2026
 07:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714122441.78158-1-litvindev@gmail.com> <20260714125259.78824-1-litvindev@gmail.com>
In-Reply-To: <20260714125259.78824-1-litvindev@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 16:16:51 +0200
X-Gm-Features: AUfX_mzFPZk9PpHhv7x9B2f9p_GTrtCF9Xo7PNZ0-FE2xRr9i92ya4ea_fGHoP4
Message-ID: <CANiq72nW+oPbmXpahnRAAz-tBD0RK1qAU9FP1=v467JUCX4toQ@mail.gmail.com>
Subject: Re: [PATCH v4] scripts/tags.sh: Add support for rust source files
To: Sergei Litvin <litvindev@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, nsc@kernel.org, 
	nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 3:01=E2=80=AFPM Sergei Litvin <litvindev@gmail.com>=
 wrote:
>
> - Fixed list of "Cc:" tags

Just to clarify, I meant to Cc in the header, rather than add everyone
as an explicit Cc tag -- the Cc: tag is (usually) meant to be a more
explicit Cc to indicate in the commit message that the particular
person had a chance to comment etc.

[ Some people do use it for every single Cc, but that is a minority
last time I took a look at it. I think it may make things easier for
some tooling, but it adds a lot of noise and reduces the signal of the
tag. ]

In any case, no need for a new version to change that! :)

Thanks!

Cheers,
Miguel
