Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC0B28751D
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251085; cv=pass; b=cfH17IhJqzomFgXpIdjibL3X60MoUZQrZIy1D6lnYzfj3PTpf5FqzKH7HGqOrE6REtDAeOkL7k/aSBTALEOgBlnD77Lepz7A7ztOHCKOOS6eHHM6Yir+0Eblrb16op+e3F39zzRoqejadchcUcsPsRvPDvdtQpTG2xglrPpAyBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251085; c=relaxed/simple;
	bh=kZXVAV0FJAf9tZuXD3gOyf+J5OQ7iOF02SsMH+Y8EGQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NRbVsi0FkEH2gpF79iEVX/2/aR5adx5LdVgn8pcxibH80DivmhbAGV3IJVkyRywUsSnmnzUc2chQRvdyLo+Q2TihWBub/SRmPvo8LuA/d4Hr64e+7sqjFSg7VPsX1kYK3fnX8uzuUrgqnAsdbjkCsr556DTlBqteQDH1cOP01+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Rlhwggzl; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Rlhwggzl"
ARC-Seal: i=1; a=rsa-sha256; t=1764251073; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hF0pODLuW5X1J9zb4lXw6TUnQ/GcBDKBYJ3vxD1a/X/pq86sbvqUYnwsGMswFtgFIoLSO/qY1sTC9QKoFGmVd1jW/WScd4fspI9E6N5L0nTx9iLGg+9As7rT4bvQ9H57DR958JwWkLeM60lYl1qK5mjMkqAf0jgX68WBhI+5xlo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764251073; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KK3oaVgw8LDzrkaElAZ11EaLh6Byk4OIxUmnrQvcNKo=; 
	b=OqYOg+NdgvQBnmBtwNLym5Hj9Ss2z80PQc0daUarnSWgcEi11ZIwj8t9/FdMXS9Ha1ag68saNH9vfmoNNdm35uiGn+h57S9vT/c4Sa/03HH4Aw/Qdwc+Q6VOq2FlfhFBMoyJYtXrTXSNUU1BQK4O3ePFcxblZk2rK04LpucAbqE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764251073;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=KK3oaVgw8LDzrkaElAZ11EaLh6Byk4OIxUmnrQvcNKo=;
	b=Rlhwggzl4svYTgYp9FIJPPlwnqZVjSNC1HBvLab1qx+6tPKXh6NbHoyrrMap+V+1
	/bd3IrCRlgQrBIGanVdUXLjs8BPX1JJMWJ1PLrE+Q4FVi/N9Eq/qpzTIrPKNaILfERu
	FqamSs+FCsCTDVh5zgahF9LmHQrsQQeGG85+T5tA=
Received: by mx.zohomail.com with SMTPS id 176425106986544.53974635538327;
	Thu, 27 Nov 2025 05:44:29 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize
 overflow
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aShM9CAyRPe2gYpK@fedora>
Date: Thu, 27 Nov 2025 10:44:16 -0300
Cc: dakr@kernel.org,
 acourbot@nvidia.com,
 airlied@gmail.com,
 aliceryhl@google.com,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <56446175-58B0-407B-9FC8-97DCE1969673@collabora.com>
References: <aShM9CAyRPe2gYpK@fedora>
To: Brendan Shephard <bshephar@bne-home.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 27 Nov 2025, at 10:07, Brendan Shephard <bshephar@bne-home.net> =
wrote:
>=20
> Changed page_align() to return Option<usize> which allows for =
validation

nit: imperative voice here

> of the provided addr value. This ensures that any value that is =
provided
> within one PAGE_SIZE of usize::MAX will not panic and instead =
page_align
> will return None.
>=20
> Callers of page_align() should raise a EINVAL when they receive None
> from page_align().
>=20
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
> rust/kernel/page.rs | 13 ++++++-------
> 1 file changed, 6 insertions(+), 7 deletions(-)
>=20
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 432fc0297d4a..b78473b67003 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -26,13 +26,12 @@
> pub const PAGE_MASK: usize =3D !(PAGE_SIZE - 1);
>=20
> /// Round up the given number to the next multiple of [`PAGE_SIZE`].
> -///
> -/// It is incorrect to pass an address where the next multiple of =
[`PAGE_SIZE`] doesn't fit in a
> -/// [`usize`].

Can you document the return value? I=E2=80=99d find it weird that this =
returns Option otherwise.

> -pub const fn page_align(addr: usize) -> usize {
> -    // Parentheses around `PAGE_SIZE - 1` to avoid triggering =
overflow sanitizers in the wrong
> -    // cases.
> -    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
> +/// Return None in cases where the next multiple of [`PAGE_SIZE`] =
would overflow a [`usize`]
> +pub const fn page_align(addr: usize) -> Option<usize> {
> +    if let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) {
> +        return Some(sum & PAGE_MASK);
> +    }
> +    None
> }
>=20
> /// Representation of a non-owning reference to a [`Page`].
> --
> 2.51.1
>=20

With the change above:

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

