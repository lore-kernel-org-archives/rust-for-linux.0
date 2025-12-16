Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256AB2BFC8F
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 23:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765927990; cv=pass; b=A+QKbwuSuxuzmIitbJRx+WcdEtkv3lEOi+iDR6XV+1u1SkU78Z4ZbltqNhMXqrrCvu6r+p6w3qWVzbFjiBubO9pZQeSytE91dIhUKEi4Cw6NaLBV3NpjXDJsWkffCG72M7Hv0b47+UVnvo+WS/1/Nj8lc2zno1plV9K2pd157yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765927990; c=relaxed/simple;
	bh=l4FmBkTjseb0UhsC1W039Xu61+Vqd5hIEEUJMA40am4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMcymevko7N4DcGTz8XOZ1OKSYbOMDrlzKp5Dv64nIQAhsr8BP3I1ZlbSUygO4UBxbdH/v81iriN//0vxy35OrXJPSDKWUgoQZYtROXDkRg2n6Os6a5cVAj0ZbustINBjsKWACgTDghwwiFfnhC9cGPisy5K+eBCY2dwoC5fcMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oMGhAW5g; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMGhAW5g"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso2150a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 15:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765927985; cv=none;
        d=google.com; s=arc-20240605;
        b=fCzZEAT8S7ugMTCDJq3PztLsNtTxFIa/95sBV6fMWo0aWbWUGm8XRE1Ve/mwaZWuUq
         /hP2y7Eapn0E/OtwtjUFgbZ9VWoSMC/p8zOZ6lh+NF7NfmgagaUzUoiyOrTKitNRioJF
         5Kb4UmyQd2hiRFjYNZTq65KF2UePTmwL/H/FVxCaKTv/g6d8PbFfUiJ2VCQ1Mj/XCpbM
         cQVFGN7aSdQ7fIixRNf4V1il7DAWPQ25luq+9ZcWHRzLOCe4cThzlkIbifSzPs5oZAsT
         HbVANG0JfIVJS3RxS+AW46ITle36+FjB6KGpaKUCgovrk69+55jiMEIcpEbHBORYX4a4
         1x7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l4FmBkTjseb0UhsC1W039Xu61+Vqd5hIEEUJMA40am4=;
        fh=eHycNTCaJjCB0fLjf7MrnG/bHmuplYE9Oo2PMcEN2zk=;
        b=X9dyfoKfy5fgjFPDwUCBonb4+taPshDGZmWANbN7RBRCNLnIRLGVFMklmQlcgEzkEu
         AQMSwxQQSmKEt0fpLloo2wGBWyWPQb2UfKWzVkAxgq8oCDZJHzleE9uXCOx+qRAzsc96
         sEFzOvsoG92/48h5Ixz8hp5+PhyI8P8wEqnAjXWoa0Wf/faz3B6OTZZZg9ZlGjnFOFA7
         7qX1SZ2j9RnJl9mVm19PEePp0DozMnSxSisjc7kAVZK2Go0Q6PaEDlOLYovYpBEF04Vf
         L1VJOdD2RL8vTdN6ygefYhVt4qMLEWmTdaEUsXmfNcUA0ICyU8pqNXpN1U4XwQSBmVgr
         VnZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765927985; x=1766532785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4FmBkTjseb0UhsC1W039Xu61+Vqd5hIEEUJMA40am4=;
        b=oMGhAW5gsjwmJ4JWiE2j5CiIgk7sei12OeI6y785V2FsNah5S5qcuI/Vwv0mCgdBCn
         G9kakylT74qC4WZFusujBr55Ahe2C5TvZwH+1qjslPJSebufuZzFPzpY7L6gJKujbuMX
         eMDIri7/T52l62SvXXRkoytFWD9Ty+L+zLy4Ky7FMBpD23en0RtLX1qL8JuskBQBZnJN
         27g7X6mP9uyd964MsMluaOJVwcwpYEs2nYeKCMMNInKQyLmj/JwWot5+RMTKBroNIvuK
         WxDWpcTHfumBTzYlbPMISJsLxV3Gl5WCTo6MSI6RUhR7ZzBXbgt6ck40FRMN2TG2CCJ/
         UvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765927985; x=1766532785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l4FmBkTjseb0UhsC1W039Xu61+Vqd5hIEEUJMA40am4=;
        b=qW7cI8su0elAc/i/UYiE56pzQHKgG1kltsrMj6QmETzbTjzJbCI/IX154wAEO5CCcB
         PFXaZ9o0GQGEKcjz59MwKjwydFL7YKnBtIuQ/PY5o64aqVMK9drduEYnI8HSkjVC0MTp
         SzhawkEHmZfNevEJ6KrynF2nHGq6t61y2OkhoEe9Uuq6T5OMsov8WaeOh8zTITP08BQe
         J4YWmxAxRYSyKyqU6B3ajWY5f1eG5ISxtmdMZgc2HurheAeDhd+gGP2w6uKhMT/Ic7Ig
         9hmxCNlyRSjKp+KNzUWne+GCe+yfsVQc3aGe2fDFp3yyxki3tMFPNI9/EI0wZQrwhf95
         StRg==
X-Forwarded-Encrypted: i=1; AJvYcCW1liiGeEJr8TaTE/0IZhMVmtitfEEOieUQ7f2aePaV98E/oOLiMPnAEDUSv6VyrEt/e0wAPdRX0DsQSZ5nug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwBQUtkBorGu1pTPqiFPmpTstETkD9rxuc9SSgSRksEWLM2Pi
	Zo6gX7Nl55MxVulQYWJyzInEv5fXAZjQujQon00yHeljw5LqDnuD9rB42K0VBVfPKmQ0V4P81Vo
	cnfwgaifZ7qDZEfLNGLVMOqakXZbC8MWEgU7b/nOv
X-Gm-Gg: AY/fxX7aKEUu5Mt0FrNivFTdlhLrOP/ZLH9GHXnESzbJV47Daq0Co+aXiuTsIfFmxXK
	tVY/iRFWZzf3kO6AuHLGAwNsQfnbeIku0c859oMyeqwojmX9gvvRVjYCm1yJP1N7EhbsGmlWrVF
	cRvFp5UkRdkvqxNDt1yUU2akF/2nxuRgvpsJ1XZz7L+sD0v17Xw6sRFFzAPRckECvTj5lUbZuyD
	w0aqi0hlvAujqSrXXgXCCFzUZ48vb/LAgEmjljccDK/34C3DqrbFDE1xPoYhgynfe1Wuc6PpdKK
	CINj/HqQ8Xd40+vvYKRbIWkG2w==
X-Google-Smtp-Source: AGHT+IFR4o7x2LqopTiGNjBR35lfZHSYLuViSW1x8WU+n1hiwmwiJpcXDqVeuIb6EPvslXhd37lYRpWUlrKA8ulumoA=
X-Received: by 2002:a05:6402:3d9:b0:640:8f9c:af3a with SMTP id
 4fb4d7f45d1cf-64b400a03e0mr19745a12.6.1765927985196; Tue, 16 Dec 2025
 15:33:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
 <CAGSQo0254uMNb52aJACpuEr6O1GiUng9nNut1eecM3AFaSy_8w@mail.gmail.com>
 <ekngmao2rw4mktubhpodudnkfvx5of74uvlswr7csnyxcwlmo5@cb6jfgiyg4vc>
 <CAGSQo03+pVhjyfSLGHHcr=w1-3=C5AcEKJf-GbcEvfJ6NTid7g@mail.gmail.com> <nqao3h3a45aw74bpvleqpx4iqmsjcxdjgvegyafnhvk2vtwwz4@n37vq7lsgzrr>
In-Reply-To: <nqao3h3a45aw74bpvleqpx4iqmsjcxdjgvegyafnhvk2vtwwz4@n37vq7lsgzrr>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 15:32:53 -0800
X-Gm-Features: AQt7F2qqAIXNpAebENyw2gsfQTrEqJPBO4KpO2y45ePkgQdpZYydiiw3_Bj-4cA
Message-ID: <CAGSQo011pq+YX=AF0TczzzTw0JL2azvVtijCDDH8HJzzxFYOPA@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 3:05=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Tue, Dec 16, 2025 at 02:13:08PM -0800, Matthew Maurer wrote:
> > On Tue, Dec 16, 2025 at 1:53=E2=80=AFPM Bjorn Andersson <andersson@kern=
el.org> wrote:
> > >
> > > On Tue, Dec 16, 2025 at 12:53:28PM -0800, Matthew Maurer wrote:
> > > > On Tue, Dec 16, 2025 at 12:49=E2=80=AFPM Bjorn Andersson <andersson=
@kernel.org> wrote:
> > > > >
> > > > > On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > > > > > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based=
 DebugFS
> > > > > > bindings.
> > > > >
> > > > > Okay, but why?
> > > > >
> > > > > https://docs.kernel.org/process/submitting-patches.html#describe-=
your-changes
> > > > >
> > > > > [..]
> > > >
> > > > I'll move more of the text from the cover letter into the commit
> > > > message, but the short version is that it's intended to be a low-ri=
sk
> > > > driver to pilot vendor drivers in Android.
> > > >
> > >
> > > The answers I'm looking for isn't in your cover letter either. I want=
 to
> > > know what benefits Rust provides in this particular case.
> > >
> >
> > Rust likely does not provide any significant benefits for the socinfo
> > driver itself, aside from having caught the slight disconnect
> > (mentioned on the other thread) where it should probably be an
> > auxiliary device because it assumes that the `qcom-smem` device will
> > remain active as long as it does.
> >
>
> Yes, this isn't unique to Rust. The smem API would benefit from an
> overhaul in general... At the time I wrote it, you couldn't really boot
> the system without SMEM, so I added the suppress_bind_attrs, these days
> you can exercise a fair amount of use cases without it.
>
> > The primary intention of converting this driver is to be a low risk
> > trial for GKI's ABI stability for vendor modules and a first Rust
> > vendor module (we have platform modules already for binder and ashmem)
> > on Android. This was discussed informally with Trilok (a long time
> > ago) to act as an example for other vendor drivers and encourage usage
> > of Rust for new drivers or those where memory safety has been a
> > problem in the past, but nothing was ever formally committed to.
>
> But if the test bed for GKI ABI stability is the goal, don't you need
> something with a more interesting interface?

We've been watching things manually for the 6.12 release and manually
backtested on the 6.6 release (by looking at our ABI dumps) and
believe that it works. The only way we can really progress further is
by deploying a vendor driver in the field. If we pick something more
interesting, there was concern around it being caught up on concerns
related to the specific driver. The hope was that this driver would
simultaneously be real enough to count as a driver in the eyes of
other vendors watching for someone to take the lead, and simple enough
to be low risk enough to be possible.

We do have more interesting drivers in process, e.g. the tyr graphics
driver, but those are longer term efforts.

>
> Also, how would this manifest itself in the upstream kernel? Do you have
> a test bed where you build GKI + vendor "kernel" out of the upstream
> kernel tree today?

In Android, kernel modules are split into two categories - "GKI
modules", which get shipped with the primary kernel to every system,
and vendor modules, which are shipped and loaded by particular
devices. Neither current builtin modules [1] nor current GKI modules
[2] contain the qcom socinfo, so it is a vendor module. This
categorization is not an "in-tree" / "out of tree" categorization, but
a "every Android device" / "some Android devices" one.

[1] https://ci.android.com/builds/submitted/14027866/kernel_aarch64/latest/=
modules.builtin
[2] https://android.googlesource.com/kernel/common/+/refs/heads/android16-6=
.12/modules.bzl
>
> > Trying to apply Rust to more significant existing modules (where it
> > would provide a greater benefit) raises concern about whether they
> > will operate identically. Socinfo in particular can be more thoroughly
> > tested for equivalency, as aside from the runtime DSP information
> > modification that was mentioned in this discussion, the output of the
> > socinfo driver is static and can just be checked. This means that a
> > socinfo driver swap will essentially have the language change be the
> > *only* significant thing about the change, keeping the risk to a
> > minimum.
> >
> > Part of the reason for the RFC prefix on this patch is to solicit your
> > feedback on whether you are open to this. If you have somewhere else
> > you'd prefer we try this, I'd be open to that as well.
> >
>
> Rust is a new dependency and it's a foreign language to the vast
> majority of the contributors in the upstream Qualcomm community.
>
> So, IMHO sufficient value needs to come with such rewrite, and this
> value needs to be properly documented in the git history. Rewriting
> things for the sake of rewriting things, or the facilitate a downstream
> experiment, is hard for me to force onto our community.

Since you brought it up, I took a brief look and found CVE-2024-58007
[3] , which would have been prevented through use of Rust, as the
access would have been bounds-checked. I understand that such
vulnerabilities in socinfo.c are likely to be uncommon, but even for a
driver this simple memory safety issues do happen, and have even
happened recently.

[3]: https://nvd.nist.gov/vuln/detail/CVE-2024-58007
>
> Regards,
> Bjorn
>
> > > > >
> > > > > > ---
> > > > > > base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
> > > > > > change-id: 20251029-qcom-socinfo-d8387c7fdb1c
> > > > > > prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:v1
> > > > > > prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740e0c5
> > > > > > prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac87f6c
> > > > > > prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v1
> > > > > > prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684d8e6
> > > > > > prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
> > > > > > prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
> > > > > > prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c866e
> > > > > > prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bbe74f
> > > > >
> > > > > So, it doesn't work on a clean v6.19-rc1 tree?
> > > >
> > > > Correct. Those other patchsets are patchsets I'm landing which add
> > > > bindings used in this one.
> > > >
> > >
> > > Okay, please make that explicit when submitting patches, so that the
> > > maintainers know that your patch(es) can't be merged.
> >
> > I thought that was what I had done by using the combination of "RFC"
> > and putting the prerequisite change IDs from b4, but I will include a
> > statement to that effect in my cover letter in the future.
> >
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > >
> > > > > Regards,
> > > > > Bjorn
> > > > >
> > > > > >
> > > > > > Best regards,
> > > > > > --
> > > > > > Matthew Maurer <mmaurer@google.com>
> > > > > >
