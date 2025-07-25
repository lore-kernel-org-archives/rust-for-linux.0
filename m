Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF841A8F
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Jul 2025 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753429979; cv=none; b=bmIx9nJZj9axRUY3G03NQ3pMNtBDrCEh1Nk7H0fDx5fYseNEJH0BdTE/iOufbwu0tgF7PUcc1WFNR0WBF38+VTfvimA4o1iKoSRgrMeV03TJTu4IXbyqvWeu9Du5gVFpo/iuMsFPr+j9DecQRLJKLUR9raY4c5dh+QpoNBN8tzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753429979; c=relaxed/simple;
	bh=eoH797mqsBs6xuZVyOmv4d8RqF6BV6h4eqvrF5elnEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esY5qGR/zBQ586LP4KYKWbVc1wfTjhtpV33N5WvW06BESKecJm5L/DltuR8y0sgkCvJvEid2lDevFoX2PziQVh3igsRkzcSf3zshkXzPm0Z0BT4PZKElTMHOTQijA0Q6qDufJ2p2RVUPX7PIPCM4I6K+f4wyFWGXMSrKAq+V+gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U+iSlB/o; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U+iSlB/o"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b776d57656so210219f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 25 Jul 2025 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753429976; x=1754034776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y29kz7A/MwWwfz7+3cYa/ddLNXrpkNMO3/l7w3Mnzko=;
        b=U+iSlB/oUymTwCGp4rcHy9phiPWmvC8u3upkSSrE94AThHMZmS8Fr3UO2WMfzDctBS
         UZSSNEOfqKst9F4E2qfSaeeP+DzNQYCwLaFiNwjvW+uCeRn5P6/t61N4RAdv+CJh81vx
         ih7sjqEhWhVhsogc7zpBu6iWTQ74j9chUnK9I9GabjwmqrxEFmESFxJ/quFyuRdG3SWY
         xrVyTK3IWRmM/NbeHWN6pIN0Wp1KnDJLzLz3aOUVTZ7+5TWqkR3m3skuFGRk3TTaFvFB
         er/L6pgkbjuhPVdJbB1v2QSLswVsgTbwznWz6eGJVttSTKkjAbor731fjMu1qhMqXAnG
         1PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753429976; x=1754034776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y29kz7A/MwWwfz7+3cYa/ddLNXrpkNMO3/l7w3Mnzko=;
        b=vCa/2T7N53CM8CfUvrpWwqu3JP3hBozpbG1N+wHRDhNYHlywJW91wEwso+9wxr7aBY
         Q9gJ4l+meBDIZ/874l4wjnmX0slfWTThZQ63n3ibm9jqeW+Sd6SVG/pbcdfnyvKs2HLk
         9St4hFL+0KgRMHSdkhinlx+Ne4xm8V14FhDM1PEyvKFBnT5a+cknNCqZYzYb0tVz1SHT
         4wrvGnfHcWisPMCY+EUX0W2hA9qhc3OzLS2++U3ZllxD1b/9xFg7hC6e0BGw31xGeJT0
         DNJyeP38I8y16getMAth+OD6eK+1UAUcMBXcco9aI+NAP5yxX/J3Uvp7bZHYyOwA6ifH
         VeCw==
X-Forwarded-Encrypted: i=1; AJvYcCWbjwkgpyBTu52jTWvbXWgPKxrCPQSUdQ61k2jJVl5WhkQ/HMp/qeoQOm7doRahXDMxUsWEFEb0JIiUgb1ZCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsrxqIoLKqmVRSLlB3H8gWzC8N9bZtasJzwdZf6JPik8OXWIb
	UuzHIczVFrpPVboKINd+/FxiKg2Md7ZyWYe0GARpWGPGzvPFooUYfksDCZgqwprXmpB65zUPl8C
	DTW30x3PBbLfBOi8f4nhCUb7sjotX1VosX/MXSMyY
X-Gm-Gg: ASbGnctAmXdWqLmE5WPb9hxxeXBzOqfp2XeLjw8h/lfkTaKCsH9qmuEFAfdWw0Qsirz
	AHQF+/J+1EOEBDmnGn41QW8hdLI4mCOOm2cpkg85IRMNY+pZ18jb1m9Sep5dB1S1ObJkI1F1NoK
	EFg9yrOCui1LCcj9mfdSiIkiotHjMdWFhokqPeQGECJ/XBu+nKqC0Qqdk2h8UDq4axbY8t2f+nP
	etONuWS3ZbJgEMFgETzCoFmUSYxJf8YQOSz1A==
X-Google-Smtp-Source: AGHT+IFHuZC1ODuNXR4+D0YRFC92UGO95cgOvdX0pp5B59jjxgohXWOCJs+nNlprNVTypzFwYYDOrz034joMKfbYF5o=
X-Received: by 2002:a05:6000:2306:b0:3a5:527b:64c6 with SMTP id
 ffacd0b85a97d-3b7765e57c8mr883949f8f.1.1753429975962; Fri, 25 Jul 2025
 00:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725-as_bytes-v1-1-6f06a3744f69@nvidia.com>
In-Reply-To: <20250725-as_bytes-v1-1-6f06a3744f69@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 25 Jul 2025 09:52:44 +0200
X-Gm-Features: Ac12FXwZc0zXjraoA2_kHSwY21ka4KMAD_Cj3XPo4-E82LVGRioQvMFt8WOI1AQ
Message-ID: <CAH5fLgj-crrKyZbgPBLyWNmzw_oB6ZVc==rqAFt5jr6402nHLA@mail.gmail.com>
Subject: Re: [PATCH] rust: transmute: add `as_bytes` method for `AsBytes` trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Christian S. Lima" <christiansantoslima21@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 4:11=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Every time that implements `AsBytes` should be able to provide its byte
> representation. Introduce the `as_bytes` method that returns the
> implementer as a stream of bytes.
>
> Since types implementing `Sized` can trivially be represented as a
> stream of bytes, introduce the `AsBytesSized` proxy trait that can be
> implemented for any `Sized` type and provides an `AsBytes`
> implementation suitable for such types. Types that are not `Sized` need
> to implement `AsBytes` directly and provide a method implementation.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Is the AsBytesSized trait necessary? Can't we just do this?

pub unsafe trait AsBytes {
    /// Returns `self` as a slice of bytes.
    fn as_bytes(&self) -> &[u8] {
        let size =3D size_of_val(self);
        let ptr =3D self as *const Self as *const u8;
        unsafe { slice::from_raw_parts(ptr, size) }
    }
}

Alice
