Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0A2412276
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502105; cv=none; b=ADqdDmOuekWWdI0xfKDB8xljxSlrEENqHgoE7/iqw4PNBoOTaFiOCt0LQViWxY1Ya2Dh8sx2fKaqLFkdMk2G71vRPqI/RWqrJRTsGu85Q7Dk3/w1whnNYOagXEU2tNTiGA49XS3bOzpFTnjMetPheRuZMW4WBg3avsW4AcyVgQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502105; c=relaxed/simple;
	bh=ZQtcZcvZAcOtTtPqKpdoZSZ+z0OYDwFlo8afULyr+B0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KUP0WJMEzGA4MndIs5vsQwjWyX1IrFmbRsQ/hOAvOaRH4TIMnwnq1CiWjXrOpQgyRuX8V3aj7yPWVUhFeLfFJWMqKWDHz1N9qDIjy/knP0S7zBjGi6I+xPDzYqrRCAyAmgBhRQtvCGxiuR57Ijsf/zCvgFqjGtVT8AJ76zFcGEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OVQpmNC+; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OVQpmNC+"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-69c20d1d150so841355a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 05:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785502101; x=1786106901; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USM/uxphlK5U3jmHzJnvrNhoNwlWgSplg6PGbnKffbU=;
        b=OVQpmNC++GNSqWLz3U9lb1/VrMdv4dZtP6mwc36FjcjvBujh037e/jTfhCpb8gyB3D
         2A+lyno6E4gL/TBNo6Dx8wxWIDI7JTQGBW1+5eGFHpLNeXt6K1y6P8nn6kZn4uyeNIAW
         pbo8uTblxECDpr2ohNhssJem/RKv8yIjslKfpfKizcQwtlC1/rhm7b5qysaOmATSCfVf
         Lmv0gE7h51zjAhkDLBi08Jo7WnuzpjptFLdiI5ccXUxA+QTRuQBpVEUaECt1HAzGePaA
         2SqYApHs8lwj6moB6UxhJS1rPrv4DEoetaw/TqVeztHZfk2zfG+x9ifGu/VJ0RIRnAFB
         iY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502101; x=1786106901;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USM/uxphlK5U3jmHzJnvrNhoNwlWgSplg6PGbnKffbU=;
        b=EYWbn6LmONzEv+G2O49tC8FXHike+V2jfGLVrmlQfZo1oCxWbtBnGCmrcycxmRZDVf
         hiGPAVtzfBnStZLuqjx78mi2qdM4wFZxRP86Jc1PFU9Dsz92LNEKZoNAM0JE+W0rCUM7
         zVBvSoro9NRlEovjl9eyLGNVc4QDDn+J0WE77RAI/7Am5ZDYGX1q1oCU1WsKyZd2gNxf
         HATpM5rKt+WwkKp9TKhWRhgk9cY2YTtC7qRLQu8pGa6oxBzmMyaJatrt1FDR02+IwF2x
         fGl8jwJAjmIUt0vPur+c6t+iPl7NHglODd05DcwXascb88bbjAYR0wYRD05ZwJ+l4VsD
         ATTw==
X-Forwarded-Encrypted: i=1; AHgh+RpyrvCCPqTMZw2pIKwu3UjReAfw4BtCL8IMFCT1DSH6iYnwUkMRUMLDavXqs0yG34P3K7rOQiAbmy3YBsmj3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQALavWinYjH/8P0hMMZ0iInJsxAi7zg+6GNzRE74/KIclOQQN
	59UlK0oNH4YuUpEIXKDEeQQrnjwkMLk2PaIMWL0uBnZxOLB4+h+YIvKx9ieNm3SHqZHX0XxzyoT
	ep5+5ktU5McH7945goQ==
X-Received: from wmbev15.prod.google.com ([2002:a05:600c:800f:b0:493:c773:ff79])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4404:b0:698:3b7b:e492 with SMTP id 4fb4d7f45d1cf-6a098f263f5mr1092694a12.40.1785502101210;
 Fri, 31 Jul 2026 05:48:21 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:48:19 +0000
In-Reply-To: <amtFbx_6SN6kgHQK@8bytes.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-pgtable_lt_b4-v3-1-e738e1f513a4@collabora.com> <amtFbx_6SN6kgHQK@8bytes.org>
Message-ID: <amyZkwWyyAVSgdYP@google.com>
Subject: Re: [PATCH v3] rust: iommu: add device lifetime to IoPageTable
From: Alice Ryhl <aliceryhl@google.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, iommu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, samitolvanen@google.com, 
	laura.nao@collabora.com, boris.brezillon@collabora.com, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 30, 2026 at 02:37:30PM +0200, Joerg Roedel (AMD) wrote:
> On Fri, Jul 03, 2026 at 05:28:44PM -0700, Deborah Brouwer wrote:
> > Currently, using a raw IoPageTable is unsafe because the returned
> > IoPageTable is not tied to the device driver binding lifetime.
> > 
> > Since device drivers now receive a lifetime parameter <'bound>
> > representing the interval during which a device driver is bound to its bus
> > device, add a lifetime parameter to IoPageTable. This ensures that
> > the returned IoPageTable cannot outlive the bus device binding.
> > 
> > Also remove the option to create a page table as a device resource since
> > currently Devres is not compatible with resources that have a lifetime
> > parameter. This option can be restored once the lifetime-aware
> > wrapper for devres is available and if a use-case appears for it.
> > 
> > Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> > Changes in v3:
> > - Rename 'bound to 'a since the page table could have a shorter
> >   lifetime than the whole device bound.
> > - Remove the TODO comment about restoring the devres option.
> > - Link to v2: https://lore.kernel.org/r/20260703-pgtable_lt_b4-v2-1-f14da6d4106d@collabora.com
> > 
> > Changes in v2:
> > - Renamed new_raw() to new(), since the constructor is now safe.
> > - Link to v1: https://lore.kernel.org/rust-for-linux/20260702-pgtable_lt_v1-v1-1-18d9c9812a1a@collabora.com
> > ---
> >  rust/kernel/iommu/pgtable.rs | 32 +++++++++-----------------------
> >  1 file changed, 9 insertions(+), 23 deletions(-)
> 
> Acked-by: Joerg Roedel <joerg.roedel@amd.com>

Applied to drm-rust-next. Thanks!
