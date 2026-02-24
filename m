Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D4D2DFA25
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919556; cv=none; b=d4P6PtJUV7dz6tygjegje8vxKkNbHBbknzIKXqfLtVyRV1aqmZ746y+H5kF4/gbhrNzQv4LjCQus1qONT0scl62Mle3wcYILSDQfnKmXLFukzAW20wE+CsTith8+r1qZoPi226/5AYRAKUAecriNMZd2LfspC1vT9cqEVYmqozE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919556; c=relaxed/simple;
	bh=xQguQBqpXuNz6Zc/MmIr7wUyo3jaXnQQF0pTh/QAaYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IVSlp9X+ohw5jkHTELVdxbQb4vZZWZYXmsI99JPEXiOyCVASSO4iYKn9c+AFxGeRAJCGFB37pqUzm3QN9rAk8U5Jc4PeqZOniUiHBbDDwOWhv4K5ATgI3mDrwOb9zdUynLqQmCDVZIdPYANAODPfpTC48p1kmqHLvmLlB0u3fjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IXcSeBB7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IXcSeBB7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48378c4a79fso39151465e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 23:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771919553; x=1772524353; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ysZsryEdYA3piRDg9AIWpP8ob8aRO8hLKfBRBDFELYo=;
        b=IXcSeBB71KsZtXR1X3o5/sORfu+/9mXnUCq91K093hDBBkFvaPJslTtXx0hO4c0JsQ
         FBPQhlt/90y017krJEMM+wsz78wK3khBAdIx+kmGDy8liwKdh8SzkNUhNW8AzW2XLL5I
         zETJV5EA3Wj4lBUzp4/jx5IBxtlh+ST+0/8c+ke8/t7wtXNz8c5xiTKfBkkdraXGyz1E
         lu1wv00O4hxJpMPeC86cTvC43aXaM873MnzT772qOzJlA+bj2v01ITRdu91fB6gf6ONi
         HGrN2beeQEP/K4P5rxHaY+HeBP6PSZLaWc5GfxvZ7seRbzobWPiBpNWAVo1DCKV46j0B
         D6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919553; x=1772524353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysZsryEdYA3piRDg9AIWpP8ob8aRO8hLKfBRBDFELYo=;
        b=tGqNVHEVKkg96P+bKitswyRPB8KAzYuSaUZIYnml975CTVdWWJc94WYa5RgP5U7vL6
         p/MPglXqkICJ4AE6F0Qqfy3EzZ0j4pGDnH7yF9rhfo7zgw83yJ1cx3MPMm2CaKiL3/kt
         4dn2dQry9CT1x5RArKUjNQKZH3mFE5iFZAJgz6UVYB79ttD3h6PzvmcmPsj//Mi3m1nq
         YjXqoO92iBs4LbsgIeqaeIgYLDzQF1cMWnFJf0TQSBkKndzO4KBeNKPQv4RbVqhrrmwU
         ssLIogQaYMPA2w4lfHpSstAgL2GncM0fyHVON5RWbGPd0hg5Nd/3aD+6yH0j/k143y2q
         4aTg==
X-Forwarded-Encrypted: i=1; AJvYcCW0/L3Dq+fsNWlH4u+Cjj8lHvD5D8i+h8T14ehsKRF+cFQfkme6xhjUf5KjVOgOpsyg3Qh0V+3srdCNOYCuFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgzA8eY67R9QiVBAvWMp8xzXFZXanBVMIy9H0txAM5CLpD0yMr
	tcbi+iXFuko0tfuSX7JNhSeZeoJByzgbPHse+dtuh4e2aM01cVAoyhLaIgpABE/jSFYaVcN+bPL
	fnyE4OCKzuzYFvyldSQ==
X-Received: from wmxa13-n2.prod.google.com ([2002:a05:600d:644d:20b0:483:6fe1:c054])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6986:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-483a962e00emr161528485e9.19.1771919553135;
 Mon, 23 Feb 2026 23:52:33 -0800 (PST)
Date: Tue, 24 Feb 2026 07:52:32 +0000
In-Reply-To: <aZ1YGceMIEwdke96@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com> <aZ1YGceMIEwdke96@google.com>
Message-ID: <aZ1YwCziiM3gfJYH@google.com>
Subject: Re: [PATCH] rust: kunit: fix warning when !CONFIG_PRINTK
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

On Tue, Feb 24, 2026 at 07:49:45AM +0000, Alice Ryhl wrote:
> On Tue, Feb 24, 2026 at 04:45:30PM +0900, Alexandre Courbot wrote:
> > If `CONFIG_PRINTK` is not set, then the following warnings are issued
> > during build:
> > 
> >   warning: unused variable: `args`
> >     --> ../rust/kernel/kunit.rs:16:12
> >     |
> >   16 | pub fn err(args: fmt::Arguments<'_>) {
> >     |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
> >     |
> >     = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
> > 
> >   warning: unused variable: `args`
> >     --> ../rust/kernel/kunit.rs:32:13
> >     |
> >   32 | pub fn info(args: fmt::Arguments<'_>) {
> >     |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
> > 
> > Fix this by allowing unused variables on these methods for this
> > (arguably rare) case.
> > 
> > Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> I think this would be a better fix:
> 
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index f93f24a60bdd..dbf3c62ffa09 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -23,6 +23,9 @@ pub fn err(args: fmt::Arguments<'_>) {
>              core::ptr::from_ref(&args).cast::<c_void>(),
>          );
>      }
> +
> +    #[cfg(not(CONFIG_PRINTK))]
> +    let _ = args;

Or if a bare _ doesn't work, then:

	let _unused = args;

matching tracepoint.rs

Alice
