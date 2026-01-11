Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6924F3090D2;
	Sun, 11 Jan 2026 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768125898; cv=none; b=g18Ey+C0HpGoAvbiNticqog+ySTVMNMZwMnJczb3JCFfiXWOZ+eLCX/qaUxyXBF5+qiVloYajw6KnOiStBV35p1JL3SGz+7o2NJKD7U9YuoAi+eGdB68jtBeMtvm1cCvjVsbcyN1JQJQbPjcvBJSnXWZXUItgJWZjrJH9NW1Y78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768125898; c=relaxed/simple;
	bh=9aeQTQo9kDlwcHVNxOQcUfSPU8ZH2XLWz5dvrnTcIjo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=eYh/wUUexWo3Wmkp5rBPLMMvGOPjj7Q7hvtdqsrzYT2ZcZlZEHw9Y6d3pcyaw9TRaciKEc7W42Ev5F0LTJxvAbfdCEO+M0s6EP9JgSnd6UPRPmXb2lUrp5bZFKIugZoz4nOQu0uupeMMGNa62MONVfzZotlfyOsW0oli6+O5D+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTOu+BPp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTOu+BPp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600D0C4CEF7;
	Sun, 11 Jan 2026 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768125898;
	bh=9aeQTQo9kDlwcHVNxOQcUfSPU8ZH2XLWz5dvrnTcIjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTOu+BPpviRoOJI6i9YEapjhnbcMaINg9NkfZTAng0ryd/07htFbiYfP96O/vZSWG
	 TbGi+uHbg0MTFmrHV3aBYXUTx4p0vQgWGoj4Z9rCgh2THqLJ5JJwJHbSSIh90EucNC
	 LIkA++Z8rpGM6RYBS7C3tz7PRr/rKA+psZU6oJ+PwGTNKooLpYmjS1tt2MjZeBwEd6
	 Hob2BoDojFSUDG0ydCk8h2U8uCBDGx0y8QxzmXlHFfWPasQlHvbfWljhWUg5f1JiZw
	 rP1/fkmWVz56ThYuoEnD46RDcks56rS9Dv+pkdW9pfhU3s8oT3Omr0hM6Bj35L/eFj
	 m7yfpok5BDsTg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Jan 2026 11:04:53 +0100
Message-Id: <DFLOBHX35RHF.2T8D93SHY7QGX@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Alban Kurti"
 <kurti@invicto.ai>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 08/12] rust: pin-init: rewrite the initializer macros
 using `syn`
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-9-lossin@kernel.org>
 <DFK3R2EK1JGL.FFW73JGUSGP5@garyguo.net>
 <DFL43YZQJFBM.3D4VE24MIKLYZ@kernel.org>
 <DFL5I47BBJOB.3RLOS601BRLFU@garyguo.net>
 <DFLAKHLT86N8.11AVQHO5M8UC2@kernel.org>
 <DFLCXYSU8BET.13MZTJP38XZV0@garyguo.net>
In-Reply-To: <DFLCXYSU8BET.13MZTJP38XZV0@garyguo.net>

On Sun Jan 11, 2026 at 2:10 AM CET, Gary Guo wrote:
> On Sat Jan 10, 2026 at 11:18 PM GMT, Benno Lossin wrote:
>> On Sat Jan 10, 2026 at 8:20 PM CET, Gary Guo wrote:
>>> On Sat Jan 10, 2026 at 6:14 PM GMT, Benno Lossin wrote:
>>>> On Fri Jan 9, 2026 at 2:45 PM CET, Gary Guo wrote:
>>>>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>>>>> +                quote! {
>>>>>> +                    {
>>>>>> +                        #value_prep
>>>>>> +                        // SAFETY: TODO
>>>>>> +                        unsafe { #write(::core::ptr::addr_of_mut!((=
*#slot).#ident), #value_ident) };
>>>>>
>>>>> This should be `&raw mut` now?
>>>>
>>>> Yes, but that involves adding workarounds for 1.81 and earlier. I'll
>>>> leave it for a future series.
>>>
>>> You can just enable `raw_ref_op` feature globally. We've already enable=
d it for
>>> the kernel crate.
>>
>> It must be possible to compile the pin-init crate using a stable
>> compiler.
>
> pin-init crate just need to use the feature without any source code chang=
e.
> Enabling can be done from Makefile.

The tests as well as the examples need the workaround. Since we use
`#[test]` in `src/__internal.rs` we also need it in `src/lib.rs`.

> In fact, in e1dfaa33fd2d (rust: enable `raw_ref_op` feature) it has alrea=
dy been
> globally enabled for driver crates. You just might need to explicitly ena=
ble it
> for pin-init in rust/Makefile.

It's not about the kernel, but the user-land crate.

>> Enabling an already stable feature still causes a compiler
>> error (last time I checked). So we unfortunately can't enable it without
>> workarounds.
>
> stable_features is a lint that is globally allowed in our Makefile.

That's not enough, you still get an error on stable:

    https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D202=
4&gist=3D854ab9c0ffb47d78c9f9e6012deaf821

Cheers,
Benno
