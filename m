Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDA274B29
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754400046; cv=none; b=fTlxhtKAGjAlP04smM3/7bGHDQFwI+1KrlweUQEqVNjh72qRW87qllmd3nl2mgwkO1UhM4sETPHiXRnFxw82+jf1NuqCOeP4PZFrKPUTkiza3DIDjxZo/4X43iP93ciK4P5DmtMBH013Yc8EuRlE52ZEJURdMJSIVCCJ/JeQpBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754400046; c=relaxed/simple;
	bh=od3cKViTEb2wx7dOD8Sebbp19jFieFZC4g9d+IhSDu4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FgnfWAJrsDNy9xuoR/TmnRSsQtatewCmQWaGm7CNNf4J81uVKUBZRZn/BE5AyY3O5aI176DzL9Mz/1Zo1/Hm6bm4k5S1vsDPuYKn8KZgguqdUxvpM7V7UEOZayfTOHvGsY+OlxZLVvsBI66jydC4t9PdIt5JhjJlSKQC/1kNr3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCvJ9E8X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCvJ9E8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B1BC4CEF0;
	Tue,  5 Aug 2025 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754400045;
	bh=od3cKViTEb2wx7dOD8Sebbp19jFieFZC4g9d+IhSDu4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=lCvJ9E8X+A4H9uc6qimlPvGaNd8zvxO87prPq2FtE2tfvSqMFKxGXlWLJStHG9GQF
	 uCHqN6C+r0wYNP4eeEar00/zLj6/cDjosa7vSpCjRinH8nayrqizd1vPqCqVqhzmjE
	 BwOSvGiwK1QN3serinGCTJkdxAROlaMQ3B0wrU5lbZACpgySEtKRKVZ91phcw0Nb/A
	 OotlqUTM46mY6AA4SY4TURfHfnye/gr0OAao8TWZDQMtCUkdeQYV4127wWtVvhVK1i
	 Uk6JO5cEaP4kNMeqvkszM4kIJORr+hlhgtCVNhTtw/siM11LtEJOfRbiAJ647Tl1s5
	 U1EJn/LM8tpoA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 15:20:41 +0200
Message-Id: <DBUIWSMQV4RY.21AWM08X1DNZR@kernel.org>
Subject: Re: [PATCH] rust: page: implement BorrowedPage
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>, <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250804195023.150399-1-dakr@kernel.org>
 <731A34A7-92AD-47EA-A17A-C25FA94A5144@collabora.com>
 <DBUIBXEOODEH.R2NYIGUDBZC7@kernel.org>
In-Reply-To: <DBUIBXEOODEH.R2NYIGUDBZC7@kernel.org>

On Tue Aug 5, 2025 at 2:53 PM CEST, Danilo Krummrich wrote:
> On Tue Aug 5, 2025 at 2:30 PM CEST, Daniel Almeida wrote:
>>> +/// Representation of a non-owning reference to a [`Page`].
>>> +///
>>> +/// This type provides a borrowed version of a [`Page`] that is owned =
by some other entity, e.g. a
>>> +/// [`Vmalloc`] allocation such as [`VBox`].
>>> +///
>>> +/// # Example
>>> +///
>>> +/// ```
>>> +/// # use kernel::{bindings, prelude::*};
>>> +/// use kernel::page::{BorrowedPage, Page, PAGE_SIZE};
>>> +/// # use core::ptr;
>>> +/// # use core::ptr::NonNull;
>>> +///
>>> +/// trait PageOwner {
>>
>> What is this trait for? Perhaps this assumes some previous discussion th=
at is
>> not in the patch itself?
>
> It's just example code to show how a BorrowedPage may be obtained from so=
mething
> that owns a page, i.e. a PageOwner.

Maybe let me simplify the example a bit and just use the following function=
 for
the example instead of the generic trait approach.

	 fn borrow_first_page<'a>(vbox: &'a mut VBox<MaybeUninit<[u8; PAGE_SIZE]>>=
) -> BorrowedPage<'a>
