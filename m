Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D65C2E92BA;
	Thu, 28 May 2026 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780002682; cv=none; b=f8fmQpbtdGYpgzwo1X+sQDnNYB8y3bUGfAtdzDeC2fTQnl8ogo/x2xUQcRS4thlMJ/pCExG1FJsorrqyBiFdthl4Igbr1if1+gNQKqrKNmxfIXXBWeU04ZkVNxY9JUDGUYyGN2Q7+hsT8JWw7oxg2VKY1fRiUH8VnHTnj5WDHFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780002682; c=relaxed/simple;
	bh=dFUxEz8fo1Wqu5cSzeRlwRuQqZriwrp86qio2t1JkTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkIfd4efmdgRee3kj0sejSqSEzbXhCxzqYKxmsdd8tZXRAj7PPNzao9e0+PWR+B1uzAD0bAASvdpkTDAOT6CSkT7LZRTrR0AWNEwEeNOzTNsKx2kgetIPynLM9XYc+AOakKvjZw5LliM7ESs2ThQhuRH0lr9i2FtbLGjBM+hO/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CK5RhUd5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CK5RhUd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4C11F000E9;
	Thu, 28 May 2026 21:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780002681;
	bh=m+BRUa+7bYuwzjJKY9DZEzpA4r3njeKKG9gYLelkcwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CK5RhUd5GknHdA2xY+sQVIAhYNQ09BflHcJq+O546MRJtq8kH8oFZWMZfanhv7kPS
	 4p/9nUGfJlz07+PLgH5UJ8evY3BBmuZMnJVWrYnrpXp9IN5+OvoX9r4geNIeracnat
	 5h62ZAbD9cyRYxsGE+7F1yxPId7DcjrgPlp4NT50T7KZmiAPDpVaIc8idlHoW15Rhr
	 7YnzjVUO1xiMFuNZlHnvIT+4ubqsGzQrSFR2NzJhktkU+i5pX/xpbtMi1ER8PSMP2k
	 Qa6QyONPOSIU9VOweY079x0ZFEgVSR9yTApXOTNKKtBhx/7uwvUc+JpiEsbErXdw1E
	 +10tmi4+Td5xw==
Message-ID: <bea844c7-c034-4f62-af8a-89bb11d099ac@kernel.org>
Date: Thu, 28 May 2026 23:11:17 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] .gitignore: ignore rustc long type txt files
To: Manos Pitsidianakis <manos@pitsidianak.is>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/26 12:21 PM, Manos Pitsidianakis wrote:
> When rustc prints an error containing a long type that doesn't fit in a
> line, it will write the whole thing in a .txt file and print messages
> like:
> 
>   note: the full type name has been written to
>   'path/to/subsystem/module_name.long-type-11621316855315349594.txt
> 
> Long types like core::result::Result<core::pin::Pin<Box<_, Kmalloc,
> kernel::error::Error>: pin_init::PinInit<Box<_, Kmalloc>, _> are common
> during development, so add a gitignore entry.
> 
> Signed-off-by: Manos Pitsidianakis <manos@pitsidianak.is>

Yes, please. :)

Acked-by: Danilo Krummrich <dakr@kernel.org>
