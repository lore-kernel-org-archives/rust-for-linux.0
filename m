Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5612A29898A
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753097187; cv=none; b=kNSq9ixwyqALUic8JYhn4cMXhL8lD/KYmZTDxOtgrHcdJf3tI0/urJGgHM9uCuPuJC8bVFI4jurB41c227UnEDYqu5h7zQP1A7cjzeSiU0+Fh69e+ShQbnW1P6pDm8pCBAsUO5ctDX4OeHU/WBpEICQ2/cGgKYhz/8Lgj0Ty6QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753097187; c=relaxed/simple;
	bh=woPGYWSw8z7t7ihug/zUhP4MFuonqYhSapo2vzn0nbc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fADfJ/pwDVB6xu7QfQGSZMxZmisY4uja1Utxfo54Jd6sxSiZCeWxRiKC9Pazwb1wIWcJUclgyIq1xP7/iRfu+lTFugskioUX4XkqV/+Q+Fg9xWxHn1XcjrsiQEEmtKDFW4NT6dSz6Pj1m/6ngqd1tLSy39jfvu0ROtEGjRydung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cwrhtaVV; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cwrhtaVV"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b5fe97af5fso1751089f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753097184; x=1753701984; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0FnwG0Wks8ncb9oG0ugMoL44qLAawuSLECH5pGfwcwg=;
        b=cwrhtaVVIRCAbMQGpdjPUu4D072IOn/hSZCIEmgV1+xbh7kKr/dcMP79ELOFHYH2JO
         FWzOkEK+H62aGiQ8qymRaJ/Pd03FanPXwKu4T+G9EmoDOZIo755pSqBR7azbdoBbKi6n
         dRRqLkb8sXeCcGzrRkjbbZDPfVDKSjPV0BJENh4dJ35ASionSJo0fHYSCIfFZ4FAh5DO
         jxjI/Me0lpWMyjt4q7HcvZFoUJnfCn1A7D8Nf782cWCvLi3s2Zw7ss6U2n54NeIm5Bs5
         lYxygNDfEZfROyHxqmVJirPc8CKsaC88zs534742R4PrzQVMMwSQ1ZM66Jzn3E9f9TQU
         1fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753097184; x=1753701984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0FnwG0Wks8ncb9oG0ugMoL44qLAawuSLECH5pGfwcwg=;
        b=mWtjMNoVhyv0/c4VZPwHFcKhjESF4+M7Pk5Wa/Eq9Su8Bx0Zk/7+Kj7wh5h5toxZAu
         oNYm2uxWDVvFGITotZOu87gEK3oQcfJv4o1gesOcVUecLmHtZXu1rjk7IHSlKATKzdIc
         GvEoMoZ70GQFUBJ4QSuhRANtjhUDSBA3EtVu6m9yC3LR9SwiW8WEaUz4On9XT68+Xr5P
         ux5FnUrAtozNUKL/sjqkb5gqUBsk53+lYCYEGkSVNAteKg62L8IoZmMozRSfs6RigSOf
         Ti45fTo58KZbczvAvEFNyI2twZjCfpx+aFM4kmUvQns6pysXX+3azesUW4Gh5hBFFikj
         8aCA==
X-Forwarded-Encrypted: i=1; AJvYcCX/g8l1rtnUl2z4hz/bBV+vsL90819egq+2M8BLej3rPf6abrxqUgwWo6FqkNTdhAoUemjscPnzo7xZHD/48w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Ho4b9VroVBErt8uYeVxFRRqmr+LxujSgb1otYpL30snPCdvi
	b4bj3MziFoSJBr9jooXYoAtfv3hVcb3CUqh2OcMVcF5ZmUXIj+ZPXvmPnmH7zTDeE6tOyiWejj7
	0WZpdlA/UEM6gTJjShg==
X-Google-Smtp-Source: AGHT+IEwnoxp32ZFdX/kvyH4WdQU+gDfZpM/uvNeHtCqEsC9IqeYlY9XiCD5errB0TB1vqdBY45JE1nKg7NjUJA=
X-Received: from wrbbs4.prod.google.com ([2002:a05:6000:704:b0:3a4:f6e8:f3cc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40de:b0:3b6:1e6:c9fb with SMTP id ffacd0b85a97d-3b60e4c510dmr18501857f8f.11.1753097183776;
 Mon, 21 Jul 2025 04:26:23 -0700 (PDT)
Date: Mon, 21 Jul 2025 11:26:23 +0000
In-Reply-To: <20250717224806.54763-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250717224806.54763-1-dakr@kernel.org> <20250717224806.54763-3-dakr@kernel.org>
Message-ID: <aH4juIVmj8euE1CA@google.com>
Subject: Re: [PATCH 2/3] device: rust: expand documentation for Device
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 18, 2025 at 12:45:38AM +0200, Danilo Krummrich wrote:
> The documentation for the generic Device type is outdated and deserves
> much more detail.
> 
> Hence, expand the documentation and cover topics such as device types,
> device contexts, as well as information on how to use the generic device
> infrastructure to implement bus and class specific device types.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Overall I think this series is pretty great. It also clarifies some
things for me, particularly the difference between bus and class
devices.

> +/// # Device Types
>  ///
> +/// A [`Device`] can represent either a bus device or a class device.
>  ///
> +/// ## Bus Devices
> +///
> +/// A bus device is a [`Device`] that is associated with a physical or virtual bus. Examples of
> +/// buses include PCI, USB, I2C, and SPI. Devices attached to a bus are registered with a specific
> +/// bus type, which facilitates matching devices with appropriate drivers based on IDs or other
> +/// identifying information. Bus devices are visible in sysfs under `/sys/bus/<bus-name>/devices/`.
> +///
> +/// ## Class Devices
> +///
> +/// A class device is a [`Device`] that is associated with a logical category of functionality
> +/// rather than a physical bus. Examples of classes include block devices, network interfaces, sound
> +/// cards, and input devices. Class devices are grouped under a common class and exposed to
> +/// userspace via entries in `/sys/class/<class-name>/`.
> +///
> +/// # Device Context
> +///
> +/// [`Device`] references are generic over a [`DeviceContext`], which represents the type state of
> +/// a [`Device`].
> +///
> +/// As the name indicates, this type state represents the context of the scope the [`Device`]
> +/// reference is valid in. For instance, the [`Bound`] context guarantees that the [`Device`] is
> +/// bound to a driver for the entire duration of the existence of a [`Device<Bound>`] reference.
> +///
> +/// Other [`DeviceContext`] types besides [`Bound`] are [`Normal`], [`Core`] and [`CoreInternal`].
> +///
> +/// Unless selected otherwise [`Device`] defaults to the [`Normal`] [`DeviceContext`], which by
> +/// itself has no additional requirements.
> +///
> +/// It is always up to the caller of [`Device::from_raw`] to select the correct [`DeviceContext`]
> +/// type for the corresponding scope the [`Device`] reference is created in.
> +///
> +/// All [`DeviceContext`] types other than [`Normal`] are intended to be used with
> +/// [bus devices](#bus-devices) only.

This raises a few questions for me.

The first one is "why"? On other series I have been told that interrupts
must be registered and deregistered before the device is unbound. Does
the same not apply to interrupts for an input device such as a USB
keyboard?

The second one is why we use the same `Device` type for both cases?
Would it not make more sense to have a BusDevice and ClassDevice type?

> +/// # Implementing Bus Devices
> +///
> +/// This section provides a guideline to implement bus specific devices, such as
> +/// [`pci::Device`](kernel::pci::Device) or [`platform::Device`](kernel::platform::Device).
> +///
> +/// A bus specific device should be defined as follows.
> +///
> +/// ```ignore
> +/// #[repr(transparent)]
> +/// pub struct Device<Ctx: device::DeviceContext = device::Normal>(
> +///     Opaque<bindings::bus_device_type>,
> +///     PhantomData<Ctx>,
> +/// );
> +/// ```
> +///
> +/// Since devices are reference counted, [`AlwaysRefCounted`](kernel::types::AlwaysRefCounted)
> +/// should be implemented for `Device` (i.e. `Device<Normal>`). Note that
> +/// [`AlwaysRefCounted`](kernel::types::AlwaysRefCounted) must not be implemented for any other
> +/// [`DeviceContext`], since all other device context types are only valid in a certain scope.

As a general comment to all three patches, I would suggest separating
out the link locations.

/// Since devices are reference counted, [`AlwaysRefCounted`] should be
/// implemented for `Device` (i.e. `Device<Normal>`). Note that
/// [`AlwaysRefCounted`] must not be implemented for any other
/// [`DeviceContext`], since all other device context types are only
/// valid in a certain scope.

and then at the end:

/// [`AlwaysRefCounted`]: kernel::types::AlwaysRefCounted

I think it's a lot easier to read the markdown version when links are
separated out like this.

Alice
