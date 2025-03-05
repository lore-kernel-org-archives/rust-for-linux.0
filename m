Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7227A24887A
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181001; cv=none; b=JMeEHQ2XDV+pjzTMtJrVCeH14ujjiuweHSDCmz3hSUkNk6BIW5hPldyFfBiAG/A2JnHGUcSKHCAImefcZUTgL2tMEFYNPmIsx9orfLbemsrokbKJmgzXuGtC3j08zqEm/0/SK9rmRcfdFAAksq4wDN7pVN29KxSU+XHutA8va58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181001; c=relaxed/simple;
	bh=CvZzmTRq9RSRFIPDPsLJH64TxFi7393kD1wwL8DuRwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HX6viOEJARU0Qvr1vOYV2UldE9LnSYNWzvDxF5bYBmrb5E8mUNI7yU6DV/PTGGgTELO4sGLrflMVCbuIrDAZ/TrGg+ZwYnPspaiQO4wmjnAa/CWSG/GNOkQhxEsuJeHy2xKmo9+B8nXztb60JJmETVrRQqPGTnMWUwlZSb1ZWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H4dkr8Md; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H4dkr8Md"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f403edb4eso4096875f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 05:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741180996; x=1741785796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvZzmTRq9RSRFIPDPsLJH64TxFi7393kD1wwL8DuRwo=;
        b=H4dkr8MdF+9diC2ePhMIkXx+2plRioLGENE36hFHptRFc0kWEYpJUujI2Qq+OuFclf
         /cKUfiNcFpmKrLoXu1tAzJWSyqwgEU4SIBJOIvfRUnHCNsZ/hHuEiZ+5EhiD095dis6b
         puiDfqREl7ZZ49aM26ticfiRf3rZh8/AFKK/qXHGU7QSRuyOCHlOksCmGPV/rF/rpCes
         qVAQOlxgL8GrrU7f/4zb/jKbHLCzcOyGih6didrz7PywLtrILdvCBxNnrtabHSCsFZmZ
         XPjYwieWFRX+4huDbNDpa/zjDszKXm5bLzIgcGA0BR6eieJ+eYen59Jwm4Hg9Oo+PabN
         h73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180996; x=1741785796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvZzmTRq9RSRFIPDPsLJH64TxFi7393kD1wwL8DuRwo=;
        b=q29Ke5+8C6TaIg5Tu2VN7uZY3g2dEJ3uF2PwmBZsASZemwQtJ3NAyBBYirXU737qFv
         hOSUdfylIOTTmrOu5ud+FGKCI66qraUYwuVUkW7H7RNfXv58Qi+1Gln0y3JyUm6cApHU
         NBbxL8L1BS7V/mcX1aaRNMHJ1tkqr9sOrQ9SmnEUvDIiNulQ+XUlUGmJAdiJ1HcJ1NhD
         kOWuSg1B11tO/TEnYpzF7OY1xJBeTtMRAcqs2uDFNhHduI3nOxjlq/4I8iWVEtO2QEwS
         vwyy1XxN4/axAFLZMwQFkbZm0IQyFGsF/t+gGozItRzMnXBrFzSTnZyJlahv5yoCbtgf
         5QwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo+JeTrD25XWvIyU8BuWBMHAYF0mUH9A/g3RcZXhvw7c+jllIc0Y3Ml3YsG5JH3uEaUg4Okam7GmYpZNUjFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqVhqlZAw56p3Rgx0oxAZC39fuIUH1TKFD5J0ObOtzyv9WZ6Rl
	zHAWCEU/5C0Lc6tJOgJKp79yvh9K8CVC1dfNTtvMNqa6yLCpUk/nj+cP/60/x9EOT57p8G80ghN
	ltSTDSFlbDcJyNIhGb1HT80umcfR3S+RKkzw0
X-Gm-Gg: ASbGncuqgzNHF41re0TRcPSzRuFxqFIYVBab89OlX8LoM5+XuRB8QNn3J9SKI5ofm8b
	KUynEa+vYDZzr4twCK0WNLEp4421r7S5PLP5jZN9nLnM2LFnUuzcx50Ilgn7YdhHdFT+N8grgqm
	eylmumAeWmEQQ2smlxz2Ay43k4Mgb3thePLt4NPzG3umG6HkP7MGztKhst
X-Google-Smtp-Source: AGHT+IHNWciLgVoVnZAv4nk3kTX/+E/9b5Uc3nIkyNC1isb3S8SjpNtHEANv2m/DUCvVIsnA3lEcug7w6dxzD9bnRJU=
X-Received: by 2002:a5d:6487:0:b0:38f:3b9b:6f91 with SMTP id
 ffacd0b85a97d-3911f74009fmr2224287f8f.12.1741180995002; Wed, 05 Mar 2025
 05:23:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87bjuil15w.fsf@kernel.org> <t4HxdvR7WBX_861hiTXo72jqC9F9oRpIzgA_dD2yhcSuLISEkC-shMfSgllrFPpnkSZXGfRcc47keudMooNiIQ==@protonmail.internalid>
 <CAH5fLgg5MuUu=TX8mMsPf5RcLhMLHSU4Vct=h8rFX6Z7HjPxeA@mail.gmail.com>
 <87ikoqjg1n.fsf@kernel.org> <KpWTCfIlcLYFBpSvWPfALJ9VQn5a99_RAvxgMBc1aCrSalPB-qaW9IhXyaDG7HM1AcFPX5chj_Yr7IQp3F7UqA==@protonmail.internalid>
 <CAH5fLgh6ubawHh76wq7JPbcuBCWhm91m7Rc01MVsX-a3C6qaVA@mail.gmail.com>
 <87mse2hrd8.fsf@kernel.org> <Z8YMTiKS4T9wC4t_@boqun-archlinux>
 <ae8ac31f-c6ad-46ae-80dd-10ec081a16d1@ralfj.de> <88456D33-C5CA-4F4F-990E-8C5F2AF7EAF9@gmail.com>
 <hkhgihg4fjkg7zleqnumuj65dfvmxa5rzawkiafrf4kn5ss6nw@o7kc6xe2bmuj> <25e7e425-ae72-4370-ae95-958882a07df9@ralfj.de>
In-Reply-To: <25e7e425-ae72-4370-ae95-958882a07df9@ralfj.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Mar 2025 14:23:02 +0100
X-Gm-Features: AQ5f1JovG7pJEGKCcNI-5Crs7Wa6SH_Z8cSAq-fFPkgCJUsVI7n8yYOx2AOVgT0
Message-ID: <CAH5fLgidPHQzdUORNpNhtRFsKPU1T-0xdn5OSwYYZh3BgOVRQA@mail.gmail.com>
Subject: Re: Allow data races on some read/write operations
To: Ralf Jung <post@ralfj.de>
Cc: Boqun Feng <boqun.feng@gmail.com>, comex <comexk@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Benno Lossin <benno.lossin@proton.me>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, dakr@kernel.org, 
	robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, linux-kernel@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	iommu@lists.linux.dev, lkmm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 2:10=E2=80=AFPM Ralf Jung <post@ralfj.de> wrote:
>
> Hi,
>
> On 05.03.25 04:24, Boqun Feng wrote:
> > On Tue, Mar 04, 2025 at 12:18:28PM -0800, comex wrote:
> >>
> >>> On Mar 4, 2025, at 11:03=E2=80=AFAM, Ralf Jung <post@ralfj.de> wrote:
> >> However, these optimizations should rarely trigger misbehavior in
> >> practice, so I wouldn=E2=80=99t be surprised if Linux had some code th=
at
> >> expected memcpy to act volatile=E2=80=A6
> >>
> >
> > Also in this particular case we are discussing [1], it's a memcpy (from
> > or to) a DMA buffer, which means the device can also read or write the
> > memory, therefore the content of the memory may be altered outside the
> > program (the kernel), so we cannot use copy_nonoverlapping() I believe.
> >
> > [1]: https://lore.kernel.org/rust-for-linux/87bjuil15w.fsf@kernel.org/
>
> Is there actually a potential for races (with reads by hardware, not othe=
r
> threads) on the memcpy'd memory? Or is this the pattern where you copy so=
me data
> somewhere and then set a flag in an MMIO register to indicate that the da=
ta is
> ready and the device can start reading it? In the latter case, the actual=
 data
> copy does not race with anything, so it can be a regular non-atomic non-v=
olatile
> memcpy. The flag write *should* be a release write, and release volatile =
writes
> do not exist, so that is a problem, but it's a separate problem from vola=
tile
> memcpy. One can use a release fence followed by a relaxed write instead.
> Volatile writes do not currently act like relaxed writes, but you need th=
at
> anyway for WRITE_ONCE to make sense so it seems fine to rely on that here=
 as well.
>
> Rust should have atomic volatile accesses, and various ideas have been pr=
oposed
> over the years, but sadly nobody has shown up to try and push this throug=
h.
>
> If the memcpy itself can indeed race, you need an atomic volatile memcpy =
--
> which neither C nor Rust have, though there are proposals for atomic memc=
py (and
> arguably, there should be a way to interact with a device using non-volat=
ile
> atomics... but anyway in the LKMM, atomics are modeled with volatile, so =
things
> are even more entangled than usual ;).

For some kinds of hardware, we might not want to trust the hardware.
I.e., there is no race under normal operation, but the hardware could
have a bug or be malicious and we might not want that to result in UB.
This is pretty similar to syscalls that take a pointer into userspace
memory and read it - userspace shouldn't modify that memory during the
syscall, but it can and if it does, that should be well-defined.
(Though in the case of userspace, the copy happens in asm since it
also needs to deal with virtual memory and so on.)

Another thing is that it can be pretty inconvenient if writing to the
DMA memory has to take &mut self. We might need to write to disjoint
regions in parallel, but ownership-wise it behaves like a big Vec<u8>.
Being able to have a &self method for writing is just a lot more
convenient API-wise.

Alice
