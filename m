Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4D27F010;
	Mon, 26 Jan 2026 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769460737; cv=pass; b=E6XNB8orgVpdlUiMKsTIBzzKkgI+LK02k5hNZEc9H1EIMmP6mTy+4oaWTaAfNLXDA0Ac5G4vT0yO1qk46sHH6j4V+ipFZUOgcztj1E5Njrj62nfgWSSvC7SU42n5ekBFOVXdMsW9XOm01l4sQKBAJ2etCt1aO7XuKcO5fE9SwOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769460737; c=relaxed/simple;
	bh=gk7bCLmsZAworll9Tyept4IT2p2JBUL6ir6idYJ5x3w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=snr1yHrekzWjnYmisDHrlmKJ+MpgVcRk7chIWGP/WnGDeDOw9vA+KiO0sCmOxn3B3eadaHEdlNPMrceBLnh2OnoKijie6sqyTA0/7VEffYCwCK/CFvNTNuAyU8DLgjqCneALf6ZYUgVNUA7dnNjCQeqe86oDNFFHgLyDNGb+dyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Y8EIJNOQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Y8EIJNOQ"
ARC-Seal: i=1; a=rsa-sha256; t=1769460724; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aOWNmqHI0cSjGLHm+y4IvVLF/4YJLWB0zo4lhon7+FpCMYil/lFbTCKiQ+fuzR76evoPHzATFQXQk3Ux6LlttaL8Wy6TLgfyqvb2nO2xTepqGjgAIuaHFhjLMiaOsmMPNDZvQ1one6KK/f5csZ3VuLri5lAjttCQTtNDn0i9D0s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769460724; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rEHkKpBcmkOspe2hK05VCnHAt4UqLafts8UPtI4RO7A=; 
	b=Id+rb4XoeYpfNBzlQfMBB7nKN1xBTtUmXyBaX3EtkdzjJDAxatIjBGgipsldscZwtpGT5WlEti2IYy1N9ZjYM5M4toqQDyIjUF0pdDkNWj3VpN+Kwz/RKxF7TCE2gbpH5g/8UzqU91deNakSSvKYs1Opfb09goQ+rRXdlRKPyz8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769460724;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=rEHkKpBcmkOspe2hK05VCnHAt4UqLafts8UPtI4RO7A=;
	b=Y8EIJNOQIwYw0TiQ0WIJKtdg3ymohxI+YzA8n891zeE2pUX5jhjvsAVWJDralPHO
	NyuHibCeI5Yw0/FXbtwAxylTxJWkemin4uUOIXuak4HYJw1GSnLmbcuvsmzhvQbr8Rs
	zJSZ2CM5gOSXwUufqXv1st7TYWF2Q43wPDBCfYJo=
Received: by mx.zohomail.com with SMTPS id 176946072310858.48046846843215;
	Mon, 26 Jan 2026 12:52:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 0/3] Introduce DeviceContext
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260123231230.248500-1-lyude@redhat.com>
Date: Mon, 26 Jan 2026 21:51:46 +0100
Cc: linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1EA1F0E-0A78-4F6A-B67F-03E5CB8F0135@collabora.com>
References: <20260123231230.248500-1-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Lyude,

> On 24 Jan 2026, at 00:10, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Previous version of this patch series:
>  https://patchwork.freedesktop.org/series/160217/#rev2
>=20
> One of the unsolved issues we still have with the rust DRM bindings is
> the ability to limit certain Device operations to contexts where we =
can
> guarantee that a Device has been fully initialized and registered with
> userspace, or vice-versa (e.g. must be unregistered).
>=20
> While the previous solution for this that I had was simply not =
exposing
> drm::Device at all until the device has been registered with =
userspace,
> unfortunately this isn't enough since:
>=20
> * As we found out with Tyr, drivers occasionally need to be able to
>  create GEM objects before device registration
> * We would still need to be able to handle KMS callbacks which could =
be
>  invoked after KMS init but before userspace registration (not handled
>  in this series specifically, but DeviceContext will be required for
>  handling this).
>=20
> This patch series provides a pretty nice solution to this, by
> implementing a very similar solution to kernel::device::DeviceContext:
> introducing our own DeviceContext type state.
>=20
> This patch series depends on the two pre-requisite patch series:
>=20
> * https://patchwork.freedesktop.org/series/160523/
>=20
>                          Series-wide changes
>=20
> V2:
> * s/DeviceCtx/DeviceContext/ for consistency
> * Move private driver-data availability to the Registration
>  DeviceContext
> * s/AnyCtx/Init/
>=20

Did you forget the changelog for v3 and v4?


> More changes described in each patch description.

Seems to be the case for the individual patches as well.

Anyways, I will do a second round of reviews here; please
wait a bit before potentially merging a new iteration.


=E2=80=94 Daniel=
