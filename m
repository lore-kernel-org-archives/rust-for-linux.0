Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50DE3F1067;
	Fri, 28 Aug 2026 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916863; cv=none; b=dB5Hi6fIg/wOdXdY/7LxeNvUWZe9Y0ttqkWVTjkxWnkzabkvgyLRln+pGehOBCUUI35P5fNtRd7uIpqhCavvD3sXcscxKgK2ma6WfbeQ4cpra+Er5ppamTi4o7J8jWoZoaQwUbv1HkWEVYQyLJ7faU2Nq+or6kAzXRuzzKHP4dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916863; c=relaxed/simple;
	bh=aVAmrlglLE77rRk7z1dV/xgJ7zMGLtYyUqx4wOkAvv4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e95vb40d2Uufm3BLogg+31gEOr4M2qY9glT6iDyO2xlSREayiwLObY1yIBXBrFRpxpANPstNk7gtndfcgCEJvu/KbpTaY+7hFudKQ2XRfiXoJqqcdHu+Gv3jIFUiMN394Xr7toaXlM/gLfeW5FHwUwt676jJPY1tjLLhMccnOK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBtjaPyC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBtjaPyC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B471F000E9;
	Fri, 28 Aug 2026 11:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787916859;
	bh=aVAmrlglLE77rRk7z1dV/xgJ7zMGLtYyUqx4wOkAvv4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UBtjaPyC5KeW+gRQBhw5XwdfblRwrGYqGEff0ZFdw1mAb+xpFJKdWc5hTLPYMUnfo
	 8k0BsfLlIL0reJtam3yuDJK8wlEEyHjaK4vm+joZLkGYzPIdoSrBDOHz4haIiVlba6
	 n4nygRX+HUzxV6NWI865wpSnA5yC3B+ss38UZcYwAMRuObidA+R6LvY9eazer2bS5s
	 42020SsDPrSuuZ8o+SVYPfef0ewklnT+9G24YKTNPKsqs+45Gw8GUDwtx/NOTMO3pL
	 Fw+w2b7t/jEzvGDzrqtR42g0yzBgQl5Wh2c4+z7riprHig42aFQ7gFGhdkADfSfvnZ
	 ieY6fAMkK/Iuw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Tamir Duberstein <tamird@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry
 Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 07/11] rust: xarray: add entry API
In-Reply-To: <87mrua74c6.fsf@kernel.org>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-7-965f6028790e@kernel.org>
 <178067251358.96312.14084909265600226392.b4-review@b4>
 <87mrua74c6.fsf@kernel.org>
Date: Fri, 28 Aug 2026 13:33:56 +0200
Message-ID: <874ige1ntn.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Tamir Duberstein <tamird@kernel.org> writes:
>
>> On Thu, 04 Jun 2026 21:58:13 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>> Add an Entry API for XArray that provides ergonomic access to array
>>> slots that may be vacant or occupied. The API follows the pattern of
>>> Rust's standard library HashMap entry API, allowing efficient
>>> conditional insertion and modification of entries.
>>
>> There's a lot more API here than this lets on.
>> `find_next_entry{,_circular}`, `Entry::is_occupied`, `into_guard`,
>> `insert{,_entry}` (do we need both?), `index`, `OccupiedEntry::swap`,
>> `Deref{,Mut}`.
>
> I can amend the commit message to enumerate the added methods.

Looking over this again, I was pondering on removing `insert` in favor
of `insert_entry`, but I decided the duplication is OK. From the caller
perspective, code will be cleaner to read for simple insert operations
with the `insert` method. But complex query/replace operations can be
completed more efficient with the entry API by avoiding multiple tree
walks.

Similarly for `is_occupied`, code at call sites will be easier to read
when using this method.

Best regards,
Andreas Hindborg


