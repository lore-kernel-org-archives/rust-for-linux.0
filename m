Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326289;
	b=2b1b2FrthKSZYjZpA6noVPndhnTffATA0De8IGilHLIF0PJDB5OSZzT80NKzfy84DiNJ
	 DT7Uw2+Uh3minQ9C2JW67mulMu2SVffo4mT/uK+zvAeioTbL/0bGoPCC/OH6QrpLbT4sM
	 nMVo7dTRsICqYt92wI7CG9NE+mS0Sw7K6CxQ8crx9z1ERkuCLsMH1h5jPsRgLxa/HIOOg
	 kSH4chFW6vyluCJrfqVjLZhCqCEOjLUmXb8HdQcLh+u755bzMSmfUquc0ZdAAiAvAsoHk
	 /8CnrliMaldnTyhx9e0UTnvnnNH6i9CVKZmoFrUeEwnZjL6BflEyNTjnS26Nil40z0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=qa5uqZOFY2I0haMmHVU09YCvN4fkPxIgUfz1U7YDp3s=;
	b=SlLCVpyCyqpXBc0LTpguLvEvKhFnImxWAPlmtEmJnPMOEDK4bcWHjAIwZ2a8VenFCVpQ
	 V9zg2Z+l6hZmDhxkNWMFzwSM+UWZ/TZZLPEV0TDEpW2qzW432Q0tsHQvZVE93/nGiglva
	 R5J/iGzJym3B3GFzD3fIQL0KlPtuaZXZV9qHOI9M4lbwO6CM9jLB7WLBGjVwxrrFdGNEL
	 a5PfDy6nBheUHzWwRO1apoebtZyv/hsLlpW8yZXIie8EAyoGWpScfazvpM71IthoY/KqR
	 BrC4u0I3YY9AlpLXkuzzZ+/68CJPXsNDMteC+zsJMfLsmFcTWGhgp3ZPuj/XNBErUnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gayx05oS;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9F1606A31A
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 02:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B9F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gayx05oS
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-369f33df08eso557263eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 19:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793326288; x=1793931088; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qa5uqZOFY2I0haMmHVU09YCvN4fkPxIgUfz1U7YDp3s=;
        b=Gayx05oSDefnvAAoHTRKjNm5RVsdzGPCHAQsyZHXaTa/tAzD6yXgp5SjvIdMf7kBmc
         bv9El3G9TBu7nQ2NnVkPPhwCklmlSafY3Yv2qrF4h150yftA3++/uW5I7DUQgEe2lcsI
         1rh/fw+LxyJ6i/oSvKD/C1n71Fsuae+4lC4/lt456qTJ+I1wCSPsgXgz53s5o2iIzah2
         00fv3SU+mTmPyID0zhcvgPBXlRfQ1wAEZyABX3ZEO8jxTtNQWGAFzS/Kr3HMsNqPPe83
         7rWWby4UBNH+oP+vue7kbSn3hN+DAI23MfNwTjP6BTyQRwpQTUoUjZL0LGsW/ferjUSJ
         oFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326288; x=1793931088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qa5uqZOFY2I0haMmHVU09YCvN4fkPxIgUfz1U7YDp3s=;
        b=CZw9x80vyskYy05JaxifZgKqmpAnj+wqJx7roUKbC1s71ZmbYgIVZg9mX+Ublr5S+z
         Jn9piUGYajMui03qPIYPLOS+d3wO66So+eRn5mGm0jB9wa8kh74bM5SrrmETSdLUryHj
         D67IglsFrvApxSbbtnmV1L8YajnyE5v1mp4e3PyiRVP7+tMHc/X2HLQj4ScmW/k+Pd03
         O5aP+l/SvhXdMurns7D4/KINgX22aUIgh+CrFU36hlXPOwVg2tlKabBrG2pijJwsDxg6
         g2Pu7WXyEMAtrQOoYiWelBghpdVJ6bMtswcJp/klqxtMhKxa2FlKMHvmc6RnlWOQ8jxs
         3JaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsBo7yRz1w7HWsJnikXa8IyBoFkC60K8xB+sGa0guqrdqbrhqtMgBZRkNh2K/zG0v/daY5KjGuocGsce5wOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIGsKBsZFsY28SqD2VFMQK/W7TjV58HRbSFGxvaH3XoJk4gJr+s
	4Cn8uIelpMXB5Sp4PoRY0zekcDdAeN6huQi0UYqZ7IxCeeNRRmM/JCT2
X-Gm-Gg: AYBFou36F3s8QBrP0XIpF8EUyIO8lBgnlAgysWtztir6uNGs5dg4bf2M6TJFPT0kYZa
	nK26N7GDwAS4rGkcYlY4B8sVbE8+KEfIgnmGH3vMFX2eegjEZ+ZMxzABH/LJ5POzTh97w1WfdX6
	3uYg1ldbFhLuq7X4r7md4+NKz6VlCoMzKijigkHoAPgURI6Yb3GVMb9VoRMQRJYksmD5ikE7Icv
	ZI/9NFdkA0z+6vsV9z/MDAMi4zqF+mk8VUknqh/X5IxVoKgDEuGYhPZc7vji5ChMFnf7FDjwpMP
	7bmpVNMwZwJ/joLqU2UyP1pfBeWepA10Lio3batMRNOGwPxveQDzK9pFgTGlyE6DhdGIzJk/hfN
	ua5BGQaAceMsQQk+QYlO4/HF715W3LHaFBFH/zN4Bc/MECwKqrfC8T8VrRkIc78fB1mxWpnaMNk
	vV7ymZmTOX0cXTEyPVfDM9+EcL8MZSOuMXtXRujAWdSktrInfwUCyAy+yfKRekHamN0tXuTKwAM
	WqxxvvcthMPcoLoVxkS+KDPbCjWROPEbt75L4mC3geOpSu59x2Dk9aL8KpX6GA66TbDJ1jDDh/F
	eXM5g3dELnf/knjk25s/4g==
X-Received: by 2002:a05:7022:f115:b0:183:7d42:cfb5 with SMTP id a92af1059eb24-1ac5d88c1famr1087217c88.19.1793326287926;
        Thu, 29 Oct 2026 19:11:27 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm2448104c88.14.2026.10.29.19.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:11:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 22:11:24 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org, gary@garyguo.net, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: io: mem: Fix exclusive MMIO region requests
Message-ID: <auP8zJwRmAdnpZO3@debian>
References: <20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com>
 <sashiko-outbox-187333@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-187333@kernel.org>

On Wed, Oct 28, 2026 at 02:12:54AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] rust: io: dead_code warning in Resource::iomem() when CONFIG_HAS_IOMEM=n
> - [Low] rust: io: missing #[inline] annotation on Resource::iomem()
> --
> 
> commit 87df13a505aabe5d12ec487bcf72bfc859780ac8
> Author: Kwanghoon Son <asdfkwang@gmail.com>
> 
> rust: io: mem: Fix exclusive MMIO region requests
> 
> This commit updates ExclusiveIoMem::ioremap() to request the MMIO region
> from the global iomem_resource root via a new Resource::iomem() helper
> rather than from the device's own resource.
> 
> > diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
> > index 758ce62b3cce3..c99a2530186fc 100644
> > --- a/rust/kernel/io/resource.rs
> > +++ b/rust/kernel/io/resource.rs
> > @@ -79,6 +79,12 @@ unsafe impl Sync for Region {}
> >  pub struct Resource(Opaque<bindings::resource>);
> >  
> >  impl Resource {
> > +    /// Returns the global I/O memory resource root.
> > +    pub(crate) fn iomem() -> &'static Self {
> > +        // SAFETY: iomem_resource is permanent; C serializes resource-tree updates.
> > +        unsafe { Self::from_raw(&raw mut bindings::iomem_resource) }
> > +    }
> 
> [Severity: Low]
> Will Resource::iomem() in rust/kernel/io/resource.rs trigger a dead_code
> warning (or a build failure with CONFIG_WERROR=y) when CONFIG_RUST=y and
> CONFIG_HAS_IOMEM=n (for example, on ARCH=um or s390 without CONFIG_PCI)?
> 
> In rust/kernel/io.rs, the mem module is gated on CONFIG_HAS_IOMEM while the
> resource module is compiled unconditionally:
> 
>     #[cfg(CONFIG_HAS_IOMEM)]
>     pub mod mem;
>     pub mod poll;
>     pub mod register;
>     pub mod resource;
> 
> Since the only caller of pub(crate) fn iomem() is ExclusiveIoMem::ioremap() in
> rust/kernel/io/mem.rs, should Resource::iomem() also be annotated with
> #[cfg(CONFIG_HAS_IOMEM)] (or made pub)?

I reproduced the dead_code warning.
I'll add #[cfg(CONFIG_HAS_IOMEM)] in v2, matching the condition on its only caller.

> 
> [Severity: Low]
> This isn't a bug, but should Resource::iomem() in rust/kernel/io/resource.rs
> also have an #[inline] attribute, matching the other small helper functions in
> the kernel crate abstractions?

I'd prefer to follow those and leave it without the attribute, unless
there is a specific reason to add it here.

I'll wait more reviews on this and send send v2!

Best regards,
Kwang.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com?part=1
