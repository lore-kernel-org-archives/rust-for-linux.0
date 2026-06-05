Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A012E4DA549;
	Fri,  5 Jun 2026 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661393; cv=none; b=eOJqAsbEqctqRlWK+pWgRiDd39/ZmQpZwccCUcKQS/t5eD0FCOcpu282wSf0mZORw9Rn1XK00RZNHdbHGgTMyT4B0D1nAJrRGzM0k3ut3vWopWEUkdwoKexF4yefwkMEWyQv+rXeMoM5dtTlRq0jk+9JBu6wKcsehdhzPxCN3b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661393; c=relaxed/simple;
	bh=QpuAV3zk19RGb+7z8r/sk0Ps9TJj1VkUh0NT/s2ysa8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PghbAS5Lhju/M95xg0arVSepRu1xuvwyPUYXFX2ZgqeiEW6gxbPzJxRkNo/Kqv1CVEy3NyOhFg8RvAxsnuO3nVDCWc0li9l/PdsocWybR+vgehPhhQJJeX5hAaGakqL6ue4YLLz76/WxsnmXLXy37t1kkv5I17vfJOXgkwY6dB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o23dQSOs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o23dQSOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195421F00899;
	Fri,  5 Jun 2026 12:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780661392;
	bh=WGoD3PN0zrGuFdoyMJ88S3Ug/i+eTLaAiwO2/pnnQuo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=o23dQSOsbyfV3QwslRhyLM1tia7gLwoLJRIVWq30hXx+yjosEptAiW7PFxm26UOCg
	 qTes9WWkwi9XHXKiDcSrkMgYgYpfypt11qpcWLkTRjUIrYw61GWMKAmBJcop8r4npg
	 bErbyzq0v++yh8KBbtEjzB+R0UWzpdo3FzMLpS05hgDlqd27GcMrbNiHTcq3XmB7fe
	 lP+SCw+/WnLM6QgwZna3lvFkMHgKuk7siqepZZ4GbQSPhnACIOSW831cfg54UHzoBc
	 XsnRuRm4V5QIT0W2ByTCyH3Wb82L0C8uELwo/xwiVsiQawYASC+YEsua1nLzUtmlLc
	 ijN84Sx7jbxUg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] rust: xarray: fix false positive lockdep warnings
From: Tamir Duberstein <tamird@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260605-xarray-lockdep-fix-v2-1-25a5509abee3@kernel.org>
References: <20260605-xarray-lockdep-fix-v2-1-25a5509abee3@kernel.org>
Date: Fri, 05 Jun 2026 08:09:46 -0400
Message-Id: <178066138616.3594.4372925551839686675.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652; i=tamird@kernel.org;
 h=from:subject:message-id; bh=QpuAV3zk19RGb+7z8r/sk0Ps9TJj1VkUh0NT/s2ysa8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFlKe3oT4zX3ayyTexofdeVYeGDJ5I4Lp1p1pn81zK86r
 CXSfdirYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFTves/I0CnP7xe5i7+5/4L1kmCF90+47fM+tUzcFDjX7Vr8ZA3juYwMB6e579X
 nq5v++HdQjA+zOmvsy1t162a72/Fd50p5s9mQCQA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Fri, 05 Jun 2026 11:14:29 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
> index 08979b304341..dce8b36492e6 100644
> --- a/rust/helpers/xarray.c
> +++ b/rust/helpers/xarray.c
> @@ -7,9 +7,21 @@ __rust_helper int rust_helper_xa_err(void *entry)
>  	return xa_err(entry);
>  }
>  
> -__rust_helper void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
> +/*
> + * `xa_init_flags()` expands `spin_lock_init()`, which generates one static
> + * `lock_class_key` per compilation unit. Going through a single Rust binding
> + * helper would make every Rust `XArray` instance share that one key, causing
> + * false-positive lock-ordering reports from lockdep. Re-register the
> + * spinlock's lockdep class with a key supplied by the caller so each Rust
> + * instantiation site can have its own.
> + */

This is an implementation comment rather than a useful comment for the
caller.

>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 46e5f43223fe..78c9fbe8f0aa 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -27,9 +42,10 @@
>  ///
>  /// ```rust
>  /// use kernel::alloc::KBox;
> -/// use kernel::xarray::{AllocKind, XArray};
> +/// use kernel::xarray::{new_xarray, AllocKind, XArray};
>  ///
> -/// let xa = KBox::pin_init(XArray::new(AllocKind::Alloc1), GFP_KERNEL)?;
> +/// let xa: Pin<KBox<XArray<KBox<u32>>>> =
> +///     KBox::pin_init(new_xarray!(AllocKind::Alloc1), GFP_KERNEL)?;

Was it necessary to add this type ascription on the LHS?

-- 
Tamir Duberstein <tamird@kernel.org>
