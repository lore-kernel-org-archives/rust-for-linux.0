Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC684318B9C
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772885264; cv=pass; b=txJqyRbr2N56Ub/3J2UIVW3grOUi0GBIDo4AYLp99evM2xLU5re8iWWbsmgjAU+M9S5qsBQ86OZTrgbgtnvsrpMmeFgkBMfJZ3Z3/JpV0l4rTcrJ00G6i9EJCj+WW5ea3EzefO4K4onXdTP0L4+HzVSUp2VPwzwNY8s39QFQeQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772885264; c=relaxed/simple;
	bh=tBQGSoGncUbzZzImbMVJ7rDz3iNCLcC7iwu7JDNpdN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ax+yFOGjWmehBfO7mVr1gZCDKEi3DKgfRVkBIuxTP/HKeAv6yaaHNF+yiyeRy90hL1n3i3IX8fuHf3UtP+aT3UBHKRALbxGUnqdTSEzbUVVh7h4elXplAvgCj/PY458lm4ZpH5DhLs9KdwAoib2+Klc+hTffDwQLKkPQfAiyhjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2/Glw7a; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2/Glw7a"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bd5658b901so688871eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Mar 2026 04:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772885263; cv=none;
        d=google.com; s=arc-20240605;
        b=lctQfHbYBRcaSXmQy0x/48GqBTBDr4JrOniH2kdQJztiUABgiYQyWqE8JjLhdKtNhC
         3fh7uDg6WOqaoCNY5VHk+J+3JYPTayxHEZ7jqMRw/aRPngfZNA6aSWH7JHkxzsQEggQ5
         Jz+fq7mA3IZiP5dlDLrrCvXRlvoVjfH13vWf70mzLYCrwHEsUCsNdSYNbWbS6CnVfeww
         jOAzbVNjKQFt1PAQ57vvXdytPITe16geZiPzHqrD0Py950QcCi4zOxZQSY1wdY+2vc1E
         c8+oWO7veqku0YSDdtg4du2m2A/M+Dwt/2TqLBtmpR2Lcwu8W42dCAh3dhGX5Gv90Cz3
         vw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lHG9aOAw9qIuzF1k64BAc+sc5OJ1SbvKF5R81sep7w=;
        fh=nOnf9DbfnwosfQeuyZQuM+DUaaytD738t98OLJDES24=;
        b=JSH7Vd/jX+RqEwJIQNwSzTmONz0YhoSqBglTju207mcJCXSctajroAfWtWaZUSPCgX
         LZ1OSNQ+dIdLE62En99Mf6Hp/uOPvioblX/F/WCymi0dulyU9QVHNHE7jAzanddcC/r0
         5cxCbHBOg12eQQZcVWlKkqI/c5eui2dIdHuIa0l3gt+QOSm/uFCjBw1EkPKOu62ZtMFI
         V57RiQ1MJVygz5LOM4mngkGQHQfjl9+qCYtlmej35Imufjvb8VrTSNYeR33dRcUoFtPe
         //8pc4C99j0g//o01vF617qEFktk1pBB4V5oULYpPRUr2SM9usxsXNxp+akVRLJ+EHpv
         k3vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772885263; x=1773490063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lHG9aOAw9qIuzF1k64BAc+sc5OJ1SbvKF5R81sep7w=;
        b=F2/Glw7aXp8787sjI7Ots6cj8VXp+WgNV5m1+337OQqRndoJf20wUHMsvGAsWrvLo0
         ejwUz6I1R2/4tlIxqo1CUO+5CtLtNOmSIGrNMYhzp8h9ZChaLIsnwc7gi/uJONXlZ7Et
         fofYJ47Bzvtijd415PRJ9KeICVvIVWnXankHvvLYh8iPSW26ajXDJv5hSgIufQVGAla3
         yJe+YuWx+Y+8Ii6/Xfo9z53O1R+fO9FdRP9uhXr0cPsDQlCLKBVcWOXUWOVp3K6DzBgL
         aeNFAO/rJaV0T9KJ9V8omrv7xry0caRpekLN9Je9jZW69WNot5d/ghh+iUjqG7Iq6arG
         Y9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772885263; x=1773490063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lHG9aOAw9qIuzF1k64BAc+sc5OJ1SbvKF5R81sep7w=;
        b=rjo0KaceWJZW6ONUw6kT7pJ43+iVY6H1p7eVVmUxosPLT3Nj8k10W1cyxqwHAMhSni
         9sYKDVrTtuW/GgwP+FQjSf+I5QEEOHLHfqcC3pBDplc6kroTyuXDj1bk9pkmf82WrzWV
         UTYe3BLFxJYIMKwOJQtOUCES5p3NJTFAGEfg65qgjrtOFSulybFPZrD786Qtz4X61n6n
         7/BrK93wP12COpD+gMc+v8Aexo5QFrvbx3Tz+znxk9gJQFUeN42nD67t7b5jIDfKKoxb
         Pb+h9JLEt5nqNND9wNPKTt7x6jMnqUizxcU1UrtSXHubl9FWsuxFZiIX9HlzbygoKVI8
         Sb3A==
X-Forwarded-Encrypted: i=1; AJvYcCXV3Omh7Kc1d+1Ei+oQgwRyfdRtQKk/Bjqyp4A8KL9t6r5ry/GPBIl2FVv67SX9kT4OlOxM7ZIeYrHDM1G5VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4TsEO4Eqx6HWvYf0H2s9ByAhdtSCes9JD4WHyi8Gfc+e2CDR
	R5HO5dpF1eYoicHiVkU2yv69S1dcpbBsnpjdItHqMMb0J6g69E+f2aQA0Mu+YYxxMYqMPwiTY0B
	mtYg1xLVpHR6yTEBggYwoFZpT5/88E9g=
X-Gm-Gg: ATEYQzzkUxeC2eBS2OlrC1OsL43MnNXf6vmcfNw/ss7RR6pW2opownReA5znMulDKWX
	ejMSwmuNo//EzntyM9Ol7nRzuD9nl6M+6AHTnxFD1kMzSZGAzX0T4DewFm0bpvtV2eN2bvyiYja
	pl2EPZD8dOzzpU7oen/GdqoH0AUVT3aSoePwYO8kN77hw1zjzOrSN4E9Mg34PoJSY6FjIJyZWdJ
	Cn1pVZff4NMH6jRVpjRei9BCpxoEre33L79urEyB+kkJAEJ21utExJO3VvJfOK9Y8RDP0D0VR1S
	YCgxg6aUoQDvaSLdKV7IFhX4WRc0VS9ul/VfVxqM7zltBwN9Km4bIvgFdq4VAB88Z7vTW7TOnNp
	bXXv30NRMDOG/BdYR5KEMGYtC
X-Received: by 2002:a05:7300:fd16:b0:2bd:fe5a:b87b with SMTP id
 5a478bee46e88-2be4dd63a9dmr1097364eec.0.1772885262757; Sat, 07 Mar 2026
 04:07:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307-rust-binder-trace-v1-0-5e03283c6e53@sdhn.cc> <20260307-rust-binder-trace-v1-2-5e03283c6e53@sdhn.cc>
In-Reply-To: <20260307-rust-binder-trace-v1-2-5e03283c6e53@sdhn.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Mar 2026 13:07:29 +0100
X-Gm-Features: AaiRm51-ZXfEmco47_WZnLbu447KNvOuM74Xh4LDqbUfOg7QqYaSzD3JuxEJIrY
Message-ID: <CANiq72kGc1vmQa_tVQ4MxR5NU9C54nqiVuM7+JctFtfzkWvM6w@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust_binder: add Rust binder tracepoints
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 6:42=E2=80=AFAM Mohamad Alsadhan <mo@sdhn.cc> wrote:
>
>  static inline size_t rust_binder_transaction_debug_id(rust_binder_transa=
ction t)
>  {
> -       return *(size_t *) (t + RUST_BINDER_LAYOUT.t.debug_id);
> +       return *(size_t *)(t + RUST_BINDER_LAYOUT.t.debug_id);
>  }

The kernel test robot just reported the Rust side wasn't formatted,
but this seems to be a C formatter at work. Spurious changes?

Thanks!

Cheers,
Miguel
