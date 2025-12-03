Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789EC2EA752
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764763427; cv=none; b=QUZe8ZFVRDp64Lx/dcraMkLCcDijCPRTM1pVbKGHZdipPuXvGWGNCV17ah8JLA290r87dmzAgGmFysB6Dfo489hhcC0/KqpcZvZ+BeD6ZIJVT8kzudfgCVkM7lPxc2W3531KRYk+vpkb+CMWb1IHmW+m2GHtXyNx3cxigd8DzNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764763427; c=relaxed/simple;
	bh=rwQBFk13PzOt0q2691KMX7boNIapxFWJJxGGSeMCwYI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LlmeYY4B7bgDYqRVTWeoMj2MQ9RZlFqHahtvsW1xEssnn+cWOCndlz4exMvfsKdD8tkq2BQ3S3fiQu80/RNFHIdyxKdoDSaK1oVFQl0Nd0IUDHFo1qjC75y3mgoxNOZQlAB9mKPfP2yy0ouTZJ+rtCq9KBQTYkv5CDvUxDg3JDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4IWgcyrx; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4IWgcyrx"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso76263315e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 04:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764763424; x=1765368224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtHQog5qmipsoaUag3IIt+tHiP4IbPCLqBREJ8ta/OI=;
        b=4IWgcyrxXW3/Ga44fe4zvju30LPZQglxWcBJn5APftxWDYd6auMy2CxzVyt45W2g2I
         R5AIhKAezFrfkk7L85hAfnRd8BCiKqZgyGzL5rOt87VIb8R9C3Q+ctBuf1DZ8oKAIYt+
         uyFu2oHI3cLfj6XvOOLgOGW6nOrlxmPolXI0gDBHK3PFA+Qxy11Y6+h3hBOWyKkpKg7F
         rPkvlv2c/GcILkBx+/XtMImJjZcfhr7hI/FngyTfBGqKwJfmHCHTwsxg0xkrAsfJTyMW
         qMRFyi5IXbb4lSXI6TYVDi1txa23rRLXhfiaTr52OhcfGZ1IJBsEmZmcYnmzKwHDPaSB
         /69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764763424; x=1765368224;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PtHQog5qmipsoaUag3IIt+tHiP4IbPCLqBREJ8ta/OI=;
        b=R65h0crhRtwXnsz0/IeDfKtjiHrNWK+j5fOIwYz5kYtLf7Qby8xNc8VID2ICSHXrP8
         61dnv6QB3Rb3tNDurJf+DBsSYjc/znrrVMo7FW/wI5G/GZ1M3IE2lx2P42fv6dpCiFce
         jvymfOCV6hPbVgilXN/q0ia3L0CORDfZcyFI5cvNNmifREHmVwy8JfdDLk78OA22lByl
         T1N3VZimZUgjgrCP16Nc+B/n1KHLBMpU/1fsUjvMpAFOHUK3H0zZsKaaEO2FdprMqWt6
         yMGzCrz4qgDsauBn/NUIaaTPhfVJLR559KjsQu2X6SfTJil2+POHfW88ZL8A7x84OXZw
         M4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWmj2+C1P/hryw0e4vmzQ0zN0clAKsUb3nUsqDheWQsBMwwNDQOU6OcCQywhWg/eiJdArXrQozzm59uZMopTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqudRq/CYyGCW7QsPovUGEOvxwXokV/M1I46swOmsxeeusZGLz
	JX0esPFvnIBrYYXre2SB8cNC1gBiPS95DTaQK3a3f+P/kowDgNgRVqyUVyUmC5X8agOBCLXc8zw
	6e3pc1uRLnNdr2D+CVA==
X-Google-Smtp-Source: AGHT+IExOwyk8Vry3CIzUxxYL1GwxJ1Wt7CQYNbI21qhICyr3246VNdFd4xzMP4HZq+nX7Wk4VtTlapbff4EghY=
X-Received: from wmos9.prod.google.com ([2002:a05:600c:45c9:b0:477:9b3e:67e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e91:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-4792af4182cmr19633645e9.29.1764763423746;
 Wed, 03 Dec 2025 04:03:43 -0800 (PST)
Date: Wed, 3 Dec 2025 12:03:42 +0000
In-Reply-To: <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251114233045.2512853-1-ttabi@nvidia.com> <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com> <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
Message-ID: <aTAnHrcaP23_6lDh@google.com>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"nouveau-bounces@lists.freedesktop.org" <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 08:54:31PM +0900, Alexandre Courbot wrote:
> On Tue Dec 2, 2025 at 8:25 AM JST, Timur Tabi wrote:
> > On Wed, 2025-11-19 at 12:36 +0900, Alexandre Courbot wrote:
> >> You can use the `Alignment` type here, as the rest of the code does:
> >>=20
> >> =C2=A0=C2=A0=C2=A0 let size =3D num::usize_as_u64(obj.size())
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .align_up(Alignment::new::<=
GSP_PAGE_SIZE>())?;
> >>=20
> >> Now `align_up` returns an error in case of overflow, that we will need
> >> to pass down to the caller by changing the return type of `new`. It is=
 a
> >> bit annoying, but better than the behavior of `next_mutiple_of` in suc=
h
> >> a case, which is to panic. :)
> >
> > I see your point, but these are u64s that we're talking about.  The onl=
y way next_mutiple_of() can
> > panic is if obj.size() is greater than 0xFFFFFFFFFFFFF000, which is not=
 possible. =20
> >
> > I would say in this case, a panic is preferable to a convoluted error r=
eturn that will never be
> > exercised, because failure here indicates a coding error, not an input =
error.
>=20
> The input data is a usize, so technically we could get an input that
> triggers that error.
>=20
> I know it's a very edge case, and clearly indicates a bug, but the
> general rule is: don't panic the kernel. And in Rust, if possible, don't
> even let me compiler insert panic-handling code. If you don't want to
> change the return type of the method, then maybe use `unwrap_or` and
> `inspect_err` to print an error before returning e.g. `0`.
>=20
> But others have already thought "naah, that's never gonna happen" and
> got burnt very publicly [1], so let's learn from that. :P
>=20
> [1] https://blog.cloudflare.com/18-november-2025-outage/

For what it's worth, my friend at Cloudflare tells me they would have
failed in the same way had they used ? instead of unwrap.

Alice
