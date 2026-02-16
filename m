Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C492F7462;
	Mon, 16 Feb 2026 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236754; cv=none; b=D+lLIZVKVG1LDMkZrNnHYLepzaVPnb/91aUap07ZQqEIBMbfvKhJqb85U7gT74W1H3kLw93OYZiVbRhfhhakhVBp1/8R5kzq/P5XK0y79Sj8TUHzOE/Ft5PLL1pqH8Z4frrN4EpuUzT9J0bCYHne3SYhfFUOkUpzHkuC5zZzOOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236754; c=relaxed/simple;
	bh=/yfHunmZ4SaVoMNc0//WM/Xi5LJwVTqM+HccPPVoi8A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WAC23VbP+MKc1GVEao+yag73hFk8gv32xTZ62ElbP0IX1H+WexLsl29mZ9hShHeoA5CoimOent2MVzJMYZcbutu5SJoKv5oE1drH2DlARlNVgzbhQq7NO4vuq3v3ktde9v3fWjwAVK1/lturbalzYIDzMeaI+sSEtza5fRvc9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apqzaVhZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apqzaVhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4220C116C6;
	Mon, 16 Feb 2026 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771236753;
	bh=/yfHunmZ4SaVoMNc0//WM/Xi5LJwVTqM+HccPPVoi8A=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=apqzaVhZyL2U4yFAp4dwVGRbHgSrIiY/+MVY67cRwUHRjdhRIaTZtYg28amRIF+Wo
	 7StatNYNrZDLp00qj+nRTx4xw8P8Bqs7/UmMUDGhG9mdyWbSiiAfSv5XjMVL/0c2wd
	 oo5lI99QEPFn5hNXdHn3xO3FLSUtrQU2iWoIdmW4WM2rYc8bHT8gYbFAgQ52dpJVFg
	 3sDJjuwCGXfGFQ2mmttSk4lUbK4TNAyPu/xTPK60p8luMOlU//uDQNTboh0rqo0oJg
	 TDL0Sma6qhLZH+y8uLtbYYxttB01/fabuvD53Bajs9/2n4acc9gW9whSgOachUz8L6
	 02cuqD5EcZ9Uw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 11:12:29 +0100
Message-Id: <DGGB0XJI8MAK.1HJI01HG3IBH9@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: add `UniqueArc::as_ptr`
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215-unique-arc-as-ptr-v1-1-bdf4b3174475@kernel.org>
 <ruWLPybrInMfRz5QD44emTcz-K3W4N_FWZx5qBX2NS9wK_Qrraeve1Qmgv7R47TD7IdO9aZorCQS0B03KCCstA==@protonmail.internalid> <DGFXA113B8XT.2IPBLCLYT1X5O@kernel.org> <87fr71duv2.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87fr71duv2.fsf@t14s.mail-host-address-is-not-set>

On Mon Feb 16, 2026 at 8:13 AM CET, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>
>> On Sun Feb 15, 2026 at 9:38 PM CET, Andreas Hindborg wrote:
>>> Add a method to `UniqueArc` for getting a raw pointer. The implementati=
on
>>> defers to the `Arc` implementation of the same method.
>>>
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>>  rust/kernel/sync/arc.rs | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
>>> index 289f77abf415a..9c70fdd39bd2f 100644
>>> --- a/rust/kernel/sync/arc.rs
>>> +++ b/rust/kernel/sync/arc.rs
>>> @@ -770,6 +770,11 @@ pub fn new_uninit(flags: Flags) -> Result<UniqueAr=
c<MaybeUninit<T>>, AllocError>
>>>              inner: unsafe { Arc::from_inner(KBox::leak(inner).into()) =
},
>>>          })
>>>      }
>>> +
>>> +    /// Return a raw pointer to the data in this unique arc.
>>> +    pub fn as_ptr(&self) -> *const T {
>>
>> This should be an associated function instead of an inherent method.
>
> I think this is so that we always call the function on the intended
> object rather than going through Deref. Could you please clarify if this
> is correct?

If you declare an inherent method on a type that is `Deref` (or
`Receiver`), then you can never call a method with the same name on the
object it derefs to:

    struct MyThing;

    impl MyThing {
        fn as_ptr(&self) -> *const () { /* ... */ }
    }

    let my_thing =3D UniqueArc::new(MyThing);
    let _: *const MyThing =3D my_thing.as_ptr(); // this is the method from=
 `UniqueArc`
    // to call the other one, we have to write:
    let _: *const () =3D MyThing::my_thing(&*my_thing);

Especially a function with the name `as_ptr` should be associated, since
both very likely return a pointer; this increases the likelihood of
accidentally calling the wrong one.

Cheers,
Benno
