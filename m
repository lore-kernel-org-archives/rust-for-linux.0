Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B8316BE17
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Mar 2025 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741862851; cv=none; b=XQz0MpYB9wF3h/7wxem7e9Ii03hMYs11MKNpy+SBKsDHj5qgCMPSc60McIFTipqHjgGUSI1QRumcMgT/ztLEJ+u1GNdvD5MoEAWzVMGNdgRijUosh1/ESCyu9DPf0frOZUO+9iBH1JY/7WpMSqvEj6lXMyyeOcVCXM04VlsETTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741862851; c=relaxed/simple;
	bh=LP5eXeugNTen1bBkv90xRuq2BmM2qnVG2bEcP7+53GM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hEIh2O7CbKa4WONGWKcaNpGJ+ntkd8V5K7UH7fn4dUNUYfDJoN6Uyq8dgEN32MHdUK+rlBV9+qQwQXI2tVHYZVGgKzWgjXJUK1Lo/67M1ONu5i+KwJKLuOxC2JWJ5bXNdbKAP7Y47g3vNmfzDV5TXcqEybsd0Gu0JILfXA/sg60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rmGhsliZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rmGhsliZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ab5baf62cso6126655e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Mar 2025 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741862848; x=1742467648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ9g0Gaavw77PwDpx2+pgwcbpRIgEDZUZKLzgDfdqpQ=;
        b=rmGhsliZCZqPCaiYS6tHSdiOm/EPUha9hftpT4t5EWat5KRYalCcH7IeD0XbFd+TVE
         DkvgSneZohPcQOPnR0m9jvkUFcSBuQOoVv3Mu35P80I83DUrOBxru+A1y2bO5vV4HjPk
         rCRlEyLJbNvltl8hoe1+m5GnY4jDgEc8deVhNOtjQ8zpHpqTmdmwx4zI9wkP3N1axX98
         J9r1Imv5Ck+H+hREUqtE/aGjGYwOgO9RSMoEZU1LV61G4Uw1niKn+hvGQ9gyss98oa7L
         FrYmTxho0CrDVSoJWog31TBpEc67fpKro6wtlKXZnYjLOhcvoLvlqPPDHDXkNTp9febE
         eGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741862848; x=1742467648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ9g0Gaavw77PwDpx2+pgwcbpRIgEDZUZKLzgDfdqpQ=;
        b=fdolRLhHSW2Su1rcsfFoYSBRyYqrrWvt8SU/3IfUrqXZ+95AIR40colWCqMZfmOnBn
         6gFAYyALsjziqoCwij2zmL5A30nP3HmAEWJgMWWP7mbpxHyeHxUQNiG4AWwOW3j/Zo6x
         7KQkrfVIqZ/t/A2Qjh7ThuVrSQako74iVALg4lleB6gYCWdr3IZHTbpmJd1SxzNFgMRt
         aesBRQecOgkGrcvd7RvlfbzQRXfm32svTJxjO7YWX+gfzKJOmYUjV+9NwFDnRS1DTkcR
         MHc3BhEprjMOpLkB/DXupeYcVzGkHNapFNAHL4qbf10uDW0SdIPL1smOBeNefXeAhKWo
         PcwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDMYo1/UWg6+5XyUfNmVXSPThkzXuYk7kv51Bg/43l8eB4IDoJeetYNLh2/tguUt5AeVdQPz7XkLu+nNG4iw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2joCZyUt8r68M84TNcLbl3N8IZE7mon7WmZII9jc5Dm4IUY/L
	sthbv09ZCwQRLH/L8skW5gyDDffCwyAzjfK/e87kzM+iKPCmF4j142Zub6hRSonrTs3Yi8eeKPC
	h5qUPlAAMN2GJ+Q==
X-Google-Smtp-Source: AGHT+IFnP3JhBHMfVAgiBjDgec8Dj8Ys+oEmuI/lcu/U/vWhF0K6dANq8oFHYUxugoP1r6AAO5LgIu0hY38u4Vs=
X-Received: from wmbbh12.prod.google.com ([2002:a05:600c:3d0c:b0:43c:e9df:2ecd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b95:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43cec97779fmr192265835e9.11.1741862848323;
 Thu, 13 Mar 2025 03:47:28 -0700 (PDT)
Date: Thu, 13 Mar 2025 10:47:26 +0000
In-Reply-To: <20250313084525.773620-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250313084525.773620-1-kunwu.chan@linux.dev>
Message-ID: <Z9K3vokYu5osMCwh@google.com>
Subject: Re: [PATCH] rust: file: optimize rust symbol generation for FileDescriptorReservation
From: Alice Ryhl <aliceryhl@google.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 13, 2025 at 04:45:25PM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $ nm vmlinux | grep ' _R'.*FileDescriptorReservation | rustfilt
> ffff8000805b6ef0 T <kernel::fs::file::FileDescriptorReservation>
> 						::fd_install
> ffff8000805b6e60 T <kernel::fs::file::FileDescriptorReservation>
> 						::get_unused_fd_flags
> ffff8000805b6f08 T <kernel::fs::file::FileDescriptorReservation
> 					 as core::ops::drop::Drop>::drop
> 
> These Rust symbols are trivial wrappers around the C functions
> fd_install, put_unused_fd and put_task_struct.It
> doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.
> 
> After doing so, the above symbol will not in output.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>

A few notes:

* Your own Signed-off-by must always be last.
* You're missing Link: and Suggested-by: tags.
* There are some grammar issues, e.g. a missing space before "It" and
  the phrase "will not in output" is not good.
* Let's also add the marker to `reserved_fd` to be on the safe side.
* I think it is easier to read the symbols if you list each sybmol on
  one line like this:

ffff8000805b6ef0 T <kernel::fs::file::FileDescriptorReservation>::fd_install
ffff8000805b6e60 T <kernel::fs::file::FileDescriptorReservation>::get_unused_fd_flags
ffff8000805b6f08 T <kernel::fs::file::FileDescriptorReservation as core::ops::drop::Drop>::drop

Alice
