Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532AA70810;
	Thu,  5 Feb 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295722; cv=none; b=o/Ub7ttehImdcYD2X4QU5EVQSCBMT6theQsvdWb/h/qZF9uJmyHOSmy6uuupxLCRBDnmpzi8x1u/3taL1fuBXlVJpM0ubde3zKa+7YCd109a6j+ByR+wiuwMWsbsTSq3Ehf7OKN5wEJbIkpx4IlfMIVRiLJ7e/QNtNlHQxnaD0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295722; c=relaxed/simple;
	bh=AKBciFw30Ysv8G9Jsg24H+1g4+BPM57sr3jlOLYi10k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUBbedGPVAWQjskLu2POtq/jzcyiJElqd4xALtRdiy2NBEmeyNS4wcK6f/nIHwr2juqDccxea1Sg0TMYRu/Jr3b0mmV0Hdp2f1FZQaWVpEL3V+iCDjiYN/CBYaJn8v/hJMT7EDTa5ZZsu5gV8Ot+wDg3GhZL0E+OrF4ybWRmut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id D0AB5F43B46; Thu, 05 Feb 2026 13:48:32 +0100 (CET)
Date: Thu, 5 Feb 2026 13:48:32 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>, rust-for-linux@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	officialTechflashYT@gmail.com, Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 2/4] rust: nvmem: Add an abstraction for nvmem
 providers
Message-ID: <aYSRoIvhx5FAygDe@luna>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-3-linkmauve@linkmauve.fr>
 <DG6A3L2W1YC0.YOB6BUMGG38F@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DG6A3L2W1YC0.YOB6BUMGG38F@kernel.org>
Jabber-ID: linkmauve@linkmauve.fr

On Wed, Feb 04, 2026 at 04:22:16PM +0100, Danilo Krummrich wrote:
> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
> > +impl Device {
> > +    /// Register a managed nvmem provider on the given device.
> > +    pub fn nvmem_register<T>(&self, mut config: NvmemConfig<T>, priv_: &T::Priv)
> > +    where
> > +        T: NvmemProvider + Default,
> > +    {
> > +        // FIXME: The last cast to mut indicates some unsoundness here.
> > +        config.inner.priv_ = core::ptr::from_ref(priv_).cast::<c_void>().cast_mut();
> > +        config.inner.dev = self.as_raw();
> > +        config.inner.reg_read = Some(NvmemConfig::<T>::reg_read);
> > +        config.inner.reg_write = Some(NvmemConfig::<T>::reg_write);
> > +        // SAFETY: Both self and config can’t be null here, and should have the correct type.
> > +        unsafe { bindings::devm_nvmem_register(self.as_raw(), &config.inner) };
> > +    }
> > +}
> 
> This should not be a method on the generic device type. Typically we use a
> Registration struct for this, i.e. this would become
> nvmem::Registration::register().

Should I also switch to the nvmem_register()/nvmem_unregister() API
instead of the devm_nvmem_register() API, so that the unregister can
happen in the Drop impl instead of being managed by the kernel?

-- 
Link Mauve
