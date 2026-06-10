Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345953BED79;
	Wed, 10 Jun 2026 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082056; cv=none; b=VEkMUQC3PvtaLqEsSSpiPvjtLCjyINg5Wn6tYpnQ/ihOKVv6OWScrBfu4oPEFaujYZk3naS33+qaTqXyeKMej2ka22c4jpD2ZtjSqm4IxN7JiCgtLq7yOXisV/ay3MsrNbzAPCF5uiL7EY/GZFV9/Ycqy1q1MS1HpB0F+psT4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082056; c=relaxed/simple;
	bh=aAAsEb6UdG89giLX+n0FCtwGNbkv8VVF3X+AdqGsfRQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GkEBevGL/HR5qduRgyqz9fopbjAz7Usg6vg850hzx5PkUQO+jyOBB+/4GBVYr61sUj+fDpzh56JyFLEFJjeROJ+9bcLomNRk7iXsAqXCVogp3n19nslaA0DJP5bDIUvjpgsNvgJrBY1jg8iJy4G3WwiLv5jGO7Nkvc5csRVQMMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SuW3SZpe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SuW3SZpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24291F00899;
	Wed, 10 Jun 2026 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082054;
	bh=kMsVQi3orljSEvhMyPLIhta0ehH4Ys7jFOHwtglZDGE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SuW3SZpeXtKywlRGQRqMf83GIMeoG+6cVyHrFeSymZAyFIDD0DsP9Tt660M7uk0X1
	 eL6m/dpEGUaGSftJAx0Bh8I5enp+po3UrTt7xLoN6651ub22mu0WyYWkQOjnGlZ7Vf
	 Pf+mJXDxqWpqnS2T3A4Zl4uxHaGFHiLDcPgfilY/EOddg7gDe068WdKfp4YdrrH+OR
	 7yOPcTybmCdrEZufDNJM0FyyvjGhONtVwoJcm/FkAZklOo/WgD+7OkcYAOytRJ4yFH
	 vRPrRIdiheiE1/7uGZgaldTvVh/EWjdnYbalQ+5b0h2Qcq8oBjdHfxharAcIyGu0u1
	 f5bRctCuLIaWw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Boqun
 Feng <boqun@kernel.org>, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: page: add `SafePage` for race-free page
 access
In-Reply-To: <CANiq72kZQxLEXnz1U7K82TZJWYUF=8f=wC=RtTL26ADfr9RQJw@mail.gmail.com>
References: <20260605-page-additions-v2-0-03f04c8fdbbf@kernel.org>
 <20260605-page-additions-v2-1-03f04c8fdbbf@kernel.org>
 <HZuOc2PUMh5R8h7yC69l4I384agFUrcfrJrk7o9X2jR6aNPt9nrMOHWkc2G2ULw5H3iIbh6XL6ypXY4fmaqNDQ==@protonmail.internalid>
 <CANiq72kZQxLEXnz1U7K82TZJWYUF=8f=wC=RtTL26ADfr9RQJw@mail.gmail.com>
Date: Wed, 10 Jun 2026 10:46:53 +0200
Message-ID: <87cxxyhjeq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Jun 5, 2026 at 2:49=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>>      bindings,
>> -    error::code::*,
>> -    error::Result,
>> +    error::{
>> +        code::*,
>> +        Result, //
>> +    },
>>      types::{
>>          Opaque,
>>          Ownable,
>
>>  use core::{
>>      marker::PhantomData,
>>      mem::ManuallyDrop,
>> -    ops::Deref,
>> +    ops::{Deref, DerefMut},
>>      ptr::{
>>          self,
>>          NonNull, //
>
> The first hunk fixes the imports, but the second introduces an import
> in the wrong style.
>
> I think the first part should be in its own commit, and the second
> should be here but with the correct style.

This was sitting in my tree on top of already fixed imports. I probably
made a mistake when I separated it for submission.

I am looking forward to the day where rustfmt will be able to handle
this for us without the added slashes.

> But I just noticed the first part should also have been done as part
> of your other patch I applied yesterday, so I just rebased to fix
> that:
>
>   dea66841b9f8 ("rust: page: use the "kernel vertical" imports style").
>

Great, just the second part left then!

Best regards,
Andreas Hindborg


