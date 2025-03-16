Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FCF19E99E
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742117911; cv=none; b=q2k55wxNj/0/RPev5grP/xahREETUxy8VGSya678biF+jQXFj8bDgWHHMLw/mX+6YDUlCbmkcr+azQO5RH+vXZFNvWJYlsLIgzFgTvyeURQ7ttNB5WXuKy5br+tLielWNaC6pp1lquLDGDYuYU2I7CswP+XxZdsO08rYA5uNMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742117911; c=relaxed/simple;
	bh=J7/1vdj8nneciSa8vLeWPnzNNsedE3ufoPmVTtOClWc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHYTqo9Fqrf6pKTjsC2JG0m1qX9nfHXzdUczYz11YsjliXHkWQ0Gz6m9owzTrYTU5kDpfLX24hzMiqxkWiR4jSMCkG2417yroEjVjQiYzigmL4kjc/aXloXwD2NNs1lMSoP9Umc80PE9evtkEBXnF7UUOKaJcNXuuQx5s/DUUuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gmOuJu6W; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gmOuJu6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742117907; x=1742377107;
	bh=GmCXNEGbQLZHJKOrKDAEwYqiYZLmZ8D4z3kqARPP+Ro=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gmOuJu6WBinkInD/wASHWNwEHQqNQaHgxKeAJj+zKUQLP4iu6ZstbXy7wxP8y7gxn
	 INFQmhxEmD/t+3Vs7Zf1uavFfJ0NWG9FoJ+DyVkvp8DIVb44UQzwCRR5aqkuACG+Nh
	 4+n9p+iAlbmk97PmSgEaYZiM9beyRvdQYA8qg1w2Urj1LR2ynhnri+j1gIHfD8aQQ4
	 R8xHIMGAdDbNxu9oT1QIV6AigR61refR2jv5Gz0Ing+0bLvDeOuycyOIBen34pKFQB
	 KsohAugH+v43qFn3uH7Wx7ugLbdjDM/nVL0YtH8KRE3/k2MY0DiKXQy0UMdDY82iCw
	 iv5ulO7gdhm/g==
Date: Sun, 16 Mar 2025 09:38:23 +0000
To: Tamir Duberstein <tamird@gmail.com>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
Message-ID: <D8HL95D099MI.2N779RERY6DAE@proton.me>
In-Reply-To: <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
References: <20250315154436.65065-1-dakr@kernel.org> <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me> <Z9XIk3WpzruUfh6O@pollux> <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 359e9fe39f9384c4932854fa40805be140e72482
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Mar 16, 2025 at 1:33 AM CET, Tamir Duberstein wrote:
> On Sat, Mar 15, 2025 at 2:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> On Sat, Mar 15, 2025 at 05:44:29PM +0000, Benno Lossin wrote:
>> >
>> > What is meant by "copied"? I agree with Tamir, this can probably just =
be
>> > "taken ownership of".
>>
>> If not dropped in place, the only way to take ownership of the object is=
 to copy
>> the corresponding memory, i.e. the caller can not take ownership of the =
object
>> at its current memory location, since this memory is owned by the vector=
.
>
> I think this is the point I was trying to make: the language semantics
> are such that "taking ownership of" is equivalent to "become
> responsible for the dropping of", so it doesn't make sense to write
> that here, as though this requirement is specific to the semantics of
> this function.
>
>> AFAIU, when we speak of ownership, we mean ownership over a value or obj=
ect, but
>> not ownership over the underlying memory.
>>
>> Hence, I think it's important to mention that it needs to be either drop=
ped in
>> place or copied in order to take ownership.
>>
>> Even if we agree that "drop in place" is considered as "take ownership",=
 we need
>> to differentiate between the special case of taking ownership where its =
dropped
>> in place and the requirement to copy the value and then take ownership.

I get where you're coming from, but I wouldn't call that copying a
value. Copying for me means that there would be two instances of the
same object. But since the one in `[new_len, len)` will get invalidated,
I don't think that copy makes sense.

Also why even is this a safety requirement? There is `mem::forget`, so
doing `vec.set_len(0)` can also be done by safe code:

    while let Some(val) =3D vec.pop() {
        forget(val);
    }

I don't think this needs to be a safety requirement.

> Perhaps:
>
>> The caller must ensure the destructors of [`new_len`, `self.len`) are ru=
n exactly once.

Hmm that is not correct though, since

    let mut vec =3D vec![];
    vec.push(x.clone());
    vec.pop();
    vec.push(x.clone());
    vec.pop();

Drops the memory in `[0, 1)` two times.

---
Cheers,
Benno

