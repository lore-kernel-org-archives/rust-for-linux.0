Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834CA3B531B;
	Mon, 27 Apr 2026 23:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777332984; cv=pass; b=KPxWvGzU9+exXFhFa9zOLTNrYp9Wcx4NdTY+ROpGdjsGgDMG1NH8xdgAcV1sWFL/zAQhqpQlpG9fr23IMPwnYF3zDNG3beUUjFKlHw6aQ0wX5KInoY9JqjvVSeA3xLMu3EVBvJcLtW5bhyJuuymOckDQVqsfmai6IuIWX3NSXf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777332984; c=relaxed/simple;
	bh=vJIT8AUSZMRC5uXVap+g8RXLYDAhy/NYjsA1pV+PUUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCo0jbARoFetkgidsHKTb8p8YU8gRoaergxcl/WbFC/sAkhQ2IPBhV3FfZjq1D5CceBKb+MOOXZszTMd4N7JFOlNvpbVcQrgAyF56+ACx9kk+IFvvBmkxxBMeO/8Uo9+nEs4qTeYsFB159nbfFDVh8thO8R3x8WrEJ+USBbXJR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Q0OPTiRW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Q0OPTiRW"
ARC-Seal: i=1; a=rsa-sha256; t=1777332945; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VbPr3ZeL02NRyCn+NUp7sx/5ai/WpO6sI0+LN2IFY/ENkDXelW8A67JJ7YRbPMoUXJ+EGycelsaKK1AHEcBMNIuudHd3paPfG7NeYTFRVFAgHJ+RccMvKAisOCG3SbqOsUUBLTUJLrmu2v59FdMuoghyPpyUic14R2OzkohYjmU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777332945; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lnSnM4C990qgs9pUSno2N5WyCcVKDoCRlxhe7ByWmPM=; 
	b=aaqJRYlLSdpQB3GKP/Zeq5VKkZNog6/9Sygky50/3nWoTxAeEMIjJ9vSRCURj5WtFEAPJqpbmENJe7OiHYyhDsK5joioqSG6CsfpVncasa2PAnOW9KktzEHGLBRAJkHfancjFelKSNMNsC86HOnPp1CCpKH+MZZVpxv3Cyg1m4g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777332945;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=lnSnM4C990qgs9pUSno2N5WyCcVKDoCRlxhe7ByWmPM=;
	b=Q0OPTiRWH4mvw0ZKQO7Ixto8w3ed2Uh33WFb9AS3wBKRj4j/fYZffu5dt0vkMbi2
	wdw00saWyhaEUHaYjhgnuSsrJEQJ/1oZZKfHxuW8bJkomHwNh/wVeO3aOSJQK4xgWV9
	K45Qdakx2vk6COr2s3BQ7IDadDYwFdfXkWb3EVns=
Received: by mx.zohomail.com with SMTPS id 177733294331785.60014132848107;
	Mon, 27 Apr 2026 16:35:43 -0700 (PDT)
Date: Mon, 27 Apr 2026 16:35:42 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com,
	beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com,
	alvin.sun@linux.dev
Subject: Re: [PATCH v4 19/20] rust: time: add arch_timer_get_rate wrapper
Message-ID: <ae_yzmiGc0rnu6VR@um790>
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
 <20260424-b4-fw-boot-v4-v4-19-a5d91050789d@collabora.com>
 <20260427085907.106896-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427085907.106896-1-work@onurozkan.dev>

On Mon, Apr 27, 2026 at 11:59:06AM +0300, Onur Özkan wrote:
> On Fri, 24 Apr 2026 16:39:13 -0700
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > Provide a safe Rust wrapper for arch_timer_get_rate().
> > 
> > The underlying C helper returns 0 when the ARM architectural timer
> > is not available or not yet initialized. Map this to Option<u32> to
> > make the absence of a valid rate explicit to Rust callers.
> > 
> > This allows Rust drivers to query the system timer frequency and
> > select appropriate time sources when programming hardware timeouts.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  rust/kernel/time.rs | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> > index 6ea98dfcd027..03ce96450fc8 100644
> > --- a/rust/kernel/time.rs
> > +++ b/rust/kernel/time.rs
> > @@ -359,6 +359,35 @@ fn div(self, rhs: Self) -> Self::Output {
> >      }
> >  }
> >  
> > +/// Returns the ARM architecture timer frequency in Hz, if available.
> > +///
> > +/// This function queries the system-wide ARM architecture timer frequency.
> > +/// The architecture timer provides a consistent time source across all CPU cores.
> > +///
> > +/// Returns `None` if:
> > +/// - The ARM architecture timer is not available (`CONFIG_ARM_ARCH_TIMER` not enabled)
> > +/// - The timer rate is zero (not initialized)
> 
> Can we return distinct errors for these cases and return NonZero<u32> when the
> rate is valid?

I don’t think there is an easy way to distinguish between those cases from the C helper,
since both are represented by a return value of 0.

As far as I can see, callers only need to know whether a valid rate is available or not.
I agree that NonZeroU32 would better model the valid case, but I’m not sure it adds
enough benefit here to justify the extra complexity.

> 
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::time::arch_timer_get_rate;
> > +///
> > +/// if let Some(rate) = arch_timer_get_rate() {
> > +///     // Use `rate`.
> > +/// }
> > +/// ```
> > +pub fn arch_timer_get_rate() -> Option<u32> {
> > +    // SAFETY: The C API is available in all configs; when CONFIG_ARM_ARCH_TIMER
> > +    // is disabled, the header provides a stub returning 0.
> > +    let rate = unsafe { bindings::arch_timer_get_rate() };
> > +    if rate == 0 {
> > +        None
> > +    } else {
> > +        Some(rate)
> > +    }
> > +}
> > +
> >  impl Delta {
> >      /// A span of time equal to zero.
> >      pub const ZERO: Self = Self { nanos: 0 };
> > 
> > -- 
> > 2.53.0
> > 
