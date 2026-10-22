Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643642;
	b=fu9oiCdtqn4lbmlFVCCZiX/gdcDGTVEZ+1TTq025AYbyVSvKMrwHt6d024cK4B/yyvWU
	 YOjvrWg6E0Bwhdf1VIrx1IRqxdGRomQG4gJzed1kcmwewy3R/igMni2x8VmSsx24cOXCY
	 7Bpg4Eh+VScs9glRo3DzROzSq5IHqeEyHIPHJkb4j5+FqWFyxwxW7cWoPT/cM9gFLJgTa
	 nck/A2bVqyIoXwjjGLoeiimlsBPzxu4M96YM1Cf4rGzpkaB784QgIDmUDjN6d0d2M6M+l
	 s9UYskZ+/GTX89DhgS6wXhaZfKMp1aS2/nvwd0PKXyOden70SegAu7p9OuKVMOPgx3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FX6Mu1YeIXFmXkKYuzzN3WwkU16Ko5e6ASCr8EcCtu0=;
	b=szlpp4srpMzss1WhrLf2o7DxyQvEs4crfJbGoVZpGExEt2qGwMG42BIMl9omExC+tII7
	 JsToSlyY4ddrj6HTFGKNaFExqFONa4R9XscEjG+ohYwXBdTB9eMEmDb60hGratTqbHE39
	 Wlz/K7reBHCFN0FXO8xJzKyhxR4q2WDxxjqTRygVTg08av4pYPmg704diE7MRdzDelIcY
	 FupuYmTr9a+0NztqhBN9mTBWiwwv85IswpIKEnLORzv1LD29PQKcRVfaJe46n7w19PJW7
	 bwOr26nbcAMintrBXKC5Y/G2r/antbBHm/titjklIc4FkESYdjL5U1jW7O0c/ntaacg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IJa4IgYw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E704606A31D
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 04:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E704606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IJa4IgYw
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so2510691a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 21:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792643641; cv=none;
        d=google.com; s=arc-20260327;
        b=BYzOmhkxa/FGD7PiaRYDBjyMJaPHIN1MECYRArY6a9On3Va4YUCm43cjECSaa1zjdI
         O8ED0bUR7grTW7yNRvVfwWndmV8HdkS7+gS5bLnHLuaX055Fc6wR4hqc6he8CqDFCVQg
         s8Ac1GwooEK6XD1TepXYGXJgop3VvbFK6IHNfDYKHWblP3PPUkU3uC7xcKV7jvVgFUvn
         Zw6fOXZJMIgDXa3YkvhADiL8KtBOggrCkJU068j9dCOp97yWhcNScmgXo19s+27d+/t4
         Sh5i/pI4hcY4uKz59owyhQmLK5RgBoUHSyk5mOtFO3RNVzpsABh8o5Xyh0eJFyyB0J53
         lSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FX6Mu1YeIXFmXkKYuzzN3WwkU16Ko5e6ASCr8EcCtu0=;
        fh=e1TVWUXPrs33ndoVEeqQF7HV18WivTNhaGlehkIrufg=;
        b=WPlffne+la9hDvdMvoPNl3ukn1Aq06ifvGD5aNBQevjM+o9QNkZWHVtMAF+fKCFXXf
         IWxtwjiz+r5bZU1s8t9S+rdvx0pDaR6qFCro9FYUxupva1H3SbenNYOs84jsEDrMkdFI
         AxbEm4Hepbr8j+wKlAs3dJf+tDD0opz2biA7MLDqlKhnWBfylAnogUiMVEZ3OS6NDnnb
         2lg9Sjmbc5gb+zRXzTLhMn0b2Ie4igNRxlMTFQqvCQFLADmbSx3sz3GMfhcoHIBFCMY/
         xuJSIUlyIccYYEzgoheWi7pt5eeEn4RMyITJYnZUauDHniOME0/u5hkGArUQT0sbgrD6
         H0kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792643640; x=1793248440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FX6Mu1YeIXFmXkKYuzzN3WwkU16Ko5e6ASCr8EcCtu0=;
        b=IJa4IgYwItYvijFw2H8a7jwzDvE0e18S5rbG4YRG6M7D8vlHwdIMtYPC88G+wIBAJX
         Ljxs3KOlAjgZ71Qnb82PG9Tk8u5NggrPzLuKKSCuQlmFAbN9zqm2rgz7gPi4h3YSqsCg
         XTm8fbMKIHDFgsiQAV5SMoOc6EAKEYh0IHExSwdqALm8yChkAfb854OHX/rgVRaG7oBJ
         75tW7A70QBkIzLgO5TBKPCoRRq49X9oGTNsryvwFQJMIz6UqecYZfqfzYZ6kQ8x+9kch
         xcZ4j6fqDYvyvC0huvTvMehdPiU52hvzjp4IA7nYjTsLoqIjdGmvorZ9YiryEDMSr/0E
         lA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792643640; x=1793248440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FX6Mu1YeIXFmXkKYuzzN3WwkU16Ko5e6ASCr8EcCtu0=;
        b=1fwqv2pj27uaQ/22idjBTR7nKojdd6uojvabDDu/DhKVryAzAMXC+X13h0pvHYxeqe
         eAgBbHFjkZ9VBMjYtqxvqhpI2CEh9EVJNdRP6x8dlJQrL8KH8KWvHZcpeuSlsR+UCZDi
         Iy+31R56pekJ4//pxHE5SHiAy+Bw4ueoZT8ylHEEgBlb6tG4sfQoO8+FJhid4xrrZmvu
         KE5Z00VXqrF6kSZt9sL8Gc7nVCYGhNbwSZeesCcwu31L2VcLmdR8RVNWSMoZF4JgC5dQ
         yEwlK5Au43ymd731O7yqPHSbv+2ZwboFNiNolHnkcYrEfrNdAbJ3wRdbxO40C6kjQesl
         yCeA==
X-Forwarded-Encrypted: i=1; AKwUvBzSXag3Ib+fquSXWdaP8S7ec7fRKkPxvXAIaeDGZL3r147jIom6crVJ9OlG5yp27y6m0Q+WO6jJUslA7PosGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJp6e1aRTDfL7GFNCd5O+4EY0j5zeLQ0oo/Xy8ryo3yPeCMBZVQ
	d1DoxS7wskhLX2uuIPltWLgsAnvC3qc/WNlhEGZF0+p9oNKQbl1c8t2vObl/ZqVyt0k2u+jl6Tb
	QGEml7rVEqNhKe9F3XbkeBjTcjonn6qbzVQ==
X-Gm-Gg: AYBFou3UD2w4PLA/XmxkZqXYuLXLT0J+ORSnQP/4QOTVYQb/y799TGWCreRZ2AQGe2V
	UkcMaDAQt9etl+k4iUCflPpySZymlJSHd03Zc7v+LAoeHQLYLotoQPLRETODHUChP7S6cXZlEP3
	6XcK71IgFYttXGB4H34FZIzuLAUkFmlH7UyN0jVR5rWWZElUWzR1TSQuiYbxLDgZcCa8QsDO1al
	SMWmucPwOdTmGBcLj2rxQkFIYdx5tq/BTk+n6dk3hMIIf3CfuCSvioR63a2mtw0yYJufwLpr+0i
	5vq7fh7jTHD9vIP5vDxNsZwmiblL209uvvmhynYDJtMX1CLyATZqP5En2sAM+W5H4p64WWoEtDE
	OnNPtET4UF6y1wqwe8xKL8/rk/M7L+kGBdxf/8lRw29HznkleGhndjL/Ys2ioFdYL8OU=
X-Received: by 2002:a05:6402:28c8:b0:6ac:bd53:d29a with SMTP id
 4fb4d7f45d1cf-6b408dcd1femr2989972a12.3.1792643640365; Wed, 21 Oct 2026
 21:34:00 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <as_r8n7p_wdbChuQ@google.com> <CAKmqyKOkmwompJqaP2k-oJicmXmqHY4E0wuLcrvkHLx+oauQ2Q@mail.gmail.com>
 <DM596TT7E841.1U05OKY9N6I6C@nvidia.com>
In-Reply-To: <DM596TT7E841.1U05OKY9N6I6C@nvidia.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Oct 2026 14:33:34 +1000
X-Gm-Features: AclHuK9U67i3MHCSs1fpGty_QgfHHhn6FdMHJ0fAOkjnn4XpsrsbQBC3WfRL_pw
Message-ID: <CAKmqyKMbs_N6C8MAKGUU11DW1y5nJRWPqnUcrVZoyi0SDjsv3g@mail.gmail.com>
Subject: Re: [PATCH v4 00/22] lib: Rust implementation of SPDM
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, lukas@wunner.de, linux-cxl@vger.kernel.org, 
	akpm@linux-foundation.org, Jonathan.Cameron@huawei.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jic23@kernel.org, bhelgaas@google.com, alistair@alistair23.me, 
	djbw@kernel.org, linux-pci@vger.kernel.org, wilfred.mallawa@wdc.com, 
	a.hindborg@kernel.org, gregkh@linuxfoundation.org, alex.gaynor@gmail.com, 
	benno.lossin@proton.me, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, gary@garyguo.net, ojeda@kernel.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:02=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Thu Oct 15, 2026 at 2:23 PM JST, Alistair Francis wrote:
> > On Thu, Oct 15, 2026 at 6:54=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> >>
> >> On Mon, Sep 28, 2026 at 11:11:01AM +1000, alistair23@gmail.com wrote:
> >> > From: Alistair Francis <alistair.francis@wdc.com>
> >> >
> >> > Security Protocols and Data Models (SPDM) [1] is used for authentica=
tion,
> >> > attestation and key exchange. SPDM is generally used over a range of
> >> > transports, such as PCIe, MCTP/SMBus/I3C, ATA, SCSI, NVMe or TCP.
> >> >
> >> > From the kernels perspective SPDM is used to authenticate and attest=
 devices.
> >> > In this threat model a device is considered untrusted until it can b=
e verified
> >> > by the kernel and userspace using SPDM. As such SPDM data is untrust=
ed data
> >> > that can be mallicious.
> >> >
> >> > The SPDM specification is also complex, with the 1.2.1 spec being al=
most 200
> >> > pages and the 1.3.0 spec being almost 250 pages long.
> >> >
> >> > As such we have the kernel parsing untrusted responses from a comple=
x
> >> > specification, which sounds like a possible exploit vector. This is =
the type
> >> > of place where Rust excels!
> >> >
> >> > This series implements a SPDM requester in Rust.
> >>
> >> So I looked a bit at this, and here are some comments. I will not repe=
at
> >> what Alexandre has already said.
> >>
> >> First, I'd like to say that it's good to see that all wire-format
> >> parsing in lib/rspdm/validator.rs is written in completely safe Rust.
> >> That's exactly what we want to see for parsing in Rust. We want the co=
de
> >> to have basically no unsafe code whatsoever so that we really get to
> >> rely on the bullet-proof guarantees about bugs being caught at compile
> >> time, or at least at runtime.
> >>
> >> Unfortunately it looks like the same cannot be said for the state
> >> machine in lib/rspdm/state.rs, which has way too much unsafe code in i=
ts
> >> interaction with the rest of the kernel. There needs to be more
> >> intermediate Rust abstractions here. This file should not have *any*
> >> unsafe code, except maybe 1-2 blocks for using the C transport and
> >> validate function pointers.
> >
> > Yeah, it's the crypto functions. There are currently no bindings, so
> > it's just directly calling the C functions.
> >
> > Without the crypto functions it's just a single unsafe call to
> > `transport_function()` in `state.rs` and a few in `lib.rs` to handl
> > the C <-> FFI boundy.
> >
> > I was trying to avoid adding crypto and X.509 bindings in this series,
> > as that's a few more subsystems this ends up touching. We need to add
> > PQC as well, so crypto bindings are next on the todo list once this is
> > merged.
> >
> > Is this going to stall on adding crypto bindings?
>
> So without going all the way to fully-fledged crypto bindings, you will
> spare yourself and your reviewers quite a bit of pain if you at least
> implement a safe and lightweight crypto wrapper that is local to SPDM
> and could eventually grow into official crypto bindings as a future
> effort. As it is the code is very hard to review: for instance
> `crypto_free_shash` is always called after `free_desc`, and looks like
> it could/should be part of it, but that's hard to assess as the crypto
> code is mixed with the rest and called here and there. I just cannot
> tell whether all these unsafe blocks are safe of not, which is a problem
> since the goal of writing this in Rust is to prevent exploits.
>
> A self-contained crypto module exposing a safe interface would remove
> that burden, reduce the number of `unsafe` blocks, and make the series
> easier to review globally while not necessarily resulting in more code.
> You just need to store the relevant pointers into a new data structure,
> enforce the required invariants at construction time, and codify the
> actions that SPDM is already doing in the form of methods.

Oh! That is a great idea. I have added that locally and it's pretty
nice. I'll tidy it up a bit more and then send a v5

Alistair
