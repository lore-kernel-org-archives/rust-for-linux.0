Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC1255E43;
	Wed,  7 Jan 2026 19:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767814675; cv=none; b=i/bGMG0M5rA54Un+2Jt6rRjOZrXQDCf30i2qEGR+LYzkuCdIvP598c94HZG6k78isNSqw2sWXsdS1HWMFAyy4IG5ex+kdq2EaMfN1lEFfDpQ7EqsepeBKt2Umea5wq805y43a8A2iDLd9jJoCU9q3RnUlDAcc8iNlOYGDQu4UC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767814675; c=relaxed/simple;
	bh=24akQf0JztA2i4HZi6sMEr+JoX2lJj84FkhUxIm1Hxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uyiBej3U2y+VtDgxZoHhdRt0A3sXu8GZP8lJVLH9c3vwDWrIf3bqRt0Y4IueP8FLVXeaul+DKLHB0dw5RAyCh30OnctKjG9ZjPhDIohDsPvvDJKy47FdhpXVPAuNt5cXa8lbb0XRKeECNCIX9NzFdCYwvfsVa/HobDXm86JR8cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSltvVNB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSltvVNB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50658C4CEF1;
	Wed,  7 Jan 2026 19:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767814672;
	bh=24akQf0JztA2i4HZi6sMEr+JoX2lJj84FkhUxIm1Hxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qSltvVNBS3JFiBR/w7VO4aObeLGZN3gpFYkg6OLKpXB2iA1sCb06g5QcuBAiirmJ2
	 trMqs201ozkJa8ihf+6YuBLH91t/VxNPCOIFEAZahUz1fqBALdcjAYGaRNS0b2+o3W
	 zTpjOqUV0jkC/cqVoOr8Of9aZwMlCYl5fpb3RfzOtK8OmTh0DH+wbcGGiaeL6ZEg8j
	 o1/P//CHfkoRYq8F8x1DcTpCBRRBcwb9QvSu42MJ12b5F8fHU9a7Jl7lCvk/CRF8bw
	 sgzrdkfIEZbmokrprNwqz7dD8By+jVeMbXUIEIMqbjj6xv/by9EneSVwfMPgCnl00m
	 uCk3v7Wi0+bwQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] rust: xarray: add `find_next` and `find_next_mut`
In-Reply-To: <CAJ-ks9=gx=Qea4NYSLwTfZtQkwgV-WOjR_A_d2US=ZCNP9jxCQ@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-7-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9=gx=Qea4NYSLwTfZtQkwgV-WOjR_A_d2US=ZCNP9jxCQ@mail.gmail.com>
Date: Wed, 07 Jan 2026 20:29:18 +0100
Message-ID: <878qe9gr1t.fsf@t14s.mail-host-address-is-not-set>
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
>> Add methods to find the next element in an XArray starting from a
>> given index. The methods return a tuple containing the index where the
>> element was found and a reference to the element.
>>
>> The implementation uses the XArray state API via `xas_find` to avoid tak=
ing
>> the xarray lock that is already held by `Guard`.
>
> Similarly to the commit message introducing the use of `xas_load`,
> this is not correct because `xa_find` takes and release the RCU lock
> only, not the XArray lock.

Right, thanks for pointing that out.

>
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/xarray.rs | 65 ++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 65 insertions(+)
>>
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index ca97134ba2bd0..9d4589979fd1d 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -255,6 +255,71 @@ pub fn get_mut(&mut self, index: usize) -> Option<T=
::BorrowedMut<'_>> {
>>          Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
>>      }
>>
>> +    fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_void>=
)> {
>> +        let mut state =3D XArrayState::new(self, index);
>> +        // SAFETY: `state.state` is always valid by the type invariant =
of
>> +        // `XArrayState` and the caller holds the lock.
>> +        let ptr =3D unsafe { bindings::xas_find(&raw mut state.state, u=
size::MAX) };
>> +        NonNull::new(ptr).map(|ptr| (state.state.xa_index, ptr))
>> +    }
>
> Can this be a method on XArrayState? It seems odd to document a remote
> type's invariant here when we could put that justification on the type
> itself.

Good idea, I'll move it.


Best regards,
Andreas Hindborg

