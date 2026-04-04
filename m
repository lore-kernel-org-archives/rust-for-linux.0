Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D16137750
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 21:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339213; cv=pass; b=mfCOCPc/Vfyeo5Mjv9sUAu5Gul/I2T3YjR+uO7Wv4bSlS9m+nn1uTPJ7TB/83y0Eis9MpyYxA2CqhjS6j1YCYEbclmBwYxYhin/wEo+loAqJ1H/fBzo8pDeO4gmLDzpiY+agA6TIyHl21uNPUT79p2jURfyNQyAM8jqAdh4UOMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339213; c=relaxed/simple;
	bh=13T0ZY6SEoV2GIHBxzmU/uU9TowI4npwA05BZtlnJyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2+0hu+k5hahu4GPiZuWGdLZTeYnuo9r+JdvFWGvdVJgEiEYJOApUxltnT0S/yYUre9PwdpFd4D0xqPLCEym7pHkQ1IXSxba10v2BOQY496lFBn105lmEE+UgWB4a19M8nMJBdevnpNZajfes1eN5mOXavb5afD7z4rYJ1Pl+qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqSS6OVC; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqSS6OVC"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2cdf546f956so25994eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 14:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775339211; cv=none;
        d=google.com; s=arc-20240605;
        b=iAGKwo03kDoYqS3+8cOKA9TM+zTPRSR0Chj3ougxtk1NfW6iP7AaQLSw5kR9prDMs8
         FVgcBf18v5C9BooqbKqH0aqnn8vzLtMW0BdEWesR4wlZgjEgeitAeucDGQXbdk/P1yO+
         WvyubtaAv9c1j8TXqBbIBV31x63dRzZFv4otgBf7lWUDPNB4RHf84nWD/L03f70+xLwu
         q/NJ7P2K7V5lhSmc4+GQ1sCnI/+PaXw5btc3un6Rsee+eu4xjos4GmgZtRbl538bOY24
         vni2zz8zP9Q0YlDzp3ywVPUIq2atDzRYdFk5ZJuPKPym3f3kP7LNyuHQta8MuwQ4urxR
         OTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AbZaP//mpzXXGVs9Kf7xK2+wjpIqLSwNJCE9QsMtaj4=;
        fh=JzEr5WAI3dIh9uyADSiuVo6enfOhHp/ZgU1B8JfgQkY=;
        b=g/qfoClx8QMKubQiuT5O/4LmBrIByRxtQqSBCcX85RKLi6Hys4s6FbybyjE0D3xRAP
         H/1HF0RoXs5Zakh5c0ta/pw5mV+ZVI4H3Bqjpc0STYOfTos5nR2EY3wd6NpXUDIAL6nx
         cDuM+5mgaUkkcBAd9jVXBzz/SXMyMtqAUFllcBOp6vabgqXRGIRpm7U4yB/CY3J0kwz1
         uNcWjHz/8BmyDhOYCICtvoiFOMmGji1CuPgl03C3BM6AqYy8QiJ4IbRifhNSRArJe5/d
         1jIgyNRVRhs0UJytCFsN/vUx3wpjeIthyTbkt99QBkiWzX9AMOaPG/p/fDo8BxskwzN9
         mFFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775339211; x=1775944011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbZaP//mpzXXGVs9Kf7xK2+wjpIqLSwNJCE9QsMtaj4=;
        b=iqSS6OVC7w7IMeSc/v0twUs6vMZjox2SVR31RLC5zTQmOTDGSF2GZt/oJEaLrmBMf8
         qS4cxw08MHxWq0DuFA/w3fnR1tOXR2f31L//opIRfT1FYkFCcZZRuYhcrIke6AC7F+hM
         OMvt4EvgkfRjyL0VuomE1azUBV75G+TFNb58sMSEpwmqnNDONlYmCu/6lMzPF82T6zDS
         whZBEDlzU2qr9nEzru9BrBiEku5uOC39GQ97ConZeNGtCL5WbFHH7YCdtNrzamIPam0k
         vDlsUDIuLAGtYcUyrlts+aInh1oSTR3qjcb0mIs+XKJRgGOKv+MIdoy2ZmNhIgfPmzdu
         P9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339211; x=1775944011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AbZaP//mpzXXGVs9Kf7xK2+wjpIqLSwNJCE9QsMtaj4=;
        b=H7yhlnpWEtHuDee6xXbGI/kPTSFeLhYuyZ9deS2YYEaf9qKyjlTUtKNwhvc6kwFfup
         P9J470Lmugg44MfUQHBl+sgcdioKMKI0AMeWogQ+MCQZvk29RAtJW6sRea03BVY/gkeQ
         c48wGSYcYc0Iu7KPkvrTzBnO9RCclzg1pjg95wHP20KGnsKic7I4aUaUh5v/nIQTTqsM
         A9Wmv+evHYS6Sj4gdAonJv+jkaMDucEneTSOarZjVsL8JH/NO5gfh0ns+YNXkRJrCQmz
         iWIqi1IL0Rymvh8gbkVxluosSaXJ0V13cZFWPXrp0j2yhsW30alWx5mLYHYkVnTWnDhz
         h7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6nH9tsrNd7+WY8LbL2JCmhhF2/B/XW1+AFJC3zQYI7wOTvc8R8XQtSvtGgUyxoHrqbEroVWrJfGXgY3T4yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0iqexJH3mIa07lG8pZe7RlMjANKXAuhw9O/fopqRUZFHDg8Pe
	4qUMF9nraImwgq7Uxm/ipj/splkKixZ+BaVuD3Kv2UJoWcAfl5PzDwdG41rWi+pipPnFMN+D1o7
	aHR3uRiYvi0/HwldlS5mnA3ZvqIy2usY=
X-Gm-Gg: AeBDiesPcEx5pfj85t4fRYJxPLZYkzmy8ZMsOYcDVt9mHOvNg9eULWflZACZOXWS3ta
	ojkMsT+2NwLLzwaQ5HyJ0fYDIndQZ01aYL2BZMolTE+gkJkxrD3hEqQv+vN1wU5Ror5vGTNHzFo
	d2q7qtgTtHLw7/Vxohe+h+n6MyaKWyG4pUkJqZIiOzcVevXgSmBAjSm2wC1HkcP0bfCa3/K3lzC
	LP8MIQ/Ph6g7RYinITbyUuwJQ+0m3etEBBkKBjcQ9Q8tKweWYdnDgIhyeAmScxWi8IGG6/mhhod
	7rR3f8u9J555madDaHtl6euLqMWQdC1GoMPGCSPrqcPL0Z3SfTzsCazTJZ6tKViWb3IW6KQjEAQ
	fRQFjIkEtssGLyTfvQeK8T7M=
X-Received: by 2002:a05:693c:3005:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2cbf96f8978mr1685375eec.2.1775339211015; Sat, 04 Apr 2026
 14:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404212831.78971-1-jhubbard@nvidia.com> <20260404212831.78971-4-jhubbard@nvidia.com>
In-Reply-To: <20260404212831.78971-4-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 23:46:37 +0200
X-Gm-Features: AQROBzD5uVD64Jru4kFBD-MsZ2HkXsmVgmN4Eu8MqdD3RiVnTuAvWTcmNfRnyiM
Message-ID: <CANiq72nToewesUCDJS=WBKRvCO-obzixW9+D1vH6s9mJXUeO1Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: ptr: allow clippy::incompatible_msrv for slice_ptr_len
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 11:28=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Clippy reports four warnings when building with CLIPPY=3D1:
>
>   warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but =
this item is stable since `1.79.0`
>     --> rust/kernel/ptr/projection.rs:79:26
>      |
>   79 |         if self >=3D slice.len() {
>      |                          ^^^^^

This will also go away with the bump:

  https://lore.kernel.org/rust-for-linux/20260401114540.30108-3-ojeda@kerne=
l.org/

Cheers,
Miguel
