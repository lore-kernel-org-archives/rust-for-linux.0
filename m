Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949C51DFDB9
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730204122; cv=none; b=as2FjbLXPyw507gj/moRK7m4o4iN/dUu8eEIUZDITkQfjPTJO8BJSdgvS5McaMvDvlKl9g2oU1qHXAZKz8DFQdW8VMQX2qrX9tZghk4fKVyFF6yIKAUclp+SajyoOhhkpOGkz9FqyaYPEFckG7A81K8IwVh/mUbd5FHfMm0AlAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730204122; c=relaxed/simple;
	bh=ETBIsYgBpj5qZxbEW8VOYzyYBmfyErwcO/VtdwGONUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGMfwehPVqgwEPyazCGTr3SCrWyNKGYRuNu5mtG9saj4lZLd9sCrb4i2DhihLMYuhWjX0Qa7UhTDiCPeCCbrWcYGs1Jn/UiptVn4EneeYX0+uEDgAIy4kgFnyp4E83JPgJoRzT6O0ANHe6onV4FnSQju+TgNIv1Zz6/Mvq8DtUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6XMD6lB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6XMD6lB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED154C4CECD;
	Tue, 29 Oct 2024 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730204122;
	bh=ETBIsYgBpj5qZxbEW8VOYzyYBmfyErwcO/VtdwGONUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J6XMD6lBIhT91lTuCTkkcynaqR/nAD0pbLxzpMW/LknhSIGTc5F5w36fzpI5RkDBX
	 SJZCqjuCgMNILTUGeKZZMt1KfDJGRKP9PLNgFR8BEja6ExTCXRxLokMg9hTr0+awV8
	 1nzN/4CKhDOFPso9d9BAV4i9hd90kQCWCA2Kpe+0suR8CQlW543NcYCUUMegtytpK+
	 jJLSSNhufPj0EzDgJ3UJAwnxBN5LwEkJo2qA8dCgMGmF1fKZOzPYj61pzTZvcrmF1H
	 nvdz6zmp+8aihVs61J/EE80rDDgT+0Tkr+XbrPlDhC3Z9jGFkSMZz+NDfzOnvpirnK
	 UpYIXNnRkC6Qw==
Message-ID: <43de6df7-4e73-4f40-99f3-585f971b4be6@kernel.org>
Date: Tue, 29 Oct 2024 13:15:17 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: Implement Display for Box
To: JCKeep <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/29/24 1:54 AM, JCKeep wrote:
> Currently `impl Display` is missing for `Box<T, A>`, as a result,
> things like using `Box<..>` directly as an operand in `pr_info!()`
> are impossible, which is less ergonomic compared to `Box` in Rust
> std.
> 
> Therefore add `impl Display` for `Box`.

Thanks for your patch.

> 
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1126
> Signed-off-by: Guangbo Cui <2407018371@qq.com>

Please make sure to run scripts/checkpatch.pl and scripts/get_maintainer.pl
before sending patches.

Please make sure that 'From:' matches your 'Signed-off-by:'.

- Danilo

> ---
> Changes in v2:
> - Add missing tag: Suggested-by.
> - Update the patch title and the changelogs.
> - Link to v1: https://lore.kernel.org/rust-for-linux/tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com
> 
>   rust/kernel/alloc/kbox.rs | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index d69c32496..5f4765800 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -427,6 +427,16 @@ fn deref_mut(&mut self) -> &mut T {
>       }
>   }
>   
> +impl<T, A> fmt::Display for Box<T, A>
> +where
> +    T: ?Sized + fmt::Display,
> +    A: Allocator,
> +{
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        fmt::Display::fmt(&**self, f)
> +    }
> +}
> +
>   impl<T, A> fmt::Debug for Box<T, A>
>   where
>       T: ?Sized + fmt::Debug,

