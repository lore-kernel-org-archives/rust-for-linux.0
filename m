Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C3B3290C2
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Mar 2026 21:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090019; cv=none; b=gU0ffaSHkj5ZSIRftY3HiAQ5mdADA7HqOiYtQL0IEzyNOwiCRbZC75U125MU36DykVo+f7OT53YmDB2Ns/Xqu/2S9zxV9Lw3skjNbgPWWEl7ADQOlCyZGG3ZC5MtYXBjqqf0tp1oM9Mg8EMlZhIDITs6VzphKBhrZ3eHcP0o1Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090019; c=relaxed/simple;
	bh=+zkezKRsBx3L5Zs1tQH+F307QdPFqByV/sMdswKJVIk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=lJDF5TGnKSEd2kdDSmyJS1tqEXjKZqGB14GjsMXSNwV1aXZf7XKUx8KNtoPiecOgzQZ/pbemI9x2y1OpViIhbOgZp2qzGc7XUR9Sr9l4HL5UT+gAMmQR1TMrNpnypuw3kzBsEodnBSn3qANw1a7n1j8FCc6YDrKizwsdkX6lQI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=Q2SqKYIp; arc=none smtp.client-ip=83.166.143.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="Q2SqKYIp"
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fV8Xp3ZhszR0x;
	Mon,  9 Mar 2026 22:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1773090010; bh=M67aMFQ3kM0PIXZ25S5LPjVdi18KNuvvlfwu9BsjCsw=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Q2SqKYIpBgV77t7C1rstuBDW/BcJfUNzrwLbYvm1vR1akfYMZ8XHieQjAcw7nMNQi
	 psySiNgHfeombxlwzdSlGz9+XHTPIeFJwCXHg149iDgvEpfhaeBejAKc9nJAZV2kKc
	 Cek05uTRlqvxpjnaeFqAMiM6oP7l6knzZR9L9B1A=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4fV8Xn0Dwsz4np;
	Mon,  9 Mar 2026 22:00:08 +0100 (CET)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 22:00:08 +0100
Message-Id: <DGYJY8VKR9EK.1XPGZ34UPJ0B2@ik.me>
To: "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "ewan.chorynski@ik.me" <ewan.chorynski@ik.me>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
From: "Ewan Chorynski" <ewan.chorynski@ik.me>
X-Mailer: aerc 0.21.0
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
 <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
 <864ab8a502db872468d7b01e0adfff386d2187cc.camel@nvidia.com>
 <fa3c5390-aea2-45c2-89ef-05a64070a44b@nvidia.com>
In-Reply-To: <fa3c5390-aea2-45c2-89ef-05a64070a44b@nvidia.com>
Feedback-ID: :e8b2b16ffc205b0:ham:e74197f626dda86
X-Infomaniak-Routing: alpha

On Mon Mar 9, 2026 at 9:29 PM CET, John Hubbard wrote:
> On 3/9/26 1:18 PM, Timur Tabi wrote:
>> On Mon, 2026-03-09 at 13:04 -0700, John Hubbard wrote:
>>>
>>> I have that exact card available, so I'll give this a quick test and se=
e
>>> what's missing or wrong, now that Alex has pushed the entire Turing sup=
port
>>> set up to drm-rust-next.
>>=20
>> The TU117 is technically a mobile chip, and its VBIOS is different.  My =
initial version of the
>> Turing patches would "ignore" the problematic VBIOS sections, so perhaps=
 this changed.
>>=20
>
> No repro on the latest drm-rust-next branch:

I guess I may have an issue with my linux-firmware. I have no stable
right now so I can't download the latest one but I'll try
soon. On which commit on linux-firmware are you ?

>
> NovaCore 0000:e1:00.0: Probe Nova Core GPU driver.
> NovaCore 0000:e1:00.0: NVIDIA (Chipset: TU117, Architecture: Turing, Revi=
sion: a.1)
> NovaCore 0000:e1:00.0: Found BIOS image: size: 0xe600, type: Ok(PciAt), l=
ast: false
> NovaCore 0000:e1:00.0: Found BIOS image: size: 0x11000, type: Ok(Efi), la=
st: false
> NovaCore 0000:e1:00.0: Found BIOS image: size: 0xc200, type: Ok(FwSec), l=
ast: false
> NovaCore 0000:e1:00.0: Found BIOS image: size: 0x22400, type: Ok(FwSec), =
last: false
> NovaCore 0000:e1:00.0: Invalid signature for NpdeStruct: [1, 1, 66, 86]
> NovaCore 0000:e1:00.0: Invalid signature for NpdeStruct: [1, 1, 66, 86]
> NovaCore 0000:e1:00.0: Found BIOS image: size: 0x1a00, type: Ok(Nbsi), la=
st: true
> NovaCore 0000:e1:00.0: PmuLookupTableEntry desc: V2(
>     FalconUCodeDescV2 {
>         hdr: 3932673,
>         stored_size: 39968,
>         uncompressed_size: 39968,
>         virtual_entry: 0,
>         interface_offset: 224,
>         imem_phys_base: 0,
>         imem_load_size: 38912,
>         imem_virt_base: 0,
>         imem_sec_base: 1024,
>         imem_sec_size: 37888,
>         dmem_offset: 38912,
>         dmem_phys_base: 0,
>         dmem_load_size: 1056,
>         alt_imem_load_size: 38912,
>         alt_dmem_load_size: 26168,
>     },
> )
> NovaCore 0000:e1:00.0: FbLayout {
>     fb: 0x0..0x100000000,
>     vga_workspace: 0xfff00000..0x100000000,
>     frts: 0xffe00000..0xfff00000,
>     boot: 0xffdff000..0xffe00000,
>     elf: 0xfe2c0000..0xffdf4ea0,
>     wpr2_heap: 0xf7900000..0xfe200000,
>     wpr2: 0xf7800000..0xfff00000,
>     heap: 0xf7700000..0xf7800000,
>     vf_partition_count: 0x0,
> }
> NovaCore 0000:e1:00.0: WPR2: 0xffe00000-0xffee0000
> NovaCore 0000:e1:00.0: GPU instance built
> NovaCore 0000:e1:00.0: GSP RPC: send: seq# 0, function=3DGspSetSystemInfo=
, length=3D0x3f0
> NovaCore 0000:e1:00.0: GSP RPC: send: seq# 1, function=3DSetRegistry, len=
gth=3D0xc5
> NovaCore 0000:e1:00.0: GSP MBOX0: 0xffffe000, MBOX1: 0x0
> NovaCore 0000:e1:00.0: Using SEC2 to load and run the booter_load firmwar=
e...
> NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX10x0
> NovaCore 0000:e1:00.0: RISC-V active? true
> NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=3DOk(GspRunCpuS=
equencer), length=3D0x820
> NovaCore 0000:e1:00.0: Running CPU Sequencer commands
> NovaCore 0000:e1:00.0: CPU Sequencer commands completed successfully
> NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=3DOk(GspPostNoC=
at), length=3D0x50c
> NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=3DOk(GspPostNoC=
at), length=3D0x50c
> NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=3DOk(GspInitDon=
e), length=3D0x50
> NovaCore 0000:e1:00.0: GSP RPC: send: seq# 2, function=3DGetGspStaticInfo=
, length=3D0x6c8
> NovaCore 0000:e1:00.0: GSP RPC: receive: seq# 0, function=3DOk(GetGspStat=
icInfo), length=3D0x6c8
> NovaCore 0000:e1:00.0: GPU name: NVIDIA GeForce GTX 1650
>
>
>>>
>>>>
>>>> However nouveau does not probe either with this firmware so that's not
>>>> really this patchset fault.
>>=20
>> Now *that* is interesting.  Nouveau does generally work on TU117s.
>>=20
>
> thanks,

