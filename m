Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEC1381AE3
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140999; cv=pass; b=VXv3o2Q8t4Z8miwynP+Ohb6KmZdMxf8H/FEj3+MTuFWCmUqCE+YCp/FmKKHksN1F56DFfB1NBWLf4WGTPN26HkSFuV/xpqNlKp0qGR5JGDn9vU8QXdvhlQDjxQGwE0ccrMN599TExsC1MB76iMZwDGKbN0WK/0AbCzdCHUrKhGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140999; c=relaxed/simple;
	bh=Aem47PhvPdP/iyuqplBe3P+A+LjmiDgpbIH/qJLSI+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gH23DsKR2HAMNjj6ymVpXhug9/woyMGhtOkiITVKJK3rYYZU54n8RqqV1Vza/UfYp981LOjB70YA+LSmU9q7D3V4kPUl8CIXYdC2UAwaOpdvr2meKFe/lEQ8tN6w7ZnybqMKR7Wi1KMVdubQ1gB/e4NGMMrznZs8OtFyJ//8uaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUlR+9Fl; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUlR+9Fl"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2be084d8166so47777eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 04:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773140997; cv=none;
        d=google.com; s=arc-20240605;
        b=VwueLH8VvK4S8KC53lYjV4NQlNQpKtBhBhHonZeTlzsFU1AaMJGZJUPZXF6pd6g5qM
         Wwpxy5PRNfsXQ3XPWTyKzKDcrhnr+TYdi3jY97puk1T7RUfD88Bjzq/jpsURXDziVG4u
         E6FWWo/mQU+wUQtlM/UIIVRja/4JHGYEW3j1p2CBaHoK23TZHW3xdLkuv0tXVB483DB9
         newbsCLmoBZDQlF5MhPir3CL3PVHlz/DkZ4wxvxezhLxsnuSdDDJBskNQxX2JIaa2xds
         M1Eqi+eG3eNW1CXbB38fRhRIkg+7uzIUe8QvHfUSvE8apwZw0InYq/2cA9XSnzivH/1u
         6UVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aem47PhvPdP/iyuqplBe3P+A+LjmiDgpbIH/qJLSI+A=;
        fh=qhS5GvohHb0i0541dHKrd1S8/ByNV/z5FM3hOt0+7rQ=;
        b=hP9Xd5SqnupenmdLMQWhFGYFI2MucpoH5O5qZ+RWMgNFPYpnERHNZxN94dy/6YQSAp
         40yVWz7BvF7yFmeucB/uSpeqzBw6TF7FWraQCun3NIFdQFdcapDPdpNgYzB4E0FDPqdF
         ewc2eu1qB4IWUpRBKF5WcI5btCAkfZBJoG3zkPYTLRQKPH/eXyj9lAWpAlhjEDo2qm8Q
         bBEEdvEPLZRcSjcEAuychHUXFP5sxsTqPMyH23jFyU1spqrFslHNwUW5OX2RgF056Imx
         kEsr2Ov1i09NiVRrmUalYgvyR1FTNqtRRWcwFR80AYrxLqF0M+tPxw/6ITvusab5ZkzQ
         SMxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773140997; x=1773745797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aem47PhvPdP/iyuqplBe3P+A+LjmiDgpbIH/qJLSI+A=;
        b=WUlR+9FlU3tb+BjEM9qqrYJ2Wl5DfF0P0UdIJeIsuYYOXmcjqQ9D0ajJy0r/r43Kxc
         vzHN/Cew1/J+TwUm6Tc8pIcXtyImr76QkM8eRg6nnL53YrkHOOpmL48gnxznNEKsn+So
         GZHnaXjUju6q51sbiMN4SD6/lCy809QdZ3oT1iIqB2/Q0YkolnRu8wa4mTENd8W5DzYs
         OHiB7QPYSMgbvbBv3MTVQl9tO8UA8m78UQssea5i/E53D342G8Vxexh7mtPvG7PiIRxS
         2f7Y4R8ahRciZ5/I/LRAGE2DJpmxC5YJ3/wEZ6c1ralwgkQW1dlyEpt6c8WyzvjTcdov
         PCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773140997; x=1773745797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aem47PhvPdP/iyuqplBe3P+A+LjmiDgpbIH/qJLSI+A=;
        b=M9ocQeqzUlpgBDwtL/uj+rPK/fCU7XRN1tnecYpmc7uktMiUs1ijINPIRp5I1bA2ml
         kuY8Hqsn6rOx2yufAecybkmdOdLdXOei3PJQrh9wxaQ/M8WY1oUpZMB6fEMIWc1nkxpi
         aeVfwE/aqa/jjJeh3RSuqR4NHkKWwu05zP9ra1QfkuD6X/TT3zR5tL9198+yVocIzIMB
         951ZU65bB03KZoItszB+UnwsY4IVn/klFaoZDIRz7ptTwpGUCMf0T9xnPlRt1M2iT2/7
         SR/WWOB/EWnm5HfORjghRe28Shwlv1XijKBJ7XqSe11vJh9Cz1mBOXG3zPaa60BcrAT3
         bX7A==
X-Forwarded-Encrypted: i=1; AJvYcCUj09bSDznrVeze5QoGa2VPLnLxwj4WI+FMrJE+M7hxOn0cHky84+NrqgS1G1NiSU5F69sL5YXo6TkF3MMRrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb9zQZI8FhAnIV1Y2gUEjgiZJtJ8Gf+daUB3GCn+vG6mgZDMuh
	vSjK5VmQPJIUcKXRTFiGpcztD0/LLNLCzrr21VYpleSAjy88HyoC/lrcWk8pvPWeszFLLIlIyhZ
	Q+n/D95YF6WqT4cl0txCGNQ1SzUqQ214=
X-Gm-Gg: ATEYQzxQHH1ey7nKE4eh2fDbdVfUYIno4b8C57BICWCO0kYdxlW6RcCvULQbqzD0x5z
	7dZQj5vxJ2ed036xA0iT2a1qC2upa0RPPclMnfAa0gm2iW0kMPqj099Cps08c8krz6ttvADDRxx
	plo7htnwgPdcclCvDKqYiuWfujBdcg6urhBOvC3MxlnG6nZdE+Z0TVulT+U9KFtjAtbqjH7Sa+g
	e1lGf6yjic1q1iMRDFQ5KknevvfOzfoATV89oCJQU7G6CtrRwCxItt7jsHU/h/3mejfNnj568FU
	jwY0aehBdVEfWGp/bAXkHa2lkEj6Rh1hAxaILpQ7UVuNQQ8nze5urU00lP3hf9R07qzyZrm4BUf
	a32gUqXe/djzAkZCzObKQfsA=
X-Received: by 2002:a05:7300:cd90:b0:2be:1544:5c34 with SMTP id
 5a478bee46e88-2be4e09a273mr2605685eec.8.1773140996803; Tue, 10 Mar 2026
 04:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119185747.862544-1-ojeda@kernel.org> <202512092319.ECBB8613@keescook>
In-Reply-To: <202512092319.ECBB8613@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 12:09:43 +0100
X-Gm-Features: AaiRm52yrnYpKu_LCuEGwaXBkN9qVVDwx_oBsyi0FYUy2OUcPt08sBsrY2wvdKg
Message-ID: <CANiq72n=hgH4bqJjp8MsMHAaxaAo75GSBcHGTvFT3NTSaVPGWg@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: allow Clang-native `RANDSTRUCT` configs
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Aaron Ballman <aaron@aaronballman.com>, 
	Bill Wendling <isanbard@gmail.com>, Cole Nixon <nixontcole@gmail.com>, 
	Connor Kuehl <cipkuehl@gmail.com>, Fangrui Song <i@maskray.me>, James Foster <jafosterja@gmail.com>, 
	Jeff Takahashi <jeffrey.takahashi@gmail.com>, Jordan Cantrell <jordan.cantrell@mail.com>, 
	Matthew Maurer <mmaurer@google.com>, Nikk Forbus <nicholas.forbus@gmail.com>, 
	Qing Zhao <qing.zhao@oracle.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Tim Pugh <nwtpugh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 8:21=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> I played with this again, and yes it appears to be working. I think,
> however, I would like to make the anon struct universal. What do you
> think of this?

Revisiting this... If that is acceptable, even easier for the Rust side, ye=
ah.

Perhaps as a patch on top instead of doing both at once? (even if it
means cleaning up)

Thanks!

Cheers,
Miguel
