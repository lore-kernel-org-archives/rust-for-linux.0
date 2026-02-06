Received: from sender4-pp-g125.zoho.com (sender4-pp-g125.zoho.com [136.143.188.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FFC2C1598;
	Fri,  6 Feb 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385733; cv=pass; b=f0+lF48c1sihsXT8hkFcZtsfp9AV+oatphvXLoZUe712ZCER7V4XoaWlbS8ITnMgZZQ1n044IPOsd+91G/BSikngks810JyzSeTaGpCfTap1+A/aD+5a+SxArhweEv/pHOwzc/cVdtiUfxdef0Z13WQKOrooGEaxzPRQgOLUc8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385733; c=relaxed/simple;
	bh=mxwMRxdTtjDiUY01HfEp0Pw5qQLztrrrSzp65YzYK7M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=T/riTx5TzZxhAyaF3I/gNQUDVCmuwLh4hLKzh1EX95bEMfsXl2vPdTCYeZXTqIW5yBsb3uqBcGcICehEF7pr1tHmtxGDRDLN0HI0/fXTkgKUS1i1bxfCiOKHovbQgBPXO+mgb05fHh//hXhW0htExq8eZy3OJHfVe3xD9M6Spw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=JsBG5J0O; arc=pass smtp.client-ip=136.143.188.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="JsBG5J0O"
ARC-Seal: i=1; a=rsa-sha256; t=1770385725; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eLADfDh5ZCG7FahJ0WDSoJJw3WG/E6sg1kBr91d1CAzJzJ2jBLLP6x/vNsE4+Lc8NOBnhgScH7CmbgStQf0dToSoI4t52hv9Fpke68kF2sLnsGzZPvwKmwcwHVWhv27+iG6IURND31icveANQAM5OCqsNx1UXPk27d/Nl9B0J0g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770385725; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LzPiNNptRxNCTQFdfUnfCjZ/Da5/h5a44gaaAAfD6Fw=; 
	b=JgPcy0BcL0k3sj0DyP25viHH4BRI+G8gSzMN4xxbs9akM4YPfWaqZSODzOFEaNJppwwm3+snAJiidoEEvLgHAOYTNRF6rYem5GOyW2UDsArwbarvmWtvlixcAcG4SOPq4qi891kKVO4r1vsmdF/rEx6EpGgmYjDYKEnrnoHjPqM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770385725;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=LzPiNNptRxNCTQFdfUnfCjZ/Da5/h5a44gaaAAfD6Fw=;
	b=JsBG5J0OosF+DKNKjZbozUujKQ83cvNeSAEIpFjnr1nBs3MLdCZdPc/sLPg3XhkF
	JwfBYIopxkego5nPuPgCIrgm8ZXW5PHh79J7vSnhLBGulBYZfN3lHtYPem8CZWoconL
	gh92Sir9qISd08fibtCSWiWb+zfQcsz03uLfA3oo=
Received: by mx.zohomail.com with SMTPS id 1770385723877534.8156522665855;
	Fri, 6 Feb 2026 05:48:43 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 3/4] rust/drm/gem: Add DriverAllocImpl type alias
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260131001602.2095470-4-lyude@redhat.com>
Date: Fri, 6 Feb 2026 10:48:27 -0300
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
Message-Id: <A3285F15-8EE1-45C9-B54F-703C7BC4E161@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-4-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 30 Jan 2026, at 21:13, Lyude Paul <lyude@redhat.com> wrote:
>=20
> This is just a type alias that resolves into the AllocImpl for a given
>  T: drm::gem::DriverObject
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/gem/mod.rs | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index b4199945db378..ad74c5159f725 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -33,6 +33,11 @@
> /// [`DriverFile`]: drm::file::DriverFile
> pub type DriverFile<T> =3D drm::File<<<T as DriverObject>::Driver as =
drm::Driver>::File>;
>=20
> +/// A type alias for retrieving the current [`AllocImpl`] for a given =
[`DriverObject`].
> +///
> +/// [`Driver`]: drm::Driver
> +pub type DriverAllocImpl<T> =3D <<T as DriverObject>::Driver as =
drm::Driver>::Object;
> +
> /// GEM object functions, which must be implemented by drivers.
> pub trait DriverObject: Sync + Send + Sized {
>     /// Parent `Driver` for this object.
> @@ -42,12 +47,12 @@ pub trait DriverObject: Sync + Send + Sized {
>     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
>=20
>     /// Open a new handle to an existing object, associated with a =
File.
> -    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: =
&DriverFile<Self>) -> Result {
> +    fn open(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) =
-> Result {
>         Ok(())
>     }
>=20
>     /// Close a handle to an existing object, associated with a File.
> -    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: =
&DriverFile<Self>) {}
> +    fn close(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) =
{}
> }
>=20
> /// Trait that represents a GEM object subtype
> --=20
> 2.52.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
