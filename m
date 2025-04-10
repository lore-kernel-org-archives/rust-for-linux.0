Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DE5256C68
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277008; cv=none; b=ITBjrhoNnzfOsWPKwpCa1kOrhu5+m9IPMgbO6oknA234b69wtFszFH3L+xa2EWvkGPd2mrcLSgffHKXBifc7/IDvNo2dOSx4SkvjVmX/qXQ19stLeYspFJLl8p0+UEskO9cvW7OLXlhZDwtl69diRNA7Z8IOPIvPpAJ7piL5BwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277008; c=relaxed/simple;
	bh=20mtcDz2xnfUIlIVVczqTnngVF6pXVBbEMrCDm76AyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv3e8Xxn4qUU1DmdxltnL/JssL2K+ztZo2tAgzRH749r/ASb1el/sQvNKOLphJyz3H+0X7bCiw4jRYLoIn1xqEW0yVZCbs+bevj1QsGnyKjft7yaOQH1BQDBm38EzSsK8okPe96Foeai/2eBcWCVPcH+ctA8gvGAEi1bJGP0Ntk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhhqUi7s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhhqUi7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C674C4CEDD;
	Thu, 10 Apr 2025 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744277007;
	bh=20mtcDz2xnfUIlIVVczqTnngVF6pXVBbEMrCDm76AyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhhqUi7skbVChgyksUoxOzi0NTkgfhDglXyCfix+jZrkjZ6EYlvJJX1VqA6pX5pdU
	 ks/ZNDFLsA43iR8fqRYWLbqWM2+o4A1G2EaT2vU+vR8Tp9biHaWfnbh3Q7IizHt+JM
	 GeDw0aLiQ+oT2FyCLDDzB3WQ8RXWwMIxC9cEzVm2kQX/Pbjc9Mfmo7iVL2cChJxNq/
	 /9v0kXt/OhkXKVm4ujNHaONmafGMEetkTsqY6y+TTC07Zcs6LiyKsNdiBr6WI1D9BS
	 6kF9fLDam2G5TjHDiC1KIv+G0gpc+LCGBTqwyUaXkA9OMFs6TOWWEUfhotDD7E6Suq
	 0NGpCh1pDaPFQ==
Date: Thu, 10 Apr 2025 11:23:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, lina@asahilina.net, 
	daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 5/8] rust: drm: add DRM driver registration
Message-ID: <20250410-sensible-wondrous-marmoset-cb34f1@houat>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-6-dakr@kernel.org>
 <20250326-loyal-scrupulous-leech-59d44a@houat>
 <Z-PbHiaMNqR0FPbY@pollux>
 <20250328-impossible-locust-of-merriment-b625bd@houat>
 <Z-a3JY4ytvqHWDWL@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7lmdbvax2rqizhdg"
Content-Disposition: inline
In-Reply-To: <Z-a3JY4ytvqHWDWL@pollux>


--7lmdbvax2rqizhdg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] rust: drm: add DRM driver registration
MIME-Version: 1.0

Hi Danilo,

On Fri, Mar 28, 2025 at 03:50:13PM +0100, Danilo Krummrich wrote:
> On Fri, Mar 28, 2025 at 03:28:04PM +0100, Maxime Ripard wrote:
> > On Wed, Mar 26, 2025 at 11:46:54AM +0100, Danilo Krummrich wrote:
> > > On Wed, Mar 26, 2025 at 10:24:43AM +0100, Maxime Ripard wrote:
> > > > On Wed, Mar 26, 2025 at 12:54:32AM +0100, Danilo Krummrich wrote:
> >=20
> > > > drm_dev_unregister also have an hotplug-aware variant in
> > > > drm_dev_unplug(). However, most devices are hotpluggable, even if o=
nly
> > > > through sysfs. So drm_dev_unplug() is generally a better option. Sh=
ould
> > > > we use it here, and / or should we provide multiple options still?
> > > >=20
> > > > Another thing worth mentioning I think is that drm_dev_unplug() wor=
ks by
> > > > setting a flag, and drivers are expected to check that their access=
 to
> > > > device-bound resources (so registers mapping, clocks, regulators, e=
tc.)
> > > > are still there through drm_dev_enter/drm_dev_exit. It's pretty fra=
gile
> > > > overall, so I wonder if it's something we could abstract away in Ru=
st.
> > >=20
> > > DRM should not have to take care of the lifetime of device resources =
of the
> > > parent device. This is the responsibility of the driver core abstract=
ions.
> > >
> > > At least for the device resources we directly give out to drivers, it=
 has to be,
> > > since otherwise it would mean that the driver core abstraction is uns=
ound.
> > > Drivers could otherwise extend the lifetime of device resources arbit=
rarily.
> >=20
> > Sure.
> >=20
> > > For instance, I/O memory is only ever given out by bus abstractions e=
mbedded in
> > > a Devres container (e.g. Devres<pci::Bar>). Once the parent device is=
 unbound
> > > the pci::Bar within the Devres container won't be accessible any more=
 and will
> > > be dropped internally. So, that's nothing DRM has to take care of.
> > >=20
> > > However, there are cases where it's better to let subsystem abstracti=
ons manage
> > > the lifetime of device resources, (e.g. DMA mappings). The relevant t=
hing is,
> > > that we never hand out device resources to a driver in a way that the=
 driver can
> > > extend their lifetime arbitrarily.
> >=20
> > I was talking about the opposite though: when the driver is still around
> > but the device (and its resources) aren't anymore.
>=20
> Well, that's what I was talking about too. :)
>=20
> > It makes total sense to tie the lifetime of the device resources to the
> > device. However, the DRM device and driver will far outlive the device
> > it was bound to so it needs to deal with that kind of degraded "the DRM
> > driver can still be called by userspace, but it doesn't have a device
> > anymore" scenario. That's what I was talking about.
>=20
> This scenario should be covered by the things I mentioned above. Let's ta=
ke the
> I/O memory example.
>=20
> If you call into the DRM driver from userspace when the underlying bus de=
vice
> has already been unbound, the DRM driver may still hold a Devres<pci::Bar>
> instance.
>=20
> If the DRM driver then calls bar.try_access() (in order to subsequently c=
all
> writeX() or readX()) the try_access() call will fail, since the correspon=
ding
> PCI device has been unbound already.
>=20
> In other words the pci::Bar instance within the Devres container will be =
dropped
> (which includes unmapping the bar and releasing the resource region) when=
 the
> PCI device is unbound internally and the Devres container will restrict
> subsequent accesses from drivers.
>=20
> It pretty much does the same thing as drm_dev_enter() / drm_dev_exit(), b=
ut
> additionally prevents access to the (meanwhile) invalid pointer to the de=
vice
> resource and ensures that the driver can't make device resources out-live=
 device
> unbind.
>=20
> As mentioned above, the Devres container is just one example of how we pr=
event
> such things; it depends on the exact scenario. In either case, I don't wa=
nt the
> driver itself to be responsible to setup the corresponding guards, that w=
ould
> make the corresponding abstractions unsound.

Thanks for the explanation :) It makes total sense now.

Maxime

--7lmdbvax2rqizhdg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/eODAAKCRDj7w1vZxhR
xYXTAQDrpexfgLeim+smhkcVzvKgCeqO+PcYyzBBjXDXUYZZCQEAwB7WZCyE256K
coCh/3nkyklIKsccA8MiI0NpXa5y5QE=
=5bgO
-----END PGP SIGNATURE-----

--7lmdbvax2rqizhdg--
