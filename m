Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5242C2E03E4
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943056; cv=none; b=Vws+iBu4C155vR6XDdDnIqt0BDvBF88/nrlj0Pz73pIoYJWIR3jTBQ3aSpwip0hrR8AWJdWvWa7lgnWdn9PMyyll46giv2amk138I5fkS9AnNleTdC3TXHp8bXriKLEOjqgksb1KreboV1PkhguK7jxXUoynRQN0pX5+BXgIbtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943056; c=relaxed/simple;
	bh=M8uAG9ixHRcCTpHYvaaWAx/R8QVND+K/8ZZYTlL2/zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt/FxRZar9jCqNO/l5Omk5Fva4GxHpdmhKA7e11Y3OTIx85gzZPfcFA9AM0aV/H/+3tv5oWMhLsE/2ygu72x9tcaxMuyMo1OXVPYAUqTaVBMMr/BIVrLbzRB2ScYNq3M/vL/utpArK5Z/sFB0PvFOr8wDfQODmUi4k4lJXiyjy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info; spf=pass smtp.mailfrom=markoturk.info; dkim=pass (2048-bit key) header.d=markoturk-info.20230601.gappssmtp.com header.i=@markoturk-info.20230601.gappssmtp.com header.b=XuGjaS7J; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markoturk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=markoturk-info.20230601.gappssmtp.com header.i=@markoturk-info.20230601.gappssmtp.com header.b="XuGjaS7J"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so1049155a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 02:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=markoturk-info.20230601.gappssmtp.com; s=20230601; t=1762943053; x=1763547853; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ic0qfm/57y45gyiMD5PGLbyXiZfTfxHN/0+4CG80SRs=;
        b=XuGjaS7JPzAvvrtvXqK3iSIV8DqEHvlz3PLT2cu8UNWY+9UJvuma+jFogeHsOs5VBY
         KRI3khejk3UVSD79hCdJzmTWUDEbmbGXV9OAr1knPaccvcnQJsDGUFanIiopLSd24q2l
         EsCITOTz6YE50V23BwLt2SQTMV8XsqnPHZTpfP0JHLFfn0HhQ5MGmVtzQzkryEvesju+
         JG9CrOlv/qdIBM0dAi/EZOlQV/oBgPnnoObuPhNt9072WUCic0SIoOLp2f2AlMW8CKzT
         Zi6lmO7loWEef0NFqT1cZFSCIcAvMXIstHAV7LynxQ91kgp+x3Jb8vcR7TVW9aOAQqmr
         wMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943053; x=1763547853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ic0qfm/57y45gyiMD5PGLbyXiZfTfxHN/0+4CG80SRs=;
        b=UwDNGdQGnLHjOtjPOjnhpm6WY7B4PlT0eMr+2pd2bhxi379XBIBd4RuihXEeAwWbFH
         RlVkzMw69nUgxmfboYEa/31XBV877xXXHB4qS5Pb9RlF9dUXOltFLLpTTASVPXSDmkNU
         8xObQR9PgVWNRXlUFTYnQS3gr/oypk29+CCD7JGXmql6XLWl7nc3vHcJ3FPhykjFxgsS
         HF4wjHMrWqjjOWNgCbz1NNfuI8WyhxJcZ9R2Lfn4GGpO0TzvZLF7XDGXrCDxvXkUtUk3
         MHz301j18NfOaKVjDIgtuwtp+gNqUTM6+Y/z2ygTQRfcaWqegw1aK6cMU/McoW5Ou/F7
         Ma4w==
X-Forwarded-Encrypted: i=1; AJvYcCXzZrWUP49niMMKd0uq+Jv5y/OctzGcp+QHC6FWbqXaQSf22alUG1I96lXWsGURE+ToNZt/MLTLSh9muzXNJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq0Tej3n8ZxC2XqX/aBvMu2WYfe0Ze1HLYjWB+ifpGAlpXh7Mi
	vWv4sG2v0CssGOnQpBTveQ509qChFuHuA79s7PSqqiuS95crTzRoCwehZNAq5SNWLIk=
X-Gm-Gg: ASbGncuOGSNtAGuL6tpf4KMaIASRhSCCTQIma0x68l2ItmVn7+jYrNTwGAmshxXkiFF
	diBUMfwnqUAz7sHGT7fbtC6IXHsV8uRzGB7LBemRPTjebhpv28+lA0izdwvW2Hr+m04vhpJqfJW
	u2TURSCjqFm17DQpejYqOv9eEiMyNewoH3vswlBkEFHNjbVB4CQ415iqt4M3jRA7FrWsrIJnzoo
	SaZJxi5LkTiX+In5FL3TXNHTArhg4A2gsr6B9gNp4Bnj7KaYoFNvrW8tGpGSYX915GGG4K2Abxg
	5zuK/U8jOQ90vePY3xgCpxMjT+NwG78yIgA0H4zpo/64FW26t/e9KVPMvbkWJYY7SNGSf7UD1EA
	FExxviHmNESn5MHpI9ILAhUbLgcDPA7l3vMn1ShqJCPtysKGt8c7gzZ0uYLDAzkcwYuDWSLjTpR
	q51/j6LwcqhAYZ5kw=
X-Google-Smtp-Source: AGHT+IGPX2jqgfNlBcn8vUVVz5PZOrSa5PVRsmMn0VDGyjnwgM2lcTvxiPhRZ4VUOy1lTWfuw/2Gpg==
X-Received: by 2002:a17:907:9688:b0:b6d:5fc8:4a93 with SMTP id a640c23a62f3a-b7331a6f98emr226168466b.36.1762943052568;
        Wed, 12 Nov 2025 02:24:12 -0800 (PST)
Received: from vps.markoturk.info ([109.60.6.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9be009sm1541886566b.60.2025.11.12.02.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:24:11 -0800 (PST)
Date: Wed, 12 Nov 2025 11:24:10 +0100
From: Marko Turk <marko@markoturk.info>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, dakr@kernel.org,
	bhelgaas@google.com, kwilczynski@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] samples: rust: fix endianness issue in rust_driver_pci
Message-ID: <aRRgSsOFGlt76E7o@vps.markoturk.info>
References: <20251101214629.10718-1-mt@markoturk.info>
 <aRRJPZVkCv2i7kt2@vps.markoturk.info>
 <CANiq72kfy3RvCwxp7Y++fKTMrviP5CqC_Zts_NjtEtNCnpU3Mg@mail.gmail.com>
 <7f3bb267-7cff-45e1-84a7-15245cffd99f@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7f3bb267-7cff-45e1-84a7-15245cffd99f@de.bosch.com>

On Wed, Nov 12, 2025 at 11:16:40AM +0100, Dirk Behme wrote:
> On 12/11/2025 10:37, Miguel Ojeda wrote:
> > On Wed, Nov 12, 2025 at 9:47=E2=80=AFAM Marko Turk <mt@markoturk.info> =
wrote:
> > >=20
> > > On Sat, Nov 01, 2025 at 10:46:54PM +0100, Marko Turk wrote:
> > > > QEMU PCI test device specifies all registers as little endian. OFFS=
ET
> > > > register is converted properly, but the COUNT register is not.
> > > >=20
> > > > Apply the same conversion to the COUNT register also.
> > > >=20
> > > > Signed-off-by: Marko Turk <mt@markoturk.info>
> > > > Fixes: 685376d18e9a ("samples: rust: add Rust PCI sample driver")
> > >=20
> > > Can someone take a look?
> >=20
> > Your message was in my spam folder -- that may be affecting who saw it.
> >=20
> > > From https://www.qemu.org/docs/master/specs/pci-testdev.html:
> >=20
> >      "All registers are little endian."
> >=20
> > So this seems right. A couple tags:
> >=20
> > Cc: stable@vger.kernel.org
> > Link: https://www.qemu.org/docs/master/specs/pci-testdev.html
> >=20
> > Cc'ing Dirk, since he tested the sample originally.
>=20
>=20
> Hmm, I can't find the initial patch in my Inbox. Even
>=20
> https://lore.kernel.org/rust-for-linux/aRRJPZVkCv2i7kt2@vps.markoturk.inf=
o/
>=20
> doesn't seem to have it?

Initially I didn't send to rust-for-linux mailing list. It's here on lkml:
https://lore.kernel.org/lkml/20251101214629.10718-1-mt@markoturk.info/

Marko
