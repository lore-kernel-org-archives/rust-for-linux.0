Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D281E260A
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767129518; cv=none; b=YlB0VY1g9Ke1F54bSmvs3caMVY0XyQ6Fzt8tPBfgw37lVa46rRz/zBIes+K/7H7gOj6knV4CMc/QZdbGT0x7SG0GKejGovG8X+kWtdFZwuPa6e7vwnCmNjoR2Ftoid3Usi72E7ufOG9lhn6xB/wBtYBD74cqw1xShdSsilBbw0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767129518; c=relaxed/simple;
	bh=bUIx7sqW/xSoOzAXbK75pfsETacvLeMU3ti057ooKgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLY2oKOg9zjvyaW3RuT3LnMnp0ZIIGlJ5/cOANpKwcyz4Z+AvaHxPXBvZildM0qrqL6VxdfP/30rYd+H7aRVrVo4dii2Jz7T/ghOlGbXJsqcT5+nfcxGeIJHvUtedumGT5kTu0RCmpRDzvbztoL1P+u/5wKmkwL1vwwHAa+v8IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOocneql; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOocneql"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a08ced9a36so25637605ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 13:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767129516; x=1767734316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSwLA+h/s3O2SMzi19IyDvMf0fyXttfr6+halg6ftW4=;
        b=FOocneql0CKN/fMv5gUEWftmMBePunge6yqKaSi6spfTd0dAKgnicgyKiPORQpwOTi
         TkXuyjaE4xP9AIuU+g8WRAS4t/W1k79orGez3n2UxGRrylp1o/HzCDZiCi3GtG8gQhbV
         t/6ehLFzrrtNa0FMcDhjhUFUfTsnbi5k9hVMVAh2IYss3/ket4lLj9EEjm8q6xQrBzNe
         Rx+HbSgnYcboGlFV59gcq+gbr8dCm2TTsmyIi+2suoH1TnO4959IBidLsUa6NVy2bUF3
         iuXA6ek+n6k03SsbQ/GhF9d4srLReA9buMcjG+P9D93iMP5oGEA+TdMImFF87JTqECf3
         tENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767129516; x=1767734316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSwLA+h/s3O2SMzi19IyDvMf0fyXttfr6+halg6ftW4=;
        b=mfyLxqNth6AzV+BzzXUTrTwJSrBywhsIIg5lMgg859p6YENTGchPkTLvO6BmOWUIUb
         mY+18/nLfYv7bH14K8wvyatN4ypmUxggsIqZ/TuywCoRev9Wts/Tzl+abHIa5EyWCIPm
         vMMEcgTnjlbgxfUT+EtpzJdGSBsMbtZXuLqzEvf7JpNNWyGd9s9LVG6eBlFZur0r8hwB
         vEIbE7x4oiJ6WfpRjHPF1IyUYRCywQIjJdxIYLXcT9BlNyCFjTIlnB3SCxRiYL3eUy4D
         0S7y0jOpKjZDDRLu0DC5U9z+ff28oqqWdGwtbgTCh+CUtyU9pHYJeAdX9db00IysfS0a
         pK8A==
X-Forwarded-Encrypted: i=1; AJvYcCWg1EmZQafEuRBuCBJfwmgNNhO5hBIdKdxTckSxghzEsvFmklCvgHWJru1So452H0hzuneYwMlOYLv8NHRnjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwu7CwC6wyiOl+k/TMiMkjBr7CfH8pof7iLQNkBR8e1anOg0Cm
	VDbQwclpJY7CXEmlZGLpvqinXG1j4qTd5dW5cQnTruqEygv1U70RBzKDdYIDI9h5yfDA9EykMKQ
	SoBzOOEu7CzXR/pzNHgjS2KI6Oz/ivoY=
X-Gm-Gg: AY/fxX6SqARz3Em5bfPD1AA3ZmOXZ0XCkow/TCJzc2kia9cdoFz7NVXtYgcakb2LdBt
	EkKNdpbRqQG8GfiZZRWwu6Khh8tQIRtU7cnPcJhJcEgyMpNLbSqRzRz+JkQIEk2K1uFEW9hadeU
	HtmkNQjKZhq0XDzv3zVuRUOYFSrlt3iaJmwnRtztTSY/cgcvo7gXcPCLJwrO3g7dnWVO7NOM+80
	a/Klf98eJcEzC9823Z0HcKntf0yl1svw6/L1nJvXd835X4vNsHY/kooBlhqvMQ7sXIqNUGL2Z08
	QGC0rteKmKm5OJdLHra6e8g1w2fVH/+1PevPJsR7Av0Nu2iQ2f8ZWZ9KtClTyc6xv8dTePG81NT
	Yyo4KIMfRp1wF
X-Google-Smtp-Source: AGHT+IF9HsrJzcT6oqTLhwpUyeHPKsANpT4D+2uXCXnxXXUKa01S8EeALQ9zc0V2S9+sVT0mAT5NXezje6yBeEQ3ijU=
X-Received: by 2002:a05:7300:cf84:b0:2ae:5a24:249 with SMTP id
 5a478bee46e88-2b05ea0b213mr12151441eec.0.1767129516111; Tue, 30 Dec 2025
 13:18:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227-driver-types-v1-1-1916154fbe5e@google.com>
In-Reply-To: <20251227-driver-types-v1-1-1916154fbe5e@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Dec 2025 22:18:22 +0100
X-Gm-Features: AQt7F2r8OSVMbwp0TxvKnsXH64HKvEYzGlQf4OrKBKIC137cNyIJRhycEMb2ydo
Message-ID: <CANiq72nScSLkB0ix6Rw=SfpqDirx_GgcCzgHLucKd0d=s5aZ0w@mail.gmail.com>
Subject: Re: [PATCH] rust: driver: fix broken intra-doc links to example
 driver types
To: Alice Ryhl <aliceryhl@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 4:47=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The `auxiliary` and `pci` modules are conditional on
> `CONFIG_AUXILIARY_BUS` and `CONFIG_PCI` respectively. When these are
> disabled, the intra-doc links to `auxiliary::Driver` and `pci::Driver`
> break, causing rustdoc warnings (or errors with `-D warnings`).
>
> error: unresolved link to `kernel::auxiliary::Driver`
>   --> rust/kernel/driver.rs:82:28
>    |
> 82 | //! [`auxiliary::Driver`]: kernel::auxiliary::Driver
>    |                            ^^^^^^^^^^^^^^^^^^^^^^^^^ no item named `=
auxiliary` in module `kernel`
>
> Fix this by making the documentation for these examples conditional on
> the corresponding configuration options.
>
> Fixes: 970a7c68788e ("driver: rust: expand documentation for driver infra=
structure")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reported-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Closes: https://lore.kernel.org/rust-for-linux/20251209.151817.744108529426=
448097.fujita.tomonori@gmail.com/

Tomo: do you want to send the other cases in your diff as a patch? Thanks!

This patch, together with Tomo's diff, will likely clean UML in 6.18.y
as well (Cc'ing David).

Cheers,
Miguel
