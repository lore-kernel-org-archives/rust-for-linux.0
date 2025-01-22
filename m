Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3500521146F;
	Wed, 22 Jan 2025 12:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737549620; cv=none; b=nGYWg0f1lqpxFVCrVYpyHsCJjcuf1jmh/6/SVVUNuWrTmkMOH7Hs5d7OiK+z+UP3z2QXizSUYAifb8+hR2PdylR80XuL12uDO8oUPPrMBVFOQ12wxqA9m1Ab7g3Ywr7lNt243I6GVS8tNoGmkd77go7HCklRKlbftO/3kvCAWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737549620; c=relaxed/simple;
	bh=G1/8pmXRPOW4Iq3qKvQsEJSG7i5Hu05GSIYdptuPEi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2pITpceArs54DgTKzgk7ObpImleW+9ela6zDjrtqLqOpLhfhPjAl6CI8cL6Kus9WmJJN0SYoil5qDDmHjKvuzPLxaEandS4QQgnQTWxvBFs3I8Lm3rdOASA53BHn0ZpcVyYsehrY6x4Br+Z0Ht5YcGHN4xwFVymvBUlh3jPL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dOndvst1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dOndvst1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6411DC4CED6;
	Wed, 22 Jan 2025 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737549620;
	bh=G1/8pmXRPOW4Iq3qKvQsEJSG7i5Hu05GSIYdptuPEi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOndvst1REMv2b83SJEezwJCmfkrW1z0r8LaKE1HyvPZQLzDT1IiNLepqHOMS5Fv4
	 acP9E40y+tU6kxHpNKJDXVz7z7+N4kZAkEUWs4i01FV16fo05YMEgK6RXK1zKdiC2S
	 p0MT1vNpLI/hY1DlRi/UIqksJYOlEZqTBtNDm09M=
Date: Wed, 22 Jan 2025 13:40:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
	Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
Message-ID: <2025012236-tall-untried-1d7c@gregkh>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
 <2025012243-myspace-woof-1d1e@gregkh>
 <CAH5fLgh7QyVSgqJZM-krHmF87c76a84Cg6PyT47TYjMsN9iwZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgh7QyVSgqJZM-krHmF87c76a84Cg6PyT47TYjMsN9iwZg@mail.gmail.com>

On Wed, Jan 22, 2025 at 11:11:07AM +0100, Alice Ryhl wrote:
> On Wed, Jan 22, 2025 at 10:28 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Jan 19, 2025 at 11:11:14PM +0100, Christian Schrefl wrote:
> > > When using the Rust miscdevice bindings, you generally embed the
> > > MiscDeviceRegistration within another struct:
> > >
> > > struct MyDriverData {
> > >     data: SomeOtherData,
> > >     misc: MiscDeviceRegistration<MyMiscFile>
> > > }
> > >
> > > In the `fops->open` callback of the miscdevice, you are given a
> > > reference to the registration, which allows you to access its fields.
> > > For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
> > > accessor to pull out miscdevice::this_device") you can access the
> > > internal `struct device`. However, there is still no way to access the
> > > `data` field in the above example, because you only have a reference to
> > > the registration.
> >
> > What's wrong with the driver_data pointer in the misc device structure?
> > Shouldn't you be in control of that as you are a misc driver owner?  Or
> > does the misc core handle this I can't recall at the moment, sorry.
> 
> There's no such pointer in struct miscdevice?

struct miscdevice->struct device->driver_data;

But in digging, this might not be "allowed" for a misc driver to do, I
can't remember anymore, sorry.

> > > Using container_of is also not possible to do safely. For example, if
> > > the destructor of `MyDriverData` runs, then the destructor of `data`
> > > would run before the miscdevice is deregistered, so using container_of
> > > to access `data` from `fops->open` could result in a UAF. A similar
> > > problem can happen on initialization if `misc` is not the last field to
> > > be initialized.
> > >
> > > To provide a safe way to access user-defined data stored next to the
> > > `struct miscdevice`, make `MiscDeviceRegistration` into a container that
> > > can store a user-provided piece of data. This way, `fops->open` can
> > > access that data via the registration, since the data is stored inside
> > > the registration.
> >
> > "next to" feels odd, that's what a container_of is for, but be careful
> > as to who owns the lifecycle of the object you are trying to get to.
> > You can't have multiple objects with different lifecycles in the same
> > structure (i.e. don't mix a misc device and a platform device together).
> 
> Ultimately, this is intended to solve the problem that container_of
> solves in C. Actually using container_of runs into the challenge that
> you have no way of knowing if those other fields are still valid.

You "know" they are valid if you have a pointer to your structure,
right?  Someone sent that to you, so by virtue of that it has to be
valid.

> If
> the destructor of the struct starts running, then it might have
> destroyed some of the fields, but not yet have destroyed the
> miscdevice field. Since you can't know if the rest of the struct is
> still valid, it's not safe to use container_of.

That's a different issue, that's a lifetime issue of "can I look at
these other fields at this point in time and trust them", it's not a
"these are not valid thing to look at".

> Storing those other fields within the registration solves this issue.
> The registration ensures that the miscdevice is deregistered before
> the `data` field is destroyed. This means that if it's safe to access
> the miscdevice field, then it's also safe to access the `data` field,
> and that's the guarantee we need.

I'm confused.  A misc device should be embedded inside of something
else.  And the misc device controls the lifespan of that "something
else" structure, right?  So by virtue of the misc device being alive,
everything else in there should be ok.

Now individual misc devices might want to do different things but if
they are being torn down, that means all references are dropped so any
"container_of()" like cast-back should not even be possible as there
should not be a pointer that you can cast-back from here.

Or am I confused?  I think a real example would be good to see here.

thanks,

greg k-h
