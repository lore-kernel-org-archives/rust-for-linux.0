Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866114;
	b=rPcw6A2VXlKE3hiIsHzuTWcKpe4lQCUbLXvJGSPyAxs99daS3tFLU2sI9Vo5HAi/UXrq
	 d8z3rT2LQZX9ZDFEfN0JOumtHQOu3pMI1I/8zW1sVa9tOf5NRhjXIZIn5usRytOqJeJD8
	 Z2fur5iAr2rxjatLvY5cS1Kn0tFj2Z79trRd8EyBuG2LlrulmMSEpS/mzVDTZnGdTprC9
	 C/d6pmXCYpeoPBfYnJ1nwB9GIBEhXvdNOnyddnZgxS359M33LKB3DgbGjWbvHsaSVpnqW
	 IbCpD7peNwyYcBpgIFpp7ifYSMYJzoYuxYCY3hQWyjCvTt6GoWo+SAmNPwzbRoktCfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866114;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ZohoMailClient;
	bh=UUuGY8A1jPzFzjbtIeOfv8dCf2A++5qQ+XzU4f4OM2g=;
	b=OXeH9WYTaBVvV8KjfJ/gRFS/74HqQ72hdzANyrvAo7F+Y8IJnmsXgcvB80GmYVm2Nh/q
	 k+p6+Q6rUNRibf/D2EyMoaGmA5oBUVE/H2zAeV46h6h0RIfzoxYGtGtElJlWV17q4sEZ7
	 5NBzgBm/Ke6dQzG6cHj/b6yuwIyp93yMoZdUvKJmX+Jaljw1x0UH02XBomqIWnVDXFNHo
	 eGoemKvX+/Ixoj/CnYkUMhFj5lUS57cB49yPVtVGus8cWUHykZcQUkhNdEFlVpYkQ1tsR
	 +Dcqss+7lhSzxd76TzTEGEyr0UxGxXExNrLrlXRtosvVyweI5dT4rpiNOxYrzYrJ9Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=VrGBTM93;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03280606A33E;
	Mon, 16 Nov 2026 21:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03280606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=VrGBTM93
ARC-Seal: i=1; a=rsa-sha256; t=1794866087; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YsNI1MpHjiXdt5833k585f4WEp7eebiebYc9NHeyLzBffa5FQfKqrYZJBos3EcABuVOc0DsRDWj2Os9RXCEnuYO/c+Ms5USOXrCyF0dOKSMB3shrWXIE6b8fwg/T/Q3nU6hzkPwhpBXLoWVNg6UvP8/ufInrebjbSjhzbEmE31E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794866087; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UUuGY8A1jPzFzjbtIeOfv8dCf2A++5qQ+XzU4f4OM2g=; 
	b=H3X0m22pWeHao5BvMGRIrWzK1f1wpR4oxQyhllJGijQJaIqoGtPq8Qk0v63DyJvcW9z7+rqVsVd6Fn+tt3yQhEsE4jyxY9IDbP6NdYSdlq5aTSLyt9So/HGHmxJh+XDcW8OCwH3bZE5fOzvyrQ99/3gIB/0/VmDMY3JFzX34Jko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: a=rsa-sha256; b=VrGBTM93kL31b6tdXuYgwYqMKn7XWfYGmZHIr+R1W7Tv7QkO5b6K97fqikwT5ELeoEuG7VYD6Iw9fiPe2c5tjlnrp9xHBU8R5vZUoG9cBAOcd3/kWlnY16ZVKSG0815E8QD8tKk7BAZXrwTWFuw2IskxS30JPLII31dix/fCwYc=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=UUuGY8A1jPzFzjbtIeOfv8dCf2A++5qQ+XzU4f4OM2g=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794866084138197.18938672995478;
	Mon, 16 Nov 2026 13:54:44 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: iommu@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 4/6] rust: iommu: add Domain::attach()
Date: Mon, 16 Nov 2026 16:54:41 -0500
Message-ID: <mT5CXvCzTcmD0ecGNGQ1Hg@collabora.com>
In-Reply-To: <20261112-b4-iommu-domain-v1-4-c29e86788dda@collabora.com>
References:
 <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261112-b4-iommu-domain-v1-4-c29e86788dda@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi !

On Thursday, 12 November 2026 12:00:11 EST Daniel Almeida wrote:
> The upcoming rkvenc driver will use IOMMU domains to isolate different
> sessions.
> 
> Add Domain::attach(), which attaches the domain to a device and returns
> an Attachment that detaches it on drop. Devices that share their IOMMU
> group with other devices are not supported.

Same wording issue here, and in the patch.
Even though this will work for our encoder usage (devices <->domain mappings 
will be 1:1), this doesn't match what the iommu driver does, which can attach 
multiple devices to a single iommu_domain.

Detlev.

> attach() is unsafe. The caller must be the device's driver, and the
> device must stop using the domain before the Attachment is dropped.
> The Attachment must not be leaked, since the domain could then be
> freed while it is still attached.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/iommu/domain.rs | 57
> +++++++++++++++++++++++++++++++++++++++++++-- 1 file changed, 55
> insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/iommu/domain.rs b/rust/kernel/iommu/domain.rs
> index 2e66becde156..2a5b66f2a5d9 100644
> --- a/rust/kernel/iommu/domain.rs
> +++ b/rust/kernel/iommu/domain.rs
> @@ -19,7 +19,10 @@
>          Bound,
>          Device, //
>      },
> -    error::from_err_ptr,
> +    error::{
> +        from_err_ptr,
> +        to_result, //
> +    },
>      prelude::*, //
>  };
> 
> @@ -44,6 +47,11 @@ pub struct Domain<'a> {
>  // SAFETY: A `struct iommu_domain` is not tied to the thread that allocated
> it. unsafe impl<'a> Send for Domain<'a> {}
> 
> +// SAFETY: `&Domain` allows the following from several threads at once:
> +// - Attaching and detaching the domain. `iommu_attach_device()` and
> `iommu_detach_device()` may +//   be called concurrently for the same
> domain.
> +unsafe impl<'a> Sync for Domain<'a> {}
> +
>  impl<'a> Domain<'a> {
>      /// Allocates a paging domain for `dev`.
>      ///
> @@ -70,11 +78,56 @@ pub unsafe fn new(dev: &'a Device<Bound>) ->
> Result<Self> { _dev: PhantomData,
>          })
>      }
> +
> +    /// Attaches the domain to `dev`.
> +    ///
> +    /// This may sleep.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller must be the driver bound to `dev`.
> +    /// - The caller must ensure that `dev` stops using the domain before
> the returned +    ///   [`Attachment`] is dropped.
> +    /// - The caller must not `mem::forget()` the returned [`Attachment`]
> or otherwise prevent its +    ///   [`Drop`] implementation from running.
> +    pub unsafe fn attach<'d>(&'d self, dev: &'d Device<Bound>) ->
> Result<Attachment<'d>> { +        // SAFETY: By the type invariant,
> `self.ptr` is a valid domain, and `dev` is a valid +        // device. The
> caller is the driver bound to `dev`.
> +        to_result(unsafe { bindings::iommu_attach_device(self.ptr.as_ptr(),
> dev.as_raw()) })?; +
> +        // INVARIANT: The domain is attached to `dev`.
> +        Ok(Attachment { domain: self, dev })
> +    }
>  }
> 
>  impl<'a> Drop for Domain<'a> {
>      fn drop(&mut self) {
> -        // SAFETY: By the type invariant, `self.ptr` is a domain owned by
> `self`. +        // SAFETY: By the type invariant, `self.ptr` is a domain
> owned by `self`. Every +        // `Attachment` borrows `self`, and the
> caller of `attach()` promised not to leak it, so +        // the domain is
> attached to no device.
>          unsafe { bindings::iommu_domain_free(self.ptr.as_ptr()) };
>      }
>  }
> +
> +/// A [`Domain`] attached to a device.
> +///
> +/// An attachment cannot outlive the domain or the binding of the device it
> is attached to. +/// Dropping it detaches the domain from the device, which
> may sleep. +///
> +/// # Invariants
> +///
> +/// `domain` is attached to `dev`.
> +#[must_use = "the domain is detached when the attachment is dropped"]
> +pub struct Attachment<'d> {
> +    domain: &'d Domain<'d>,
> +    dev: &'d Device<Bound>,
> +}
> +
> +impl<'d> Drop for Attachment<'d> {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariant, `self.domain` is attached to
> `self.dev`. The caller of +        // `Domain::attach()` is the driver
> bound to `self.dev`, and promised that the device +        // stopped using
> the domain.
> +        unsafe { bindings::iommu_detach_device(self.domain.ptr.as_ptr(),
> self.dev.as_raw()) }; +    }
> +}




