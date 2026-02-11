Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FAA2BD587;
	Wed, 11 Feb 2026 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770795684; cv=none; b=XNEgM+YvMtX6p9D+M0agN9gXq6q+PEdjBC/R77o1OVhtpoqoqNqQpE5EeSxbXS/x3ek5mniN9lb2EFZBsEdy6H3sWH+UlaxNX0b76f4S8yTDS04qv+mGu6S51x4pgOeupaHFkceQbPAfIve+lE179iztJTTZ8fAjaxumdw5u0B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770795684; c=relaxed/simple;
	bh=6AY7gjXvSQQSCITnjIyWYDj0BZ2Owzifq01hOOgMo4M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AnVGPKt1+mYyvDcG+z7AjPgUflsqOgKpO7tvZfMzbTcEiniMOdSbYO9dgbeVuQtPgzmAhmoVzbiR4bpQVnIgorix8Jn0GPFkH9CCpFTyfkipGTw6vzptbdFGiIDrWvesZ8TaC6IO3d5P7/i4CdtUm17GbWyu/mUe4Sm3fgC9ZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RriaZAzx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RriaZAzx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4343DC4CEF7;
	Wed, 11 Feb 2026 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770795683;
	bh=6AY7gjXvSQQSCITnjIyWYDj0BZ2Owzifq01hOOgMo4M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RriaZAzxE9qwBIfNXdcaeV/8IOoG1YBuN0+DyKycmOKjAWzD0nBnKiUTdtBpEbsXE
	 44SzrIyW4+a3MglOx+md0jlBa7HzbYgitehcWkCU9Tdj7JWolTayOjAdlrmPlb30V4
	 NdkUkxCgKQQc6O6vwkaKomjtR3vTp5WDE19jCpso/MiQtMtcvNI/oOVX1NDqaO3OK+
	 UjsfoNAJ3lIROZJlf8Dd9sJtQK1R7Cv+KnxqWnQGHKPTnYZpvdUUxMVTUDlxwnZX5i
	 AHrZ70+Y5dg/hmQ4YucjMc7RJd+5QOv9PKzakwmpG+9umYjqW6rHFlfmjgLwrwEvme
	 pg1Kxb2y1RG1A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman
 Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
In-Reply-To: <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
 <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
Date: Wed, 11 Feb 2026 08:41:14 +0100
Message-ID: <87fr77viat.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Liam R. Howlett" <Liam.Howlett@oracle.com> writes:

> * Andreas Hindborg <a.hindborg@kernel.org> [260209 14:38]:
>> Add a convenience method `contains_index` to check whether an element
>> exists at a given index in the XArray. This method provides a more
>> ergonomic API compared to calling `get` and checking for `Some`.
>
> I think this is going to result in less efficient code for most uses.
>
> Most users use the results returned, not just checking if there is or is
> not a value.  So if you find the value an xarray state and then just
> throw it away and find it again, it'll be less efficient.
>
> If there are users that do use the xarray to just check if something
> exists or not (which there probably are?), then it should be in a
> wrapper for that code and not the generic API.  Otherwise we will have
> users pop up to use this method when they should not.

I agree in that I would prefer matching on the result of a lookup and
using that result. This is not always possible due to a limitation in
the current implementation of the borrow checker. Please see my response
to Tamir [1], it has all the pointers.

Since we cannot use a match statement in certain situations, we have to
fall back to something that does not borrow from the collections, like
`array.get(index).is_some()`. I would argue that

  if array.contains_index(foo) { ... }

is easier to read than

  if array.get(foo).is_some() { ... }

And I don't think `array.contains()` is going to have worse codegen than
`array.get(index).is_some()`.

Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/rust-for-linux/20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org/T/#m95fb90870c511491f4f487dbf852c689cd0733f4

