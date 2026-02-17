Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB2B336EF8;
	Tue, 17 Feb 2026 16:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344653; cv=none; b=ZI+KNm7L9/n3MpU+Pvt9OYXN4gL23vccsnAEW/FaaB/tESNAri+0cIdc8+BEQ2b1l2LVsV3eaR+z+eaOOMGesaDKDgqaQk3xejdjv5esRrRGIkMYwtxL9AC9SxMCfT1BnrvM5n8SgNkNDviquHL3sOn3eqeSrp1o/0wLmSY1lc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344653; c=relaxed/simple;
	bh=MXhxVIHeRx0BZp2W6p41DrKtgS4f5F5WFmdV2+prA3I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=H0QG8BgyHs4hOh3vBXWSv2O+pm94LeTFCXCCzi7Tue3IgCiGYl3dQ+DQyjK3Y1W75Vo8YD3ws+kbDZ2KQJ1g8c8xPpeItiir/AsZmDaTaLcCuDufxYj94lBps22HovbxOSR0xvhzIYW9lyyBbEFWWZuxBdCXoN+svnCyrMxArpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+6X96Up; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+6X96Up"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B95C4CEF7;
	Tue, 17 Feb 2026 16:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771344653;
	bh=MXhxVIHeRx0BZp2W6p41DrKtgS4f5F5WFmdV2+prA3I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=X+6X96UpPdp4cqp7E/C4NBggV15ypDFjwEo3EL4AaUkDLTTFQrFbAgYYCZpDv8r+H
	 NR3w8etIdXG9TyuAGAG67a/FT02+v3Q3381wGlkvjOuCjmeDwyGFYzcle1us+DxOmS
	 r3pzKu4oOjfNCEi6otQCyIMBt9kiO74sr1iLhc5TeJ8ZAeSDdjJ9cZ8Xt1Vi24HI+R
	 dzPec5h4QNx5gt9lN0CDPA0DdDQXDpX3gezcH4vspUWHQjAADc0DZ298oD1aJaM+SE
	 fvZ+jtvH7PZtQMXb1Z/BBYj1QlVTP1e3DwNqPRYuuXMlXZ56c1WJU1YYogjLZ5lDH1
	 B+Rz05pOLZh3w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 17:10:48 +0100
Message-Id: <DGHD9TK32CZT.1PGFE238T1YY7@kernel.org>
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Boqun Feng" <boqun@kernel.org>,
 "Greg KH" <gregkh@linuxfoundation.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Will Deacon" <will@kernel.org>, "Mark Rutland"
 <mark.rutland@arm.com>, <linux-mm@kvack.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Peter Zijlstra" <peterz@infradead.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <aZRWOIPThLfIZ1Ph@google.com>
 <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
 <20260217130024.GP1395416@noisy.programming.kicks-ass.net>
 <DGHADGXGWS45.1A6EHNMKM4SRH@kernel.org>
 <20260217155035.GZ2995752@noisy.programming.kicks-ass.net>
In-Reply-To: <20260217155035.GZ2995752@noisy.programming.kicks-ass.net>

On Tue Feb 17, 2026 at 4:50 PM CET, Peter Zijlstra wrote:
> On Tue, Feb 17, 2026 at 02:54:30PM +0100, Danilo Krummrich wrote:
>> On Tue Feb 17, 2026 at 2:00 PM CET, Peter Zijlstra wrote:
>> > Anyway, I don't think something like the below is an unreasonable patc=
h.
>> >
>> > It ensures all accesses to the ptr obtained from kmap_local_*() and
>> > released by kunmap_local() stays inside those two.
>>=20
>> I'd argue that not ensuring this is a feature, as I don't see why we wou=
ld want
>> to ensure this if !CONFIG_HIGHMEM.
>
> Because of the principle of least surprise. For the HIGHMEM case 'ptr'
> only lives between kmap and kunmap and any access must necessarily be
> confined in between those. Having the code behave differently for
> !HIGHMEM is surprising.

Well, I'd argue that those are two different things.

I agree that correct code does only ever access the pointer between kmap an=
d
kunmap (and in Rust we could even enforce this at compile time through the =
type
system).

But the memory barrier is not required, i.e. if the compiler reorders thing=
s if
!CONFIG_HIGHMEM, that's fine.

I think it would be wrong if users would - for their code - rely on
"kunmap_local() already issues a memory barrier for me". It's an implementa=
tion
detail that depends on CONFIG_HIGHMEM, not an API guarantee.

>> I think this is not about not escaping a critical scope, but about ensur=
ing to
>> read exactly once.
>
> It ends up being the same thing.

Reading a value multiple times within a certain scope and reading it exactl=
y
once is a difference, no?
