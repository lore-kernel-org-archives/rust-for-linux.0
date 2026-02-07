Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDF279DAB;
	Sat,  7 Feb 2026 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770450924; cv=none; b=fpKCN3bJINUbRBUTTRObU0k0fAuQs1XkTiXUuquVHpw5sw6CTc2stfZY/E4CnIrrtCTqQcD1erWAhf9s5qyPFwXhA/QXLMpbKNsXtcNuq62fzss2dXrHHAJcrcs5Fc7OHh3YRSUDyi74ARWBS3MpKCUSe4b3sxNw/2If4yOI1yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770450924; c=relaxed/simple;
	bh=uw4oMfnDHnjeg17cVPyrWV/dLPWO1ilGSLjGKagVj2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkHjGMCfUJjs8AdgDZO2gA6Ysk6nl8GaZuKs5aTHAjloPIl0Jf2CbNE05bbU9712hA53jkEcQgUNdRrcoOVRiuO1YEVUKj3QUWI6PfnoYj9Ndf9X9fFAztlxKS3cj6D+fwB3AuX1LmSuDX8yRfbdQMQI1xLc1iATw5jZyjq1ngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mINqwlol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mINqwlol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BF7C116D0;
	Sat,  7 Feb 2026 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770450924;
	bh=uw4oMfnDHnjeg17cVPyrWV/dLPWO1ilGSLjGKagVj2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mINqwlolIAkxXsjr9jWr3yhF4wdEGmQpatco6MBflxLUOGbCBWz0yCz4osJz+hN2y
	 20to2g5rP6ytNtPi4h0jdvGLv145QkHXy+7JeuqErk+wu0lRDp/LY7mVNN26gBrPpy
	 412I3aHslCR7LfycSvGC+AwY8vRP9OKQKJ4TbQ1Q=
Date: Sat, 7 Feb 2026 08:55:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>, Alban Kurti <kurti@invicto.ai>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add work item runtime modification
 support
Message-ID: <2026020748-italicize-joyride-cb57@gregkh>
References: <20260203215555.832171-1-hamzamahfooz@linux.microsoft.com>
 <2026020440-herbs-tranquil-d0a5@gregkh>
 <aYZX+8tHkjmBflnh@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYZX+8tHkjmBflnh@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>

On Fri, Feb 06, 2026 at 01:07:07PM -0800, Hamza Mahfooz wrote:
> On Wed, Feb 04, 2026 at 06:24:18AM +0100, Greg KH wrote:
> > On Tue, Feb 03, 2026 at 01:55:55PM -0800, Hamza Mahfooz wrote:
> > > This feature is required for our Hyper-V VMBus reimplementation effort.
> > > As it provides the ability to modify the running state of work items at
> > > runtime.
> > 
> > This is great, BUT we need to see the user of this new code at the same
> > time before adding it to the kernel tree.  Why not just submit this as
> > part of your patch series for the rust hyperv stuff?
> 
> I don't have the rest fully fleshed out quite yet. So, mostly just
> working on getting the prerequistes in a good state. I can mark it as an
> RFC if that is preferable.

Just send it all when you feel it is ready, no need to ask us to review
an api when you don't even have working code that uses it for you to
determine if it works or not :)

thanks,

greg k-h
