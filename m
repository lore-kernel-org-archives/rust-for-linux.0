Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A0B296BDE
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760649867; cv=none; b=cu4xFg8heyoznOHr1B5D7PYARCr+AQ6IBfXmZ6lqu11kFlQDoaxaQxIgtDWEqu3X9GYUjyEv9qyuBZtMSOSbToY9LNd4+LMfvFziEYNoJ69EaxEC/I8Ps//+Pa1Y6qBZDUd0xKMTrCdOo8DH2401DhkELVVwTDu7P71rfb7bvUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760649867; c=relaxed/simple;
	bh=zkqdfx4BD5UyPEIxcbsOF2fQCsYMrVYuy2A9HeyQ5sc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idjkO+v+ZV5ABFU8AGMyKe/7qIn3VGm9RTa/MVOgyhPebG8vwTQ4SvGsHnPQDheivcWo9SL+xfu76CxMfMguvZbeCzNS3hh2JCR3jewckI0g9ZcNvuwWU0J+1h3sSKQqCrqyrrDuKkE4BQ7R7t+e2HbfR2COrW84b91cPYE5NP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haIP9fp9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haIP9fp9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42420c7de22so662283f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 14:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760649863; x=1761254663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8K154kd8Y5oAN1bdoWfiouSXSOoD2DULkag1tX9qDc=;
        b=haIP9fp9o5/mIKKQkzlGEb+IFXzoH9wthWhgCNqasnLZBbtQGz4oc/EFbk2i00aH9S
         ko3EzlDa2456lYJydkBbbzZYxc/FoagYnASxX25TZY0GAkpxjm/iUNodqgkcj3V8U/oP
         XoiReuKUEdScOoA5E3jzWC+xJNmRCTkEXXwXoIzpDQJqpER/LJS17c23phX4QK3Xuax6
         jxJED/0J7ksIP7geQmpIitNZEils80XCwDB87SuMbvBrRIkvFSIVBC9JbZQ+qlCN3KnE
         4JuxgQA4vuc3F4XIWxGdkb79/+b44GSYfY3u+GbhrVWpnF66qjhcGDnCguXRjok8l+72
         5kEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760649863; x=1761254663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8K154kd8Y5oAN1bdoWfiouSXSOoD2DULkag1tX9qDc=;
        b=trjnfNbm7wSbY4Jl5eRFGMD5qcJ6MMFZVLVO85goHJ9WapxiOoRBW8KkIZahwTzrG/
         m8t9SX8K/DCincNyTzEqcC7T33dVgnVFllIwQzfR29tGb4AU1fxAU4/Pv9uL1JdlkGIo
         Mr929UMKyq+LLavi5/zEzSfqCIgU4aM3NL46Mcjg6ZtdW8T4M5oMx9s0pfkS9daCZXJZ
         sjzOukBVeJTmp6gNEV1wyb8qgp+KqSogCzwUEdcz0O3tdB+oCBLLV/GKBy+jyRFKDZ5g
         kOJHA6uU5PiH6gpexnt610Y/IszA7UiT6BitDYPdIYnqMqxi4FG07qi/FmphEoHnybhZ
         o8Hg==
X-Gm-Message-State: AOJu0Ywc2f3EG8gA8/5BQZhU21nqarZFZIPVMTXuf3ni8S+1kv7xMHJz
	xhxAfK1bP7VBdcOXYtqazPiDXLrALNSQuke1x7xQpBdXffumKoWbaYOX
X-Gm-Gg: ASbGnctDnvqMfVM7Xmdadcz1duQsZ4J6FWKYOg0V9+Z3WuMLY4MWueYIW5NeSLJP5x5
	j+7R4c/Ydla/E4DWf8yHCDgWdcvvtFKcdZXD5PYUXe4WMrKR+Mm6fbOHZ1iMHNA0KJ/S4utuODg
	XM1O1fsDnAFZ1NmS9jfg7IjpZTVwR53kz3ioyBWZ7Zecz9SUNsqo9cS+coWW13Xngo82XnpTpTm
	ayJnPnaNb9u9i9uuWGzKZMIN2knDWEaHBgWUyWwNod+ghXouS5aGnuciCeIhgCAk3kBqDV74rgK
	4J8Z8Ce4Rfcq9FTbLltgUcsbUzJqZ47GyN6aezaNPpROefwrIGR10uftpqHMuuRGZrflot5y/vf
	kS/I9CHiMVnzU+kOsmHr2EB3X1AqAT6Z6oUh4XI2TWBFKA9Qrh8Iojtj0Oc07Ods6kFmgotwLlC
	27Ed9lTGn6c2UNweJYNYtYzZVaRNAtHkOVNpAI0UlWj4kBTT6tH+tf
X-Google-Smtp-Source: AGHT+IEuo+os1JCoNcOFBsfo7dbV+ulg6iVzPth7mYQXucYvD/F0/YBKb3eG6695x4HViUPFesLAow==
X-Received: by 2002:a05:6000:240f:b0:427:486:d96b with SMTP id ffacd0b85a97d-42704da0b74mr815352f8f.50.1760649863293;
        Thu, 16 Oct 2025 14:24:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144516fasm50876905e9.16.2025.10.16.14.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 14:24:23 -0700 (PDT)
Date: Thu, 16 Oct 2025 22:24:21 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, Daniel
 Almeida <daniel.almeida@collabora.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long
 <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, Joel Fernandes <joelagnelf@nvidia.com>,
 Ryo Takakura <ryotkkr98@gmail.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>
Subject: Re: [PATCH v13 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <20251016222421.512ca8d1@pumpkin>
In-Reply-To: <20251013155205.2004838-6-lyude@redhat.com>
References: <20251013155205.2004838-1-lyude@redhat.com>
	<20251013155205.2004838-6-lyude@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Oct 2025 11:48:07 -0400
Lyude Paul <lyude@redhat.com> wrote:

> From: Boqun Feng <boqun.feng@gmail.com>
> 
> Currently the nested interrupt disabling and enabling is present by
> _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> example:
> 
> 	<interrupts are enabled as beginning>
> 	spin_lock_irqsave(l1, flag1);
> 	spin_lock_irqsave(l2, flag2);
> 	spin_unlock_irqrestore(l1, flags1);
> 	<l2 is still held but interrupts are enabled>
> 	// accesses to interrupt-disable protect data will cause races.

To do this right you have to correctly 'nest' the flags even though
the locks are chained.
So you should have:
	spin_unlock_irqrestore(l1, flags2);
Which is one reason why schemes that save the interrupt state in the
lock are completely broken.

Did you consider a scheme where the interrupt disable count is held in a
per-cpu variable (rather than on-stack)?
It might have to be the same per-cpu variable that is used for disabling
pre-emption.
If you add (say) 256 to disable interrupts and do the hardware disable
when the count ends up between 256 and 511 and the enable on the opposite
transition I think it should work.
An interrupt after the increment will be fine - it can't do a process
switch.

The read-add-write doesn't even need to be atomic.
The problem is a process switch and that can only happen when the only
value is zero - so it doesn't matter it is can from a different cpu!

I know some systems (I think including x86) have only incremented such a
counter instead of doing the hardware interrupt disable.
When an interrupt happens they realise it shouldn't have, block the IRQ,
remember there is a deferred interrupt, and return from the ISR.
This is good for very short disables - because the chance of an IRQ
is low.

	David
 
