Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4893126CD;
	Tue,  6 Jan 2026 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709651; cv=none; b=qHjTSGlygz+RoVBae8SI49c9u60JEekJPNIhSoGlD+B7uaehoAqYlotbFXVY9sANtgqSnR/fxBHZEWrIthKCdqc26yrgLyGaaqhXH27Pf2qgCvZKiwenT8rfybVpXdXdBch9PV2aEnikDYLBCGA91Ge9CG8NLC44016ycwiEUII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709651; c=relaxed/simple;
	bh=yRizhhNfGDPf+obLvJF1oJPLNKdk3U2GKiBJdz/rTRY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jQSLue78Mn65Qz5F+Du/zD3rrhmSS9kzdqmJjZ5gobkFTw4gqOZONXc0qBW8yRQHnhftP0JXdJMSdoWTcq2YUD5wILbXVPe1CN+p7SRlqUOix0weQHPD+k3V0tLcJ0ftMRmsDy0B70YRmfDVN2MKSmW5G/3FR0VNgvST5yGLrP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 54EBF2B03EC;
	Tue,  6 Jan 2026 15:20:45 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id duGiDergfFXx; Tue,  6 Jan 2026 15:20:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C3F3A2ABFDC;
	Tue,  6 Jan 2026 15:20:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yRMMhCJ3y2FK; Tue,  6 Jan 2026 15:20:43 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8CC6C99FB4;
	Tue,  6 Jan 2026 15:20:43 +0100 (CET)
Date: Tue, 6 Jan 2026 15:20:43 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-um <linux-um@lists.infradead.org>, x86 <x86@kernel.org>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, tglx <tglx@linutronix.de>, 
	mingo <mingo@redhat.com>, bp <bp@alien8.de>, 
	dave hansen <dave.hansen@linux.intel.com>, hpa <hpa@zytor.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	dakr <dakr@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Rust for Linux Kernel <rust-for-linux@vger.kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Message-ID: <1064740857.79527.1767709243348.JavaMail.zimbra@nod.at>
In-Reply-To: <20260106034034.60074-1-boqun.feng@gmail.com>
References: <aVxcAZe6AEXEfx3G@tardis-2.local> <20260106034034.60074-1-boqun.feng@gmail.com>
Subject: Re: [PATCH] arch: um/x86: Select ARCH_SUPPORTS_ATOMIC_RMW for
 UML_X86
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF144 (Linux)/8.8.12_GA_3809)
Thread-Topic: arch: um/x86: Select ARCH_SUPPORTS_ATOMIC_RMW for UML_X86
Thread-Index: sJnRvj0jz0HhSO1GSUr6a5CWkGpv6Q==

----- Urspr=C3=BCngliche Mail -----
> Von: "Boqun Feng" <boqun.feng@gmail.com>
> An: "linux-um" <linux-um@lists.infradead.org>, "x86" <x86@kernel.org>
> CC: "richard" <richard@nod.at>, "anton ivanov" <anton.ivanov@cambridgegre=
ys.com>, "Johannes Berg"
> <johannes@sipsolutions.net>, "tglx" <tglx@linutronix.de>, "mingo" <mingo@=
redhat.com>, "bp" <bp@alien8.de>, "dave
> hansen" <dave.hansen@linux.intel.com>, "hpa" <hpa@zytor.com>, "Miguel Oje=
da" <ojeda@kernel.org>, "Boqun Feng"
> <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Bj=C3=B6rn Roy Ba=
ron" <bjorn3_gh@protonmail.com>, "Benno Lossin"
> <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice R=
yhl" <aliceryhl@google.com>, "Trevor Gross"
> <tmgross@umich.edu>, "dakr" <dakr@kernel.org>, "linux-kernel" <linux-kern=
el@vger.kernel.org>, "Rust for Linux Kernel"
> <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori" <fujita.tomonori@gmai=
l.com>
> Gesendet: Dienstag, 6. Januar 2026 04:40:34
> Betreff: [PATCH] arch: um/x86: Select ARCH_SUPPORTS_ATOMIC_RMW for UML_X8=
6

> x86 atomic instructions are used for um on UML_X86, therefore atomics
> on UML_X86 support native atomic RmW as x86 does, hence select
> ARCH_SUPPORTS_ATOMIC_RMW.
>=20
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
> UM & x86 maintainers,
>=20
> I need this to avoid a build error for Rust atomics since Rust currently
> only support Atomic<i8/i16> on ARCH_SUPPORTS_ATOMIC_RMW archs. I will
> add it to my upcoming PR if I get some Acked-by, thanks!
>=20
> arch/x86/um/Kconfig | 1 +
> 1 file changed, 1 insertion(+)

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
