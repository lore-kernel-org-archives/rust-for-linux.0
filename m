Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2497E32F764
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 07:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954630; cv=pass; b=cqDwyyAxAEXR1m5SpRC/AKL4vJk1OxrjNy+5mmso1tB9m4Ln5CEqkvbLNWntVhOTTfnK2/xatKcDPl1iZranDOoIalMV7yE+VpwpOl3HPNd8hyXwgW6AYvSTmBogdj/RjncuRenDFMK2iTTK5ckDIXsyg+yzsx9phQalNHMoazI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954630; c=relaxed/simple;
	bh=t0V9M6e2VB4qcIJrywyyrYPhcdcYJQBM+oNk8gNRf+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCQB0Dr+xnmDpzxW5k6kQpu9Tg1xkUaBEkQWHXn92miV0KSh4uSmy6Tevl1HLLIHqqDtIsenFA/r/G3MtFjvpcIRFJhHALShDoaDtvIZLYgNxRRYupNkBDJrn1KdgdIE61WxZ2ta+H61KeYDZe4FHCtvp51MtmmdfCurroycm+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lWHc7TyN; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lWHc7TyN"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304d8e3bb72so688207eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 00:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779954628; cv=none;
        d=google.com; s=arc-20240605;
        b=le4ePYUFob+7kYRhFO8/nL5ZSqSoGsnuogSNrTmwSS2OLr4mFZJjH8903VKqO+doDh
         m5JKB4X0YjHZcQ32P7ktpzcm2YpeMHYthVk+A+pG7iBnjiZ8Wg6Dc/sXsRrZIJ3yRUt3
         dj6OhwGxP8cZDiqeDHXsMXR+P6kC7gqnzYNy47kK+VBN7vWAauWSNUm/0I2FGONkx5QN
         XbF5b4e1meM13cC+b06iTU/boc3RrieSODBN1RzeuWhVI8wRo2i6++hDWRZ9e4HZaG7f
         fvxH74y9HStGk78ZAgtYKHeYICM6bQphRcc7t8cQ7EdbmDGBOdjDuLRRptbgvgN6O3UX
         P3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t0V9M6e2VB4qcIJrywyyrYPhcdcYJQBM+oNk8gNRf+8=;
        fh=W7hxf5bnlI4MsVN74e8Cx6kC7Cbnb0egRl6EoFB21Gc=;
        b=X08IzTk4TW/erLXh5VRxYduMJqbU6Hf4R9T7DYzizQPY7vquoVxkVDO4CqJvI1XZMN
         QTYE3/oD9PkeCTCArx2rqyqwKv9GJmDvr0iglNgy6ZAWlEkxNmH8mjZ9qHz7PoVvN3zE
         8gK5rdBFxJRgX5xUWjrRekB8pxTKi7eSJZtT66ZFa+hn5k/71eN+fN/QxKRTzXVbmXWy
         atCJ309qm7pCGmxalKNMA7Jr00dCYSIq911YhxORU13E2h2NFXHAMIxjkdOcjKjgdqPQ
         datIhElWQNloXkMV1pC4elNkAMKL1qcNfsnS1sLRDBMIvHNJScrZ9nUz87yaFaLcOFGq
         2cpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779954628; x=1780559428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0V9M6e2VB4qcIJrywyyrYPhcdcYJQBM+oNk8gNRf+8=;
        b=lWHc7TyNWIGIR0dQ+iuW/ZtSC7yNVk8aEnC9RNDr0gE+KlICoU6ZDPh4vVQWkdVhiM
         TFDk9M+58z00ApW50L6cggsHVuJ+SwGjQZAB3K2XokuFzB8KzmZhDjKsukHmdQflSaJI
         Y07mF5WmIlLD8kEANr0llyy5UPBth5QlUOmgWByckq+ZIVAYir1thzsWWt7KbLsENi97
         kwsubOMY2p7txzET+G9qIve2lRnKmM7isi5NExkae9CosftvDr7gqo2b6fQfMmLVAyyy
         8TdxDPgyuoXtIUorYMg3th7wnJtbqsZoKd+mtfp16Tu6V8PxYsBdzZ/oIGRjg+qERbzV
         tVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779954628; x=1780559428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0V9M6e2VB4qcIJrywyyrYPhcdcYJQBM+oNk8gNRf+8=;
        b=eMld5gFvmCPY0cnPKhc1nyd4BVcSLtixCNB6Y8i8bXQF0cWMARL2HUD3jCAmsuSTSa
         OFk1dBgq5CO4VDiWdOx5kxY4TMcGY7sVg/29YO1wodLZjertnl5jU0JU7UyojmN1dGO3
         Hnr8hwH6JS0i5wIV5iDCYG5rL9dzVBG0wI7aKpX+yHmvOjwcUWluT7XlCHBWXGKtAgLS
         pEDbpM9oe2J1i75gVOX4yekpx+XMvNwX5007YFo0JxiG6P78Xx0asTOytAuYWF3u2qAc
         QJcF1AIa/OyUTfubd5ATFDw4X+nK4LKXY2hWk8z0RmIi+5SMF0g+I9F1FEBeA+Ik3gLb
         Uoag==
X-Forwarded-Encrypted: i=1; AFNElJ/3uJIINWxt1vKFzKaOQ8Xwzq3G0uv2Wg9+NYxGSRGHTVyUx6MCAl3hI8uZ9kfNY56/v7CQBOQjKbQb7wWIFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwIrhdJayFFblAnGJmMj1hDtYI/Srnvu6tUn9h4fbN7nMpvmC
	NzIVypmRX+CNNy1OnS9H+yfxpps2JianUuUL9FDqaBRmiVmj84dKpiF3nXRqKTzbo1j0qfBiRnd
	Cvn3UW1tdVYNbvnjmH8J1wglUbt/FoTJ31/SUFaxj
X-Gm-Gg: Acq92OF9l40cHpzeJjQpJL0hm8+E9q1pk8wdo95yZ86yPk+5sbyVLIKwxiojlvFzgn8
	UhdM1QL/rX13IwzZpun6WPdDWcS0X8DFKEWJRq6ZMU7w2iKYYhpYqR9vaa0rHC8P+H21o54X+jT
	9aXU7a3FDoLbXLXAtaT3qh+PamYsRpDDPV7Vgdo9ndFUNLQW5TT2OdxQyzbwbmrCXmylRllwNFE
	k2bAEdryj2q5/YmNIFQ3J2u4oZQ/RDq+PXp7pmxbNRULrskAtVjPFNZPKgaOmbOWdwAl2zXX3PN
	FtzVKP8i6+WglLDBa630O93+QCcjec/9F7ou7lBPu4ZgrAOpi1RsDre786NhLvpKEu1oKblntM4
	VmdHt
X-Received: by 2002:a05:693c:69d3:b0:304:5db8:daaa with SMTP id
 5a478bee46e88-3045db9c438mr6096842eec.12.1779954627675; Thu, 28 May 2026
 00:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-set-extended-error-v1-1-407b4b466035@google.com>
In-Reply-To: <20260527-set-extended-error-v1-1-407b4b466035@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 May 2026 09:50:11 +0200
X-Gm-Features: AVHnY4INulTCcRwU6GdvWBSiFwJioZKqN5qt8BQbixvcN9LDNmBIpBZ3C8IQ-yw
Message-ID: <CAH5fLggH-kXntkwF_m6=xv+AzEANKm5eX5rUV4sT3HCasheBuQ@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: fix setting the extended_error
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 3:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This code currently copies the ExtendedError struct to the stack,
> modifies the copy, and then doesn't modify the original. Thus, fix it.
> Clearly nobody actually uses this feature, because nobody noticed that
> this is broken until they tried changing userspace to make some errors
> fatal.
>
> A test in userspace is being added along with this change.
>
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Hrm, looks like this patch is insufficient.

Alice
