Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723D93E0C4F
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916359; cv=pass; b=g4b3DKTI6NITZATurSVIHWMtVOCq6d2rZ9vr2V6R1xife+PGtx67W0xVBTd+jE5wKvvYeiQy1oWnAoo002SaijZ3WOgtMjjkD69WtEzNES8g0KZ77Fv2E6J9h3gOSAepfTM1R+rJuJ0aWzVMAUjEdbXTmHc0wfQjOqaIkdwhxt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916359; c=relaxed/simple;
	bh=pNEDEGkvhsjz0oUUfWOaI2HwjcWdvqQEyqTxD4WWlEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwDjDl3G4+pUMzSTAd7SiCL0IbdwKoE/qA5OKx8KDwf0YZKEPKoDdRabo4IdgsM8MSneKP9H/R2EE2GVccHzU+hykemXzx/WWcZs11SNMzO5axpwmzhcaJGEeNO0CaLZHzNHdhUoez4awKKknhXYv/GIua1zB1LNQDshr+sImQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=doCVckUf; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="doCVckUf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so476299f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 00:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785916355; cv=none;
        d=google.com; s=arc-20260327;
        b=T83V45tpC3+mglN8I3n1QmRTg3XOp7BY91VZ78HhFaT7egI0mMjR5pdZtuzGJlShVj
         dQRMaI/PoZf+kEAzNm33ODi0Hro7h65trFD0FBJ2jUyTGtbVmt2w8OVmox+NsSQibEtF
         NP9BFoJsh6KN4vPO3qS8dsMOVnh1rL5Lltrkbo6O9AHV7FQotKhzZ6Z4RI+kSNc/SB8p
         Va2bw7vU6lWGzZrZnYKZcldkIZJGSEpyAZyPXt+13bWV+7c9QBSOLXbrnbMpv8Md91Hk
         wLjMxzSznMz0v6EtROKBUqnfX9fKquVH7K5s+e2wdgt0HY4v9ny2xR4bfQsbqiOwGWYO
         l3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pNEDEGkvhsjz0oUUfWOaI2HwjcWdvqQEyqTxD4WWlEc=;
        fh=HRYGk3J+YbJAVzdqrONi1htQGcqs6q8E/GmIvXJgLAI=;
        b=IH0nFpjWe/OrnisFtffrTDrmNcEzXtELfUnjhxylK0/vGRPTDMfJ0cDsluzfP1kZT9
         c3ahjBPjwsxb0vfpT6nbxXt+RbEy3RVT4LYUhJPlEOAoCnUZay1xYi62K2LC2SCRRkSp
         Yn0WabWsbIQnK8VlVcjbpmklZT/x4moVQWPA/9cBov8M8Vn0e+7A8k5LoCVURJFrsZBw
         3KGk0Ky3W+zIScO5pNADAuG1lDsmwDuOCuxX4C3+jzrDlgbyWVdL8XkFXmo9mDlBSRTQ
         rbluEtkek0Gv9n78jdfd1+foNjhkHHccg1xZaFG60gQo+hv7jaf9bhf8IXDwp+igaHrM
         6bBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785916355; x=1786521155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pNEDEGkvhsjz0oUUfWOaI2HwjcWdvqQEyqTxD4WWlEc=;
        b=doCVckUfF9YfZ7BvDitmSAr8L1OkJtxwgdwmh4PvADmlvpMuFPg9G1GVL3wu1BxvCf
         Xj5x1jpluejugpRBybCGwH3LIANFoiX5yxdolDfvQD3Zg9kK+n9z02rZh00+8m8W8RYe
         fBBNTEX1u6UNEnICIj1tvADzWIWNb8MM/HBMtyECIZR/m/d9xWTq03xTpy/5jvuPZsU7
         CFck9Fs/VEYPMC39CrnM2XTqcRdPPREqdBHdhLaCgNDyYwhcQYxCB9k+O5+p5QCKX2bC
         jgrUuZPPFd0fF2fRA2XyX7lFI47wfv1dT+g6FOYuaab25PFTlGgBoqDXaxPEosggfNQS
         HEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916355; x=1786521155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNEDEGkvhsjz0oUUfWOaI2HwjcWdvqQEyqTxD4WWlEc=;
        b=gRrQqcd+SrOTTR5XDo62IxU6dr+pEnLZ2ubt4TN4xVsytJrZNYAOL+F3uSWd9Widtz
         LxpjBGpCftcsM+hFP5zULVfyh0a4E3V3sk1x3FU/oOb9+9wtPj3izgYK/G+UbV9tPENl
         ZRs+BmtnqIYxlH76SA6s6b78XQTzRmHmSoNxHDVxE4LN4ELDQixj25lqGSz4pHAqxG11
         4QaDpf5r82eqp143kX2lbwMHwgTrzMc+gDOXAokhG+u7ppQwEmvhXOBonvMHPxFsVVs/
         TmUg1Y0B8lf7n851LiXNwHV6ZEW5yYxtZDudrWGEldOU0q/A6WRiLxkoeBmDIsT+qx+H
         UlZA==
X-Forwarded-Encrypted: i=1; AHgh+Rqurzr02APsHo52zEHV+wyPq2Ekl0f4VTVaFroydf6XPpnzEgIcCNlYzTM7RZnoBmxU828yZhsXdLkg+rBvAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ8Qj/NqNny/duZr938gw0IkXVEXf4Omp1puCYo57fHtfijzeF
	BNSpfiEhaMiWgIaspEBt+W8olxhL6R0BP9kchd6yZdep7MUDArQjLO18y7PLnT5B+oV4gmhKBzX
	6YB9wntUU/xUvH9t39Fot5eOP8/MHmlU5PaTf/rxo
X-Gm-Gg: AR+sD10X56AA1/IHJnxntOQCaMKg810axH9p1LrujLMv7gkH7ps3KTaWOf1beywMYkZ
	zPovWRTjgbhFWPdJidLBYzwCqZcPUG3LbdEJDr6BGceuUefG+/9YO1X1P5q3rXki2JrHVFg3ksT
	POZsvx49DhU2ZMomFnv7GfWyhPBy97Fh9nDtBy2wrYtA5dDR2VOevRvSA3G3a4AU+9YuFy+WRKj
	7qgT/1kaukorlrQ38i3xr5RD18co+KYPdW1llG4W/Ip3oYQnljmrXFSeBBkGijWFMHNJezY07c7
	tJaSmeha7CaS5Dczn5S1oYcfWqX0Du57LHXros/aplEpx2u5hmEw13H9G6zrVfCJV0Dg0AldVhw
	=
X-Received: by 2002:a05:6000:46cf:b0:475:3a97:8e2c with SMTP id
 ffacd0b85a97d-47fec62d8b8mr5492989f8f.16.1785916354952; Wed, 05 Aug 2026
 00:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-inline-wrappers-v1-1-16916db867e5@gmail.com>
In-Reply-To: <20260804-inline-wrappers-v1-1-16916db867e5@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Aug 2026 09:52:23 +0200
X-Gm-Features: AUfX_mxXQfbIfIRglagIcJY8aXRXibWNJw_m0iRmxH8ggsi6AStaB60A1hf5LBk
Message-ID: <CAH5fLgghsXHTWfdQ8j44kXO3+Da-YzhJxxP8ncTbfmw-c=fW4A@mail.gmail.com>
Subject: Re: [PATCH] rust: pci: Mark Device refcount methods inline
To: plant.ethan@gmail.com
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 1:24=E2=80=AFAM Ethan Plant via B4 Relay
<devnull+plant.ethan.gmail.com@kernel.org> wrote:
>
> From: Ethan Plant <plant.ethan@gmail.com>
>
> When building the kernel, the following Rust symbols are generated:
> $ nm vmlinux | grep ' _R' | rustfilt | grep -E 'pci::Device.*(inc_ref|dec=
_ref)'
> ... T <kernel::pci::Device as kernel::sync::aref::AlwaysRefCounted>::dec_=
ref
> ... T <kernel::pci::Device as kernel::sync::aref::AlwaysRefCounted>::inc_=
ref
>
> These Rust symbols are trivial wrappers around pci_dev_put() and
> pci_dev_get(), respectively. It doesn't make sense to go through a
> trivial wrapper for these functions, so mark them inline.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ethan Plant <plant.ethan@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
