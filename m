Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F03481253;
	Wed,  5 Aug 2026 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947439; cv=none; b=uBqh2EUdC2j1FitP7gdzYGyRwvigrj3otP5DxsmXxnwrel5JkDzJL/fr/uA+J+x4rmlKtm6f/uw0TOmplyhlfrnB3oDRbZBOUKz4GOVbAbWa12eY8sKYefM/lu7gYaEsNM8SvAiFnWSg+m4pjNnQ2FysdYRLLs+j6FZKpHXg++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947439; c=relaxed/simple;
	bh=hawZOqYQcv9m3OslFhrPCJaJCzg6otZEnp4kXi4yXHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NzWMOjMaQaI5U4LP6Kvn0Kc1u1Xl3lZ+y4r6hH8FhDM4E3X79Cqp25CpIFw59rJRyOg7o8D1ESzh375lhhSeW7HMSOcWq96tbdmnK9USQ1ZPPTsHbPWDV2Zeb72ZiUn3s1oun328WPKiWxWCiyO0eFGH6cxMoxJ1Eil8obOij0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6iGhRtD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6iGhRtD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867601F000E9;
	Wed,  5 Aug 2026 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785947436;
	bh=195Q5Rw0V9yGzCQGu5z8lCPNlK0e3+PNCZkGCRzAJFc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E6iGhRtDdd+PKVqriyp0gicTdtclwk6H9WeEp9bcemtB6S2SV7kzwMmRoM/nqqitB
	 1UsqErZYpxH/B9Ntgat1MlQdte625/leUsnW1a2hVYo8McPkxYBTHgLJiJ+WI6B+pH
	 pVeM4uPvrct61BvY0BTcBHEiXLPxRdLB7t/APpOkmAKAf6jUOnYIfQPl3uJqigotiC
	 AGORDml4qY5NqlKZqDfL1T1tpJNKVu8TVZYrJv2RAEds2LA7lPvN54r587+nS4iArz
	 0j56eGAce5vp/BEVxsW5ND3yd6FVKqTgqY4NseS0HgPlUwvcI3mdOmPqC+ycWBguC7
	 Xntk5616KuHCw==
Message-ID: <da8d6149-2135-44a5-859d-c1668113b7a4@kernel.org>
Date: Wed, 5 Aug 2026 18:30:32 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rust compile failure in next-20260730
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Bert Karwatzki <spasswolf@web.de>,
 Harry Yoo <harry@kernel.org>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
References: <20260731122826.737703-1-spasswolf@web.de>
 <20260731192522.GA1014697@ax162> <DKFD0ZKHC2I8.19PUYUR6N6KFN@garyguo.net>
 <anCkbMyUIscmAheK@tardis.local>
 <7c39e6cb-0ccf-4a50-a853-0f6012b05044@kernel.org>
 <DKFF147BG8PR.I12RKSRFQS1B@garyguo.net>
 <11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org>
 <DKG2TQ94TGLB.3EO7ZNVKB50KY@garyguo.net>
 <7189ebb5-ae48-4466-9055-1ab1b0b5ef7c@kernel.org>
 <CANiq72=Y1eVO5F0j4NXbnUzVvEnDGg0evAkeiE9hd-7hkeVr7A@mail.gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <CANiq72=Y1eVO5F0j4NXbnUzVvEnDGg0evAkeiE9hd-7hkeVr7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/5/26 18:24, Miguel Ojeda wrote:
> On Tue, Aug 4, 2026 at 12:35 PM Vlastimil Babka (SUSE)
> <vbabka@kernel.org> wrote:
>>
>> Thanks. The slab/for-next branch now includes the slab changes.
>> The merge commit should thus perform the rust/kernel/sync/poll.rs change.
> 
> I don't see it in next-20260805 -- Mark, could we please get the last
> diff hunk from:
> 
>   https://lore.kernel.org/all/11a8bf75-8fc1-4d32-a350-6bf8156dd8ab@kernel.org/
> 
> applied tomorrow in the char-misc-next merge? i.e.
> 
>     -    rcu: Opaque<bindings::callback_head>,
>     +    rcu: Opaque<bindings::kvfree_rcu_head>,
> 
> in `rust/kernel/sync/poll.rs`.

I was just asking Mark about it on IRC and sent the fix as he asked:
https://lore.kernel.org/all/20260805-slab-rust-fix-v1-1-c4d4c1b69de2@kernel.org/

> Thanks!
> 
> Cheers,
> Miguel

