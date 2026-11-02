Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793580400;
	b=Lks2exIdouIGAXAi+Hv8eFNaHIqn+FR/2lxSFh1GFmLpBBjFVT/h/C8wXzKfVfT9rKuL
	 f/qpJHNDX2DIIYpuICvwY0QABVCgE7x4CVJg6Ln+FmRXtgAOEHA52cfP2Ze8YkhbLZC6f
	 03J+BS7w3B7LENDhwSrsRQJxf6pDKfHWjbxqjRex2VYWMuCDVHpwKhF1iMpvAsiI+ZEIQ
	 2WCIQfeglDahLc9tO7t1OLgyDBUbJVqO8ppxYMvvby15rL3Ll7cqW5hOU+fUjL13ecdm9
	 xCCI1kuNx6NI/9os2w9lmfPxRtrfPo+DmY6FA+LLhErU7MZV5O5DWBDE2fbODIsPGRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vjEmmX6EzGgRBfyBSvZnMWKCis3KJq0Gi1UrMn51jSQ=;
	b=H4OD01rpR7QIdBs9Q2kT+Dq5iGjFp3omJN4UyUNyz3H2JHqELwujdIGykdi8pxqJgcGU
	 9JG81yMTm7QsJV1qyGuDHvNsjlMAHhkPP8q0IbocCB831/Ay9gVKBfrv92oAWJAhvVcki
	 AMe7X7T28Tg8gANSKhdRlmq/WN8dl61rtWwr/cyd8MqlE31vCCmvupzm+pU5gt9jzMhk4
	 oL+SkROy2KgDjfOHMDhLl3hMmfcuUCKTbOan14Q9pS5Xmq18AnQUOjGC1tTC1mb7qaRnV
	 Jrp0+xGfPINL5pGzBwhdW58DJBnosTvFwAre04PRgcmIgMCpBYf5kJOfhcjoa4b0Ehg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o67+VfI7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B05606A324
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 00:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B05606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o67+VfI7
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a0eecf73fso417668eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Nov 2026 16:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793580399; cv=none;
        d=google.com; s=arc-20260327;
        b=EPHeCXnJPJqcESKaputsodMNrTsGD+NNWu0Je4Jv7Coatx3gMQ/lfhNBRw2qFk/qUD
         Xm8DEH1J3v+EMVX25o0vJZM3pdkOKcr7XTmli1louq+8IbOgYWy0wuX0d48guIn6zdVn
         ovJgWqanQz2+cpONGzodUpWulhiT2hirWJwlJ3XJAX99iDK5QydBF5jztoDci3jo0hQ2
         WyTGw4Ho1fbg7sxczXDhyNMCaX1XbaT2qRU7zWUiERaQMIVXOtqyyWPPOf7lNO978aH7
         anzDuqMjgdhg/G7gzUS7v00qKQDjP3OOFetQpf1ayqqKOtKL6Rfm4BeNnsB0Ls5CTz+i
         nmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjEmmX6EzGgRBfyBSvZnMWKCis3KJq0Gi1UrMn51jSQ=;
        fh=HVDjJjs1N1VOgR2hnyFZ1fz8lhdN17hQKO2+czI3I1w=;
        b=iJWeLeKJT9vT5ZYrhmrjD7kWC1FxSXYByxMhBNXzKNxrSmIFsekonLGC3TzBIoEJYX
         3O03ut/dY5aKLe23DEX8v+SE0HRr60/NpUUcMm1YqFuASQ3qnXIZ5tUGffsF4/De/FHJ
         zlKPk7GqSR8YdCco37dt7A7KtD0XAIuEjCq9/vwmsA2qvh7TobALuQMXCiXXmocBYO9X
         M3AJCN9sSyr+FKEMdedKo2LurlY2IwKgV6yL4UozHZpTJlxvIfLeqWfRx35wB2oYyyJC
         H2UiKd6nA1dmuiulqkojI4oCq/xACzMXSwwt1XjFAIAlW0B02YzvnkmaY8Xtzn0odAgt
         T3aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793580399; x=1794185199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjEmmX6EzGgRBfyBSvZnMWKCis3KJq0Gi1UrMn51jSQ=;
        b=o67+VfI7TGlXSNgSkpFsughn7q+9+yYECnzFIFfY0Y1sMOBq4tdMupuBlGXNqGKPop
         9egfqYW8M48YFL4DHaV2vblg+EEhDOCNzZonx49S27LBpQJWMiWtW+OScff8t5EmN3Qw
         kQFfIoLLQzTymHK895yYeKg00pGNNQ4kWz7Kx0LvxJW1dV8MaXD+pqvoAtC9UYRy5IQx
         sp9+hoAv7LlGyDwRBpQ76cqB/VOHGMJ+vEbqNehCzHsiXNS9zVcfbtWvWPc9kQHe8gyC
         wf1lBhoLuzyl5C+qB0brSJJ42k0SRBBe7OStcRaFX9MGUjrGly92crJOXDcd6gYXDZCA
         jJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793580399; x=1794185199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjEmmX6EzGgRBfyBSvZnMWKCis3KJq0Gi1UrMn51jSQ=;
        b=zKlN4qvbLK96GnCeLLBWSE8Axqf4DtSP/bgYSPw+E6nM9Bo8n5cWCku7hT60ZBQDan
         E9sbpKIwvCAymK8PfDzEnTGOFAe3VmF5cz9QV3pQHzsYOYpxLRTpvZ4HDnVaCWQaOXLp
         wi2Hgn5zB+7yU7atosnrKi4zcSSSduPxKn5xIjuitqoH+SuzoptG8zUsAX28Ye+pxNnS
         29LuAq9zyj1cYR6m3TStmbtmBq/IVBVH5IHt6Fo1C6rDnknkBbAwi3ZI573GLHaC0r8m
         2yS7fbVmI2Wrs1wFHkuY+hbR5AyPhluG9zFOsvZrQQvK+DCeVuw7+uaN6x5hD7994ZOw
         xOzw==
X-Forwarded-Encrypted: i=1; AKwUvBxTXXuhxHkMtn4pYRBkK2r39MGf65dJ9KjBS2zeYmJ7NBKyhmJt/UoT5b02l9NPOrTSxwJZ9Em8yhQwDXXmyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z81JQntivP4xC+YjQWR5ez5jHefsCDtWfdILD3O6p2AqDdGgJtd
	p1p8o/Oudcg6DQGclynfcYBlAI4LkuRo5FAZ6tvSIbYzoykMlyN+ubj74lL7pGQzZzSMFb0QPh/
	jxwYqxy1IyfqSpGsc6IFCQM4GRxLABNg=
X-Gm-Gg: AYBFou1Kz3SWhP5Ap924utj6giQfiQeHq2uJ0lQIYsh/zbE1WcVx+01YyAIs1Mopl2Q
	xxBTza/TYeTD12NVNdUi5ctWhuw0vCOSrFFeu1g5jBdG7x+taUfKLoMMfQuvyJe3A9XXl+TCylp
	8BlWzzebf/c+2Vqw8RCIjIK55rh8D/uaVYXo8t12XnC8jIP9xxNAEeZ0bOzFYhOLERHPYFSpoCZ
	H74RBNKxUodhl+FSPsoo+d5luqJ6v1oc6z/YeU5PJq89ilAZOiW9R3r/IIZLHq9n4qENS3zmM+D
	zV9WJ4i3T9SUn5ZSO5/tA9jCfoOZvTVm/ZUiU9oDgAjEz2uzf23V5/+UCHhGpTleZAVc3VSX2Lw
	dmU6kVvU7hHO5tphpiEm1N/9FEqceLcJWekDYFIK8AmW9BQVKGzhv1oAWWB0ehFXWyrT6ZXrsSJ
	Z1lDq4CQNrd7H5GAyHxvKDTb71wTXcozXvuQ8QmvfxAfdfQFoQkSL+GTrB3w4eOQQ9hpfSszOJZ
	yA9RQTssLdJ6uaZ8ww9ZtBSy5omhSTa4cZ7rDYYbsYKUAZHF+SLh9AhJg==
X-Received: by 2002:a05:7300:d082:b0:369:ffc5:6767 with SMTP id
 5a478bee46e88-36a4236a643mr17666091eec.2.1793580399370; Sun, 01 Nov 2026
 16:46:39 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018163719.81691-1-ojeda@kernel.org>
In-Reply-To: <20261018163719.81691-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 01:46:26 +0100
X-Gm-Features: AclHuK-4MjIXg8YJnYcWupgszDUMapc507LicBlOsBTb2wracrfxL9hXutBBGhQ
Message-ID: <CANiq72=JMDa882tQPLUSTYhkfKmxxZH-gjp=sTD-Eq5KDt-F-g@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: fix `undocumented_unsafe_blocks` in `PolicyCpu::from_cpu()`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:37=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> For Rust <=3D 1.86, Clippy triggers after commit 02c5d7bfa872 ("rust:
> cpufreq: reject NULL from cpufreq_cpu_get()"):
>
>     warning: unsafe block missing a safety comment
>        --> rust/kernel/cpufreq.rs:700:26
>         |
>     700 |             NonNull::new(unsafe { bindings::cpufreq_cpu_get(u32=
::from(cpu)) }).ok_or(ENODEV)?;
>         |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^
>         |
>         =3D help: consider adding a safety comment on the preceding line
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#undocumented_unsafe_blocks
>         =3D note: requested on the command line with `-W clippy::undocume=
nted-unsafe-blocks`
>
> Thus clean it up.
>
> Fixes: 02c5d7bfa872 ("rust: cpufreq: reject NULL from cpufreq_cpu_get()")
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

I added Cc: stable@ -- while this one is not a big deal, we are
backporting 02c5d7bfa872 (i.e. the one this one fixes), and thus we
can take the chance to keep it aligned to mainline and clean.

Cheers,
Miguel
