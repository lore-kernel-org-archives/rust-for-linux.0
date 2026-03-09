Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520DAF4FA;
	Mon,  9 Mar 2026 15:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069362; cv=none; b=FBTUgLC2sD0a8Iq6zvIrBm/H+zojV6WI5lqaDL1kSEK/0f/QCA01lTm7xIPDEDQjF0m0jQT33Xzvf6zcu4TIitgZp2a5FrFU2z+mNvrzXNKYxYRnF2s0jpaFrs2i1vIohJVK6Qh+g9Lxy6Xrl95jdQTD2O99ooCLsg48ecNx4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069362; c=relaxed/simple;
	bh=nfyiKYvZryQo36/VoruYmzTe+JUCokH5JDpL5h5YcAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUr3yvY5y7m4f88iW/57intoob34fAcD4GtiQ1h/rxHKNzt4wFt02syREUs3jtEteMZW9hb40L7P0YL41tnkW+rn9UFBZLNMPp18pcqcdOJYFSH48oMvNPwtQxPDgNsplJBk5gjxVwq60tuKZFEZoezj60UTbendJ4WQSBbO2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CE67rPFL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CE67rPFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438D7C4CEF7;
	Mon,  9 Mar 2026 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069361;
	bh=nfyiKYvZryQo36/VoruYmzTe+JUCokH5JDpL5h5YcAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CE67rPFLmJ7PHFeI0gcI7XaIzFjTpT57mjSxL2FdocwN/H+XHUMl1QNuSCTr7B7io
	 qClWqeaO3D1W+Vhs9UVEuCHuxiDwPbSmZXGcE5SiWXuoY+3s/MjIHWesOScuqwMaXi
	 LmzQucCySDY/NSVqnWoEpe0K/au2IIuiZK2Csij9BO9e1NA8Gmt6E6cBzdB8XGaEtP
	 9QwioM1XnZJlR3YEnuxLiUIuPpkl8cdaVE2XZrXv8smRHmuORwYz1V48Ec7YSwSgZF
	 OUjbQlybPp7ROz9yorR0AFvmLtmVd3LZzfWZ2JRs7d07opiPyC3uig7O+yH300D9+G
	 ZW/9iHGcZNd7g==
Date: Mon, 9 Mar 2026 15:15:55 +0000
From: Lee Jones <lee@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: Add initial synology microp driver
Message-ID: <20260309151555.GU183676@google.com>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
 <2026030827-nautical-overplant-399c@gregkh>
 <8efdf3e1bbf24504d560c12131cade543bec82f5.camel@posteo.de>
 <2026030913-agonizing-shoptalk-ed98@gregkh>
 <7f8d979a881b29398f524f526f52ba9727d95a7c.camel@posteo.de>
 <DGYAFNSJ7576.1E0JZ2W499ZQ7@kernel.org>
 <e43ca445ec7887d3d15676adb7db04f5685f4195.camel@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e43ca445ec7887d3d15676adb7db04f5685f4195.camel@posteo.de>

On Mon, 09 Mar 2026, Markus Probst wrote:

> On Mon, 2026-03-09 at 14:32 +0100, Danilo Krummrich wrote:
> > On Mon Mar 9, 2026 at 1:52 PM CET, Markus Probst wrote:
> > > Yes. I will split it into multiple drivers using the aux bus in the
> > > next revision.
> > 
> > Independent of the other discussion whether this belongs into the kernel in the
> > first place, reading over the cover letter and commit message I understood the
> > following.
> > 
> >   "Synology uses a microcontroller in their NAS devices connected to a serial
> >   port [...]" controlling LEDs, fan speeds, a beeper, etc.
> > 
> >   I.e. it muliplexes several physical functions that belong to different
> >   subsystems, such as hwmon, input, etc. over a single serial port.
> > 
> > This sounds like a textbook candidate for MFD to me.

Then you do not know what a textbook candidate for MFD is. :)

What part of the MFD API does this device utilise?

> > I.e. there is a very loose coupling of the different functions that make up for
> > entirely independent drivers, except that they share the same serial port
> > connection.
> > 
> > Whereas the auxiliary bus is more for very complicated devices to be broken down
> > into more managable (sometimes optional) sub-domains, where the corresponding
> > drivers usually have driver specific APIs to interact with each other.
> > 
> > - Danilo
> 
> QNAP and Synology do things very similarly.
> There is already a driver for QNAP devices:
> 
> drivers/mfd/qnap-mcu.c
> drivers/leds/leds-qnap-mcu.c
> drivers/input/misc/qnap-mcu-input.c
> drivers/hwmon/qnap-mcu-hwmon.c
> drivers/nvmem/qnap-mcu-eeprom.c
> 
> drivers/power/reset/qnap-poweroff.c (this one is not part of the mfd)
> 
> and I try to implement the equivalent for Synology devices.
> Given its a MFD I would assume the same applies to this driver?

Of course not.

The QNAP driver above calls devm_mfd_add_devices().

This one uses none of the MFD functionality provided.

Linux supports 10's if not 100's of devices which do more than one
thing.  Only a fraction of them are Linux MFDs.  MFD in Linux is an API,
not a type of device.

Don't get me wrong, you could probably code up this device as a Linux
MFD, but you have chosen not to, so therefore it cannot reside here.

-- 
Lee Jones [李琼斯]
