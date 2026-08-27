Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F5424D76
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823174; cv=none; b=E6TfO8IkOc+W+xJTekP+tTPx/TbCsmPD3AIgDSFAahUBjREPVVb6lbqzANLU8bqsFK+DRaNQPbfp2aJtIduRuCoOSF8Gbx+0e9clOCMxcDWB8uh3DYNXva4lnhRah9n+OevXb3iqAIK4HxUxUP9xCU0NKc9xzoXtMrELQ464eAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823174; c=relaxed/simple;
	bh=FN4dXpCMRANBXlU7RQqsFXeCvaEgNoe7ceT6uG7LLRg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sOlIL0Htxizp5Euxs/C5t+qOuqS9KbtosWwuAw1w3G35sPw3c6AG9D1v+QYXXuTjFAtJcUYpDfj0sI9ANDRN8OCehWOcC5cq6JNrkwvZ5dWzS0AAWHaKp8DJ3cLiGk3VXBdVsS3WeVFIYtQwvMbdD9k0eg4LUcTxgUpUut/JYh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fynvk5iV; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fynvk5iV"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f726186c4so1136827f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787823151; x=1788427951; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOVo/FTydc/3lTq5xwei4nbCv9MVREwBkwBRQhpC8zc=;
        b=Fynvk5iV3yJ6rZ/tuFqgqc/W2leATLGK+XgSUNdMTG+z/Ts8P893R9HwMD+qj74RWz
         zZbY6wKcBcd0VF2JDyCEdZDtIBbQSNgPbPj3zbI7GwZGR/zs0PKchIF9ipNp1VbIvSEA
         33QZ8JBQ0rsF8RwNnBXT4AsotBho+QmFHR3k+bbLxQBQfKZHZW3e/IpasF6qVxqxqPxF
         zjp8Y7Oqk3bL2vIWefj8v5B7FlmD78Mchbi3+nBmzjWGXTqOhoUN0umzsLW9Mz+rs6Yu
         Q08abVHGlRyoyMWZkozXQaV0/qW4fkuY+mRxDhErAiG0CbB7t8WxOQ1mmIZlFWqjqn40
         kHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823151; x=1788427951;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOVo/FTydc/3lTq5xwei4nbCv9MVREwBkwBRQhpC8zc=;
        b=pofJxKWmUdzaftXo5WmiUVxi4m4j6/T0yLQBPwAUqEaxJOGo4lWf/gHAyS3oLVSdr0
         Ro+bSfxPQd77DMABqhiZRRKxhq8W4dlyrGyylZP2Jll7Oei/NuuRh9CNlig5B9wi+y3M
         zfXWN72oMVkbuCrlAPWs6+bqIUU31BBv5LisvEdrsrNuXR7ObfYPtEdXAMCZnfcSIxwn
         dqVv0djMl0eph67lOpvHvmElpI0XfxZIV+rHHY4R17y7z4Cvl7Y7GR0jzVk/t8Aub5Rr
         fdo3wPwI3NkClVYw8Cd8+ilcJhh833V+lQ8ujoFXHZjLssddVHvFnoswhvFjqxM7sYph
         11ag==
X-Forwarded-Encrypted: i=1; AHgh+RpbTvyQCu1I5Pd/yGoC9s+XF88IxV9FY4FKLHzBypHpxk3HEURDw7hm/bbW2vFmN/qpHwhPslwGNeKyzUCUkg==@vger.kernel.org
X-Gm-Message-State: AFuF++kR9xK04h6UW/1NCLpDxAz69x6InNt4lscIy258jsh+12VVLCtX
	IUyf2SW2+6SMsyOmhNci/ishEHxFqTM5LXeZBcYUiQAWvJ4VYb764kz7RQ3d2hvezFl/Jqlfym0
	wiCT6dm7UVHRH7/Vygg==
X-Received: from wrck21.prod.google.com ([2002:a5d:5255:0:b0:47f:6d55:abcd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41fd:b0:47f:95e8:2ebf with SMTP id ffacd0b85a97d-482e26f8466mr17865060f8f.12.1787823150366;
 Thu, 27 Aug 2026 02:32:30 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:32:27 +0000
In-Reply-To: <20260827-chid-v8-3-bc74c77d0214@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827-chid-v8-0-bc74c77d0214@nvidia.com> <20260827-chid-v8-3-bc74c77d0214@nvidia.com>
Message-ID: <apAEK9CUZICDTL1i@google.com>
Subject: Re: [PATCH v8 03/12] rust: num: add cv! macro to create values from
 constant expressions
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 27, 2026 at 04:28:31PM +0900, Eliot Courtney wrote:
> Currently, using NonZero/Bounded constants is quite verbose. It's
> unfortunate because it disincentivizes using it in interface boundaries.
> Introduce a macro to make it nicer to use. The macro `cv!` (for constant
> value) takes a const integer expression and widens it to i128 (at build
> time only) before passing it as a const generic value to a new trait
> function `FromConst::from_const`. The trait is implemented by NonZero,
> Bounded, and Alignment and lets values of each be constructed from
> constants without a verbose turbofish syntax. For example,
> `const { NonZero::new(1).unwrap() }` can be written as `cv!(1)`.
> 
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

This doesn't work in const context, so I don't think this is a great
strategy.

I would want to use it for cases like this:

drivers/android/binder/netlink.rs
        const BINDER_CMD_REPORT: u8 = kernel::uapi::BINDER_CMD_REPORT as u8;
        const BINDER_A_REPORT_ERROR: c_int = kernel::uapi::BINDER_A_REPORT_ERROR as c_int;
        const BINDER_A_REPORT_CONTEXT: c_int = kernel::uapi::BINDER_A_REPORT_CONTEXT as c_int;
        const BINDER_A_REPORT_FROM_PID: c_int = kernel::uapi::BINDER_A_REPORT_FROM_PID as c_int;
        const BINDER_A_REPORT_FROM_TID: c_int = kernel::uapi::BINDER_A_REPORT_FROM_TID as c_int;
        const BINDER_A_REPORT_TO_PID: c_int = kernel::uapi::BINDER_A_REPORT_TO_PID as c_int;
        const BINDER_A_REPORT_TO_TID: c_int = kernel::uapi::BINDER_A_REPORT_TO_TID as c_int;
        const BINDER_A_REPORT_IS_REPLY: c_int = kernel::uapi::BINDER_A_REPORT_IS_REPLY as c_int;
        const BINDER_A_REPORT_FLAGS: c_int = kernel::uapi::BINDER_A_REPORT_FLAGS as c_int;
        const BINDER_A_REPORT_CODE: c_int = kernel::uapi::BINDER_A_REPORT_CODE as c_int;
        const BINDER_A_REPORT_DATA_SIZE: c_int = kernel::uapi::BINDER_A_REPORT_DATA_SIZE as c_int;

Alice
