Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D056614A08D
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jul 2024 21:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720472842; cv=none; b=Fh15bHITU5106iyvfMkOgM2ONWv+eDGxLtMz8N7emvzi+btEhgSTpJZJO4uUc+sRKrVbFa4xFIqsei6KIqDPr027yNw5JRrl8bVNbxq6kcfal1tXyXDR+wL8D+w3Ufi8LxXla5neFVh5PT5Q2SEyer+RsOJJGzOOsjWtO96tfRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720472842; c=relaxed/simple;
	bh=L8YH8jz9n1wZoySLoa92P8odJeZQ9rAEncrrj7IV4WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lTHGWnFVk+gD+V0mMUGEgpNVClXB1VhWtR7n68x+VJANdFVR/ER50yy5qsDeFN055Gl90fSlv3JdJfy07EqAaPLh9lllg4tytFeGW8hYxx9ozh+5RVbZP1Zr2pBbQIYjCcglpcTqG/e+FjMM+Kq3tvyR0GcYnXdr+yDJCm01p7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dOU3SJ6m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dOU3SJ6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720472839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cFqRthfbsSdjt+c678nPva0J5xGverzYDIQbIkQstA8=;
	b=dOU3SJ6m3ZXhp9o7Gn/vjLFdVtcaZoCa0o41kGNR4mPveuNlBedhJXs0fQEQBwNcbg9QBD
	HtcyWgYDrQGCW0/BVbbsT5VMr5xma9JFXSZkIDhLZKla8Bb8Q17jTkQLwQWdkFxLEWSvMY
	L633xwj9C+m5WJlqs5vlolz1tIc9beY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-iAcofahOMO-GAvrjSFHDcA-1; Mon, 08 Jul 2024 17:07:18 -0400
X-MC-Unique: iAcofahOMO-GAvrjSFHDcA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4266fbae4c6so2733055e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jul 2024 14:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720472837; x=1721077637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFqRthfbsSdjt+c678nPva0J5xGverzYDIQbIkQstA8=;
        b=eS6Wd53UoTIYi9qvWtDBameb4aKUDfVNEDFvliq6O/ns4un5MHAzyzRWijpB8YaTCa
         dFzS/ntbmu497Jdxl5HhTtzxI6cDGqbLQkQy14oETbz5VB/+gLitdUkfGHM8UA0zXnAf
         gIERtPJUl9AGnk/vNSJiWaoMtiUs45Nd7d0kl3tHPNslhm/aikn/b3Lrw3StmAwqzmPo
         PskPevbsKnACw2y945CezrXODcuylL9GmsrgNhF1+wv/Vg4qbvdGZHGkF2nLGvhdGVfk
         0gjyTEt97L2HvcIBr+EEVPSkOB6Ga7uvLUJuHm/Gpwx4XmBGuAgp9UYncGI+VrU9IZ/n
         C8zw==
X-Forwarded-Encrypted: i=1; AJvYcCXWHXuOH1FZ+orN9h5YGYU3RN2FnvhIuWfMdGGtGgZSZOInGp9AedTB5n/+oG1giF7apf5uYuX8YDJcXe5hxQ8vSexBgpNq1IBB0H/KS1E=
X-Gm-Message-State: AOJu0YwN/EwLYxCAxGrIgYK9Ey7nDRxWgWPCTWUv9KPhknybWiBb5XFy
	vrqVyhavB4S/YKvZmumuS36F44d2gsuQEYkMdlD8aINZFzV2834QJMfPWYT4s6HkmpBy2TPFMs3
	rI5FEto5hf97VPzfDCRoambR4DhIBKcWxi4DAMrBO1Eo6CN/6B2bzwB76nEdof37d
X-Received: by 2002:a05:600c:4a98:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-426707da1a6mr4450395e9.11.1720472836875;
        Mon, 08 Jul 2024 14:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWOtEfljcKGLvuBNvpw3i/hd/jPNNrk3kagEm0uLHE35JpntWw5a/hT+IC3JuzZw+mS7Am4g==
X-Received: by 2002:a05:600c:4a98:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-426707da1a6mr4450275e9.11.1720472836490;
        Mon, 08 Jul 2024 14:07:16 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f76c2sm11492425e9.28.2024.07.08.14.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 14:07:16 -0700 (PDT)
Date: Mon, 8 Jul 2024 23:07:14 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: russ.weight@linux.dev, gregkh@linuxfoundation.org,
	chrisi.schrefl@gmail.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v2 2/2] firmware_loader: fix soundness issue in
 `request_internal`
Message-ID: <ZoxVAiNPqdGChvH8@cassiopeiae>
References: <20240708200724.3203-1-dakr@redhat.com>
 <20240708200724.3203-2-dakr@redhat.com>
 <ZoxOHxHze2ynJS-q@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZoxOHxHze2ynJS-q@bombadil.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 08, 2024 at 01:37:51PM -0700, Luis Chamberlain wrote:
> On Mon, Jul 08, 2024 at 10:07:21PM +0200, Danilo Krummrich wrote:
> > `request_internal` must be called with one of the following function
> > pointers: request_firmware(), firmware_request_nowarn(),
> > firmware_request_platform() or request_firmware_direct().
> > 
> > The previous `FwFunc` alias did not guarantee this, which is unsound.
> > 
> > In order to fix this up, implement `FwFunc` as new type with a
> > corresponding type invariant.
> > 
> > Reported-by: Gary Guo <gary@garyguo.net>
> > Closes: https://lore.kernel.org/lkml/20240620143611.7995e0bb@eugeo/
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> While you're at it, can you go ahead and extend out selftest coverage

I think that'd be good and I thought about it. However, I think it makes more
sense once we got a few more abstractions in place, such that we can come up
with a Rust test module analogue to lib/test_firmware.c. What do you think?

> for the firmware_loader so we can test Rust too? Could these issues
> have been caught with a selftest? If not why not?

This patch isn't actually fixing a real bug. Which is also why I didn't put a
"Fixes" tag.

It's more that without the `FwFunc` type indirection and the corresponding
invariant the safety of `request_internal` isn't guranteed formally.

- Danilo

> 
>   Luis
> 

