Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F58F3D561
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904609; cv=none; b=bri8Cyoi74Y7ANSe1zGIA/+htZS/orsxT7Fiau6+PsQ7vlbuUJt/MVOG8tKorkw0SEAZq1MZCQr5Iw1kwjYnJkP6Evt/hcTb1wIYBENjsrLXwYHGJvXyNso0XaY0GgrFnaUGGFUwpA5F1gJMsabptD07YpiQgDE4Sn6fHqVtWpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904609; c=relaxed/simple;
	bh=AB6lDCcY3EkhUUou7Ts27A1hUvHnntmPf/4n2yqGzpc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FwGSV7UmAVNacx44M10jPFK6vVP9bkuysYR0WEqB+JQiblltNzhyBAdONrB1HXamyKrilVJCRSj3M5VKoNZcyNVT+U6u9deGXooTupVhBHNksVHKFZbNP0zn7EYbLgOBLIqv0MMpGomCyS45+d/SGL5DdBNyzUvRSJ1e7vR8khA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLIOXGYO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLIOXGYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536FAC4CEED;
	Mon, 11 Aug 2025 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754904609;
	bh=AB6lDCcY3EkhUUou7Ts27A1hUvHnntmPf/4n2yqGzpc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=mLIOXGYO1OTmWkEINNH1jK9WnWbjCMEXGra7RzEdGK+btVJliLrLe6LDZgQsOH9kq
	 +5gvTwT0JJP5YYSWJtKfTmu0KJLprx9AyP6JbEUfam38EBuPTsmFKY5SYe0ZLdQn2A
	 oFgShRTXlUE0jxZ8oFJXQsIPZ3QDIy96cId81uhMY6zDgmnWdfaZJQu7Du4jd0NhBT
	 ukgUitMScPMwFcRe3vhAx1rHkkg8seFvUTnQy1AIKm6rIdGHn3XnFPpWamTAc+iJud
	 8ZJ772ELxFIqCjnu6UBSAnOztP1JU2MNF3DaYAO0PuxDCJd2QpjVJwAa7+dKBuPJw6
	 eaEeYg2GJhXog==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Aug 2025 11:30:04 +0200
Message-Id: <DBZHRHSE33E9.2AMO99NOCX0C0@kernel.org>
Subject: Re: [PATCH v3 3/7] rust: alloc: implement VmallocPageIter
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>, <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250808181155.223504-1-dakr@kernel.org>
 <20250808181155.223504-4-dakr@kernel.org> <aJm0duBjfWyZT3YJ@google.com>
In-Reply-To: <aJm0duBjfWyZT3YJ@google.com>

On Mon Aug 11, 2025 at 11:14 AM CEST, Alice Ryhl wrote:
> On Fri, Aug 08, 2025 at 08:10:17PM +0200, Danilo Krummrich wrote:
>> +/// An [`Iterator`] of [`page::BorrowedPage`] items owned by a [`Vmallo=
c`] allocation.
>> +///
>> +/// # Guarantees
>> +///
>> +/// The pages iterated by the [`Iterator`] appear in the order as they =
are mapped in the CPU's
>> +/// virtual address space ascendingly.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `buf` is a valid pointer to the beginning of a [`Vmalloc`] alloca=
tion.
>> +/// - `size` is the size of the [`Vmalloc`] allocation `buf` points to.
>> +pub struct VmallocPageIter<'a> {
>> +    /// The base address of the [`Vmalloc`] buffer.
>> +    buf: NonNull<u8>,
>> +    /// The size of the buffer pointed to by `buf` in bytes.
>> +    size: usize,
>> +    /// The current page index of the [`Iterator`].
>> +    index: usize,
>
> My understanding is that an implementation using two pointers that
> repeatedly increments the starting pointer until it reaches the end
> pointer is more efficient.

If I directly advance the start pointer until hitting the end pointer, I ne=
ed
three pointers, i.e. start, end and the advancing one, otherwise I can't
implement base_address() anymore, hence I went with an index instead.
