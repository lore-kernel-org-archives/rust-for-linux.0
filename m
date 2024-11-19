Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E904214831D
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732045335; cv=none; b=WM32TbPnn/x3axfC/G/8rzKgWwBzgqaTsQ3tJ5Pg6lDlMtziR+Flhv4zkSIe9hjCoRZipohX79lrTdcCdt/tbyg+Hy+s6ox84gDTXl/wPGG0SJx6dyyaKu0NDurHbYLiyNWe8dCJmq/CBSohX9oijNv+bdlvtAu1IL223KtNq4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732045335; c=relaxed/simple;
	bh=qShgXToZ9Kv+9awX1uh3xmO5JncsgTOxALxM0XJgV70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FlXRHd9klmcB6XzCbVfZUyoF1Gj5YRvpNsk9Ul7O3kM/E77bX5sd+PVlwyooKlpHcwCM8aMeWN7wGpghSY2Q1/D3g8+di9O4VjUYd1uJVxaQs8ihYO/i17aMdgtlwbJstjo4eI5raDZMopO12nVt5ifVTvgUlIsYxTFt/zOT2fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FiDDDmeK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FiDDDmeK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-382423f4082so991177f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 11:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732045332; x=1732650132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qShgXToZ9Kv+9awX1uh3xmO5JncsgTOxALxM0XJgV70=;
        b=FiDDDmeKOP8nk+qP3rvBUc7UamxSHQNkgwMQUNAcLNGO1ZN8+9KHcH8GJ72npK11pI
         SNgs5zNh85sYJOe1hoHeLVapY4PpGgBzOX3DZ+MTzdIYcgZMO9DMiMZbtLd51L2sQGDP
         +exMaz8B1zocQxWu8hPwbKH/U5ST1Z2i6oEaMggLSOoo2X0h4UV91feeNhe9copE+0JA
         Yfqy9S4HYqUPhNTU+1ZzkeYMiSxVVB6Dx5tATPevRCw7j2Oc6sWSxPRCPMqamk1D+XrR
         Usnr43pE6kuv2GhAK3G7PtzNEC6M9HKt9xP3f6+vzAVL5qXveV3eN1+wuEiDiiKXVtGC
         Pp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732045332; x=1732650132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qShgXToZ9Kv+9awX1uh3xmO5JncsgTOxALxM0XJgV70=;
        b=o4PcSXl9lGjo6ORxg6tGSTSr3vPg/UkeipxPvvZYiINLREcKYkhVSgyonvsvX4L+zo
         ntEITy3XwRP+c5erWMnur1TQokw2euA2LcG85B88mXqsynsgNCXsR7C1RT+b/v+jit79
         f60LClrZf92G4IjGwH8/mB2/XxqNRk07JRFruqXeA7It0HlDHOzlxz3k8g370887VNNo
         Y3sgbohCUyw1I97MCeWSoNEIOZOOnm4DcDToROpTVkl6+itxIkybtOAniW1kaJggw3No
         iszY3ytT1AvQwEG8uUM34l5j30LYZdqgARrzg5FERsdlmqY6J7vXWmQ3oNALd8k88BzN
         9K3g==
X-Forwarded-Encrypted: i=1; AJvYcCWYg0rviEmv5Nm3ptDWStOEkggG3IXIkgwDZdoxmvgHur6a/qcrfgo5i/SMZGAc+wr49YhKhj4Myudvag5CEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlIBQ+JLqAjoCrPLN5Sq5mr2+SmhUOH1t3KdAh4DyOhD09NPf0
	PW4mN2KQSCKxabxzmxSRca3TcR023euMFP0kdnQl7Kjbwis2GZA2eafRFjyjEOizss4QiEX4QL3
	Ww4N7tW+viCvePxqVYTpx/NdenCVAXS7Jpd7G
X-Google-Smtp-Source: AGHT+IGfvVyk+K2tq+NUrFIVIGCjpJv5rRw0B153zlb+IG7XqIXALW+gRbwkVZCPjDeKDVk6bT1rTsSz471gdL/t1K0=
X-Received: by 2002:a5d:64c8:0:b0:382:3afd:126a with SMTP id
 ffacd0b85a97d-38254b0211amr34976f8f.35.1732045331878; Tue, 19 Nov 2024
 11:42:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118031225.38080-1-kernel@mandragore.io>
In-Reply-To: <20241118031225.38080-1-kernel@mandragore.io>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Nov 2024 20:41:59 +0100
Message-ID: <CAH5fLgj+nTpjhVazCyPnj5u9pjeY3MMiLeMKw4UVcvvhUJ_apw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add safety comment in rust_fmt_argument
To: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 4:14=E2=80=AFAM Konstantin Andrikopoulos
<kernel@mandragore.io> wrote:
>
> The function rust_fmt_argument dereferences a pointer, and thus it
> needs an unsafe block. The safety comment for that block was missing.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/351.
>
> Signed-off-by: Konstantin Andrikopoulos <kernel@mandragore.io>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
