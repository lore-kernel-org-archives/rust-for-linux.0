Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171721922FB
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753340643; cv=none; b=LmQp0WZ+gdhDxrECWun7uVVzPbV98uxyTSQSCp4m0KZRZ0yIw9RF4uGVUNOq7vOhG5UV6TW1TUn641H8at3gdjR2ccD/oj45kMaS1Hoe9NS4u2Zw7nNgMu81Am8fs9WOdAtopchDGZlhW2s/P3cuGOElFZpL4iNpDcYoWd1BEfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753340643; c=relaxed/simple;
	bh=QTJ7r7C3ZFO7a5agDautUThWpNI+VJE5Oz9r3BgT+gU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VL4+T4BmMxN8DHuyfAX9VDw7Bqat95KLSJmtkAxYlSidCIr5E7yn2WRIn8IfABn86PLYtPs3aE2rvjVYv4hJBLp5G16/vCKHTKl0K2OcHUv062tz2974aSAAZz+jip5poz79Mj45zcvj2FwBnZy1dBWLKO/khNSFa2xtFrsEBpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oWGWHEL5; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oWGWHEL5"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso495653f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 00:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753340640; x=1753945440; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=27meuAR7DraeZHJ6a+OjhaNc/M42e/MMGfGfJFDEHo0=;
        b=oWGWHEL5k7rUg/QemyPOiqgSygCXc6IxzGIt+1EOCwHX7xujRPPfxZMS3YV3LMT7ib
         qZGGUBqx0KG0G2IMkQHU0O40ZfIQ6QBIIlmytsEmDL8TKycFMd1xsUfiCxzJDtalgwk/
         ZKxC3A87fsx6Pz0ONu0wEVHEy+WCONihDWSLtS1UVvbBbal87lXT7/uzhRP8w+TIgysi
         +RX+Dld4btDaUreh/YlZibZjLuDhRUNT3wp5uAydQg23wRbayHw0M6eAlqu5TmMX6eeb
         wSnPGA2qTY9MPpDHPjKLbxH4sPWoSOmIsrUXqPkuEiOc1g6RFy1j+W4r9bLBLH+m8VRf
         lZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753340640; x=1753945440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27meuAR7DraeZHJ6a+OjhaNc/M42e/MMGfGfJFDEHo0=;
        b=V7Xb3+vd5rc4ugO5BV4e4Haq3wgP7YzwaHF1Pd5xiRuCZiPodDb2R8BaePB2Mup0Go
         nx4N43giOasgN9ZFwuD/SQ9eIVj86wSj8JooLGTno7H1M1PY7K0NwGHNfBVytXai1FBH
         lMlrxrtUeAbaFck8TFp1Y51bvAwjPYuWfnfvKxpGVsXc6DS6OzCNRIVhhN3tXK01icLS
         zkqft5S4hJSwV2IABOlblZkLJiL6PT1VaKPOy/31SbW6rXlOY97Vdmr39cksCbV72Ttg
         5RcoOqo+6I++ImlxLf7HtkGrZp3/Jm4Eyb7i6otwgAqdIl21nPfHcmayiTyYSo7RtOYd
         cXIg==
X-Forwarded-Encrypted: i=1; AJvYcCUEamee1MR5YtqiDtwMetmPnOY+ghtsIKEoKXxBEeVqeJcYCTt7b5x5cNolN/fu+WtyvbBz2z0W+5Pvl/2seQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygG4ubk0HdDAcHiTqOxbLuGUjmtniAtHG8FrfNMZgEYOFLkBBX
	auoeWpgj0zSCo9/rkNRyu1t1qKoX7NWDfsJNaXBDLrqCNvpZa6U4DdiQX7pICqYc9avsSbd+aEE
	BmbPIG0QEx9kgGX/Kaw==
X-Google-Smtp-Source: AGHT+IEwKScPW/JogOSPYSdhmRfbWJWflQktLJJpf5TzQWj4h0zY5hW7bYqP/Uefc4NUfmbZblwANGYrRFWJFkA=
X-Received: from wmbez5.prod.google.com ([2002:a05:600c:83c5:b0:456:13a2:2e7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40dc:b0:3a5:2e9c:edb with SMTP id ffacd0b85a97d-3b768f27001mr5035044f8f.47.1753340640361;
 Thu, 24 Jul 2025 00:04:00 -0700 (PDT)
Date: Thu, 24 Jul 2025 07:03:59 +0000
In-Reply-To: <20250722150110.23565-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250722150110.23565-1-dakr@kernel.org> <20250722150110.23565-3-dakr@kernel.org>
Message-ID: <aIHa31DiaRvNK1Kb@google.com>
Subject: Re: [PATCH v2 2/3] device: rust: expand documentation for Device
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 22, 2025 at 05:00:00PM +0200, Danilo Krummrich wrote:
> The documentation for the generic Device type is outdated and deserves
> much more detail.
> 
> Hence, expand the documentation and cover topics such as device types,
> device contexts, as well as information on how to use the generic device
> infrastructure to implement bus and class specific device types.
> 
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

A few nits below, but in general looks good.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> -/// This structure represents the Rust abstraction for a C `struct device`. This implementation
> -/// abstracts the usage of an already existing C `struct device` within Rust code that we get
> -/// passed from the C side.
> +/// This structure represents the Rust abstraction for a C `struct device`. A [`Device`] can either
> +/// exist as temporary reference (see also [`Device::from_raw`]), which is only valid within a
> +/// certain scope or as [`ARef<Device>`], owning a dedicated reference count.

Doesn't there need to be a comma between "scope" and "or"?

It's possible that I'm confusing the danish and english comma rules, but
I got confused when reading this.

> +/// # Implementing Class Devices
> +///
> +/// Class device implementations require less infrastructure and depend slightly more on the
> +/// specific subsystem.
> +///
> +/// An example implementation for a class device could look like this.
> +///
> +/// ```ignore
> +/// #[repr(C)]
> +/// #[pin_data]
> +/// pub struct Device<T: class::Driver> {
> +///     dev: Opaque<bindings::class_device_type>,
> +///     #[pin]
> +///     data: T::Data,

Should the `dev` field not also be pinned?

Alice
