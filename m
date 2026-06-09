Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCDE3E6DC6;
	Tue,  9 Jun 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994308; cv=none; b=ZFS94XUjyXQvW1ycN8HGdi895BTFrN5N4E8SUaUNddZ1w/dCb5QzV7FWvi0/AtM+uQU1q+adl2z+ppwj411/C3YN9d0YdKPtSnP2pkhst8IqY1//1QBfsC1sAOzdArG6TOsq7TP080PQlpzT4WF5/34vwOjqOFAcfWHXYj6yQqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994308; c=relaxed/simple;
	bh=kfeuNAd38pEOxytcEUWs8WERGsma3i3a39kghJU4HKA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H3NLUu9NM4fvbdCa0Z3dw/rhKiXFKg+OkCfggn3svPxjHXMxDW6bArt1wllpYWlVm12cj5dxtci0PCxhj5rYvuL8rzE26pAOgRQomSjNnn87peBUzo9GT2hp/Ei+3Vg6UKhbW0raNzP8wM3Qsjr/EYfBlbEJhKEuFBahfELOft4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRvIog5J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRvIog5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76021F00893;
	Tue,  9 Jun 2026 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994307;
	bh=p720QhTHRxdWFoEDw5qbgqIlfAPKWWTlU+46eiRjaog=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dRvIog5JWI7j+wllPCBO45sSXiK3MhL5NbtyhUKuBQyAgZYJATK67JNBiehFRSyse
	 8AMwKMob3qMthWQJSv0f+BCAmUghC8vhj/tIzUZWlq6kydkVn7N5yRXP+rko9VGTOP
	 o2BGEl/jz3ydzr0heFATEa58zyJR6PJFlcGsjp0nS1oRJxwDuwgvdNqojWfbJYdAGP
	 fERPcKOHKdDYZLXvVQsY/m+SekXIHEOB4pb0GnW+4tacs56xaStQgLmXK+1yApfK4+
	 PdvYtwW0J46ub0V+HpyGRBWAOub7p57VCPTJj1sLiT3aTZPEb8jb6g6fhFeRa7lVIc
	 KtMUnPzRUck4A==
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
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Daniel Gomez
 <da.gomez@samsung.com>
Subject: Re: [PATCH v4 02/11] rust: xarray: add debug format for `StoreError`
In-Reply-To: <178067251341.96312.1551479010624701516.b4-review@b4>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-2-965f6028790e@kernel.org>
 <178067251341.96312.1551479010624701516.b4-review@b4>
Date: Tue, 09 Jun 2026 10:06:21 +0200
Message-ID: <87o6hkgmte.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tamir Duberstein <tamird@kernel.org> writes:

> On Thu, 04 Jun 2026 21:58:08 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index b80fb7a262d0..d54942aeb201 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -193,6 +193,14 @@ pub struct StoreError<T> {
>>      pub value: T,
>>  }
>>  
>> +impl<T> kernel::fmt::Debug for StoreError<T> {
>> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
>> +        f.debug_struct("StoreError")
>> +            .field("error", &self.error)
>> +            .finish()
>> +    }
>> +}
>> +
>
> Maybe an import of `kernel::fmt` at the top would be cleaner.

Ok, I can do that.

Best regards,
Andreas Hindborg

