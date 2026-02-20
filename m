Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620722154B;
	Fri, 20 Feb 2026 23:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771631012; cv=none; b=Bac7TBAsX2IVgYktXqNfq944BAFOAqfI1S154+radNjzO2eKjvOtiChIFGz33tSbtISJcAx/9WJzB1UqSqxRAQjU1UhRrOC2L27dKWLZSFYhQkpX4Pga+ZKt0AFviz2uRftTFBKpd1bngpYUBfxLu62pWfz5pC1R0v8yMoBil0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771631012; c=relaxed/simple;
	bh=AYjchzzoyLOBMqiFo72PIrY6DUb60UnluRtgVjVXLLk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DBXtBTWIIWwMqtCRLbayRMi0Q0A2ZIoLgqvUY5mUdPlKFdKDPleS9pcY8hbWK4kleqqZFl+AMJhEP5QUu1h9UrrjQzY+kdukPK8EWKprY3k5Uw3LiL/q27GZScNUV/OgUyJMUp+MvLt9yoWMTkhi9fm44eTrANESPpinP39ejoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akoM+guz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akoM+guz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1CFC116C6;
	Fri, 20 Feb 2026 23:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771631011;
	bh=AYjchzzoyLOBMqiFo72PIrY6DUb60UnluRtgVjVXLLk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=akoM+guzkSTD0GY5Z6qkvYPbymswvNkiW9PlLdzyAKaTZ/Y8DloAvXb2sb+PFxdAw
	 /Wh4f51MB6r7/zJtTlVEYZIvGubkPVWJOa8GrSAhG8fynC7ZcyhYRuWL3arrhumFqs
	 uSO9JifNmrt48lWDZ0rNKj4cY49PrxH33sIwP4cDTdbMQgnvhoT9LnUQlU00VwjoOI
	 dOPfLDC/UNRDWSYwAGXJqMu0QhCnXynq5eFcsx0RGiVgrXmfQbO69/nKtR8gXb0zYk
	 BatyUUs5cD9jlHjJC8l3HL3ClcdRd+dAcodT51lJMuj2Leu7amW15xphrTM5APbntk
	 YQVqn/dCrhWsw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 00:43:26 +0100
Message-Id: <DGK6S0K1FRBA.DAR9BQ6Z18LF@kernel.org>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie" <airlied@redhat.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
 <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
 <DGJWS7GBIQ2H.3VSOWO6T8Y482@kernel.org>
 <f5627be1-0598-4ee0-9146-7ab9d1bdd0a0@nvidia.com>
In-Reply-To: <f5627be1-0598-4ee0-9146-7ab9d1bdd0a0@nvidia.com>

On Fri Feb 20, 2026 at 10:20 PM CET, Joel Fernandes wrote:
>
>
> On 2/20/2026 10:53 AM, Danilo Krummrich wrote:
>> On Fri Feb 20, 2026 at 3:54 PM CET, Joel Fernandes wrote:
>>>
>>>
>>> On 2/20/2026 3:22 AM, Eliot Courtney wrote:
>>>> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>>>>> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy =
*mm,
>>>>> +						   struct gpu_buddy_block *block)
>>>>> +{
>>>>> +	return gpu_buddy_block_size(mm, block);
>>>>> +}
>>>>> +
>>>>
>>>> Will `rust_helper_gpu_buddy_block_size` be used in the future? It
>>>> doesn't appear to be used in buddy.rs.
>>>
>>> I think it is worth keeping because it is a pretty basic API the underl=
ying
>>> infrastructure. Finding the size of a block can be important in the fut=
ure
>>> IMO. It is only few lines, no?
>>=20
>> The helper should be added with the code using it.
>
> I will add this as a test case to exercise it and include it in that patc=
h.

A test case for a helper? Or do you mean you will add the actual abstractio=
n?
