Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE5E1DEFD2
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Aug 2025 05:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754459816; cv=none; b=aCnxIVEITp8C5m1ukxLJcaf9Bp8lVz3HyJKzMVZIVzlxDyEDLRzAPDnvUUUHg9yK3nm9klYrTItiMPegsnOHs51STHd1W3I7fstJpK0fODzjuGuZNH+lePQcSQL4cxhfdpS6ccQoSBhk1ACpFYoo61BfhrvbM99uSVJrWQ8dgcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754459816; c=relaxed/simple;
	bh=Wq18DcZ4T3FgD3owtAsL5t1BZwFY/y8Ifdw12QC6K20=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A3f6zGOuykQVy7iiFzHoZTWRC9jDAJpqikAgD68QDh3WiNbmPveL7t4lb1vfHbu73q1DdOmIqUKvnfY8MvPw9o0Nahwhhiv77Va7V9/dfNlFf4pxghZq2cs2Jlfo8OB/tOJ9QI4x34ctgqMWKB4i1ZS9p4qK839CEcNVtkzDq2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aPo0UqtU; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aPo0UqtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1754459798; x=1754718998;
	bh=Wq18DcZ4T3FgD3owtAsL5t1BZwFY/y8Ifdw12QC6K20=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aPo0UqtU+UAffpKO9J534/omsqrcfG/jKPMQUKuaohh758LZ8T6dkKWnJgRSZ9WxC
	 UJlWh8jBugtfz5CJbzb4ZrtfsoOZDx+I1nJ0LLlg4n9QHjjpfzDRFeRxYHHtdd0N+S
	 vLpqU9NJTtAATLVfaH/Hz1xaURExuVwDuCsL8XUxmR+zm4e6lncEHRDuM2UYQwuUqK
	 mjDsjciFCk3nzB+j8FqkngCn0DFzmfjewJJTrgVUZrKkusnYh6pfcdyvN6JwNuDl7h
	 dzPo2r2FCWInctOn//teZJmjn5OSpQkLxkF917syhutx0Cg3Ie8o5Hkc/Fb+hUOorB
	 8PTG8BtLt2S/Q==
Date: Wed, 06 Aug 2025 05:56:34 +0000
To: Danilo Krummrich <kernel@dakr.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/4] New trait OwnableRefCounted for ARef<->Owned conversion.
Message-ID: <aJLujhnHgWhR-JyZ@mango>
In-Reply-To: <b7a7f917-9c22-4971-b9e0-6bc0d674b139@dakr.org>
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me> <b7a7f917-9c22-4971-b9e0-6bc0d674b139@dakr.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 54a919aea5b1782a89dec3c103aaac52fb96b272
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250805 1923, Danilo Krummrich wrote:
> On 6/18/25 2:27 PM, Oliver Mangold wrote:
> > This allows to convert between ARef<T> and Owned<T> by
> > implementing the new trait OwnedRefCounted.
>=20
> Thanks for working on this!
>=20
> Please make sure to use scripts/get_maintainer.pl in order to make sure t=
o send
> your series to all relevant maintainers and reviewers. I think you forgot=
 some
> of them.

Okay. Sorry, I will make sure for the next revision.

