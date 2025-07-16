Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBDB2F430F
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661228; cv=none; b=ecE15DdfLBvun6BgHanqFf/iXjte2X0uVpkAjZMl5pd2meVldoUMVVDy55XaSM3CmJAR5ii0IpCon50ePgSEfqoVsaXh9XiAOx8UZIGgt+/LHUGtoh8cPvuthv7TIXexu2socnKwEW1O4C7pcAh53LQ24Ic3yWjQEnHcyMbPfj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661228; c=relaxed/simple;
	bh=FsDCbxIrdEDNgtscymGbU/ukUJM03TBJNmEUas+yB2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASJzDX/s8KM+xVLuXEzaei+HCNc80bB/6RezJ6TgYmxbXWlrYYukEyR0wdG70j8H/jibXvJEHXPPVMNEQI7AwxYxHkXYrIFF/OLdRhAvbid4vj9Uvyo6Jnide8MsANvuxRBqMaMk5HG11CTadceVz8XZ/H4OH3NyJpTj4RTJ+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nC3XUGyR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nC3XUGyR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a53359dea5so3368961f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 03:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752661225; x=1753266025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLdRD/rYSDxrRiPrKjxupUrJDsVMgCy8eDe210xWmpA=;
        b=nC3XUGyRY+CqEWKOfDuKuxrUbO1hwKDXhe/WI7Vg6h9nBIZpk3w5WsrPp3vJBlsGt+
         VKU5BX3PxKfAuvS9TdB3+ql04XlshQeOtvOFOKknKuB1PyOGOweeNcjKy458Mbg/Bs1u
         WVVKh9REmOcajuWaK+CHqZLzTwWO6AQn9zZdTfEbAgsKxD25pGNLJFJmxhgvo9uZz2L3
         VUfED9xN/PXtzfph99A2QPLTUTieMyUYhGLNUrm7+ER4Q+PcLuQwEZ4PKy+jVx33VG9S
         P33pv6GfceMbOf6ahlnh2qCi7c89HpU+gniK0u8uNvQZ/2sil6jrNd8cKN5jA34VkQ8C
         qiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661225; x=1753266025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLdRD/rYSDxrRiPrKjxupUrJDsVMgCy8eDe210xWmpA=;
        b=PT9+z1oi+uEqPsqO7BdyrhEM9hhwvBA//LEdTeTpgGMeoLcn5bA2+skN09HgoeW6PC
         Xt7Dt17K/DRJuG4jHIHbJ5ZGZUYLn0++4BDPJOekDTI1ZTbCQ0XaAwyS8FsVv30UB4Xg
         HxGvTsvUJL3FhdP5/pwg3PfoCkbsvPKTS11w6qC/e/imKGCAXBtdHOyvPVGlJabuoErr
         KrXSysNJJxhfZcG/c1SOy0lygXPEVCGCdq1F2CzICRABOotwXFvfW/KabhCDcW5YduHP
         8+u+DIYG+Ly2eR8UroFOJYAeJRBLpPWTbIM2hV8KB6qtREY4v3NNejZsWnJVwB0F9jsE
         sCyA==
X-Forwarded-Encrypted: i=1; AJvYcCXXCWwjZWnKUR7oWnWwCfITPE83h0tNAPF73zX+UoNL8hOvATW9+22oEnGsiVEbQwJjaSZenlt/3EsGNnjhYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbh3AcG8p0w15ZiG++y5RZ6qnGRqu1eHmRBpkDNRq6f6GeEi4l
	9eKhOPWOdJ5jvnc9mBjKniQWFciTqzsp4SFxQ+zJvJNCMwz5ICHShDC5Cjb1qBc7X9faA47KiPM
	CdFYtiVjsyenTECjvYQTB1fTDEyFgRV8hdsfQGYSS
X-Gm-Gg: ASbGnctqDKsksq/tFAhxxvNRyrHl4RLZUbjcza5QfzvRNP5ZZNitxnHN/gLsF7Epgj8
	1Q0HfyoFXtnXToMx9rWRuTLIADPj9izgr4YlmMV3twZlnniQCAuPyBsjmUyjG+kGrnrWk7rnpJ0
	NLsfOEq04wjL+76QRmFKgPSqf+8rn2gZjDcQ69y6T9z7JQM6Qo9PFD5pEpdPPnvr0soiicDZfKi
	+Z/sb83at60s1hGTKk=
X-Google-Smtp-Source: AGHT+IHGPbykOa+VhtPgmNDR6icoAO1dEHICPiC0AS1kw6SseHwGR/MgNs0h2SQvbtYUMP2lN453W0DnQsoZp3a/5qI=
X-Received: by 2002:a05:6000:2f82:b0:3a5:39e9:928d with SMTP id
 ffacd0b85a97d-3b60e449c01mr1750933f8f.0.1752661225152; Wed, 16 Jul 2025
 03:20:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710194556.62605-1-dakr@kernel.org> <20250710194556.62605-3-dakr@kernel.org>
 <2025071627-outlet-slacker-9382@gregkh>
In-Reply-To: <2025071627-outlet-slacker-9382@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Jul 2025 12:20:13 +0200
X-Gm-Features: Ac12FXw8B9PQG3j671n5PyK_e0eyxwbCYEp8MPVMN0HF32b-P_4Gvwpr6rfeeRI
Message-ID: <CAH5fLggL+F-B=9YX7jGJux10i+W2t-4_QRx=ze9WHYasx-vRww@mail.gmail.com>
Subject: Re: [PATCH 2/5] rust: dma: add DMA addressing capabilities
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, abdiel.janulgue@gmail.com, 
	daniel.almeida@collabora.com, robin.murphy@arm.com, a.hindborg@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	tmgross@umich.edu, bhelgaas@google.com, kwilczynski@kernel.org, 
	rafael@kernel.org, rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 11:15=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, Jul 10, 2025 at 09:45:44PM +0200, Danilo Krummrich wrote:
> > +/// Returns a bitmask with the lowest `n` bits set to `1`.
> > +///
> > +/// For `n` in `0..=3D64`, returns a mask with the lowest `n` bits set=
.
> > +/// For `n > 64`, returns `u64::MAX` (all bits set).
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::dma::dma_bit_mask;
> > +///
> > +/// assert_eq!(dma_bit_mask(0), 0);
> > +/// assert_eq!(dma_bit_mask(1), 0b1);
> > +/// assert_eq!(dma_bit_mask(64), u64::MAX);
> > +/// assert_eq!(dma_bit_mask(100), u64::MAX); // Saturates at all bits =
set.
> > +/// ```
> > +pub const fn dma_bit_mask(n: usize) -> u64 {
> > +    match n {
> > +        0 =3D> 0,
> > +        1..=3D64 =3D> u64::MAX >> (64 - n),
> > +        _ =3D> u64::MAX,
> > +    }
> > +}
>
> This is just the C macro DMA_BIT_MASK(), right?  If so, can that be said
> here somewhere?  Or, how about turning DMA_BIT_MASK() into an inline
> function which could then be just called by the rust code directly
> instead?

Converting to an inline method would not make a difference for calling
it from Rust. We would need a helper in rust/helpers/ either way, and
it's also possible to define a helper for a macro.

Alice
