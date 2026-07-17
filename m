Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523203D47B4;
	Fri, 17 Jul 2026 11:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289121; cv=none; b=e5ZRnOQuLnSKVZISM6J7vdQnmbSBvmOiIRfQJhRHl3QI3QmbjijZ4Fyx9v027hsEbFT6AQMIXiYbYFFw9sKuwkmB33PY4+SGxC6R5RcmhMnS9yaryXR0HvxLlTpQSJq+qSLWyztC110ONlQX+A1dDGZpKu4B0Avd4YWXrM/JRW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289121; c=relaxed/simple;
	bh=GPmjnEJRbvKsFCa62R5EFw2iH8zW+LKtw9tmQNBQFHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IxwlV99fzfUSpH77r1mBUsNUmh5hGnOclAOnTdHSfQ3v8Qz2QZi9jAE7EGg/5gQj0cOapOU9A+ghvG4VMr8rnI9aEa70+V7Ep16tTxRlforTr5H73/ixtcTr/aZWn6QvmQq2K6AvdLjqAjxwJ4k5RZidt8LUrLvNlKpt82N501g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=KvlvPkSL; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="KvlvPkSL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1784289106; x=1784548306;
	bh=S1Mhl0ZutTeFPPBCFlmeWfbqAvAAj1b78TXKeQJ/bkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KvlvPkSLA6oq/C19IKf/WlGj+tp//nT1wYpqjQAotXb0k/jQHfgrDRKEUKaSs9fwG
	 t3aJBJGDxikUlKol8ZpCBomSyk5wisbg2WNgcqtyu76KBMjGdCfDN2bYWMug0vUzIw
	 YyBw0CwB5yRe4YnBKGwOEMxbN02Z0ssdt5HhLbw9YZhCcaBfErdgb8AiHUqyWDIhG9
	 RhWDGeaWH2T0zfB9J3GvBxV2MDtkQZLfl26GQ30cf3cGW3gdQwX0np8HysYb5KZbFs
	 d3iEgYSMdroCnA61dt2vCWuScE/wSGETrIalW9wz2B1sjLcNShhRS4uC/rrE3Zne7y
	 xoCeBhI+kC98w==
X-Pm-Submission-Id: 4h1pD01py5z1DDL5
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] rust: print: fix broken `_printk` Rustdoc link
Date: Fri, 17 Jul 2026 14:51:35 +0300
Message-ID: <20260717115142.62938-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260717-docs-printk-rustdoc-link-v1-1-892074948f75@younes.io>
References: <20260717-docs-printk-rustdoc-link-v1-1-892074948f75@younes.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Jul 2026 13:44:06 +0200=0D
Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org> wrote:=0D
=0D
> From: Younes Akhouayri <git@younes.io>=0D
> =0D
> The Rustdoc link for `_printk` points to `include/linux/_printk.h`,=0D
> which does not exist. Point it to `include/linux/printk.h`, where=0D
> `_printk` is declared.=0D
> =0D
> Fixes: 247b365dc8dc ("rust: add `kernel` crate")=0D
> Signed-off-by: Younes Akhouayri <git@younes.io>=0D
> ---=0D
>  rust/kernel/print.rs | 2 +-=0D
>  1 file changed, 1 insertion(+), 1 deletion(-)=0D
> =0D
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs=0D
> index 6fd84389a858..0d62beeedca5 100644=0D
> --- a/rust/kernel/print.rs=0D
> +++ b/rust/kernel/print.rs=0D
> @@ -99,7 +99,7 @@ pub mod format_strings {=0D
>  /// The format string must be one of the ones in [`format_strings`], and=
=0D
>  /// the module name must be null-terminated.=0D
>  ///=0D
> -/// [`_printk`]: srctree/include/linux/_printk.h=0D
> +/// [`_printk`]: srctree/include/linux/printk.h=0D
>  #[doc(hidden)]=0D
>  #[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]=0D
>  pub unsafe fn call_printk(=0D
> =0D
> ---=0D
> base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a=0D
> change-id: 20260717-docs-printk-rustdoc-link-a6645b2873ba=0D
> =0D
> Best regards,=0D
> --  =0D
> Younes Akhouayri <git@younes.io>=0D
> =0D
> =0D
=0D
Thanks!=0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
