Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39E43711D
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620248; cv=none; b=ucykW6E7XZJpnydXv78S2Au/kXZSrQZ3SRtLokGEpGjZ6MuPEVbHtwqXv1OVKVqkx3wr4wWMCDHQcSvGOcDcuk/CrP2wFczeMEOVD468ssq5n4rU6KhP2YV5K9TrZ9a7NSxGZq2yJ5CFm237haguAqhrArBPP0nS7kDiYIHGrjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620248; c=relaxed/simple;
	bh=v1HyQ9w4CQ9GtjNjR+yGGPjV+zdr+mSawSgmUOS7+QY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EcPZMLnsctX/DHSVQPJRnq5RBSW5ADCn2eq52PXU8a3PK6qJ2q4Mto155FPqQ8dXfcIRPrnhGdBBS0fkGJf0pLTvJNSjOGL/2WRob+39rHiCelxWs4b9w6N/I6hJIVr9G09G41BZ+MZpF/lMFJaFnQeV+A4n1F3vwp373vibQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uusYuBLc; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uusYuBLc"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-492488f8583so146543785e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 00:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784620235; x=1785225035; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZN0cXKJfka9i5ge5e0ezdkYWG8Vmfnfz35ybXd+mtU=;
        b=uusYuBLcah4tK4MNxCg1ZCyK/edOcwoSm0eps5P3xbRoCdCMhQAq/juWwIIajri/r8
         ktUmODgWzrGWoP+7KhMT3iZ7lMsJe2RFnjwkbNT8Z/i2HkwU2/S3zOjnawpRCWc4dUkC
         1qdQp5cBGJbIG8If2h8Mjz48YUlJnEh2TVmW4Q3P2cpoHZ01csnc6LZjU59R+uHDJ9/6
         uBX/uB0cUeTOwUbeQtJTrZBOPAqrmPA/qr2ahVRKdB1gAaM4vPXYQgVKYvqmzWr9nVx3
         PSjUl2CTz2uiiRBXmYKqmec73t+Vv3WHTuHc2V7XibGtm2vCcioKVDa3Dtq+UrFJfr56
         nMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620235; x=1785225035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZN0cXKJfka9i5ge5e0ezdkYWG8Vmfnfz35ybXd+mtU=;
        b=L1Iu38hNiQHMOp3E3Sc1Zrr2plQwUeiTLA3dfuWbiU82EVnfumToFllV4ozZNnu9w1
         lCgIwcqaa5iFsDeSsQa9/avUANZJ35zqFAirtLS5CoRO5FL1orrh8nSLmtjN2Ar3WdmX
         aYf+NMVJpAPJxlKgptvnyInjkpE8tKM+rqFFcVymIwSKnSJ4AXxPr0ie3SZNi+L6Ytlo
         DVpI/kEU+Q4mXbixR/szFeDn4HJ8dE6jaFOLO7UOa4SHHyRFXjIgA3kPzM4c6wBMhjRt
         Lx4hTP4Y5iqw0fz/48kojhmEVPDGHdz26NwHctBv8BwdqHhZ08J1OlXrMsxsw5rbwQXh
         YRdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEjOoi8LYpoWByI0i6/2Psz7QPAg5mF6JOROILlSz37hkK731QaZCnxzy6q6/Mkb3GqcsLP/A7ja/sClOCIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFT4JJ4xVIgvEoJSv5jnexUITeu3+MQe785n0ny38nq8fZZnXq
	TOeYOxxCnlKatchsLkj7qrClMBp3jjQOlUIoRK6fstScfBdoLND6fVLs2oNGOxiFyacQ+5JdCtk
	BtNMRoMjCHDJm3aweGg==
X-Received: from wrny4.prod.google.com ([2002:adf:ee04:0:b0:47f:4fe5:ede6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b26:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-495627459e1mr65586805e9.2.1784620234926;
 Tue, 21 Jul 2026 00:50:34 -0700 (PDT)
Date: Tue, 21 Jul 2026 07:50:33 +0000
In-Reply-To: <20260719153631.559341-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260719153631.559341-1-dakr@kernel.org>
Message-ID: <al8kyaXILj4oepq7@google.com>
Subject: Re: [PATCH v2] rust: irq: make Registration compatible with
 lifetime-bound drivers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, bhelgaas@google.com, 
	kwilczynski@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mhi@mailbox.org, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jul 19, 2026 at 05:36:05PM +0200, Danilo Krummrich wrote:
> Adapt the IRQ registration to work with the Higher-Ranked Lifetime Types
> (HRT) device driver architecture introduced in commit 2c7c65933600
> ("Merge patch series "rust: device: Higher-Ranked Lifetime Types for
> device drivers"").
> 
> With HRT, driver structs carry a lifetime parameter tied to the device
> binding scope, allowing device resources such as pci::Bar<'bar> to be
> held directly rather than through Devres indirection. However, the IRQ
> abstraction required Handler: Sync + 'static, preventing handlers from
> embedding lifetime-parameterized resources.
> 
> Remove the 'static bound from Handler and ThreadedHandler and replace
> the Devres<RegistrationInner> indirection with direct request_irq() /
> free_irq() calls in the constructor and PinnedDrop.  Registration<'a, T>
> stores the IrqRequest<'a>, which structurally ties it to the device
> binding scope.
> 
> Also remove the &Device<Bound> parameter from the handler callbacks,
> since handlers that need device access can embed it in their own type.
> 
> IRQ handlers can now directly own device resources:
> 
> 	struct IrqHandler<'irq> {
> 	    bar: pci::Bar<'irq, BAR_SIZE>,
> 	}
> 
> 	impl irq::Handler for IrqHandler<'_> {
> 	    fn handle(&self) -> IrqReturn {
> 	        let stat = self.bar.read(regs::STAT);
> 	        ...
> 	    }
> 	}
> 
> This eliminates the indirection previously required for IRQ handlers to
> access device resources and aligns with the broader goal of expressing
> every registration scoped to a driver binding through compile-time
> lifetime bounds.
> 
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
