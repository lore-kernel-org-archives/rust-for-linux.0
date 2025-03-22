Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683C31F8AC8
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Mar 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742638577; cv=none; b=hYnKWpx6f09hRPk+OtDs773qDRbL/7XsSZeYlJFUfy8jliCeT5PHfYNozXVbsIw4NG/4Ornw63C2cgHxEVGooINvbEhGhl7Y51zqge4+rgO5P1b0qdL9z01wF2nYVK+FgwCB2tPj4Dg28Hvxp03TuUUEI1yshWjQMDMDV0UWH8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742638577; c=relaxed/simple;
	bh=BD8i4MlmnIcVcqfuILodMgdpM1y64lVQ0zfuhe3xs8M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=odzqTJPPCIjDaU4ZM1cHHMuz3WNei7Q96FoAioAlqmHyuq0MyvykO3v3QKDlGKBl3iDTzUv2IgYLGumH3qpaDN+kw5VRMNm37bFInnPlfnc53uY0uZw5Z88CTcbUicygIiexQwl3eRhZj5zo7uGE1a3RV5YYDtMH6zqtMlLC0PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PBJBfjN1; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PBJBfjN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742638566; x=1742897766;
	bh=q/x2RCqLV8wNjcRkvoZvtM3RODnKdXJg5XuR7JY+vG0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=PBJBfjN1QJm0Vd20y7bITmLyJuCx0POLk9PlsIqHvMGq6ov7ttj2DIqo28Qj/3yI/
	 Rzc5IpZ881rFXrWL4vMRfXyqq+bgcMQgPe2sj2ibO82/7DeTqPZBVY3wHcj0sXRVgP
	 5cQXzPz6XFCCB4UG3CN6fcsxZMtMgOKGyucwMyUNIAxNVgi0slyjSL8p5ICmeBaWdd
	 n1c7BemuC0NIDA8apUBIStz8VqoI79tDZeNqikgMSXEonGsNmi0SqhJ0UWHfZYgAbm
	 eYFvz27T/sxBVvvO+UU3isnuI2wK06BXZJqF+V+T55TuGy2A8+VwnJOPLjVqzTnwED
	 tP35utTSp1xOA==
Date: Sat, 22 Mar 2025 10:16:01 +0000
To: Antonio Hickey <contact@antoniohickey.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature
Message-ID: <D8MPT9V5JAEN.JZ5APEZ4TYPA@proton.me>
In-Reply-To: <20250320020740.1631171-2-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com> <20250320020740.1631171-2-contact@antoniohickey.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d785bd8839a1788a99cc156edab53128ba279761
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> Since Rust 1.82.0 the `raw_ref_op` feature is stable.
>
> By enabling this feature we can use `&raw const place` and
> `&raw mut place` instead of using `addr_of!(place)` and
> `addr_of_mut!(place)` macros.
>
> Allowing us to reduce macro complexity, and improve consistency
> with existing reference syntax as `&raw const`, `&raw mut` are
> similar to `&`, `&mut` making it fit more naturally with other
> existing code.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1148
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 993708d11874..a73aaa028e34 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  =09$(call if_changed_dep,cc_lst_c)
> =20
>  # Compile Rust sources (.rs)
> -# ----------------------------------------------------------------------=
-----
> +# ----------------------------------------------------------------------=
----------------

Not sure about this change.

---
Cheers,
Benno

> =20
> -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons
> +rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_=
reasons,raw_ref_op
> =20
>  # `--out-dir` is required to avoid temporaries being created by `rustc` =
in the
>  # current working directory, which may be not accessible in the out-of-t=
ree


