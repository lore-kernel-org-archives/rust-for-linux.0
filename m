Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0831747A
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706108863; cv=none; b=phS8HaKBgsVdESEUoF7oNqqKL3ZluZt+qI4YP2xfqCNlDUV1dI5uYxMJ9E7Q+HpkYU80pbGLHMcLgUrHmwsLYftyqbcMpidLNUcgI9twWZ9G/PZFsHcGdJVQ8/GN3zIoyaBouR+tE1Bwyg+tI0wiO6msS7eRYJN7GT+1CKCqHbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706108863; c=relaxed/simple;
	bh=9IkzyGEiEKGVlY7GJByNMGnOjq/P6kexG1EtvIuQJEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcQg/gdXtmnpvc+yrEnM5A3U21UPKmKoBpoxQAAWIfim1kxvfB12YNqdmPecho9KMV/QjAChFFZ/uYu0FvqwEoAujoHCleUGcGHM2NACTog4FrdmOHB50mmFLzSWwjxzRKsURQfpp1f6KxHgdyUSfKVD7nyHCSIrABfu4JtenXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qmhCmpyA; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qmhCmpyA"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4bd691f1038so384638e0c.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 07:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706108860; x=1706713660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQUhXDctFpKrx2fN5W2QrrWVrRbLkQpDhsup1S4036w=;
        b=qmhCmpyARXLoJ6MdMPHEVtCYATWCv7XwXXKY6aF4BbnQdNdqOZG69NvkTqPH9mGtJ7
         xa2sS7sCNbJotAI50oi6IyqOJyeVyf4MqpFkITKycB+oOEsRP8uTGB/DlXpzVZuHj5Qs
         UDGHcgd8gr1S7XZcvmjd8ui5NlVPk/KT31WDudQfZUC/3SELMDA0MEkv9s37Fr4nrYEW
         tsM421VNdTbzvHs/5+ljRrPS+Q9p3ZZsy92Ao8FoEMoFZEtUttLcWXCFWmIS4o5Zrb6o
         lKBU/paVSaVCODJ7hJGk++YkO2R1Q80psAdaQOJXubUz/6Hohk0+iHRZv/O0A79yLFiy
         oTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706108860; x=1706713660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQUhXDctFpKrx2fN5W2QrrWVrRbLkQpDhsup1S4036w=;
        b=ucHTyY5CQ0WlQ6/CzPtcKP8QwDhGyalzKS0OvjDIrG3uvIOVut8jNf9FeDHyLoMANG
         uTwDJ1NdGn/4QSR/qRP6boeQE7ef574alNycS2c77x+8lrPQ0bB7vrtUX+aa6ku+0N96
         wZMvMF09UIV/4OrTLQfK1XBzYj0EtlpShOX3szm/0yrXz8/fwtpSGIswQ5Aouhlkljkf
         o9U/E8C2uGbfLq1KBmdnz14M8XeVvuKabVHxewvq1QoP8Qrs7Zqzau+1McvwQA49fLvD
         256DWT0gNJbx+w7huLtJGZyGbIsIUCB0yYCyMbVLDr9UNEYTQnGsyQkaTyt/41i8HZ33
         jlyw==
X-Gm-Message-State: AOJu0YxTnJvGEdxuraDCwug5TLBXPCVnu6t+3UmUJYOmWOwKPQXgGJLr
	ATchjSXnflj/IfKWKugTU1ReaJfAjRUYVQmQ3wT1xjIOHOYmCASsgpNIqg3C9MR4//7Dw+Sg8CU
	9LD5UYze35xuZ9Fav6+Fm6JLnFyd7pNwonTPl
X-Google-Smtp-Source: AGHT+IFb6yjLuBKZVuY2x8Cw5WSdGsFrEo/4i5lg0hKx+ZpQud0Y0yr6LHmrGsVoHS54595KDEkmaWJgFQ0HvO4qfoY=
X-Received: by 2002:a05:6122:45aa:b0:4b9:e8bd:3b2 with SMTP id
 de42-20020a05612245aa00b004b9e8bd03b2mr812775vkb.2.1706108860461; Wed, 24 Jan
 2024 07:07:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108-rb-new-condvar-methods-v4-0-88e0c871cc05@google.com> <20240108-rb-new-condvar-methods-v4-3-88e0c871cc05@google.com>
In-Reply-To: <20240108-rb-new-condvar-methods-v4-3-88e0c871cc05@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 24 Jan 2024 16:07:29 +0100
Message-ID: <CAH5fLgjQTkipTEWv=ogiaa7Y6xcrQR4EVkzhSz4oW8J2Bvq84Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: sync: add `CondVar::wait_timeout`
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Tiago Lam <tiagolam@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 3:50=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> +/// The return type of `wait_timeout`.
> +pub enum CondVarTimeoutResult {
> +    /// The timeout was reached.
> +    Timeout,
> +    /// Somebody woke us up.
> +    Woken {
> +        /// Remaining sleep duration.
> +        jiffies: Jiffies,
> +    },
> +    /// A signal occurred.
> +    Signal {
> +        /// Remaining sleep duration.
> +        jiffies: Jiffies,
> +    },
> +}

I just realized that this needs to be re-exported from kernel::sync.
Otherwise this struct is unreachable, since the kernel::sync::condvar
module is private.

Maybe Miguel can just add that when he picks this?

Alice
