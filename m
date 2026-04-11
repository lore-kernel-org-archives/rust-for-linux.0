Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A57196C7C
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Apr 2026 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909805; cv=none; b=Gy/1JYIX2Gv7m+6Al+/yoRzv39OaRrjtvgjXwDfpVlJ1yrp4k81r+t9A+BpCZ89Id7GHZd59B8GD4gKSPv2s3gobGhUJcQAMlcRNoV+7eWsGUGtRSeQ5SBo+rOieQy5YHGBOekrHf2YGF2dDePfTRMTilCIjozHJ3V9y5RVB03g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909805; c=relaxed/simple;
	bh=GB72JJsiotjmsTeSYOJVrOcPx/d3YFTtyU//wvnPopA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IInv+nj1E5CJYIpU+az+CI64Jpgwp9iIWMJkJH0wtjuGMk10qsFBO7yys2iUTcQDD4b6Z8htsqKJsI5FqNsvwFt7tAItSyxdXVV48J2ZuX/f74j3BYqP0tI51gLIZWyvbbquS79F3XJ60OhTedSBZ5xK9QFV90HOGPqVh8RYIHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=ajDJrE0A; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="ajDJrE0A"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a8fba3f769so13719425ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Apr 2026 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1775909804; x=1776514604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DzjRMQ0JdtxqBhtkAeDCS/1xK/Kh5wMUnQG+Jga1ziI=;
        b=ajDJrE0ASyqe3uMpVTFz6QIzc12P75ZZgBQCCdPyr5Aj8F3JbVyTql/seI6EgGW5X+
         CgYOj3uJAibI6QgSw+Sn0koDEI8ywb9dBo11rOl4bf3EqfLsQp72YbURPY0UbwTbIVaE
         c02COpsiIU9BPOxYxuUthxNxXFyPq98jG2irg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909804; x=1776514604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzjRMQ0JdtxqBhtkAeDCS/1xK/Kh5wMUnQG+Jga1ziI=;
        b=L7KrO2vhvrosjf0AHABd5nrGkVWqW2zVjKVxADXvojmuRUSmMFEJe9tqCzEytFfMdt
         B4sViq54tmaBpKOMT7prsD/otRkKIq8B6y2g0ukoecakp7s0cjWHxDJoM3PVfdH1xq5h
         qMI/YhAsttgXJIuOo4gWaV/gn5I07X8e6VJAqP3/T7g3OkqH0O/ZdVjJBuprwyplBQ8D
         ArcFYzNP+MzoCSbj+1SAmKc7KFHEUIu5I7Zwyh73PbE/M2I+snkxAceCb2KkEwWFh+9y
         z10Syl1BLAaK8AztZl00nfz5VOCcme8vmnbrR9ktjWH3lMGLf3AKjRGFfvHlfRWAfE9Y
         SMog==
X-Forwarded-Encrypted: i=1; AJvYcCXiwN5tlKWGMWIrGzGHGj4Nug1ryM2LPT7uTnK0I/nuLzD1rrnFvth2EvYsRVFgnz7cAtVTDBuHx2T2QHxAbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyioUaCET54Ik3iQjcNH82r/+/cKmLjSmf2eJzyMwStJ6jabuPm
	f+stvStzptIbSukS/yYyMc9FdA5gRUq+Kw92TGd9IsI09Ht1dHaT+Zw7PdkO+pxMP6U=
X-Gm-Gg: AeBDietVVKYiauUQeb0LLK8Qcvd6arK0wKJkNblSnkCbdJRMyrS1LpgsfSBiGY7es+z
	pODo67+dp5XGyoptzvLu/1bTD2vQg3+c44Gc+0j6FP2UWh/tJ7Os5QiUjJs2oAb8LVuzchzVm3w
	OElTNb7AtJBj1pT2GJsKP3DcnKG1VmCO3swV/1y3ZKm97w+AqGIC/Q03L7OR6xsZMvoqLU+BG2O
	vnXA4YPkwk5hRCHCNDCYE0hlLZGO0oOEI3593v8Cuh+ykSGTMGkR0+vm7NeRlN3nsFN9g+M8vTq
	IX2MKDiewvYgOCeaET9/ljowitSvMi+sAdqznOZbU4LwTUxXjl5eOIweTVHWbuYdSVJ1i120K3m
	dalIVt2ijpdPJ7LQmZIxppv4RGTT6NGHDz5z5NaWHBE9rhVFgqwVh+KuDc/mVPC7tcpNB1F0tmD
	XphFyl9S9283T6pAwOTw==
X-Received: by 2002:a17:903:1103:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b2d5aa7fa2mr69691975ad.43.1775909803528;
        Sat, 11 Apr 2026 05:16:43 -0700 (PDT)
Received: from sidong ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f3a8f7sm59475805ad.71.2026.04.11.05.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:16:43 -0700 (PDT)
Date: Sat, 11 Apr 2026 12:16:39 +0000
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Rust io_uring command abstraction for miscdevice
Message-ID: <ado7p6jV6aapelBU@sidong>
References: <20260408140007.8401-1-sidong.yang@furiosa.ai>
 <2026040925-taunt-exit-0cb9@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026040925-taunt-exit-0cb9@gregkh>

On Thu, Apr 09, 2026 at 07:25:23AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 08, 2026 at 01:59:57PM +0000, Sidong Yang wrote:
> > This series introduces Rust abstractions for io_uring commands
> > (`IORING_OP_URING_CMD`) and wires them up to the miscdevice framework,
> > allowing Rust drivers to handle io_uring passthrough commands.
> > 
> > The series is structured as follows:
> > 
> > 1. Add io_uring C headers to Rust bindings.
> > 2. Zero-init pdu in io_uring_cmd_prep() to avoid UB from stale data.
> > 3. Core io_uring Rust abstractions (IoUringCmd, QueuedIoUringCmd,
> >    IoUringSqe, UringCmdAction type-state pattern).
> > 4. MiscDevice trait extension with uring_cmd callback.
> > 5. Sample demonstrating async uring_cmd handling via workqueue.
> > 
> > The sample completes asynchronously using a workqueue rather than
> > `io_uring_cmd_complete_in_task()`.  The latter is primarily needed
> > when completion originates from IRQ/softirq context (e.g. NVMe),
> > whereas workqueue workers already run in process context and can
> > safely call `io_uring_cmd_done()` directly.  A Rust binding for
> > `complete_in_task` can be added in a follow-up series.
> > 
> > Copy-based `read_pdu()`/`write_pdu()` are kept instead of returning
> > `&T`/`&mut T` references because the PDU is a `[u8; 32]` byte array
> > whose alignment may not satisfy `T`'s requirements.
> 
> Samples are great and all, but I would really like to see a real user of
> this before adding any more miscdev apis to the kernel.  Can you submit
> this as a series that also adds the driver that needs this at the same
> time?

Hi Greg,

Thank you for the review.

We have an out-of-tree C driver at Furiosa AI for our AI inference
accelerator that uses uring_cmd.  This is our primary motivation for
these abstractions.

We are considering upstreaming the driver and porting parts of it to
Rust using these abstractions.  If we were to upstream the driver,
would it need to be based on the accel subsystem (DRM)?  Or would a
standalone PCI driver approach also be acceptable?

Thanks,
Sidong

> 
> thanks,
> 
> greg k-h
