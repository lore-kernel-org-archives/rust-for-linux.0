Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6BD3A8733
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558452; cv=pass; b=dTnd2EX2nQVf3lcBipjIL2jrbrJJ9P1WvQiz3REFnrlxg3RZJ4Zcel4hSOUJtRe/4Uy3ZTaNxLT+ITsk2I+/+nY3b3KI1R4UKL4812j62YCEbWJl9ir/P5jIM76XxEfZI9QSN5cW0CGTfr792nrAVrnhurt3MEfAF1RSjp0fJfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558452; c=relaxed/simple;
	bh=IUoS/yALZHd4OmyTEbMHMatU0Sk8QqyqN5AUIDsRgWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtKwHXpYNok1MRd8fpMxzfvBpfs+JrYbTQHIPJhu+EmdQ0wXH61m4yJJaBiJvbsDJpssJTSJ1fZAZr7fFNXjKE7tlCeIuDcWa8TQ3xHuhXTZq07taD51346Ov+CQzJYdkhZfx3HLt15aSYj3UJw6j4pbgrztW9lM+DIdmjY857A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrYA7FKE; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrYA7FKE"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124b07e5fe4so269933c88.3
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Apr 2026 03:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775558450; cv=none;
        d=google.com; s=arc-20240605;
        b=UtLBufS9AiSkJjPA8AQQX7WgBCYRjU4DTiMBsJsUgyHhu95UQ33Ty8CK3/dxOFf/0h
         ZoQ8WXF+ZeEtv/lB+5IJkRNdszBpCKxHz82BfzsmRc9qEHXblqLQDcSQ3FL4f7a8Zuby
         UwPJ3vvtSpYk6tDefYQz2B7C9RGjgexSA0O7J4Kw53AsvtMDT4OYGsIldhZ4LkR3mO4P
         qsEibMtWEh/eTso10jUjlUOetbjol8NYgHsewDyZCY9gPdzg+cWJBrdrIKh25v9VG0wC
         i4QzdDrHBPaUZmdyEyGVkO1gpYRorQL8yCXhm7W9t9BfSDB193rtpkez8EkFU3k8nRN1
         Z7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IUoS/yALZHd4OmyTEbMHMatU0Sk8QqyqN5AUIDsRgWY=;
        fh=cnpceZmtG4vwS6FqmjxQnAHjKmQKl1Wlr0av4gAvNZM=;
        b=UvwxbBiTVVvuZZd7wgFudaLLXrngTSoLNXPcLFpS07vpkLmqGjEj095JUUso1M04R4
         mQ1+AwMelIGYuFUPtD1Xp3KgWikm7xLfZ/uXi49syYuvSPPfWeppJjuOF06pCfqPNBUU
         6RZDdshWISzVd28uA7M6DhjEqObwlwgMaFqHZGE7iKJQ0cTNu7KJLJpzu4vWxqd3KiRv
         u66htZPj0BFKM0BoG+SDxiQ/JJGFdmMVZGwI35rPkq3ZBTGx9Re6Rv2bSSDXUQGx0Tfl
         WCycvOgYodRlZ/7MYWlf0gM1CYZIAY3/4PUCr9Z2XBdp/Un+2CgfB3LLNT8QDcN/ZOnf
         Yz5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775558450; x=1776163250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUoS/yALZHd4OmyTEbMHMatU0Sk8QqyqN5AUIDsRgWY=;
        b=VrYA7FKEZZyMyMEv1x9WlPRhMNw3pjoid7kI9tKnYLEfuXC+vG5xH0quWB0BcWrIkq
         6IJlZ4SX4VVCJ3YQEw4Ihl6UEi1P9oP55dLhOp4XxF6fn6HTGAy+C1THh9AWqwWks5u5
         M4iXCF7VVlaj7K2DlRHd39OS8gnswpU4HgzOIy21C25YEdhjI9kExdhWa5OkJc/AVjx+
         ZdoOmts7QUJVhrGfHoNeZeRagXLlBWTkiWJpiNuo0Or1kgVhNx4q2XPUCdms8l4/tP9b
         2u619FmcyQOuenGYjFdIMQBlKFgGI7aoxvck6AsdqekAGu7LkIjX6ETGuph3lSRZJW/F
         yOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558450; x=1776163250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUoS/yALZHd4OmyTEbMHMatU0Sk8QqyqN5AUIDsRgWY=;
        b=pjpbketQG8U0znlxYjSBGsDUbP1+iwafsLxC6gSNEA7yMU17tjnulpLuNp4mKJG6Zc
         +X7RhGU2NHZWmFGcEDAfsYbcWIuHahsZrpwTIPn8o6QAgXJBBV3w1PxNZrlsLau0a9vz
         PXMgb3DLLpNONKflyDyFiAVTK3kl721pnUshUXAS5gw0I8dFbVS5lQPHHfhBTlZwF0gc
         obLLVKlaeEq9+hAAvZMroa3NsYuHAO0tRyhsZCjVgWIcg4byqSnUND4tCWtvhW3W4xTT
         FWTSNg8TJ37SgMLi0cxy+/9eMLas+fZiBKDV4lS9wy2VGpPe8mUkHcTyq0tRCfj6/5PN
         ehoA==
X-Forwarded-Encrypted: i=1; AJvYcCXKXoh9cbxP++4WuXaGl3d9xqOrzlj/S/Wzb1Rm5EWrP9SIpCRiYXFHMSjC6kgLpx47GhikgrVrbOBradcTQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvXpyxlOwjEkB2LpUV/tFr2CAoP7lUmE6U5lWZFHBGPEjvH4R
	M2H1q0N/4FVY5aixjnyc5xOAWKJbv+1YuEfktvjGj+6aRESQ2+0oCX4dceuEm29GBOAKOmGPlH2
	MS1WmrrGwhYOR0E8CSeV75P2Vh95MVFo=
X-Gm-Gg: AeBDiev2nsMHWFdU4EmIV/Q6pDJXYWNWkOJ5M2DbZdxCHnHrFuOwWTlltJGR0EwzI4r
	dlTbBtbD5Ve+q9Vn9wyaFBAwWxIaAKher3yjbEQMI53d9mb/5JJ8CQs7i02aqAte7WRzS2cc8RB
	dwf8xkGkzhiJ4qhu/NUpqu4Dc8ubehBAaJgwsQSPnv1b32ZcWqCN+HDyFKCwEAz+igbrlpQQwQH
	gyzJhBD0bRAw07xzjNk+P0ZPSSONds83Vdv6JQy8lLUTJNZMtZliKTzA1hwVUslb6ysNluJvRRL
	+fgS6PsLhyeADf7QrpBxKucowkgunkN8U431VD7lLxpuvrWhYH2CfcPY2GNE9O16qKWG3Pl2cWf
	3EiLydst67k2IY8BphDJkvO0=
X-Received: by 2002:a05:7301:1986:b0:2c8:d228:3df5 with SMTP id
 5a478bee46e88-2cbfc95a6a6mr3515468eec.8.1775558450253; Tue, 07 Apr 2026
 03:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406095820.465994-1-ojeda@kernel.org>
In-Reply-To: <20260406095820.465994-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 12:40:36 +0200
X-Gm-Features: AQROBzBg5spyA6BYVGexDTp86I9n7gLDQThc9PTpTkz0AO6nnJln4y8vROYE75Q
Message-ID: <CANiq72nK2GwLdscU=Xs1Q=XuNk4QK1_MzO9OzJqAU1sydeP_nA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: kernel: update `file_with_nul` comment
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 11:59=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `feature(file_with_nul)` [1] has been stabilized in Rust 1.92.0 [2].
>
> Thus update the comment to keep track of it.
>
> In addition, this will help to sort new conditionally enabled features
> (i.e. `cfg_attr`) around it appropiately.
>
> Link: https://github.com/rust-lang/rust/issues/141727 [1]
> Link: https://github.com/rust-lang/rust/pull/145664 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied (just this one) to `rust-next` -- thanks everyone!

Cheers,
Miguel
