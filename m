Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296D2331A5C;
	Tue, 10 Feb 2026 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757924; cv=none; b=L+5s8m8xu5Vvr0FkuN/H3fZ91/jD4ML0S4/JV8AfiizlTTcxFoEHESu+QUHGXRPKoE9ztOUJsD6fCmXcnKD3WSRAOcobe07AucXP4EfFeOJwUcvYwdxCEiL7syromwIkAfk9yyGZVz/wz9vi8xzCEW9CAiGzAbJMZy5iSTT54IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757924; c=relaxed/simple;
	bh=7zk7bofSmyragoKzz6B1piVZiTdvpMcKVBRV2xUKc6E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=C7KMkp+XrHWkUbWm8q40CFLTBMuHMRxtNkEU4VaWek6bMddmSOcrF3aRPI80TP0VU5JjERjDENQACvFEPYQezqt+w9w4Xflbu5/C7wZUELXNAokP0aw38mMbdvf8HfBE2+XDXJ5yEJbJ+RvjwxzCCq1fS3PspTq+4xJRcQiBLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKHXY06B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKHXY06B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A89C116C6;
	Tue, 10 Feb 2026 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770757923;
	bh=7zk7bofSmyragoKzz6B1piVZiTdvpMcKVBRV2xUKc6E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=mKHXY06B6M7GKSuZPNPrS/vZ8MHrZZMEpXHySoql1KKY2w1uVq/dU0H12wLLiFN/3
	 6yHrpXSglToQErLct/LvdzaUXD69E++vKRy9r0uVaVV3Eg1XNqsh24+dNAGBzGwmWS
	 +eTBKpNtw37thoptNVrUFJjzfnZ4EzVg3TjwMxxGzf+LESVG3go6K0TY8gsRv02lIL
	 l20pjjLSPvEQe0/m3NvS70AanaEUqCDEIoxc9mB8I38IEP9Txcml6aV7irxfDNQL5m
	 DtAUbKq9ReWSgv4jpmtIlBYx3i9Ay+yFz3GBUBqE/SqEdCLAh+8yAxaGljdLcxn4kX
	 wmNodreFa63xg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 22:11:57 +0100
Message-Id: <DGBLALCUGY7N.383JKRKNCRDW5@kernel.org>
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
Cc: "Shivam Kalra" <shivamkalra98@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <brauner@kernel.org>, "Carlos
 Llamas" <cmllamas@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
 <aYs5L1aG5S34teKT@google.com> <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
 <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>
 <DGBKOL8Y6OH8.1X5RHNGCQAMC4@kernel.org>
 <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>
 <CAH5fLgg9sDW+MCK15yVyZ59BzXind+1vRj+PQ2xHQ8Bg7sxLRA@mail.gmail.com>
In-Reply-To: <CAH5fLgg9sDW+MCK15yVyZ59BzXind+1vRj+PQ2xHQ8Bg7sxLRA@mail.gmail.com>

On Tue Feb 10, 2026 at 9:58 PM CET, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 9:54=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> On Tue Feb 10, 2026 at 9:43 PM CET, Danilo Krummrich wrote:
>> > On Tue Feb 10, 2026 at 9:05 PM CET, Alice Ryhl wrote:
>> >> On Tue, Feb 10, 2026 at 4:05=E2=80=AFPM Danilo Krummrich <dakr@kernel=
.org> wrote:
>> >>>
>> >>> On Tue Feb 10, 2026 at 2:57 PM CET, Alice Ryhl wrote:
>> >>> > On Tue, Feb 10, 2026 at 07:08:09PM +0530, Shivam Kalra wrote:
>> >>> >> This is a follow-up to my v3 series:
>> >>> >> https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec=
-v3-v3-0-8ff388563427@cock.li/
>> >>> >>
>> >>> >> Hi all,
>> >>> >>
>> >>> >> Thanks for the feedback on v3. Before I respin, I want to confirm
>> >>> >> the direction for v4 to avoid unnecessary iterations.
>> >>> >>
>> >>> >> Proposed changes for v4:
>> >>> >>
>> >>> >> 1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
>> >>> >>    method on Vec<T, A> that calls A::realloc(). (Danilo)
>> >>> >>
>> >>> >> 2. Add a temporary ShrinkQuirk trait to handle the vmalloc workar=
ound
>> >>> >>    (page-boundary check + manual alloc+copy+free) until vrealloc
>> >>> >>    gains in-place shrinking support. (Danilo)
>> >>> >
>> >>> > I don't think you want any new traits at all. What types would eve=
n
>> >>> > implement the trait? The special code can go in the realloc() meth=
od of
>> >>> > Vmalloc struct in rust/kernel/alloc/allocator.rs.
>> >>>
>> >>> I did not propose to move this into the realloc() functions of the c=
orresponding
>> >>> allocators intentionally, as there is a difference between calling r=
ealloc() and
>> >>> shrink_to().
>> >>>
>> >>> I don't want that some user of e.g. Vmalloc::realloc() experiences p=
age wise
>> >>> shrinking by copy. This is acceptable for Vec::shrink_to(), but not =
for
>> >>> realloc() in general.
>> >>
>> >> Ok. In that case we can add a method on KVVec directly for this
>> >> purpose, but I still don't think we need a trait?
>> >
>> > KVVec::realloc() should not have this behavior either, we only want it=
 for
>>
>> s/KVVec::realloc()/KVec::shrink_to()/
>>
>> > VVec::shrink_to() and KVVec::shrink_to(), so I think we need a tempora=
ry quirk
>> > trait.
>>
>> Unless you mean to implement shrink_to() for VVec and KVVec only, that w=
ould be
>> fine with me as well.
>
> Yes that's what I meant. Only provide shrink_to() for those. After
> all, if Kmalloc never actually shrinks when you call realloc, what's
> the point of having KVec::shrink_to()?

Nothing, but eventually we want a generic impl of shrink_to() with A::reall=
oc().
But again, for now that's fine.
