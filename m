Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273DF2DE216
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070800; cv=none; b=fSR00IBTAFBL2NFDg7b4uyyQIDQHbcxhKg/nMqSqYMHDNn70EInK5SLkVg6G8u54KOOUgcnMbsu32FFgT0WaVmS5G28t661GA1VdCEq05+Nzd93WVGOAaf+0KnuBODg0r0W8hqNXnqNEUCObU7bJbucZ5tQ3zwsuhSLU/6IHeCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070800; c=relaxed/simple;
	bh=onxQyqbXg2+8eNUdjRi8yLtGmLMnVsEDz+kKPNPRjAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxynh3fFf40hO2M5SLkK5rRdfF+DPfxiclMC90HlMStBb5bp5tUlkTsNe9JluXhj98zqdxZiVVsqrIe5Ed/gI4eKV8lOyv9caSkiAl9l1Cux5jhJ2+Z5YYesaF4hDlXDdEsoFrLHUlnpFhNTaWAjftopELtj10Q/YSfNUqGnig4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rAXtNAZ1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rAXtNAZ1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso4337999f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 07:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752070797; x=1752675597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onxQyqbXg2+8eNUdjRi8yLtGmLMnVsEDz+kKPNPRjAo=;
        b=rAXtNAZ1g38J888WZ3JPtxhSSjvhtdzBT1x84EFomAUxBE5XsMEuj5EzF1YBe0YK3R
         eRGUZdXOC6gmvdSzsmcuVT9w4YyX/YcmvUwbs2uSJ10DZA6UFZtVH45NGFbFOdNlizYo
         Na6SszQyri6aH4k0JkhSo7t69kDtPMvKDHtCUnOkB0oMJkdeCB4iv7jTrt31DSzDBSyB
         jAGmJ4jCVn8KXtonYHCJZRooTAhJ4bV3fq9ocZRwR62QuLAycEuOOb7I02DF0O1dYiUw
         uz7+9WjQObcbcMoPoXaEQr3U/ama0oJ4aHrqU1juD2cdJOVpbMwy4roMg6j5Qs8w5P1B
         iPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070797; x=1752675597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onxQyqbXg2+8eNUdjRi8yLtGmLMnVsEDz+kKPNPRjAo=;
        b=VrCXEvLnOFhYVQMxupvZZCPWGEr3K/gq2bCmfRyTlyY+uLsiRcCYq5/pyvsooCKtS+
         f6Bd3oOpE4ln+QYXdplLdQp1wey+Tzlwrtar7dk2oqq0MB6jnQwGOV7/20MVjkvfyxNZ
         A/FflqBYbV4hrKqnJWn3oQ/bOBGLIkm45XJb3JnYX4Kk6qfNdOm5XEzZdQ+VFdABCkwh
         FlS5WeW/LCNS3jlRDxyZiXGDSZo0YSQDSIk9qt40Vp4Iz8ZeW/uH9/oKmb1e9aFeVCnD
         +kYbul7a6U/Mi6+/6VrjRWK6dhnVjfapokrzzGd56rzuhyPTizZpjvAVcLO7ik6Vk7+V
         GhmA==
X-Forwarded-Encrypted: i=1; AJvYcCWKh+sNTVLR9+D/GFB7gIXvWo/LVoCI452zk/8bsfeuLk6pnPXyoU9NumU1GEMBvDFHNzxVq8ZkXN+AabHNRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5XvcBKHzRjW3PTP4/LBd1MnASYRqksYiI/g4d4NS7VqP/OIm
	DKlDJKcjrMt4YJaQ88g3HbJzkrc79+MjHm1y0wgoOgMhxAjC45+1+hKOyks8uNOiJRAb/a6l/Gb
	1hJK7F9einBYDt8q71NV7RGT5e0wS0Di+9Llni16k
X-Gm-Gg: ASbGncsLTOiRiKr1CQhiCwhZrADnr15bHvMAMT2tBe6QGVEWOhL8s+aB9bVVXasG3R6
	OwsmowCuhiIrckv1mNJykaiN4k8nf7vcN+eEGpg8wY7L6ajaGHD+7FXYGrhkLLA/PxV/7XcDuCZ
	9GO0C+DUqHmRBpw2TTaefx4H68zYo+0+lTnzUz+67QO2AcT/cnwdfkB4b3AnpaMyIMW6+augP57
	w==
X-Google-Smtp-Source: AGHT+IHymgYqf5Be4dPgTGavXNkdAqtCHlNw8IloAmJ/sAoTV++LmztnNSzx86sJhSRZfMqHeXmmwb/R6uZnNJhr5Ts=
X-Received: by 2002:a05:6000:4712:b0:3b4:9721:2b13 with SMTP id
 ffacd0b85a97d-3b5e450988cmr2292725f8f.14.1752070796982; Wed, 09 Jul 2025
 07:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-device-as-ref-v1-1-ebf7059ffa9c@google.com> <DB7KZXKOP5F0.1RMMCBJNR43KO@kernel.org>
In-Reply-To: <DB7KZXKOP5F0.1RMMCBJNR43KO@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Jul 2025 16:19:45 +0200
X-Gm-Features: Ac12FXzkjhW6iD-XDuQYdQEQJTvTDaPwURvqNJ0qQ1PU5t7-VlkiVmA2ozb6b7I
Message-ID: <CAH5fLghf1zwmR_hLVAxYU0khmeTGEejTL8qE_BaF3d-Ncg3HAg@mail.gmail.com>
Subject: Re: [PATCH] drm: rust: rename Device::as_ref() to Device::from_raw()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 4:07=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed Jul 9, 2025 at 3:53 PM CEST, Alice Ryhl wrote:
> > The prefix as_* should not be used for a constructor. Constructors
> > usually use the prefix from_* instead.
> >
> > Some prior art in the stdlib: Box::from_raw, CString::from_raw,
> > Rc::from_raw, Arc::from_raw, Waker::from_raw, File::from_raw_fd.
> >
> > There is also prior art in the kernel crate: cpufreq::Policy::from_raw,
> > fs::File::from_raw_file, Kuid::from_raw, ARef::from_raw,
> > SeqFile::from_raw, VmaNew::from_raw, Io::from_raw.
> >
> > Link: https://lore.kernel.org/r/aCZYcs6Aj-cz81qs@pollux
>
> I think the link you actually wanted to refer to is probably [1]. :)
>
> [1] https://lore.kernel.org/all/aCd8D5IA0RXZvtcv@pollux/

I can update.

> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Can you please split this patch up in one for the DRM renames, i.e. drm::=
Device,
> gem::Object and drm::File, and one for device::Device?

Sure I will split into two patches.

Alice
