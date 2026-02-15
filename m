Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EE72D2495;
	Sun, 15 Feb 2026 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771167454; cv=none; b=XEjQPV3fABOQrzXH+AERyQUpzMGbFPAeHH6ZG0IMzWxufuNW3coyEwHthq04czAlZTn+oUHwES7ts0irVqecvdUa8vIipK0uely93WhcQWXCTCqMGDZnxOQ+RMrqqONTPbwV88YFSVLTHUH9LZbxDkmsw9bjQl3czNjzDgsL5lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771167454; c=relaxed/simple;
	bh=Psw2VYwhtNxVXCKhISIeM3WZ7ai4eDZyVHmrNqoV/xg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ukdo2VdCU0oooAx05+O9QsI8VQR32opIDNk2lnyFT8r+7xCUtiGs3QU2DsVWdpFAx80ZMG4qurcnZykvhWMztCBjIVZK0poTJcocLKbZw7c8+ceDJZJNQPUlAxbncYg4vR2uh+zrY+Iowt+vxhUeW4e10rHDQglpo82cEq7siLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grdYpRUP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grdYpRUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A36C4CEF7;
	Sun, 15 Feb 2026 14:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771167453;
	bh=Psw2VYwhtNxVXCKhISIeM3WZ7ai4eDZyVHmrNqoV/xg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=grdYpRUP5bjxoAhUiHuUV5ciM1hnqbDd+WjF8uS9CGjrI/wEzjMkot713qghzOp38
	 EfO8Tq2iogqFO3H6RDCYTGIojuHcYOX+AnaYu2wOWk13LNwiCLqZDyeTct4K7ZMsWd
	 yxIC1nABYLBzPNeuRynBz4JNBSqlZCFuSyes9l83RkTC6GWrnhgujmQV66hfJY49Md
	 QhS17CV88YLWGFjsJUykgQYK+dr3w+0U3Z9r6w5WSGa/0hCMg7kNguNJXJH6hcAg7y
	 Y57NEo6DRic911R7imuXMj6SdDiJUMWVgKH71z4x3t4YzKPMbQnPcJ4G36VSLetpub
	 XnHKWva0qIL6w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 15:57:27 +0100
Message-Id: <DGFMGKUGVR3W.2M0G11JM7MG13@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215132232.1549861-1-lossin@kernel.org>
 <CAJ-ks9kJshm9YYEDYPVXmG8hGandsaEGe9gwEuCZsoxd73CbHA@mail.gmail.com>
In-Reply-To: <CAJ-ks9kJshm9YYEDYPVXmG8hGandsaEGe9gwEuCZsoxd73CbHA@mail.gmail.com>

On Sun Feb 15, 2026 at 3:24 PM CET, Tamir Duberstein wrote:
> On Sun, Feb 15, 2026 at 8:22=E2=80=AFAM Benno Lossin <lossin@kernel.org> =
wrote:
>>
>> `clippy` has changed behavior in [1] (Rust 1.95) where it no longer
>> warns about the `let_and_return` lint when a comment is placed between
>> the let binding and the return expression. Nightly thus fails to build,
>> because the expectation is no longer fulfilled.
>>
>> Thus replace the expectation with an `allow`.
>>
>> Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>> ---
>>  rust/pin-init/src/lib.rs | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
>> index 49945fc07f25..fe4c85ae3f02 100644
>> --- a/rust/pin-init/src/lib.rs
>> +++ b/rust/pin-init/src/lib.rs
>> @@ -1143,13 +1143,13 @@ unsafe fn __pinned_init(self, slot: *mut T) -> R=
esult<(), E> {
>>  ///
>>  /// - `*mut U` must be castable to `*mut T` and any value of type `T` w=
ritten through such a
>>  ///   pointer must result in a valid `U`.
>> -#[expect(clippy::let_and_return)]
>>  pub const unsafe fn cast_pin_init<T, U, E>(init: impl PinInit<T, E>) ->=
 impl PinInit<U, E> {
>>      // SAFETY: initialization delegated to a valid initializer. Cast is=
 valid by function safety
>>      // requirements.
>>      let res =3D unsafe { pin_init_from_closure(|ptr: *mut U| init.__pin=
ned_init(ptr.cast::<T>())) };
>>      // FIXME: remove the let statement once the nightly-MSRV allows it =
(1.78 otherwise encounters a
>>      // cycle when computing the type returned by this function)
>> +    #[allow(clippy::let_and_return)]
>
> Consider adding `reason =3D "..."`.

Isn't the FIXME comment directly above enough? I don't want to duplicate
the information and the string constant explaining the reason looks
ugly.

Cheers,
Benno
