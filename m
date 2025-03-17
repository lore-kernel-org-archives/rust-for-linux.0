Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB2C183098
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742232839; cv=none; b=ZJT8OMVNBqcz1i5VJAsKE0ql6nrW4O2kvj2+EEtppxjyWwJ3aj6Au/nhgO2Ky2xDzvQZ0C5g24yGaFpZmBuS5ScSPA+DeGOYebBOrrKsud2ByMX4zQI3ABL2GpDx/Jg/1VFxCYrSTu0OeR5mQlIOkLcImQx0LTJsA82iexMyoxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742232839; c=relaxed/simple;
	bh=xZ5L5BGF+MIp5FZlTUfJqupUzzapAQVDUg6WsbJwBD0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONNCBVqpwMN8QnF4jcaHtEGg98YlFsEYNqMhlVIueW5PRWLflaeKAx4MyRbkTTxJva0N02fpyGkLOYqQGnnhLSkzrgiqapjJ9DWAsQ3U2C/xODrVP7HwRCig/JoEtRzj/lP0AGNVuOXW13oYYpRGEbmQm8dmscWMETwBKDpC0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KLHdPLlR; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KLHdPLlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742232835; x=1742492035;
	bh=mxqxLcfksY00NnDVH8r+4SUlKm30JD2P6UggtIQDaQ4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=KLHdPLlRrRwMmqWJJeanBCkkgNFg1DhodSkceRigD8BWVc+pnxMSxtBshooJX2qtr
	 l9qnM/cOKY61abTLJJb2XoyL9Kr3MZWFPVxzp4zm2Lr3xUPW9SZuUW6MY3a7ON+ID4
	 V1llocXEtfKPVzzSK0AM1AiVTOjnvBMhsmR1zJSh75c7h+vCmPzy98xpC6E4MH7CDO
	 zgUOf4sGsY6VpOhzvnPPqQP8RV0elh5o8ooj0cFRwO7I7+I31GLVQy2GwZhpM5l/JB
	 tub/g8vhqVMRQ7Qndfj6Uj8uF/mPFrNOP1HD5XEMmz7SF8mwh5dLSfEa1gbj3f9boI
	 cwzV0Kp7iA/gQ==
Date: Mon, 17 Mar 2025 17:33:51 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
Message-ID: <D8IPZQHSFFUP.KRO1145IG1RQ@proton.me>
In-Reply-To: <Z9hGcClQXpEYUYZp@cassiopeiae>
References: <Z9XIk3WpzruUfh6O@pollux> <Z9bWODCNNEq3xI51@pollux> <D8HVI9K91JWV.NHOPVELH5JE5@proton.me> <Z9cfkKTVKtc3imyK@pollux> <Z9ch0fgUI-V-rlGr@pollux> <D8IG67RM4H53.2K2AW01FZLWJM@proton.me> <Z9gDt9JbqvoTFORV@pollux> <D8IMOAKHKYGP.32PTT2W55UH6L@proton.me> <Z9hGcClQXpEYUYZp@cassiopeiae>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: af7c48d041932251d55b38105aff9b39232ed11f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 17, 2025 at 4:57 PM CET, Danilo Krummrich wrote:
> On Mon, Mar 17, 2025 at 02:57:51PM +0000, Benno Lossin wrote:
>> On Mon Mar 17, 2025 at 12:12 PM CET, Danilo Krummrich wrote:
>> > On Mon, Mar 17, 2025 at 09:52:07AM +0000, Benno Lossin wrote:
>> >> On Sun Mar 16, 2025 at 8:09 PM CET, Danilo Krummrich wrote:
>> >> > On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
>> >> >> But let's define it then; what about:
>> >> >>=20
>> >> >> "[`Vec::set_len`] takes (or kepps) ownership of all elements withi=
n the range
>> >> >> [0; `new_len`] and abandons ownership of all values outside of thi=
s range, if
>> >> >> any."
>> >> >>=20
>> >> >> The caller may take ownership of the abandoned elements."
>> >> >>=20
>> >> >> I'd argue that giving up ownership, while offering someone else to=
 take it means
>> >> >> that it implies that otherwise we'll just end up forgetting about =
the value.
>> >> >
>> >> > Btw. I'd still prefer if we could enforce that the caller has to do=
cument what
>> >> > should happen to the abandoned value. But I acknowledge that the sa=
fety comment
>> >> > isn't the scope for it.
>> >> >
>> >> > It'd be great if e.g. clippy would give us a tool to do something a=
nalogous to
>> >> > safety comments.
>> >> >
>> >> > It think it would be useful to enfoce some additional safety docume=
ntation. For
>> >> > instance, I think the kernel would much benefit if we could enforce=
 that
>> >> > mem::forget() must be justified with a comment, since as mentioned =
ina previous
>> >> > mail, it can cause fatal bugs, for instance when used on lock guard=
s.
>> >>=20
>> >> I get where you're coming from, but this probably will very quickly g=
et
>> >> out of hand.
>> >>=20
>> >> For example, I can define `forget` safely:
>> >>=20
>> >>     fn forget<T>(value: T) {
>> >>         struct Cycle<T> {
>> >>             this: RefCell<Option<Arc<Self>>>,
>> >>             value: T,
>> >>         }
>> >>         let cycle =3D Arc::new(Cycle { this: RefCell::new(None), valu=
e });
>> >>         *cycle.this.borrow_mut() =3D Some(cycle.clone());
>> >>     }
>> >>=20
>> >> How would you ensure that this kind of pattern doesn't get written
>> >> accidentally (or with many indirections)?
>> >
>> > I don't think that the possibility of writing safe (but yet buggy) cod=
e is an
>> > argument against having the possibility of enforcing that a caller mus=
t write a
>> > comment for justification on certain things, such as mem::forget().
>>=20
>> My argument is that the problem of forgetting a value is not
>> self-contained like `unsafe` code is. Even if we were to document all
>> `forget` or `ManuallyDrop::new` invocations (which we definitely should)
>> we wouldn't get the security that one can't accidentally forget a lock
>> guard. I'm totally in favor of mandating an explaining comment above
>> `forget` calls (but not as a `SAFETY` comment).
>
> Oh, I see where the misunderstanding might lie.
>
> Let's take a look at FileDescriptorReservation::fd_install(). My proposal=
 is to
> have something like:
>
> =09// SANITY: `fd_install` consumed file descriptor
> =09core::mem::forget(self);
> =09// SANITY: `fd_install` consumed file reference
> =09core::mem::forget(file);
>
> Where we have e.g. clippy to complain if there is no "SANITY" (or whateve=
r we
> call it) comment for mem::forget().
>
> I'm not proposing a SAFETY comment.

Ok, that's good :)

As for having a dedicated `SANITY` comment, I'm not sold yet. I'll think
a bit more.

>> > But there's another reason I think having something like this could be
>> > problematic: It might set the wrong incentive, as in "hey, I can just =
use a
>> > "sanity requirement" in my function rather figuring out how to ensure =
it through
>> > the type system, etc.".
>>=20
>> I don't understand your point here, can you explain it more?
>
> Does the explanation above make this concern clear for you?

Do you mean having sanity requirements would lead to people putting less
effort into designing a type system solution?

---
Cheers,
Benno

