Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11C332ED2A;
	Tue, 10 Feb 2026 20:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756843; cv=none; b=tR3XZwXBFl9PcgBlUOtW+9Jdxlb9lWrlzlbxAzwyXLuDPOIR/m/yF7PJfq/GoazSG2BzORu3VIR65JD+HEjXF6/2FUVbbgtcMdN0VsGCgsrJTfeFduyx5vJeIUfhzElKLGxQXXiH+b134JzOUkxubL9MCMT69mDFQgiP/bC/FcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756843; c=relaxed/simple;
	bh=97RSacXUmOjzzx9buJoyUsQKmsbHEPepPDLV4+FFuZs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hFAR0pq/SmnXLAZqaTEg+lBdKz5h4ddO+hRx3fi/egwTFZR1dFrd8fC8trfdB3rPIg0c/rYRltIssqYIn9dU5V9s7Z295CRyEz0R9C2atrb44f2kI4bLlLPRMvP78zo6R6pKXFTtxJwu1CxumAZrDHQYx6nbZYfXPUC6tpTL3Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWZAV3oI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWZAV3oI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD234C16AAE;
	Tue, 10 Feb 2026 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770756842;
	bh=97RSacXUmOjzzx9buJoyUsQKmsbHEPepPDLV4+FFuZs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SWZAV3oISizPhIG/sEh9c5tmxgLoPLxxVa61N+N+5wVJxcBUjPIK8pnEuFQw7DcAc
	 rNzLhzIviiPA+9Z8mctoA+y6WXTAblNWVZMBcepT8TpkhmhsTdRUAqAjjWI4JK/FZ8
	 rpgI9GGT+WXxto0X6peGNGtrlWkdKl0olLwyU2b3frq0owGEviHfGJJGG8wL+1cjEN
	 BW8LTPglKx2Cc9+xKlL3Ca8S1vEpKKTdE+mRTVxj5j6uJtCJiwkjoCyijOQCj9ftTO
	 FSFEnLcfpFhjhAcRSDdHnfWtL2NB8B0Ozx7cyKFIFZj1oyQy/WJG2RK8tT7Toi3aOF
	 Wq7q+DOlEzLoQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 21:53:57 +0100
Message-Id: <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>
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
In-Reply-To: <DGBKOL8Y6OH8.1X5RHNGCQAMC4@kernel.org>

On Tue Feb 10, 2026 at 9:43 PM CET, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 9:05 PM CET, Alice Ryhl wrote:
>> On Tue, Feb 10, 2026 at 4:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>>>
>>> On Tue Feb 10, 2026 at 2:57 PM CET, Alice Ryhl wrote:
>>> > On Tue, Feb 10, 2026 at 07:08:09PM +0530, Shivam Kalra wrote:
>>> >> This is a follow-up to my v3 series:
>>> >> https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-v3=
-v3-0-8ff388563427@cock.li/
>>> >>
>>> >> Hi all,
>>> >>
>>> >> Thanks for the feedback on v3. Before I respin, I want to confirm
>>> >> the direction for v4 to avoid unnecessary iterations.
>>> >>
>>> >> Proposed changes for v4:
>>> >>
>>> >> 1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
>>> >>    method on Vec<T, A> that calls A::realloc(). (Danilo)
>>> >>
>>> >> 2. Add a temporary ShrinkQuirk trait to handle the vmalloc workaroun=
d
>>> >>    (page-boundary check + manual alloc+copy+free) until vrealloc
>>> >>    gains in-place shrinking support. (Danilo)
>>> >
>>> > I don't think you want any new traits at all. What types would even
>>> > implement the trait? The special code can go in the realloc() method =
of
>>> > Vmalloc struct in rust/kernel/alloc/allocator.rs.
>>>
>>> I did not propose to move this into the realloc() functions of the corr=
esponding
>>> allocators intentionally, as there is a difference between calling real=
loc() and
>>> shrink_to().
>>>
>>> I don't want that some user of e.g. Vmalloc::realloc() experiences page=
 wise
>>> shrinking by copy. This is acceptable for Vec::shrink_to(), but not for
>>> realloc() in general.
>>
>> Ok. In that case we can add a method on KVVec directly for this
>> purpose, but I still don't think we need a trait?
>
> KVVec::realloc() should not have this behavior either, we only want it fo=
r

s/KVVec::realloc()/KVec::shrink_to()/

> VVec::shrink_to() and KVVec::shrink_to(), so I think we need a temporary =
quirk
> trait.

Unless you mean to implement shrink_to() for VVec and KVVec only, that woul=
d be
fine with me as well.
