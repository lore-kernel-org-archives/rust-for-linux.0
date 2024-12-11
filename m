Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F922C346
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733921005; cv=none; b=DRGbX/gdYAGAaRxHdMCHzf/cmexz181yiZcHEfYX/+sxOfwHbVH7Xn3hk8lIo1jCDfPZZ56IRSyw3QBBMDzsqBRS5gGxj6jpPETgBS127NXTVEwEgZAhcn+78jN1OebRC6wvj6ZvPggx0Nh8x7o2SCdkHzfbMiaTHKfzVToa7os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733921005; c=relaxed/simple;
	bh=0Yn9u0INepPlrghMNGHYHOrPqJ4QCbTtXMccsKKt37A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEJUwi9T2SBK758HjgLUCN8P5gJO9zr2IaMqYuaN/G6wKKxDzU9tNejFXf5syJMVyDsWUgLrpZAZlWF8zVuSXtcVsQlws/Mrn2JOHNQjk1f2j7mQzKH7f5wpw6bbje4QTvOsIWUsXRXZzSblJ/U+a1tFBk2AFVPK1cbnv14Zn9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DYo1AQda; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DYo1AQda"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so5377015f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 04:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733921001; x=1734525801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tLcil2f/sIEpvxG1bvJluOHhLLNVHtLVp0fHF6xoJ0=;
        b=DYo1AQdaQBAIEuOhkti49t9ni4vBDwQIbyM6wI43OMVLrIEQ1rRI9G7dg2mmtko/gf
         tQ+HXMHoMGpziFrNmICyd5C5J3/9mjWACAFIXIONsp1bX6SC+/FqmxrHSBl0/PYWW0xJ
         PNdg+w4DOyERkytwnAmK+Bk1UqRF35pPDh7KBf6O5j1CEurl1xFcn249qoX+67nf5Beq
         YtwYlKEiy2gdlyrWZzdMLwG0tFNucvl4e/4XDQe0J/KYE5E8oNFP0uDiDAFJBi2n4MTq
         gJ9SO3wk+Umg5L1i0paDEniwFGeiIIGigLCaSLlOPSmERziQI/j5BC7DIvUdAJRErXxk
         0q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733921001; x=1734525801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tLcil2f/sIEpvxG1bvJluOHhLLNVHtLVp0fHF6xoJ0=;
        b=VNMmG7BqDMmUXyhjqyxmaxSsH8CtjmvgrE4kBTKt7UT7Eb/M6iXT2L94QN8ZFRRfJc
         J5w7aTPFIulNg9TgvQJB4zmdtj5FnhEq1lEzuZNJEOUCWyPjnyw+hCePVxYc+VCZQCKr
         NlU9TYCtkjPBjmChKIqP1yy5N0LtnZfC8hxgNAqJBKuMWKuV3oapTTChUytr8D9vBP8s
         gvOA/zuV1Thp1pWVtDSFg0rFS7Ko2BRma6AyhgQygwQnGlzA4uP+DRmePMLOvwFCvM13
         5qfrIlyQH+skXIbP9Jhw7iYejbgk6u0Wy5JUb4bsjhr2dcFCDU3AvJENwhWhDP9/4zmX
         4Uew==
X-Forwarded-Encrypted: i=1; AJvYcCXpyyr1gIxe82dIEbz/ZHs1aub2xnRGJSe0qM5BTWamExs3bK0eo8lIwLzlBGRZR09GgVop5ZDROHeMGV1qeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPRu/lv0RkuVDYCoubh9vil8bAodJlQ2fkP2UM3ZqV1/YtxUDm
	aZl5RDUn+4LEOpJtFmFI+XKA+cw4Dnq4He1eP0/g6B0Xf9rFGauQxmebeWNjuJL7cD0V9uYN3D/
	pr5kYkUo7im8aRbxkS5wCtkMULJUsJXjUEXk2
X-Gm-Gg: ASbGnctxhM8oRIFNMKPdNILdOuydbsZqoqgwWEm++e+rq4Ou29MsJkPrZKACfIHvSKn
	cNcLxhuP6CE2LnEOdnI2HlUEmOITB08kf9c3KZ7g9vXjCCHrb4msPAj4ewKgDLB4PCA==
X-Google-Smtp-Source: AGHT+IEduiJ/qcw2i54PCWdeVjWutL/RI21JMHnSbZRK0TIfzJWgWT07sIelSp8i26tVpPG0uZ/D+1PECxXqbXkDGsU=
X-Received: by 2002:a05:6000:1a88:b0:386:4a0d:bb23 with SMTP id
 ffacd0b85a97d-3864ce85f47mr2585264f8f.11.1733921000608; Wed, 11 Dec 2024
 04:43:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210224947.23804-1-dakr@kernel.org> <20241210224947.23804-2-dakr@kernel.org>
 <2024121112-gala-skincare-c85e@gregkh> <2024121111-acquire-jarring-71af@gregkh>
 <2024121128-mutt-twice-acda@gregkh> <2024121131-carnival-cash-8c5f@gregkh> <CANiq72nMkzHLb9gi_i6RbQYkzP-1W5QbtGVx+z1f8nfp3y_CwQ@mail.gmail.com>
In-Reply-To: <CANiq72nMkzHLb9gi_i6RbQYkzP-1W5QbtGVx+z1f8nfp3y_CwQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Dec 2024 13:43:08 +0100
Message-ID: <CAH5fLggzx=UinvxZ=XFZFTcfv7LxCzJWk1jtLpgNrKZZU7VK9A@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] rust: pass module name to `Module::init`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, rafael@kernel.org, 
	bhelgaas@google.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, tmgross@umich.edu, a.hindborg@samsung.com, 
	airlied@gmail.com, fujita.tomonori@gmail.com, lina@asahilina.net, 
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, dirk.behme@de.bosch.com, 
	j@jannau.net, fabien.parent@linaro.org, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 12:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Dec 11, 2024 at 12:05=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> >
> > Or does the Rust side not have KBUILD_MODNAME?
>
> We can definitely give access to it at compile-time with e.g. `env!`:
>
>     pr_info!("{}\n", env!("KBUILD_MODNAME"));

I guess the challenge is that we need that to get evaluated in the
driver, rather than inside the rust/kernel/ crate. Perhaps we could
have the module! macro emit something that attaches the name to the
module type, or something like that.

Alice
