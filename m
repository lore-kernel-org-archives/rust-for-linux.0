Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7A228136E
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349343; cv=none; b=PMSt+88RV3+VwVHDb3Vec6ovzcLz4chiaqWRUzCKQM9LCvTnicKYlSblXRCHYIffR4pvN2mh3quU6ZqHRnYf67dgvPl6OBX1HiAnEjuxSFIIMBiTc2f5hzYoSwivoLcLIhXnpG1tnZJXyh4xSoqDJ8yuIcXk/s1+Yxvhfr/x950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349343; c=relaxed/simple;
	bh=mvdxvHwnj2wsYWz4k1pqZ+LZ54XVClWdUrBL6s+YQf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiMGeXWW5mDT53cJctOB7P3m4RvaGC+1CFvwnPcICQfZlHymQ4NLvGWk99qvKYB9TzCvx37E/SeAFFp1FPH7DZHJ3xTr0P3VZ5BFlLmzax6bv6zW6tXGHsEnqV9yU5aB9x8NstLGwZYrCVcuu5qnttH7P3/TmDqYR7H9UX+l7j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HPjFGbO7; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HPjFGbO7"
Date: Thu, 24 Jul 2025 17:28:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753349329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zov/CwKu2g/aK1+NzqVWBL06syMbiKGO7EetdWyS+Dw=;
	b=HPjFGbO7n3v0p1ZAIrJIxe4cFRd2tlR7bO8sCuk3GP7u7cw1oTchz8qrX9d0P43eILsU8u
	2fkHqvHVca+GP3y2WUICqjaT2vbDvzFcn4CtkAVOug+y5WT9WGFqpb+DVpQSkRNfgpFiND
	mxHt+lYBq4SGSHUQAo5Nq5KvCffUmH4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hui Zhu <hui.zhu@linux.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>,
	Geliang Tang <geliang@kernel.org>
Subject: Re: [PATCH v3 2/2] rust: alloc: kvec: add doc example for `as_slice`
 method
Message-ID: <aIH8wCbTP87ZMIUz@teawaterdeMacBook-Pro.local>
References: <cover.1753339262.git.zhuhui@kylinos.cn>
 <376014022fa799f5480f6f993f1e25b2561507e4.1753339262.git.zhuhui@kylinos.cn>
 <CAH5fLgiYnZKtrHxtTHfw1n4VbRakNa1Nid9UHPWOwfNh-QHoUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiYnZKtrHxtTHfw1n4VbRakNa1Nid9UHPWOwfNh-QHoUQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Alice,

On Thu, Jul 24, 2025 at 10:21:46AM +0200, Alice Ryhl wrote:
> On Thu, Jul 24, 2025 at 9:54 AM Hui Zhu <hui.zhu@linux.dev> wrote:
> >
> > From: Hui Zhu <zhuhui@kylinos.cn>
> >
> > Add a practical usage example to the documentation of `KVec::as_slice()`
> > showing how to:
> > Create a new `KVec`
> > Push elements into it
> > Convert to a slice via `as_slice()`
> >
> > Co-developed-by: Geliang Tang <geliang@kernel.org>
> > Signed-off-by: Geliang Tang <geliang@kernel.org>
> > Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> > ---
> >  rust/kernel/alloc/kvec.rs | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index 3c72e0bdddb8..d384c34d1a5e 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -224,6 +224,15 @@ unsafe fn dec_len(&mut self, count: usize) -> &mut [T] {
> >      }
> >
> >      /// Returns a slice of the entire vector.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// let mut v = KVec::new();
> > +    /// v.push(1, GFP_KERNEL);
> > +    /// v.push(2, GFP_KERNEL);
> 
> These function calls are fallible, but you are ignoring the errors.
> Please use the question mark operator.
> 
> Alice

Just sent v4 according to your comments.

Best,
Hui
