Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4920C26ED55
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 21:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672624; cv=none; b=md94SbOj+p3ThdU6o4qE2ypGqrJ/peOE7Ym0sxLDlkr/ZxIe7Uf0gNKPRTaxacU5aGvAWneurHXPQfOTtA3y5Sli5PEMdw5628CDKnmxwWrKhSthRbekx86f50LxoA17I1l3c9RxI52q6UQD4p8xTOwhpL/htjMjCyEvSFgoNHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672624; c=relaxed/simple;
	bh=U3kijjNUS1umqRYrNGhcTVAVnkpIauQRe4DSyA82U3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=An2G2F1LGlLcN7hS3CaSe+G0a2ER5fRsEKluPCMObCq0QTcL6ErFcsU2fu5N20IBBYTer94EJdOLsekp6wG0NWsXS6+Dhzs3lzKPQT3LTeMYnuxREAAonUq0F6rtJnf/oJAuzjC8zjVlG7IjrW3MMPBrWaHZpCP0CpnC1DxxkJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Up/ujpBh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Up/ujpBh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso114633a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763672622; x=1764277422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3kijjNUS1umqRYrNGhcTVAVnkpIauQRe4DSyA82U3Y=;
        b=Up/ujpBhqMcIa7DDyHYv+iEuwoqYXxMUYb2G+PXKC4VOG6fJJxV6VelLHHxEreX01q
         vYajW6ogqsaszNFgweAgMFG+vdAuKgVfdkKL1Caxp7kWN1Zhzey3rB76Siunt1GJJQl8
         DGPImyuMit1JqLRwNjgf9MuJrUN3aSxHD0+RSE+4krR/P1CiVea3wY4ZyebTYTmbVn/6
         ksvtsSIv3FlJgrNjZYKq70sb1ezg1a9Cr/RrXKo41MlEaEe8fUkSvNzY5uyhQKNWiiF6
         aQuMykKMMTxlyKkS8m/ONZZAwesnUv7UGzSpVrVOyiiSPVsul775z6vmCzluw78DqH87
         6fHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672622; x=1764277422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U3kijjNUS1umqRYrNGhcTVAVnkpIauQRe4DSyA82U3Y=;
        b=UQPndC2gdPy5U4ja0yvj+WHpyBpAZDWgXy0+whbGjqrxmcnmV+FXl3NwQsuS3q+Pja
         Nr1qCPgj3LP/b70Fzemm4TuCH6kDhd9MFp55W5A27PPpPsOkAWB0GRjjHb1KpgdOz8EJ
         aEh0R6Wd3YqKJSHLv7vu8v7/ka7HkVq26w8d2qoRqXunrIoF4CQD+9i0tJNK8pc7KHc6
         LqS+7e/50rfzh6N66qGUvHstbLGSafmxxkNCbQ/YUCA6M5A+LK1o6ySa4oORpEDdnveB
         ubYWJFcQmzrd9x3Zfio4gN7yZ2GhQOR4pW451O4IIRzjc5vLwYZF9CJFLaMDVKZJcw+F
         fnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/aJ5e28v2NpmXi/f8KVJVLuBvzS0yxgEbDZstVy6ABbGf/9wMO9aa8nt1Yo9FoI38oDelnwH6iwb82Om70Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6F4d8jdsA5c+7nyZpOwlRT+SknHeXYBJBcvhNfEylfPJtIwJ3
	Zp78JPsXo7LDM0BOrPG6kZavfk/e8Ak0oLepA0C5LMfZWdKzJHHL66m69psf3uJDy5TuUKU6Kny
	rHyhXqrKABwzfflj5sNC7lYUrsbHqx3c=
X-Gm-Gg: ASbGncvbWbHACKeuQv7eI3ZuE9+/Z/Bdga9+SwSTu9eXS/jTwXVoHXSmTt2BgVMOQb4
	v/+Bhw6hcP7DiZVWtWRwOe5u/7osL5htjc+c6pFYSR/rJgiB4u9YnDwVuxhcddmbwHBvvyGCN1b
	v0tSxCR7eXi94RO6cBf/Wtfp3yDx0xFE6fsEgJ2c1zZ8yev2yDITx2s98TuawdtSkM3C8g9RYBQ
	GMqMjRgn9YF8ER3EInrO6DwDnASuNfAIOPb6luEqBNLAQ6hQKOzsYHrP7LB1uK2XMshooImNxhC
	lJHrVpTt2t0Wifrj0wwk9fAgSzgF5GkDTn7rnyKcDF2tYVKyHoP/IPiQZGptgTW0QRHSCwV3+ow
	F7zFwhii7208HCg==
X-Google-Smtp-Source: AGHT+IH4jFzqgh5YTMzDGx3sTXFqWpbwXT6TC8lC3bciydgtCReaoR1SR6ggEKHwzJbr5nND5uiHINnsBCR+ec2/98Y=
X-Received: by 2002:a05:7022:ea46:10b0:11b:65e:f33 with SMTP id
 a92af1059eb24-11c938041f7mr1387160c88.1.1763672622478; Thu, 20 Nov 2025
 13:03:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120-rust-driver-pci-fix-module-name-v1-1-430cee310dc0@redhat.com>
In-Reply-To: <20251120-rust-driver-pci-fix-module-name-v1-1-430cee310dc0@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Nov 2025 22:03:30 +0100
X-Gm-Features: AWmQ_bmZr70MqtYq_fIW7qx9b2D2eCrb0YuvAUuVBTaj2lyR_fdcoVhfrJ3s7kI
Message-ID: <CANiq72nDa9NU7VH7ObLy_swvj1bWzm8oKy0oAerq=PykQQhtoA@mail.gmail.com>
Subject: Re: [PATCH] samples: rust: fix module name for Rust PCI driver sample
To: Peter Colberg <pcolberg@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 5:06=E2=80=AFPM Peter Colberg <pcolberg@redhat.com>=
 wrote:
>
> Replace driver_pci -> rust_driver_pci in config SAMPLE_RUST_DRIVER_PCI.
>
> Signed-off-by: Peter Colberg <pcolberg@redhat.com>

Looks good to me.

In case the stable team wants to eventually select it:

Fixes: 685376d18e9a ("samples: rust: add Rust PCI sample driver")

Thanks!

Danilo, Greg et al.: if you want me to pick it up, please let me know.

Cheers,
Miguel
