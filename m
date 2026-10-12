Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A656249B458
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818488; cv=pass; b=YyNXtaGofdVwi8pxwTAg4hJRBeCBoZE1qDBOwgjuTuExyGUeI711FXu+c+XVvhgTEcBcA/6ansB+n8PcLBsLPz/gTcCLpi5rBns1dV/p4ybAot56k9NB3/jEALXFqw/zcbQcLnSPDpPa6wuymnfUhPIEhvMI3HYRiGU6YkbV+O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818488; c=relaxed/simple;
	bh=acXxdYNI6vj4GN6tEYHBYlbXzhzxGLnqPGYWn+EXNdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsEteM8OV/mjYEAmFKJl9/beSMtwifypBlOQtIAJmCnSHPNGoGXuLonW4Z4tNhjIEgM6+aswEHFUoF34UZbJ54lCmcDXYRU8YIxyC5aPD6jFlyXS6Z/ly5Sds+BohCQK3xTLbU0PkYduyxvck3KgQHz0Wrk//M3AWCK1K/f8IAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9UVbICO; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9UVbICO"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33c30fcf33fso265247eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 08:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818487; cv=none;
        d=google.com; s=arc-20260327;
        b=Adg28dtrRYeGb70Yaq1vwOStAH0psHh3XCyBVmOLWLs2t8RY98VO6Z++7P9sOM5G0A
         hpHqMeYxNUkjRn5/MAN0g4IyzJm4UaFIOId22YAKFVgMjzqaiXdzCh11O4ElNnZxzdTL
         zHlgSk83yNp6YF+hmaQMeNHCehBC6M6Oif81tXYLpRSZywe7zjMgdsKSIQ0Tm/Sw58FH
         lKHryUndrIlXSYYsxG7mMh7dniEKj0mdux5h362X4HS+UITc9hZ2wTJRsUqa7XQZiTqU
         nDxsoEO5MSq99Oft33WD+6b4/r7AsZ606RjeIZQ49pTFytL/egdRnng4560Rb282aFcX
         Zgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        fh=7aYJw1woH1T7fhfi0FwW+p9waNXmWdrHGILksWefUBo=;
        b=HppuMFu0TMnnMe1XOlT/ZrS7bI920kWkRgL588xGNixWW2F4IidCnakUjFF/wSBGXy
         g0TcTT2HpsfHizZcf/rPpB0dqKxPViaAkHUnX4aV28qb2wCVeWyd6LFAfuAiOqPPmxEg
         62sDNJ52pDoLDRsCmRKqL0h4ZXlaeDGB+RW9iO8Dwhsgn3/gyqMe3pwwajhl5jd8/pqj
         2qYIpiNpsTxUYUCW5V2iwrHpQxQVvO17ZcWiEpbUPOPrYwbITyiz9xt1XACOat6Phf2q
         r8WPTc1KJYdZ8yPBWaX0n9SXfMkm5L7yn1XK+khfiGV1Yoy/IWSZnXBIyNgwk3P0hW2s
         TI0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818487; x=1792423287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=V9UVbICO9Vb3G0dHVTiGb8S4WVniQxs6wmTmPNcXznYmsWz8kd1y+k31MFrHAf8vSr
         F/xu3g2v5JkYjvBeTbKIBSPdbOMtozVeZwNJe/sneeG+41EP6qmE4OlR8ZAft5Aw3GY8
         5QKTN1uz326YnQuvFOv/Dh4E5k3sn+Hyqa94/cPE5CWDlxlTTKSV8V6mLrRTozIwWcOH
         sqHovpjY6+6o70mawD+5zf6vV7GcNVQJpS1asU3zptVn8fG5vEtRCymo5tXcTJVdT/dg
         aOQpLbB7ySZzkjVQwzGgtzrtANP0OAgkCKgoS8RaZIK8+EPmpQgit/8WHVOlQr2kiIk8
         S0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818487; x=1792423287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=utRCNSyNzT7bvnKamp2P/2ILjJ79tF4F0p8PPFatdR358j3XgOnTUWZSkQBgosxRxO
         EOKwf1KwAR01wRStqiesKGeJppvK8vPkadrDWhSIjIDOwjGLqJ1XiL/G+tB8xAuzKwFB
         dgAPP8X/I4jPGMnAcysPwqEUAH3O+yD7mY0jFPtsE6E88Wnmq+/9SBDIONCOAMjF3NUc
         9pLYbD0j107c7O8FduzG6wOQRr7invsX3wmMHCjq6JTEWX2UTemQkCawyvYNK3uhZGoa
         EmfFxBDtIp/ppfTkg0Pd8xoasJUTea2SSJoNSg/tk9fnRBR0j8MBslcWF7eQxPXkAw4H
         kM7w==
X-Forwarded-Encrypted: i=1; AKwUvBw/5a4MsmUhSKDvj+UxoT0/dFUz7EyP73rODc1KBkdIv83N933qRp1BKUE9tMraZbD3a/juGE87toqR7WBGYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKmigat73YPAROSo34XvsEnTH5jDsW6n8z4fRZsVFYY20zq3ly3
	odI4wFB3n3JDryV82jU/jv8BuDBbBvOvxKTUDHIOORcBLcyDR5PpE4dpNdK5yRsooVbhkqURaN1
	V4t9AMSL3cpjnWnF887q4/8pFcPWGNT4=
X-Gm-Gg: AYBFou1y84YZC9lHofyflLGgiaA8mLw/YweB3j6rJYp4SLUKBaJv8TI9xwGH9wEqpVw
	gnbo6LmSW1GsOxkYG0xyPbil1nBekcQm1om2u9pdqIb9lfoW41BhDzAWi6+2hKYyWKMjTpAuMsD
	W0eEkU4k5+jVmy45Jm8ZEtxzQ1iG+ftDGd3hMJzGe3X2BfwKyyCzuz9omnezSt9rma9qJNtArU0
	I5jpoLVsW7fIwKPqj4wOekKPk/21EGL4smdNy9k+L8kWilqTlNYkJmY53488Phz848mSzZclp7+
	32T5Pv6dA0leJ+rHNgzEsYwqFlIxfCu7eAAbVkZV/97qu8cu1SYHhyfO/JYgXhtHNTwbCFJio1a
	ZnH0heJYJv+xn48lCrccCBn5BCAW+c46Vz+D4Tn2F6gw+MS+jW27vF51feDhiGgk50e/ushoO87
	BmDeDPJU/8HOkZUP3YDTrG3mxeKN3AEjbX1wSuUUSyEjw+HJlYLfQ=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr22095379eec.0.1791818486595; Mon, 12 Oct 2026
 08:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com> <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
In-Reply-To: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 17:21:12 +0200
X-Gm-Features: AclHuK8qicd0EkbAG2tR809BSGa88U6FRkGTx1gJTbJF14aEuOf_oW-ieXqq320
Message-ID: <CANiq72=p6a=4K+8jhbm8=y8i_4yMszacK-fu91s3-Eg69ACejg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:16=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Oops. I guess we'll make a v2.

Please also take the chance to use the kernel vertical imports style:

  https://docs.kernel.org/rust/coding-guidelines.html#imports

Thanks!

Cheers,
Miguel
