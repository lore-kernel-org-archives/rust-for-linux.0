Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042D4246335
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 02:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771380800; cv=pass; b=kyENX0vXw2iL1j/anabU+PRMmGNDWzRXAl1cU99WDAZPE4kakyHXZ6zhEZaSKroV2OtP9u/4CBhsgvUYRMxbzP0o0/IWkdWiPx/IcZOSuvt9NxPVbZARJ6P/kq8ZKestpAUuN/Viot3XWclJXWn1O/Iv049pYNhQFS35WthPalk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771380800; c=relaxed/simple;
	bh=S/Z/B3945DyN1CgtJ/z53VZxf7iks2VH62eReMEjqQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRh1k4lAPJvhmTpWK0rIhekdPahtNc7iFl0N8eNggkLSYWDwx4RfOnyZmBorbZpgAYjuDb3PckzC5w83KG0aB/yAxjK5/9HZFmPST2wZ0XPMXzoCY6GW+sfflMXtoPhmdJQ9m7EWSR34yv+uj58ynF0AkdDt3dI+hQ/fYMkUMe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joH4Wp/m; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joH4Wp/m"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so8185408a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 18:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771380797; cv=none;
        d=google.com; s=arc-20240605;
        b=dhDFYGWZNhvw4SVGHFm9103LFd58OFjpswk+3eP1t0wWX+ZVtlKKKY8yewfPMb4Cnp
         yIWwIu1+hD3GqFiRnof5kin9gwaQu0cPFlHupTOyLhjdwy1+MkK2CfT2eca+t2RdWaGE
         3LJL0dcE3tK1kL5HuZejes5y51+/8J3hTIFD5cMKGVUWoQgZV2k11mIGWZXqaZHPAC8/
         8aXmWkFdIIn1HH49WphGx74Vlk7I095aI2/iJtI0bD91nd9tHOsK5qFJDkrRlYkPIgEM
         IXqLu93JHxXYyPonB5CVBXCU+HgQgqC65MUaR+1sr8pUxs3btxU97RdPqCpOa8nJSIyM
         C3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yt03EibpDHB+OSTayepUfQsKwul4kw22IcVV11w6O5c=;
        fh=dl7Rltxu06n3cUUPOiszKphp0FLsZ2SUfjNjy98Eb9g=;
        b=ddByER2WdbC8y8lU8VQ1qWeDu4XSGbmViXb2DOtUW3uP5EQvy6efIzT1RpYOGZcP4H
         +1fR9qkaQfQ8YNGhzxywqjn7V2TtRCkG2LXhwku59VpjmA4I5ZvCj/CkQc5yO6etSlso
         Trd8vsmT19XkWW91UHf9+AiD7n+eMVU3icRgTxJPJrxZ+5yy9hBFNxWaCR8YtFpm1CN7
         /5UWeJu1Y1vjeEyT8J0SkHqyPYnUxhhoiKNDnMdeXVXjgCINmO8iyJqyHswYJBymOJjx
         xleyXEx483gL0ywQ9SgeH3hqjR6TfB0yw0y5PG2/9pmLu4C3g5uRB1ZMyTeNLcCE3fB2
         HsYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771380797; x=1771985597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt03EibpDHB+OSTayepUfQsKwul4kw22IcVV11w6O5c=;
        b=joH4Wp/mCKT9U/skqar+JcyFggO/PFCWbsG2S0Ko3fh8pyoyy408Dj8dKHgdU8j4g/
         0w96RKfWqB57c0+8aDL267bFTtBQrFuylgJTOXPm3g0cSHrv9Ta4V8mL/NJJWsm3xL3G
         9TyPUI3a3pduG7vpYOGsPaSWnwoxwu3jKiqK8jkoEqwxYWk3DirkMe1VqlyU+nX0Eqih
         u1pLKj3eiokeeCwdGN8IGdSWgZPZpkHEg0cxlWEkk26AZyeMTtmkjE3Ps+z2iusV9+BP
         lUBMgppSLH9HIPoQpmUY5er7uqMeS/XEIo3XnIRuE2b0GMl5dS0A609AmMagKZow2oCW
         ugig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771380797; x=1771985597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yt03EibpDHB+OSTayepUfQsKwul4kw22IcVV11w6O5c=;
        b=q8BLO1MJsbwvXiVoEhsINChxWfMcN4op7kn7EVQXiKOmLTaqr2Rfk+3c0YdpAjA0AH
         89kOmiq/J3L/N6Qxi0843G7dyNLVJ0SLlGD5+lf8gfrpcV9acv9Ras7bPbsO6pqKrIp5
         xe/880LQ2y08v2oncFM0ZKiYX4JwAYbRcoOEfEayahVG0kLIozg2k+xH+U4Ksjd/WVMN
         e86lhF6uDihWNW69SXhYTv6FEYot/sXt4pp8Gtgbcx7D/FLHYJqMRmtlLd6cfbtxrYox
         6MNQYCTHO4a4ml7mRzCtJE1jfZyN8CxdgJtU1NGONCUjOB6ld0fT1kOxMv4y2kfCiccu
         Eo9g==
X-Forwarded-Encrypted: i=1; AJvYcCXZsSt6fTRTPNfk9HRsBhdv0qxQNOkgRLMp9TAU4UDIb5biOUunDcCF47MNGLJd+P+CVDLuSob9mNbLLQjXlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsiTKwT8rtQxn8SSF1YtB/fDiKm4fAKxbKJqd0OE7LV9Ro2nlk
	1VKBFK2ShCvdP4K7XDcolxSvmIakhXGnIyYDVXnI+YY2Kcc3ooE7SME8/g0PS7wCDodUwOADO9z
	YO7hTpit/CEsezjRha8ZjbY48Ux8pA3o=
X-Gm-Gg: AZuq6aJzxn4DZqaxwIH2MPQGThzKRhHnzpSHQD4Aqd/mpqnvDwKS+tDY5peUH1x2apN
	b380WoPHXPRtna3C8ODwz68t9/fo4uqZH4BlZuduMw3aARLIofTX1cpC6zRR5J6cts6Xwi3Xpj3
	n+h2bpq/Kg+DfjomTyqkKeHssWJiOp20FAS672IwyMmXw5HXNyfCaoG1zXIPmJ4qJ1O2AuzPyku
	2DSYkQ9uQt1XRHQrv4gA8dorAdu42ZQrTyhj1CxIFpVVYERDR6EZihn1l6R59kX7Z7rRF2AzZsN
	ZFo7eClLJgOjrs5DWFgJKni3qPkHHk3YittAQQ==
X-Received: by 2002:a05:6402:f16:b0:658:c1b3:b958 with SMTP id
 4fb4d7f45d1cf-65bc7605c53mr5233615a12.0.1771380797025; Tue, 17 Feb 2026
 18:13:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com> <698d6b7faa190_2e57100d3@dwillia2-mobl4.notmuch>
In-Reply-To: <698d6b7faa190_2e57100d3@dwillia2-mobl4.notmuch>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 Feb 2026 12:12:50 +1000
X-Gm-Features: AaiRm50kUfToGCU-ZHMlptQVt4b0wRA7xDMepx3E9_wmPCsQaIda1MtDKAVhlig
Message-ID: <CAKmqyKPoY+u+9MxDb5eeCdQDB+KB=CVwqVBgCsKUK+uua7QY0A@mail.gmail.com>
Subject: Re: [RFC v3 00/27] lib: Rust implementation of SPDM
To: dan.j.williams@intel.com
Cc: bhelgaas@google.com, lukas@wunner.de, rust-for-linux@vger.kernel.org, 
	akpm@linux-foundation.org, linux-pci@vger.kernel.org, 
	Jonathan.Cameron@huawei.com, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	wilfred.mallawa@wdc.com, aliceryhl@google.com, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 3:56=E2=80=AFPM <dan.j.williams@intel.com> wrote:
>
> alistair23@ wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
>
> Hi Alistair, quite a bit to digest here and details to dig into. Before
> getting into that, I will say that at a broad strokes level, no immune
> response to the core proposal of depending on a Rust SPDM library and
> forgoing a C SPDM library.
>
> Most of that allergy relief comes from how this organizes the C to
> Rust interactions. The core SPDM implementation calls out to C for the
> presentation layer (Netlink) or is invoked by sysfs. That makes it
> amenable for sharing those presentation mechanics.

Great! That was my goal.

Also, with netlink some of the C code is autogenerated, so a Rust
version would be tricky to do well.

>
> Specifically, my primary concern is integration and refactoring
> opportunities with the PCI TSM implementation [1]. The PCI TSM case
> should use the same uABI transport for requesting + conveying device
> certificate chain, SPDM transcript, and device measurements as PCI CMA.

I do think broadly that they can use the same uABI. I'm sure there
will be refactoring required though.

> Note that in the TSM case the SPDM implementation is in platform
> firmware and will bypass this library. The TSM SPDM session is mutually
> exclusive with the CMA SPDM session.

As long as we can get the details from the platform firmware (which I
assume is possible) then we can present them to userspace via the same
netlink ABI.

>
> [1]: http://lore.kernel.org/69339e215b09f_1e0210057@dwillia2-mobl4.notmuc=
h
>
> > Security Protocols and Data Models (SPDM) [1] is used for authenticatio=
n,
> > attestation and key exchange. SPDM is generally used over a range of
> > transports, such as PCIe, MCTP/SMBus/I3C, ATA, SCSI, NVMe or TCP.
> >
> > From the kernels perspective SPDM is used to authenticate and attest de=
vices.
> > In this threat model a device is considered untrusted until it can be v=
erified
> > by the kernel and userspace using SPDM. As such SPDM data is untrusted =
data
> > that can be mallicious.
> >
> > The SPDM specification is also complex, with the 1.2.1 spec being almos=
t 200
> > pages and the 1.3.0 spec being almost 250 pages long.
> >
> > As such we have the kernel parsing untrusted responses from a complex
> > specification, which sounds like a possible exploit vector. This is the=
 type
> > of place where Rust excels!
> >
> > This series implements a SPDM requester in Rust.
> >
> > This is very similar to Lukas' implementation [2]. This series includes=
 patches
> > and files from Lukas' C SPDM implementation, which isn't in mainline.
> >
> > This is a standalone series and doesn't depend on Lukas' implementation=
.
>
> So, I *am* allergic to how this series references Lukas' work by
> pointing to random points in his personal git tree. I trust that was
> done for RFC purposes, but it would have helped to call that out in the
> changelog and set expectations about the ideal path to coordinate with
> that work.

I was trying to convey that a lot of this work was done by Lukas, I
didn't want to appear to be claiming otherwise or stepping on toes,
hence the links to his git tree.

As for an ideal path forward, what I think would be really useful is
if Lukas' prep patches get merged. Lukas sent them in his original
series and they have been reviewed there. I have picked them up here
to help with testing, but they could go upstream today and set the
ground work for either a C or Rust implementation.

That would reduce the size of any future series as well.

From there it would be worth thinking about a C or Rust implementation
and maybe just focus on one and work towards that.

>
> > To help with maintaining compatibility it's designed in a way to match =
Lukas'
> > design and the state struct stores the same information, although in a =
Rust
> > struct instead of the original C one.
> >
> > This series exposes the data to userspace via netlink, with a single sy=
sfs
> > atrribute to allow reauthentication.
> >
> > All of the patches are included in the RFC, as it depends on some patch=
es
> > that aren't upstream yet.
> >
> > Now that Rust is no longer experimental I have picked this back up. If =
the
> > community is generally on board with a Rust implementation I can work o=
n
> > sending a non-RFC version and push towards getting that merged.
>
> As long as this stays explicitly designed to minimize exposure to
> "refactor across language boundary" events (as initially seems to be the
> case), then it seems workable.
>
> > The entire tree can be seen here: https://github.com/alistair23/linux/t=
ree/alistair/spdm-rust
> >
> > I'm testing the netlink data by running the following
> >
> > ```shell
> > cargo run -- --qemu-server response
> >
> > qemu-system-x86_64 \
> >   -nic none \
> >   -object rng-random,filename=3D/dev/urandom,id=3Drng0 \
> >   -device virtio-rng-pci,rng=3Drng0 \
> >   -drive file=3Ddeploy/images/qemux86-64/core-image-pcie-qemux86-64.roo=
tfs.ext4,if=3Dvirtio,format=3Draw \
> >   -usb -device usb-tablet -usb -device usb-kbd \
> >   -cpu Skylake-Client \
> >   -machine q35,i8042=3Doff \
> >   -smp 4 -m 2G \
> >   -drive file=3Dblknvme,if=3Dnone,id=3Dmynvme,format=3Draw \
> >   -device nvme,drive=3Dmynvme,serial=3Ddeadbeef,spdm_port=3D2323,spdm_t=
rans=3Ddoe \
> >   -snapshot \
> >   -serial mon:stdio -serial null -nographic \
> >   -kernel deploy/images/qemux86-64/bzImage \
> >   -append 'root=3D/dev/vda rw  console=3DttyS0 console=3DttyS1 oprofile=
.timer=3D1 tsc=3Dreliable no_timer_check rcupdate.rcu_expedited=3D1 swiotlb=
=3D0 '
> >
> > spdm_utils identify &
> > sleep 1
> > echo re > /sys/devices/pci0000:00/0000:00:03.0/authenticated
>
> So this is where it will collide with TSM that also emits an
> authenticated attribute. See Documentation/ABI/testing/sysfs-bus-pci.
>
> The rough plan Lukas and I worked out is that switching between TSM and
> CMA based authentication would use sysfs visibility to coordinate. I.e.
> TSM to CMA conversion hides the TSM "authenticated" attribute and
> unhides the CMA attribute of the same name.

That sounds fine to me

>
> The most significant unsolved point of contention between TSM and CMA is
> the policy on when authentication is mandated and the driver probe
> policy. The proposed model for enforcing device security for
> Confidential Computing is make it completely amenable to userspace
> policy. Draft details here [2] to be refreshed "soon" when I send out
> the next version of that.
>
> [2]: http://lore.kernel.org/20250827035259.1356758-6-dan.j.williams@intel=
.com
>
> To be clear I am ok if there is an incremental option to have auto_cma
> and/or auto_tsm that arranges for authentication or link encryption to
> happen without asking. I take issue with auto_cma being the only hard
> coded option.

Ok, so we would need a way for users to select TSM or CMA and specify
policy information?

Alistair
