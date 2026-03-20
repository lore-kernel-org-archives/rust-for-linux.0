Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E36283FE3;
	Fri, 20 Mar 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774002477; cv=none; b=P7aU5YEA3iqqupHmk9QEMpbu/aOCxUwTOuIlk/27jSUfF0wPBP6HPOSI/ZyDK7CoBlCm02oximKRKi0uWYeQDLW612Do0KxXNtciWnNkpQyT6jAhYKwCV15n62BserCkQ6BgjyNe/tksaxcTW+o89xhKPu6kHXcbO4D9D2+Nzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774002477; c=relaxed/simple;
	bh=XSAyU7TMTMguRqkfdEZfE6pMX2aIMzOlTSw116UOUbU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=m+bwABYBpyq1qRf8NBTmke0ZaZS2y4XF/hyVh35OKnNW37GDqWfui6aDTlYPeuJdYX2/KPCKET/1rO88EG2BGfK+wXwdgxYMJ17fbz87lnEezZpiZ47w4evDNwKxqEhDh0zyxVGmGCGp2d1DtPyXx8deHydDCZ2HHGmUbX6igh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=AsT/Ef2I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oTMHduaL; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="AsT/Ef2I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oTMHduaL"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 17072140018D;
	Fri, 20 Mar 2026 06:27:54 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Fri, 20 Mar 2026 06:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774002474;
	 x=1774088874; bh=EjvHEYPqc3AwbusUPql7x41ZM6H0hNY6PSUMajNPbPE=; b=
	AsT/Ef2IPYop3+7Rx714gt6b2p9toozNL+JB1UV0gmnZPH89L1vICWGsot1NIEly
	HpsOwVassd2l/ba8Qx6Oaa6EuMNqfF1A/yNcizEoq/TDhHVCaK7EAt7Q8/dNsp01
	Z9NWgAsyp3FekNJ8KkhtuAIkV7Ot7C+bznh9XdYMdQxlL/M87ERHXFzMgCwlFmPp
	p7PYNLisQTXHNo/sn8UEsfKULvLWhHEBuOoEahfc/iCSDMqWALfOToYyqo8Q6SLe
	HgR0ijVTfZhmlIBhoDTA3BQXy/WJuHJyavxEU0klJ9RiIOeM6hFm5MjuswP/QttG
	+NXTt2ge4sK1bHsDtksusA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774002474; x=
	1774088874; bh=EjvHEYPqc3AwbusUPql7x41ZM6H0hNY6PSUMajNPbPE=; b=o
	TMHduaLPssQYQ3dQqvthYWh9s36wQ12GaDnGDZxkiSH1HMUxAd53phqdzkaWPtDI
	5nPKC/Vbk9rLeherwgB3/5lF7yPo0RQ2CdGAz4U82GIUNcvM/tmyh0sTnVF9k+57
	94QN27olOKAWfsCqYDOwpkJivS3qv//6lmi3rB/236M0lp25KXkRkXTqag1UhEEs
	t7VbAG6gPssRpQDvvpD/9v3YpskbDg4pYjgoP46BDgTiKhhyBeOlXppoflpnYfey
	UCtlyZcP7IW6cg1jiwdF4xmMSCZk0LEKVLhV6Q1gW79MgPD2gXzwLmtT/hbroTLO
	XcgAPTOq/4kf3jNyBFZGA==
X-ME-Sender: <xms:KSG9aV0b4g4RQB1uYYod0im-XM_WkbtUtms0ttCjAwcmRz6CkJDGyA>
    <xme:KSG9aW4IJjZG2wcjBsVmLv1IlWwbTVFjPvDheh510l9jMGF3k-NIm7JA-NITrCfv8
    KPqVbNOP4D2BLHyTtr1ZRikiBqwhX2UE2jmjlrQCYx25Rw3QpKYQuAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfffgrvhhi
    ugcutfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqne
    cuggftrfgrthhtvghrnhepgfeftddvgefgtdejvdefvddutefgvdeiuefgudffkeelhfek
    veegieehtddvueegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopedv
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrd
    gthhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegr
    ihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:KSG9aWq67153snms-L1bMfCMCv5zSpVoJhSj7nemU78pcsQSKmRdPA>
    <xmx:KSG9aWSiDqn_wpn3V8XSp2hn0yZoA4eKGMa3uHSrYygKAXR9x6qZhA>
    <xmx:KSG9afThEvRPDex-rHN3aPxsiA_KDyIsqLnfCYq8YnKong2u8XGUtQ>
    <xmx:KSG9acUTDY6RCsBRA8luKfus7v8PmMY2MfkNhZYXLy8ypdBtLRr4Pg>
    <xmx:KiG9aVHsmYIG2BSMjyjkY-vVOwSV-YgIgpKe7khW2pek-Z6GtcJeApo8>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6391F15C008F; Fri, 20 Mar 2026 06:27:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AtQVIY85vbR-
Date: Fri, 20 Mar 2026 11:27:32 +0100
From: "David Rheinsberg" <david@readahead.eu>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>,
 "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Message-Id: <c7e8c581-5072-4184-ba75-783233bd52fc@app.fastmail.com>
In-Reply-To: 
 <CAH5fLgh1WMaUpLGTGpWiVjrnTtgFt=hhoutQqxV5DOtrGVsfkA@mail.gmail.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com>
 <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
 <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com>
 <CAH5fLggFsjciKKxv7_k6tXqL=_8JrgAVWq-+xVH1PkGOew44KA@mail.gmail.com>
 <6163dea3-fa75-4403-929e-8ba9ba22eab5@app.fastmail.com>
 <CAH5fLgh1WMaUpLGTGpWiVjrnTtgFt=hhoutQqxV5DOtrGVsfkA@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alice!

On Fri, Mar 20, 2026, at 10:47 AM, Alice Ryhl wrote:
> On Fri, Mar 20, 2026 at 10:27=E2=80=AFAM David Rheinsberg <david@reada=
head.eu> wrote:
>> Kinda off-topic: why doesn't `Alignment` store a u8 that represents t=
he exponent, rather than the power? The left-shift when needing the powe=
r should be effectively free, shouldn't it? It would avoid all the unsaf=
ety in the impl.
>
> For one, it mirrors the design of the unstable stdlib Alignment type.
> For another, it'd make Alignment::of and similar a pain to implement.

Fair enough!

>> Do you need this helper then at all? I assume it is added because `Al=
ignable` cannot be used in const. But it hard-codes `usize` as type, yet=
 does not reflect that in the name. It comes down to which one is more r=
eadable, I guess:
>>
>>     const_align_up(value, align)
>> vs
>>     value.checked_next_multiple_of(align.as_usize())
>>
>> Meh, I don't mind too much. Just wanted to point out that the standar=
d library provides this exactly.
>
> The stdlib implementation probably invokes an expensive division
> operation in place of our bitwise-and operation when the argument is
> not a compile-time constant value.

Fortunately, it does not! Yay! `Alignment::as_nonzero()` has enough anno=
tations to produce competitive assembly. If you care, see my example on =
x86_64 below, which uses:

align_up1: v.checked_next_multiple_of(align.as_nonzero())
align_up2: const_align_up(v, align)

Thanks
David


align_up1:
        lea     rax, [rsi - 1]
        and     rax, rdi
        sub     rsi, rax
        lea     rdx, [rsi + rdi]
        cmp     rdx, rdi
        setae   cl
        test    rax, rax
        sete    al
        cmove   rdx, rdi
        or      al, cl
        movzx   eax, al
        ret

align_up2:
        lea     rdx, [rdi + rsi]
        dec     rdx
        xor     eax, eax
        cmp     rdx, rdi
        setae   al
        neg     rsi
        and     rdx, rsi
        ret
