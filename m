Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4471C5D4C
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Mar 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173421; cv=none; b=lkELN5skC7fZLkO/h/MA1RYxPOdOHvkxIWt9wTUOkp87JpmuE2OPlNHhdXalv+fyq2C2caFG3Kcyv7Cs3C6b+7ztARYFHsmKecMlSznJYl9sJGiRhMxQ3kCSiu6fy6aFSaViIqUNCJ6N/E7QeB/mxvlUk5VM2x3WWjta0DERzKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173421; c=relaxed/simple;
	bh=eiphQSBj0FYGr2IwA507TZdWUU9cFO+wxp1xivRccMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q431QJcGL5JPps1P4zCxa4buJU19qpuffi+qzPoYYU/UYOoh0T4wSoM71G8OF00ErV8pyNCQIHMSS2a7fD/B1aa3hmdBbag8658B/XB8dmzVCd0VMBtITsbYZINZwJcwPVqBzo4VnihGqqTdJ2BMUkg37esIMPskoU7m9UjZFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVxSHW6v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVxSHW6v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AE9C4CEE4;
	Fri, 28 Mar 2025 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743173420;
	bh=eiphQSBj0FYGr2IwA507TZdWUU9cFO+wxp1xivRccMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVxSHW6vRlwMKVMEhpJoXxIvCYmbacJ/Odgoer3qBj/CzBKhyP631aihWEOuEV0rH
	 u3Vr0uYoJUijNXYBQTlZZaGMfxrTtl8eVMet9pDGteI+rLjKeu2PQaXlJAa3ujPE6s
	 w7GjdeYvSUAyLGzlTJH5vKMsWG/ol8xdF4soSJJQIcSkAvBA9mIJrzlgCeD9nmrSbN
	 n6GiJXwOOQ+GoSNfdtJ77Aaj/psMGrJ+e2XwdjxEz+qHrzdEMH4cP8dyxyczkyPCSD
	 2jSpuhtQaVsevWZMqSKXyGdpJ1xqlZ8ITy+qrBu7YrrMLpCDcIhFAD7YBU+JiLteRO
	 tPIzykc0eC7GQ==
Date: Fri, 28 Mar 2025 15:50:13 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com,
	lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 5/8] rust: drm: add DRM driver registration
Message-ID: <Z-a3JY4ytvqHWDWL@pollux>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-6-dakr@kernel.org>
 <20250326-loyal-scrupulous-leech-59d44a@houat>
 <Z-PbHiaMNqR0FPbY@pollux>
 <20250328-impossible-locust-of-merriment-b625bd@houat>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328-impossible-locust-of-merriment-b625bd@houat>

On Fri, Mar 28, 2025 at 03:28:04PM +0100, Maxime Ripard wrote:
> On Wed, Mar 26, 2025 at 11:46:54AM +0100, Danilo Krummrich wrote:
> > On Wed, Mar 26, 2025 at 10:24:43AM +0100, Maxime Ripard wrote:
> > > On Wed, Mar 26, 2025 at 12:54:32AM +0100, Danilo Krummrich wrote:
> 
> > > drm_dev_unregister also have an hotplug-aware variant in
> > > drm_dev_unplug(). However, most devices are hotpluggable, even if only
> > > through sysfs. So drm_dev_unplug() is generally a better option. Should
> > > we use it here, and / or should we provide multiple options still?
> > > 
> > > Another thing worth mentioning I think is that drm_dev_unplug() works by
> > > setting a flag, and drivers are expected to check that their access to
> > > device-bound resources (so registers mapping, clocks, regulators, etc.)
> > > are still there through drm_dev_enter/drm_dev_exit. It's pretty fragile
> > > overall, so I wonder if it's something we could abstract away in Rust.
> > 
> > DRM should not have to take care of the lifetime of device resources of the
> > parent device. This is the responsibility of the driver core abstractions.
> >
> > At least for the device resources we directly give out to drivers, it has to be,
> > since otherwise it would mean that the driver core abstraction is unsound.
> > Drivers could otherwise extend the lifetime of device resources arbitrarily.
> 
> Sure.
> 
> > For instance, I/O memory is only ever given out by bus abstractions embedded in
> > a Devres container (e.g. Devres<pci::Bar>). Once the parent device is unbound
> > the pci::Bar within the Devres container won't be accessible any more and will
> > be dropped internally. So, that's nothing DRM has to take care of.
> > 
> > However, there are cases where it's better to let subsystem abstractions manage
> > the lifetime of device resources, (e.g. DMA mappings). The relevant thing is,
> > that we never hand out device resources to a driver in a way that the driver can
> > extend their lifetime arbitrarily.
> 
> I was talking about the opposite though: when the driver is still around
> but the device (and its resources) aren't anymore.

Well, that's what I was talking about too. :)

> It makes total sense to tie the lifetime of the device resources to the
> device. However, the DRM device and driver will far outlive the device
> it was bound to so it needs to deal with that kind of degraded "the DRM
> driver can still be called by userspace, but it doesn't have a device
> anymore" scenario. That's what I was talking about.

This scenario should be covered by the things I mentioned above. Let's take the
I/O memory example.

If you call into the DRM driver from userspace when the underlying bus device
has already been unbound, the DRM driver may still hold a Devres<pci::Bar>
instance.

If the DRM driver then calls bar.try_access() (in order to subsequently call
writeX() or readX()) the try_access() call will fail, since the corresponding
PCI device has been unbound already.

In other words the pci::Bar instance within the Devres container will be dropped
(which includes unmapping the bar and releasing the resource region) when the
PCI device is unbound internally and the Devres container will restrict
subsequent accesses from drivers.

It pretty much does the same thing as drm_dev_enter() / drm_dev_exit(), but
additionally prevents access to the (meanwhile) invalid pointer to the device
resource and ensures that the driver can't make device resources out-live device
unbind.

As mentioned above, the Devres container is just one example of how we prevent
such things; it depends on the exact scenario. In either case, I don't want the
driver itself to be responsible to setup the corresponding guards, that would
make the corresponding abstractions unsound.
