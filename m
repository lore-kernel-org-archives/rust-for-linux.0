Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1603FE354;
	Tue, 24 Mar 2026 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360652; cv=none; b=cgOG+/9epopTnedztFfH5ZvBbYXTIUuAIQFMJjw3bWjeY0JbpY8IH1z7o9ndnmcNDVlkD8VX2j5gG3//Pg++J+oy/+di6RMB/SWQ1Yd0Kgm0BpR8zw68fQq+huMdxwF6g4EucrFP9jHbeWuf1tNxxtlbY6SlRGF9lp7AF+QHUeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360652; c=relaxed/simple;
	bh=qlZspMs1+DG3KiCtSlpHNb6i3dnEG0uBu6CU3lLXr2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxUN0JP7mgyChT4X9rxYTRpUMLkuxYdJc42rWE2GOu5UYnK/rJzxotSFKAcvQg5h5sTtBiRomnKl48DGX+n0f7r2T8hHnNLcOIFi9djsSzPpQC1IFZCJXlY87lLIZqJiBXsm413uZUVJNlNeK+AARc9ZyQSgfD7DjxskunVmH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0nhHKUW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0nhHKUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808DAC19424;
	Tue, 24 Mar 2026 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360651;
	bh=qlZspMs1+DG3KiCtSlpHNb6i3dnEG0uBu6CU3lLXr2I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P0nhHKUWc4gO7fQHlDxnDF1Gcg2dz4Ejx/SRFR248vUO9m4JKU05sEe/l0pBDCX1u
	 hvyzKfrBYoKZ0SUXoo043IbDlnm8KABCX75IVY/cBZaGpr4tF4W/B5W93eidUZva8b
	 73Y7WlQfYsv/KOSWf3zDBk4vijn5crn4x20vWrzWf9Zom1GvWw/hQ/AFwfIwPQ+4zx
	 GmxfBT2Ik204LzzIWYNvPiVrjICX5xC/sGWlN0MXXVWWBs/sVaTpJhLRAK0O/S8Y/P
	 VDrODp1U7q5xQW9elVWeg+Bw7Ru0QbFM9Rc71a1GF/CqSRRpYHDt7yYmDd95HJvxIA
	 9Jx/J89OUtpew==
Message-ID: <746c9c50-20c4-4dc9-a539-bf1310ff9414@kernel.org>
Date: Tue, 24 Mar 2026 14:57:24 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20251023171607.1171534-1-yury.norov@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251023171607.1171534-1-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 23/10/2025 à 19:16, Yury Norov (NVIDIA) a écrit :
> Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user with
> CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
> is enabled. This pollutes exported symbols namespace, and spreads RUST
> ifdefery in core files.
> 
> It's better to declare a corresponding helper under the rust/helpers,
> similarly to how non-underscored copy_{from,to}_user() is handled.
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>   lib/usercopy.c         |  4 ++--
>   rust/helpers/uaccess.c | 12 ++++++++++++
>   2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/usercopy.c b/lib/usercopy.c
> index 7b17b83c8042..b00a3a957de6 100644
> --- a/lib/usercopy.c
> +++ b/lib/usercopy.c
> @@ -12,7 +12,7 @@
>   
>   /* out-of-line parts */
>   
> -#if !defined(INLINE_COPY_FROM_USER) || defined(CONFIG_RUST)
> +#if !defined(INLINE_COPY_FROM_USER)
>   unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n)
>   {
>   	return _inline_copy_from_user(to, from, n);
> @@ -20,7 +20,7 @@ unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n
>   EXPORT_SYMBOL(_copy_from_user);
>   #endif
>   
> -#if !defined(INLINE_COPY_TO_USER) || defined(CONFIG_RUST)
> +#if !defined(INLINE_COPY_TO_USER)
>   unsigned long _copy_to_user(void __user *to, const void *from, unsigned long n)
>   {
>   	return _inline_copy_to_user(to, from, n);
> diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
> index f49076f813cd..4629b2d15529 100644
> --- a/rust/helpers/uaccess.c
> +++ b/rust/helpers/uaccess.c
> @@ -13,3 +13,15 @@ unsigned long rust_helper_copy_to_user(void __user *to, const void *from,
>   {
>   	return copy_to_user(to, from, n);
>   }
> +
> +#ifdef INLINE_COPY_FROM_USER
> +unsigned long rust_helper__copy_from_user(void *to, const void __user *from, unsigned long n)
> +{
> +	return _inline_copy_from_user(to, from, n);
> +}
> +

Shouldn't the below part be guarded by INLINE_COPY_TO_USER ?


> +unsigned long rust_helper__copy_to_user(void __user *to, const void *from, unsigned long n)
> +{
> +	return _inline_copy_to_user(to, from, n);
> +}
> +#endif

