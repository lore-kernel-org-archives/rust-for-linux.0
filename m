Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE90395DBF;
	Tue, 24 Feb 2026 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940749; cv=none; b=GUHoiXYrMGQ9KbKvcSQxRp4+oZCreytKUyWtQgrz9ChA3Vuz3Fo7v3RIj9L1X9jIefrp7uOmO4vz7/5YOxEhl1N0xQDB4dAFEZVfVrpbir0wTRimq0bxYPZmVfVSJCPc+w+IUGDO4QrENAk8EpeKRpRULgPztiQ94gmjxIR2J9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940749; c=relaxed/simple;
	bh=ftgYAotQSHbWTiHfbL9ahOild9zaBZJQ665pJX8FUag=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P+M7+5UNGnF+XkeIyZjtBRZyGXL4rgGRQRsbFfpS97XpXAqdFQm7nRkv+L15K1NxSHW0oVOUAK9p7IU5xJn7rdwCcZkN3xVDdA8agqs3PvWN/mSu8fZSYPukVlQJceAWETxIGlh+NG2pFlY2y8op4GLz5aPWbw2UcJ8DBYGUibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3PWQj5X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3PWQj5X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2B2C116D0;
	Tue, 24 Feb 2026 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771940749;
	bh=ftgYAotQSHbWTiHfbL9ahOild9zaBZJQ665pJX8FUag=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=E3PWQj5Xg0ZKXjljQSo9YxUra2ZFOKsb95geu8r6aMG2SCYcVsH5bcakASrtcOVnQ
	 5lY9rS6Vqd4awKWgBIejvLJn1u0Q0AU3M7YkfbS/Io2PGuh33Cv7ZtQFxoAxfOCqi2
	 k0XU81DOOcJ7SsuROqtJ5OipdFZyqUIHVozEwi5hn/cLBkHu1gmSVXFdytLaanaXVx
	 +fq+3ImTGCBCX1MpAN8Vizkg1ZK0J2E9SE7PKkWNIZ2tN4zJVB/CrRfQ9CnFfgwfiq
	 HCmyEd+q1O4ETUJX+btFWe4ZC0C0KFEzL15bGvyHle0IbiTCI0IId4n0pTJ2KrTFnG
	 2u9xwhRCvyceQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
 <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, David
 Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Harry Yoo <harry.yoo@oracle.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
In-Reply-To: <aYtW-Hg-ItQI7v9-@macos>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
 <aYtW-Hg-ItQI7v9-@macos>
Date: Tue, 24 Feb 2026 14:45:37 +0100
Message-ID: <87seaq1chq.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Gomez <da.gomez@kernel.org> writes:

> On 2026-02-09 15:38, Andreas Hindborg wrote:
>> Add a convenience method `contains_index` to check whether an element
>> exists at a given index in the XArray. This method provides a more
>> ergonomic API compared to calling `get` and checking for `Some`.
>> 
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/xarray.rs | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>> 
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index d9762c6bef19c..ede48b5e1dba3 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -218,6 +218,27 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<U>
>>          Some(f(ptr))
>>      }
>>  
>> +    /// Checks if the XArray contains an element at the specified index.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{alloc::{flags::GFP_KERNEL, kbox::KBox}, xarray::{AllocKind, XArray}};
>> +    /// let xa = KBox::pin_init(XArray::new(AllocKind::Alloc), GFP_KERNEL)?;
>
> Side comment: I'd also update the examples to the new coding style. And it'd
> probably be cleaner in the first commit.

I'll switch to the vertical import style.

>
>> +    ///
>> +    /// let mut guard = xa.lock();
>> +    /// assert_eq!(guard.contains_index(42), false);
>> +    ///
>> +    /// guard.store(42, KBox::new(0u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    ///
>> +    /// assert_eq!(guard.contains_index(42), true);
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn contains_index(&self, index: usize) -> bool {
>
> Nit. The method name may imply there's a contains_*() variant. I'd rename it to
> contains() so we are consistent with the rest of the API.

I disagree with this one. `contains` might cheat the reader as it is not
obvious whether we are querying for a key or value.

>
> Reviewed-by: Daniel Gomez <da.gomez@samsung.com>

Thanks!

Best regards,
Andreas Hindborg


