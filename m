Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CCD8C00
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 06:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A1AC433C7;
	Fri, 29 Sep 2023 06:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695967417;
	bh=gpg7IFallySpjEx4Zpkuq7Ra20fWMpyRkicBugyvuLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bepIvYMTC9j+eR/aQZd5tDp2BavYcTSAc3cE6+r7VxEykQWJ7H864JSQxZcER01Pq
	 ADefboFu84G75FFlPzqs4SxA4Zfbe1LlUVtztdZ4Dbz5+iSztM+aPjQT5WNqKCZnpx
	 HLpe+7oav926qSYaib2mGwzYSZ7+M1JsV+N9ta0c=
Date: Fri, 29 Sep 2023 08:03:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me,
	wedsonaf@gmail.com
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <2023092900-manpower-runaround-859a@gregkh>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928225518.2197768-2-fujita.tomonori@gmail.com>

On Fri, Sep 29, 2023 at 07:55:16AM +0900, FUJITA Tomonori wrote:
> +/// Corresponds to the kernel's `enum phy_state`.
> +#[derive(PartialEq)]
> +pub enum DeviceState {
> +    /// PHY device and driver are not ready for anything.
> +    Down,
> +    /// PHY is ready to send and receive packets.
> +    Ready,
> +    /// PHY is up, but no polling or interrupts are done.
> +    Halted,
> +    /// PHY is up, but is in an error state.
> +    Error,
> +    /// PHY and attached device are ready to do work.
> +    Up,
> +    /// PHY is currently running.
> +    Running,
> +    /// PHY is up, but not currently plugged in.
> +    NoLink,
> +    /// PHY is performing a cable test.
> +    CableTest,
> +}
> +
> +/// Represents duplex mode.
> +pub enum DuplexMode {
> +    /// Full-duplex mode
> +    Half,
> +    /// Half-duplex mode
> +    Full,
> +    /// Unknown
> +    Unknown,
> +}

How are these enums going to be kept in sync with the C code?  This
doesn't seem like a good idea and will quickly cause very strange bugs
that will be impossible to debug :(

> +
> +/// Wraps the kernel's `struct phy_device`.

This is going to get very tricky as you are "inheriting" a "struct
device" from the driver core which has lifespan rules of its own.  How
are you ensuring that those are correct?

> +///
> +/// # Invariants
> +///
> +/// `self.0` is always in a valid state.
> +#[repr(transparent)]
> +pub struct Device(Opaque<bindings::phy_device>);
> +
> +impl Device {
> +    /// Creates a new [`Device`] instance from a raw pointer.

meta-comment, how is the proliferation of "Device" implementations all
across the kernel going to be able to be kept apart when searching the
code?  This feels like a tough namespace issue over time or am I just
not used to how rust does this?

> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
> +    /// may read or write to the `phy_device` object.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> +        unsafe { &mut *ptr.cast() }
> +    }

Why not rely on the driver model reference counting to ensure that you
get a reference to the object, use it, and then you can drop it?  That
way you "know" it can not go away from underneath you?

> +
> +    /// Gets the id of the PHY.
> +    pub fn id(&mut self) -> u32 {
> +        let phydev = self.0.get();
> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> +        unsafe { (*phydev).phy_id }
> +    }
> +
> +    /// Gets the state of the PHY.
> +    pub fn state(&mut self) -> DeviceState {
> +        let phydev = self.0.get();
> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> +        let state = unsafe { (*phydev).state };
> +        match state {
> +            bindings::phy_state::PHY_DOWN => DeviceState::Down,
> +            bindings::phy_state::PHY_READY => DeviceState::Ready,
> +            bindings::phy_state::PHY_HALTED => DeviceState::Halted,
> +            bindings::phy_state::PHY_ERROR => DeviceState::Error,
> +            bindings::phy_state::PHY_UP => DeviceState::Up,
> +            bindings::phy_state::PHY_RUNNING => DeviceState::Running,
> +            bindings::phy_state::PHY_NOLINK => DeviceState::NoLink,
> +            bindings::phy_state::PHY_CABLETEST => DeviceState::CableTest,

Again, this feels like a maintance nightmare.

thanks,

greg k-h
