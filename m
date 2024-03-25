Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4E3DABF5
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711390362; cv=none; b=DFm5JnADgg8AVv8z/27tkAFP7jh9QmEcktmqTIs1UYc5cIk8cbHLy4BdjsYpWrjbRFS6+sZaKD0Bj3HfXAzNpuXteqt31bqMHeQOXdp2/ftJYRamvOsi/g24pj5MysYkAsaHoxRIseMyLZlH+xq+MlOoG2XMr48+mHizvqUEQ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711390362; c=relaxed/simple;
	bh=3e8R8HM45qQiIy7kaqzGtLFIkwlBkrWCY2L+8VL0MBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlzHAt4uKvVmMyuKPVEV/JGeKzC5bMsBNudWn2mHS5kFhBeGQhii+8i3wq11hfOl0/WwpyOSdOZ6R2UrsE0oAHoHjAHgbsItNOSjUabjgCY2BMU6H+TF3VZj/fR09Qjl4AIchwY0Iy+wD9R6AM/YhBeI2VrxvzLZkAV2xyRki/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QOVQZVqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QOVQZVqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061A5C433F1;
	Mon, 25 Mar 2024 18:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711390361;
	bh=3e8R8HM45qQiIy7kaqzGtLFIkwlBkrWCY2L+8VL0MBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOVQZVqwZrOjQ4K2mBs7S7YKtEYP9YchfE1caZmOekwlFVdSG7dlBL0DgAuHu97Pb
	 cZyl3hZILO9Iz3wjoelyIa/+gNigWij1Q3YVmWK8aJPGw5Rf90HLWyn4cBfhs6gAqW
	 iQW+7LnoUXK2ISJ2Neqt/4Yc5mnMJ/bJAIIXrYTs=
Date: Mon, 25 Mar 2024 19:12:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
Message-ID: <2024032509-stipulate-dragonish-c11b@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-5-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-5-dakr@redhat.com>

On Mon, Mar 25, 2024 at 06:49:08PM +0100, Danilo Krummrich wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> This defines general functionality related to registering drivers with
> their respective subsystems, and registering modules that implement
> drivers.
> 
> Originally, RawDeviceId was implemented as a const trait. However, this
> unstable feature is broken/gone in 1.73. To work around this without
> breaking the API, turn IdArray::new() into a macro so that it can use
> concrete types (which can still have const associated functions) instead
> of a trait.

Why is this paragraph in the changelog comment?  What API?  This code
isn't in the tree so what would have broken?

confused,

greg k-h
