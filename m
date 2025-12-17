Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124D1D88B4
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 00:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765931273; cv=pass; b=buPSg1t+vMDtS06DauIsKWkCWbf4z8ozMNc8s+Gowvzbc5obcspRGsSw4p8O96v6McRo18dh2cLmRZR4Ij/HikWZX1CxtBezA2VKPvQm6Za9N/L1Ay37XO7MFi77Q2r6ZeeI80m0IH2T6x/WMpkEWtcp1mbQhsKhdgsaOEor79A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765931273; c=relaxed/simple;
	bh=UWbreq6ryS4pIJrbgazFj3mGI+9WTTftCWNFXCOf5tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtD22Q8GdjNSgn07gx4n1pJE+MbK+kVBWT2QFXKPgaLaKGpT+G+kLC0VOJi6D4bXcEoih/W6U6hSRHMJPX/hFMGu3Gj0qEcQXsUYSzup/TtuSZ0QgScTNaCcL5V0/rGsysAoKtk3bgWYIXv7eWBklFNQF5k2Fp2/k/nv2DempEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uK7Gu0RO; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uK7Gu0RO"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64969e4c588so3025a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 16:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765931270; cv=none;
        d=google.com; s=arc-20240605;
        b=GKvjbiRZAh4nlcqJR0CwWrR9BVlnDsXIhGGZ8TEGoEu+iESbEnazBE/V+/ZPQu9Ttn
         E/VeMwDO/LtRbp/tWMAL/W/QoEiATozRG1t5T6zzkzd+IRi8g3v9rq6TP37ND2aUXlUB
         vzzkFeMUh7fO24vFyxBM0xBiweHzOIx0Jhi2pFu6uO9XlsGyoRYdIajdsc6fHsw9iO3v
         KQeZTQy5vJqu3wAIrKsNlg6HFRLAIBSdme1mUvGodMUcoEklN9PeTqLjlu7IOTSezS51
         Gm3ZxplTnPfJd+T1SiAeWCNPqd6AaJ0YGkrChy1NzibVGrar5/EJ6kifrIixctHWxuer
         YTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UWbreq6ryS4pIJrbgazFj3mGI+9WTTftCWNFXCOf5tw=;
        fh=5FXwkA56/Iyuw6KA7SlIMLFwt+1A+exPUD2gmF1/qts=;
        b=IEYOHtVZYyV3NjArDQjLN8TdPVw1MxORUZlM+1VrJG01Sn/r/Iy3kd5htXmqRMoPuI
         b8ra+7hc2zyKfDHm9Bgx+zbCFpBnWRxDzjDG92xQb+FJ0ylsclxi1N8m9EZegbmQCMhr
         BOMyznd93gxpL30Oc/ZhRqBRU0AK0Q+PVyuu22DBiAY+7lPdK2NhvNvl5suKpaG9NWMG
         YY0dJ8L2X/nTgxP9He+EDSa9pUOF71c1fqjK48soB6yiP3cleDak4sYNHVTi0SpV7eSm
         UKdR+SwZmOOkf+8qwW7WVnIF7+D2o8pKnm4EHy2W7MjELXlr8bKBKLtFZt5GrGll8nnu
         XcLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765931270; x=1766536070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWbreq6ryS4pIJrbgazFj3mGI+9WTTftCWNFXCOf5tw=;
        b=uK7Gu0ROadYvwOv6jl+YVVzrDII8/VwKcCijSKkI1ab9lCQ+rCwEB2VD2TUkDoERA1
         x1eD7WcjO8r56hq7WeTOMfbry52pVT3LBvgq/0hBMBrNmhLkfp5nMMY9RtR6gh5vt8OZ
         aOi6Vp12VS2Nkz2uZbz852KOW1zAZcdeZd5iUKFwhFnnoIcG1xGOyu1gQS9ommdY06M0
         XwRpsjrwYR+sR6WG6TolU7mjKjNTTseu9Z81B2Xm14w207Iiku90gLIQOrHVsb+pyktN
         fqyD/26CGUlBAu/2PVeMlu28Cfqu+oNIKTj88BC2A/IsBgnOKvzEkjFwUPnC23LSpOur
         xGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765931270; x=1766536070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UWbreq6ryS4pIJrbgazFj3mGI+9WTTftCWNFXCOf5tw=;
        b=EVbm8Pa8LF066E2c6e/5+kUsLR9DXrKMJ8NPImB1RfJUgZuxqWFcWd2UVNn0Od7OTe
         YTzGbPqeit0RBL7ELawRi9CLwfKR3eBjJvikPhpt6ZrKeC63e0+s/Rc1Ui3rvynRVfll
         JuSIuz6sqgdgBOl/ch5752zN/ZifzaWmvshdOi6h5aWVMRmItD4ZmeExUBEbv6sbBYc0
         h0d62Fq4ajUNe03EBhsP+jTTsxptOXoCNndoKLR0vZaBniG73bbNbfdzJH3wLtfh8xVu
         FKyYKbI5EixxEI7/zNRjrTgJQA1tmUXuLmxpdhQzBtDyX6iOFpIVezhWRD6tfIuKy+4u
         DhHA==
X-Forwarded-Encrypted: i=1; AJvYcCUVwJI9xj7lfgiBY2/0R8zmT5pVMmi2QyNBrWD3GqDAiqua0cfGXmjysqNJinH2sU1/RAN/F2NQybhMt3CSjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPy4VHE4ciFI6E/dckFIE/hJ2KQoIl5fvDSLxu5eUjVGysfnZd
	rny2BT1+Otqiiy9uWsicELqmuEyr4OmKqi/sz3sq18JJU67zuBghaNoeyN9dLbO/d0doEvabY+n
	5nJk4LmuyBZwEi9Yg8y8DfZgy50zLyyTOXUBV9E96
X-Gm-Gg: AY/fxX4DdjUjxN46zSonpQB2s2MQjG2HAQqKrEhd1h+azo6VCEwcBd5HJKRmDDwtf5q
	2X+ItTbkFx4CWPhgLzvx7rKLhBu4j7HQgZiXG52L19l6wSw0vIb1RRKwU+aBIVOWyyzJmMXbPSg
	nO6MYfG8fr/sOPmdv/91WkzsvvYx/s4kfvzqJ7so+dfBoEfE92FenhTvx1ephw/D5pb9TkmLtpI
	Puxn4I5dji1eLXnuTvYBxPEeJql74+ukGF72cl8tAUXvvVPYVbgsDETBxzGoFnFwjNz3ystKRPg
	aojN/tIwB2EtWlMzrBbLV53kNWgyHJ5okYdv
X-Google-Smtp-Source: AGHT+IHR+LHebFU56Vh0ewbkBHBs98lpY5TdGEUWGWwD88pS8IKza4UQ24LAEc4GTmoqsRTBNsBqra0V79NsZZ03kHA=
X-Received: by 2002:a05:6402:22a4:b0:63e:447d:6aee with SMTP id
 4fb4d7f45d1cf-64b3fe58581mr22303a12.0.1765931269336; Tue, 16 Dec 2025
 16:27:49 -0800 (PST)
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
 <CAGSQo03+pVhjyfSLGHHcr=w1-3=C5AcEKJf-GbcEvfJ6NTid7g@mail.gmail.com>
 <nqao3h3a45aw74bpvleqpx4iqmsjcxdjgvegyafnhvk2vtwwz4@n37vq7lsgzrr>
 <CAGSQo011pq+YX=AF0TczzzTw0JL2azvVtijCDDH8HJzzxFYOPA@mail.gmail.com> <msbgnz45owgcnx2q5e6kamhsfmslyed6kqbrprrttkoeruradr@nd3rbstjxds5>
In-Reply-To: <msbgnz45owgcnx2q5e6kamhsfmslyed6kqbrprrttkoeruradr@nd3rbstjxds5>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 16:27:38 -0800
X-Gm-Features: AQt7F2p46hBnLvnbawsOmfvbPUEyd_SY8g1QQHvYSUxss-OwUl8fwSkWXbc7jD0
Message-ID: <CAGSQo01zNAU6-yvGxm5_tk=39c+VR8jbeDRTH8P=6b+tFd15Uw@mail.gmail.com>
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

On Tue, Dec 16, 2025 at 4:15=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Tue, Dec 16, 2025 at 03:32:53PM -0800, Matthew Maurer wrote:
> > On Tue, Dec 16, 2025 at 3:05=E2=80=AFPM Bjorn Andersson <andersson@kern=
el.org> wrote:
> > >
> > > On Tue, Dec 16, 2025 at 02:13:08PM -0800, Matthew Maurer wrote:
> > > > On Tue, Dec 16, 2025 at 1:53=E2=80=AFPM Bjorn Andersson <andersson@=
kernel.org> wrote:
> > > > >
> > > > > On Tue, Dec 16, 2025 at 12:53:28PM -0800, Matthew Maurer wrote:
> > > > > > On Tue, Dec 16, 2025 at 12:49=E2=80=AFPM Bjorn Andersson <ander=
sson@kernel.org> wrote:
> > > > > > >
> > > > > > > On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrot=
e:
> > > > > > > > Re-implements qcom-socinfo driver in Rust, using `Scoped`-b=
ased DebugFS
> > > > > > > > bindings.
> > > > > > >
> > > > > > > Okay, but why?
> > > > > > >
> > > > > > > https://docs.kernel.org/process/submitting-patches.html#descr=
ibe-your-changes
> > > > > > >
> > > > > > > [..]
> > > > > >
> > > > > > I'll move more of the text from the cover letter into the commi=
t
> > > > > > message, but the short version is that it's intended to be a lo=
w-risk
> > > > > > driver to pilot vendor drivers in Android.
> > > > > >
> > > > >
> > > > > The answers I'm looking for isn't in your cover letter either. I =
want to
> > > > > know what benefits Rust provides in this particular case.
> > > > >
> > > >
> > > > Rust likely does not provide any significant benefits for the socin=
fo
> > > > driver itself, aside from having caught the slight disconnect
> > > > (mentioned on the other thread) where it should probably be an
> > > > auxiliary device because it assumes that the `qcom-smem` device wil=
l
> > > > remain active as long as it does.
> > > >
> > >
> > > Yes, this isn't unique to Rust. The smem API would benefit from an
> > > overhaul in general... At the time I wrote it, you couldn't really bo=
ot
> > > the system without SMEM, so I added the suppress_bind_attrs, these da=
ys
> > > you can exercise a fair amount of use cases without it.
> > >
> > > > The primary intention of converting this driver is to be a low risk
> > > > trial for GKI's ABI stability for vendor modules and a first Rust
> > > > vendor module (we have platform modules already for binder and ashm=
em)
> > > > on Android. This was discussed informally with Trilok (a long time
> > > > ago) to act as an example for other vendor drivers and encourage us=
age
> > > > of Rust for new drivers or those where memory safety has been a
> > > > problem in the past, but nothing was ever formally committed to.
> > >
> > > But if the test bed for GKI ABI stability is the goal, don't you need
> > > something with a more interesting interface?
> >
> > We've been watching things manually for the 6.12 release and manually
> > backtested on the 6.6 release (by looking at our ABI dumps) and
> > believe that it works. The only way we can really progress further is
> > by deploying a vendor driver in the field.
>
> But this is the upstream kernel, you're not contributing to 6.6, 6.12,
> or even 6.18. If we merge this rewrite for v6.20 it will be deploying
> into the field in 2027.

Android's 6.18 can take backports, and we prefer to do everything
upstream-first unless there's a reason not to. If this lands upstream,
we would backport it onto the Android 6.18 branch.

>
> Perhaps I'm misunderstanding what you're saying here though?
>
> > If we pick something more
> > interesting, there was concern around it being caught up on concerns
> > related to the specific driver. The hope was that this driver would
> > simultaneously be real enough to count as a driver in the eyes of
> > other vendors watching for someone to take the lead, and simple enough
> > to be low risk enough to be possible.
> >
>
> Are you talking about upstream drivers, or downstream vendor drivers?

Both - some vendors have upstream drivers and some are downstream
only, and we'd ideally like both of them to consider using Rust when
producing drivers that end up in Android.

>
> > We do have more interesting drivers in process, e.g. the tyr graphics
> > driver, but those are longer term efforts.
> >
> > >
> > > Also, how would this manifest itself in the upstream kernel? Do you h=
ave
> > > a test bed where you build GKI + vendor "kernel" out of the upstream
> > > kernel tree today?
> >
> > In Android, kernel modules are split into two categories - "GKI
> > modules", which get shipped with the primary kernel to every system,
> > and vendor modules, which are shipped and loaded by particular
> > devices. Neither current builtin modules [1] nor current GKI modules
> > [2] contain the qcom socinfo, so it is a vendor module. This
> > categorization is not an "in-tree" / "out of tree" categorization, but
> > a "every Android device" / "some Android devices" one.
> >
>
> Forgive me, but I'm reading this as "Android downstream" + "Qualcomm
> downstream", my question was how this relates to the upstream kernel.

I'm starting to think that this part of the discussion may be
irrelevant to your final position, but I'll still try to clarify.
Android devices ship three things on a device:
1. The base image (GKI) - a kernel image built from the Android tree,
downstream of a particular LTS. This is ideally the same on every
phone, but there are some exceptions.
2. Modules that are shipped to every device (GKI modules) - these are
produced in the same build as the kernel image.
3. Modules that are needed for a particular device (Vendor modules) -
these are built against one of the GKI builds, though possibly not the
newest. They may be in or out of tree. We endeavor to make it so that
vendor modules built it against older GKI revisions from the same
kernel LTS can be used with newer ones without recompilation. For
example, a module built against android16-6.12 when it was first
released can be used alongside android16-6.12 that was released a year
later, without recompilation.

We believe that #3 will work correctly with Rust based on our
monitoring and backtesting, but this would serve as the first "real
world" instance of #3 + Rust.

The only way this relates to the upstream kernel is that we try to
have a minimum of changes in our downstream kernel trees - we try to
work upstream first where possible. While I want to be transparent
about my motivation for looking at this module (which is expressed
above), a better rationale for Linux may be the CVE we mentioned
below, and we can ignore all this.

>
> > [1] https://ci.android.com/builds/submitted/14027866/kernel_aarch64/lat=
est/modules.builtin
> > [2] https://android.googlesource.com/kernel/common/+/refs/heads/android=
16-6.12/modules.bzl
> > >
> > > > Trying to apply Rust to more significant existing modules (where it
> > > > would provide a greater benefit) raises concern about whether they
> > > > will operate identically. Socinfo in particular can be more thoroug=
hly
> > > > tested for equivalency, as aside from the runtime DSP information
> > > > modification that was mentioned in this discussion, the output of t=
he
> > > > socinfo driver is static and can just be checked. This means that a
> > > > socinfo driver swap will essentially have the language change be th=
e
> > > > *only* significant thing about the change, keeping the risk to a
> > > > minimum.
> > > >
> > > > Part of the reason for the RFC prefix on this patch is to solicit y=
our
> > > > feedback on whether you are open to this. If you have somewhere els=
e
> > > > you'd prefer we try this, I'd be open to that as well.
> > > >
> > >
> > > Rust is a new dependency and it's a foreign language to the vast
> > > majority of the contributors in the upstream Qualcomm community.
> > >
> > > So, IMHO sufficient value needs to come with such rewrite, and this
> > > value needs to be properly documented in the git history. Rewriting
> > > things for the sake of rewriting things, or the facilitate a downstre=
am
> > > experiment, is hard for me to force onto our community.
> >
> > Since you brought it up, I took a brief look and found CVE-2024-58007
> > [3] , which would have been prevented through use of Rust, as the
> > access would have been bounds-checked. I understand that such
> > vulnerabilities in socinfo.c are likely to be uncommon, but even for a
> > driver this simple memory safety issues do happen, and have even
> > happened recently.
> >
>
> Yes, this is exactly the kind of argumentation I would like to see.
>
> This is something we can weigh against the added cost of the Rust
> implementation.
>
> Regards,
> Bjorn
>
> > [3]: https://nvd.nist.gov/vuln/detail/CVE-2024-58007
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > > > >
> > > > > > > > ---
> > > > > > > > base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
> > > > > > > > change-id: 20251029-qcom-socinfo-d8387c7fdb1c
> > > > > > > > prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:=
v1
> > > > > > > > prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740=
e0c5
> > > > > > > > prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac8=
7f6c
> > > > > > > > prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v=
1
> > > > > > > > prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684=
d8e6
> > > > > > > > prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
> > > > > > > > prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb9065=
0bd6
> > > > > > > > prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c=
866e
> > > > > > > > prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bb=
e74f
> > > > > > >
> > > > > > > So, it doesn't work on a clean v6.19-rc1 tree?
> > > > > >
> > > > > > Correct. Those other patchsets are patchsets I'm landing which =
add
> > > > > > bindings used in this one.
> > > > > >
> > > > >
> > > > > Okay, please make that explicit when submitting patches, so that =
the
> > > > > maintainers know that your patch(es) can't be merged.
> > > >
> > > > I thought that was what I had done by using the combination of "RFC=
"
> > > > and putting the prerequisite change IDs from b4, but I will include=
 a
> > > > statement to that effect in my cover letter in the future.
> > > >
> > > > >
> > > > > Regards,
> > > > > Bjorn
> > > > >
> > > > > > >
> > > > > > > Regards,
> > > > > > > Bjorn
> > > > > > >
> > > > > > > >
> > > > > > > > Best regards,
> > > > > > > > --
> > > > > > > > Matthew Maurer <mmaurer@google.com>
> > > > > > > >
