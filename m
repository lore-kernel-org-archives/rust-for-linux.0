Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6923EFD23;
	Fri,  6 Feb 2026 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387786; cv=none; b=WSe3qiF7nVJ/pSOSvxP+myBEkOqxT/XyF6U7OhMlfKuHDziF6cSmIrRw3U1up8l0Cnc4nl37JHM/iC04M6GytdQqU00dL1jdC4hst42rFxPIR1qwN0IXtIBmRY0gQtAaPmIzbE4yM2et8F8SYSLl4+lrN38Dk3oLMsXAivdxO4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387786; c=relaxed/simple;
	bh=xyR9uD3IgRpkObaYmqqmnQqtiUzutNGfFaPfeFimymo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NRwpePS4WXgoN8kUi8iyjCjagIMQ69jzNeqe85MqMv4Cv4o/pQc4jJmpVYhnaWdvg6WBSI2+ScX4K7bOEXtepa7Dc13zGVv/FVWuEtELi1LP5zaE3p5oxZgjmlXGj2YO97aMGHgug1Wy9dOEsSx8Jr2KF6K3jaffOuHRBg85BQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j68EQRmC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j68EQRmC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4246CC4AF09;
	Fri,  6 Feb 2026 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387785;
	bh=xyR9uD3IgRpkObaYmqqmnQqtiUzutNGfFaPfeFimymo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j68EQRmC9vdCnR6lFEY5zeT88pdD0fqnCccKPZQ/2w3EaxYVRkjVsjqdhVh512wBp
	 ddwh/rTJkXd1hZjgvDhRA/VvzhI55G/Y6XqfeFWj8/ApG1MmB6sgDyhfYiheNqf5NA
	 mi/Dh9EOmdssTLwTLjwLckYhwjg5FtEyXV+8xRfdZwRbmmbyDoeRbzbcpZmRjBCIbK
	 vRh2X9aJ3iDOmbUIW6l3UC/e09AW1X5Sh27TtMryaiem/DnLpLTVaeewlidyY3pVkI
	 as/CgvZ+r+WM3mskgbMpOudTu6lpZDOD7AiPVOSl21C5b5jXzrmt9pPv2ZoOL9Fz6F
	 1L4jrogdlyaOw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] rust: xarray: fix false positive lockdep warnings
In-Reply-To: <CAJ-ks9=WhEyMexy47gWRCBLmje8PUoaJKeNbjS53dfnQzPAPAQ@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9=WhEyMexy47gWRCBLmje8PUoaJKeNbjS53dfnQzPAPAQ@mail.gmail.com>
Date: Fri, 06 Feb 2026 15:22:51 +0100
Message-ID: <87a4xmossk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Wed, Dec 3, 2025 at 5:28=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>

<cut>

>> @@ -62,9 +77,10 @@
>>  ///
>>  /// ```rust
>>  /// use kernel::alloc::KBox;
>> -/// use kernel::xarray::{AllocKind, XArray};
>> +/// use kernel::xarray::{new_xarray, AllocKind, XArray};
>>  ///
>> -/// let xa =3D KBox::pin_init(XArray::new(AllocKind::Alloc1), GFP_KERNE=
L)?;
>> +/// let xa: Pin<KBox<XArray<KBox<u32>>>> =3D
>> +///     KBox::pin_init(new_xarray!(AllocKind::Alloc1), GFP_KERNEL)?;
>>  ///
>>  /// let dead =3D KBox::new(0xdead, GFP_KERNEL)?;
>>  /// let beef =3D KBox::new(0xbeef, GFP_KERNEL)?;
>> @@ -124,7 +140,11 @@ pub enum AllocKind {
>>
>>  impl<T: ForeignOwnable> XArray<T> {
>>      /// Creates a new initializer for this type.
>
> Should this be #[doc(hidden)] now?

No, I think users should be free to vall this if they want to.


Best regards,
Andreas Hindborg


