Received: from sender4-pp-f119.zoho.com (sender4-pp-f119.zoho.com [136.143.188.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE582221290;
	Fri,  2 Jan 2026 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767365080; cv=pass; b=hig14uGIcayYca/+SHYgP89BMw7acsWLtzfwqHs9noXPmqyFM/8zZtSYc8OrQWHEPBdfXgHpBZTiW7h7Ebx9qjr0Yx64ZJjwHSA2DEVzUDNSWKfI9ZzU7dMd74F8IMrlucRY7a/DEDSI6s5nJIsWWggrfUBO9559QZJHxutWEXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767365080; c=relaxed/simple;
	bh=lqJCxG2juNFdvdCIn+VExZGArjJR03QqWj0mZUlpO9o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=U6pNJ8QiRNJJ29/7DImge6tSTimMUexlULLHK0fp4CmQr2oIs11KVvG9zHMvprcA2HzRablD6guwRrTAlp+qCCDM6BDdaxS1EX0MIK0TUkrhc5cQLERBEk3nWd4gRMBwHDLt7siQhnepio3HG6RVyi9TuiYzvttcJ41gIEfzOpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=E3DGaFVX; arc=pass smtp.client-ip=136.143.188.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="E3DGaFVX"
ARC-Seal: i=1; a=rsa-sha256; t=1767365053; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PnTM7rIYFPxLDTnmnifeb8Aytc9WJpJX5vIbpSEjSDE7tuFKY5umyM2ZnVZ4nMAXJfHJEyKZFmCGBfPsOESu4jrZQqHUIZoA2csZOjO96Ht5a139gGsNFVdnLGom944Ypks7bhYOHXCT9Rq2NymDLOD8UTxDSjtLm5ZJNGfpyiQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767365053; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KNX2f6ql0yS43scpfuaZ+mZUEYYqAbjOFWYjUgB9iH0=; 
	b=E6KoFyDVxMDHm6XEezyUEpWKZKJUqVNSjcQRVHBV+yuR7ZkwZmhg0VwoB4D+lhCMMVQXcNm89/DNhBGWeVIAgaopEircIpAECYl8t1NqmD7sA7umbWtVEgPWNFzKscwEYcsxpGQ7UOldZSUMQZV9n6q8nrC8DjdyGHYJDmXX9/4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767365053;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=KNX2f6ql0yS43scpfuaZ+mZUEYYqAbjOFWYjUgB9iH0=;
	b=E3DGaFVXivvLQo5dsnJwxIXTvvQTbJqVycMrIhqL7gWx7RQhgNTkWygjdFqpLh7W
	QK+0aih3z0W9e3aBBF27t5IC6LwyYz/4SgBDcSgmTpIaAKAVFnBpmfOPCvFst1Pc8tm
	5kDCQVXrUSXlbgkdlLmqwo2IkLHzoxqtMQ/ueSFI=
Received: by mx.zohomail.com with SMTPS id 1767365051347840.5882897403643;
	Fri, 2 Jan 2026 06:44:11 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7] rust: add new macro for common bitmap operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAC=eVgQrDzQmOUFT7Tf-Y=dkohZC4+8w_qisz=p8kU38rgvrsQ@mail.gmail.com>
Date: Fri, 2 Jan 2026 11:43:54 -0300
Cc: Filipe Xavier <felipeaggger@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 felipe_life@live.com,
 linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <88BAA5DC-6025-45E4-88E8-396113766D32@collabora.com>
References: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
 <E88301E9-6142-491A-ADA2-F3BD8D9B92EA@collabora.com>
 <CAC=eVgQrDzQmOUFT7Tf-Y=dkohZC4+8w_qisz=p8kU38rgvrsQ@mail.gmail.com>
To: Kari Argillander <kari.argillander@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 1 Jan 2026, at 18:39, Kari Argillander <kari.argillander@gmail.com> =
wrote:
>=20
> to 1.1.2026 klo 22.23 Daniel Almeida (daniel.almeida@collabora.com) =
kirjoitti:
>>> On 1 Jan 2026, at 16:14, Kari Argillander =
<kari.argillander@gmail.com> wrote:
>>>=20
>>> =EF=BB=BFOn Thu, 1 Jan 2026 at 20:21, Filipe Xavier =
<felipeaggger@gmail.com> wrote:
>>>=20
>>>> +/// // Combine multiple permissions using operation OR (`|`).
>>>> +/// let read_write: Permissions =3D Permission::Read | =
Permission::Write;
>>>> +///
>>>> +/// assert!(read_write.contains(Permission::Read));
>>>> +/// assert!(read_write.contains(Permission::Write));
>>>> +/// assert!(!read_write.contains(Permission::Execute));
>>>> +/// assert!(read_write.contains_any(Permission::Read | =
Permission::Execute));
>>>> +/// assert!(read_write.contains_all(Permission::Read | =
Permission::Write));
>>>> +///
>>>> +/// // Removing a permission with operation AND (`&`).
>>>> +/// let read_only: Permissions =3D read_write & Permission::Read;
>>>> +/// assert!(read_only.contains(Permission::Read));
>>>> +/// assert!(!read_only.contains(Permission::Write));
>>>> +///
>>>> +/// // Toggling permissions with XOR (`^`).
>>>> +/// let toggled: Permissions =3D read_only ^ Permission::Read;
>>>> +/// assert!(!toggled.contains(Permission::Read));
>>>> +///
>>>> +/// // Inverting permissions with negation (`!`).
>>>> +/// let negated =3D !read_only;
>>>> +/// assert!(negated.contains(Permission::Write));
>>>> +/// assert!(!negated.contains(Permission::Read));
>>>=20
>>> I really like the OR (`|`) operator. Personally, I don=E2=80=99t =
like anything
>>> else. When
>>> a function or expression gets longer, something like let negated =3D =
!read_only;
>>> already feels strange to read.
>>>=20
>>> My suggestion is that everything else should be functions, so we =
would write:
>>>=20
>>> ```rust
>>>   let xxx =3D Permission::Read | Permission::Write;
>>>   xxx.remove(Permission::Write | Permission::Read);
>>>   xxx.toggle(Permission::Execute);
>>>   xxx.invert();
>>> ```
>>>=20
>>> This way we avoid expressions like:
>>>=20
>>> ```rust
>>>   let a =3D !(!xxx | yyy ^ zzz);
>>> ```
>>>=20
>> =E2=80=9C
>>> At that point, no one understands what is really happening anymore. =
People start
>>> wondering whether operator precedence or evaluation order matters, =
and may even
>>> have to go read the source code to figure it out.


Then don=E2=80=99t write convoluted expressions=E2=80=A6it=E2=80=99s not =
something you can
fix at the language level. What=E2=80=99s your take on the boolean =
operators,
by the way?


>>=20
>> I disagree. How would that look like given your suggestion?
>>=20
>>>=20
>>> By only supporting OR (|) as an operator and expressing everything =
else as
>>> explicit function calls, the code becomes much easier to read, =
review, and
>>> maintain.
>>>=20
>>>   Argillander
>>=20
>> How is A | B readable but not A & B or A ^ B?
>=20
> Because that is just a way to express multiple / group of Flags and =
nothing
> more. And thinking of this it could be even & operator. So we only =
allow

So A | B is =E2=80=9Cjust a way to express multiple flags=E2=80=9D =
instead of the much
more obvious A OR B? Same for A & B .

> creating / enabling / disabling / toggling for a group of flags. =
Everything
> still needs to be explicit. So we would end up with something like
>=20
> ```rust
>    Flags::new(A | B);

This is _much_ more straightforward:

+/// // Combine multiple permissions using operation OR (`|`).
+/// let read_write: Permissions =3D Permission::Read | =
Permission::Write;

>    toggle(A | B);
>    disable(A | B); // Or remove() (I do not have opinion)
>    enable(A | B);

Now we have to break extremely straightforward operations into multiple
function calls. This is not ergonomic.

>=20
>    // I would even consider & operator here as then you read it quite =
nicely
>    // toggle (A and B)
>    toggle(A & B);
> ```

Sorry, I don=E2=80=99t buy this syntax at all. What=E2=80=99s the =
difference between A | B vs
A & B in your proposal?

>=20
> Most annoying thing with flags is that if you need to enable 8 flags =
then some
> operator becomes a must. Still using those in everywhere is error =
prone and

So you=E2=80=99re proposing both operators and these functions?

> confusing. So I totally agreed that we need some way to express group =
of flags
> without always doing something like =
"t.enable(Flag::A).enable(Flag::B)"
>=20
> If this way is used it is really nice that every function get's =
documentation.

We do *not* need documentation for =E2=80=9Ctoggle()=E2=80=9D, =
=E2=80=9Cinvert()=E2=80=9D and friends.=20


> If we only allow | or & there is very little chance that someone mix =
what those
> means as it is always documented function call. Using operators too =
freely feels

No kernel developer is ever going to get confused by basic bitwise =
operations.

> very C++ in my opinion. Rust is very explicit language so let's not =
change that

How is C++ relevant here? Bitwise ops are used all over the place in C =
too.

> but let's still make it usable for our cases.

The language specifically allows us to build this API, so I see no =
problem with
the current approach. Your implementation is, in my humble opinion, a =
downgrade
w.r.t to what has been developed so far: it changes a syntax that =
everyone
understands in order to solve a problem that doesn=E2=80=99t really =
exist.

>=20
>    Argillander

