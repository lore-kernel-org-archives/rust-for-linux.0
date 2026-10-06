Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7943CF032
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Oct 2026 21:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323063; cv=none; b=SUCCw+31PawyXWGdjQoYaOTWusfcVEV5yDIPeg1ux5+/559L2QnpMrQtAJWIF+jGGasKYuPWqjIPXEoz1RIFW5RoW6g+Afotwa/MWC4V0aUT7iFHYWS0J4rIOQwmoGdCb00JJwkZzLAMjTdm2XLTI9TLHj4dByhgeK+x4eHCujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323063; c=relaxed/simple;
	bh=aUosEal3MZjZMLAJNgDR8ZADgwQLa9nKKm8X24NMJAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZB/fULFjsIM+hfcGDyoEc2vCp7nOpM5/5EgIA5VMJoayXyoMoWuIwrbsXRfcrzVla6bJcdAmFw7uBT8nQjI33MYEM0IkZGx6A7+jhKxCWf9xOma3WR6mUMGGDKyKRcuS7pO/uTNr9Bh1XyABDrRDJ6rNPvns+moGMH9RFvc7Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mJaWCSpA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mJaWCSpA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db33db4de9so21525ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Oct 2026 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791323061; x=1791927861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G2/CnIgDJ02uU7V1vOgIKyg9HQ6J0Mb5GXmpvN71ZxM=;
        b=mJaWCSpAdHXzbJAkiOszFqHRp8w41thr5nISBt5H/H0tWot5Q0AbP+NRGrvdYKGUaJ
         yo/vFof/om15gZqIlnbcbcRS4adRoE1XbCBzky0d4DT2Bm8ST8j5JGhvWL7S7rhFNHBL
         4T4wmhCaEzGgG0GuqMppv0Vi6Vog2zWiBePho8d3l02uC7SIljrnTOGUuuaMH91fV1P1
         AdYFhEmuZ8ELiOVYVvvjW39vOnVxqFfO6Tzsl27MKd6hwXb7xHYSAaa2DLz5Yh2ReiMz
         NM0PEurSoh7L0tMkztdrivg2OTpr3D2CsLJhSNEiPgxkVNDzbYqSwg6yz+d1Lbx3wc8C
         iazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791323061; x=1791927861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2/CnIgDJ02uU7V1vOgIKyg9HQ6J0Mb5GXmpvN71ZxM=;
        b=OUnEcBltuBLHARCsF3YpWgp7E8cfR9whWH9D/0UZNPFYJ14j3p1kr1ZY2OyLV04iC/
         3YG5en2jB7BC2N7iysp0joO4MnpMc1wnTgs3VDtFdYZJzljUcR437qbarsIXeVSb/1Ov
         m8Pho4OTChczUxaK2Vq7t6VGurvxxEkxU9+RW1yg9fPrCRJVuPOvGxJp3SqQeaIxN2e4
         yVa9d4y+3/nO1U8+fahYvzPLLpEZIArVyiVL8Fdza+g7FJh8N6jeigGfolB1dZYHhjZg
         N9mCVpwDsK/+hbK+Bb9zuzS0AWdISybuIhaSC5Fc2m8HoNXvoBPGriorgz2PdiHZ3cx0
         W1XQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK+8LaUg4OHxSyX6qiBoRxWfdq63pUblXVToAMZyaOyNXW1C1sRs1sD77SmLxvCDf5RTmzZsZkOzkH25cqyA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5a4yo9OVR2Xw4uQXiXdhuxfV1a9ji+D4gtVK1xoV7G/QAjjJA
	QfdxXxdXZbf3o36qHZrmwmn7fGhKkSOEcxDEdpJ9GidPFcRoMQ28/lZGpmvRZ36JXQ==
X-Gm-Gg: AYBFou2jM39jqIceu0SiJoXf8L3usTJtDxNMelVTTzo1tyaQqoIAzQXzK8XAbjL9jyY
	g2XEL6sedLLD6yc97DgKXGuKBqvJxrJAysKz7f6xutEErpaB4W6bMYN3y4dikNFIW159EKynztf
	+3NGLXI747VGw6pMSIPrLRunVsJ2txoVs9fp4uW0I4IvmXs9ZJfnTXB5hj2oH++kGZ8f7X4bVLE
	UlKsEKjH74rkC7TcwRhdP/uYp33ZnoXpvpA6vpNKnueQFXQo8PvIFdYXWQXWVxuC+3nLgl2FWpi
	D8IuwWI+Nze2r/Z0yr7oQLU4xknxSOyV2333byeCV1NT3LNazZrx+E1uMGSd3UnCy9VzuSnaV4J
	HLCpDtwtuT5pN0teSURBu/r4SXrZQLNdIP4/8s/3nKOk/KsGSa9zFvzQN2zNu8DWfNd/Se4blx/
	lkZWAIe22dYVRmOncp96IYrGjUfjxe52w+QOtUgl5lpqJnzdZuRzLcQg+HkRwPP98kbLzLnL8Q0
	J8w4adgLhLnyffh29rBOAjG5EWyLzDUuZwceeQ8MZGHz9Yp67mw8bs0+YdHChwc1zvS59fUwVXp
	jmMj5F2TFoW3AMKbRmLXNR/IyL0WOSH1DIys23iFKQJnmoA=
X-Received: by 2002:a17:902:ebc5:b0:2d5:db3d:1a44 with SMTP id d9443c01a7336-2e5ccf0268bmr6121035ad.17.1791323060723;
        Tue, 06 Oct 2026 14:44:20 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd09d215b96sm577100a12.0.2026.10.06.14.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:44:19 -0700 (PDT)
Date: Tue, 6 Oct 2026 21:44:12 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Ke Sun <sunke@kylinos.cn>, Dirk Behme <dirk.behme@de.bosch.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	"open list:RUST" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: fmt: drop the "0x" prefix from {:p} to match %p
Message-ID: <asVrrG0P_QGf3u_M@google.com>
References: <20261006183857.396710-1-cmllamas@google.com>
 <DLY2A3MDYYTH.2IXSHIKU7SJEH@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLY2A3MDYYTH.2IXSHIKU7SJEH@garyguo.net>

On Tue, Oct 06, 2026 at 11:09:09PM +0200, Gary Guo wrote:
> On Tue Oct 6, 2026 at 8:38 PM CEST, Carlos Llamas wrote:
> > Commit 643a7c306b8c ("rust: fmt: route {:p} through HashedPtr to prevent
> > address leaks") made {:p} go through the kernel's %p so that pointers
> > are hashed by default. However, it formats them with %#0*p, where the
> > '#' flag prepends a '0x' prefix that the plain %p does not produce in C.
> > Thus the same pointer is printed differently from C and from Rust:
> >
> >     C     %p      00000000e8efa736
> >     Rust  {:p}  0x00000000e8efa736
> >
> > The prefix is a leftover from 'core::fmt::Pointer', which always adds
> > one. However, doing so deviates from the %p format documented in
> > Documentation/core-api/printk-formats.rst and makes it harder to
> > correlate the same pointer across C and Rust messages.
> >
> > Format the pointer with '%0*p' instead and adjust the default field
> > width accordingly, so that {:p} produces exactly the same output as
> > plain %p which is zero-padded to the width of a pointer and without any
> > prefix, both for hashed pointers and for real addresses under
> > 'no_hash_pointers'. Update the KUnit test expectations to match.
> >
> > Note this patch focuses only on fixing the '{:p}' prefix to match %p.
> > The '#' flag remains ignored as before, so the '{:#p}' equivalent to
> > %#p should be sent as a follow up patch.
> >
> > Fixes: 643a7c306b8c ("rust: fmt: route {:p} through HashedPtr to prevent address leaks")
> 
> Rust libcore's `:p` also adds the 0x, so I don't consider this a fix.
> This will be an intentional behaviour divergence from Rust format specifier, so
> this fact need to be mentioned explicitly.

I see. I was afraid this was going to be the case. Then, I don't know if
:p in the kernel should follow %p or std:fmt. It diverges either way.
For context, I ran into this issue because log parsing broke in binder
when I started using :p due to the unexpected prefix.

I suppose one can always open code a %p equivalent as needed too but
perhaps matching the %p behavior make more sense? I dunno, wdyt?

--
Carlos Llamas
