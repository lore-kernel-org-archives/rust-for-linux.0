Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3078370815;
	Fri, 24 Jan 2025 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716565; cv=none; b=Iu4P+xYv3or/3BfpvO4WlwBel4y0RPg76TSnB4DEU7IWiNK44z+iXt41yerRv/C9tpnHe63/ZxyzXZl5WPddpsG1Oh4bn/oykHagXf6mT4TsTmzyGxkl6/1VCkiyFhUFodOqfka78oU7mmMtyhU6PPDC6TTMT8Q4yT/6Nn2LR1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716565; c=relaxed/simple;
	bh=xEXoP95d70TmnaOJ0bLnGpvahFL6t6nx/0HWvTXHFbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApvLfnjDpS3slLxuV1ixDOmzNKhV9g7EPF4mPKRs1sSRum/Qiqq5BJA3so+52azBfKg1Gz+zMvKG84hi4ae+5RLLAa8fM+RoFJdlfrxgWkO8PG/nHugBZk2HxteEbZoaVjPa1hGplHCLTfosQv1/Qzw8IFb6JMW8XkCJQd+0ly4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+0zxJph; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+0zxJph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7797AC4CED2;
	Fri, 24 Jan 2025 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737716564;
	bh=xEXoP95d70TmnaOJ0bLnGpvahFL6t6nx/0HWvTXHFbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+0zxJphYcf8ThpFLSbEtPEVfyQt3qUcOx9z3WkwRTPO4cZXyB/IT9afnkPSfP8Rw
	 /2+8gUUqS79+xT3Me4PJQ+rB7L23errB3hYwhLZCTsqsU3YfSWXClmUPPaUIE+oCSr
	 AmIPgHuCgKeOomWYiNlUNk+jHiaHzmre7ULumXfeqGfYrVTaEPuuNwt+tpTybTFhjx
	 U6x/4T/8t5L1tGV16ZYXdUwcxTiydD49uBvmL+GIvQNvCAAF9n6K3jK0LtA8tTlPZr
	 BxAsknMER+VX2hcV3WSKFAvd/dSWd9D8u+HxUjCeDenlpl+7BCNuqnaFJ9FVAlMd9S
	 gASFygPR0koRQ==
Date: Fri, 24 Jan 2025 12:02:38 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH 2/2] rust/kernel: Add platform::ModuleDevice
Message-ID: <Z5NzTsm7Hw-OD4n5@pollux>
References: <20250122235340.2145383-1-lyude@redhat.com>
 <20250122235340.2145383-3-lyude@redhat.com>
 <2025012329-candied-walk-f57d@gregkh>
 <0bb7270e879ae3a40d4e5500f9a7992563a68d9f.camel@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bb7270e879ae3a40d4e5500f9a7992563a68d9f.camel@redhat.com>

On Thu, Jan 23, 2025 at 07:33:28PM -0500, Lyude Paul wrote:
> On Thu, 2025-01-23 at 07:23 +0100, Greg Kroah-Hartman wrote:
> > On Wed, Jan 22, 2025 at 06:49:22PM -0500, Lyude Paul wrote:
> > 
> > And modules are code, not data.  Let's not start to even attempt to tie
> > lifetimes of device structures to module code, that way lies madness and
> > rolls back the work we did decades ago to split the two apart :)
> 
> To make sure I'm understanding you properly, by "are code not data" you're
> suggesting that resources (devices, driver registrations, etc.) should have
> their lifetime entirely managed by the kernel and not as part of the module
> data structure correct?

I think that's two different things.

Driver registrations are bound to the module lifetime and in Rust, where we have
a structure that represents the module lifetime, driver registrations are part
of the module structure. That's fine.

Device are more of a concern here, since they ideally orginate from real
hardware and hence shouldn't be bound to a module lifetime.

I think a virtual device would need to be an exception though. What else, if not
the module should define its lifetime?
