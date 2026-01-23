Received: from sender4-pp-e107.zoho.com (sender4-pp-e107.zoho.com [136.143.188.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E19E352920;
	Fri, 23 Jan 2026 01:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132532; cv=pass; b=hSwBLFNJHG3z/x9C6ppYwPAS0qHD84foFkaHWusc4KCit3zUE6sTcNe9XCmEtyGPz2VJ2JqM7rA/ZJ4z6/KiXLRh1V1Hs3sSy7nxr6RrfSkrGmRXlFIDt7JAnNua/mfE+LwcZOj8TTYGhbbxBfywZv2iXFUtklVrDUehqd/tTpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132532; c=relaxed/simple;
	bh=FIZpoiQtgkOAhTfzGocvXW2gWninCmD4iI2z7ihIIIM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=g2yh6IpQ2dz4G9SeK4jNHzxZDfdOmuAX6uq5DHBviV4/pjzXzh2KdHE8bVID3kgp2qpF9O8KbGKf2BY1EYXFPAjG57u6uqJ2s6aOAl36pB03Wc0Ihb05LpxJSBz0CETag3nCIaviRy9/GI4nSGHRvQ7nw0vKu/KoiDw7v3WSslA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=lO0Q6Byl; arc=pass smtp.client-ip=136.143.188.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="lO0Q6Byl"
ARC-Seal: i=1; a=rsa-sha256; t=1769132513; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=etxDCOe8onm+rexMExPRGupsJ1FElwBvfwLdo6KiRt6ij1QkPmgJmX1N0dry7o1UqefE5LzYFUizhPcAvqspyqGOhEorcPH3vjbvfJIyjY22OFpQyZSgviT4kG7CcwTW997RPkfGoml5WdBsW0zTmUS/PvYf/LEvw0EBWw+nHPM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769132513; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B2E/pdvjGJdEf8yl6+nKJ4aiGgNEIwYqtgyXIg34CGY=; 
	b=YgbLdDzQH0CBY5nTC/+TiXOU7nsLznYMJJxYDJ+Qf2s/u+5odZqNFVLr3dHXbYMsq2qeInlCoMY5aMDbHJNdL57MY3M5MvZw4Gwg1nWulfHy0uhVAMTH3ug2R6o4/Mt4FUgJigiOM3h3+eRUfTobmYrBqZrqOX+bt8tZeto66jE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769132513;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=B2E/pdvjGJdEf8yl6+nKJ4aiGgNEIwYqtgyXIg34CGY=;
	b=lO0Q6Byl2Lr8RRUyL18rO1KskDkfUJUccUAOpH3rywMQPdYtGH1iEMWszO4G1k9J
	9OCFiOQWRmfPkNGQ6Ssah697CIeuqpWD6sXOTCzxSgF7DFrSC2UES/gzszA/5FhcKEA
	EC+ttVndloGxs7tZYQgz9AZ/CQkI+GV4oK3sSpkg=
Received: by mx.zohomail.com with SMTPS id 1769132511680242.43444565853054;
	Thu, 22 Jan 2026 17:41:51 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust/drm: Introduce DeviceContext
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260122225057.3589500-2-lyude@redhat.com>
Date: Thu, 22 Jan 2026 22:41:19 -0300
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
Content-Transfer-Encoding: 7bit
Message-Id: <C7E53051-738B-47CF-9A12-28D683FA0D4F@collabora.com>
References: <20260122225057.3589500-1-lyude@redhat.com>
 <20260122225057.3589500-2-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Lyude,

> On 22 Jan 2026, at 19:46, Lyude Paul <lyude@redhat.com> wrote:
> 
> One of the tricky things about DRM bindings in Rust is the fact that
> initialization of a DRM device is a multi-step process. It's quite normal
> for a device driver to start making use of its DRM device for tasks like
> creating GEM objects before userspace registration happens. This is an
> issue in rust though, since prior to userspace registration the device is
> only partly initialized. This means there's a plethora of DRM device
> operations we can't yet expose without opening up the door to UB if the DRM
> device in question isn't yet registered.
> 
> Additionally, this isn't something we can reliably check at runtime. And
> even if we could, performing an operation which requires the device be
> registered when the device isn't actually registered is a programmer bug,
> meaning there's no real way to gracefully handle such a mistake at runtime.
> And even if that wasn't the case, it would be horrendously annoying and
> noisy to have to check if a device is registered constantly throughout a
> driver.
> 
> In order to solve this, we first take inspiration from
> `kernel::device::DeviceContext` and introduce `kernel::drm::DeviceContext`.
> This provides us with a ZST type that we can generalize over to represent
> contexts where a device is known to have been registered with userspace at
> some point in time (`Registered`), along with contexts where we can't make
> such a guarantee (`Uninit`).
> 
> It's important to note we intentionally do not provide a `DeviceContext`
> which represents an unregistered device. This is because there's no
> reasonable way to guarantee that a device with long-living references to
> itself will not be registered eventually with userspace. Instead, we
> provide a new-type for this: `UnregisteredDevice` which can
> provide a guarantee that the `Device` has never been registered with
> userspace. To ensure this, we modify `Registration` so that creating a new
> `Registration` requires passing ownership of an `UnregisteredDevice`.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> ---
> V2:
> * Make sure that `UnregisteredDevice` is not thread-safe (since DRM device
>  initialization is also not thread-safe)
> * Rename from AnyCtx to Uninit, I think this name actually makes a bit more
>  sense.
> * Change assume_registered() to assume_ctx()
>  Since it looks like in some situations, we'll want to update the
>  DeviceContext of a object to the latest DeviceContext we know the Device
>  to be in.
> * Rename Init to Uninit
>  When we eventually add KMS support, we're going to have 3 different
>  DeviceContexts - Uninit, Init, Registered. Additionally, aside from not
>  being registered there are a number of portions of the rest of the Device
>  which also aren't usable before at least the Init context - so the naming
>  of Uninit makes this a little clearer.
> * s/DeviceContext/DeviceContext/
>  For consistency with the rest of the kernel
> * Drop as_ref::<Device<T, Uninit>>() for now since I don't actually think
>  we need this quite yet
> V3:
> * Get rid of drm_dev_ctx!, as we don't actually need to implement Send or
>  Sync ourselves
> * Remove mention of C function in drm::device::Registration rustdoc
> * Add more documentation to the DeviceContext trait, go into detail about
>  the various setup phases and such.
> * Add missing period to comment in `UnregisteredDevice::new()`.
> 
> drivers/gpu/drm/nova/driver.rs |   8 +-
> drivers/gpu/drm/tyr/driver.rs  |  10 +-
> rust/kernel/drm/device.rs      | 179 +++++++++++++++++++++++++++------
> rust/kernel/drm/driver.rs      |  38 +++++--
> rust/kernel/drm/mod.rs         |   4 +
> 5 files changed, 193 insertions(+), 46 deletions(-)
> 

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

