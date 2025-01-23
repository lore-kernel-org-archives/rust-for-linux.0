Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7502423CB;
	Thu, 23 Jan 2025 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737648060; cv=none; b=nsNfRXiwO5DTb3fSGcF4XtvrvpMZgdov3hv5Mny5gtIAYPCu0+Waq43dl0LRrFZkxdtDkSeULEtFw1cbUiA2PDpuYs13s/M63dVLAlcJvglK9ttwm+SECAmKpo9jb4rS/y49obt0VcGo0mOMH0P9TtntDFGG/QxISN4XXa74IRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737648060; c=relaxed/simple;
	bh=Q2GSc5LQdQNPFkYYwQg3KeAUXOh8K3YFa7SKgpZuNwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E58u+SA3g3UnTojKz9//BdaXxvlyb7wTnBGMYZgRXBf6ls7b8HeLzyir3pdDKIVGlbqHsTA5uhWDrnebvpAafE/ACRNqQZIGsTEWG6f2LKEzkp/+K2kPmS2bIdlnZvEMRA1jYHYsstFZzpVDxh+krKzOP9j3zfI7QU8BthRAJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b7WcF+k/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b7WcF+k/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42769C4CED3;
	Thu, 23 Jan 2025 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737648059;
	bh=Q2GSc5LQdQNPFkYYwQg3KeAUXOh8K3YFa7SKgpZuNwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7WcF+k/Yy988+6zP8hdwO2woh3+2zDEm4RIA0aRlo6eRKMLRnLHEwV00nPoaGgLz
	 ofCPKvGE8+9KJ4to7qj6r2QqTxyyZg8JbbAuJKeifGzFtQ/N5X7EMlDbkyttJn0clU
	 mC5E9F4LoKegDMvzOOIUW1YqvrIjKy2GYk136cdY=
Date: Thu, 23 Jan 2025 17:00:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
Message-ID: <2025012337-wired-sensually-5c49@gregkh>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
 <2025012243-myspace-woof-1d1e@gregkh>
 <81cffd91-6b0b-4f09-a5c8-e1697975502e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81cffd91-6b0b-4f09-a5c8-e1697975502e@gmail.com>

On Thu, Jan 23, 2025 at 04:52:26PM +0100, Christian Schrefl wrote:
> 
> 
> On 22.01.25 10:28 AM, Greg Kroah-Hartman wrote:
> > On Sun, Jan 19, 2025 at 11:11:14PM +0100, Christian Schrefl wrote:
> >> When using the Rust miscdevice bindings, you generally embed the
> >> MiscDeviceRegistration within another struct:
> >>
> >> struct MyDriverData {
> >>     data: SomeOtherData,
> >>     misc: MiscDeviceRegistration<MyMiscFile>
> >> }
> >>
> >> In the `fops->open` callback of the miscdevice, you are given a
> >> reference to the registration, which allows you to access its fields.
> >> For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
> >> accessor to pull out miscdevice::this_device") you can access the
> >> internal `struct device`. However, there is still no way to access the
> >> `data` field in the above example, because you only have a reference to
> >> the registration.
> > 
> > What's wrong with the driver_data pointer in the misc device structure?
> > Shouldn't you be in control of that as you are a misc driver owner?  Or
> > does the misc core handle this I can't recall at the moment, sorry.
> 
> 
> I don't know the internals of (C) miscdevice good enough to know where I'm
> allowed to store something, since there is no private_data field.

You are right, I was wrong here, sorry.  A misc device either needs to
be "stand alone" or embedded into something else.

> Not sure how the lifetimes of the whole device and device->driver_data are.
> But even that instead we use that we will need a rust abstraction for that to
> allow safe drivers.

Agreed, so let's make it work properly :)

> > 
> >> Using container_of is also not possible to do safely. For example, if
> >> the destructor of `MyDriverData` runs, then the destructor of `data`
> >> would run before the miscdevice is deregistered, so using container_of
> >> to access `data` from `fops->open` could result in a UAF. A similar
> >> problem can happen on initialization if `misc` is not the last field to
> >> be initialized.
> >>
> >> To provide a safe way to access user-defined data stored next to the
> >> `struct miscdevice`, make `MiscDeviceRegistration` into a container that
> >> can store a user-provided piece of data. This way, `fops->open` can
> >> access that data via the registration, since the data is stored inside
> >> the registration.
> > 
> > "next to" feels odd, that's what a container_of is for, but be careful
> > as to who owns the lifecycle of the object you are trying to get to.
> > You can't have multiple objects with different lifecycles in the same
> > structure (i.e. don't mix a misc device and a platform device together).
> > 
> > So a real example here would be good to see, can you post your driver at
> > the same time so that we can see what you are doing and perhaps provide
> > a better way to do it?
> 
> 
> The `struct miscdevice` is currently the first item in the 
> `MiscDeviceRegistration` so the  `struct miscdevice` and the 
> `MiscDeviceRegistration` have the same address.
> I can use container_of! if people think that more understandable.

You always have to use container_of! in case things move around.  If the
location is the same place, then the compiler just optimizes it all away
and doesn't do any pointer math so it's fine.

thanks,

greg k-h
