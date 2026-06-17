Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7194B343888
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681719; cv=none; b=M5ptQ8gpnugphFGwF4uq0y0uu8m1GixQe/52rzYEPmI0vWu5na/vkY4c2O/jFe4pOXv3Uy5oF+g2wh8jB2DCs+AJaIMBriFKWeclkbwbFivqMbeimvA32zv1voV9WpqGy2NhSt6jwONv4aBsC1Q+n+ppbo+gHhDB+v2lZdGKkuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681719; c=relaxed/simple;
	bh=0+urfASc2gfxIY6c/RRftPzs6EUNdqaNb5wjiCzOB5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ou0rDs41+XNzB+21joRTHGvehvput0gbsSnGdM2da1eiGJ9g3HkoO1kAnoxtbCpn6yM0sHeLBJa4CA/ydiQhqBwp17wAPUek5ThXskj1FBQQB8WHXpFDV7vA0Tk52zAFSgrOW5FlPrUG4REMwiuRDvoInRthlIDWLV+OVgv3NyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PXfI1Zm7; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PXfI1Zm7"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-45eec2badc4so2972236f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 00:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781681716; x=1782286516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+urfASc2gfxIY6c/RRftPzs6EUNdqaNb5wjiCzOB5w=;
        b=PXfI1Zm70OSIYL/mmA/kTpbrk/VB/FGUft5CjJx3dTgRlJxL4vl4XRnN3GePtGAznf
         GTBm53t9YArYUKQ7FL1syQrJVcDkfSaT+loeqFfKTkn/PuAKgLzqp4c1S1j0JvCo6ZGP
         xkdh5n5OSVVcOihwwcD3PjlV79hzSv5YdqX79Cv8p0GrUbtrzWpTqHpc1943XBMzZanC
         eyfvzZjqGmWgJ2Rsxii7bUiyqCsWlAosyh+ZZNjEYHs9SipbFcsTEsDcv6nwcD3V9rJC
         vUlt3pf85S3QEEnzhHOi0Jz8Na9USglm474pH1HaWoDslJrsRQNLor919rKwxUF7AoxG
         bZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681716; x=1782286516;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0+urfASc2gfxIY6c/RRftPzs6EUNdqaNb5wjiCzOB5w=;
        b=ikFGv8gwBn2n5YbrDsJPFw9/hd6Ucj0vfCVH0sNZRfxl6g1W0XAih798Oi1Al8sFgQ
         O5nQcse9uvKkwTxiiUA5Vv4brwgjJ2n3ekVrv5sMhnfTUtFdyEBN7BVm0IIrFGG5D0gt
         7+w/VLtz4BVtEYd4Rmus5WIoBpPSFSLHxp5XggRRyj8aVwSJ8K/Qd++ndlrcySfxRV60
         mkiRlWxFmkp8MX2++gL57vJqSPM6Uf4kzr2WDSwkTQVXEwnPg0PuhL4JflSdJcMJNSLG
         pED86wLAZHHAhQ/nD6g/WFC5mJpn757e2EfOAbJLmk5lXAUPPsXREZ/O2UAAO6M+rG0h
         6NQw==
X-Forwarded-Encrypted: i=1; AFNElJ/jE+SxF98rMtVc/7Ug3mnOQzbYXYpJM8ovWXudbEydcMLJYVCRWC1lHprorS+G94TaNR2M6dgc1T3kyOyKIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9SPKTLM2zFEVVb6ImHdILdADkfG6IJZQrb06ZfvJzORObM66/
	fIF2UJDs2SQVPc4IcJZd3SfCJG5SeGOgejAe5Fju1MN+QfwNoqnKTGiKWyOugYG89TTjMpUm3e9
	FHZPMx8aQcNQmvQpljw==
X-Received: from wrwo4.prod.google.com ([2002:a5d:6844:0:b0:45e:ed83:d3e7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4906:b0:45e:9420:ed16 with SMTP id ffacd0b85a97d-462370e1644mr4713138f8f.10.1781681715479;
 Wed, 17 Jun 2026 00:35:15 -0700 (PDT)
Date: Wed, 17 Jun 2026 07:35:13 +0000
In-Reply-To: <20260616223614.16444-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260616223614.16444-1-nico.antinori.7@gmail.com>
Message-ID: <ajJOMehwVZoX3o4J@google.com>
Subject: Re: [PATCH] usb: rust: mark Device and Interface methods as inline
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 07:36:06PM -0300, Nicol=C3=A1s Antinori wrote:
> When building the kernel using llvm-19.1.7-rust-1.85.1-x86_64, the
> following symbols are generated:
>=20
> $ nm vmlinux | grep ' _R'.*usb.*Device | rustfilt
> ...
> ffffffff823f2490 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::dec_ref
> ffffffff823f2470 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::inc_ref
> ...
>=20
> $ nm vmlinux | grep ' _R'.*usb.*Interface | rustfilt
> ffffffff823f2450 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::dec_ref
> ffffffff823f2430 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::inc_ref
> ...
>=20
> However, these Rust symbols are trivial wrappers around the
> `usb_get_dev`, `usb_put_dev`, `usb_get_intf` and `usb_put_intf`
> functions. It doesn't make sense to go through a trivial wrapper
> for these functions.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
