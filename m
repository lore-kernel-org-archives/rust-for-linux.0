Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000617;
	b=0SY4oSAS1mYxYDL+AsUEjlUw4ww5JVaJD1UiiYHXa0/bpPoHiww9sp8lJfX4zNJjpLUE
	 djuph/FP3Bc8nzyw95yxCjGR+PM7YFUb5qCDXBbQSuKothkr/+GnTIOyeCwrfLKd1ZhOZ
	 LvF+5ypfiezxtiRe5+vgApn3kGH+DvGNSASjhI+uZmbmrr1N4NbEhU4sz6e3B2uizKpOv
	 UMTdHkVVEJasHMve6iiev5MMywYESkEAZ931/PQIJzyorWE3dICKS7yNrSc+xgKnjcn7q
	 Xf/QzT44vNYCXWLMwmmGWLxDxO1V3Y3kjU2wHIvoQycpcmwabqP4XTi2hnJL4OLS/eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VdBK9iPCpdL4SaGML/svEnUVQsDV7jsVMj4rTVCaMEQ=;
	b=O+f+q+lzglTg+taVFzE3IgucIgJ5SUrWSXSvpG15quZFNEqUnHnuAO4rRKaYuKn2+PDX
	 Dctu14+v1K6w5ytiGyoyIaIFfNNF6SM7O9vrjHRP2qXnwgSB7IT4fZkE1yFW+LAq+T5Bm
	 XYryuliP38T2YZf/x95kAMDF+zKYB0J72qMD1FbgWuJsWkpnPnbaN7VYX957KSaBMLRzA
	 f162fGy4gDXuJUQ/07+j8sJg4iWpQl+rjVUsVPDkIfrecmHjO9ffUYffaGQPftgIb+0bh
	 zbJAtatzJ7IR1mwsmyuHvb7QUpeCnoJKAFKlh6OxbEm6f7AGZ3xSp74+7W4IsL2lFiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CnbFd2fo;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1D606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 11:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CnbFd2fo
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a3052225cbso813272f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795000615; x=1795605415; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdBK9iPCpdL4SaGML/svEnUVQsDV7jsVMj4rTVCaMEQ=;
        b=CnbFd2foIc1oP4OQ+apE2+PUd8KhbCuov0KPVg6H49pjv3XxrZ0chRd8fFEo4IzCfU
         wyLRlrpnxS/eAB8q8r2DVSttlIn6STnYOMtUi+60CnXVALhmXCdujG63j1PnzXy6P1S0
         XkqUd15s+lkpVUD/GDZaFYVv7QQLT2a/R56lgjgLsFQG2jaiq4rTaQqKNO04FRjR0qDZ
         whBjXblsWfzMiVxHo3KL4ZB/muJ+nfRJCEb6S/3Gg+bx5WV0mhTIM77xmVF4VsjEpa7x
         OXJIIRwi4spArEDSI11y2mU+tRW7hwbH3pDkZmIuIOorrmjyFlsTMar8E/wCpi76AQMX
         e8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000615; x=1795605415;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VdBK9iPCpdL4SaGML/svEnUVQsDV7jsVMj4rTVCaMEQ=;
        b=FINZnZ8EzQGH9xFljdIVC+HzrQUvwqMKUm9HrT4k/s+f1yLlEGxXW4IhD0nazBpIqs
         xxBBhzssL3Ld1S0OruQcUhoBPbu8Xp4b0dMgtlUN1u+PM2SxS1j1BHi3ZbQ9N+/ja4s4
         xTID3a8brVtg2fEGqC0bYq05qUUcJ9SEBay0rKim1ncbwyMQ6df0b3fEwvsIRCjQ9tWW
         CYi/1KiYvU1sg9IHjb8uaooPuH5zyhvXYXfefV4Onxat2Ptm5+Kk8s2X0NATatzCLd+V
         OXW4ZVGKg13mMej3pToUDV8X3h52+wtMnLmuzptHFE53e3eFVaX4t3Ctq2xB2OfZq5gE
         Lh8Q==
X-Forwarded-Encrypted: i=1; AL+hErGV1Kwq61PwF8YpL0L/BCxDpmquYGTU/Y56aDOILsUJUQzNXWLzhE0tRp6XXD1i1dniVWSDu3Uu+EKH3Q8v/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zCfdUJlsl4P15RtFNf3Qd1vi6UZb5oAor+FBlZhPBtRP+Wc4C
	cfGfwt+LgnToVY2xXhRwD40/oTnSe2K7qmSn/yR4kM/nuQmyY0Jglo8/9FnTgUzeIgfvC32yKqA
	7meumYdRgStmf+gO6yA==
X-Received: from wrsw6.prod.google.com ([2002:a5d:4b46:0:b0:4a5:1c26:11b4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d06:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb7da14a3bmr43246995e9.12.1795000615091;
 Wed, 18 Nov 2026 03:16:55 -0800 (PST)
Date: Wed, 18 Nov 2026 11:16:53 +0000
In-Reply-To: <0d26baaa-92ae-43ff-9a76-a81cad624dcf@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
 <20261117-tyr-remap-2mb-v1-1-2a8efd4c8180@google.com> <0d26baaa-92ae-43ff-9a76-a81cad624dcf@kernel.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118111653.448550-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/4] rust: drm/gpuvm: add GpuVa::data_ref accessor
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 08:40:20PM +0100, Danilo Krummrich wrote:
> > +    /// Access the driver-private [`VaData`](DriverGpuVm::VaData) associated with this mapping.
> > +    #[inline]
> > +    pub fn data_ref(&self) -> &T::VaData {
> > +        &self.data
> > +    }
> > +
> Why data_ref() instead of just data() or a Deref impl?

I guess this came from mirroring UniqueRefGpuVm, which uses the names:
data_ref(&self) and data(&mut self).

I think it makes more sense to rename to data(&self)/data_mut(&mut self)
for consistency with other similar APIs. But we should also update
UniqueRefGpuVm if so.

We don't want to go the Deref/DerefMut route because mutable access needs
to return a `Pin<&mut GpuVa<T>>` which doesn't work with DerefMut.

Alice
