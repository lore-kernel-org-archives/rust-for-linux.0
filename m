Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA711D9A6F
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Jan 2025 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737703793; cv=none; b=ZfYHLeOHdr9AecD8AKgiHnDav3k/6jHcY13gOrzMf6wTeW7S2TCxnyA1lDaBshOZEAZxgjLlUzkzKFqR4HxsV/aXVoEnE4ddR9fRk1b7JAdX+JgWbNaQTgr+IVVcHk/2h4VjDkWyv/flq/5jDOs4euzZMSdbkkHrHb8w/6NnJlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737703793; c=relaxed/simple;
	bh=37kpjLd4ppZQoY8POxfj2q95U2k/1Muex78eFgNsDC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFb0CEhWdttgKWcGZx4yZlgliu9+7dU9ejOTlYLRVhAyZe9vZNKLwMgPA7njMcTFFu/9GVAz4nVpvfUGoc4L9vo5WiuPhI6IAWSqWX+J0cYtyF+G1d20mrTuUbuBTh+YZZj6tM6LQpvLuj2VK34YtJGP1g41pIdygtgPFaPKOIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bTHutBgb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bTHutBgb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so17836765e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jan 2025 23:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737703790; x=1738308590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37kpjLd4ppZQoY8POxfj2q95U2k/1Muex78eFgNsDC0=;
        b=bTHutBgbFwTSbhw4b3IVAhLnPTBYodnLSjuaPO+hfhbuoo6UXdASQj+8OVlqKa0tAA
         I5PN0iY2NMfl1MtYR5ow+TObv6ziHgMX8TVVI0LwPWUE9Ecir0Z5Ub7D7jBVJ1NZ0KEH
         K9SXBQ+KuADlAYEv77w3r1NJIVv7zaRKn9NHDMrZZoOEPynwy5ba74XZx6HSfTKZs5X1
         WNTWIHV0gD0+I1TNL/LidNFIGSmlrQnGB+VUXbfI2KCUKiboKACLhOLNBzFr1+UbwRWh
         MWbe/vAMcaiWrusrmZtjRgkBSiWSBEOxF1xSllBFPKerHovQDCmSbinMs73/XNm6xx9i
         8Yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737703790; x=1738308590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37kpjLd4ppZQoY8POxfj2q95U2k/1Muex78eFgNsDC0=;
        b=CoSxFbRi9Ozy5juxAWJiIf4oJNzUUrsQD2gxVJLxVCJaVK2PG9kHt3oNDuV588bh6t
         wG4QAlxWhwgpi8JAYvOdnOztLs0ScKIy7ik3ibWL1A0goZ2qCU4zlqQe9AgYY2mOSlM3
         fzNW/MPWzdmcHKQdkLEBgRtmgWaio6R8aca15kVy4ssA91XSassgGNh5VPsBf+vSQtoe
         ANlkF5Zia8rbmZhZa2P0iqeEwfU6NgzGSqXccPOtwmSjI2aBz6M826GYzkoqIVpWVH5g
         MCp6rE8twhJtKmlATxTUcn4wscL/xTtAtM4aubRuiO6KwprPGkFRwidbkomj4LLhF60q
         G+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWcq0O1V6+CzpSVj1XanOKPaUDTyLX/+oJbYwHGckyLRxxtbvQXChFVyTrZgWeTtCajMUFDMjj71hlBTB0zLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMHPAI8NVTtPum7DYcXsxLdoRffmUgrbd/GJof419z4ZdKWaB
	VZ1S2wvRMlzdTuG0nbiHtaLZaFDIun6S/jmcKc3+lJvDVcsYODYTPlIuHUbuJx2yWy2rif8ZDfE
	x1/LfM+IR2SmS2azsxp2IVheBrvcqzbB5QIw+
X-Gm-Gg: ASbGncvDcS0wzi6I/kBiwnW3aQmex+zvAiix4hkEZ7gJSvfZn25iQOL8YZrSDca7GeB
	VfcxA23/QNEAvTyn1tk0C4nkXLaJSAAM8nhyAr1aQTukR0IcFf9wjlmbJSm3TNwUZR8qhr8xqIQ
	==
X-Google-Smtp-Source: AGHT+IEgFqKsSthIvKSlzw7ooW10lc51E4ZY+v5jG1DYOfM47CqFK7XSo4l4pukys2NxIoOjiyeG5QZxzf4qqeY4RUU=
X-Received: by 2002:a05:6000:156c:b0:385:eb85:f111 with SMTP id
 ffacd0b85a97d-38bf577f703mr32210787f8f.14.1737703790042; Thu, 23 Jan 2025
 23:29:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
 <CAH5fLgismQ4whAKswp843T-=q_1+C7DB1qqg6rqk013DGr13iQ@mail.gmail.com> <7a84da97-504c-4d1f-9c98-3a152e348c73@gmail.com>
In-Reply-To: <7a84da97-504c-4d1f-9c98-3a152e348c73@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 24 Jan 2025 08:29:38 +0100
X-Gm-Features: AWEUYZli4pVok2gRVHiO_QXueQf45SYq1Flic_qtk3oazxt0VL3S0xZNAC38Ivs
Message-ID: <CAH5fLgg5tjFowQq=LWQ2BtGVqHmdMMp=9Uxm4BzSy+UiXGPhZA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: miscdevice: adjust the rust_misc_device sample
 to use RegistrationData.
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 6:57=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Hi Alice
>
> On 21.01.25 4:40 PM, Alice Ryhl wrote:
> > On Sun, Jan 19, 2025 at 11:11=E2=80=AFPM Christian Schrefl
> > <chrisi.schrefl@gmail.com> wrote:
> >>
> >> Share the mutex stored in RustMiscDevice between all instances using a=
n Arc
> >> and the RegistrationData of MiscDeviceRegistration.
> >>
> >> This is mostly to Demonstrate the capability to share data in this way=
.
> >>
> >> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> >
> > This change causes all open files to share the same value, instead of
> > it being per-fd.
>
> I know, if that is unwanted I'm fine with dropping this patch,
> it is mostly here to show how patch 2 can be used.

Perhaps instead of changing the per-fd value, we could add a new
shared value? E.g., it could have a counter for the number of open
files.

Alice
