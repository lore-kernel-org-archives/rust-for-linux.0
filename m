Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A3D30F7F6
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049504; cv=none; b=ZXGvBC/sANxPvvF60Te+eeaiNyIv4gIu5I5e2i0zsEbh6ea3oa3zJFyHBM4wTgdhRR7mnKcuX8EUolvYfQxs0yKexZ69xxz3GAfDemRPnvuFBvKdXusYaJBwfK0Qg1+5dmrYhJLdlIuhTxUqXajilVjjfiLrDsTIMl8KVCnVXKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049504; c=relaxed/simple;
	bh=RyEgzxI8oPffOHkVVOIZhsjUU0Nu1XWYtTHFe1Aa1ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxehrS9zu9phqIl52dw98PdT+xv2aVKcu+IutL3zPe1ckw9iumIQTmJI9TbXYWJPXS0bqGVAM2DGcUy9qpsuz4AzZqBPXHQ6kxQk2vRP+xtUj02da3m43NluI9bTk3lGjiXTuHYYRwZinjYmcslGVEQJEDVOmc+IicCOMXRB7+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff3f/CoS; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff3f/CoS"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a32bf0248so3421126d6.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 01:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766049501; x=1766654301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrxnNnWxI4nS0YOrpBWcQANh5SNRLcQSO0aWER1QbrU=;
        b=ff3f/CoSZIyY8Yp+aNjFhuiGt8Qjx/bywKPCZPifz1HR7J6M4F9+mknbF2EBZUEnwr
         PNPPh/FfmW08lN/b4B8kkjikAyNh8NLW6/yOhPRl3Dvbw5Z0SoTfYjwvV8iCNWh6TB/4
         bhLSakQipGLykNwFbF1/ELIjNwtH/fL836We1unBdPypk8J0m768TwRJI7eU8Up2BOy8
         AFOmUf+23UaSmoBVOJfUgQLj9sXrEQnjPAdjP1MbtMCidCZ+rW2QY/qAzYRme+Z+hdLP
         7VGT5W82nnVHvXIBRwkVtc/zD3mqvkCGSjcQCh1CwSgVhhLBNWTeY92Os3gtOOSETlFb
         scTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766049501; x=1766654301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrxnNnWxI4nS0YOrpBWcQANh5SNRLcQSO0aWER1QbrU=;
        b=xMHlwONmPENcd9EbHzBDb8bPmVs5n+YLyzvoTzUZVk61Rj70tP5GaUwQF8dFs9Fime
         Ecc8481ctJD59gd0vf4JZcMzXzetuXcAHkSxOsWHDTOv8SXYcwA0EnWuPjHzP4sKFZnP
         EnCESN1lAdM7ZScY1560ZWDYaBpb2FCtBFEKDd/V14IIVR7Y2M4DDNjKhZ3IEVre8/E3
         QQBgatkGzxbGCFxEJJr7CzLd7kvB+mREPPPSOOHSlxBmOqEY6rpfyepnJgwQoaD5HN6m
         mGJ4nidHUx+UJSuMZ5jCO0/81qaOls8oziPhGO2FsVTI4lA/XxzBCCHH1KlBCsO3kqzi
         aWJg==
X-Forwarded-Encrypted: i=1; AJvYcCVK6nbRV/88N1KLNlBoliisaBLu/kpF1+QqfA2b+hkzzBniOxat25a9SQpSlc8Vo0kIhXstAPk9nDHkRFioFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuw5R+BJ22zyGABvUPmm2wOJqrRgcfyqThaafI6zfsH7Ali/qT
	rmMONNekHDl9baNRkByoJA2xcLNXx1qZz5F9rpZN9VP7Tnm4krl8DUph
X-Gm-Gg: AY/fxX47ODtKFTgifpuN53wTUDp4F/INm/VM8ERSW8MAVJUpSfbrJTcMpUbn4zARTW5
	8gWYf4uHyFnTrYXyet1q8eqfjDV3treQP5zf2lfg13qRa9Cy2TpTJydPUbn5oAsuXpi1WAJfUim
	WZMmzqK3QhawTiqc1vtaISCK4qloHy/i5HSOM7lJo6kD1FSj6pRbRbRXePTuEqWtcqU3gN5cs6E
	DlqFT3GNpTcBIgCk+GTyciRrYmHrxsrXz6oPjaKhHWOD4Z+KSHqTD9uAPdMXq663aL4711m4dpl
	OwFRMuWDBod0GFuyOgeBFQci4qIVyyem3AuQKACGJwZRvaidZpxbz7afwqG1ykJ8iyweStcn1E+
	wKFayIORrjTOmJl8P+giR4V56r4FYOqKYyPUA6VxAygsWj9k0pYtDW7dzdh+44xaZeQtGvLR5j/
	oqOPKXK+jNr3fp53KR7TwMI/emZGdejXFrtDo7zA6qbXi3O/agOP4vAblPN9sbmqBwpNn1Z9z74
	Qf4/GSbHLrqHeo=
X-Google-Smtp-Source: AGHT+IGcCSZ2GTde4aBCYX1t8a7toNqTh87um5AM7sqyimiK1IjG5xXwzjeXHFVeUXoPi5AeBf7daw==
X-Received: by 2002:a05:6214:3f88:b0:888:f03f:3d60 with SMTP id 6a1803df08f44-888f03f3fd4mr298428876d6.23.1766049500611;
        Thu, 18 Dec 2025 01:18:20 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88c6089a7c3sm13752156d6.27.2025.12.18.01.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:18:20 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 93062F4007D;
	Thu, 18 Dec 2025 04:18:19 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 18 Dec 2025 04:18:19 -0500
X-ME-Sender: <xms:28ZDaYZEfJvWf-SbMYzrwGR3XiBc9nchrwXFhKQR8GJSSPC5Ar8EDQ>
    <xme:28ZDaQ3X24tbFZCKSuy5BC9I-mJ6F97xHygLeYsX0Q24WXatFCtqulZ7k7xDXldMD
    w8thToUOyrSqYEOYVh9FeLhsV3yHiaH4wNjMKNGLA9kWLxJNQIW5A>
X-ME-Received: <xmr:28ZDaS76HLTNf9hsmzSKKCFzqme6tSv1wQBubRlahd7SzJkjvySDN_JZ4AwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeghedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhopegr
    rdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhi
    hhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:28ZDaURyyKmDQ4rzO87pKe_8fgOq1CvxIA38rZW58_FyV787JuMOoA>
    <xmx:28ZDaToXdtq1vvHJfqWGgCi5IrxlFpN9arJc7JnP0gCVwOlnuJ_8BA>
    <xmx:28ZDaW8x_MNLpH_gvIPSydRn1Oxq4VIuot4c-gyvDK1ojt2oOdljwQ>
    <xmx:28ZDaYMv8CQExp0AUKVWhGPIMDC66fwr1u9bQ-Paapulqomq_rU8JQ>
    <xmx:28ZDaQlMxy_vd7Y9jFbADfvmvXTPmU_Nc3DIq04M5dpRvhc5Lkr_GE4M>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 04:18:18 -0500 (EST)
Date: Thu, 18 Dec 2025 18:18:17 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	acourbot@nvidia.com, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org, Brian Cain <bcain@kernel.org>,
	linux-hexagon@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 0/4] rust: Add i8/i16 atomic xchg helpers
Message-ID: <aUPG2Q_sSPDnlQ0G@tardis-2.local>
References: <20251217213742.639812-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217213742.639812-1-fujita.tomonori@gmail.com>

[Cc parisc, sparc32, arc and hexagon]

On Thu, Dec 18, 2025 at 06:37:38AM +0900, FUJITA Tomonori wrote:
> This adds atomic xchg helpers with full, acquire, release, and relaxed
> orderings in preparation for i8/i16 atomic xchg support.
> 
> The architectures supporting Rust, implement atomic xchg families
> using architecture-specific instructions. So the helpers just call
> them.
> 
> Note that the architectures that support Rust handle xchg differently:
> 
> - arm64 and riscv support xchg with all the orderings.
> 
> - x86_64 and loongarch support only full-ordering xchg. They calls the
>   full-ordering xchg for any orderings.
> 
> - arm v7 supports only relaxed-odering xchg. It uses __atomic_op_
>  macros to add barriers properly.
> 

Thanks for the work! And please do Cc linux-arch next time when doing
architecture-related changes. We would get more experts to take a look.

I think the current implementation expects that xchg() work with normal
store/load, and that requires ARCH_SUPPORTS_ATOMIC_RMW. So could you add
a comment saying the current implementation only support
ARCH_SUPPORTS_ATOMIC_RMW architectures? And when you wire up the rust
helpers, I think using #[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)] is a good
idea. This will at least let the !ARCH_SUPPORTS_ATOMIC_RMW archs know
that something is missing here.

Regards,
Boqun

> FUJITA Tomonori (4):
>   rust: helpers: Add i8/i16 atomic xchg helpers
>   rust: helpers: Add i8/i16 atomic xchg_acquire helpers
>   rust: helpers: Add i8/i16 atomic xchg_release helpers
>   rust: helpers: Add i8/i16 atomic xchg_relaxed helpers
> 
>  rust/helpers/atomic_ext.c | 41 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> 
> base-commit: 02c5c8c11bbd34cdd9c566dd4ecca48995c09621
> -- 
> 2.43.0
> 
