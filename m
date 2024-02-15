Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C168132C1E
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Feb 2024 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010521; cv=none; b=oiWH33G7mGmGAnSMJUY1FpQy0zkdDymj/SObLbvbTWM0nFB2/OKvA6I5k9hxj+jHS4yaSKxk/krg5v4xfl2i+0G2VD5PMOgODHn4Qb+4KS0sK2hukwD5cf35R/Xra1UrDgAIq3iTPZm8t45BZMaxrSeCeGE79t9oSKlu/k3VWjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010521; c=relaxed/simple;
	bh=FZBNw/6dZCUfUuzPdZq/UstJ5+/KjMw/ChjIoNIcFYM=;
	h=Message-ID:Subject:From:To:Date:MIME-Version:Content-Type; b=TIMEui2SZcgHseNmaivvzWD5kZh/K4RWZen/CXmADRYckex8DVwxIbuIokyV9RmhZXVW+mhOBKkJ5OqSwRw0j7OeD8fMQY4ITEhBTjhz6XixBeiNsJHHu68FfomwY1fqNmUoONfIbdGXOa6YKAS9fgmvGJHO5Ttpm0HZHjJCxNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MdcFgDaA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MdcFgDaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708010518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YdERYsJ7FcoOAPL7TgoDeZUCxrZCjuy/s/PJKxDmWCo=;
	b=MdcFgDaAK6Fp/VfNMOmeUPQNfM4fXYvmfFwJ90U0eFIKnotITTCIGIFF2KPDvYu7zGoT1K
	ChNjcctmNKSjBomkhmsg97VHf52h4GnvyNdPBRPC27IeDs/3BvP5m65qi95dZl8E3fki4A
	XF3Drq/JCA1A9raKybvpMIGuflk33wc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-yFyBd1PfN3KAaecGXY0D3g-1; Thu, 15 Feb 2024 10:21:56 -0500
X-MC-Unique: yFyBd1PfN3KAaecGXY0D3g-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-78356ddf3cfso45693885a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Feb 2024 07:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708010516; x=1708615316;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdERYsJ7FcoOAPL7TgoDeZUCxrZCjuy/s/PJKxDmWCo=;
        b=vBKX3I53gYVTPylmYojKHrd3K7amOcBrUuSH1GezJ1z287rTU48w8cWz8i+bONgAJK
         imZ+t1h3GnGWsXoAH0sDnkw+FKz1cQQESfvy8XfFrMnUat94ONc+kg1qxbvkKestcUKB
         EhDqmprIZlM3D7HA7ivqtnWC7HCWNqic3bkCQWhRUhSesIrkoEZNmx3lrrWdpsSdeXYr
         VzvTApDgiPCVcztLsue96bTLDngW4tXeVNrWgrOrfeWayHYIDK22psEYE31wIaxpQd7z
         y98Qs7IcjwSCW1VTHX7K9jRApyzNMnqoYvFN1pHfRXL9a9qLWhQOdjjPqVlbL8rMf5r4
         TSVQ==
X-Gm-Message-State: AOJu0YziWaIh0cpH57aR8Zr+OTAu8MnhTGRkAxU/2Zmxb7PXtUkcCJ4x
	Ty6xk84SQDVqkTeyXRm7UIjT+PxIrNRuqc01r6PiQuoU0NwH430zNombE9u0WpEsQmdG36sOfdm
	1pTG3r8OXbFq4Oa9XvL6prI0Gc5NqScyydtXobZishoaoA/rNbmkdIw3lxQ8BrS4CRKsVheW+ap
	Umj93KW9Nxu4Zc4Bage20N3n6OfiLzS+5GdGjB8ZsuydKt7d17
X-Received: by 2002:a05:620a:800d:b0:787:339a:af5c with SMTP id ee13-20020a05620a800d00b00787339aaf5cmr2610150qkb.1.1708010516067;
        Thu, 15 Feb 2024 07:21:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOKVirwNxxZJ54NVmkWV6g7UNpK6SIFOKDhdT5AGCd9Dk64hz9LvbLmnuviIsKVrXoPE5UQg==
X-Received: by 2002:a05:620a:800d:b0:787:339a:af5c with SMTP id ee13-20020a05620a800d00b00787339aaf5cmr2610125qkb.1.1708010515579;
        Thu, 15 Feb 2024 07:21:55 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id bq42-20020a05620a46aa00b007871f998401sm668500qkb.91.2024.02.15.07.21.54
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 07:21:55 -0800 (PST)
Message-ID: <803d666dcd5b1f927590719c10bdd90ce2ba6dd0.camel@redhat.com>
Subject: RfL currently does not integrate very well with some Kconfigs
From: Philipp Stanner <pstanner@redhat.com>
To: rust-for-linux@vger.kernel.org
Date: Thu, 15 Feb 2024 16:21:53 +0100
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Recently, I've been trying to accomplish some work on the rust-pci
branch in RfL.

I like to base my configs on an allnoconfig to get only the stuff I
really need.

Doing
make LLVM=3D1 allnoconfig && make LLVM=3D1 menuconfig
activating only 64-Bit and Rust already generates build-errors, for
example:

error[E0412]: cannot find type `dma_pool` in crate `bindings`
  --> rust/kernel/dma.rs:74:25
   |
74 |     ptr: *mut bindings::dma_pool,
   |                         ^^^^^^^^ not found in `bindings`

error[E0425]: cannot find function `dma_pool_create` in crate
`bindings`
  --> rust/kernel/dma.rs:92:23
   |
92 |             bindings::dma_pool_create(name.as_char_ptr(),
dev.raw_device(), size, align, boundary)
   |                       ^^^^^^^^^^^^^^^ not found in `bindings`

error[E0425]: cannot find function `dma_pool_alloc` in crate `bindings`
   --> rust/kernel/dma.rs:116:38
    |
116 |         let ptr =3D unsafe { bindings::dma_pool_alloc(self.ptr,
flags, &mut dma_handle) };
    |                                      ^^^^^^^^^^^^^^ not found in
`bindings`

error[E0412]: cannot find type `dma_pool` in crate `bindings`
   --> rust/kernel/dma.rs:136:42
    |
136 |     type AllocationData =3D *mut bindings::dma_pool;
    |                                          ^^^^^^^^ not found in
`bindings`



Switching on PCI, but not PCI's MSI, causes other errors, such as:

  RUSTC L rust/uapi.o
  EXPORTS rust/exports_alloc_generated.h
  EXPORTS rust/exports_bindings_generated.h
  RUSTC L rust/kernel.o
error[E0425]: cannot find function `pci_alloc_irq_vectors_affinity` in
crate `bindings`
   --> rust/kernel/pci.rs:289:23
    |
289 |             bindings::pci_alloc_irq_vectors_affinity(
    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in
`bindings`

Strong suspect for the cause is that this function is defined as part
of MSI, so just activating PCI doesn't suffice.

I verified that this is indeed a config problem. The entire toolchain
is installed according to the official documentation, selecting that
one compiler version that currently works etc.

Setting PCI + MSI (and, in Hacking, Rust Hacking -> Allow unoptimized
build-time assertations) results in a valid build.


So, it would seem there are some "deponds on" entries missing
somewhere.
Is this problem known? Any plans or suggestions how to deal with it?

My instinct tells me that there could be many potentially broken
configs out there.


Regards,
P.

