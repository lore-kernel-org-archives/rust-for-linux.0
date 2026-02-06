Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B9212542;
	Fri,  6 Feb 2026 14:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387783; cv=none; b=Losoa7xlOQopQzLZxb9orKHGzPtdSfOis5I+WOm0Re3TRdwnY2Cln2KEHspAo6GWpy56qjUfG6CP2V3AFF3tNx+WfhG/yt/y7lj+nzlVt34wWVZQ/g5HOsVENjJKqICGLoQTsi2TyWuWZ63fUYt4gY0O3SIeOBDFTNjiYBmD1Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387783; c=relaxed/simple;
	bh=bnahifZNk51FppvxbQ2koJj/3DHUYqBV87Z29vXkmbw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gJRG5Bnlm3vf7alZFgnA/wibcXB5E4PAzxYy1/QUv5Ge+VabMbMXVjcSIasntKcFvauJ279NLPbBm2NhdHtE0tzyWpeq0VSt6F5DuH7J49NFb3/3Pe23sbcndGnobvurSeWC9wd9RMBUdPdiHZ0ByuKDWRGVrsbghyzn3p0aRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6YQ+1tj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6YQ+1tj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB573C116C6;
	Fri,  6 Feb 2026 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387782;
	bh=bnahifZNk51FppvxbQ2koJj/3DHUYqBV87Z29vXkmbw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N6YQ+1tjcqdE+wb1e9H3UVuleBIVsgAm85YjCnZFEa3Sd0JEV04RrkGVsVUHaS1v9
	 gvo+7oTAjzwK6t80YQtmU6cuk19vH26gqPN7WGntoAXzKXggadimhHW2fgTsqmZHJj
	 ZaqOEcW1v+jN4C0h2q6WXU5pbSR+YFRgAEXPdH69mq2aCwiggogqZC0q/EkDZGo/cs
	 5AmzalO6gQT+tY6h4J3qgH4M75rJIuVVYz/5O8TOZBU9g7wTGcLoeZ7kKATq94IgjR
	 yyiuTP56VD0MgEaj9bm3o7Pt5/0Ko9M8xwWuIwP5q39KkZx0luLepYpWvgyowjr/GU
	 gs3QHMJSJQy3A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] rust: xarray: fix false positive lockdep warnings
In-Reply-To: <aXHr5kxJgogHHW1o@google.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
 <aXHr5kxJgogHHW1o@google.com>
Date: Fri, 06 Feb 2026 15:21:20 +0100
Message-ID: <87cy2iosv3.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alice Ryhl <aliceryhl@google.com> writes:

> On Wed, Dec 03, 2025 at 11:26:40PM +0100, Andreas Hindborg wrote:
>> Replace the `xa_init_flags` helper with direct initialization of XArray
>> structures using `__spin_lock_init`. This allows each XArray to have
>> its own lock class key for lockdep, preventing false positive warnings
>> about lock ordering violations.
>> 
>> Add a `new_xarray!` macro that automatically generates a unique lock
>> class key for each XArray instantiation site. The macro accepts an
>> optional name parameter and uses the `optional_name!` and
>> `static_lock_class!` macros to generate appropriate names and lock
>> classes.
>> 
>> Update the `XArray::new` method signature to accept explicit name and
>> lock class key parameters. This enables proper lockdep tracking while
>> maintaining flexibility for advanced use cases.
>> 
>> Remove `rust_helper_xa_init_flags` as it is now dead code.
>> 
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> IMO this should have a Fixes: tag and probably land separately from the
> rest of this series.

Ok.

>
> There is a similar situation with workqueue, which was solved by using a
> custom helper. See rust/helpers/workqueue.c for details.

I don't think coding a custom helper in C is better than open codng the
initalization in rust?


Best regards,
Andreas Hindborg


