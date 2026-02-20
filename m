Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A354721CC58
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 14:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771596311; cv=pass; b=LjwwlPf9K+ziz/3Cpd0hJhqhE41LxSldYiDm74vJZDnbg6QN9N7wLyMQ0ZlP78FZ4Rg1FSk9RTTObw8m9J41fEnPn/DW8L3R1lFx1btQ8kf9rpGCp8XHi5LMwG72kWmbqgGaMoi4Alzrd/JZzaIdwIad5kDcxZVZ1f5TnzctPwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771596311; c=relaxed/simple;
	bh=D6oExP2PnOz+IPrG2W3je6CxwBJpv9h1X2pg7NAMjHQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kidHrwmWRGJCCX9r1+qNiRp6Awlq0pEenEft8pvIxoHS99xhQM22tnpynfiHqR3DRvBe8ILzSHONNC2F4TGSgq3KdM6ecnjlUw1MUqFif9K+lC8XLsuS2tgUcnSxOQEnuckaclI5niRawkFhH2AJ4bRpM4MWPvaSnJCEOOF1bYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=cDuAztVF; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="cDuAztVF"
ARC-Seal: i=1; a=rsa-sha256; t=1771596304; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EpQXACAl0L9W8bPYs6eDjsI5TEDl1I3vhmSJxfuBvpwOTG0UuXeIreiGq9gjOOioJiSeAVy78rKdNse6mxKNk1DHpiiKsZkZtGh5SIFmayaAORG14Cz87AvmPzArpkdWW+w/H0AALecupCIBc3tiZzyVB2TCNE/EBhIuHwl0qtQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771596304; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=INvFtzjR995PFWQ3M9LDGzstvhOtmRRcYdp+5qPVbOU=; 
	b=T7aOl+Lkdk1Ltenp3DrshqWIwXOBq0dgLjJv7idwoWtWQjmIUa7vptCrPn+AZ4ESCflkymNmn5BZ7AQ7Jgh/ZswawvqiL1YCSvR2CUUBVp6YF+idXK84o5j0gVO/Qk1eh6c+OHiCYSKOLPbl8in8TlCP5r3Nv9Nb4aIGAalHswk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771596304;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=INvFtzjR995PFWQ3M9LDGzstvhOtmRRcYdp+5qPVbOU=;
	b=cDuAztVF18mk9et92iVhTGz3uNx7oFi4ScrbJy2FiF0nBoR5ru2daCw0ybD9iwhh
	Y1qasNm4sJdS2yDDoUx2EbudemxzBaEcJ8ca3wIZ8GWPAA5O86/hY9CgM1xVRQSYZNo
	0oxKDineoB4Q0std7/HQogVEbIcSJKEq996tqewo=
Received: by mx.zohomail.com with SMTPS id 1771596303942730.5619537285371;
	Fri, 20 Feb 2026 06:05:03 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 03/12] drm/tyr: rename TyrObject to BoData
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212013713.304343-4-deborah.brouwer@collabora.com>
Date: Fri, 20 Feb 2026 11:04:48 -0300
Cc: dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 boris.brezillon@collabora.com,
 beata.michalska@arm.com,
 lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <FEEDA3C0-A2FC-4712-B1E6-2592422AAD4F@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-4-deborah.brouwer@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 11 Feb 2026, at 22:37, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> From: Boris Brezillon <boris.brezillon@collabora.com>
>=20
> Currently the GEM inner driver data object is called `TyrObject` which
> is a fairly generic name. To make the code easier to understand,
> rename `TyrObject` to `BoData` so that the name better reflects its
> role.
>=20
> No functional change is intended.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/driver.rs | 4 ++--
> drivers/gpu/drm/tyr/gem.rs    | 6 +++---
> 2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index 9bc6ed56c45e..e5eae5a73371 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -36,7 +36,7 @@
>=20
> use crate::{
>     file::TyrDrmFileData,
> -    gem::TyrObject,
> +    gem::BoData,
>     gpu,
>     gpu::GpuInfo,
>     regs, //
> @@ -182,7 +182,7 @@ fn drop(self: Pin<&mut Self>) {}
> impl drm::Driver for TyrDrmDriver {
>     type Data =3D TyrDrmDeviceData;
>     type File =3D TyrDrmFileData;
> -    type Object<R: drm::DeviceContext> =3D =
drm::gem::Object<TyrObject, R>;
> +    type Object<R: drm::DeviceContext> =3D drm::gem::Object<BoData, =
R>;
>=20
>     const INFO: drm::DriverInfo =3D INFO;
>=20
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index c59214e3d0ef..c1208d332dea 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -12,9 +12,9 @@
>=20
> /// GEM Object inner driver data
> #[pin_data]
> -pub(crate) struct TyrObject {}
> +pub(crate) struct BoData {}
>=20
> -impl gem::DriverObject for TyrObject {
> +impl gem::DriverObject for BoData {
>     type Driver =3D TyrDrmDriver;
>     type Args =3D ();
>=20
> @@ -23,6 +23,6 @@ fn new<Ctx: DeviceContext>(
>         _size: usize,
>         _args: (),
>     ) -> impl PinInit<Self, Error> {
> -        try_pin_init!(TyrObject {})
> +        try_pin_init!(BoData {})
>     }
> }
> --=20
> 2.52.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
