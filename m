Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF43A59;
	Fri, 23 Jan 2026 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174571; cv=none; b=hGD0S54t8lCK9nKeYmlE3WeJ0ds2qo5iBKGqhakPPod8S199Nh9UDc1yXTGystneOTnOj5+NNcAKa4P+A1wM7OLKynVjmvBeoBO1+lD6WcBMmiG5F8w0nJZHMLGqXpRfEg3pQBzL9FBjjDCUcxRfWF8SnYsc0AmkVRA79xvIBDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174571; c=relaxed/simple;
	bh=QKhLnPxWAnrj1nPfcFMG+Pg5gBr7D0S6Yes5Gpvk4AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfZtEr7C9nEXGKk61bxXIft6O5tI+FUlqO1sYNnKIrzFYhEbOyJ7iNr9Xm03sR382Y8bqZlLCEqqYLHBsADAgmZIvDmz2hxQ9dPu2JgSFmF3uiv30GU20iCgAEoxh5SZVbvU1OkyqAt3cBPGqchjaavII/CHZ/zuEdxPuQdHVhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FB901476;
	Fri, 23 Jan 2026 05:22:42 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 380703F632;
	Fri, 23 Jan 2026 05:22:45 -0800 (PST)
Date: Fri, 23 Jan 2026 14:22:53 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org,
	abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
	aliceryhl@google.com, robin.murphy@arm.com, a.hindborg@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, tmgross@umich.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: dma: allow drivers to tune max segment size
Message-ID: <aXN2LVQJqtZKGzQP@arm.com>
References: <20260123101832.3136897-1-beata.michalska@arm.com>
 <DFVWLIUK193C.EAXZYN4JKZVH@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFVWLIUK193C.EAXZYN4JKZVH@kernel.org>

On Fri, Jan 23, 2026 at 11:40:47AM +0100, Danilo Krummrich wrote:
> On Fri Jan 23, 2026 at 11:18 AM CET, Beata Michalska wrote:
> > +    /// Set the maximum size of a single DMA segment the device may request.
> > +    ///
> > +    /// This method is usually called once from `probe()` as soon as the device capabilities are
> > +    /// known.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// This method must not be called if there are any in-flight DMA allocation
> > +    /// or mapping operations.
> 
> Yes, unfortunately it has the same requirements as the DMA mask setters.
> 
> For consistency, can you please use the exact same safety requirement text as
> the other methods?

Done:
https://lore.kernel.org/rust-for-linux/20260123131308.3218421-1-beata.michalska@arm.com/T/#u

---
BR
Beata
> 
> > +    unsafe fn dma_set_max_seg_size(&self, size: u32) {
> > +        // SAFETY:
> > +        // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> > +        // - The safety requirement of this function guarantees that there are no concurrent calls
> > +        //   to DMA allocation and mapping operations relying on this parameter.
> > +        unsafe { bindings::dma_set_max_seg_size(self.as_ref().as_raw(), size) }
> > +    }
> >  }
> >  
> >  /// A DMA mask that holds a bitmask with the lowest `n` bits set.
> > -- 
> > 2.25.1
> 
