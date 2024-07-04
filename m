Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D316F859
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720084526; cv=none; b=l1al7RyuP5qV0R9Hzi6X3bpyj2CeAm70j5Zt5dknrMzOxWREiw0IewrjSl2AtPLIxKD90dJywr53GLzxgeuwB1X97PRorqhSWrjE+0bkKaC/4k31WeENw74TNlrB+nLqBYH6Y2Og55UP91fsJnHehRenUGSdq6AhVeQ1tPOipvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720084526; c=relaxed/simple;
	bh=vLvhozs5FjGScJTUM3o90oqywyCN+6LZPhKN49utzhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSbISUQnJvSgOMAB/DDevP+hklbvw7TQ5dft1886upRp7FArT4cCvvpVq18RhcccQJ4ZaCueA1JSid5H3hkMoLNWlhX/kogYMoBmplFVkv6dpv4p5HLHMlpKvYP+nlToRGn8R4wge0ZxOunercZJ5CRpdksvNHapzaOh2j6HZrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ljnrOMw1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ljnrOMw1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-36799fb93baso324082f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720084523; x=1720689323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEcu3TbmNikaAxXTCEPk6N6lySiOq4MWvGXvQXKI8Us=;
        b=ljnrOMw1AS+gkHkkrg+sQs1HUNLksGmTCXYn/7MNJRVaPUwrbzlj76BV4/ZV9nYT7x
         AzI0LopSQyVvNZMt1S+O+JxjV4eltdtxg32rHG6NZ7gU9hY7/nGqjFAGX9y7zFQckb6G
         +GALOYtI8XgUx+0jGz93PHC0v5isJVhfme5Ya9J3e0BdGPavAm/t2XSPDV+PmRaoXOIs
         K0oxaU1ivefUG0qct8uWvNfJyzSKa/XfRAZhbCxm7ViZvARDy+jrVb0T5+/LnTQxgy8/
         p8I1bRiD9oQyNjkVMpOa5yoWj2DQIKZyMWLLPqTk+mRZEsuhqsgnd5wvAciN+CmMCknN
         jYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720084523; x=1720689323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEcu3TbmNikaAxXTCEPk6N6lySiOq4MWvGXvQXKI8Us=;
        b=XPbcStc+hbXuHCRPGovoGVjXQfyNx+85yKvWafj9GJPPEFp5tdTI0sNn6vCIjnvaxn
         mfvMSqHDpy5chrinN2wOG/OJZ7rLaCyv/FzY2+03HUcsS1/SPFQt06ijvSklZX8Nj1AI
         dR4l/cy8MZkQGF/Rv2tIfsN4gotGfMfu+Q9W2ckZdfhafQ1w6QWdFpHlXfFMjv2BuPAD
         s/m/1VTOI3fD0VBWnEdizJCdFdhHuuj7pQoPUSFvy/OFbOzWNKJG/7bLUmquT3suKzHz
         uDRcPXaiFWa95oet+S5IsXnEjofSMgj1vNoC9sItd7wIws0OiP9DsxWI5oy/BZ4NUkK9
         SzBw==
X-Forwarded-Encrypted: i=1; AJvYcCVtPiB7jv9eOA0ka9bY+9BmtWnJheVAKBeiTZCLCVQE8wPEzfYR3zxOOqTelWMHD/iAjgBYgLnfQvkxDBzm7Pbza3V31ct7Wx5BC4e7Axw=
X-Gm-Message-State: AOJu0YxdE5HumhlOfkgaDHs2QmEsUhOunTbknsHJy83Gh80JtW76w/ZF
	AUHd4rx3x3cXFhyy3P0c/40HKcz3DB3YZmnLruBj7h0NbBmb/hBssfHn2hKGLbZoSQ7eO7PjjsQ
	8tjYkgCe9p/wUqY5OdgQx/nHlpIS0PwDchDqb
X-Google-Smtp-Source: AGHT+IE/247r/RY0UrlCo6aEEA7oWQssQzwGwJkUeqjFdh0tQShwvHV1WozYijQBpev7QJs4+kVGYg1txqGiSZWkMaM=
X-Received: by 2002:adf:f3cc:0:b0:367:947a:a491 with SMTP id
 ffacd0b85a97d-3679dd443a0mr835906f8f.26.1720084522530; Thu, 04 Jul 2024
 02:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703154309.426867-1-jfalempe@redhat.com> <2024070417-husked-edgy-f527@gregkh>
In-Reply-To: <2024070417-husked-edgy-f527@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 11:15:10 +0200
Message-ID: <CAH5fLgip4foLGkjzUT4vOCR1m3OgHuOq8u7=Zh+o2Zk2V45FKw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/panic: Add a qr_code panic screen
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 7:03=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Jul 03, 2024 at 05:33:57PM +0200, Jocelyn Falempe wrote:
> > Jocelyn Falempe (4):
> >   drm/panic: Add integer scaling to blit()
> >   drm/rect: add drm_rect_overlap()
> >   drm/panic: simplify logo handling
> >   drm/panic: Add a qr_code panic screen
> >
> >  drivers/gpu/drm/Kconfig         |  29 +
> >  drivers/gpu/drm/Makefile        |   1 +
> >  drivers/gpu/drm/drm_drv.c       |   3 +
> >  drivers/gpu/drm/drm_panic.c     | 338 +++++++++--
> >  drivers/gpu/drm/drm_panic_qr.rs | 989 ++++++++++++++++++++++++++++++++
>
> Wait, we can put .rs files in any directory now?  I didn't think that
> worked properly yet.

Yes, but Rust code outside of rust/ cannot expose a Rust API that Rust
code elsewhere can use. Only C apis can be exposed.

Alice
