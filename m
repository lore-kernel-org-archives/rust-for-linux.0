Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99D92D979F
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 01:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767057267; cv=none; b=pXbAmsOBOfVmCXllRRXOgtV7w3iyudk4QF7jbV1MK4BeG1KPiiv7p1Z0Gk0IwZR/JXTbu2oeuAigGYl31iBOLEBjkNSImDbzI96YwF9qVxX6QKKR/YySQA3KfuXrbNodNgPhtryt4w6s7nD9+d5Q59/W5llBr6xwN4NZgeXw2qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767057267; c=relaxed/simple;
	bh=Q8HrMOBevQUpnO/GCmv6B8cLelHI6Acj+1ShFOhXpvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcWGLBTfI9pLIhHh7lMZmN8ZVvxvcXTLbexcB9q6xwIfBLeZ8nkm2h9+BqWHV7TR4kW6UU5ySRQWNyezKaK9NfrnOq6mYRCyj2rizte5VJLPV1tzwpdyvJShSOaR/Et26g+2F9iwLf8h10rkrabsZJx57kWV7pVyY+npKRyYdmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlDfUdA/; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlDfUdA/"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso105497171cf.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 17:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767057264; x=1767662064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0W/EDw4kUB8T6ntkWeZ4jGeLwTy5P5tI2atkfqX3cg=;
        b=IlDfUdA/ip3vDZMhSzuMQ+l3uB8vjfCqokLFLaRDrkJVKpHvgqrMWB4we4FtTlbE76
         sS/ob6eW+FDFOU2Ie24Ml4vYaykw81EYzO2JEr5w9MOHiTf5MJhOtiKcBlIWKQExoTRO
         /r0ZDwPTBLlerbWnK1lxQGbusDXZ3QDfJf/BD9XyBmiSRPebZE1JtmoZwWS83q9xiSR+
         XafvCPXqt/fBcW2RmLFZzCM70999D02Fokx1U1K91e3ERCvJIhKSlCOK/4TUsx5S/BUA
         1Hc2CD499hn8MmlAA3rrM8q05wnblJw4G5WA3BsrGYNVmot9+66/aKAQ4+ysmhtTg+0y
         02aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767057264; x=1767662064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0W/EDw4kUB8T6ntkWeZ4jGeLwTy5P5tI2atkfqX3cg=;
        b=mZvDgBiAFU4taPvBymzMKH066n94LILN7NRwCUKD4vxqooKaS2lOrQwjBgTcYtc5Hw
         UkITW7RgRjU1dM3QcOWWO3hAA72w+Dojl8ow+k+tY6yP5aJqtp3ap4TPTHJIqeaWIFFr
         imU1bHZHoURXr9/EYTURBYnWLP9BFKWsT3YYud03FmCf65yvBPKJzVZxyuzxBX2KiOe/
         mbY/IhWiHw3nCRqrdrtKFMNysy4xzAd5AIdEYuHNAdsAdqqPKnrNlbfQx19y6vRsU5CA
         966FGmAYo9pI9rvoyTG8dc7dHqoIOaB+NyMva/CLD3WjAeaK56UWCrXt6n9cglOAPv+4
         MHJw==
X-Forwarded-Encrypted: i=1; AJvYcCUppE5dy3UluPr+zFSGhsMH9IICQ/bnV6tGr1dcWvAyF8NsldkM56RuAHhBb984+d5kQvIsy3B4iomijbWt+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhEocBqWhXPPnRwqKw1Fmxz/spmCHLrs+J+iFRHjgUBroQWTi0
	biGswn9XtvQzijwElkWp183n7/aYczsWSFBYtfpTzCS0bgCE4aIMkq2X
X-Gm-Gg: AY/fxX4sGcmWiZoF54XjYVAhGte3lpDL44oEhwCTq3jJpBR1PeZKbWtponaXCtz2EDy
	XjLLp2qmX6YDvlEehOhdmjoyCAbPhDHgHbdVILIZ/fxE6I/17t65yeV5XssbhzmH26G5GqjwvpI
	JWi3tUGTKArjNjavKd4u3zPp4L9gmXr2ciu4X2k19Qph0Nwnu/gcmHazJTNEStsmq+nbp0yBf6g
	tSdRptNjjifItSlOy6lmzLuyDcpMnSvsXAt1dPutIFC3d8gXIuAMYn7JfyIF+Mnc9wGBYbI0hDr
	R/52GbyGHsQHEf/jrDBga4aHCHWgDBFhBP5r9J9tnlVowfR1Z65YC/4PT9pVIhY1tmJoNTpuq6G
	GO3weeePfQoyyVVPLNrixdieqpSVQ+v9OhMt/Pe+mjltAa01QSVo5KYZNI/lIWuRj5Nuquvym46
	uj7B80pe7mHKFgl7+5/R9EUbYl+vjw9hmtOTjAQR+Xa+JMgJeu1aVHDsyMQx4sUfZuF+Hy9xTlr
	B+ALHelk7+gSxuCEbO8v8W8yA==
X-Google-Smtp-Source: AGHT+IHpuGdhRZ3CbF3fVzRnkQZfBHeV8M6APgRZyJsGV4w5CuU3pCGiToOutAk3blctjF9cUdIvOA==
X-Received: by 2002:a05:622a:4c1b:b0:4ee:49b8:fb4f with SMTP id d75a77b69052e-4f4abdb326emr471279661cf.71.1767057264458;
        Mon, 29 Dec 2025 17:14:24 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d96ce4e23sm274953746d6.19.2025.12.29.17.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 17:14:24 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8B11EF4006C;
	Mon, 29 Dec 2025 20:14:23 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 29 Dec 2025 20:14:23 -0500
X-ME-Sender: <xms:bydTafcnEpZ4mT23c8rblSiMXUL5zTzXgTDVFiEjksZuBA3Rz4lccw>
    <xme:bydTabuNxKTCA0EdVX8M8ZSx1vfK6VFAQmhPn7dQi7jpNMAHds2IyV3Y5U50Vknuj
    KX2GrrAhiwhrZSRAqD_bPHfK2E1NTtDaWomGvwjxpqmbunB5brW-A>
X-ME-Received: <xmr:bydTaWhlVCrCP9KikMUDCjLvek02lah8MXT3nbM29RUCGKPRiS4OPjAaFGZ9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejkeeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonh
    horhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhn
    vghtpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    drhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhih
    hhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhoth
    honhhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrh
    hoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:bydTaTvplJKRXWW28iSLhL7bQRiTZ7_FL0cnmoHGJjyw8n3ioYl9Aw>
    <xmx:bydTaR8zRNlkJHh8FTBu6DAnK0f2I2Xwm0fjqslbXBtRRKyLzUb90g>
    <xmx:bydTaZaRUWgc_nbvM8EoDyZ8L99rJsIyRfSL0c5d3j-TrZRpHkKO6g>
    <xmx:bydTaXoOR8XovlLeknsUSKt7Gb5S0aIJy9QE1cXgB9ujlKpBdy3bDw>
    <xmx:bydTaW0NOyvVzF9E2VwDR_M-4CVivZzClVzxkUppFlsG-WSrJldPNelY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 20:14:22 -0500 (EST)
Date: Tue, 30 Dec 2025 09:14:19 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gary@garyguo.net, ojeda@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] rust: Add i8/i16 atomic xchg helpers
Message-ID: <aVMna3OX5gIZJKCV@tardis-2.local>
References: <20251223124639.7771082d.gary@garyguo.net>
 <20251225.095655.275822477142372376.fujita.tomonori@gmail.com>
 <aU-JcvYaOYznqD-M@tardis-2.local>
 <20251227.181717.1843883205283099818.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227.181717.1843883205283099818.fujita.tomonori@gmail.com>

On Sat, Dec 27, 2025 at 06:17:17PM +0900, FUJITA Tomonori wrote:
> On Sat, 27 Dec 2025 15:23:30 +0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Thu, Dec 25, 2025 at 09:56:55AM +0900, FUJITA Tomonori wrote:
> > [...]
> >> >> The architectures supporting Rust, implement atomic xchg families
> >> >> using architecture-specific instructions. They work for i8/i16 too so
> >> >> the helpers just call them.
> >> >> 
> >> >> Tested on QEMU (86_64, arm64, riscv, loongarch, and armv7).
> >> >> 
> >> >> Note the architectures that support Rust handle xchg differently:
> >> >> 
> >> >> - arm64 and riscv support xchg with all the orderings.
> >> >> 
> >> >> - x86_64 and loongarch support only full-ordering xchg. They calls the
> >> >>   full-ordering xchg for any orderings.
> >> > 
> >> > Maybe it's just that I'm reading this differently, but I think this is a
> >> > bit confusing, as if there's an optimisation opportunity.
> >> > 
> >> > x86 is TSO, so even a relaxed xchg is a full xchg. So in this sense x86
> >> > has implemented all orderings.
> >> 
> >> For x86_64, I agree that the wording is confusing. xchg always implies
> >> lock so different memory orderings all map to the same full-ordered
> >> xchg there.
> >> 
> > 
> > I feel a bit confusing as well about the need of mentioning the exact
> > ordering of these primitives on each arch. In my opinion, as long as
> > rust_helper_xchg_X() is mapped to xchg_X() in C, then it's clear that
> > they have the ordering of the corresponding C APIs. But I keep it as it
> > is for now, I may remove them from the commit logs later after I
> > re-think about this.
> 
> Given the current implementation, I agree that the ordering
> explanation is redundant.
> 
> When I started working on this, I initially thought we would need
> architecture-specific ifdefs to select the appropriate implementation
> for each ordering, rather than having a straightforward per-ordering
> mapping like this. That's why I added the explanation about how xchg
> is handled on each architecture.
> 

I will remove those ordering explanation and I will also apply other
changes to the xchg/cmpxchg helpers: we should use xchg() and
try_cmpxchg() instead of raw_xchg() and raw_try_cmpxchg() because we
want to keep the KCSan instrumentation for those helpers.

Regards,
Boqun

> 
> > Thank you all! Applied in rust-sync:
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ rust-sync
> 
> Thanks a lot!
> 
