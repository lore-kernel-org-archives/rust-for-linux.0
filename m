Received: from sender-pp-o92.zoho.in (sender-pp-o92.zoho.in [103.117.158.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E3A2C21F4
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770799847; cv=pass; b=RTB5WSTKyFj6mrG/peLxa5qq98B4NR5fv/pzwtTla76/IfGJqUObPj0v/bsehh3wDmS22jhpylqSdWgUjBi0rPN3VSkQT9NlPoYrURkBXHgakh/POHQMmse4txnWZM2fPQAk6Vgn4jQOlFerrCv+ROyjvtSI0EC8KQhVJhHYBGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770799847; c=relaxed/simple;
	bh=sDJ5RPhNFHrAvepyWK2ggAHR5k7rliwEIOKX5AJeY8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LiXLDb6Rv7LCJUfA/Edb5YyeBHUuvGMqhqxvxLfIoN7EEQ9o3rOsp1HaiFDpDSWRt41qrYMcAtQ9hnIzVfs3mgAFwsXsH3aSglPQZSyY1Qc86A23LZ8XqdOCR6kDUbhq6buMVeqtUmkmcZ1a+RUIG0/bn0pplbooHQaADCEAnG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b=pENfBMu5; arc=pass smtp.client-ip=103.117.158.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b="pENfBMu5"
ARC-Seal: i=1; a=rsa-sha256; t=1770799780; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=Ecs7PGoVSrzFU+1NXn2g6IKCpV/Y1DyjHppFkpx6BZ13SPdrh7vDAW2Kk1ArthtVEX8V19PltmEMH5f26sVeE42TxWEpSY1xmNVaLH6fbN353jRnBmJlARJLNFyNyFuUttSOMWlK5o9XpFYgGOMOM1M1Qa8PtDP0IiboX9KpSy0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1770799780; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vw2/5UORTh3A/MxNfECpW6MZBgdiJBJIAK6jKknu+5Y=; 
	b=D3lQdtBUKWhVgkQZoAU6bo3BB9ltjxIH2eTSUSXkcc0LQVttBeOSYJSi2kWGTJMms2B/07fOdZCjOGvKocgz9IxqsK2KnpdABQNIG+4xf8+MavtnzGHXQKl/592B7XklCgPSeFkkkIplRHwbcHa/Yzpuf8TZbdQ0vGZMNKYJelI=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=shivamkalra98@zohomail.in;
	dmarc=pass header.from=<shivamkalra98@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770799780;
	s=zoho; d=zohomail.in; i=shivamkalra98@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vw2/5UORTh3A/MxNfECpW6MZBgdiJBJIAK6jKknu+5Y=;
	b=pENfBMu5JQDTDzo95K1vKCYaJK6UQks0gv0wjiEHWDLPdPQknm2lwRkN9HzAqT6n
	HUQwUrm8NQQSn2/CROkQdLz81/fF7cJl4x6J4HpL/eP29Hn65taHmZ9CqYMGJwhPsl6
	JWEQbDRESSraNe07efTcAdsoGJQ8aL/nAjyf9GUM=
Received: by mx.zoho.in with SMTPS id 1770799778503891.4629345585777;
	Wed, 11 Feb 2026 14:19:38 +0530 (IST)
Message-ID: <af90cbe5-dcfa-46da-83b3-e903134c7f93@zohomail.in>
Date: Wed, 11 Feb 2026 14:11:31 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
 <aYs5L1aG5S34teKT@google.com> <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
 <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>
 <DGBKOL8Y6OH8.1X5RHNGCQAMC4@kernel.org>
 <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>
 <CAH5fLgg9sDW+MCK15yVyZ59BzXind+1vRj+PQ2xHQ8Bg7sxLRA@mail.gmail.com>
 <DGBLALCUGY7N.383JKRKNCRDW5@kernel.org>
 <1312bba9-442b-410a-9cb4-fe67879d2dcb@gmail.com>
 <CAH5fLgjwWQSHydyM6AMPiziBQjeO4rcNaOzuNV=CrHxRvYuaVw@mail.gmail.com>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@zohomail.in>
In-Reply-To: <CAH5fLgjwWQSHydyM6AMPiziBQjeO4rcNaOzuNV=CrHxRvYuaVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/02/26 12:21, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 2:08 AM Shivam Kalra <shivamkalra98@gmail.com> wrote:
>>
>> On 11/02/26 02:41, Danilo Krummrich wrote:
>>> On Tue Feb 10, 2026 at 9:58 PM CET, Alice Ryhl wrote:
>>>> On Tue, Feb 10, 2026 at 9:54 PM Danilo Krummrich <dakr@kernel.org> wrote:
>>>> Yes that's what I meant. Only provide shrink_to() for those. After
>>>> all, if Kmalloc never actually shrinks when you call realloc, what's
>>>> the point of having KVec::shrink_to()?
>>>
>>> Nothing, but eventually we want a generic impl of shrink_to() with A::realloc().
>>> But again, for now that's fine.
>> Thanks for the discussion. Just want to confirm my understanding
>> of the agreed approach:
>>
>> Since VVec and KVVec are type aliases for Vec<T, Vmalloc> and
>> Vec<T, KVmalloc>, implementing shrink_to() on "only VVec and KVVec"
>> means writing separate impl blocks:
>>
>>   impl<T> Vec<T, Vmalloc> { fn shrink_to() { ... } }
>>   impl<T> Vec<T, KVmalloc> { fn shrink_to() { ... } }
>>
>> Is that what you had in mind, with the shrink logic duplicated
>> in both? Or would you prefer a shared impl with a trait bound to
>> avoid duplication?
> 
> I would prefer either a single stand-alone function that both impls
> blocks call, or implementing it for KVmalloc only. Trait is overkill
> here.
> 
> Alice
Thanks Alice. I'll go with the standalone helper function approach
with separate impl blocks for Vec<T, Vmalloc> and Vec<T, KVmalloc>.

Will send v4 in a some time.

Shivam
