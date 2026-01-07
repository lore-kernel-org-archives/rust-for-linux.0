Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D51369970;
	Wed,  7 Jan 2026 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811741; cv=none; b=sV10iMT58yNVO92ym4Aeb8TdFhQPi1ifpUEHhpftZDpkcgIVjy3t4uVhg7ruxcepbNTXBNa4+9Zs+8H4uJ0Yuk6XPlCmRYeOrbsDABFSM3LvlWm08OUj9nzQFY82ZfHgwb1f9VnajJk8EZwobktcTWMPkuiCyxnt9tx+TjUWCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811741; c=relaxed/simple;
	bh=jxhrrWCWKF+iobfB6QzLTdwB5bWVqxKbDC6Khq5bt8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HT5J0J2+2qTBzR7tHiTCTBClohuA5NwAQ5RYS0KGNioDUHl3H/srzwlk/ALQ0eWFpb/23RKokcN+YLKSUBkexylLexY/6QAb2Ay0JFKySwGtRllOTC1pKAbJYXLFyWD9mGI6KejKTyhFX8aunouamM16t9h2Mn/vQF99psns/MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQ0QbSeM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQ0QbSeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73882C4CEF1;
	Wed,  7 Jan 2026 18:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811740;
	bh=jxhrrWCWKF+iobfB6QzLTdwB5bWVqxKbDC6Khq5bt8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YQ0QbSeMiWJDjQi8rv5sNY7Z4WlpmdXW7s6HX3ZBHbEVrIHyctkZWQTNSWjpCW8MW
	 qBG7b5D5nZEWHepZmegCfrzzeWAVViTtNgBouHQ55jrMToDnN9Pz2/hBZsZ3QqGbAd
	 DZmDAhCYBVHfAyHzC9xCF8wP9MaxeVOLk9PanlTeLJfkZQzNjGj8LnQoktKVI18Ymh
	 TgEN9LueeVTM4zTrdIdiExzEodZsxUXQ3csNkWJnKXoKCLjeyjn4OlIzB8XQd0mbL7
	 6FfXRf1XOzf7EkKoYDfzrqQWN11U/wpcqcRzB71moVtNcSu0FAQdOEg9RV2GU0klm7
	 y6QqVLUL/gXdg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] rust: xarray: add `XArrayState`
In-Reply-To: <CAJ-ks9koBuQabEc7VKAPt1kSLbLyv21NuaNkBOb0FGvZ2hBLPA@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-4-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9koBuQabEc7VKAPt1kSLbLyv21NuaNkBOb0FGvZ2hBLPA@mail.gmail.com>
Date: Wed, 07 Jan 2026 19:48:49 +0100
Message-ID: <87h5sxgsxa.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Add `XArrayState` as internal state for XArray iteration and entry
>> operations. This struct wraps the C `xa_state` structure and holds a
>> reference to a `Guard` to ensure exclusive access to the XArray for the
>> lifetime of the state object.
>>
>> The `XAS_RESTART` constant is also exposed through the bindings helper
>> to properly initialize the `xa_node` field.
>>
>> The struct and its constructor are marked with `#[expect(dead_code)]` as
>> there are no users yet. We will remove this annotation in a later patch.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/bindings/bindings_helper.h |  1 +
>>  rust/kernel/xarray.rs           | 41 ++++++++++++++++++++++++++++++++++=
++++++-
>>  2 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_he=
lper.h
>> index 2e43c66635a2c..86bca946faff0 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -109,6 +109,7 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_=
PRESENT;
>>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
>>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
>>  const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
>> +const size_t RUST_CONST_HELPER_XAS_RESTART =3D (size_t)XAS_RESTART;
>
> Can we avoid casting it here? It's quite distant from the site of use
> which makes it difficult to understand why it's necessary. It also
> suffers from C casting rules being quite lax, which means a change in
> the type on the C side would likely go unnoticed.

Yes, we should probably use `*mut bindings::xa_node` for this type, then
the casts at the use side in Rust will go away as well. I'll try that.

>
>>
>>  #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
>>  #include "../../drivers/android/binder/rust_binder.h"
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index ede48b5e1dba3..f6e610b059625 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -8,7 +8,10 @@
>>      iter,
>>      marker::PhantomData,
>>      pin::Pin,
>> -    ptr::NonNull, //
>> +    ptr::{
>> +        null_mut,
>> +        NonNull, //
>> +    },
>>  };
>>  use kernel::{
>>      alloc,
>> @@ -319,6 +322,42 @@ pub fn store(
>>      }
>>  }
>>
>> +/// Internal state for XArray iteration and entry operations.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `state` is always a valid `bindings::xa_state`.
>> +#[expect(dead_code)]
>> +pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
>> +    /// Holds a reference to the lock guard to ensure the lock is not d=
ropped
>> +    /// while `Self` is live.
>> +    _access: &'b Guard<'a, T>,
>
> Can this comment explain why this isn't a PhantomData? IIUC we just
> need the lifetime, rather than the actual guard.

This can be a PhantomData. The use of the reference is leftover from
earlier prototypes. I'll change it.

>
>> +    state: bindings::xa_state,
>> +}
>> +
>> +impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
>> +    #[expect(dead_code)]
>> +    fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
>> +        let ptr =3D access.xa.xa.get();
>> +        // INVARIANT: We initialize `self.state` to a valid value below.
>> +        Self {
>> +            _access: access,
>> +            state: bindings::xa_state {
>> +                xa: ptr,
>> +                xa_index: index,
>> +                xa_shift: 0,
>> +                xa_sibs: 0,
>> +                xa_offset: 0,
>> +                xa_pad: 0,
>> +                xa_node: bindings::XAS_RESTART as *mut bindings::xa_nod=
e,
>
> Odd that we're casting it back to a pointer here.

Yes, full cycle. I'll try to use the pointer type for the constant.

Thanks for the comments.

Best regards,
Andreas Hindborg



