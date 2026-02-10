Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C471A08A3;
	Tue, 10 Feb 2026 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770735906; cv=none; b=KJiHm/fv1LBTrvvA8/dBEds60rZ9cY/PPuj3YOtQ9X2fFE0+92z3EbOAzs51CpQCrmotdvh52zXBNftFtLj1ljLfwR5DawYaI7+oy8ZwR2jltrMX4X0+CkMTYiIo9jCj0IZIompFZD4T0gvTm9Zy0o583haHTWXG3NPHYTxw/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770735906; c=relaxed/simple;
	bh=WTCqnmiGHxbxN+mJOrRuMC5tlepBjJ1qNnwg8jvXVRE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Wbz/yUn4DE/JMYbdTZAB/RGGHCap3ymVbkjfaZNdNiRkqckxgTCvV+NpGEfEnKKHuSO6vY3J+Sw1+VFS481y82J+x6hYOfPu8OlpQ+OHhj0aKwzCK1eLqQJu028so0qv/T5H9Qzl4DmDyo0xERhkqmJeD2nDDRyNvdQHhGl2gpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRO80yUp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRO80yUp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E32C116C6;
	Tue, 10 Feb 2026 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770735906;
	bh=WTCqnmiGHxbxN+mJOrRuMC5tlepBjJ1qNnwg8jvXVRE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=FRO80yUpBj3gTAxpYZCgoiHJL6BWRzyfxP4r6jBhyId8zbISm58dnqFLL/wN2DtoV
	 P4D/VxinXTqjOBXEklblzroZm3sQ+CsSrnvPA8fH8/z8Avn6pbiorKfhA3ZYOpHTR1
	 mgA1bngnZlCDNhz67ckxuz1oyrrV5ElwwUhOZklLSsKC/2aZVwsrJK/tgrKFLDEkvE
	 gVA+5etZ9qFTFyj5H640PG4qhWtNhxJutnJpX7yCNOo47WPmAo53L0uwNLqcvoXNMn
	 0VUETh+ZAfCU/8Fekdtyz28YUbE0NVLS+YZMbkQxuZ84lx2SCKaYNdfpR8VkCPNfN3
	 h43aaDaXqZFZw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:05:00 +0100
Message-Id: <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
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
 <aYs5L1aG5S34teKT@google.com>
In-Reply-To: <aYs5L1aG5S34teKT@google.com>

On Tue Feb 10, 2026 at 2:57 PM CET, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 07:08:09PM +0530, Shivam Kalra wrote:
>> This is a follow-up to my v3 series:
>> https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-v3-v3-=
0-8ff388563427@cock.li/
>>=20
>> Hi all,
>>=20
>> Thanks for the feedback on v3. Before I respin, I want to confirm
>> the direction for v4 to avoid unnecessary iterations.
>>=20
>> Proposed changes for v4:
>>=20
>> 1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
>>    method on Vec<T, A> that calls A::realloc(). (Danilo)
>>=20
>> 2. Add a temporary ShrinkQuirk trait to handle the vmalloc workaround
>>    (page-boundary check + manual alloc+copy+free) until vrealloc
>>    gains in-place shrinking support. (Danilo)
>
> I don't think you want any new traits at all. What types would even
> implement the trait? The special code can go in the realloc() method of
> Vmalloc struct in rust/kernel/alloc/allocator.rs.

I did not propose to move this into the realloc() functions of the correspo=
nding
allocators intentionally, as there is a difference between calling realloc(=
) and
shrink_to().

I don't want that some user of e.g. Vmalloc::realloc() experiences page wis=
e
shrinking by copy. This is acceptable for Vec::shrink_to(), but not for
realloc() in general.
