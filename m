Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473C7C145;
	Tue, 10 Feb 2026 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757007; cv=none; b=QHlqtiAuIEuTl6d9xO92vhEsk2Ffq7w2bwOwrTwEreW3FQT2SO0Gt/TXh5CGAV15h9J6pnVZpjbRJMTg6o6ciEcOZq9qE0Nb8kNAictgJyhqizibDFWpbJnenTRXC4gRvE62MElfXB0IN8MGXp2580smcr+czwifOzBLB6bHVCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757007; c=relaxed/simple;
	bh=C7CL3stVC7tNypN5EzmqeoZvLhFzSUm/IzM85Pu8U9A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FHQayhTDtJ9XHkLkdPB5IE0EURg4BWI5Q2dlKyHaT+2X25VaHo6w5ILgVnRt9E0fpOp3uReUbbPcbc9eDYBkB7zhdx9588UaA4BoVU/KXgTm/0TL64536jaMAYX3Dtu5v0DeaixyrkXGiUOItYk+dOxJ0LUtZfcD3zjkTDpgUf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EA6a2MZ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EA6a2MZ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF388C116C6;
	Tue, 10 Feb 2026 20:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770757006;
	bh=C7CL3stVC7tNypN5EzmqeoZvLhFzSUm/IzM85Pu8U9A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=EA6a2MZ4ne2NS2Bb7n+JVuN4wLPJml8+2OuX056U/wTA8klLfoCy+u651e4aDE0sk
	 xjrUgn3OujRh36IhM/h+YMmlI7WMiCrnj+hN34s+AuYGZnQP5A/Hu6KpZVOr2DRgCu
	 T47orPoj4EgR+jj9kwABYiLWcnq9lve5+wqoVWboJIkMjknw0buv4JukrElG4P1Zej
	 j0+NsVDhu6XWfhPHe5B3nU6Fn4TWHE+yWM4GN32eoOirnkVDQu6Ko6Pb4ejpWy9BrH
	 agw0wse7ClMI4A+7tENWopgpl9GeGoLBeV1dkuNSumwZUZlrgfHIu+r/JTr55XP2er
	 n+ygYPTRlICYA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 21:56:41 +0100
Message-Id: <DGBKYW8RRJJZ.3I4FG8U6UXGRQ@kernel.org>
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
In-Reply-To: <DGBKWSS3PEGY.20YKV5CO7DCKT@kernel.org>

On Tue Feb 10, 2026 at 9:53 PM CET, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 9:43 PM CET, Danilo Krummrich wrote:
>> On Tue Feb 10, 2026 at 9:05 PM CET, Alice Ryhl wrote:
>>> On Tue, Feb 10, 2026 at 4:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
>>>>
>>>> On Tue Feb 10, 2026 at 2:57 PM CET, Alice Ryhl wrote:
>>>> > On Tue, Feb 10, 2026 at 07:08:09PM +0530, Shivam Kalra wrote:
>>>> >> This is a follow-up to my v3 series:
>>>> >> https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-v=
3-v3-0-8ff388563427@cock.li/
>>>> >>
>>>> >> Hi all,
>>>> >>
>>>> >> Thanks for the feedback on v3. Before I respin, I want to confirm
>>>> >> the direction for v4 to avoid unnecessary iterations.
>>>> >>
>>>> >> Proposed changes for v4:
>>>> >>
>>>> >> 1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
>>>> >>    method on Vec<T, A> that calls A::realloc(). (Danilo)
>>>> >>
>>>> >> 2. Add a temporary ShrinkQuirk trait to handle the vmalloc workarou=
nd
>>>> >>    (page-boundary check + manual alloc+copy+free) until vrealloc
>>>> >>    gains in-place shrinking support. (Danilo)
>>>> >
>>>> > I don't think you want any new traits at all. What types would even
>>>> > implement the trait? The special code can go in the realloc() method=
 of
>>>> > Vmalloc struct in rust/kernel/alloc/allocator.rs.
>>>>
>>>> I did not propose to move this into the realloc() functions of the cor=
responding
>>>> allocators intentionally, as there is a difference between calling rea=
lloc() and
>>>> shrink_to().
>>>>
>>>> I don't want that some user of e.g. Vmalloc::realloc() experiences pag=
e wise
>>>> shrinking by copy. This is acceptable for Vec::shrink_to(), but not fo=
r
>>>> realloc() in general.
>>>
>>> Ok. In that case we can add a method on KVVec directly for this
>>> purpose, but I still don't think we need a trait?
>>
>> KVVec::realloc() should not have this behavior either, we only want it f=
or
>
> s/KVVec::realloc()/KVec::shrink_to()/
>
>> VVec::shrink_to() and KVVec::shrink_to(), so I think we need a temporary=
 quirk
>> trait.
>
> Unless you mean to implement shrink_to() for VVec and KVVec only, that wo=
uld be

s/and/or/ (Sorry for another correction, slightly distracted currently. :)

> fine with me as well.
