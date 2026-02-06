Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FC730E826;
	Fri,  6 Feb 2026 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412033; cv=none; b=kAvw3kPGCeMkQxsOnPI+hbs4C7/B/pcUnOVfCJpOY9it++V5KXiQUYzMlAVymtV759JMG16hRO/R3ghCDqRPHlDyDfcHMA33DH9i1SXzTeVmP2aEywCj7/IpY/Ikcq3q7Xo9pOHm8UIc7lHicL4jIRsToLKOWxSMilQyf7UDuOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412033; c=relaxed/simple;
	bh=LtcxgoRKL4sjK+jIifUcAAOP9C3TtO9XKPs/SMGOxAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh4qwiwJ6A+ZNCYdksl46G4YPa4hJMRLPacNx5WaXPkgk+XYSJWZfJ+LKqV0swCdHE6qjH4QBaxovXPZ5WGrJ4GjrWLfF18xD/qYzKfELTQANki0A6aD2ebfLDykga2qKDOPhvrljGbJi9Wzs85n90PV3mSQThP16kW2xEJiSjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=RJmvK2WE; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="RJmvK2WE"
Received: by linux.microsoft.com (Postfix, from userid 1216)
	id 08B8F20B7165; Fri,  6 Feb 2026 13:07:08 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 08B8F20B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1770412028;
	bh=QHhFsm+Yua08+UJRHnagSPTRvBfQ80Xbp/EGFVzsY1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJmvK2WED8YcVNjS2slvWJ5Xj1gdpHtMaK5S1pdluk4fR3qxC66WHpry3tOqxJUN1
	 1FQZjez5MYYsKNg/oktrmKGyskRv/yl0ru9i/cIpleGFsfi7YteCdHMUNmOEo4Kszz
	 jgrqpUJBSIg4SeY0JxzTzoxi8jtJskCiJcrPEqeE=
Date: Fri, 6 Feb 2026 13:07:07 -0800
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: Greg KH <gregkh@linuxfoundation.org>
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
Message-ID: <aYZX+8tHkjmBflnh@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260203215555.832171-1-hamzamahfooz@linux.microsoft.com>
 <2026020440-herbs-tranquil-d0a5@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020440-herbs-tranquil-d0a5@gregkh>

On Wed, Feb 04, 2026 at 06:24:18AM +0100, Greg KH wrote:
> On Tue, Feb 03, 2026 at 01:55:55PM -0800, Hamza Mahfooz wrote:
> > This feature is required for our Hyper-V VMBus reimplementation effort.
> > As it provides the ability to modify the running state of work items at
> > runtime.
> 
> This is great, BUT we need to see the user of this new code at the same
> time before adding it to the kernel tree.  Why not just submit this as
> part of your patch series for the rust hyperv stuff?

I don't have the rest fully fleshed out quite yet. So, mostly just
working on getting the prerequistes in a good state. I can mark it as an
RFC if that is preferable.

> 
> thanks,
> 
> greg k-h
