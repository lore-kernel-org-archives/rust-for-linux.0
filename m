Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6166833B943
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 08:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810845; cv=pass; b=XWcQiqltKrkENLXgKZDCUlU9eOXbHin+6KmcoKZDl26imIFaN1EIXb9GcESAhAYxfxJ3N6R9ZgaNFxrrJeDqdux0Bqwno4mdZyhSuxBvYVHxvqVLZxPvwlEaRB2Hiy0xn1AIvBL8Fha5k14260Dbe/aRaeb61oRQxq9RKu0kp4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810845; c=relaxed/simple;
	bh=bNhOxNbQwodyeFPJLDIetPPEpvTjkeTXseDia+x4Nq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AT0fxIZNFfyy55SxaKElltj0CLyH0PnC1v5GxIYjGro5zfC1wyJ5ccZD4r0q9P/c7rW5GkTMacVeRtZgirRiTqmotRgeQijedFhSzYL3fTwGbFfpFuDev9TvEZIAaZxTpWL5dFVDtXgV+HKMS5XEXt3PKWnJ9dhnrR1EcHc2fk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOnNiOtX; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOnNiOtX"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ac370cf8c0so313143eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 00:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768810843; cv=none;
        d=google.com; s=arc-20240605;
        b=HbsxlkiPLxTdx9jgpyum1b+QYa7KmDATGZIFYIkIXeWhHLOij17ybChJF2V6tkFTVd
         DDetVW05A+6JtAPFljHFHf93Lv28WkVgDdR2tjRCtYiV53Brl+dwRehVjQpOiKO9BexG
         ZfO/IrozTFc0HqupvSF10GsZrwFp3fbQhEYnvFeEhe8MRCGow7cVC/MeNg7utqUyKmWa
         StG1VwO0Dn6yljs0eGh2zpKzU2+N24tPhihoKxURUvtXxpWMQPx3EaSaTO9s2yMwe29V
         UBzSGFucBhgdScRTxpfxSu4y+PwybG+sP9V2BawqXrbXyn6rwxJEBYy9ASMUlb4iPeM0
         xX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNhOxNbQwodyeFPJLDIetPPEpvTjkeTXseDia+x4Nq0=;
        fh=wz2sqA3PC9inuLk8J8CyKmKuqIXSWBmR9X4pf45c1sY=;
        b=PWtJtsHg/QH8AiJQGCrT3ENfCZEBJ3wJGCoj4dkDZRqy5YtrQ00MPOXyofyakiA/Q7
         ibXtS4/JFIfbmMKsdZPXoUxm0RSaxP5kzNaTUmVU22+nMitvkkitfe+bNCGqoPJtLHI4
         jaWg+h2cvSEYAXzTU3Ba1VLWPrEGISe1lCNYYwaaD7WFwu7cHDK3snpg14b8nkmJGX2N
         ZyUX0THY5KCOcBmezEEaf3n1+jk98Y9AIddbJl0ABw2qWCGih/5jrsxO+ERV+bl3RXzp
         mZ8iFku02LT6Uv+wE4zHEm26Lj9u74ch+2571BvA5l5XzyepFwXIim0Z2DVrWxZ7aVTX
         1hNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768810843; x=1769415643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNhOxNbQwodyeFPJLDIetPPEpvTjkeTXseDia+x4Nq0=;
        b=BOnNiOtXngFnqH/Jven9xUe+LdLXvzqgF7VFUsHTPYfrBrkY/cVsg5q9Q7pzPJ8yGk
         WyFhxPajwVPmH/jsidlNj7NyoagJ+sgRoqmOX9C3Ks73C/lF72hUlvmFXzAOcmdWgoDx
         JzMR0VRKnkhBBVQzvxEZ7XQIh33jKMhXRwcBKgTjKA9zPR5op1YgS0j0zQmNUoppnn4N
         CGIQ9JUv28pbzDNsmsDC2YDFlsBoSAnzsXNhh6RKjSigPINImWISkftouxEueeF4w0Ji
         g/JJ+1ikWNoiINjMfcVFlxxfOeildeme2CULntWgMNzt8M/VMblw0ch2JRiKjsRikYUB
         fxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810843; x=1769415643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNhOxNbQwodyeFPJLDIetPPEpvTjkeTXseDia+x4Nq0=;
        b=r5+fvow1TIK9TQMrLW71neDJi+XJuNMjhx3mq3WfX7KqJivodPWMk4kMq9SudN0WAm
         8tL0fRUNLcmgDjlHWzIS2ZNb0YPntaABk4+HPnBlUYAnV1iBPX7PnTRQ3M3VNogN7PcW
         vgOhPkYfIqv1S50yfzr6NdY5Gvi03ehlKgOzvjyBteynPH8RLOYE5TPBIBRSVGRZl3QW
         qQWldVBUys2b+8/xtwF7vlxIy/E7JvtjhTVTiHHsPVMv3TK3Xi0+iUMZ7LW4P0ro13rQ
         4wLaNHdG0QViN+dNplwE4UuqX4y6f82XH3nYetG/n22kHbTznDK5bIc/JYdkZFEHGv8y
         oqYA==
X-Forwarded-Encrypted: i=1; AJvYcCVp58h7ho7LicBWT9mQAuR5llXFz06giP7cHEwRV39sYEl5PIMJ05XEpZU9SAOdL4A6TUm+QIj3xZASKslyIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVQfdwP1qxYUk+46p/vVFH5yhMBtIg/2N96eLCrBDD7wzSt8u
	nXNO4s4964elNlgeD8THp7BKQ6HikGtDURyiFObZhCVKqu28mGYoEQjDlqp65FC3GNH27UKfQ3p
	HTaTrdCNdkzI0KJb7IekXeJK4ArwPgkc=
X-Gm-Gg: AY/fxX7s2xxBDsbTHfnheMmLfz3DKtAw6u8vb2O0H2n7YS66vfYoU9NiZknWjyDOqJ6
	zDMF8wO7TmBWfgXpmu5nxeSsVmTN+PNWZ7Ec0rk5CRejsJcHyWRz/4u6JxCFQ0uBbrYyxDVXU6+
	knksOZ0sagXkj82kSYTD3Q5bqOcHVOkk4uTj0s4NLQBACU1eB7cozLjRnXQJgUmk6ru+rSVGw4P
	4E97PiqRlZqDjiD5NLws1UUx5RkHE1LoxMhI+jYlEtrS9dptn6j1RSvZ4xCf6mV6dH2JqjQAKwQ
	5ABkMaq3pbqv9Z8Etwh/up0XrjKHTYOUyWbdHbz2j0rT0bXgAbiY6zFy7KnNjFSksAYW2MbAYEp
	gk+veMx+7DGL3ERvdGak9bWE=
X-Received: by 2002:a05:7301:3f16:b0:2ae:5e96:9d1b with SMTP id
 5a478bee46e88-2b6b40ed366mr4323306eec.5.1768810843358; Mon, 19 Jan 2026
 00:20:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
In-Reply-To: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 09:20:30 +0100
X-Gm-Features: AZwV_QhtBeVesdv1v9tVOOVgYRT4Lw__0nR_m1NZrHO1EDbWn-RCnTKx6CsmAOA
Message-ID: <CANiq72nk6Ru4Tfnw8xbo=Nw9yg=Cqx5=_oqJsiO_coSEGP0u5Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: i2c: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Igor Korotin <igor.korotin.linux@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 1:14=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
