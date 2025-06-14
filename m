Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727974A0C
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Jun 2025 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749920411; cv=none; b=oWWYgBcoYC1Sry93rD5duvXvuKfhKeTV+jmYJiID0dFmVlkPiH+U6elKft/pr2I/5uS5qmPT5uewDFOZhYUC3wk4YjkkyQvxMCMKPw92YmKN+GVblnHX1iQdYJeWk1sZNfWuIueShmY7uCv2hQlaxfdY6Mzw1w7mK72xeT6S7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749920411; c=relaxed/simple;
	bh=OoWy69Boj6cdroz5WMXyhjOECqxhHKN5pp7eazSZkEQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kX6+aRhRRHeomIgaLJVkINus6uMuzQ2UDtMye5wN10VzHpO9fvsf/VKvZ7YtnXkSxnZe25Kl7EvFAonz+KCTpPYGNReDadu1e5GtGhIwm2DspOmo9oss5SlruKa5wurhJ/0nCVh/f7fMWFF/MQfFJ14mu1/w6eDpXnjKqfep58g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgE/2AW9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgE/2AW9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F268C4CEEB;
	Sat, 14 Jun 2025 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749920410;
	bh=OoWy69Boj6cdroz5WMXyhjOECqxhHKN5pp7eazSZkEQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=PgE/2AW9FaZ36aoeeKqMK21jipUgi4FAFOGedh886C1ncAhMKhpQqpo4Iz/jswYhy
	 08u4qUkvVqRmxgM+sLbwt32sUY5EUI2w9q6vLACT4DBf9Z6BWmVpIsKbnNT5dh6h8t
	 kMQj8dKU9pFS9BPDGqhzUh0/pEOpX/3swr1idL3m++MaGpTpWqsEU+2NIPfFQHh4ZK
	 42TTMT1pxjynIU5SM4NvrFW1q8uT2rluV6zIH27qmGSFhCabcIebOt32eqTHoPlFWi
	 jJRbWCi9tgp76/S1VzPpBgixW4RLZnk5SRaLszX1/EwJCubsL/IfLcS0WwWIttlN5J
	 /94+aVhXcR98g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 19:00:07 +0200
Message-Id: <DAMF0H159M8X.2NWDQM5KQH4N0@kernel.org>
Cc: "Marcelo Moreira" <marcelomoreira1905@gmail.com>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-3-marcelomoreira1905@gmail.com>
 <aEqdur4JTFa1V20U@google.com> <aEwxgUjYiNaJuzc_@pollux>
In-Reply-To: <aEwxgUjYiNaJuzc_@pollux>

On Fri Jun 13, 2025 at 4:11 PM CEST, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 09:28:26AM +0000, Alice Ryhl wrote:
>> I don't think this change is valid. Consider this code:
>>=20
>> fn takes_guard(arg: RevocableGuard<'_, i32>) {
>>     drop(arg);
>>     // rcu guard is dropped, so `arg.data` may become dangling now
>> }
>>=20
>> This violates the requirement that references that appear in function
>> arguments are valid for the entire function call, see:
>> https://perso.crans.org/vanille/treebor/protectors.html
>>=20
>> Or the LLVM perspective: When Rust sees a reference in a function
>> argument, it adds the LLVM attribute dereferencable to it, which implies
>> that the pointer must be valid for *the entire function call*. If the
>> memory becomes dangling after the rcu guard is dropped, then this is
>> violated and the compiler could perform optimizations that are not
>> correct.
>
> Interesting, I wasn't aware of that. I wonder, why can't the compiler cat=
ch this
> and throw an error?

Because the compiler doesn't know that the reference's validity is tied
to the rcu guard existing.

---
Cheers,
Benno
