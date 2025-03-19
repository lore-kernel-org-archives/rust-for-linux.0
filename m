Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC0BB664
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377994; cv=none; b=FV943QRCT0yN+lRG7AWviDDVdq2b9RVSzxuDaQ7YXrVUBXxEzMC3WAWXcqgwzaKqOEk819XeM0MW49sfsH8nKq2S4c2yoIpx0MnfjdvrnD+jg2GwcwUXqZnruwG83wqpTIGoZYk5QtWbT5fdogbwSd7zy13GEZRyZVstJCad47M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377994; c=relaxed/simple;
	bh=7OXvWzLYLp96HzrnAXRUdsB4V2yc1f4pGWk6gTmcbtk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vr3ddoKNejzuCn6VCOkM/dCxZW67p6MtuDwFCL/ATYxO7Mnb1z1Q/tpSM7DHAYpY872dBVEdKNVfyM+FD0axCPN/azMaUi7ic/SJcIBW7TXM5QNYGWD1G1AlJYz5HTnHAUcetGZtV6r2Hfpye7YVrrFWovuqVrPMPR+tjkmlHsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ec+8lCNa; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ec+8lCNa"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so27177755e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 02:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742377991; x=1742982791; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vFFcKQLNGz7N9ayp7megx3xG2FAub1rSop04ZFqYxm0=;
        b=Ec+8lCNargbsiadHjeFU8SMAbDaJUZRWMO6CRmWkNEIjMR8QANOmtWvSZwsLQ2x1+D
         8VsyL1qDBEAtQQHJfbMvyUftHBzoUlwGb/Ym9F8cggF1euWm8bIfQdQYGpJw0SP+uWnm
         QONsGt6guLrlA4Miufox2ckDL9351DP+yXUD1sNUfZoW1Vz4/mnb7L2NuIsD5xvAywYR
         22HLLKQon7x3zDwbpublKomWpdSzXNK55JtRNbfneC36G8wKK65kdrgLI4faIh2IkCCz
         kfWh+VD3xvM+m+ghoqw/ZdbcVqEKi9qTvBTozPvwYer8VExKGLt5vWyqtvngVgRVAum1
         0Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377991; x=1742982791;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFFcKQLNGz7N9ayp7megx3xG2FAub1rSop04ZFqYxm0=;
        b=pQmEkanVo8/jctrx6qpJqrvey5Iz8+3pDvH11l6/lgY/Nt1vR7jS3KwDeJf40BQSPZ
         LM47/Wll5YxoxtYvhxWeNujDxwaiQYxaHtLf5Pw5tFwzADpetUoftXBz/e0JxpsO8KsR
         22uZA/+cf10HVj7BZhlT6xR1GxYPoXxhJLwupdY3NEB0v5i2Al93bS7LSo51go3HFKLg
         B1qQZulu+oHkPltPOQ9iT7HC8lLcRfdXlsriPUB0YLQkovpRSfkjtlV891cQftvGZ8e/
         PDF76wqA5AgqMIfiDbRv1XxrybkzykMCSC2D87n9AA8hHrKYF/cYspwbl6Jd3VF5fwRN
         Yz+g==
X-Forwarded-Encrypted: i=1; AJvYcCXcOYX23CLf+TaTD5fsD7ktnrdwDm39pxX1v3egFT6iZ3Nho1z+Jy0uupHOJzqw6F+R+5brByONocrIzs0fhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaMj3DGgr9VzcHBqjHZHHUJUFrW/xd+LK9yfW38I+FGGsazNye
	2aTdlZenM50TAI94+w3Gai3DlhwNqq+3mhocF8L1dlwP5mVo1ucJDjkTLnIPxV0+2hvnVz1SgX7
	wSfGcfUGuZVW3SA==
X-Google-Smtp-Source: AGHT+IH+DHqDsC8qcXIyCNJGx+eWKB/6/GVLfZ5h3NUdOn7PEcGICGe7gmXSaCcD4fe82ezSM8oNGRIGEGqrt/0=
X-Received: from wmcq14.prod.google.com ([2002:a05:600c:c10e:b0:43c:e51c:1a5a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b95:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d437801e2mr17282485e9.4.1742377991823;
 Wed, 19 Mar 2025 02:53:11 -0700 (PDT)
Date: Wed, 19 Mar 2025 09:53:09 +0000
In-Reply-To: <20250318-vec-set-len-v2-3-293d55f82d18@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318-vec-set-len-v2-0-293d55f82d18@gmail.com> <20250318-vec-set-len-v2-3-293d55f82d18@gmail.com>
Message-ID: <Z9qUBe_8SM4c-9UI@google.com>
Subject: Re: [PATCH v2 3/4] rust: alloc: refactor `Vec::truncate` using `dec_len`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 18, 2025 at 04:13:55PM -0400, Tamir Duberstein wrote:
> Use `checked_sub` to satisfy the safety requirements of `dec_len` and
> replace nearly the whole body of `truncate` with a call to `dec_len`.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/alloc/kvec.rs | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 97cc5ab11e2a..6f4dc89ef7f8 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -489,25 +489,18 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
>      /// # Ok::<(), Error>(())
>      /// ```
>      pub fn truncate(&mut self, len: usize) {
> -        if len >= self.len() {
> -            return;
> +        match self.len().checked_sub(len) {
> +            None => {}
> +            Some(count) => {

This could be simplified as:
if let Some(count) = self.len().checked_sub(len) {
    // logic here
}

or
let Some(count) = self.len().checked_sub(len) else {
    return;
}
// logic here

> +                // SAFETY: `count` is `self.len() - len` so it is guaranteed to be less than or
> +                // equal to `self.len()`.
> +                let tail = unsafe { self.dec_len(count) };
> +
> +                // SAFETY: the contract of `dec_len` guarantees that the elements in `tail` are
> +                // valid elements whose ownership has been transferred to the caller.
> +                unsafe { ptr::drop_in_place(ptr) };

We have a mutable reference to these elements until after the
`drop_in_place` call, but the elements are invalidated by that call.
This means that we have a mutable reference to invalid values, which
violates the invariants for mutable references.

Consider converting to a raw pointer when creating `tail` instead to
avoid that:

let tail: *mut [T] = unsafe { self.dec_len(count) };
unsafe { ptr::drop_in_place(ptr) };

Alice
