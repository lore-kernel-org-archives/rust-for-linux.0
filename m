Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975B65CDF1;
	Mon, 16 Mar 2026 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661426; cv=none; b=Qh7W2byAeNUBpkSweR1JqwPuGGehBiOzit+qnq/4XyI/wXUUS3ZNBD6AyHshwd35Nx9mH3EITm4AD7SBtjbvyqM/RUYbkJ0OtP063RWvw7Y8q6arepOysbHrQoGDv/lMSXNpazk6WyjfX9iat2R0TP3AFfeoGEuA2zJ9WiXZSOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661426; c=relaxed/simple;
	bh=C6Gv5DXI4ZihADWfPx+nVAvPgU0YVUtJvqpwogYXolY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Q12rZGjnBKcig6Ei309RVauW0mUauOwDDGBh9I6fyySCYMMp49JjoQAaesnk7cbnlRTqZjR8CJtNzh/yeROELU8S1X8HCWSPPaLQY6l09exINdTVYTIfbfRs+l9/fXbK005Un3wYlvde2HsmROiIPdlqHvc5Blo6bUpio1h1MpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0MWPsqP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0MWPsqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AF6C19421;
	Mon, 16 Mar 2026 11:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773661426;
	bh=C6Gv5DXI4ZihADWfPx+nVAvPgU0YVUtJvqpwogYXolY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=R0MWPsqPzi1FFvHVni87OLZOCaG+CMBkURZMpausOSg/HMaR1sNfBKpi26V6xJU6R
	 AIzUzkWz9C6ak8xgzHfmfqyx51zQyPW+vZxjuu5VnQtIr12sd2CDXGH5pE0WC9p17w
	 Bg5o+ikpbaXiH2D+9SWoBImEBSiAB7E6Ykq4V5sOFStXjAktPZ9zzdgPIAkdt08uDi
	 v4yXQWwbOYkLQ6K6pqSqkDhG/3O9/nJRim+yiPOHtXgjkH7K9Lbvl5eTRZKtkWkqJN
	 XEUlUHTqPmCAUdIIA06R3TmEAqxy/PBkMnIor1jqTMs4T+YYPSq7tl5X/aTV0aGL9m
	 tguOPEFUcUzpA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 11:43:41 +0100
Message-Id: <DH4582TWS3WF.10WYLC267YNRR@kernel.org>
Subject: Re: [PATCH v4 3/3] rust: workqueue: add creation of workqueues
Cc: "Tejun Heo" <tj@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Benno Lossin" <lossin@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260312-create-workqueue-v4-0-ea39c351c38f@google.com>
 <20260312-create-workqueue-v4-3-ea39c351c38f@google.com>
 <DH0ZZLC5QQE7.1I1FBK77FQHO9@kernel.org> <abU4oXeCesOJr46H@google.com>
In-Reply-To: <abU4oXeCesOJr46H@google.com>

On Sat Mar 14, 2026 at 11:30 AM CET, Alice Ryhl wrote:
> On Thu, Mar 12, 2026 at 06:59:31PM +0100, Danilo Krummrich wrote:
>> On Thu Mar 12, 2026 at 10:23 AM CET, Alice Ryhl wrote:
>> > +impl Queue {
>> > +    /// Build a workqueue whose work may execute on any cpu.
>> > +    ///
>> > +    /// # Examples
>> > +    ///
>> > +    /// ```
>> > +    /// use kernel::workqueue::Queue;
>> > +    ///
>> > +    /// let wq =3D Queue::new_unbound().build(c"my-wq")?;
>> > +    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from unbound wq")=
)?;
>> > +    /// # Ok::<(), Error>(())
>> > +    /// ```
>> > +    #[inline]
>> > +    #[doc(alias =3D "WQ_UNBOUND")]
>> > +    pub fn new_unbound() -> Builder<TypeUnbound> {
>>=20
>> Wouldn't it be more straight forward if those where constructors of Buil=
der?
>>=20
>> 	let wq =3D wq::Builder::new_unbound().build(c"my-wq")?;
>
> Crates out there do both, but I actually like this pattern quite a lot.
> After all, given 'wq::Builder::new_unbound()' and 'Queue::new_unbound()'
> I think the latter is the one that makes it more clear that you are
> building a 'Queue'.
>
> Also, it avoids an extra import.

If it is about avoiding an extra import, what about

	Queue::builder_unbound()

this makes the name less misleading and avoids the import.

>> Queue::new_unbound() suggests that it returns a new Queue object, but in=
stead it
>> returns a new Builder object.
>
> I'm only really concerned about confusion if it falls into one of these
> categories:
>
> * You write the wrong code, it compiles, and silently does the wrong
>   thing.
> * You read the code, and misunderstand what it does.
>
> I don't think this falls into either of those cases. If you forget the
> .build() call, all you get is a compiler error, and it's not hard to
> figure out what to do when you see the error.
>
> Alice

