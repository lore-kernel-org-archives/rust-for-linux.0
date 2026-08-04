Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8913A7D98
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848399; cv=none; b=PR/Ly94bT0WCMcbJRLA/VvBy/F/KDPvsNrfJfPjHu9myG+B+Si1fj3HX0x14sIIlr88D/FGRcBCXxtA2GFNXE6A/RRJA91U9EK0G/csrseE54tfTgulGuSyGIAf0eyoW3lO2B+SsL23IBPAsE0WbdVnspPP0XJGAY2UTlPlSdPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848399; c=relaxed/simple;
	bh=zMMLoO2gqn6g7gsTInJpy+nETcf+jiRRREPUnNR9uU0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VjzHno8awhbiXWvk91CtC4VWM6N6aWBM8hxfhPOVQGubQMgCB0n+7pVXM63BIqq7FVoIZCVDJYdTeccuPc67uWXCzUqUvW91ib1fRFG/2KnQh4cu1auv0s0/Kzxcb66LYBmF6dePeMLOQKuHZtIJtREyyiUw7FbfDuhtoX0Lius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HmjkNqCM; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HmjkNqCM"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4954b1c6310so29914365e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Aug 2026 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785848396; x=1786453196; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMMLoO2gqn6g7gsTInJpy+nETcf+jiRRREPUnNR9uU0=;
        b=HmjkNqCMuaRdj28dOW/FO8Y4dWkK+HHHqB7YEyOxgY0FXdtr4HfMc2dBQo183x8KEH
         LjhDcW1mSUf6r7FQ9iTodu1nCxoI/QRWlDDQrDSE5MAnvNymM7GvD0L69+7GRdH7gshA
         n/ZzjH/7tdbGNwy7iSH7Xa+wqrbDdDwsIMpWcoOhKfZyL4hsPJaLdHstX0XSOYsYtxRc
         BiZdZDrYFiEFNY6BW3c9rnSb321he1PgY/t6mlPZj6ASDdPKJSvo6RFN3x5A5fFj1jv7
         uibS9t1DU8jkk5KrV23jZWJWLxZPSLuNoOzl4fhkjsh3pbQgyG/MdsP1Pxs+rbRk0BJ2
         qfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785848396; x=1786453196;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMMLoO2gqn6g7gsTInJpy+nETcf+jiRRREPUnNR9uU0=;
        b=EDuzsGAgE68xcYnwc2HwHVppW9hZY0T1i0CKzEdVtyvVnFtR574nN3cD5c5Ws2B2GZ
         aE4znzMrYzVyMI9zvq9Vko4zgVvs/uxX4++eKgYt5XswjxTtIcsZEwnKPoxwgaulV3VP
         PN7Fzr1WvIFdzGjMqbhYnip5AE4r8tfP9hkgbWtObVzCbTopJM1/PigXy6k62Xt6qiwt
         ImZrqwSWOY8OIENTdrxd0KqW5xmTbQAU4iZO5pTzUr2M+94PMEb/HMapYn4UvcPGNJh2
         j6MwJ693t5+cZXQJ3VD2SkqmQJd18nwDEJT4v+hYQW8/tem0nILDk9xnTIJLxytgotD5
         rkAA==
X-Gm-Message-State: AOJu0YwlBf5ezbw72LW1Hr+rS5bVTr6M+Y0jVhBnfxG8wrJN2XmBBq+g
	f7Xupi5bUr60dPj8XViH9OHSUOf9pOO7qfcHnbbT5hWCupS9pFkZfCDcnbe08Ri/UrkzcxryVLm
	DNTnmQAn3zN7nUR/s/TU1qwHzpsz5q/q7VaThlrsDvV82Qw9ND3T8VtP+eA5ofuZsrggTYFAjvR
	aafalrd/OgheznoUWUMVOV3JNIze1+lUzcfBYgib9Vk48pCmw81WnYFTDJhphF2b8=
X-Received: from wmma7.prod.google.com ([2002:a05:600c:2247:b0:493:ad14:710b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f56:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-499484a9989mr140005055e9.14.1785848395221;
 Tue, 04 Aug 2026 05:59:55 -0700 (PDT)
Date: Tue,  4 Aug 2026 12:57:29 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.629.g250fe7f194-goog
Message-ID: <rust-at-lpc2026@google.com>
Subject: Invitation: Rust for Linux Training Day at LPC 2026
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Tejun Heo <tj@kernel.org>, Jens Axboe <axboe@kernel.dk>, Robin Murphy <robin.murphy@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	Dave Airlie <airlied@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Christian Brauner <christian@brauner.io>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I am excited to announce a dedicated Rust for Linux training day on
Sunday, October 4th, 2026, the day just before the Linux Plumbers
Conference kicks off.

Whether you are a kernel developer wanting to write your first line of
Rust, or a subsystem maintainer preparing to review incoming Rust
patches, you are highly encouraged to attend.

What to Expect
==============

The training will be held in an interactive, classroom-style setting. I
will be joined by other Rust experts to guide you step-by-step through
integrating and using Rust in the Linux kernel.

We will balance theory with practical application, focusing on:

Core Concepts: Understanding fundamental Rust concepts specifically as
they apply to kernel development.

Code Walkthroughs: Exploring and breaking down real Rust abstractions
and code that already exist in the kernel today.

Hands-on Exercises: Writing your first Rust driver. We will write a
driver using the QEMU `edu` virtual educational PCI device.

Instructors: Alice Ryhl, Danilo Krummrich, Boqun Feng, Gary Guo, Daniel
Almeida

Session Goals
=============

We have tailored this session with two primary outcomes in mind:

For Developers: By the end of the day, our goal is for you to have
written your very first working Rust driver.

For Maintainers: We will cover enough Rust syntax, idioms, and
kernel-specific patterns so that you feel confident reviewing Rust
patches submitted to your subsystem.

Logistics & Prerequisites
=========================

When: Sunday, October 4th, 2026
Doors open 9:30, and we start at 10:00. We will be done by 17:00.

Where: Room 2.1 in the Prague Convention Centre

What to bring: Please bring a laptop. Instructions for setting up your
local development environment will be sent out closer to the event.

Registration
============

Space may be limited, so please register or confirm your attendance
here: https://forms.gle/ksNftmkdbbjvAJgH9

If you have any questions about the curriculum or the event, feel free
to reply to this thread. We look forward to seeing you there and
building the future of Rust in the kernel together!

Best regards,
Alice Ryhl
