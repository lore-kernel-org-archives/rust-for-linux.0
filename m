Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C6F37269B;
	Tue,  3 Mar 2026 22:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772575398; cv=none; b=sWf5KN1ozjZXbkRHbUmY9DuW5K6pdVOlHefPxXWP5o1yPbCSm53aA8slaspAxvJZggoDh9iR7BwkaG8yf0/VWUCes5R7nVGEFADA1AgGbAmLwhAjkRYY2Hj1bl3NKx6EF0nuRUHqGt0LPF5jBb5swyfmXWTGkZiXL+lXBQdG8Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772575398; c=relaxed/simple;
	bh=Sk2JKtIHDvQurEEWouMfvz+cHNgcAnRyc1bQSMn+1lY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ubU2QdtfV3qHxTAUEQ0KyQ+CFFZFZ82Y++JKBBkJ2DEANIFkqVRb+TQtacHSda80tK5WaunxGMw3CrP/9GbytsLG/wbnYqBIbGiCrNjYHGGff3dBjAJq5tWCPxuZrhickXqy8bb/fWu+A9IniyCInpZY6Wgfvq96y3fNRF7XId0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ctwkj3Xu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ctwkj3Xu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E164CC19425;
	Tue,  3 Mar 2026 22:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772575398;
	bh=Sk2JKtIHDvQurEEWouMfvz+cHNgcAnRyc1bQSMn+1lY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Ctwkj3XumUq7AeupEpmrvj6P7ij2aVenRXPJpQdjTSr/wLoZRs6f81RXxAWibsli3
	 Etyf6sg0QMaJujUpLJjaPdKT5q8BhnIIxEez+/hCVUCg0UO3hfebjRjittFayAGEn2
	 BLUt/UedCud0h6MguzRzATsNFG7B4hWj8no0EMvrZp1A9uZ4o7THhliLRCxISp3SR0
	 oc2dlMxa/fEolNyUdjAF0OPIRmEdVL9wfidCgKtj5W43pRUvcn7C29Em12zidHYrUl
	 gQo771D+DHiJCSMN6N6tKp+ybFFQx7oRu7tLwsOjwUVQDP07w2QMFoaxXecDkdLWZs
	 FCUYfEe2rm5VQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 23:03:13 +0100
Message-Id: <DGTHJ9WTIIMY.14J3QXBSDAE6D@kernel.org>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
Cc: "Dave Airlie" <airlied@gmail.com>, <linux-kernel@vger.kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie" <airlied@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <arunpravin.paneerselvam@amd.com>,
 <joel@joelfernandes.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGPPKJ5W6FVD.29LI1HKSBZSG2@kernel.org>
 <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
 <CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com>
In-Reply-To: <CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com>

On Tue Mar 3, 2026 at 10:43 PM CET, Dave Airlie wrote:
> On Tue, 3 Mar 2026 at 07:19, Joel Fernandes <joelagnelf@nvidia.com> wrote=
:
>>
>> Hi Danilo,
>>
>> On Fri, Feb 27, 2026 at 12:30:20PM +0100, Danilo Krummrich wrote:
>> > >
>> > > +RUST [GPU BUDDY]
>> > > +M: Joel Fernandes <joelagnelf@nvidia.com>
>> > > +L: dri-devel@lists.freedesktop.org
>> > > +L: rust-for-linux@vger.kernel.org
>> > > +S: Maintained
>> > > +F: rust/helpers/gpu.c
>> > > +F: rust/kernel/gpu/
>> >
>> > What about adding this to the existing GPU BUDDY ALLOCATOR entry? Mayb=
e you can
>> > offer Matthew and Arun your help.
>> >
>> > Also, this wouldn't be a subentry of "RUST", but the rust version of G=
PU BUDDY,
>> > so it would be "GPU BUDDY [RUST]".
>> >
>> > Also, please add rust/kernel/gpu/ to the "DRM DRIVERS AND COMMON INFRA=
STRUCTURE
>> > [RUST]" entry.
>>
>> Both these additions sound good to me. Just to list all the options belo=
w
>> so we save time on what we all agree on:
>>
>> 1. New GPU BUDDY [RUST] entry.
>>
>> 2. Add it under the existing "DRM DRIVERS AND COMMON INFRASTRUCTURE
>>    [RUST]"
>>
>> 3. Add the rust files under the existing "GPU BUDDY ALLOCATOR" and add
>>    myself and Alex as R:/M:
>>
>
> Number 3 please,

Just in case it wasn't clear from my suggestion above, please also do 2 in
addition.

Thanks,
Danilo
