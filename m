Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC43396F8
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180517; cv=pass; b=lIidiXZaQ64VlHucuwnKtki5sXu4oZYcWH86U2TxeAkAbWv00+Yquwl7BrZw8E7dASQrHlRurgesCzuaTFVwKx4/C+xQ3X5NRUu2r+oYxKRp/vfxrUA8ucExftOFXoRpI+372l4Aw0AU5wGfuyvdPy3SRN92agZbOuVlsvbhvD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180517; c=relaxed/simple;
	bh=VC2h4lfc+BbUujEGaba26tXKPRwhtzboKzSAr/97GhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6DFwU9fLmY1HA/gvDwehKEjR0hwWPYwlEFTcIG69AzUI572WWbg+Oh+9QMVp3QnwkuIxrPGu4FXOalgrpLI50UB3D3IMnHv2pSMvzaFuPdIZ6zQkHlZK2+JJQoRvhkI/GNynR0o7zPIhNIQ5ncw6ORKZ0h+SG4I4Tq3dHl8LUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYDLKEQH; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYDLKEQH"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1233608c7e9so329920c88.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 07:01:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769180515; cv=none;
        d=google.com; s=arc-20240605;
        b=P7vnfwLS3gkuzI0dKrIXg+P0zQkmtgtQrY92kdFzI5ugvkMkuJRPOdgeh9XZ780qx9
         hBBBijoO33ef5hHFSq+X71yTbSWVVVdRvqZLYgngmTik/94n93nCivvQuR1f7QtlcMtA
         KCxWz+1Z8UcnPnN7xBkGaQHs/TxPFRV3Htv8XsxOo4+6yR2xG9qpuoLcE8o2tzQZ4Tke
         +L1NNCRxGE8Ob+yMOnTYyRXbFmVwuiw/y4n6PuoM6kOhHUUE7wONU8Nr6cmOVBlT2oB/
         HmJ/W1K0crG5t1hhiLqm4Mp0QpfuRc+qzrde0NZokos3Sg4uG6pB8k6ghQvag/O0S0IP
         HWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VbFx30dPL0M2NcCT8PkhEdtarDYXYJVb0o7yqa2B0pk=;
        fh=oR4RFRYYEpwB14q7Dy0ZxCnxL8P/RegWEq4eB1kxKV0=;
        b=A/dWOh/uVpolaGZ9VxRXe9vN0QIz6NQ5dCzg3JCpafnIL0nfuSwM58DYPjnnzFkjka
         uBDQXpgthKEvme1glkViob4PjEbP+gGHoaN2gefTpXzQHEJRa/a6KHQ7LlzLtMNeTfJ3
         eEQE17tdpQGuh64sPWgemDOCFT/aysBbleACTc1n3FJJj+NGai4UkTaTR5al6SQfXZaX
         RelA8Y+nof6B9IGVg93N1/FTw8A2+DTdSxnSFq4JUcy9SCcwh4gM+0T7WkSQqMc+udGu
         j9NWc1gGt07bPYZ5ukFF7OIX8dtaR+rqYc/XBh1kKYjhBnH611o8L7gIh4acA/NxXl25
         ay/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769180515; x=1769785315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbFx30dPL0M2NcCT8PkhEdtarDYXYJVb0o7yqa2B0pk=;
        b=gYDLKEQHYL8yG5Slp1rrpgRK3JBcfOF2FBA5mc5dy6n8cHfTtsLOARAFqAUB7G4EgD
         mU4IIddvuJujAK+icD0frowbNlM8CEWAUJ1v4i+LVnhhU+339c6sTs6/8W5JEqDSspet
         w9rsm6VUi9ZSakgkx2Q7dbsGgC1G2dkEviW28YutzbJTQ/cI7v5njbTsycuAwHfsF4AY
         RWOGEQcTfT9pfjjqYwsKYmituo1vLptY3u9+Mx85HYL9OvlVd7gImHv+Af75ObgxJ/sP
         msoHntKdB3cue+qremWdh0apmAFuKVdPKlOSXBG5zPoMXvX6iTXuTY/YxEuN3Iy50FML
         oDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769180515; x=1769785315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VbFx30dPL0M2NcCT8PkhEdtarDYXYJVb0o7yqa2B0pk=;
        b=dpZ6/FIiG7LYKC6hV39k3/ie5mj4+uRQbd9H+Cjpd40W81tQZNwBqhPPBc7oEbMOiF
         4lXVwdJXsacF27kf88Fe9hRg2+Oin091WwTrhjH4tX1uJ6tk3n43kmkc3CWoCLpEhHxR
         PCxL4jCkVOnFVDZcgou47XjkIWPhSXjNLEfWJIawW7X4IdZOgK4WATFk7nnPIB8aSmDs
         LLcvuwXx+SWsBmcCEL+3YT2Owu/rKDIRGEQnkxIKgKnyQoWTYsAxeP32nQuYQJ9AfGOs
         mpglJjGzrF7vPY3nr68dCGslnK7194CKBZR7DKPmhHjrFE+ycX8RK6E/yuR7+eQzzPFd
         k+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVcJ2kJw9Wnw1gX6z5LLAHia7sqdBjN/kOSoHlTgRzO/WoQzb5eRP0cD3/QZds9weeJyylsA5xsAChz+hk6LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxxsjTSRRY0ULns3TjF1gaX2CbiuRdEZ/n7Ubmslq+oj0pKERM
	ZhafXIHmNEu81SQjNLzS32fylxrno4P+yiOCYNBM5aSmLynfyA1oyEuVT6K0B6+HuEiK8VsdEKC
	57VIywhLXo6zmijo3n3BvIPvbgr0vzhU=
X-Gm-Gg: AZuq6aJB95aJFjClhCzRtYJGVLtgWr41zyqlcrrjt/Au6Ddh0BFLRu1cVy9rD3EPOE2
	hj0f9/dvinJGxpmauaR+Wmo+oSjvnHRK6PMGm/ruxpT9rRGO/jt5g9y8gzafDQb1LihNNCrPOzS
	lDVeC6tLZq1rYirZ3o5lUjgahP8e8XuGhTkvHt+az3e5XtVRwO5osHc3Sh0DA05ygP7/eCCl7+C
	Vc1tclMI1zj15k4T9QtB4GbJI7WzHiL1QlRhPxY9wUWQ7MxLHyo0LqknLThp71G7ESkO/wHdafP
	BHtRXnxYSHnjJG7cuTfQOspMqOLhxlqrR+UcjdoeYr4FpyK45NcU1u+e/MT2CoKwW5bosa1adM0
	1TxmMOKjksK4+
X-Received: by 2002:a05:7300:324a:b0:2ae:5549:2c86 with SMTP id
 5a478bee46e88-2b739b6f4e4mr843868eec.5.1769180514805; Fri, 23 Jan 2026
 07:01:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk> <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
In-Reply-To: <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 16:01:42 +0100
X-Gm-Features: AZwV_QjGYp8HTKn0evohs8O9D0EdmrgFJkbU0Dzi-AzDhaVW1Ks4i5R7pcNc1VM
Message-ID: <CANiq72m9Nq-Wonw57Nwk480CTCmoaDk-_rTLX-dFrqh_N+eyfg@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: Mark Brown <broonie@kernel.org>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 8:46=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> If I run 1.85.0, I *instead* see the following ones from clippy:
>
>   CLIPPY [M] drivers/gpu/drm/tyr/tyr.o
> warning: operator precedence can trip the unwary
>   --> drivers/gpu/drm/tyr/gpu.rs:51:13
>    |
> 51 |             shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI.r=
ead(dev, iomem)?) << 32;
>    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `sha=
der_present | (u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) << =
32)`
>    |
>    =3D help: for further information visit https://rust-lang.github.io/ru=
st-clippy/master/index.html#precedence
>    =3D note: `-W clippy::precedence` implied by `-W clippy::all`
>    =3D help: to override `-W clippy::all` add `#[allow(clippy::precedence=
)]`

I took a look at this --  Rust 1.85.0 extended the `precedence` lint
to catch these, and then because it was too much, they split part of
it into a new one called `precedence_bits` which is not enabled by
default, which landed in Rust 1.86.0 (and is not in Rust 1.85.1,
sadly).

    https://github.com/rust-lang/rust-clippy/pull/13743
    https://github.com/rust-lang/rust-clippy/issues/14097
    https://github.com/rust-lang/rust-clippy/pull/14115

I see others in the kernel have written similar expressions with
parenthesis, e.g. for Rust in `ioctl.rs`, and I see a ton of those in
C files too.

Personally, I don't mind seeing the parenthesis, but I know others may
feel like it is obvious.

Now, seeing quite a bunch of parenthesis for this in C files, from
kernel devs and crypto stuff and all over drivers and so on and so
forth, means others definitely do not find it obvious or prefer to be
explicit for extra clarity.

So we can just clean this one up and later enable `precedence_bits`
for newer versions. Or if we decided it is too much, then I guess I
could allow `precedence` on Rust 1.85.0 only.

Cc'ing others in case they want to give their opinion.

Cheers,
Miguel
