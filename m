Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8605286341
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133114; cv=none; b=HOd9iJzLM5xxnXLF6UHP/nfh1Q5xzz25dJjUg50ajv0+nF+i+v4bvAGU4U1+yZDnRZuJZv/KBs+VqyWz2rFLeoKpufuQFChV2tpqQ2TUviIh3L91xWhoYeWJODXuXLZZkj/Se2lsb7FFWDFDMosT6C9QS1BHEJAwVqSYQz42mmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133114; c=relaxed/simple;
	bh=9dkOL9WCsK0uU5ILftSBFEZ1TlCgDoh6q/l5wlxwtlQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a/10QbypRelVydNxPVSExCChkbMEBYteOIsECCgt1ZCr/HZfvEgGZCxJenoyaobtTTQ74LSjPTH55lG71VwGrOLaOxxd1EiG3J8VWd+pQGi/SI1/nW6rsqiESHzxAFU+U3YzXXapLNr83lyepNYcVJBES3mSUttTba6p68lDgCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JKtjImyk; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JKtjImyk"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-480717a8e05so57549315e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133112; x=1770737912; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5h76k9K3qFcgY90MofiTdAnuRfQxtWeUNCZad/0hgRE=;
        b=JKtjImykoutBQTj5Xfd5HwCS5KRPipLcJWpo7gxagdp95+EuGgiGDF4emQCMqhhPKi
         JEvKl19o8P14+q+BqB8kiyz5wFB6qsUMbLBbBN9Wmk/yM7I7H5YGP5oElTym9X9FCqc8
         7NtZSO/qXdmYO5U+OPGeAi0tT0xXaRSBmRtvXlNrLQYjcZ02Ykpbdfz1eri5g4McI7x2
         h2X0m0D1ZbIvD1aLRZU79Lpyh7XgT6iJ4uhx2kCmtiHlB3XwdEfU0Ertv28lhmHysC++
         RsxylX1h2U4FnvoUJXh1UddTvupGqcp2jD72wZxX5S9TcD6NGZ9gM7PXl/hcuXtz7/5O
         5s3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133112; x=1770737912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5h76k9K3qFcgY90MofiTdAnuRfQxtWeUNCZad/0hgRE=;
        b=RtpwszEW58sKEdtqz+Jj/VqO846Os+41cfGeVIgf8BW3jSsD6Xe8VQ6+Fw+48eW+IE
         XcEhqwZOyihfM5P6iWL7/oPvigJc2smTPdvm0vfiw8R2DaZana6yAoBZifK0b0VJ99h3
         AVKCrG/BiIo7+5mpL53sqCsTXkvsQNi7KO9FuWm3zuQj0M7FHbsFL7/61JSYzdUBzy8x
         7k9VVdoT+YdtPgzXIt/6aTPtro9/x0KIPhBwSsQ/3VyJlfPU2B8CD6ctbHPo+UF18dH9
         eipnV852rEbERt8oqFCFqfRtGq+WnpDqTmMNFvY/Ms/KrZazSxZhwLrb2Do1BjZBUqsi
         zcvw==
X-Forwarded-Encrypted: i=1; AJvYcCX/BQgy1S0yOSUwFRhbGSvIYroKoSAo6KupJuMf1BnWUB1c3hSJy/nkUDA9M+Z4c54pgbsfJ2ldD9uod/U7PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/afSUvPRKTs/yuN9rZbXtemEWs35MqQbe8TZCjwhqj5LPT1Ne
	FuJ9PtxkXKia4Iy9MfCVRWEWAyYigltDceloofBizBIGGKumVFXmD59GytKbq/zB1VvnIa6UVnW
	D1qTCG1VSkfFna5RHJA==
X-Received: from wmby20.prod.google.com ([2002:a05:600c:c054:b0:480:68eb:6c8d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c16d:b0:47e:e87b:af8 with SMTP id 5b1f17b1804b1-4830e9667d2mr583395e9.21.1770133112080;
 Tue, 03 Feb 2026 07:38:32 -0800 (PST)
Date: Tue, 3 Feb 2026 15:38:31 +0000
In-Reply-To: <DG5FEPO6RCK4.17KOY7PRLNFKV@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260131154016.270385-1-shivamklr@cock.li> <20260131154016.270385-2-shivamklr@cock.li>
 <DG5FEPO6RCK4.17KOY7PRLNFKV@kernel.org>
Message-ID: <aYIWd9wzPIRa4gZc@google.com>
Subject: Re: [PATCH v2 1/3] rust: alloc: Add shrink_to and shrink_to_fit
 methods to Vec
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Shivam Kalra <shivamklr@cock.li>, cmllamas@google.com, gregkh@linuxfoundation.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 03, 2026 at 04:19:14PM +0100, Danilo Krummrich wrote:
> On Sat Jan 31, 2026 at 4:40 PM CET, Shivam Kalra wrote:
> > This implementation guarantees shrinking (unless already optimal),
> > because the kernel allocators don't support in-place shrinking,
> > a new allocation is always made.
> 
> I'm not sure we should go in this direction. There is a reason why krealloc()
> does not migrate memory between kmalloc buckets, i.e. the cost of migration vs.
> memory saving.
> 
> For Vmalloc buffers the story is a bit different though. When I wrote vrealloc()
> I left some TODO comments [1][2].
> 
>   (1) If a smaller buffer is requested we can shrink the vm_area, i.e. unmap and
>       free unused pages.
> 
>   (2) If a bigger buffer is requested we can grow the vm_area, i.e. allocate and
>       map additional pages. (At least as long as we have enough space in the
>       virtual address space.)
> 
> So, I think we should just use A::realloc(), leave the rest to the underlying
> specific realloc() implementations and address the TODOs in vrealloc() if
> necessary.
> 
> [1] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4162
> [2] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4192

If kvrealloc() does the right thing, then let's use it.

Alice
