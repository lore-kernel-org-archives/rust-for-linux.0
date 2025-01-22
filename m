Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D68217C220;
	Wed, 22 Jan 2025 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537746; cv=none; b=J6IqG02Jrxe7+zT2IuBimCl6N71SuPmRa2CUzWMCxOlFkk2LsI4+x5fbvdh54NrPo2cjbd/kYQuU6lRh/I8sOR+Qz5QlEUcNWSlIzks4U3KhhofF5K1opnKK1RPOZg5W4McA91qU+d2aESskYCD6d9EXL2xdiPnKP38Gk5HrYZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537746; c=relaxed/simple;
	bh=wovu7ZbtScbYz1GGTfhjz4IUl0UpMlqk+Zu/xFdlUFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=re365mOgvsGVJAZwi2ZVARMUDzZTp+FUHKsRa6atkyo5rUogYSqE1JYuQ34aClf6Z4d6OsdDgIVK+HfY551D7/sZxbdC86+iRdH1rPMFclrDt0e20Q6NVMQ9wxxPdE9QYf6JG2+ykf9g4bu1YE0Kl1fjFTvajrGoZ7cw7pNEqwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=15ykgRbd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="15ykgRbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5BDC4CED6;
	Wed, 22 Jan 2025 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737537745;
	bh=wovu7ZbtScbYz1GGTfhjz4IUl0UpMlqk+Zu/xFdlUFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=15ykgRbdNkNEMqZ3xDT5uxsZzt8TCIJzCvcwg89xX1fi1TUweT6LlfOAH3ReEVfHq
	 KzzpP6bi9A61VjP70yzdYL4tlx3vS3Qb0OC+K5Ec70mLn82scf9NkyFgi0ohcCpXte
	 tMmztO1kyzIqrNuum3+dYxS3fU/9tViHPJ+TWH+s=
Date: Wed, 22 Jan 2025 10:22:23 +0100
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
Subject: Re: [PATCH 0/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
Message-ID: <2025012210-curry-gratified-a614@gregkh>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <2025012034-rope-canned-43da@gregkh>
 <41cee8ac-f773-4e7b-8249-2de5d7807287@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41cee8ac-f773-4e7b-8249-2de5d7807287@gmail.com>

On Tue, Jan 21, 2025 at 11:29:40AM +0100, Christian Schrefl wrote:
> 
> On 20.01.25 6:46 AM, Greg Kroah-Hartman wrote:
> > On Sun, Jan 19, 2025 at 11:11:12PM +0100, Christian Schrefl wrote:
> >> This set is based on Greg's driver-core-next tree.
> >>
> >> Currently there is no good way to pass arbitrary data from the driver to
> >> a miscdevice or to share data between individual handles to a miscdevice in rust.
> > 
> > Why would you want to do this?  A misc device instance should be "self
> > contained" with the needed stuff to make it work.
> > 
> > Do you have an example of where this is needed as I can't figure out the
> > goal here, sorry.
> 
> The main reason for needing this was that I could not figure out how to otherwise
> use a Devres from the platfrom driver probe in the implementation of the miscdevice.

A platform device has nothing to do with a misc device.  They should be
separate as they have totally different lifecycles.

> The reason to add this to MiscDeviceRegistration is to avoid race-conditions between
> the fops and driver registration/deregistration.
> (See the commit description of patch 2/3)
> 
> If there is a better or more intended way to achieve that please let me know.

I think you need an object that contains both of these, the driver_data
pointer field for the misc device should be able to be used for this,
right?

thanks,

greg k-h
