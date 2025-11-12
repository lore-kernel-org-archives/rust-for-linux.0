Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31482FE06F
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946082; cv=none; b=qjHitmQ5nNlZJsyZ53bLa0u67NzEPOTxuYuN0/aYJ/yGZWCF0PgNGqKGgXEheGlhf52x/NNpMzYfj3AxdaP4y8g4dQM15jJq8DTGhg3ct0vVKl0pwSwpHBu6uqOcklVe+xTh2y79EK8hs5yBKp12rBEV0HBGOYLgqNnXg8EnzYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946082; c=relaxed/simple;
	bh=h6hMfbhgFDo+gCBofNGaIGR6RdADey1hjtSNOkDpSwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzQVHfNUQDg0vRfY7pX3cEsUpgCKE6v96LyggPPvsjc19trwOYfZRWWaSbuDZMdaHcAEd+FXzTNzt7sEc2p7xImQ+GL2PenczFlufMgNXgHRk3xCzuFXNU1EKix2wIdDxR7Q3ffJD2EDfAiGjBiez3PT6PUJbPEqV2oQ3GkNxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXSQr06V; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXSQr06V"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso98208a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 03:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946080; x=1763550880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6hMfbhgFDo+gCBofNGaIGR6RdADey1hjtSNOkDpSwU=;
        b=XXSQr06VR3icfBrhIVBXYOhEkXBwUypD2/Zbn/OeMbIgyQb9NlAN4cUmi1b+qwzrNZ
         TfmiyBnmm01BMw/VftgpiShBR8deP3nhco1AMvpBAwOUfKNCrQ9o3l8ofYrrz6rgxeGa
         XPinzy3OFFdr5+UoqdIpFrNMldYJEUvOgXJzsiCF2H2ASY0ee+tFnIYzYpoTBdowl5cy
         cU/73ZrH4vmlmfLuOKvtsoaiQu6koG2qhsQAvYc/3sLhjoKozhymp0PtHeFq1RKx9hVJ
         iLt7CPvcEgW/CLsM78p0ZbN6paiQtho4uMPzVzRPWdI/oHbAyFtDx1zwIoHDLzpqIoM2
         0tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946080; x=1763550880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6hMfbhgFDo+gCBofNGaIGR6RdADey1hjtSNOkDpSwU=;
        b=Dt9nJMUFKi08jdNmjQyjNdq+ACxaHYOxHz2WX1Hb6zOECTN1Dpmz5a6GDzgrEGpIMp
         VZF8mj21o1XKASZ1WGMcb9z5Ia6xsXO56Uf1gOwuX8p4tlHPC6qW9Gw3hL/kzRn+xv9A
         vBgjvztVJ40iXWpiLoIr0+3GKAIDkB35ZMz3hSJgzzyHHSBGRmSC1nmZWjekptsYgR4n
         +rN0A18PaAkMp3K2tX/GNWAxjB93b+bsQMzb6mrxBhXNUXff0zNaFjtfFN3UpgulM0lN
         yqEPO3EFz2tDKqHbGCh1ISGAVOoFDlteiq8p+UZPPFDX9/s9uU+p7VRKe5D+HGIe9ayj
         lYCg==
X-Forwarded-Encrypted: i=1; AJvYcCU2xKiyrKX7jzmoX2RAMeecFHwAHcaOcUIqSZmK0Rjpkh96htFyst3Np4mKUtXlmYs6O7gLiQFwp79u7G32Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/uoTaphRLLvLeAw9NFpv1v7MYyAV73QGjl69sGhLsI9Vu+GB
	A4RP9RY4gLGWF5zL7EGdATwuHMKUgNbgPfJDqjLcRf8wJ3z8Mx2IWAeos0eRpdLElwfZHDhzoxf
	0UBPZ8hPlyNihC/ht6dZX3HjdAmMpO1w=
X-Gm-Gg: ASbGncupwiHmoICJT2WoltiEo5PqIwuuk+ghVbtR3divN5fQg9FkH3LAEysOfqHT2D+
	X6isKabJ16LHRS7Ej0bXkm9XT30p+4yquUBD4f7rbQ2s6IeDhmMh1zj4PVcmQjb7Wz8owVUgHZQ
	bupTZTlIC3RedjWLo6WJj085hmwt8dnSCjSoQdr+8jIuu+RHqJ/BkSdxhhaghqklhYwPLOcLRbr
	G1DyqNZYj1p/g/UTgXk/Ct9yYMwQ/+4QrqNCPJejICbDYeMRi1lqvFuu1qzBa5sjlEyGEIlys9o
	0eaSls8+z/TJCHdcrqhIJjVTiSPHk027ytjqw28a3Q58yf2k+mgkVbQ1amietC2bt+bay9h8Na/
	FrEYNoGMqfcZeaA==
X-Google-Smtp-Source: AGHT+IH+LDSJrK2CxsT+xWZOdZ7gKFmElQbYj/uFX0H6HJGbyKRr591NNlUWdNkrfJ7Nf3ybqLt6vVVhtmriacHHU64=
X-Received: by 2002:a17:902:c409:b0:295:3262:c695 with SMTP id
 d9443c01a7336-2984ed6e08dmr21652545ad.3.1762946079913; Wed, 12 Nov 2025
 03:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-10-ojeda@kernel.org>
 <98e549da-b7d5-45bc-8a9c-d05eb06a75e6@nvidia.com>
In-Reply-To: <98e549da-b7d5-45bc-8a9c-d05eb06a75e6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 12:14:26 +0100
X-Gm-Features: AWmQ_bm8KNkpZ7dumhoSEH6BrwUYU-Dw3GKK1Imj_lLMN6rly1tXHJZJQTQ0s2c
Message-ID: <CANiq72mcQJnW-F+nb=Vseoa_amcwwhkC26N9BOs12MVfMVOdVA@mail.gmail.com>
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 8:34=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Looks good. But for future code and commit log readers, should
> we leave a small comment, to explain that this was vendored in,
> and therefore excluded from "make rustfmt"?
>
> An alternative approach might be to create a "vendored" subdir,
> to make it clear which parts of the Rust for Linux code are
> special in that way.

Sure, that can help, I will add it.

The subdir makes sense, although it makes it into a different level
than the other crates and I don't see it done with a folder in other
cases either. Hmm... I will think about it.

Thanks for taking a look!

Cheers,
Miguel
