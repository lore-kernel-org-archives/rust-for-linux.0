Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A581A0731
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737016200; cv=none; b=YiKJPt75nnC2q4f5QukF+kCRGZ2PtdPAMqqcAU4t1sPM//kq87GkkyQ/pWLP5QAKXrF6OnWSnbnRsnNV4ff+Dqo51dpPELAYlGuSWzynqTqxkeVHIH2S522mRnJT2P73FWI6EbD0Sfv+6vIXIQnwa+yyUTp8eeWjqUzCKm0pbEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737016200; c=relaxed/simple;
	bh=ylTSZQkjE7+o3ovRDys5NiQ4oqpfrTJz7hFzcs9PWLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PB6nXQAUXc7KB2YVOUhdaSqW33H7cPkQ1hZGssi1/cv7kJl0wAZHnLEawQBtRExn6TEzbfuSSl/u/5hBmu/p0TxdrTxhkAVSc0/zqTAlaTPMGe3q8la2SZh6cHu+Ubb9H/hK8mG2CiQGi77S4yDjK16CffOLYg/t9CViQ9wAq1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o7EdiCTx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o7EdiCTx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38be3bfb045so1047113f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jan 2025 00:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737016197; x=1737620997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBobQ3Q647iXpiJsjz+yqsPG1ZsmtbrlFsEwdYOlN84=;
        b=o7EdiCTxjzrd7A00lzMDJv0vGjt7L3LJBFTioGTtWrDW0mTRAw4u18GFDc3/xqxsRn
         QuxPQyBbqheAp/MLa9LsEDtJA9grDPLE0DgXLx0RmsJNNXuBok0KfhQVMzSPwRaBDbBi
         9iLIvY8DQWik+y1iQnaAdbhZZA8DhmU5AM/7SI98ZRD8g0JHJjENNjA7Akp7u2GzN04/
         0rA1Of3iPAdE/vLrri0w6YoaM47N+nT0Po9WZqE5MRaM1Qt+CswAvQINCpLEeW68YEoD
         Ywc45eCfKs/GtMNzFTMxcUKKKgIec7+9yui6xbjmrHw8uQzMneQ6ltQFHYZiOQnOGNgH
         sGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737016197; x=1737620997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBobQ3Q647iXpiJsjz+yqsPG1ZsmtbrlFsEwdYOlN84=;
        b=p/s7tQqNk+QAkluPNoiWNygI055s18Ur55Znpku0Q1TfaKisfUfuAocAFWQk2ApsDW
         MVva5yOB1BzRtarA8ovsEj3X7dgkbRCO91qE7vE8iRQB0mlCbVqgCDfuZ3v6ZWEkPPRw
         wKXCJNZwrul4zI1opFGhKnWyxQQ625uTrHcVkfwrnWaFHSHKX6zOzW1lfOus0ntrTcP1
         pLlopBfrOTQF72ZADUz1kFe32Fu887pLMhM8/yAM/gpkSsF54BQR7unxMbbeqeD8vWlq
         e0r5N5vNHqD4bgnNp47vb1lO2sqx4hEHmZwzHe0O0uDW9h5qhvNFmH8Xjn1cORZkX5p7
         msww==
X-Forwarded-Encrypted: i=1; AJvYcCV+YrqH9tmGkf/WGk56Tp48m2TX7pG+IzlEmiDyzfXItvKfw53XBAUVgIHHRJQ6TlMZLJruo4OpOKDyeFFz8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxciTeoCJ5fI+J50s6k8T2STiU8MdgRriTmZNVEFHnYFT8EgHZY
	Qftc5h/fLVBxLQhwwt8piPZQSrvekyLk1cT73XxGELSpFQRUDSevwnxmapXzynfVNhkwmmlA5pz
	c47mZvJJkSuBGIl8E8rIjhzNkX/rRmihqYKLq
X-Gm-Gg: ASbGncsW4ot2fnyvY7Toa4ehxKg3ybXdIkRNSP3Qgm6EBSFUArcKI6tEnD2pKUH/nXU
	YGrUc5S0OZ4S1B/Lf5rfiGR8Cr4jOYCxQpxvLC2D4wDbdN3m+NCVEHFpjM+Tqw4//U14=
X-Google-Smtp-Source: AGHT+IGwvue67hHv7P6VmT7VnVKvjmTORGRTQPx6s7qNC7a66JfzC0s2w0x+tVA9e61/KfIwJcQfTG8/HJJBfG37CYY=
X-Received: by 2002:a05:6000:18ad:b0:38a:6183:77b9 with SMTP id
 ffacd0b85a97d-38bec4eecb3mr1291243f8f.6.1737016196767; Thu, 16 Jan 2025
 00:29:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com> <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
 <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com> <20250115113836.18992e92.gary@garyguo.net>
 <71A92388-A636-47F4-9B1C-0154D9AA9839@collabora.com>
In-Reply-To: <71A92388-A636-47F4-9B1C-0154D9AA9839@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 16 Jan 2025 09:29:44 +0100
X-Gm-Features: AbW1kvZLm4-FFBAXNEVElZ4j9aTK-_34eBqQ-gWMTk7WDTqWVhDQw78xM2-sgYw
Message-ID: <CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: add support for request_irq()
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 1:31=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>
>
> > On 15 Jan 2025, at 08:38, Gary Guo <gary@garyguo.net> wrote:
> >
> > On Tue, 14 Jan 2025 15:57:57 -0300
> > Daniel Almeida <daniel.almeida@collabora.com> wrote:
> >
> >>>
> >>> It's not the pin_init! stuff, but the Opaque stuff. If it fails, then
> >>> it runs the destructor of Opaque<T>, which does *not* run the
> >>> destructor of T.
> >>>
> >>> Alice
> >>
> >> This is pretty unintuitive if you take into account trivial examples l=
ike
> >>
> >> ```
> >> struct Foo(T)
> >> ```
> >>
> >> Where dropping Foo drops T.
> >>
> >> Is there any reason why dropping Opaque<T> doesn=E2=80=99t behave simi=
larly?
> >>
> >> =E2=80=94 Daniel
> >
> > `Opaque` means that "this is a blob of bytes and don't touch it". It
> > can be uninitialized, so no meaningful action can be performed when
> > it's dropped.
> >
> > Best,
> > Gary
> >
>
> I really think that the documentation for this type has to be improved so=
mehow.
>
> How is this a blob of bytes that can=E2=80=99t be touched, if it gives ou=
t a *mut T?
>
> I think I=E2=80=99ve consistently seen code that either accesses or mutat=
es the inner T through
> the pointer.

It's not a problem to give out a *mut T. A Opaque is a blob of bytes
that *might* or *might not* contain a valid `T`. When you dereference
a raw pointer to the inner value, you are unsafely asserting that
*right now*, it does in fact contain a valid T.

The problem we're running into here is that Opaque is intended for
wrapping C types, but you're using it to wrap a Rust type instead. I
think we should have a new container type called `Aliased<T>` defined
like Opaque but without the MaybeUninit.

#[repr(transparent)]
pub struct Aliased<T> {
    value: UnsafeCell<T>,
    _pin: PhantomPinned,
}

This type can then serve the purpose of a Rust type that might be
accessed in weird ways, but *is* guaranteed to hold a valid Rust type.
It's destructor will run the destructor of T.

Alice
