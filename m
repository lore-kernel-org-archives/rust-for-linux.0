Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196384689
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707480786; cv=none; b=TZ+Y/9KA+T59MibrJ1TfEudbsomruSgTRsY8jjcbIPxbCj017vChuMflkbx137yM+dbNM4fbenvLPSdW3AJcZYdFxI3rGwUyrCMXidFPvmP1Txqqn/JRAN7cxRV2XUGNWc8ZMMdzK8/K9QkAk+HcQVcExumK3qvJCmHdF1wVDJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707480786; c=relaxed/simple;
	bh=IfZxjBNx5m1DAATCZXSQTGtIlrGmn5BKILq3tcTp358=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJODXZx88Tu6FQTXA7PAwnHWK7eUxk5uaZI7Bmd1ezhE9IS2RElCa8oody3sucOjxMBbtNjRgLsHe2AtWl+VsD10VJBtQHvphaT8GIy97mNAKI6bTD0BI5WBYX9kD/CONPXb6drwWGtHLusr+z+4R0i76dMXU9bVqSlDmjXBL4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FOT5mJCc; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FOT5mJCc"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4c02bdc2892so876105e0c.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 04:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707480780; x=1708085580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5TbYmLf54lWeOLQ7soNodqe+MrBa/Gp2tQKWYLdkRg=;
        b=FOT5mJCcXuvSLQVufur6D7kq/3Md3ZCjXMi+qp0FLXNXXchMYA2SgHzpMofO4125pm
         ig8NpGsBe6MxrG8WC1lwFozxJiGo9YACctxFqMNVZCoxoWyxT4lU10Hi/tnujX4uMz5y
         1jpOWwi81HEomkqMLdTHpESLJwmLqc/JV4lWjxkUtU0VBSsNS2yuU/DWOEkNLeeAVfCn
         8TIM0AYYQ5+/GnCEy+HTk0PhoHEPRWhcSFLKHq5utKGAX0//eVTLmbv+V+4X0H2oZLrk
         enzYB4dTaMojbU0YomCQAV9VmlGmiQBuOH84d9z0SqgUOj2qMJNVe4P0NjOAmLha8f1J
         3HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707480780; x=1708085580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5TbYmLf54lWeOLQ7soNodqe+MrBa/Gp2tQKWYLdkRg=;
        b=hi2uhRfcTLtBkFvemtjY3dUvzgmyrfZQ7JGg4pjUsiOPV83JCuHjWTWddgHSvf9zdV
         ENBL+gnPXjcpx1gAGkHkjnXSUoORa589ted+Xi3xzNXdppJhu9Q2i7eG13bfwLvAACXr
         wHTLRqVmIHZhHjNz7od9+r2FxWZiXbcolWw01brF3hWXnjmzg4XSQghZQQM494COIKbJ
         J7scOVHVBZBPP4WsUFyDmKc/+fGZ1ZkHpwJsbHvN2wy4C4RyRoV5biL6ZyKrPkS8rkBr
         jyc3NbiQBzB5pKkJBSBGxZWqDh3tNGqoBCsdtVYPszp+MpJlaptXnp/rtDaDTzmffEXv
         cchw==
X-Forwarded-Encrypted: i=1; AJvYcCWRVbFyIQROv2oQ5/n+/up/dqGC0izX5PFFPR9nFxJOFmH0AZcFr4fZogEdQ/Ygy3armvt/hrwF8FBnYjtyO5/WB2ybpuTll2fwP6elIvE=
X-Gm-Message-State: AOJu0YyFj9Oe9u0w8i28qpciKBhZY0UaNUCFXz72VJqUTYTIvV9/TfXY
	E30dGRWOPQ08kCaP7h/CH7SLt2a7Pk1NoX+GDEKLItcqqLaVLhuBNzu6xaxzwVm1z61R6ryd1iT
	ZK87+KF6aYIVVfFefGMn595vYe9yzbNUderT0
X-Google-Smtp-Source: AGHT+IEmz57Vn+8qwWMgya7iNapNgYknqFV0tjJZHFPE2uxeVSSHqoMxnePJJuPd8poBscB/OFCo2tbqHzc/Pveo9q8=
X-Received: by 2002:a05:6122:4214:b0:4bd:800d:7308 with SMTP id
 cm20-20020a056122421400b004bd800d7308mr508277vkb.3.1707480779854; Fri, 09 Feb
 2024 04:12:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116151728.370238-1-mcanal@igalia.com> <ZacW_e1mnNi6hT7M@boqun-archlinux>
In-Reply-To: <ZacW_e1mnNi6hT7M@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Feb 2024 13:12:48 +0100
Message-ID: <CAH5fLgjO=RSCK=KsMtuj-2dyiFWvis-gLiU5YBBmnow+52oWvQ@mail.gmail.com>
Subject: Re: [PATCH v6] rust: xarray: Add an abstraction for XArray
To: Boqun Feng <boqun.feng@gmail.com>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Wilcox <willy@infradead.org>, rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 12:53=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Tue, Jan 16, 2024 at 12:06:03PM -0300, Ma=C3=ADra Canal wrote:
> > +    /// Replaces an entry with a new value, returning the old value (i=
f any).
> > +    pub fn replace(&self, index: usize, value: T) -> Result<Option<T>>=
 {
> > +        let new =3D value.into_foreign();
> > +
> > +        build_assert!(mem::align_of::<T>() <=3D 4);
>
> I know Benno suggested this, but this is not quite right ;-) Sorry I
> didn't mention this earlier. Here T is a ForeignOwnable type, e.g.
> Box<_>, Arc<_>, while they may be 4-byte aligned but the return pointers
> of into_foreign() may not. What we need here is that `new` is at least 4
> bytes aligned. Yes, this is a boring difference, but it's a difference..

Perhaps we should add a property to the trait?

pub trait ForeignOwnable: Sized {
    /// The alignment of pointers returned by `into_foreign`.
    const FOREIGN_ALIGN: usize;
    type Borrowed<'a>;
    fn into_foreign(self) -> *const core::ffi::c_void;
    unsafe fn borrow<'a>(ptr: *const core::ffi::c_void) -> Self::Borrowed<'=
a>;
    unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self;
}

Then we can write this as:

build_assert!(T::FOREIGN_ALIGN >=3D 4);

(Note also that it should be >=3D.)

Alice
