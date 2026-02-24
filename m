Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E90226E142
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933458; cv=none; b=ksXPqYKvcVXhx1BLYa2/yRBsSrl/v4zkoYGOL9H9c5u/mi3vzLjUlrzOM8BwvJ8R0hlS1ZUYcX4BBeO1XFJewSva5JRaxoawHiadQbmJXGwlvVFjoveLcP+6WQ71eLla0UJw/cZGALhlG8+36uopJ/7vRTYNftWe4uuPfFnUGdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933458; c=relaxed/simple;
	bh=/yhCfYp3uMxvk+kNCDwHyWBEWKd/5Wzgl2bOPy7rkU8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fgRsyDaIGNHWNB92M6oxb/QZnQKZ46cGj5FjR1TmUhKbixx7LZ8ZwPwwZRKfTM4dTazfM03BgRg7F4tJbnyp+ePpKPYTSRHoMNto5ak+DyD0OBMHsIxAJIr8+aZTgyiukcHPgzhUt5cZmbWeUzIHGhObofGcJ1dyT+1eLBF+4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u0K1RQgU; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u0K1RQgU"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b844098869cso536222266b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 03:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771933456; x=1772538256; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZBFlb6hySeXrec0X1VAfrRDStvY9nOhd/jaZZEDq/o=;
        b=u0K1RQgUEz0VCSRrnNwhjRA7OvMpiUQjvGMOozxHziqPNtC56DOY8dy3XPeG81KNaN
         nEUIpF/Dn8HEbhcefk690k08VOi/4OI1vmGhsBC+6+W4U3N0OzH8MPpuJL6PJesFVFgq
         nTPrjZVqCIlJhtZ4o5b6g0YzT8n9dsRUTTF+0Br02n2+fCb2gsWb2MsVP0fJ0EKD9BWA
         zULXNRZMFSGjUVCkrhSFseI/Is00PIu90/BLcW4SOifDTmPFf2V/4D36QbFs3P3STcyd
         EzdamrskaDC3WR9RFllh4b+nToZ2i444TN9YGaZJEWfL12nu+ScJofk4UZSVvxNHJixl
         Py4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933456; x=1772538256;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZBFlb6hySeXrec0X1VAfrRDStvY9nOhd/jaZZEDq/o=;
        b=on3bnkIm5ZsIJUxVpN2h7Sj8jWh+JXUac2B3Ni0WwaOJFxF4ze3AeJttF+UHRwIvQy
         CFv49XCBY2XOiJS6XIlFYE/5etZF4AF68Q9rbkW2L1524MdkopQ5fUZliKCXoQZN0SCY
         k8uaCBWnnJOwjkl3ExmMgDfyJFEWvx8X3ddoyG3qVg9jxBY+jqNserQVe5zvsGkyDZJX
         EZzABYmxmeIZJXinviWRYQvel4UzNo1FjVcqZkaLLCjon/+ZvVpSaMQkhuTcOmGzsh9d
         kEQaMdfWULWSOtEyQxbQzlb+k8MpJXG1D0z4H9fQLCAbGOuoiYVSTxgn8Op+PB3cqsNH
         VMIg==
X-Forwarded-Encrypted: i=1; AJvYcCXOI/5ZpPd3prstlG75KemSZfkpfVdJPzUeGnDn/GIJ/AQlxUChktveJ+NFiT2D5QcVakTntOXIu/vyLvQxPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs0yFRvmm1+hMWltoCM/7ka7uT1Gh2sYsbCjsWkZU6SARq96vE
	q4TSceomVzAVgFHTfiCTwSqtJVRmSwqjJvv4Yj6j+pvJYwUlcTCMPrwpZWwVVeoy+U15l4NTxsL
	5apN7Le7cYiO7btLwqg==
X-Received: from edxk21.prod.google.com ([2002:a05:6402:12d5:b0:65f:35ce:f5f7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:fdcb:b0:b72:58b6:b263 with SMTP id a640c23a62f3a-b9081bfe5b1mr618915466b.60.1771933455483;
 Tue, 24 Feb 2026 03:44:15 -0800 (PST)
Date: Tue, 24 Feb 2026 11:44:14 +0000
In-Reply-To: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
Message-ID: <aZ2PDg7YcIZNMvKU@google.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 24, 2026 at 07:37:56PM +0900, Alexandre Courbot wrote:
> If `CONFIG_PRINTK` is not set, then the following warnings are issued
> during build:
> 
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:16:12
>     |
>   16 | pub fn err(args: fmt::Arguments<'_>) {
>     |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>     |
>     = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
> 
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:32:13
>     |
>   32 | pub fn info(args: fmt::Arguments<'_>) {
>     |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
> 
> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
> is not set.
> 
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
