Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCDE571
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252643; cv=none; b=UBNNcSPio6bDwYxc1Jg+XbjNqCQSmL5pxHySpT+3yGOuaYmCSVp879KOLYSAS1opBZUQ1OHE/n37UvaQaN/S1M1wYYZHZo8CIpJ7loglTPlPvfkIQ8qtj1X83x+6rsUN9c5bTrLKQHYQJv13pKZLgEeNeIfRofWxp6H2Lu39bJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252643; c=relaxed/simple;
	bh=j71+FHwXxzkJNhkEuldNJWlnltsLeZCK4+/HOIEh/3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvIw3eJ/HwEWyDaJ24tRSOi8M3xOE5XhQ2p/O9QtnSlEdVLumlqZQbsmNoqxcCtz4I0vSpfI1IQvODJlFVnKxbm9abKmPHVCJ2c2FEnCuiJAi0oI9Vx2MDL+MXwQ0lSKHBUFEgWlUrqd99t8mXAk4pLcLymAfFm63/Rv0gAN0Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CBiLosDI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CBiLosDI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a375e72473so3794607f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Jun 2025 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750252640; x=1750857440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j71+FHwXxzkJNhkEuldNJWlnltsLeZCK4+/HOIEh/3s=;
        b=CBiLosDIHt4lQhD0rnoUCzQWiyYZUVY6uZzi1Ype+YZQEtFyu/ZMDvuqfvL1bYSo/I
         XWiYNI2CfL3IJyOUNRKa6U1GaUyiFID9weCaUio/ThDL14Majavl3augQROtFlRRGviH
         gc/MBBFKZiRd5vrHqsgV/PfLsaG6t7G8WQl1f25KPHaaFv0UVhRDg9ZwFp/N6k73O6eM
         0CevzCtgkBaDp5iLr7e7LaotsEOei9263RFXQy3j0TjNqCcpitFkvosLGgnkHDDY9BxK
         +PJdPXYhULgYIutIpO9vFwITbxbkcyAjJtS4K6XU8AXN09nPLBdi/rBDboi+5googomT
         8bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252640; x=1750857440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j71+FHwXxzkJNhkEuldNJWlnltsLeZCK4+/HOIEh/3s=;
        b=l1Z+9q15leRWlGyxZStYCAtYmq6vGa7ATN10slSdBJHOgut4HIp9/dOCrt4tjCIdk/
         HCmaKoopLX9guyvI/BJrZc+Gywj7cQWz2wR93FJxGN8JzZ8Bh8VjFMPsfeBReKslPGTd
         O39na7FGEyK5PrSXUgIGFK3thze9havxl8zm5SCyfq/vzcE4FhlD/FSjbfDRvCpFwqbj
         3kIW1PHcIrCX5VNb9yfHK2htv86LppfssI4LLJKZD5Feo5Wnfrnj0CHCIM6Cp12/Z8WP
         2KeF4q9sGvSMpiWOdXwRVLxNAtMIpMEDsEeCy+21al+R+K7NSR8G7+ZO7Tlk0wXjuHz6
         8czg==
X-Forwarded-Encrypted: i=1; AJvYcCVe3gCun0nJ9kQXDHpCkjXxqP3/GNLikghNXHvtw4ZgGmh1Ra1tv0MrOhI05wjFOIXDGKDdY8qeMo366x/LDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWkE1vc/Pl+5RHYctiGWVuaamXXsmggCy/sfuFyE5HPZuHpR+
	GG5XV3tJAmNp7DN4VzafXyl08pkRvg6IJgMd+ijEGLSAbsDhx7j+6EKMNaJW8T6TEyAJNogtd46
	claf7U6FJXRHKg7c7I24Nk6y3AVjxg0NvPjmo7Xd9
X-Gm-Gg: ASbGncsJGhrdTwMKEGgLfCMrYkNky+3L4VidFWaBKIq4ZbsUYRWB64AVoOQ9Zkp5sW2
	/r08aNsLXyXnPFtGSSPJDPslpQ/a4j+gzqb80bQcyRgPv3qdF5LeAUn2TI4zx4yaiAnhnpJF1JL
	4fpS9RLoyo4x1XXVSvv+NRRiMtgJHFZdoo7hoH5MTwWJSbSC93KOIflAjvvcZWZber0Bj3gdTfN
	P6gKtVitjrz
X-Google-Smtp-Source: AGHT+IE54Mw4btJqPpNbSSpqoTSI6AFGE4jmq5am1hmD9ADgXWf8v89gzNYl8ztGOk9f5H82BKn2Aqr2Hu/1qveZ00w=
X-Received: by 2002:a05:6000:2dc4:b0:3a3:7077:ab99 with SMTP id
 ffacd0b85a97d-3a5723af862mr13358543f8f.45.1750252640017; Wed, 18 Jun 2025
 06:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
 <20250617144155.3903431-2-fujita.tomonori@gmail.com> <aFJzNCCERjKHIVty@google.com>
 <CANiq72nP+dKugMv3KXdJJsFE0oD01+zYgWbjz3e04kmhj_5MbQ@mail.gmail.com>
 <aFKMXqak-mHraxU_@google.com> <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
In-Reply-To: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Jun 2025 15:17:07 +0200
X-Gm-Features: Ac12FXyzvouXkA7KD80cuhCpPswpg_uQRqj2ZXDFSfljelYYcD3AE00K3wJtTs4
Message-ID: <CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 1:03=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jun 18, 2025 at 11:52=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Yeah I think using as_* naming for cases other than borrowed->borrowed
> > is relatively common for Copy types.
>
> Hmm... from a quick look, I only see a few: on raw pointers, `NonNull`
> and `Component`. But maybe I am grepping wrong.
>
> There are a bunch on unstable and private stuff, e.g.
> `ptr::Alignment`, so it may become a bit more common over time.
>
> So far it seems most of them take `&self`, which seems to align with
> the guidelines.
>
> Either way, I agree that what is important is that it is a "free"
> conversion/access/...

There are also methods such as Duration::as_millis(). Yes, those take
&self but &self is equivalent to self for Copy types, so there is no
difference. And even if we did treat them differently,
Duration::as_millis() is actually borrowed->owned as the return type
is not a reference, so ...

Alice
