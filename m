Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698769;
	b=0VvR745Msdn2HB+OqKHVu7qXT3Xf3YPsKFFYBPfUx931oGSjD0Ks3aVn7dwxsNNiaao3
	 uSw/LKHCJ1xzST2+MlA+0/Kmcu6qfbpsHTHKOu+MdMJc6HhMfmi06OtYoFJ0X+QcTK3SA
	 xi2htk3MWYFsZmSYIXnUOPEy92MUqpfNq5QmFTWB6SkF1FTQwOkQ0jdxBD1+BUttaWvXS
	 thmBq4BKqT88ofbmYSv96d+U8MrUYjEfIPqTAazE5hGCxkYqcslr3BxtRaAP95FdGtBT0
	 wRjVsjiWoR+8+vL+xL7ERTPQg/jJei4GZ5dRyEaCc4ZseEabPwdGb1L7iTHTN7YN+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698769;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=OnJjS8Dd9kV1QuRv0ju2mVkDrGbSfyDN4nVRbAhdHVw=;
	b=ic430kTf9g4nfLMj9RiXjbLzV6D9GF89J3af3M/FmH/5ZUhSL6A2i2T8bTbUn/M3eH/Z
	 1S6LOwEONx5CtUwYsnl1nhUdHZmGmLm6JI7/eaNjLMDUF/yoVxdJ54E/EQHYBoQDpc8Eb
	 XX+9RMD8UR8ZNce+yDbAr/3TOfRZ6rSzz/5Ur+Lg5Yc8fCcIvqKCj8JIc0sWeQh1FLXRv
	 0taF5p87YkDEcIf13YGCG+Qg+5kWNQxh2cfObjuxnS+L6ZTJiezg8hQB1jjfjE7HZKwCf
	 H5189WZ/YW6DKslwO88DrsWoGXV9oQp7rwk706J5KZCZAps6oViAYaZvVNqq3DIXjcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=urqAoxd+;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2F6606A329
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=urqAoxd+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OnJjS8Dd9kV1QuRv0ju2mVkDrGbSfyDN4nVRbAhdHVw=;
	t=1793698768; x=1794908368; b=urqAoxd+qZ+SiGxwEAlvXUJf4UI11Uc3L5BpmQjb4VcL1VT
	H0DxY6FVyoLjpobwJXBMOEzTbZFG5MHPb+/M6Z3ztq5hm1HTSKtD/3QgYIKod4nNn3TfCREbACGJV
	Kr2QgF7w5MDIrH89r1n1GELsV30TQJa6/E0nXDfll+W4HnrkYTiibvVM7mdFW44K+llErt0vFc8B9
	wHfnP/mrkzEc6FtJMxg9E/V9LOsAGx7tC3DRaPiRL+rQjGM6WAblNcGLC3LWKeI2hiLAVWGs1SBZx
	B0PlR57+/x3leoXEVrgiDBTAUvDUU/sYwCAw7k2aSQRk3h2Wj0cpYeDrhic1qFpA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xOAz2-00000003EMq-39l8;
	Tue, 03 Nov 2026 10:39:12 +0100
Message-ID: <0730c9d467af3897a547860d036a5591cb40905b.camel@sipsolutions.net>
Subject: Re: [PATCH v1] rust: arch/um: Fix loading Rust modules
From: Johannes Berg <johannes@sipsolutions.net>
To: FUJITA Tomonori <tomo@flapping.org>, richard@nod.at, 
	anton.ivanov@cambridgegreys.com
Cc: ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, 	daniel.almeida@collabora.com, david@davidgow.net,
 gary@garyguo.net, 	linux-um@lists.infradead.org, lossin@kernel.org,
 tamird@kernel.org, 	tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, 	fujita.tomonori@gmail.com
Date: Tue, 03 Nov 2026 10:39:11 +0100
In-Reply-To: <20261103.180207.1243555897796693771.tomo@flapping.org>
References: <20261004121230.373216-1-tomo@flapping.org>
	 <20261103.180207.1243555897796693771.tomo@flapping.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2026-11-03 at 18:02 +0900, FUJITA Tomonori wrote:
> >=20
> > diff --git a/arch/um/Makefile b/arch/um/Makefile
> > index 937639edc295..c4a99073f014 100644
> > --- a/arch/um/Makefile
> > +++ b/arch/um/Makefile
> > @@ -62,8 +62,6 @@ KBUILD_CFLAGS +=3D $(CFLAGS) $(CFLAGS-y) -D__arch_um_=
_ \
> > =C2=A0=C2=A0	-Din6addr_any=3Dkernel_in6addr_any -Dstrrchr=3Dkernel_strr=
chr \
> > =C2=A0=C2=A0	-D__close_range=3Dkernel__close_range
> > =C2=A0=20
> > -KBUILD_RUSTFLAGS +=3D -Crelocation-model=3Dpie
> > -
> > =C2=A0 KBUILD_AFLAGS +=3D $(ARCH_INCLUDE)
> > =C2=A0=20
> > =C2=A0 USER_CFLAGS =3D $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(=
KBUILD_CFLAGS))) \
> >=20
> > base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
>=20
> Gentle ping. The patch still applies cleanly on top of v7.4-rc1. If
> it looks fine, could you take it through the UML tree?

I guess I figured with the "rust:" prefix it'd go through their tree,
but either way during the merge window and all I wasn't really paying
attention to UML.

I'll pick it up now.

johannes
