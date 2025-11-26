Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849E62FD1D3
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150790; cv=none; b=qp//8cEiY2DOAzDXsOyXs6lOY5JyScxbtIpdJiCCE5D+/T3m0UNHzYKeB/3WXIFd2J0VTpKKh54/O/yl3h5C3uVh0FD9loxZA5/sgTKr3JToPguX2WUY0UwqnpjEbmR8eRzraoIXJnOveZ+f6/eldPKeZLqRrIs/zwqWQgtn0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150790; c=relaxed/simple;
	bh=E/Vw1ge5hpfXiAjQ/SS66MHdB62gP4zJBU9ctmYyTW0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L/UilfIFYXRheReSrX6mbfwrHvtMqchc/kKi1Okwi3B4loz7CXFZYXJagVD1G2QI/a1r7mWK7WquCj4QWiYXvId0iip7bc476K42PTNsdffwON93x0IVxVNSENJ7OWG0plBO5gUQoWegRNa8xLFP+Py/55fOy/XBTSj6tLY3SSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hmZ+XVJA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hmZ+XVJA"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477563a0c75so34728465e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764150787; x=1764755587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhEHhAF1sFWBdc1QzDdCrjT0zY8oot45leW9hxEVcLk=;
        b=hmZ+XVJAc8etbEO5/VK/+DN2Ci5LVZXR+wX3y7FTeleaMTDSz4s3da3fthaFjop1UI
         XsC/8F6sh0maQT4ieu25ZZndR2roC8f3TJm33lQb/Gcbu6WGP5FoIj4N53+tQjzblKN7
         TDRp+ClnUIQg//5sOxAUaWINCOD0QCFTQ38ssj/8OOx0MPXfqMKf1RQWVLMrnuITS9gj
         j960w43pzBIps5XI7HqIvVzQ89vURO+Ib6ReQ6g275Bj1FIR/+uOMSMjBF+O7c//AYvk
         cWVBbiRIVVXzrD6oI21Xq8B2m15k3tqSmMKb3gEudE3PzU8ACyDu2rwo/PSDTvN4kIoX
         1d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150787; x=1764755587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhEHhAF1sFWBdc1QzDdCrjT0zY8oot45leW9hxEVcLk=;
        b=Z/c0xx8DX7zRGzhFhb1AJ+PC0VWZ4J4NAo0teWskaridxfEdhhxfCKe6v9N7UWVxqY
         yrN9AJpzl21ctiBr1lxa1Id37/gMerPa9/xh5IOWaDHta+JkVqaqYqyuG4KThs4PdlY2
         zJMsquxpa9EiFdMJP4rp6W648jKP8H2yTGeAnA7aD3Iw6zvBHFXSYYe6F8TJOfxOBaqm
         EB6oan9cpp5w60X303ZrA+wyTjhzWOAUL0wgYHh411u4rnJE/ByYGBMJdXuxFN4ePbM2
         fOBBVA/SnPVOetPW2KBPplUBcx+HDfn9wFYLJ4uFwuriEuDrSexLf3v+jwHMnseWRSs6
         /Rtw==
X-Forwarded-Encrypted: i=1; AJvYcCUu2QL/nyQ0rET3gxZG029pqolvRVINaDgo0gBfJgYZ0jb2X2tDIjgaYXWKokM/hg/nN1MJR0SMzfFuV0+ANw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfAZPUEdFIzQzKw0n77sLKydMvHiT4hxB9UWsl7VjhSXu8gA/L
	US2hnYbTb+q9a+kdF678HI1GvvkGJWu8ebhtujxamIcjrWFF7EcMFA8MWnCPyBS0lgcgHFaC7ge
	FBXK+gN3HVxcTnBgraQ==
X-Google-Smtp-Source: AGHT+IE+qKOTlNOP6qk4XcA7FZuJhhCVo9nCRh/d2GGRWB4YahgXOtDPJUzXQ11aXHlXjufKyykmptnJ4oEGLdo=
X-Received: from wmkz11.prod.google.com ([2002:a7b:c7cb:0:b0:477:9654:b44c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b9c:b0:477:af07:dd22 with SMTP id 5b1f17b1804b1-47904b24243mr56076495e9.28.1764150786911;
 Wed, 26 Nov 2025 01:53:06 -0800 (PST)
Date: Wed, 26 Nov 2025 09:53:06 +0000
In-Reply-To: <aSaU5lSmtD17U0kT@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <aSV1rxXq4KuInexy@google.com> <aSaU5lSmtD17U0kT@fedora>
Message-ID: <aSbOAsOJbhtkJACJ@google.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page size
From: Alice Ryhl <aliceryhl@google.com>
To: Brendan Shephard <bshephar@bne-home.net>
Cc: dakr@kernel.org, acourbot@nvidia.com, joelagnelf@nvidia.com, 
	jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, brendan.shephard@gmail.com
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 26, 2025 at 03:49:26PM +1000, Brendan Shephard wrote:
> On Tue, Nov 25, 2025 at 09:23:59AM +0000, Alice Ryhl wrote:
> > On Fri, Nov 21, 2025 at 02:04:28PM +1000, bshephar@bne-home.net wrote:
> > >  impl NovaObject {
> > >      /// Create a new DRM GEM object.
> > >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> > > -        let aligned_size = size.next_multiple_of(1 << 12);
> > > -
> > > -        if size == 0 || size > aligned_size {
> > > +        // Check for 0 size or potential usize overflow before calling page_align
> > > +        if size == 0 || size > usize::MAX - PAGE_SIZE + 1 {
> > 
> > Maybe this should use isize::MAX as the maximum size instead? That's a
> > pretty common maximum size for allocations in Rust and big enough for
> > everyone.
> > 
> > Alice
> 
> Thanks for the review Alice. I used usize here because the page_align()
> function specifically mentions that the provided value should not
> overflow a ['usize'].
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/page.rs#n30
> 
> I don't think that alone needs to be the deciding factor, but it's worth
> expressing why I made that decision to begin with. Happy to hear your
> thoughts, and if you still feel isize::MAX is more appropriate given
> this information.

I know that you picked this particular limit to avoid integer overflow.

I think picking a lower limit makes sense because isize::MAX is a
relatively standard choice for maximum allocation sizes. I think it is a
nice choice because it means you can always compute 2*x for any index or
size x without risk of overflow.

But it's up to the nova folks, not me.

Alice
