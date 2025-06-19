Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8589A23E33D
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 12:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336266; cv=pass; b=FXiYBbO6ONtYmrMG7uR6xsIAoROf4/SQF5aJXF9sq6JS7NSWdnzYITLCaQWxMvv11JoMMVxAdyyNlB9+T1bHge0CMhE1m71UolFaYJTdEbGO1UgTtnL3jS/Ff2/XsuR5Zo8Hvb6TY4u1aruqljpnCbdxzZG9Ky+1CQGM4Eefz7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336266; c=relaxed/simple;
	bh=UAggywBZ647hyalJGEPj/UWfUzlMUAscoCQapB2l+a4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qhfNVj8L+NB5K2FHQnd8WTaHnEwLHVWt9Hs2WiL32rSQ6LppBnu5dNl2NtzRm81GSC+gbG+yN0G2Klfjq55wst6quZJM9jvgpHBE4JUpqnqOy3+THe2VDWpbv5syOwIN7YNf4HTi3lAS9yg2M7mi7pzGu8Z3wVaJ7SDhDzyk4CM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=VoHlUAZa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="VoHlUAZa"
ARC-Seal: i=1; a=rsa-sha256; t=1750336237; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iCsTtb8q3IZo2K9h8bglVi0t1xDkMSSOn2Sm6ziAeDuT1xRGFjqgPhwJrEdxOEM43hfRqpi9s4Vqx2vMqJKBxbNjJ9xYoEcOLyyvVcikxkUZNvbS08I+4IGWsKvrfd4nUw4+GNq+I/7+nYDM8pnnNlwyVjmwCeBgd0gf2UPHdXc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750336237; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ELpfdZD9/tqKi/aPIHiSn6Ngwux31l7JD86X6k6ZqBk=; 
	b=adFLry38Fmc1XcAkCrsePNrg0P8k5Egrx8/zqfSrNz0sWU5e0qV9sPug8sbpLEYb9ulgoIFxMg1xg8YwxobQEi/HOkrei6DE3cy8QOiz9oAKkX7pG33EnOJobejHOHF9bNtONSTjUy9nJ8BTSokZsyEv6zb/89Ie00OCn27eDnY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750336237;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=ELpfdZD9/tqKi/aPIHiSn6Ngwux31l7JD86X6k6ZqBk=;
	b=VoHlUAZaZ0N0edr8Q/5E05NK400CB9c6/5zXOVE26QHtHJF/iswy2JxhBvmpRmmh
	guBv9JhtU+wiqp9839l3qvLdFftfEJzSxh1qpJk3FUbVxulcUbKpP4BMJ0aJbqci/rM
	ULiHhwBeq88jKWzDwYb7mPRYgv60L5MwyJQoeX2A=
Received: by mx.zohomail.com with SMTPS id 1750336235323548.4237453637628;
	Thu, 19 Jun 2025 05:30:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250619102102.750668-1-beata.michalska@arm.com>
Date: Thu, 19 Jun 2025 09:30:19 -0300
Cc: ojeda@kernel.org,
 alex.gaynor@gmail.com,
 dakr@kernel.org,
 aliceryhl@google.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 alyssa@rosenzweig.io,
 lyude@redhat.com,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <54E44DF8-1192-47B4-A9E3-5891D4BD7424@collabora.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Beata,

> On 19 Jun 2025, at 07:21, Beata Michalska <beata.michalska@arm.com> =
wrote:
>=20
> With the Opaque<T>, the expectations are that Rust should not make any
> assumptions on the layout or invariants of the wrapped C types.
> That runs rather counter to ioctl arguments, which must adhere to
> certain data-layout constraints. By using Opaque<T>, ioctl handlers
> end up doing unsound castings, which adds needless complexity and
> maintenance overhead, brining no safety benefits.

I don=E2=80=99t think that =E2=80=9Cunsound casts=E2=80=9D is what is =
happening here.

It's mostly the barrage of unsafe blocks to dereference the inner T for =
a
problem that does not exist.

> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
>=20
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>=20
> Additional comments:
> - UAPI types already automatically derive MaybeZeroable,
>   so it probably makes little sense to add any verification for that
> - FromBytes is pending, but due to the orphan rule, adding =
verification
>   of it being implemented for IOCTL args here is pointless

Even with this missing, I don=E2=80=99t see a problem with this patch.

In fact, if anything, the result of the discussion so far seems to point
towards automatically implementing FromBytes for all uapi types.


> - Verifying pointer alignment could make use of strict_provenance,
>   but that one is unstable and I am not sure what are the exact rules
>   here for using those. Without that one though, verifying alignment =
in
>   some cases (i.e. pointer tagging) might require more extensive =
changes.
>   Happy to deal with either.
>=20
> rust/kernel/drm/ioctl.rs | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> index 445639404fb7..12b296131672 100644
> --- a/rust/kernel/drm/ioctl.rs
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -139,7 +139,7 @@ pub mod internal {
>                             // asserted above matches the size of this =
type, and all bit patterns of
>                             // UAPI structs must be valid.
>                             let data =3D unsafe {
> -                                &*(raw_data as *const =
$crate::types::Opaque<$crate::uapi::$struct>)
> +                                &mut *(raw_data as *mut =
$crate::uapi::$struct)
>                             };
>                             // SAFETY: This is just the DRM file =
structure
>                             let file =3D unsafe { =
$crate::drm::File::as_ref(raw_file) };
> --=20
> 2.25.1
>=20
>=20

=E2=80=94 Daniel=20

