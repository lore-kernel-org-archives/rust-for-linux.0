Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0AB340298
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271189; cv=pass; b=ucJIg2m4+D8B95TRJYney7w3LZUG0vw7TwyDS1KgKpg8kGtelzplW6ERf8qqPWr6g8j1GhBjpBin/74u334g3RFfMLbUNxCmJW9HZ3zZoVXsIn4n7COM40EzQIIT9T779361CS/WxUijAnoueRsnDFA4/S4mtTSz95AzM3C8Xy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271189; c=relaxed/simple;
	bh=mpomDLO8ZlCocmuPtdKICwxv4H57ynvhw4z1RG2BH9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=El9A/y9/MDfD8beu5tsgtoAhN5FfD42XKYSdZoO3ZNZ2xx2b2yl1lleR/d67bvSFSMpnxkd0ppla+/HuqWmKl38O2gx8yXuzDuGGU5qouUTdSjpIuxw+OiG01CsZixxFk5UWGFyh5POXD30fFHU3PcLS81MvYCWWhA3C3gOt09s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iub4YFzk; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iub4YFzk"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0b6f22aa4so238215eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 06:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774271187; cv=none;
        d=google.com; s=arc-20240605;
        b=XCwwwFLIljjyFW8nIS0Gkc7e+I8Xbw7SyTjufbfZskGgmK8nNfMbyJnY5xU47UItuf
         jb8IdjBq9hWCeyzHR6fmTHtG9BgMoshmzYuu7iCRAVYm8EmBB+DcEI8T9LYQ8t9VULjE
         7ZULbrO1QzCieDkHaDcpmvViOPhY/ErQ95dSCNpP/rDW6MBoegq0+aTifvefxITC7xSh
         rTWpUmtwjgWuqVHKoccKWF/nj8jS/Clgf0ojfVPGe7XNXPR22sAxOXPsMhdnTInjWllx
         sUfgRFy4i8uJrom2dYLDjLhvyPqPQooNJXAGzYV2nm1yOCcKlA4EdzeH0lJ60EZUMLDd
         vrIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZeosOC78tfRPtRL6p+oZtOws2T4Y/1DZR2wWiWY/WhY=;
        fh=+RvEVx3xWq1FvdHLeHjNHObnpIvcn7otSmop8gjV4KQ=;
        b=d1WMVg53kUxwp2rffd0C5p+jOjS3+mzRz/lWKARf2yWlE56mTidL4dShTnplbgjOf4
         H3AYVQ7+lQw4M3v6+kBwpQz7FqbeScHSkvqO7AXTYfPTTvvi4wjm9z9C6C39pTfgeJWp
         AoK/kYy5YGWx/8gNlOW1m7FrI6g3Qk3nnmSmrq3YD4e5v2jGuShV+nbvC/MvnZZdtvXM
         7+1CEWyIHvh8JnKUUypK4aU/E2eSa9fIW5/5MKlwQ1z3Dr3N/lZEi8orqPqi5IjfKjUK
         QNZ+NdK9+Tt6oLm/8PIW9ktdfQp7VO6drxTXSXrXKGpGrE25o8gBFJ+unU9PB8AZcvR5
         yeqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271187; x=1774875987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeosOC78tfRPtRL6p+oZtOws2T4Y/1DZR2wWiWY/WhY=;
        b=iub4YFzkvkaWyoFRZytQlH/ZBR04Q9/gfz/jfJerHIcTNugQZAPWohcyltrpFEnYAH
         gR6DY/K/p/hUmjGIRmwpHEXVukI7yYcdT19A4yc671buefhmqdESOnnXk75fh3sxxHED
         2bY3ByzxUG7EupQCiBeGAX/5T1Xj0iVXN+XvxgxHde20y9SuKyz60CtH3X+x/hqj+8MH
         gdN9ouQVKcA5b8CoXkbi7bJRa+utzGVggmlDu32dsleg597Z1Xcdv+j8XHzwP10yy1Wm
         cgxRW0DqMNNuY6jC/vNDPOmywZEjH6kb0lP7IPIRDCn2fnzEhUmVafh8LrVHebKR6383
         3ReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271187; x=1774875987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZeosOC78tfRPtRL6p+oZtOws2T4Y/1DZR2wWiWY/WhY=;
        b=sQdIFXFNKTHh5IDyKgvsh6lA0/VRzNIHtONXxPW8kFYrYFxqMQwfpIkVLDx46LED93
         t1kr5+86/IG36DQnIsJNxzsSJomhtFpbEPcmkZbqAZVCB7kEV7uSonmSETKUTyFv0cG4
         91YpxKZnsoF/L6QQA2c+bRHaFjS8LoeKi86GeLZISXPsPcPV4SbT107W+Wn+Bp0hebjJ
         FAvISdE8qsx0x55C4yJaKezOV6fTOBW1NTv07MUcCbW05age95mQq4mPskxsYsrY/ztZ
         Bz8xW7M2bIvyZ83Lcs1xTq0NH10IkXXdjxA8Yjd1goB+OYV5bVZYbcsxMiyew89a96s3
         jrSw==
X-Forwarded-Encrypted: i=1; AJvYcCVgi7PlfNu0Fz0Cv825zycc5LN3/naa4KbWIRnSibdh8OBEgTj6tEytAxrSNpuzI1Hw0Ztr81fiArsQ/HOpmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKA+yUCIrKggc6HQ3igcjFcjVrYaFcokg+eGSbty27SgV5A8FJ
	h2L8J1D9aFwpXsyalqExosluvQLkHja8eehcgOu5JbqjeG6eWoVNWRFNSIEyjy676vqVKkCNxHt
	DQGUsNMf9+LU35eU5u62H0G9g5KhpgU8=
X-Gm-Gg: ATEYQzy84FEab7Jvh8gdztaF1b/vMEikZDSSqiQ9mhl6iE3yS3nOO6TmtejZLNWKhah
	QWmFnJhpTBAQmxx+CgjHZw4+fG2EZEE6HP89UkLwRG4+cGqvR4t37XZgOefbDXZP2R/E+CVn6ZU
	oHfPR7SZS9ogiCuO1y88jO9kiEMdq7hFXGJi6UFogcKePem493qCUGQYbGh34pm/2HM3GUGh5kn
	Bnl6lyRn5+ZVyQn0NqW/awP2ox/Frz1oNb4gjjma5Uv8VNmG9VVjL+M7a5VTf1SqdjZ06oPQZxN
	RWd7hA5ykc6hQaxovy+VSmZj12J4yLirh6NqSGJ56udKDGg1YcDQ/ldyalcQn4RqOD3231btfuK
	Tx5Bqq3xIFSrKhBnpc9ZjQ04=
X-Received: by 2002:a05:7301:4085:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2c109861f4cmr2413702eec.6.1774271187398; Mon, 23 Mar 2026
 06:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119185747.862544-1-ojeda@kernel.org> <CANiq72n4Fw96hcuqQeorsfH7z4Tb+R1gdf80H_XkD-oA6z5TSA@mail.gmail.com>
 <CANiq72mNJrMMbEcfJMLT4kM-_iviM0AR6oeigCyrb5eMWkn3KQ@mail.gmail.com>
In-Reply-To: <CANiq72mNJrMMbEcfJMLT4kM-_iviM0AR6oeigCyrb5eMWkn3KQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:06:14 +0100
X-Gm-Features: AQROBzDGgsUaXadH-7vInj5g5TFUGkgbxokPDq2lRRDY18_WJ88m9e2GeTeDbRg
Message-ID: <CANiq72nvR70EOud=4drW6gs=FAndv5o7+8n5NNRkAStTaSJWPg@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: allow Clang-native `RANDSTRUCT` configs
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
	Tim Pugh <nwtpugh@gmail.com>, Kees Cook <kees@kernel.org>, Nicolas Schier <n.schier@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 3:19=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On top of that, backlinking the seed discussion since I will need to
> update this patch:
>
>     https://lore.kernel.org/rust-for-linux/CANiq72mwYbg_L8u9NEfRD0Fp9E_zh=
Ci=3Dt=3DU2jyjsZe_Ls306hw@mail.gmail.com/

I don't think that got merged, so I didn't update it for v2.

Cheers,
Miguel
