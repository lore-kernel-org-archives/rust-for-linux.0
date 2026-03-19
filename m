Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F193A7827;
	Thu, 19 Mar 2026 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931480; cv=none; b=O7vRAFP+3gOHx9pFDOfwxi/g6lMrwAdSePdRlvcwoi22WpsXa83fXbekDv7eibkuwVUvO8UctEnGZVVGMjXUbQ2K02QhKhaAFUmPBeQANq87sC11+yUwCApDZX1HV8b109qflUmmNAqyxDEwEZAl7sUDLBe+uS6PpjnpLaAmXlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931480; c=relaxed/simple;
	bh=8ex0DKoC99q4scujUVQKWCd3EERcDbE6hVf6KEJVK50=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ZYqrtqgi+oZtuuJeWBy5Lnn700Fx/t/qDdh+IwatGgHdYouXzmV7aIkkx6STi3MVCzx9gVCAUHFyCeqnM4cx/TYqkDE7ZJment7gripBbagME+D+sVa5W2y5/EelQJE9rH8/aHlR1QP8s80WlrapyLEkZURP7VLkwyRxH41m4/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ex3KaiCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ex3KaiCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E9BC19424;
	Thu, 19 Mar 2026 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931480;
	bh=8ex0DKoC99q4scujUVQKWCd3EERcDbE6hVf6KEJVK50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ex3KaiCgn6vQhx5b02i117Rn+eb+ESOX9LnNtB01j0Er8b9/6AXbDbBP4lpvfHUq4
	 ogqn3WG1i5vxhIsqk2g/v92CMm6a9fjPPoiV+8R6bhHwuGbi7z6LrOSVvpzkMjzwYb
	 N4+5CqULSD3RN2WwNJ/ftb+jNqW+7wRaRX8E0XgyJsd1UEDwxwYfDFpMW0wAnxX1Hc
	 QG4KlXR0mp6wYSoKF7TKU6o10OOSDuw8IOX3myWL0lYfOpkoYjh59XcjBvN2On7HWA
	 soh6BflrcXsQCDQSiH5qacGAZDdY2Z0gYcDOM7wgHa5FCWR5kn0MjZs5yMn4svlJod
	 +9m5+6f6X6ZoA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 15:44:35 +0100
Message-Id: <DH6U85G4S7IZ.2JBY2FTMVSJB7@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Antonio Hickey"
 <contact@antoniohickey.com>, "Janne Grunau" <j@jannau.net>, "Christian
 Schrefl" <chrisi.schrefl@gmail.com>, "Oleksandr Babak"
 <alexanderbabak@proton.me>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] rust: pin-init: properly document let binding
 workaround
X-Mailer: aerc 0.21.0
References: <20260319093542.3756606-1-lossin@kernel.org>
 <20260319093542.3756606-3-lossin@kernel.org>
 <DH6PJM6X9R2C.29F8J9JWL2S9C@garyguo.net>
In-Reply-To: <DH6PJM6X9R2C.29F8J9JWL2S9C@garyguo.net>

On Thu Mar 19, 2026 at 12:04 PM CET, Gary Guo wrote:
> On Thu Mar 19, 2026 at 9:35 AM GMT, Benno Lossin wrote:
>> The three let bindings (in the bodies of `cast_init`, `cast_pin_init`
>> and the `init!` macro) are used to avoid the following compiler error in
>> Rust 1.78.0, 1.79.0, 1.80.0, 1.80.1, and 1.81.0 (just showing the one
>> for `cast_init`, the others are similar):
>>=20
>>     error[E0391]: cycle detected when computing type of opaque `cast_ini=
t::{opaque#0}`
>>         --> src/lib.rs:1160:66
>>          |
>>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>)=
 -> impl Init<U, E> {
>>          |                                                              =
    ^^^^^^^^^^^^^^^
>>          |
>>     note: ...which requires borrow-checking `cast_init`...
>>         --> src/lib.rs:1160:1
>>          |
>>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>)=
 -> impl Init<U, E> {
>>          | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
>>     note: ...which requires const checking `cast_init`...
>>         --> src/lib.rs:1160:1
>>          |
>>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>)=
 -> impl Init<U, E> {
>>          | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
>>          =3D note: ...which requires computing whether `cast_init::{opaq=
ue#0}` is freeze...
>>          =3D note: ...which requires evaluating trait selection obligati=
on `cast_init::{opaque#0}: core::marker::Freeze`...
>>          =3D note: ...which again requires computing type of opaque `cas=
t_init::{opaque#0}`, completing the cycle
>>     note: cycle used when computing type of `cast_init::{opaque#0}`
>>         --> src/lib.rs:1160:66
>>          |
>>     1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>)=
 -> impl Init<U, E> {
>>          |                                                              =
    ^^^^^^^^^^^^^^^
>>          =3D note: see https://rustc-dev-guide.rust-lang.org/overview.ht=
ml#queries and https://rustc-dev-guide.rust-lang.org/query.html for more in=
formation
>>=20
>> Once we raise the nightly-MSRV above 1.81, we can remove this
>> workaround.
>>=20
>> Link: https://github.com/Rust-for-Linux/pin-init/commit/bb3e96f3e9a4f5fc=
a80a22af883c7e5aa90f0893
>> [ Moved this commit after the previous one to avoid a build failure due
>>   to unstable features. Changed the cfg to use `USE_RUSTC_FEAUTURES`.
>>   - Benno ]
>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
>
> Perhaps we should import review approvals on GitHub as R-bs.

Yeah we should. A quick internet search didn't reveal a magic tool to
me. Do you know of any?

Cheers,
Benno
