Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA79223707
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Jul 2025 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394777; cv=none; b=AFe1uE1xVrAGGojCornkB+n/4aw7VmlYEuTemOUmfSvF6GK/OO7gQH2KVSO8818WHFWhCdVoqFGntqIqVUx9QM2xmkUukmbYeRjYsayuA//taww8Pz4zILuyCJTsS0Vk6QSkdw+gk3MDp/FniApa+gY8MzBY9SIHTkpdi/hehHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394777; c=relaxed/simple;
	bh=d9wnrHFnmPDUmXQX+GwkpxvTJXuZ/r6tQtF+p2zmkQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ay7tjdE9uFMFHGBGrEgOY6iMg6FmDuOsHP1U803Wnxxh2fPy31B2g3XRcN/hwck8XHuKkCJho3UUBtxrereIn3KtKK/ePXMzJ/WS3yzcuY1+7cC3LlRkvf7mRGKnRIrC3wtpWMV0hnxEj+8yL3nfNgFLhDLuSP2tpGP8iFvUpcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NCWuiaQe; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NCWuiaQe"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso16426a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jul 2025 11:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751394774; x=1751999574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQXvVz9WRAegKYfmIxpfPI85E7REg9LgrNVKoNzlSWo=;
        b=NCWuiaQeW5oHtwRXtV7hfuExcDe0KwkLxqzyzAitJ8D96JPMsybDbwHmLFsmxHfN7E
         vPnwukbYXOPlaIBNivpRTAWim7GhiZuDvkIG2eTqrToKHJIfiQBVFh1Hk3eYhG4Z5FRY
         n507apuDcGW1V7RvNN3zqDfw5qz47jO2MFJyYpr3jcEtru7BDDL/zQPees2KFWXjYKwI
         C0aaP/uUROqLIvdh9pm8rKwBGMx2T8kNUejv2Ffnfz49ohZ+7PSpGnFKX6VbrPc/QvRq
         iGm5x1q7FupjNmt9a6O+Cwrv+kWg/UKtdGUtK45jSo7LONvlUVmX4pGf8LOqvB80ZT6f
         pCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751394774; x=1751999574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQXvVz9WRAegKYfmIxpfPI85E7REg9LgrNVKoNzlSWo=;
        b=H0Mj/8xMEPz/WBYU82TBqMJh9VEs1xHaTp+nmUU6ROJCh2l9xYPKrNpZ/PLOxhaoW8
         rCi4dCsPyeQD84eYBBjt2CZVL1IyVBc49pQVTT7eZIsWD7eD/DD8BQ+/0i3IbsP8rO3y
         UL6oMjG2AvP7JBWokyjJetGYMhDjMxwOaNthCRhdNeMM5yqL/clhdM0x/p4nmbRQgOTJ
         iggSOjeMKg5JQ9gDYbfZ8mQr0ryC44CqyclbHaROvKrPMjggFJIdClJTLr1ECFAHAHRn
         uDjjinlQJ5V6KbJa16UWtpZDT3orXqPQndmfpPKoHXDn+VyOGewFJo89Ue7CZxtWNJHd
         RVEw==
X-Forwarded-Encrypted: i=1; AJvYcCUpqI3rmbKDCfzKyNnPH3NTeDTTNMvm+5MG5tkpgnCyTIyI5VW+mQhZdV8PZj5CNDkWzaZYKJhfTD/bY1ZGSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbkflKrxyLuBWlg/olclb+Zk2lAc3sja9smanaW8E99FVaCY0Z
	NgrDIY2PF8lT1MKwI1VC5Fpoex4bILmxXR/2G48tlEX4b+51fjXLNYzdpSUVxNwHEeTxgY+mnz1
	cDn761tWWngbJQKYvHQ/UDNCbHDZNb/QxH5cCRXs/
X-Gm-Gg: ASbGncuqJAT6GIn8IEZA1gdAHN92sJHfGGSotsubvjCBCCpeICfZWlREe9QnsWBbGtl
	SWbwJ+bTc12QMPqwmp/t0p7ILs7ddjZv0Zkji+4lVNHVMTwPPUwRI4OVDdrl5TNFzqZHERpv4IR
	F/3r9bxG0sQUbvci8SwwXhvkTbCjyOGkFNg3kxkpChRCeZbezZHbb0mdZgol5hghDupLBVGAvt
X-Google-Smtp-Source: AGHT+IGv7/Tr+sUazGCtuAmUl3War4uVSjVimZL9/8SAcTJFtKZPXxA57SH/Rd6iX4Z7K7emCqya4lKJ0k0S7eXOusg=
X-Received: by 2002:aa7:c342:0:b0:608:fb55:bf12 with SMTP id
 4fb4d7f45d1cf-60e38a44816mr103298a12.4.1751394773651; Tue, 01 Jul 2025
 11:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-6-c6526e413d40@google.com> <2025070148-primer-stillness-0409@gregkh>
 <CAGSQo00UiOUAgYODhXT9BWLW0bXoCxMzt9fV2F2aiTEOG1vwyA@mail.gmail.com> <aGQcODIzMiB46gKF@pollux>
In-Reply-To: <aGQcODIzMiB46gKF@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 1 Jul 2025 11:32:42 -0700
X-Gm-Features: Ac12FXwdB0dtf1DsDpcngkMBzE-ux_LwOBiMCEQhM-Doq7UBSaODLP7eEK6fGyk
Message-ID: <CAGSQo02tdxoqTE1z5_M8g0PpXYEdWr4Yy31yaoPK8C_O2G_QoQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] rust: samples: Add debugfs sample
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:34=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, Jul 01, 2025 at 10:24:04AM -0700, Matthew Maurer wrote:
> > On Tue, Jul 1, 2025 at 7:03=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Jun 27, 2025 at 11:18:29PM +0000, Matthew Maurer wrote:
> > > > +        // An `Arc<Mutex<usize>>` doesn't implement display, so le=
t's give explicit instructions on
> > > > +        // how to print it
> > > > +        let file_2 =3D sub.fmt_file(c_str!("arc_backed"), my_arc.c=
lone(), &|val, f| {
> > > > +            writeln!(f, "locked value: {:#010x}", *val.lock())
> > > > +        });
> > >
> > > While cute, is this really going to be the way to describe all "custo=
m"
> > > debugfs function callbacks?  No other way to point to a function itse=
lf
> > > instead?  Look at "fun" debugfs functions like qh_lines() in
> > > drivers/usb/host/ehci-dbg.c that is dumping tons of data out.  Puttin=
g
> > > that inline here is going to be a bit ackward :)
> >
> > Good news, function pointers are legal to pass in here as well
> > already, I can add that usage to make it clear.
> >
> > >
> > > So can you show an example of a "traditional" debugfs file output wit=
h
> > > multiple lines that is dealing with a dynamically allocated device th=
at
> > > is associated with the module (not the static example you showed here=
),
> > > as that's going to be the real way this is used, not with static
> > > variables.
> >
> > Sure, do we want to:
> > * Finish creating the driver struct early in `init`, then call dynamic
> > `.create(&str)` or `.destroy(&str)` `.modify(&str)` type things on it
> > in `init` to show how it would work
> > * Actually wire up an input source to drive create/destroy/modify
> > dynamically (e.g. I could implement a miscdevice) - if you want this
> > one, do you have a preference on where I get my input signal from?
>
> I think the idea was to show how it works in a real driver context, e.g. =
a
> platform driver, just like what samples/rust/rust_driver_platform.rs does=
. Not a
> miscdevice registered from a module, which is a rather rare use-case.
>
> If you rebase on the latest driver-core-next, you can write a platform dr=
iver
> with an ACPI ID table, which can easily probed by passing
> `-acpitable file=3Dssdt.aml` to qemu, i.e. no need to mess with OF.

I'm confused as to how registering as a platform driver would result
in an input source that would let me trigger the creation/destruction
of DebugFS files. I need some kind of input stream to do that. Is
there some input stream that's available to a platform driver that I'm
missing, or are you suggesting that the input stream would effectively
be the probe's `id_info` field? If I did that, wouldn't I still have a
static arrangement of DebugFS files in my driver struct?

I could have misunderstood, but I don't think that's what Greg is
asking for - I think he wants to see how at a data structure level, I
can handle creating and destroying DebugFS files that correspond to
some kind of object being created and destroyed, rather than just
having a static list of slots in my driver struct for keeping them
alive.
