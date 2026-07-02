Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6BC3D904C
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990566; cv=none; b=AoBQtexCusMYQqwOC2ySTxk+Id+BJm4e06J0gYPJPgHUQzrVb9K6LS9lBoO2DINdg4nuV2Cgw8CNHotti7B4N5rRMqmxoscyXsnSzVQIjR9UKumi1teDSdRp6KxFd/SuZIyY2/i7RzbB5+TOn6kwWUNayjqIH4mi+nODGr2dmK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990566; c=relaxed/simple;
	bh=H7+MDSBOZd4JQF5N1xSQnYga2rWSArQZ7jzGQ1exNGg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KrAisc6NHV2MjZH+ZJnkltGTlzlCXwMObNAQ2DmImDsJ/6OZC0nqfyfkhhoKIzrKS78FwUkjS1f+0l7BtK2GYb00wzW58z2SagcreA72nO9ZHB80d6LsZE/XTfffq3jpyRVnnh4HTgsXLRHFTFzG7Qu31cq3R905e3JpWs6Mr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qSOGm3do; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qSOGm3do"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-c092c622e15so120140766b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782990564; x=1783595364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Te4HA4w2tioRKQn5/3FcPTwYWbx1EGaNajEvJ+1ehUQ=;
        b=qSOGm3dotx8CB/BamO9s+zgWfUU94ytVKORBOMOi0zbBdHgHWbrmfU3GUK4Os9lhrF
         csOV698cVGzm23vReYUGpuMngGcqjTS8gJ6b8rrXftKL0sLcZbLllu+PYKgZtFvXDLB2
         LNpZ3orrYAZ4ZShV7Fjv5/6u7WYRSDeV5+FKIsMsnDP2ZQCOHcAO75HV2s1F67/hoKPP
         XLknyy3zunyF5zpGgQYvhFb2UKDYi1MGDZr/jUrL6hd+M78tcpiwXBwztYVBklOxTCL3
         FXfsy0keHC2YpICiNz1znP6KUHpkaDlmZMs2T/2O083PO7UyJhxjRacA7Nf+GImVHQT6
         GJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782990564; x=1783595364;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Te4HA4w2tioRKQn5/3FcPTwYWbx1EGaNajEvJ+1ehUQ=;
        b=hnflqVlEnHGVYT00StCwVCCTye27PPyOaG2m4VUFy1WL18Aubf1JYLx3qkIDGS2IAd
         BIlyPf0+oXbsvCnkmckbJkS1AlcN5GXiHcZUVreYB1G5w8tT8Y1v9W79HxApGiehpQos
         urT71ip4O8hx647vm7PgmUVFYTEo5JaP2OguSdQHPdxZY3kKYo5ENr0Fu0Oyb8I4EJ2Y
         5rk1NceLdFqQlRZYueOMju4/71RvNUhy0jY81ux6U3Y2MDsWDwpRWZgOdTRGhiQJwJKe
         /TUr7pELdQqytAaLR9+yuCenC9VgvQx8trW9lbjyu8GlV6kkj0B15QmNOJSajvBj1l54
         Gsfw==
X-Forwarded-Encrypted: i=1; AHgh+RqvsgKJw/XimQWM3YIOdd29eXJJO/bV7lEf5FHVMaN+FmXS8msptV75S/9O9sMDZry5j1AYdZoZ78eTO5omFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+fFj2K7yXXXj2lMp7YebJeDcByKcWezqX7LaJGUFcZxlsVQM
	tWyA9dw06f+5C/yuwzMhH/60DCdKxTH0JH1Iy+qwGUmA8h1xlLMJUtn2J7XNxACj3E72aDtkFPO
	zv6IwBdlSCfSh7yBaLQ==
X-Received: from ejyr1.prod.google.com ([2002:a17:906:a201:b0:c12:7b32:c50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:3646:b0:c12:507d:40c3 with SMTP id a640c23a62f3a-c12ae89f339mr226088666b.63.1782990563650;
 Thu, 02 Jul 2026 04:09:23 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:09:22 +0000
In-Reply-To: <DJMHZB23PNGV.2SM0ER4JFQYI@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260626214404.852685-1-nico.antinori.7@gmail.com>
 <CANiq72k8KOmVLrHGOa9SidU=vYqGUqi5dmyW9J1auVMnqaQAeg@mail.gmail.com> <DJMHZB23PNGV.2SM0ER4JFQYI@gmail.com>
Message-ID: <akZG4sDyogS9nBf8@google.com>
Subject: Re: [PATCH] rust_binder: use pin_init::zeroed for file_operations initialization
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 12:43:25PM -0300, Nicol=C3=A1s Antinori wrote:
> On Sun Jun 28, 2026 at 7:16 AM -03, Miguel Ojeda wrote:
> > On Fri, Jun 26, 2026 at 11:44=E2=80=AFPM Nicol=C3=A1s Antinori
> > <nico.antinori.7@gmail.com> wrote:
> >>
> >> -    // SAFETY: All zeroes is safe for the `file_operations` type.
> >> -    let zeroed_ops =3D unsafe { core::mem::MaybeUninit::zeroed().assu=
me_init() };
> >> +    let zeroed_ops =3D pin_init::zeroed();
> >
> > I would just remove the variable and put `zeroed()` directly in the
> > fops initializer like we do in other cases, but it is fine of course.
>=20
> I thought of that as well but I tried to touch as little as possible (I
> assumed that was in a variable for a reason). I can send a v2 if that is=
=20
> preferred!

I think it was extracted to a variable for line length reasons. You can
remove the variable if you want.

Alice
