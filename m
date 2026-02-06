Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54D3033C4
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395024; cv=none; b=QnbP9EyyaHhzAbbk3X40NT1drlBGd8Tg/qDOdg7ynMTkXPXLYOj+MIwfRg2xZMwkmwYyH1FNLbQvmQ63aUU6O4DFmfR6Jas5VdzxhEgPE8Yef8SKesUJpqp9gbkytaCv/rtidJDyaGgbshFEnqsnLBIKrJ2x3lFW1o4956o/4Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395024; c=relaxed/simple;
	bh=PDB2SgMpjoyPYXsycU7QqblnHau7Qc+s9BjaMA1YRXw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bfNF2PSJE78XWEV+c9UYpLdgVRG3RrXHFiBWFdJLswtcAhNYXiy22cgv3PDwjA3R98Xpfxj4KbEE83gKUM10Dqa91F65VOP1qprrVPz/6ERvqReLbisVe9lfmDiLk/8SUJ8sVlj4Oq0R+oI0/3iVI4JTxGQIJkmJcXKw6DA0B8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HS1Z8xjV; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HS1Z8xjV"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47ee056e5cfso21165855e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770395022; x=1770999822; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ASfbMYdreUZsTeOEbqPVUbJkiLyzVG7/cT60T+k1OEo=;
        b=HS1Z8xjV+u4j2vSMXdfsSt1CCmQ6O+JdLshIciU644ptp0ep8r17ViUg4fG9XLzBi+
         XMInLu8VdBI1/V7iRVEfDI4PNc+ReXMoh++7khlzsrwkQEcS9vjBe0S8KItg7TMamJTR
         Gx25BntXpgSpiJEKxcKABIgbq1yuNeEXFiWpqU+CI5oaLzMzPcUKoh6/SubsOb6g1PwT
         gmXBTSgJHsv6CpkGcD/KD6fzB1pXhK2K4FcrgjXyTQoNjgw71YjBRht85VGVNAjYrHBx
         S7JFu/7whZAFxjC/OP5Z953kMLw87ZNx3Ju86Yu+Agfh9BlcuBhNI9MgeQgKspFxmac8
         wkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395022; x=1770999822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASfbMYdreUZsTeOEbqPVUbJkiLyzVG7/cT60T+k1OEo=;
        b=ikycyYa6FjSLy5a3IcZHGezeOkj20Ia6WhJHS0pahIn50bvMuLfpLTKqPm6F+e/iPI
         kZoQgyQSNDQmHfZLgcawM9h7jWvNTXZREOMPOqx+x4AKGH4hpXX47yF/XtpAgRZi8SlC
         yUVCIGL8KtdUSAPDPngaZG7wGLEsSSlu4suTD0uzQ9UnFE6kiicDohkoWuyfyeATCzNZ
         qsPSxABp8DQkvd9pnlYrlVKNVGhiHBPRknk8iBGNrXQqLepo2+JXlsYUNyo4TpkoY9UM
         vnujoBI3/aZidMX5vBTd9UDEi2+VGNbc9Jb3pPKzXvW4YgaS9b34pjmrZqcyU1rIhra8
         TMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOVi7UWBsTCuFVX84kU9nV0OTrHnNKY+cUP4kQAnYZpMiw9opyKxx06wb2bfMteu1NBn+jwFMLxCKhTYW+Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF8R8g8u0QHGrjDdlM8vuHqVVEYywsKeKJmugN6uaQ9FAT0rFS
	PSCQz2g1P/07/fAokupqDlT9qHTWOTUPIuLoCB7w/SpJVq09sJ009RD0UC+ij8tidqTbU7llDu2
	dMtUaZJxy3pjveNxp/w==
X-Received: from wma12.prod.google.com ([2002:a05:600c:890c:b0:480:4a03:7b62])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c16b:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-48320214793mr51550685e9.24.1770395022468;
 Fri, 06 Feb 2026 08:23:42 -0800 (PST)
Date: Fri, 6 Feb 2026 16:23:41 +0000
In-Reply-To: <DG8036NHQJ98.3A2RTSB6THUB3@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205222529.91465-1-dakr@kernel.org> <aYYOoyD8QAHEsWTp@google.com>
 <DG8036NHQJ98.3A2RTSB6THUB3@kernel.org>
Message-ID: <aYYVjT8OZTKYdaML@google.com>
Subject: Re: [PATCH] rust: devres: fix race condition due to nesting
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
	Markus Probst <markus.probst@posteo.de>
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 04:56:54PM +0100, Danilo Krummrich wrote:
> On Fri Feb 6, 2026 at 4:54 PM CET, Alice Ryhl wrote:
> > On Thu, Feb 05, 2026 at 11:25:15PM +0100, Danilo Krummrich wrote:
> >> Commit f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc") did
> >> attempt to optimize away the internal reference count of Devres.
> >> 
> >> However, without an internal reference count, we can't support cases
> >> where Devres is indirectly nested, resulting into a deadlock.
> >> 
> >> Such indirect nesting easily happens in the following way:
> >> 
> >> A registration object (which is guarded by devres) hold a reference
> >> count of an object that holds a device resource guarded by devres
> >> itself.
> >> 
> >> For instance a drm::Registration holds a reference of a drm::Device. The
> >> drm::Device itself holds a device resource in its private data.
> >> 
> >> When the drm::Registration is dropped by devres, and it happens that it
> >> did hold the last reference count of the drm::Device, it also drops the
> >> device resource, which is guarded by devres itself.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> Thanks for the review!
> 
> >> +        // Take additional reference count for `devm_add_action()`.
> >> +        core::mem::forget(data.clone());
> >
> > I'd feel better if you called .clone() prior to devm_add_action(). That
> > way, even if devm somehow runs the callback before we get to this call
> > to clone, the refcount has already been incremented.
> >
> > I know it's not really a problem because of the &Device<Bound> argument.
> 
> This is intentional, since, as you say, &Device<Bound> guarantees that this
> won't happen and since otherwise we'd explicitly need to drop the reference
> count again if devm_add_action() fails.

It wouldn't be explicit, as you can let destructor do it. But I'm not
going to force it. Feel free to land it as-is.

Alice
