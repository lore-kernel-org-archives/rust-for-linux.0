Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F12E8B67;
	Sun, 15 Feb 2026 23:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771198977; cv=none; b=dKx853CEEqi2Qf752SJem7Nxr9y7KhQP51gftZseQZc8Y6Wpct/6saQMHFUKW0XV/x7RlGohGdy2gB/o5niMaPcOufb15CpOFFnZVeNcY4f9Jn4SFyBv0o4WGVUWE9icqCZkFhrdlspemSTcQKeWz5N49NG/avcCXIViFfrAlNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771198977; c=relaxed/simple;
	bh=qqC9HrMhIT+xHKTN/Q9QcHdlf8LN/HZZRbgxc5py8h4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MccTWBbZutJEpmfr/lDfH0T7RGDTdIKEkLExd53AnE80wrAgBOfnnq1WmNOd3bUAFIbl8Je57cUspUufw9Wbwa9mBr5QGdMtbj4lRrbYmEXfzxU/doWso5F5//TU2O9POIgUNO3l5IudlKdt2L1Y9vpv2OmGsHqN/R12sacxwUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejuvDRaa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejuvDRaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012C0C4CEF7;
	Sun, 15 Feb 2026 23:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771198976;
	bh=qqC9HrMhIT+xHKTN/Q9QcHdlf8LN/HZZRbgxc5py8h4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ejuvDRaa8jlRG4OYjh/w0lHsa7NJToZdvYJokX3+FlwRfAo4sNnRcHXEhYWJBTceM
	 anhIJkGGeoXIvityw2DZZHlwspdKVMowAw5nnw7TmibRLSZjL07ItMbwIhENT1zK0h
	 rptOd8bNesUbq4UjshVGWqG2wcNtcMdNSKnOaXxz78zyS07+KjzWxRZcBOdaYTrcwH
	 Y7L+HJcR+V/gQFguUApHVXd0UUBrjvIn+Q5zxtoV5pGF4I7/zZuUdjVKNfzb1chq9w
	 YDfgbsCcLupQ1v2XItMEpwKLmW9454EhnY8ObteRmvdf5qBk8siRvBVS7bt/1W5434
	 6gHeZVOsgVVUw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: page: add method to copy data between safe pages
In-Reply-To: <CANiq72kovxkiF1Kj66yVyQYKx1OijjtTGB6UN5M35th57UFFeQ@mail.gmail.com>
References: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org>
 <20260215-page-additions-v1-2-4827790a9bc4@kernel.org>
 <g4ihY-XQwSZ3ysINoU0v3jFzzJG7Uzonq0b6C-EYEYDx4pbJWHHJ1hYmQsmGATIDzexHv6NFea8YNikY6zXq6w==@protonmail.internalid>
 <CANiq72kovxkiF1Kj66yVyQYKx1OijjtTGB6UN5M35th57UFFeQ@mail.gmail.com>
Date: Mon, 16 Feb 2026 00:40:21 +0100
Message-ID: <87ldgteftm.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Sun, Feb 15, 2026 at 9:04=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> +    /// Copies data from this page to another page at the specified off=
set.
>> +    ///
>> +    /// # Arguments
>> +    ///
>> +    /// - `dst` - The destination page to copy data to.
>> +    /// - `offset` - The byte offset within both pages where copying st=
arts.
>> +    /// - `len` - The number of bytes to copy.
>
> We generally try to avoid this kind of argument-by-argument docs
> unless they are really needed.

Why?

>
> For instance, would this suffice?
>
>   /// Copies `len` bytes from this page to another one at the
> specified byte offset.
>   ///
>   /// Copying starts within both pages at the same offset.
>
>> +    /// ```
>> +    /// # use kernel::page::SafePage;
>> +    /// # use kernel::alloc::flags::GFP_KERNEL;
>> +    /// let mut src_page =3D SafePage::alloc_page(GFP_KERNEL)?;
>> +    /// let mut dst_page =3D SafePage::alloc_page(GFP_KERNEL)?;
>> +    /// src_page.copy_to_page(dst_page.get_pin_mut(), 0, 1024)?;
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>
> Could we show some error cases?
>
> In addition, why could the test fail here? i.e. if you use `?` in the
> "main line", then it means this could fail for reasons outside the
> test. If it cannot, please assert it instead.
>
> Also, couldn't you assert that some bytes were copied as expected?
> Could you show an error case with e.g. an out of bounds case?

I can demo an out of bounds error, sure.

>
>> +            // - By type invariant and existence of shared reference, t=
here are no other writes to
>> +            //   `src` during this call.
>
> If you use the type invariant here that you promise not to break
> above, isn't it circular logic? Why someone couldn't have another
> `&self` and call this?

Writes require a mutable reference. There cannot be a mutable reference
while we have a shared reference.


Best regards,
Andreas Hindborg



