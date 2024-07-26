Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7C61CA9E
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jul 2024 05:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721972403; cv=none; b=htkOj5HX1gE0c3wORAV6aC3fISL6hvIkeX9gfZ74QL65EjePr9Vb4qMF9YuajgZZ6J1sSpAYru/oJHL9KmbNZEMijDzwAy8x/mD8XJlUIfGxEZ8o2TLKrTn0l4OJDEh6wTnEb7c6wWQj68h9QCPgBbjriMH2paCVHZRQMslWVnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721972403; c=relaxed/simple;
	bh=7XMdm/Da+oOfsQjBluWDRxPs+D6Kq1TXoxX38VoxNT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+5Jj4fkSrUnydFHIfrAjncttDg5ZnL2v9s6E7eAqHJKiKmCmFLQNcll+KFUrbwkXnemS7HPi9kboiKcRCQNaILBG5AS4DYCLRmEoQoiPEvltJ9wcYmqKU+/6MKRTbK83mSrcH4kIvTBEYs4FttCdnyeSnx2Ly3tSccNjS6DrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NwmwQN3c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NwmwQN3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC818C32782;
	Fri, 26 Jul 2024 05:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721972402;
	bh=7XMdm/Da+oOfsQjBluWDRxPs+D6Kq1TXoxX38VoxNT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NwmwQN3cFQZdRpjkSx4FBMFxFhcvWnG7bxCpQLAAo7lfVgMaCR9CQBn1CqA7pHmZM
	 CWYZGxRDrzjA0oO2ywVsfumR9kG0tZhQRd2Y54wCkowFMM7HCON9+VffVQlkGcHZbh
	 soq6I/TRTIxmWGkf5kmvDqXna8b1WyBaT1rfzpOs=
Date: Fri, 26 Jul 2024 07:39:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	airlied@redhat.com, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH 0/3] rust: Add irq abstraction, IrqSpinLock
Message-ID: <2024072626-bluff-remark-3827@gregkh>
References: <20240725222822.1784931-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725222822.1784931-1-lyude@redhat.com>

On Thu, Jul 25, 2024 at 06:27:49PM -0400, Lyude Paul wrote:
> This adds a simple interface for disabling and enabling CPUs, along with
> the ability to mark a function as expecting interrupts be disabled -
> along with adding bindings for spin_lock_irqsave/spin_lock_irqrestore().

Do you have some example code that actually uses this?  Without that,
it's hard, if not impossible, to review it to see how it works and if it
works properly.

thanks,

greg k-h
