Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551DB2D94A4
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760642347; cv=none; b=l62c5pJ/PROM/bFAf1I1/AUfthd+weRlMnmmd+81qxn5nn3UD1pMWWrYgVasFnnZDpfNLQxnRBoqcHGXgcjIKYmc3FoQ1kjmyOweTEqjA5jeE04Fap3kvr81L/o8lzvOc6o6DLkQn2ty/ajqwZD3Z4ApoPgE/Ie+McnzgjVfXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760642347; c=relaxed/simple;
	bh=a3Gj7mh3v/3Kk82UEe0rHgCedYTsE9uhWk8L2/gsUsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBy9cXfJDOs8JC158xA3UKo2RtQ1+BpEcCeadQPwxVh7xgNXJ5opRadu1Yx1O3v4JBo2QM4ySNS/jNdY9t+0QlMhUg0kgWugI67xnrFNiISlxAM/H9jh1uUHvGQwDXOSeWMD6KMt+GuAAhLgUyXU4K48sEFRU4RXwZxiAcIuy5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QydhAQqw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QydhAQqw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-26987b80720so2034015ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760642346; x=1761247146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkNb2DeKO+13qtb+PBXoKP6RFeVYVbqfpbvDK5KSaF0=;
        b=QydhAQqwREUOnfLFgCf98Hk0Yq+GnD43PvXt4cFJoMlID+DgSA2j5uT0edUJPvVkJQ
         5M4FbS/75Qv7AeKj+94BFBAJPa63XEnpN2tEXWOsn07xtVHGlxtaNsYd4wEQFfZstON4
         97jQpkB3YQqFB6EQhhmw5LnywFdDQFSaWXW2xwdu/+SxGVr+RZi8n7VPMmjnjwpO+/Mu
         5TuX8OtObALzOomWoirLtUL5A+9L0tGXZesw/mBbV80sVDk+QnLJSYwpTJVfPqZXC74L
         u5NmaryNSfryQfFFq/VEJTOs5ycM28JMQT1yK2p8PJWDBfHOA3lDXSOK0e65sg0+PL/P
         h6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760642346; x=1761247146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkNb2DeKO+13qtb+PBXoKP6RFeVYVbqfpbvDK5KSaF0=;
        b=ch7lmy38O5pBalWxNSPkeJkAGoFGQsfBFv8HCQ7KBUGvWDR4EJw+CoqLD+o1dEqwdf
         03DP1x6uoUFwA4UFpzdxc9eE8bg2ZsN2HxukNK8LZky3qbEc8IVHdKaYXx5IClRJcU5p
         /jBN4hHKGDqwh5B31F0VjZyaINVXszP1KzWV6JoOZsiQahOTI+o85pTeBqDRf7wNjuWs
         nINgvfv4RebJ+CJHuA46WZb6bJAV4osbAAT1JfJyA0TOnGuAj0/fkgZyVwt/U3qbZxOZ
         ptIviDCdt3dnkZg7GBp8xf8j5TJ1fKEwQS/m8VNXCvZOCMJwl+21ArZt7Caj2dlVvugE
         OYRA==
X-Forwarded-Encrypted: i=1; AJvYcCXl7ms25+2DcAW8BzqifCmuLAx66OXd+MgVlVIBBvWjI0iYMpBXk3DyQA62xwu30N9HwDqvxQLA+U+q+NfAjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3B/QdcjkHJMIGx8F7Gm/J7bzAPLnKNfWps6eKu5Du8D5zqD0+
	5rD6ObB0UKiSrlT/DPirCTEt9IihYMHCus8LogfN9jeVG3BLkQYMUBrT39Xs9rA2hXpSur4VDtr
	fW+INL0oVjA3yVTbKXEAEwAcnTOLLEh8=
X-Gm-Gg: ASbGncsWsDbKhHmAlOlldb5hnyZ13Yc6/tHzuicd0pUWERi521RkWDAGKLBC75uZgIb
	cnuy3qwKY+8X6QQc1HQYPGsYkTwJE1EoRw1yrt9ITCnuKEEYVfLUeQvH49pgdJUvAE6fT8MIBrT
	2Azje9/oG49nlgtP0A0TX2GTCb+t0yJFE5CU2AHAnx/AUobP8AUk6pmDjXQCVKYoYEfY1oz4CsL
	nnF8meGXYMdVf4hq1gTrgtDit0SrauQ7JwFJWuwp26Hlhr0CTLCBKAJmSU7WgRwfegM1vU+bVvb
	cr7QCswyHviT5F6cDUmq4P2WFu061+NTd/qE0dAbJAb3wvKu+LZRyCmWLeXs3Ut1hw4/9Wzgcnh
	XLEM=
X-Google-Smtp-Source: AGHT+IH0YWgGKSo65cgBPX5W3p7j4HkK3bVU7l78fZ+js9jI7tU4OLEp6GPUbGx58mDOvsKGfrW9fh+1rWFnGpM/2VM=
X-Received: by 2002:a17:902:e950:b0:290:7634:6d7e with SMTP id
 d9443c01a7336-290cc4ea8f2mr6194375ad.11.1760642345509; Thu, 16 Oct 2025
 12:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com> <20251013062041.1639529-5-apopple@nvidia.com>
 <DDJJ4P7ED3LJ.6YD2M62RB5VY@nvidia.com>
In-Reply-To: <DDJJ4P7ED3LJ.6YD2M62RB5VY@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Oct 2025 21:18:52 +0200
X-Gm-Features: AS18NWCOXO5Nlj8i8ZNj-U23NNA7RJ1ucE47naAt3VXCGXJAjL5KZrU7UJiyBhk
Message-ID: <CANiq72kpgPT8=-UPj8Bez_ui=MTVauCPg7CabDau=jxOB8qdow@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 8:23=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> >
> > +/// # Example:
> > +///
> > +/// ```
> > +/// let mut buf1 =3D [0u8; 5];
> > +/// let mut buf2 =3D [0u8; 5];
> > +/// let mut sbuffer =3D SBufferIter::new_writer([&buf1, &buf2]);
> > +///
> > +/// let data =3D b"hello";
> > +/// let result =3D sbuffer.write_all(data);
> > +/// ```
>
> This example doesn't build - there are several things wrong with it. It
> is also missing statements to confirm and show the expected result. Here
> is a fixed and slightly improved version:

Yeah, I mentioned this one in a previous version -- the section header
is also still wrong too.

Alistair, please check the link I gave:

    https://docs.kernel.org/rust/coding-guidelines.html#code-documentation

or other code in the `kernel` crate for examples on how it is usually done.

It is not critical today, of course, but the further it is from what
will be needed in a few months, the harder it will become to start
building the docs and running the examples as KUnit tests.

Thanks!

Cheers,
Miguel
