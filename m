Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74030BF4F
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Apr 2026 05:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776058981; cv=pass; b=DlFsLkd/VAR27mJqh+66dKfqU0raEEmsSsCQYNUcoVdGSLgiacSg4jMglF2jUsOYPKpKu2JWTInLqi5dfbbDAyikAIg8oUDDuHlOOA0EJqlIV9KKQ/perm8Xa8M/3YKZss7NK6ZuqBqhHUFvvaWJ3f9lCI8ZEHSH6rATsvWJNmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776058981; c=relaxed/simple;
	bh=dAn0LMJ8LSrZnwznsiD1+TQY7yIAyTPX5qsVMG4SqtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8HEeNz2Wk1mnxoCVDSvP7JDyVPQ4MROmZ58Uf8iVxMTYrTsNDh833MzQvj+Qv8u07EAKrwZw51UOWUu2mMfrqNK9PnyqUd1vm996BHqsbOdBYSt1gh1oYoCrqA2fBNKUjkwkYC83ojAPfgnEWS1N4kCI2lG9WzLlP0ffPAMGtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYYHrDJV; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYYHrDJV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b886fc047d5so631381466b.3
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Apr 2026 22:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776058978; cv=none;
        d=google.com; s=arc-20240605;
        b=aCqcUk3ibe9rCVTDAhFkkuTpS64T7kbi+7C6T2VCbVXRj1UlL4//7eCpChkO6XXLvw
         5ExipTUQfRzerfvxI8I6meaX0295mUbfRMCd2ZrQ67g/nDG8jMCLr8Va0jSHYLAPqCpS
         LP4gUk2WpFcN9KVE1RTp/Cfd9u+h+F282f1CGYlAI/lnhL0TlQS0nkQPAl8kfbUpM9iS
         cJpIpxSsX7HzuYSoC3akykrWJiHuHv3qPl9TtK7ZDjxp4amI1IyAN7+/5vsqxtu98Bg7
         0FhcGCZ6L/dU8DfXnveznclDWCqEHfcjJiwAW63Sbhxtg/1NeEcE5Kl9oWhFxhkFgQEK
         dsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LCK902ZEqjdW+lUbQsLeaFO8ujBemNd6Hq/l8OuysNg=;
        fh=ZTs9hz6Jo5LyToX4nFvRxoOfmoLTrpifDLJ/ytx5iPE=;
        b=LqS46ndHrOVJnFGYXHg7VOsC0ZuBjLmmtAyLTULFmUIaN7AeAhNse6Wi73N6T/IKpz
         DlaXmGbeQWRbXMDYKVNPsvXzdx2DZD+jeOb3FNBbpQnD/eVKgP/vrCcwrtDgAeg+LVDu
         eIaEmLJhg8cw0YvLcWoD53Lhe2kW7pjKmgke3LRPQ7g8qrBrD6Vz7GfWxwNnpjK8nPGl
         o+djgBZ4/6ve3sBZnCI2ctHLvhCbZMu/gHSRfEE83IUdB/muimE85PAUXN/HRJh/KVAx
         2gOouQY4D1t7Sy1i5DbhDZk69HSThyJwAg723DylEza6KY5GrIyZVdR9J5W37JwX2/cZ
         6s/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776058978; x=1776663778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCK902ZEqjdW+lUbQsLeaFO8ujBemNd6Hq/l8OuysNg=;
        b=IYYHrDJVT8GQjg1BGIR7Sm0j3OdQFYIozG4SbQuIh0xQlVG5Cxz32j6bOuq87GX00Q
         zMoFusEKYCeIbsEvOeeZuFqghEO1tx1fX0c5Tmce+6vvkMTDuB95VqTi/B7w9wEt1fCu
         y9qddJ/VKCOaZe+wBEzdhCLjR4IocdzR+jdLDIthRM3SyXdR471SLTiC1SFcDkWYBxaJ
         Qhd3ZAmXz9xp9AtZa5hiP2FsZrRYM21KnZy8rrnFlE00V6HZNv6Qg2h4Imk3wBOXQNgj
         TtfAN7ye5Q1fTbSd0gKnY9djdjhkWCqzJv0dGd9QjUSnSzPTZlk3v7DpPKZYFQLJeZb+
         IfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776058978; x=1776663778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCK902ZEqjdW+lUbQsLeaFO8ujBemNd6Hq/l8OuysNg=;
        b=J44aFBo6GDj1wxYtR89KJOp7NtfZjx1iTTT8nLP4AB4+kIICVUNm5MJxuvJt/M2bVx
         MpVEnZU9rxtHKXo+G/z5KsG+dEIBRgj8VuUhD+iACam+4Afs6nInTNG9SedBEUnFxn4A
         NZzIf9Pm7qTH+RUhieY/ItAQWgeyv8NoiyCiRsHB80wKYBUe/hALkDZU4WDUQh8kN/G4
         c6nEzo3ud8LnYMogH4Idw0mWxFFqx5qG6LXh1uvgJVFFbWtTvQSs7E7cwXGIP7nR1Tju
         cp6z1SNmsW9fEcZ5FHBvuSoJyRVOhfJUKNrkATu8eTTf9nGkMhk4/HE/0JFSW6v29dXu
         xrbw==
X-Forwarded-Encrypted: i=1; AFNElJ8+kxMjY0WxsXCaIoTtHZyn0sp33qTg4fJdV1uZT7rpdsVj/ViCkxIf5MA0M2f2TsabX5HfiYe9Pew2oNcLHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcDSkWtUqG7OBrfLrHVteJmqgMogwh3XSZAGR1POYbKe9hdCD3
	MVc/64jP5rKPYZF92U/IftMdyQsZwB3W8WD3UjDYQMbGQohzqbWe240yp1HYonQE7ON1IyJ7uiI
	Q9iDFl+GQczsUyH1CmCjTDFqwM7HlqqA=
X-Gm-Gg: AeBDieusOnQbbG/ALoGXpWYOGvCfuWubB+KXHQcyfy4xkypDqoFtcxwkOGjq5VxO63f
	Ea75Gbz8MOxSeRvAt8urhWxvlRcz+DaCQF40lQ/a7//KExui6X1Z/JZp/sOXyodbyz4LiIbIuFh
	uZenWM9POgdgrVuNeCut4d7uREwBqdRTb6hyqxVcW1d3wXqPaJDrrT2l8w2ARfbMDSFIsmgVOLb
	8C4FR67a/BUhVBU4QAs1qtJjTNETV9wXDiPViTpA7QEBbeGGr4IjBvrd4utN43s5urCGgM75kbU
	9K6NAstKcNh2G5ClQVmTanSAMkhdCGyqOCrUJA==
X-Received: by 2002:a17:907:9707:b0:b9d:f5fd:a783 with SMTP id
 a640c23a62f3a-b9df5fdb0e4mr35246866b.7.1776058977652; Sun, 12 Apr 2026
 22:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <698d6b7faa190_2e57100d3@dwillia2-mobl4.notmuch> <CAKmqyKPyR165rACXRMJXgyUOp6OUdQqSsym-gfYVFnKLZ4ednQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPyR165rACXRMJXgyUOp6OUdQqSsym-gfYVFnKLZ4ednQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2026 15:42:30 +1000
X-Gm-Features: AQROBzDQwMVyFaPUY8I-CycOp1IR9F8ypWP8Im0wi8xPIs5LdfP2T-ajtC_R_oI
Message-ID: <CAKmqyKOU-chxmNfNV11Dx7_zmQQ+kqK2eFtT1unsVQy1dsW7rg@mail.gmail.com>
Subject: Re: [RFC v3 00/27] lib: Rust implementation of SPDM
To: djbw@kernel.org
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

On Thu, Apr 9, 2026 at 1:39=E2=80=AFPM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Thu, Feb 12, 2026 at 3:56=E2=80=AFPM <dan.j.williams@intel.com> wrote:
> >
> > alistair23@ wrote:
> > > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Hi Alistair, quite a bit to digest here and details to dig into. Before
> > getting into that, I will say that at a broad strokes level, no immune
> > response to the core proposal of depending on a Rust SPDM library and
> > forgoing a C SPDM library.
> >
> > Most of that allergy relief comes from how this organizes the C to
> > Rust interactions. The core SPDM implementation calls out to C for the
> > presentation layer (Netlink) or is invoked by sysfs. That makes it
> > amenable for sharing those presentation mechanics.
> >
> > Specifically, my primary concern is integration and refactoring
> > opportunities with the PCI TSM implementation [1]. The PCI TSM case
> > should use the same uABI transport for requesting + conveying device
> > certificate chain, SPDM transcript, and device measurements as PCI CMA.
> > Note that in the TSM case the SPDM implementation is in platform
> > firmware and will bypass this library. The TSM SPDM session is mutually
> > exclusive with the CMA SPDM session.
> >
> > [1]: http://lore.kernel.org/69339e215b09f_1e0210057@dwillia2-mobl4.notm=
uch
> >
> > > Security Protocols and Data Models (SPDM) [1] is used for authenticat=
ion,
> > > attestation and key exchange. SPDM is generally used over a range of
> > > transports, such as PCIe, MCTP/SMBus/I3C, ATA, SCSI, NVMe or TCP.
> > >
> > > From the kernels perspective SPDM is used to authenticate and attest =
devices.
> > > In this threat model a device is considered untrusted until it can be=
 verified
> > > by the kernel and userspace using SPDM. As such SPDM data is untruste=
d data
> > > that can be mallicious.
> > >
> > > The SPDM specification is also complex, with the 1.2.1 spec being alm=
ost 200
> > > pages and the 1.3.0 spec being almost 250 pages long.
> > >
> > > As such we have the kernel parsing untrusted responses from a complex
> > > specification, which sounds like a possible exploit vector. This is t=
he type
> > > of place where Rust excels!
> > >
> > > This series implements a SPDM requester in Rust.
> > >
> > > This is very similar to Lukas' implementation [2]. This series includ=
es patches
> > > and files from Lukas' C SPDM implementation, which isn't in mainline.
> > >
> > > This is a standalone series and doesn't depend on Lukas' implementati=
on.
> >
> > So, I *am* allergic to how this series references Lukas' work by
> > pointing to random points in his personal git tree. I trust that was
> > done for RFC purposes, but it would have helped to call that out in the
> > changelog and set expectations about the ideal path to coordinate with
> > that work.
> >
> > > To help with maintaining compatibility it's designed in a way to matc=
h Lukas'
> > > design and the state struct stores the same information, although in =
a Rust
> > > struct instead of the original C one.
> > >
> > > This series exposes the data to userspace via netlink, with a single =
sysfs
> > > atrribute to allow reauthentication.
> > >
> > > All of the patches are included in the RFC, as it depends on some pat=
ches
> > > that aren't upstream yet.
> > >
> > > Now that Rust is no longer experimental I have picked this back up. I=
f the
> > > community is generally on board with a Rust implementation I can work=
 on
> > > sending a non-RFC version and push towards getting that merged.
> >
> > As long as this stays explicitly designed to minimize exposure to
> > "refactor across language boundary" events (as initially seems to be th=
e
> > case), then it seems workable.
> >
> > > The entire tree can be seen here: https://github.com/alistair23/linux=
/tree/alistair/spdm-rust
> > >
> > > I'm testing the netlink data by running the following
> > >
> > > ```shell
> > > cargo run -- --qemu-server response
> > >
> > > qemu-system-x86_64 \
> > >   -nic none \
> > >   -object rng-random,filename=3D/dev/urandom,id=3Drng0 \
> > >   -device virtio-rng-pci,rng=3Drng0 \
> > >   -drive file=3Ddeploy/images/qemux86-64/core-image-pcie-qemux86-64.r=
ootfs.ext4,if=3Dvirtio,format=3Draw \
> > >   -usb -device usb-tablet -usb -device usb-kbd \
> > >   -cpu Skylake-Client \
> > >   -machine q35,i8042=3Doff \
> > >   -smp 4 -m 2G \
> > >   -drive file=3Dblknvme,if=3Dnone,id=3Dmynvme,format=3Draw \
> > >   -device nvme,drive=3Dmynvme,serial=3Ddeadbeef,spdm_port=3D2323,spdm=
_trans=3Ddoe \
> > >   -snapshot \
> > >   -serial mon:stdio -serial null -nographic \
> > >   -kernel deploy/images/qemux86-64/bzImage \
> > >   -append 'root=3D/dev/vda rw  console=3DttyS0 console=3DttyS1 oprofi=
le.timer=3D1 tsc=3Dreliable no_timer_check rcupdate.rcu_expedited=3D1 swiot=
lb=3D0 '
> > >
> > > spdm_utils identify &
> > > sleep 1
> > > echo re > /sys/devices/pci0000:00/0000:00:03.0/authenticated
> >
> > So this is where it will collide with TSM that also emits an
> > authenticated attribute. See Documentation/ABI/testing/sysfs-bus-pci.
> >
> > The rough plan Lukas and I worked out is that switching between TSM and
> > CMA based authentication would use sysfs visibility to coordinate. I.e.
> > TSM to CMA conversion hides the TSM "authenticated" attribute and
> > unhides the CMA attribute of the same name.
>
> That seems straightforward and is already documented upstream as well,
> so that's pretty easy.
>
> >
> > The most significant unsolved point of contention between TSM and CMA i=
s
> > the policy on when authentication is mandated and the driver probe
> > policy. The proposed model for enforcing device security for
> > Confidential Computing is make it completely amenable to userspace
> > policy. Draft details here [2] to be refreshed "soon" when I send out
> > the next version of that.
> >
> > [2]: http://lore.kernel.org/20250827035259.1356758-6-dan.j.williams@int=
el.com
>
> CMA will eventually need to support some sort of drive probe policy as
> well, but that can wait until later and isn't going to be dealt with
> in this series.
>
> >
> > To be clear I am ok if there is an incremental option to have auto_cma
> > and/or auto_tsm that arranges for authentication or link encryption to
> > happen without asking. I take issue with auto_cma being the only hard
> > coded option.
>
> I have been working through all of the comments and discussions and I
> think I have addressed everything, except for this one.
>
> To summerise, is the high level issue is how do we know if we should
> use CMA or TSM?
>
> Do you have any more thoughts on this?

+ Dan's Kernel.org email

Alistair
