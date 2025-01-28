Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265B1ACECC
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738074938; cv=none; b=bx/ezxvNpA4nEL3JlJe+HMPEt06Ub/0gl3lnmRgEtvsxWcEFbt8LNWk9RB+SMeDfjItENDbYqxsLVupSsbiga9KaQ3MhAIw+QJwiKKNyh4YIHhOzL0K/8Z1ix+HbIHh3pzqYxeLxTkrIHItTy9ZeVFfNhZOPumSzDkgs1kKtVeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738074938; c=relaxed/simple;
	bh=rzTZbC89raWzqdUZS129znA3iLUI7DPqxswUfAIp5BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QevpU5AAmkATXmYyHae74+DwX6/5DcggcCh497O/u1bKVtz5sR8SSujo8yZjjDHsq33CFlFdcDYztEXVKIg2IhaMYrIULw5opacBu81N9TwpiRAoicw9C15a3NRs7vDzi2hUcOkKQZ8AqzHKM0zVCGE5C7ZRvMODDPTUL0vK1oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4VdH107K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4VdH107K"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f664af5so65594225e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 06:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738074935; x=1738679735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdzVq7ImPqyt4hcMWMfRKSFRDa8xKXYjx2n9G9K1aBQ=;
        b=4VdH107KO67tkmazoR0BfJNkhB9yK/cdQ4qOi7tNPA0X2WDOQBIahwCz1TRMQpUnAT
         h04zLsMdzOh0OHS6Sb/gV9MnSjt8XfE33ks9p1yrwfn4SLv7D8xy7s6Z3T5lrgA3QvqC
         w8kLgWhM3lNQsPgXbv9XwXm5G/nBU8Tf8oznOS0pZpU7vAgr+KldE6geXB7VeLWkF1uK
         v6WLm2Qro8REpqn9Wa1NJrgJ4BTBWJPcR6vLdklsmZXyoAbzTLay3arVEjzqDnmGnm7q
         L1U1Uqsw3uxeA0tJKeqWKUV3yP6H0R2AAgJ4l/IMmb8xtKmbnQYYL73zT92l5uQ2X64i
         Eo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738074935; x=1738679735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdzVq7ImPqyt4hcMWMfRKSFRDa8xKXYjx2n9G9K1aBQ=;
        b=GkSpc5XMYs/RadcclvzLMxvqTXv0ikwZkfHY6qaQ6A4sh2riKR4g8pNt93AFIlZmdO
         K55UE+7OXxvVtM81ofMX9PQwlCAQPeFzeyY7afxH6ZGujjiPNrKrlN6p2NTP7gDyajxQ
         zD/Cj9UzNiK/OtyKNfNhfrk68riYU2PkyMV+T1ZVT497S1M2YfENH0smKKmZOMkG39Wx
         SHohE0oRizKtFMRNDIOR0NiAp88YEQ9HLsxpDWf88YVbH8U5seiBTGVTW7Honxyd4r4L
         mfPRx11dJSC8zVEnhlmrBIHmB468NPnWBToIIm94Qzi4U7lE4hejGiZP7SReEYg/UzaZ
         ZrOA==
X-Gm-Message-State: AOJu0Yy9CBthIkD8+JcSGkS/k3GwSCajxkXt+46I8/dSc//zLB/ykfZv
	YpU9dtG1quCacsjJRlaGmE1i4vsACVIgGX+9MHynSYAmxRAZE2S8ei6vTWlkkfWsRRp5q98Sfrn
	j9MmZ7YAc/wkry0B8bxWvx+XUMxvhYic5LVSA
X-Gm-Gg: ASbGnculL9wweHyJnwhUMZ/+cdQ7qd5Hftt7BMQ3DLmpF2B5S0tSeu8bIcCPU+htRPB
	YGfIDOcL+e6db5XLRbxf7DhVMvrWZRby3FQBiAOaqupLMGLHCyGOt6Hb21e+d+EuO3+cElQbrNd
	XRqMVuU0JQO1YoXJrH95cxWy45eqM=
X-Google-Smtp-Source: AGHT+IHeERFZmLKb+RXBeZ0icrNT2IN1o/Yg3mnczAP+xSiSri8sXZEML6d6B8sdGsx+TNHSiulN7hxc7u/O3TQn6yU=
X-Received: by 2002:a5d:64a1:0:b0:38a:8ace:85e8 with SMTP id
 ffacd0b85a97d-38bf57a98fdmr48075730f8f.44.1738074935329; Tue, 28 Jan 2025
 06:35:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122235340.2145383-1-lyude@redhat.com> <20250122235340.2145383-2-lyude@redhat.com>
In-Reply-To: <20250122235340.2145383-2-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 28 Jan 2025 15:35:22 +0100
X-Gm-Features: AWEUYZlBZEAluubzKS9hubby7-AAC5P6PivhKHmUDK4RDiwAVlx04jgBjZRCui4
Message-ID: <CAH5fLgi1iGi9kMzDjEb_jQzzAm+y4pmfNXSneoLHS6o+sCv_8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust/kernel: Add platform::Device::from_raw()
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 12:54=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> Just a convenience method to convert from a raw struct platform_device
> pointer into a platform::Device object, which we'll be using in the next
> commit.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/platform.rs | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
> index 50e6b04218132..75dc7824eccf4 100644
> --- a/rust/kernel/platform.rs
> +++ b/rust/kernel/platform.rs
> @@ -14,7 +14,7 @@
>      ThisModule,
>  };
>
> -use core::ptr::addr_of_mut;
> +use core::ptr::{NonNull, addr_of_mut};
>
>  /// An adapter for the registration of platform drivers.
>  pub struct Adapter<T: Driver>(T);
> @@ -186,6 +186,21 @@ unsafe fn from_dev(dev: ARef<device::Device>) -> Sel=
f {
>          Self(dev)
>      }
>
> +    /// Convert a raw pointer to a `struct platform_device` into a `Devi=
ce`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// * `pdev` must be a valid pointer to a `bindings::platform_device=
`.
> +    /// * The caller must be guaranteed to hold at least one reference t=
o `pdev`.

I would probably say that the caller must *transfer ownership* of one
refcount or something like that.

Alice
