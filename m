Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46304340DAB
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609387; cv=none; b=qxIIvssbe4+ptnVLlpIwbW0Kb1K7Mk/tE4ulVo5L/a3aHR4xINtp6SBNtfO3CPsuzUrWStXbSpX8YqpUQOS+mbe8UHvbl+jenK17g0tsT8pOHXsFdNqpGpJ4L8PpNjps+d0OxlT4HAo81fjiXUveoMUtNtXFiiBD3O4fcUm22nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609387; c=relaxed/simple;
	bh=Z53NGj5adOJ0nZOO6IQmBUoTMsOWa9BFmbNnVRm9nLw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rA+btVaqK6IN58LNg8dmeSTUn2EiLxSZMONvbJB0jPxzxDodf3P7rndHkayd4jw43y1NXrfvsfaRMRw6JLkvmMDQrM9B8yzU3TXPvFF8lIHvHPnyszz7YtnC7K5bG784c5vlZTOW+uDeyiop8ZoYstsLyEsLr1vRnCW3BmWblOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USbvH5CW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USbvH5CW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B534AC113CF;
	Tue, 19 Aug 2025 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755609386;
	bh=Z53NGj5adOJ0nZOO6IQmBUoTMsOWa9BFmbNnVRm9nLw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=USbvH5CW6cADXCg0sxSBTfbvmnwbZgKxlS7lODDIK6Sqp9CoIarWvqXZTkwJQ7uoj
	 KGIXxzQiUh8PH18KQyay/pa5ssAuq7E6ez6S4DaRaHMyEdUiMaqoUi7eilSHCvg6zi
	 yl/J0srcYAUiI+90CQx809rxD+2joKZkGF9+nK82nkbNeBYj0sHm3pV/LF4zLtuhE1
	 LvQn1kN1eBMp3OA4d5pY5Yy6f4uPKmO/PHUZ7O7YJ5z6sW9JB0k1KqrwpOlEL6Q+k+
	 GLiYUkYr8YeXCtmQnWL8P8b/YkmfvBZpbA7/gdndFp8SLtYk3MTJjInV9KOmeM4u7j
	 7sVq84NGgXMxw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Aug 2025 15:16:21 +0200
Message-Id: <DC6FL400ZFFQ.2EJOFHXXHB9QD@kernel.org>
Subject: Re: [PATCH v4 4/7] rust: page: define trait AsPageIter
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-5-dakr@kernel.org>
 <36948F0D-03A7-47B9-A1B7-50C0146C9A55@collabora.com>
In-Reply-To: <36948F0D-03A7-47B9-A1B7-50C0146C9A55@collabora.com>

On Tue Aug 19, 2025 at 3:08 PM CEST, Daniel Almeida wrote:
>> On 14 Aug 2025, at 06:33, Danilo Krummrich <dakr@kernel.org> wrote:
>> +/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc::=
allocator::VmallocPageIter).
>> +pub trait AsPageIter {
>> +    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc::=
allocator::VmallocPageIter).
>> +    type Iter<'a>: Iterator<Item =3D BorrowedPage<'a>>
>> +    where
>> +        Self: 'a;
>> +
>> +    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all page=
s owned by `self`.
>> +    fn page_iter(&mut self) -> Self::Iter<'_>;
>
> Does it make sense to break this into page_iter() and page_iter_mut()?
> Alternatively, should this take &self instead?

The Iterator relies on the underlying data structure not being altered. For
instance, a VVec giving out a VmallocPageIter must not be re-allocated whil=
e the
VmallocPageIter exists.
