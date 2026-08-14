Received: from mta0.migadu.com (out-131.mta0.migadu.com [91.218.175.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA341A6838
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 00:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786666865; cv=none; b=J2eEwPI28bRzFydGgswYOYdv/WP4k/Rwj+WZopqfhIH3fxphvBv3hZKiwxp5XyTOgrg1EVD5X5o0OBhgJVMyNO1jPb4ZA2Ah4GdMorhVTR3S4B5TDM+he/4Gtt+KsIeOJ8/CRKSwcEQ/zq4jXtMbrN6t42vWiham+jus2id+D+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786666865; c=relaxed/simple;
	bh=nJ7OubLFY74JWz9b/FzrjGaEYnYtjlBAvUbpzRy6CDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPp2V6s3Ayeo9M8nFcVeeO6HMnTbPhoX6ZIkciIzSauNF6TLS58WxTLGxoynbguHY/i9GVit32wVyPYqZA40QZQ8bdDl97hRfy7sL159NFD+qowNc8btwIHSmN2/DO8UQ0KQaYq2PtTJfUdOGv8SO3dpxz922wgEoAekFxDq8Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I5mdBOZo; arc=none smtp.client-ip=91.218.175.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I5mdBOZo"
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nJ7OubLFY74JWz9b/FzrjGaEYnYtjlBAvUbpzRy6CDs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786666859; v=1; x=1787271659;
 b=I5mdBOZoAx27msaHgxQX/5yPo3JpzHcbzjXmN0QxG6fRCV2UXXeVrclHJCtKaFEk1lpRlu81
 z3rrrX4V9vbKpYMwMIGCGR+SQzgpXc4fzsGR0YfCQXKc0/9WPuv0eB/DMZGa65SekzkP/bXQwA9
 VBuEDq+sMh70kmyjmDmKxthA=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: from [10.0.11.3] (2a11:3:200::10a9)
	by smtp.migadu.com with ESMTPS id 5c944f90e8f084a3;
	Fri, 14 Aug 2026 00:20:58 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <54ae4fe4-963d-4ae9-ac75-15b5448621eb@linux.dev>
Date: Fri, 14 Aug 2026 08:20:46 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] rust_binder: use `LocalModule` for `THIS_MODULE`
To: Gary Guo <gary@garyguo.net>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260813163951.1102583-1-gary@kernel.org>
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260813163951.1102583-1-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/14/26 00:39, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Replace the `THIS_MODULE` static reference in the binder netlink code with
> `this_module::<LocalModule>()`, consistent with the move of `THIS_MODULE`
> into the `ModuleMetadata` trait.
>
> Cc: Alvin Sun <alvin.sun@linux.dev>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alvin Sun <alvin.sun@linux.dev>

> ---
> This is to resolve the semantic conflict between rust-next and
> char-misc-next.
> ---
>   drivers/android/binder/netlink.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/android/binder/netlink.rs b/drivers/android/binder/netlink.rs
> index beb7ea2edaff..f34e1009432c 100644
> --- a/drivers/android/binder/netlink.rs
> +++ b/drivers/android/binder/netlink.rs
> @@ -13,7 +13,7 @@
>   };
>   
>   pub static BINDER_NL_FAMILY: Family = Family::const_new(
> -    &crate::THIS_MODULE,
> +    kernel::module::this_module::<crate::LocalModule>(),
>       kernel::uapi::BINDER_FAMILY_NAME,
>       kernel::uapi::BINDER_FAMILY_VERSION,
>       &BINDER_NL_FAMILY_MCGRPS,
>
> base-commit: 2697ef8943c9985c14708a6429e21812693857b2
