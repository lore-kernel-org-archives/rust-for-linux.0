Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5562C2ABF
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752068185; cv=none; b=nvO/pAtT0FLKvCU/zbfgur3xzzznSXwXNt0jbjs4WCUuhiAb7ZTpYytyVyeTTIwRYoSq0EewvNhSpKlzERyVkLVV+4ATtyibhUgvl9/xsVP7GLCWv2PHIJq/W0ZuUuQGd9fjKdlR1pBxEIpo0I38PwS6mec+tcEnn6OzmM16coU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752068185; c=relaxed/simple;
	bh=unlKXJBhWL7HE7TTDy2vTAHpjeg4BcukQ6864uuG9pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOLTY/k/K7cqnxaaZ0tmYVha2F5poKCewgC0kpqvMbdjxkLGL/7emhG9S+5gu8cj0t9GkDuyJ36G7/6C/gQEsESfkGqa88OFFu0P3vAPjtKgkyX5fVefSYbpCVjaySVoQk/0mSyXwjcbQovVTFEbXR0SLbOA/m1CEeUEPzyAFMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zRDP7tmq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zRDP7tmq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234fcadde3eso79293765ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752068183; x=1752672983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8QwFWHnoroOy7d+kOIv7RQtuglWSW8t0P8/KSAe0Eg=;
        b=zRDP7tmqJWIOfk3IHMdsl/YFqxj2YIaAUKXyr02Lx+sJyw1vqVGFScjMTsRIy6CEtW
         vAGVaFGLCnYmOMOzRvTI+lNnamUymqAbxS9fs5O/451M9YxvgvPQm0H6EGigRfIQzdDW
         BZ4l5380icUd2gk0J8dgWczb73A5KQU/H843ULa/U9mxgMjAMOv5HSQ+FWSBWEpi55mh
         0kQTw2bMbMsAKGwKeL8j3zCU1TFjIKhQQ84lJ10uIOkyUZzZWE+R1DTTbJegus2Y2Pqr
         sJWF2PZrlLqZgfOVHteYqOUE/RVyT4eED/0gDTyuftDOTgvTz3aP+NRfLiLJX4DrFj9D
         COCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752068183; x=1752672983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8QwFWHnoroOy7d+kOIv7RQtuglWSW8t0P8/KSAe0Eg=;
        b=KZbWq6irXtdCkSA7Cbvp7I/KZeNbo4EiXVPP1qc23wlJli2W3UMsWmuGWTLNhkkvjp
         rDUBxjoiUW6l8WbYDNms0mbk25rer0cW9QsCga00EBaon27swgpUNeYtjP2VZpRCra82
         S63LeZfIr7SyOQT42vzBCJKtensLH7Zu27J7DA/dL/rlrFN2PQtW6Y/lK7kkSn9VNoZj
         eDXqRplknFkRhcYdqtB7Y7sKLq4qxl0eoZIRPcdvueOmKGf3EFTukckbjPtkEmpZ48Yw
         G7w+6sMImUOnO+B0YD4jOWUs3fhk5brbF0wv+qpFx6y0d7Gv5/cKNLju+L6WTn/Kc9eJ
         eJCg==
X-Forwarded-Encrypted: i=1; AJvYcCXLHIKj4BZdQYs2J+bE15OI4Buq2E+sxVyVlV1CXj0b/wUKrDAnKMUWfGyIfTl8qc+4/E00y59NPlrFObGpbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnfbRFNgjsGhNZIK1vRkUZqDtg760U+zNObMZxWh74QfiAUpis
	AxIDdNDOy04gSmTrgPG1w3l18UtPDI2tnHbN/fzZhMH3k2Z5XpuG8QRhg8wQvtjTn/EMAi/zHS+
	lWukqaksBgNm38wR3Daf/vWSHWMgrYB4LpPJEe9XE
X-Gm-Gg: ASbGncuGY380mVyKtNBNIdxk7fRJp3qpEHunFiQzO+rcsJGmTFw+N3wP8gmp1TrESoA
	7G+9JMgVAPlSoCdXAJEzXhor90ow8mIMfpKpzsoXRL4tPawB4takLvk1KphBiivwVLBxXX+StZM
	6IiAZwcYbDKRM5+fyfJ0iVE5NIo2R8tSoOUGbTFXchUPj+nLR7duIjJ2wAM9RAflhRvsSDV2ddJ
	A==
X-Google-Smtp-Source: AGHT+IHLUaG78pPpolWgvKxo7JAqt+c+YIceLIH7tszHkOE1Sbi1pPFiMPOEdkHK6zyKwEyy9jYPRuBMaEXTzhgKa9Q=
X-Received: by 2002:a17:903:8c3:b0:235:e942:cb9d with SMTP id
 d9443c01a7336-23ddb2e2117mr44522245ad.17.1752068182802; Wed, 09 Jul 2025
 06:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
 <20250704-topics-tyr-platform_iomem-v12-1-1d3d4bd8207d@collabora.com>
 <aGt6CZAUeuK0XnmP@google.com> <F1EA22CF-1C01-495D-97ED-59D51A45A8B0@collabora.com>
In-Reply-To: <F1EA22CF-1C01-495D-97ED-59D51A45A8B0@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Jul 2025 15:36:08 +0200
X-Gm-Features: Ac12FXx8MsH1eDIFhZjajAuMUIOv4XaodeklU_8Hl_wL84YrJfqndKHflkJLh7E
Message-ID: <CAH5fLgg9pL0LhaWAMNKig+vnoB97U9zybqjdQieWYB7QdyAwAg@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] rust: io: add resource abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Ying Huang <huang.ying.caritas@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 7:44=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Alice,
>
> [=E2=80=A6]
>
>
> >> +
> >> +impl Resource {
> >> +    /// Creates a reference to a [`Resource`] from a valid pointer.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// The caller must ensure that for the duration of 'a, the point=
er will
> >> +    /// point at a valid `bindings::resource`.
> >> +    ///
> >> +    /// The caller must also ensure that the [`Resource`] is only acc=
essed via the
> >> +    /// returned reference for the duration of 'a.
> >> +    pub(crate) const unsafe fn as_ref<'a>(ptr: *mut bindings::resourc=
e) -> &'a Self {
> >
> > We usually call this method `from_raw`.
>
> Hmm, pretty sure I have seen the exact opposite being asked. In fact, thi=
s was
> discussed a bit at length a while ago. See the thread starting at [0] for=
 context.

I will submit a patch.

Alicej
