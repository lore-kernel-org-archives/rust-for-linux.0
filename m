Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F6F39E196;
	Tue, 24 Feb 2026 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940636; cv=none; b=MKpDj5tXKWMN5TN9TGqzWxxyhs1tevZ28KSlvA6n7tE8L3QdxQlUF7z55u5S9eUq/FeCNd4xqXNshcx6dguJOC9bWv++26zVX75KtHLwIz/fGVeP1pPyvifixRXyS/LPlDqNfeGHAfEQkK6Yc6jHwAspKMNGNoL49yG9EqG+q0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940636; c=relaxed/simple;
	bh=cf5jR5VnxDpEVpRWGkRobwj32v0PB+NedyrQEUkzTY8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CrXfhzEDrE5hjAiW0Xw7j0SSSIM8uM97L3Id5eYzGDo0Pi6cFfj+x1dQOEaV6jpP61DX3bsOaTJdWTNbFykklgDzno2hLVULvtgYGk8wjdO7K5/k6TxktuQkkjSdb/N8ePB53Icjfks1gBu1t3TomzDT6Fxyho9sXk0tisIZv1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5abUyVu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5abUyVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEA2C116D0;
	Tue, 24 Feb 2026 13:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771940635;
	bh=cf5jR5VnxDpEVpRWGkRobwj32v0PB+NedyrQEUkzTY8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b5abUyVuheZDAu6Ntgt3cKF1vnkvDOnrmp/gIwHIkSLBTcI1OfhuN3xc2RwVsKcZZ
	 ykgGKgHKgWXC4VtH+4hXtiwfbjdmdyHW16aYcbhvD4ZG5xmgUW933XxU6Sl44OznyV
	 J3rBRIlm3BGXeB25hv4VMPj4u6FbsKk1HF7W9C0yWuNmT50iw9LgCfrRp4nQGpnQkp
	 sEpzIKEWLSsukHB+ZmZ9SgYKjEWBwAwH5dhopKXq4oew19UpKnM7rDJD589x+AYK4b
	 jehMZ5sWor44SN3T3In6liByiLbb32F5wd6HgHTDhhLDtCoBd4BrRPZc/62nf+EWZ0
	 82Iwar1/ZthWQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Daniel Gomez <da.gomez@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman
 Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v3 02/12] rust: xarray: add debug format for `StoreError`
In-Reply-To: <CAJ-ks9k5=jGFWRsTmHbsvzJF3YTYzbDTQ43-uUNe8gaZfsnc8w@mail.gmail.com>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-2-f777c65b8ae2@kernel.org>
 <aYr-gyQN_AaIJkSH@macos>
 <CAJ-ks9k5=jGFWRsTmHbsvzJF3YTYzbDTQ43-uUNe8gaZfsnc8w@mail.gmail.com>
Date: Tue, 24 Feb 2026 14:40:51 +0100
Message-ID: <87v7fm1cpo.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Tue, Feb 10, 2026 at 8:45=E2=80=AFAM Daniel Gomez <da.gomez@kernel.org=
> wrote:
>>
>> On 2026-02-09 15:38, Andreas Hindborg wrote:
>> > Add a `Debug` implementation for `StoreError<T>` to enable better error
>> > reporting and debugging. The implementation only displays the `error`
>> > field and omits the `value` field, as `T` may not implement `Debug`.
>> >
>> > Reviewed-by: Gary Guo <gary@garyguo.net>
>> > Acked-by: Tamir Duberstein <tamird@gmail.com>
>> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> > ---
>> >  rust/kernel/xarray.rs | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> > index 88625c9abf4ef..d9762c6bef19c 100644
>> > --- a/rust/kernel/xarray.rs
>> > +++ b/rust/kernel/xarray.rs
>> > @@ -193,6 +193,14 @@ pub struct StoreError<T> {
>> >      pub value: T,
>> >  }
>> >
>> > +impl<T> core::fmt::Debug for StoreError<T> {
>> > +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Res=
ult {
>> > +        f.debug_struct("StoreError")
>> > +            .field("error", &self.error)
>> > +            .finish()
>> > +    }
>> > +}
>> > +
>>
>> Is there any best practice for when to include use core::fmt::*, so you =
can
>> avoid being verbose here?
>>
>> I see other cases like this, but I couldn't find anything in the code
>> guidelines.

I don't think there is a best practice here. I feel that if we only
invoke a path a few times, we might as well write it out at the use site
rather than clobber the name space of the compilation unit.

>
> It would probably be better to use kernel::fmt::* rather than
> core::fmt so that we can interpose our own trait in the future, if we
> want.

I'll change to `kernel::fmt::*`.

Best regards,
Andreas Hindborg


