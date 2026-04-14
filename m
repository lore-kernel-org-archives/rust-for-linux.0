Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802D1DF254
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180983; cv=none; b=FqtcRMo1ifCKCIBHk6A5jqXZ/fnmIwnsW17KJMafwn+vPLRvsIEoS2CmrS5BOeYm8hTQmzURsqfHuP88liKUSJt2x6BTREKvtiL4KavM+8zHbs9h1zundVM+DUDk0FLvYeEnW6u5+q6LdNrtbBObnKrCNOM1kWfShRzaPgYlfxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180983; c=relaxed/simple;
	bh=P7azTpi+MN/jyrZ5BBlCVFneGWvJ6Ty3e+joKzhgGGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2iWo4ZWN10fCiaohx6EJ6XtzRupWDkBwG5OYRraWWXioKS9CZoba7SIA1oE5usEO1NOdT2HBp6OC0/1cR6SjfodrufLlVj2abuBL+EAmURgEgmujFU7CoL3X22hStsnpeQWXimxR8MnznC1H/cp3/B8xM/XJAx7Mu1MGJHNtO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=Ab/y6Crq; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="Ab/y6Crq"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso26634585ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1776180982; x=1776785782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPzXW8AqKhqoLGflDV8nOPkwdCJG/GLfLI3Z+E/2MF0=;
        b=Ab/y6Crqh3XEpl5st1GJxF7faY8nQ5g4NBVLhkIRHXdN11AqkiomxrNSTyt7n3PRyC
         55ORFXcSWpR/12E/QWlXo2NEi6lpKO0XOKKrgy7eth6h2nfUOmLXJ84sB0/CBH3Yuw8f
         GMu+yO6YMYCjRbMro5ssD9UbCp+Y4p2EPsSGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776180982; x=1776785782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPzXW8AqKhqoLGflDV8nOPkwdCJG/GLfLI3Z+E/2MF0=;
        b=IHW3EQQ/pzgVShq4CCTNFnP1suM0HKhr6buCIw+jdLUuZIwWEcQJL/9/UFvRnKdFtm
         hweEEJYWADyeSFxcQMbEvzX30axYH5OxSXZ8bVVBFPtcyFSI28QllzfIw6NEMyLbxvez
         /44XqtARWLfKbLhcidxl5Yjjnjx1+o1aXP+9jKf2XiqT+uNwxYBdXaou0RoPWivhTOTE
         9/720FoKoE6UrMVr0uSFLSZwMx1uLFghvkdAGN8SjW9b04iqwVuySqV4QyY0DmOifSiY
         TpHwN5ukmcNvC7Bs8isery1MXLNbU4AwmsMDowJQEbDgkIzwXYbH5OmYkdtK8tzz4TL0
         lzFg==
X-Forwarded-Encrypted: i=1; AFNElJ8TUBhzW457kw8fAuD21g4zFqbuHGSauJSNi1QcuFm5l92N4I4F/fQtqG3H9gzcD0hdelz0msjXbXNrZehTcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17nqZgBwFKkVcjZwYwi9MgeTdUBHuIO9Rx8x+9yAwpFEgizEi
	Bm4lRZS2gx3aro6ASUZ/PptqDWjnaav4m6r9Pu+pdweTe5KDzpJr4Sny5S8likNV5AU=
X-Gm-Gg: AeBDieuNm94CJrGho+gpwmw85B7FLJmthaVUc0yFVPsHokXPPlQyyb21v+Lufu5+ieA
	N7ELNjYRSuS9zGMA5QD0deYMe++THnadzKlgglhJn6Zw87HwFJ45ZJR5wz82itpLn0j86Ouu3pp
	EqcLREg8BBv4IpWClEkk9IL7wzeHnkiiOfVuzBcYkPQAqS9nZCHv7N+BzbwEhfdVBB1+nkXevPV
	zDGFRQIDBs/UMD5dohyeSKuKEZQFuXhgZRxZMJAv1GVXH2pAeKs7wwb02urtJOtg2+cNnLnK3qb
	MebVMsZg0uuFk9nvWsvD1z+l2o5N/x2T8SsTQCqc2qFVpriKRSLB3iT7uKxqFQIfYZlB1NcY8JN
	wildPaVr4mUQ1I9m8C3U7vdz4eowqCqtBpFf7IG2trU2tYeg8Ku7uqg4upS8836QZdaNQYrc39x
	i1szYih4nXaI+ez/7B/yo3/DlKL8DUkyH88/4J6XN7aC7IhWLBDxuIzdmEsEc=
X-Received: by 2002:a17:902:cf11:b0:2b0:beb4:3bb with SMTP id d9443c01a7336-2b2d593bd65mr186882965ad.10.1776180980645;
        Tue, 14 Apr 2026 08:36:20 -0700 (PDT)
Received: from sidongui-MacBookPro.local ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45e949464sm89557465ad.24.2026.04.14.08.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:36:20 -0700 (PDT)
Date: Wed, 15 Apr 2026 00:36:05 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Rust io_uring command abstraction for miscdevice
Message-ID: <ad5e5cAmtL8GRo-s@sidongui-MacBookPro.local>
References: <20260408140007.8401-1-sidong.yang@furiosa.ai>
 <2026040925-taunt-exit-0cb9@gregkh>
 <ado7p6jV6aapelBU@sidong>
 <2026041153-scope-five-fd24@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026041153-scope-five-fd24@gregkh>

On Sat, Apr 11, 2026 at 02:27:14PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Apr 11, 2026 at 12:16:39PM +0000, Sidong Yang wrote:
> > On Thu, Apr 09, 2026 at 07:25:23AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Apr 08, 2026 at 01:59:57PM +0000, Sidong Yang wrote:
> > > > This series introduces Rust abstractions for io_uring commands
> > > > (`IORING_OP_URING_CMD`) and wires them up to the miscdevice framework,
> > > > allowing Rust drivers to handle io_uring passthrough commands.
> > > > 
> > > > The series is structured as follows:
> > > > 
> > > > 1. Add io_uring C headers to Rust bindings.
> > > > 2. Zero-init pdu in io_uring_cmd_prep() to avoid UB from stale data.
> > > > 3. Core io_uring Rust abstractions (IoUringCmd, QueuedIoUringCmd,
> > > >    IoUringSqe, UringCmdAction type-state pattern).
> > > > 4. MiscDevice trait extension with uring_cmd callback.
> > > > 5. Sample demonstrating async uring_cmd handling via workqueue.
> > > > 
> > > > The sample completes asynchronously using a workqueue rather than
> > > > `io_uring_cmd_complete_in_task()`.  The latter is primarily needed
> > > > when completion originates from IRQ/softirq context (e.g. NVMe),
> > > > whereas workqueue workers already run in process context and can
> > > > safely call `io_uring_cmd_done()` directly.  A Rust binding for
> > > > `complete_in_task` can be added in a follow-up series.
> > > > 
> > > > Copy-based `read_pdu()`/`write_pdu()` are kept instead of returning
> > > > `&T`/`&mut T` references because the PDU is a `[u8; 32]` byte array
> > > > whose alignment may not satisfy `T`'s requirements.
> > > 
> > > Samples are great and all, but I would really like to see a real user of
> > > this before adding any more miscdev apis to the kernel.  Can you submit
> > > this as a series that also adds the driver that needs this at the same
> > > time?
> > 
> > Hi Greg,
> > 
> > Thank you for the review.
> > 
> > We have an out-of-tree C driver at Furiosa AI for our AI inference
> > accelerator that uses uring_cmd.  This is our primary motivation for
> > these abstractions.
> > 
> > We are considering upstreaming the driver and porting parts of it to
> > Rust using these abstractions.  If we were to upstream the driver,
> > would it need to be based on the accel subsystem (DRM)?  Or would a
> > standalone PCI driver approach also be acceptable?
> 
> Yes, it must use the accel subsystem as that is the correct api for it.

Thanks for the clarification.

I will proceed with this uring_cmd Rust abstraction patch as is. Moving 
forward with our AI accelerator driver, I will look into implementing it 
using the accel subsystem and work on creating the necessary Rust 
abstractions for it.

Since I am planning to adopt the accel subsystem, could you share some 
insights on the main benefits it provides for AI accelerators, or point me 
to any future roadmap/plans for the subsystem? This would be very helpful 
for my design and implementation.

Thanks,
Sidong

> 
> thanks,
> 
> greg k-h
