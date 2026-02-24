Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D315E2248AF
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919389; cv=none; b=Mniu/ZC4WQReLoDH+yBJ5LV9TmdzDHx6Fl2W2Mch+hP5Qv5P4Z5q1t69BHEJZ2slFov/UnSAL3Yg74uPvNqxqOpqRLVpbBz8sPCaSAGAXzbSt2uXSm05lUw36Hl/Fm3yvwIkNh9BmMRx90JMoFlWd9RBs19YeS53IM+xcAayGho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919389; c=relaxed/simple;
	bh=S1AMswh1lQbv6HKMYTWuP/EFtpAZzTkpPRr5/NqjPXM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZI8NMD2vfI/S021jIfAmL0Q1cJcOyg+PprTNl6oLiDDyBMURoZhh8xmffAuQ3H4C7bLUTPWQ1cBUBAVXspiskUKHBMckbIDPuIQVDFqyCAGhN9jxXoobrRLwZwgCNkJ7OwoZIKhEppuV4G21uxfJ7f6qxs/nRyuFl3dHdHMM2Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KdSDC853; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KdSDC853"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8fa71b83a0so561775066b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 23:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771919386; x=1772524186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Hi1B2QR1arEGlsvfgWO32ZZtaRVb/wfgOh/rBlJpc=;
        b=KdSDC85304TK6a9uNt0lP330VpGlHf9ippEhIqB8zcRp3ML6BcNHHOXcmPtX0mazT0
         lhihb2lHBbLmX3QK3GsNaF1KzizJHegBpnRkgOrgZFfkOKn5sKN7qhr6iBlcnUA2s8el
         FMgw8wckw9TLJsovHIHYiUCxeZ26mmXkXa4pmAAeVUUR4BMNgUQqJH4fhzNMemwh4SOZ
         lOoKHc+7ypRCBPsJ9HnmcR2xissbSLlUXENe++xPNRlk9+fTeUmbXst2L6nQVmPW0QLi
         2HDb4IScXukKyXmZJwQCsAV5mMLKTs7pdxcc8jyJxZJ9L9VgHmrQGxT5ydytd9GwPE5s
         QUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919386; x=1772524186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Hi1B2QR1arEGlsvfgWO32ZZtaRVb/wfgOh/rBlJpc=;
        b=YkJTRS0WUtTgHCfXa3TEppWQxHPx0PJn3SSCOTfzflkv1AZ4fxYjoiG55ySEkAbfYr
         MxtkabfqoH5v8p1/mWeyQe+V/W4VX0ngCQtFOzypC+V2itQxF8hjg0BNEpwQXxowIJfX
         af6Qyul5Dq8zvnUJSJ6B87c74nm4SChm50NvVKgi6zNOnmbSWK7U3Gi7x5fcpe+i1yU0
         X8BpyQyOz3Q8iws6+cr86AHWbCag3cu+e/reGSR+BHzD4owSDfLque04T6kYosKs1hNn
         ZsdIGyO3HjRM7gOUDh0i5eIWlNS566QaTMyzEL7eWVeQu1Rt/+fTTZXzpoULXu9P2DfV
         1UQw==
X-Forwarded-Encrypted: i=1; AJvYcCVYyC3EITBqy0cNmH3FQpc9XP8kBmVTAjS5DGn2+l3Hu8wB4irtaDGj3rpHk8Q1b8pBaIkYNKlyaeiYvMiEGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXViMpAqTqnKwkwaHqDwTMCC5rPlLshj9mC3a54nQT4ajMieSk
	ehIQAk/3bI6b/ojWxEIU2FuUTqkRumuwajb3WgCYYlc/L4TVirzRQ2HEzVmuyyF2ieZz/f9Ch8z
	lXLZ3D2VZXdhAZCFsdA==
X-Received: from ejdce12.prod.google.com ([2002:a17:907:d2cc:b0:b8f:8b56:4a97])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9301:b0:b87:2abc:4a32 with SMTP id a640c23a62f3a-b9081a2cd50mr766450566b.18.1771919385883;
 Mon, 23 Feb 2026 23:49:45 -0800 (PST)
Date: Tue, 24 Feb 2026 07:49:45 +0000
In-Reply-To: <20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-unused_var_err-v1-1-c51d805eceb5@nvidia.com>
Message-ID: <aZ1YGceMIEwdke96@google.com>
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

On Tue, Feb 24, 2026 at 04:45:30PM +0900, Alexandre Courbot wrote:
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
> Fix this by allowing unused variables on these methods for this
> (arguably rare) case.
> 
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

I think this would be a better fix:

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index f93f24a60bdd..dbf3c62ffa09 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -23,6 +23,9 @@ pub fn err(args: fmt::Arguments<'_>) {
             core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
+
+    #[cfg(not(CONFIG_PRINTK))]
+    let _ = args;
 }
 
 /// Prints a KUnit info-level message.
@@ -39,6 +42,9 @@ pub fn info(args: fmt::Arguments<'_>) {
             core::ptr::from_ref(&args).cast::<c_void>(),
         );
     }
+
+    #[cfg(not(CONFIG_PRINTK))]
+    let _ = args;
 }
 
 /// Asserts that a boolean expression is `true` at runtime.

