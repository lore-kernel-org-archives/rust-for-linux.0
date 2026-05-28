Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80879313545
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 05:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779947791; cv=pass; b=hdyJvpyAi7xAkshnPHsp+8SguOkB+1Jp7y0obWO/C4yMOL5mgb7tuKvTE4SDtNPu7miVPDJHOW6vjmLiQYZYlHxyQnXRXWnRQp2iXeH43JErI3xUANBBC1YhhyuaEB2nIIzJiF6XvF8q2RiVX1SYBTiTqtul1b8TbfYmv5qHnqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779947791; c=relaxed/simple;
	bh=SHQe48/OG7Vdmb6Q7Hpmrn028N5c0kstT6AWGJ7acBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjtLcfzVgm1bak+l4ikCfg8xs3pTs5VZpTXcsmNKpjbUU/g00ItK0nM366fKmy09F4NnsYM+Tzzd7fRRARWN+kQoFIToBkvicYlBUwM8zsIZkHgtJfWUzZ1MzYRukOdn+f6Xp8saDjsapHNW7GsnVcQKu42UEpaP6cHDOx6FGaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HaGCqSwI; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HaGCqSwI"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f0ad52830cso15879491eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 22:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779947790; cv=none;
        d=google.com; s=arc-20240605;
        b=LgQyEPAw47nt84Jjk/8/2xL5NWFwko+pAPgo1vjCK8O1Z7wQ3NkpZQy21ncElKgSPg
         kjvzDMb1ug6OBIhHE7RErSmiyv9gX2/AAVzvIvd0D1UGE4rcllkdn+gdhXbIGAlwwNFo
         fEgz4qCUYg84WqOIzVQmzM8cd2CDoj1EcHNtk2bLqZsWD1oxzSrOUNsIMYCZrWluhx9n
         /gqwOfH8IUN6bORJVTp4kZR4qgriD6kfUdRajPLS8l8HSEuHMJ6sCoq80c7nRiHQgEuW
         as1Xg6BAT7gfe25gEdnKXZFoNGmfz7x2hkpsBHKiK7A8LsISF0kpgjZtyBSD8RcWU+Wz
         BW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=;
        fh=qUuwp7RtPHqtyjRSw9pcOYM/5ra+92JmDZ/9BjgXIjU=;
        b=Ps+ZamngwuBkx20t4wNQfBNIiUuBoKtGu2Dfdd5/rt96zHCEsFxRqaBjmY2RIanb/7
         FR15014M69vS6h4ZczlKHeWuHl7PsnjAfvVCBfOgpTwSj9DXvetCUPwZyKbS0wTl5jO6
         3y/Hp6jmH+2OAxO4XeyC2BB0AVHe5glFWesx7CNkpweAL7eQwe6PBGivt7JO9ekRdqbY
         e/Z9PrDfv0vFVhQaUDBwfvg4FEvvqWWFI1UdXHyScKt13fPUCvTmt8NlZhH+rO2zH0vA
         CCKKzFqBtIyoQTNW/uEyN0e+/0t/e2sTshDMvDmHePArhO1TF9cU9li5OOmgklqZiOFW
         /JfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779947790; x=1780552590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=;
        b=HaGCqSwIE4CiwOw7J4OMj4eTCqNE6YypMZLRksIZp6fy1urcc6RORj+y+iwTF5/+bz
         c6FuNviodjTLqmmFuo+dvLIhaXtW/IdbqWm77mvHJ9EnykOcKZgsb/kEfKJ1+X6RiJmE
         ZllcNTefW3Zl8F5Fv3AMZdw2oZ8eae1h/Y7PsKDnTO7qFj8F9BD4kvhB1RZ43NDJ7dks
         8g9l5bfNzZ3DjF6DQDowCWap9aXhaotGZr0oLowNhVuYDZcY8VQ1y3ko99J+1p310ouE
         0hzDADNYT3iwsZCYP4bYZglykVRlc9lDQS432czK4pEaVazpn/2xFKx9fCMQFISBvmzq
         EkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779947790; x=1780552590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/tAvDfBZY4caNpdNLD3RtS2Pph9k/Hgin/a4k+F0Cw=;
        b=LcGQNWT1aThIYGBbshkCF92rMDpfSs0iRtqxYiqzoz65by8z7IBDg/a0g3TpfODgi6
         JlfaD8DQx8lnIg0GySPB2OW32twscG573sGvQzI5RtIRCsRtMa2Z7YrAP/h1s+hmFQkW
         oxiezWJUCE1fVcyfl7KNEIgfcUC2GszCV52vJrDePxUgUjmIAsufvsfHgmgGQRyXKDuG
         UwRnvs0U7p/0H2nwCzsfTJLC5Tmc0CNnf//j2dMOiLwJQhCstpqshksvwbdcFwUkA6d/
         SzWwBG0SFmNCNTq/17PHoNqRvg6AlbuZn1Q0k8HzhktZLhk7GvG9qPAxzjfe1dKyVAUh
         tKSA==
X-Forwarded-Encrypted: i=1; AFNElJ8ncOBSrtqtC1vk5v9/7BDocAJrKXAoTFzYZl3V7xO0Vg1eZSNuAnPEvKDXgbCky9h5h78j37dCXdMP/DP5Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYm8BluctI5j4fWpnCb7MHzE/5TQQeIB6IIa3BdePISvK+I2Xq
	2LYRbdrbIDbIyhJG+q3HOjc0bf5uBschg8+NnYL7+I00J/pFkEGw68/f0KZ32+vuoEXhaBUXFwt
	kJ1PGZ6YX41uQnLSHUcgiR9gtjGudJNLb6NOQfGqF
X-Gm-Gg: Acq92OHQuseZJS87A9u/bG6CRAiGvV9JcWPK7HvfDMh+zT/0as2Zwdut7eycUrd0CNG
	qXuMhpQhhhTr+JFxFqD0ixaCbaY+riwMADafO549nVUwzThLe82+Xdl0Tmwr4OPF91d/rPnGEwC
	ox7EU4UPFZ8UFQovekmFkMLNf1dHWTZEANPdr0yEhroJEMAD3zUY6EwwImCN0OXPx4Qru5tdCX1
	muaYXMfUlyJ0hECbFG2wWGuE3vzT1TWQe+Pvv9eGmvu1qFGDZ5f9RbN18tMclNwkClBmE1yZlwG
	53pFAfkvoZRRw7GBrcxkoMo4OmiZNyJuVGrejg1PXbYa+cRA
X-Received: by 2002:a05:7300:2389:b0:2ea:b975:3db1 with SMTP id
 5a478bee46e88-304491d7957mr12069640eec.23.1779947789049; Wed, 27 May 2026
 22:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com> <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
In-Reply-To: <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 May 2026 07:56:11 +0200
X-Gm-Features: AVHnY4Ie_gpq2EI8eezCf2IRezAi1N80vE8gyBvflGswgtsI7hjNkqwxua2zqnE
Message-ID: <CAH5fLghSe9tV+CJkqp5CkUPfugZ7hvMN0XHsh5kY3vs=3uQ2FQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 7:26=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Once the fix lands in rustc, this flag can be made conditional on the
> > rustc version. Note that passing the flag on a rustc with the fix
> > present has no effect.
>
> Already landed now, so if the uwtable one is enough, we could already
> do that since it will be 1.98. But since it has no effect, we can keep
> the fix as-is and do that on top too.

Ah, yes, let's just add the version check.

With regards to the frame-pointer one, it's probably a good idea to do
the same for that one. It's not necessary to fix the boot crash I
encountered, but may help with other issues such as backtraces of
ftrace.

> Added and linked both issues (i.e. `uwtable` and the `frame-pointer` one)=
 to:
>
>   https://github.com/Rust-for-Linux/linux/issues/355
>
> I have to send a fixes PR in the coming days, so I can pick this one
> up, but if arm64 will do so then:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks!
>
> Cheers,
> Miguel
