Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7392CB667
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 18:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606649; cv=none; b=tO70QVJ3eXUSb9quKL8Bbw/qlCOXc0imcoW/2kKHq71+K8aiihGmjLkm/m29N8E0vZJsrWGgfRMVLeWca0xO1XG4ddfjPhMVwh/tDWidSBHVLQnTkeqVCjSljOLm5dBhFZV0lyJ+I4IyNbSfxZQH/grQ7Ngsf7wF9YBZ94R7fak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606649; c=relaxed/simple;
	bh=+oTVEI7ih4UQ6CaQVZkQ3pNuU5Lz8cH04p72iYkrp88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzs9ZBWoCzJg+ergoK1gvPnztwSCtbNAQC2EZInroJuqJOJIH1fQ010PuTiokDNBTitW98YKIIsevkugw6vPKirHOXiqeB6pnBo2Emf67L16LezESIalqsvYcPINTTAzpEiKdS8RxToHSQVwJp6dib/jjg1QvPXZ4sG4A+34yMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G4cH0oea; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G4cH0oea"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361c705434so35228725e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Feb 2025 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738606646; x=1739211446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDkxzxcu7O1vOggBOzC4wE/NAP+zsMC3Yt4mKkAp2BM=;
        b=G4cH0oeaYQyTXS9ej3u1+f+Qzl8IRnO6AyAMDWpmfZp17wct9DjUIQ4JPlJ13t/0Kb
         tm4eUjPhPiYtyvhwhLtpf2l0/b+6MfHml9L3SWSaLggGPh2ybjtTzSyfUH5SGGTjOaOR
         R3sYXP5fzeEOj72BQPF27soQGVgAKO0GV918gRz7rnv5ZBHzae7pPlfmtnR9DEJS3ou9
         6uUF4wf+GrCIS4sY+voOy3BkSugE1SbdDHXCnhcDw+AbOpmPfQUiMSpU7yeZgglQiVyd
         kmurEXMAmpn8Y2JFgssTcSYaPZ1AV8rfPRp8gb47MnvPa4YYDm4jssnUPYHcFYpn6FxT
         ezMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738606646; x=1739211446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDkxzxcu7O1vOggBOzC4wE/NAP+zsMC3Yt4mKkAp2BM=;
        b=DXv20MxQUTH0VZ0AuxAnJLY9zQHw7aBfs+fnE8LqDLWn3gplZ4yoMIIlFjWn+EvBhq
         4uo1Bz2Lvp/fcquZDHO2XhbR+fRK+QG9f+FJH4c9PidkWVIXgWtgECQ4X6djiM4noDXJ
         ZBmcyg4Jjhbx2WiUUBzwOirkcliGTPRV3hiuJxS3SOYeES743BeQrrCegsadslnsJHDU
         hjUy0yVV3zn/iBlYC+qPYk/5ubQJflcX2RZmcpl3cIEp80+k/GpHIj3wamYltt/Vk4DP
         5hVk8woHjvQNEyvG+LsEdejSmaGzG/XJFUL8RjvgZf+bv26IDy+ndI/sTT6BfSj7m37x
         EzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7T6ZAxRtqYylpvPJatGtiVRiHVwaB+epwMMoEeCpGrn4xAEbpEZWhMCzm9zV7IxT4qO4k1vwZphg0HxVmFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCjecGCzh0B1q0ygb+v+BxSDw5ufpc0/TEC65RHGAIB3DkBvN4
	PnSkQuKDN97vO9d9Wn6af9wPbnhfDv8qnPf4ByCW7eVu0AO0DEgWINfqi86pdS57ouqfjWFU/2I
	Wkt77+6w1nu2B3sdp7CgA9nA8FwmrphecrW3N
X-Gm-Gg: ASbGnctNJ92FW9Z0bx5piIe4od1Uzs5q8OlSuNq+5KsGi/BT90PI2bjdaAy6vpdxDHT
	QwLSkLzcYo8BsM0hoXf4fcfytoo5E2vZsG1GdVnvYhY1eooOwl7QR3RRj7+ldfICOozXsLLNA3A
	==
X-Google-Smtp-Source: AGHT+IFjiAANHpU4lYhLwjIj1aIzAMCx+jP5Z2qXe2xs3JQXXbYoy6fxWH9MRWQ5Z6+cy+ed9B9IBPZfiojUyR3Yru8=
X-Received: by 2002:a05:6000:2c5:b0:385:e013:39ec with SMTP id
 ffacd0b85a97d-38c51930b44mr17922172f8f.8.1738606645674; Mon, 03 Feb 2025
 10:17:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net> <CAH5fLggscATtCgQwCYSms77oSFOMkjTscRDqAOZsSgoHsOoPQw@mail.gmail.com>
 <def0ac4e-6ec3-4f91-a3e6-02ce931c46f3@asahilina.net>
In-Reply-To: <def0ac4e-6ec3-4f91-a3e6-02ce931c46f3@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 19:17:13 +0100
X-Gm-Features: AWEUYZmdD1lRFN2B0MxC6_5nwF3LFE7h8SGB6KozvokrQeCQEKJgmX-DPDC9T_s
Message-ID: <CAH5fLggcT0_e3EsBppxsGfxaqvs6rTkbbRvrFEHthEff5s1x0g@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: types: Add Ownable/Owned types
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 3:17=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
>
>
> On 2/3/25 6:13 PM, Alice Ryhl wrote:
> > On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> =
wrote:
> >> +    /// Consumes the `Owned`, returning a raw pointer.
> >> +    ///
> >> +    /// This function does not actually relinquish ownership of the o=
bject.
> >> +    /// After calling this function, the caller is responsible for ow=
nership previously managed
> >> +    /// by the `Owned`.
> >> +    #[allow(dead_code)]
> >> +    pub(crate) fn into_raw(me: Self) -> NonNull<T> {
> >
> > I would just make these methods public, like the ARef ones. Then you
> > can drop the #[allow(dead_code)] annotation.
>
> Does it make sense to ever have drivers doing this? I feel like these
> methods should be limited to the kernel crate.

Not having drivers use this is the ideal, but I don't think we should
always expect it to be possible. The Binder driver has a C component
for the binderfs component, and it also has some code that's
essentially an abstraction inside the driver that I was asked to move
into Binder because it's so specific to Binder that it's not useful
for anyone else.

Alice
