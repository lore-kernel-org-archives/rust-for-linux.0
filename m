Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435A318BBD;
	Wed,  7 Jan 2026 19:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767814672; cv=none; b=NvCkrPEF4M0mSRXb74JkgiMPIjIm2cOVKC33l27gY9/6hEcSLp9KayhcLU3Ljs48kHmShOePZCSlmqXg84FvB0sQUNg6X/gm/Mdh0uSdhFk1YHSVIZFF6/UuHgAUc3cFp3fuEMGOZQNmiorOPU6CamsOUNhHI7vR2FweAgQmHog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767814672; c=relaxed/simple;
	bh=Ty0mH08R8taOYZWVj1//RGqLayt25IiEHIrs6er8LnE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rTl49VbNsF8KFVR0Id8x1srN/3dCyX17roNJo9mHhEquNWACl9lfubyAiI6DeKOjw+/YuTjMSad7vYAeAVW7bR4FC9EQ6ebTo3rXc36RJMrHDGDrrvjdfZqNHPVK5Kmj+Zsk80SnsxMpLVFqwYHd3sOzomwuo+RwAnXzlM+ACPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzbgpvcs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzbgpvcs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D97C16AAE;
	Wed,  7 Jan 2026 19:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767814669;
	bh=Ty0mH08R8taOYZWVj1//RGqLayt25IiEHIrs6er8LnE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Wzbgpvcsi6WSn3iRWsArHPsGRzouIyJ/R8VADB5ER+VYIMP+OcfHTsCcfxkCNvWYI
	 nemONCq63S5Ysu3QpZJAXMvqJxQGLPjVP9tA/3jV/tHqmcHBUvObK3hM236W4dYUVE
	 O8wuwMms5gM9hkJB3hrlL0FWels5bqhIjskWN+FmLCanqOgeHzTfUvw7+5wuTYDhxf
	 KSvR9TfYZK6WlHSAg+7wcxBc2qQyXfgcIhuGVNjtXZ/cKZwm8xojWZzFHNKsoK4wDK
	 FIu/QgY4gs+fsF8P7vdWezLUaqGiLXKj2fmk5nm3HHUWgPQJeIXTO8LD5f5zU3yoo3
	 KnSziHdW9PmPA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] rust: xarray: use `xas_load` instead of `xa_load`
 in `Guard::load`
In-Reply-To: <CAJ-ks9mXoTdOO+Zb9F=cpTrwa+XZ2mLb3NDH9pyd_GZhD2TVRQ@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-5-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9mXoTdOO+Zb9F=cpTrwa+XZ2mLb3NDH9pyd_GZhD2TVRQ@mail.gmail.com>
Date: Wed, 07 Jan 2026 20:19:12 +0100
Message-ID: <87eco1grin.fsf@t14s.mail-host-address-is-not-set>
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
>> Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
>> `xa_load` function takes the XArray lock internally, which would cause
>> a double lock since the `Guard` already holds the lock.
>
> This is not correct. `xa_load` takes and releases the RCU lock only,
> not the XArray lock.

You are right. However, we do not need to take the RCU lock either in
this case, right?

>
>> The `xas_load`
>> function operates on XArray state and assumes the lock is already held,
>> which is the correct API to use when holding a `Guard`.
>>
>> This change also removes the `#[expect(dead_code)]` annotation from
>> `XArrayState` and its constructor, as they are now in use.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/xarray.rs | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index f6e610b059625..0f69a523b72bf 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -215,8 +215,10 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<=
U>
>>      where
>>          F: FnOnce(NonNull<c_void>) -> U,
>>      {
>> -        // SAFETY: `self.xa.xa` is always valid by the type invariant.
>> -        let ptr =3D unsafe { bindings::xa_load(self.xa.xa.get(), index)=
 };
>> +        let mut state =3D XArrayState::new(self, index);
>> +        // SAFETY: `state.state` is always valid by the type invariant =
of
>> +        // `XArrayState`.
>> +        let ptr =3D unsafe { bindings::xas_load(&raw mut state.state) };
>
> Can this be a method on XArrayState?

OK.


Best regards,
Andreas Hindborg


