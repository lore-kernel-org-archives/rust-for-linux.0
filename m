Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03650322C92
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604984; cv=none; b=kps01wy76jbuE67DSyne23F2OZgFqXlLJjfulxqUIUCbXpoTDx1rCqGBQhbdhjWvgJu5q3Nem/coOvlBp3dzeuiXWZC85HBgxUiVRP02UAvrlVW3Wwlu2LzO6Q4FDCIdIDml6kDy7/HvjAp3p7hYUI25Vbn4ByAR4GGdoa9pYCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604984; c=relaxed/simple;
	bh=Y10CabmDykPxmLxcSJYbg0nX+wPtCgyJlzw+Eq1vbPU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=C5Ej0XUUHtaR7e403HjDhxuqmNl+nwoc5E5IFJ59N/uikbCPX9jQK0M73DoNq02KkmeKpBJHef0sBFfp5V/ENU+FW3LAGreJ6K7VABAnBgef/eETcsi9pFa4V89WkXMCx4TvbppPXveMwUI4+R5TUvETiUi8wNNRYd25m9liReU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sp6HYijR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sp6HYijR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7212C4CEF1;
	Tue, 19 Aug 2025 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755604983;
	bh=Y10CabmDykPxmLxcSJYbg0nX+wPtCgyJlzw+Eq1vbPU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Sp6HYijRlonEJ6hAPX4aWq2Ocolx/x3uTHQsQfxiFTS3U3PqAeUmVhOc+70NGkkQf
	 x9poI50gWWtx5O0GH3VxeTM9nrEsWowdMohY5tB3jpXDgfaE8zYZ39067j5yizgEY+
	 o1s/5BfM5Xav6gVCx2s3Uhu1LGCNAXIaUaXm8LM6VF7OSI4sm2dGKIFrYPayF1wCxn
	 OW8WnJgsoD/XL/ygUh9oeH0klLPfSS7YLGuByY8ilPSDExtvq55tbhMfq125bSTkTN
	 nVE81+OJbAf1gvBTfTrHDuViOkqd0LYWQUGkcD9M8h+SOrf6KN/Au/kOXCxRjezSb8
	 HHrEXc6didGlA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 Aug 2025 14:02:58 +0200
Message-Id: <DC6E0X5AIJPA.9B5HPG419G4O@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 3/7] rust: alloc: implement VmallocPageIter
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>, <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-4-dakr@kernel.org> <aKRknP8HT-BrPok4@google.com>
In-Reply-To: <aKRknP8HT-BrPok4@google.com>

On Tue Aug 19, 2025 at 1:48 PM CEST, Alice Ryhl wrote:
> On Thu, Aug 14, 2025 at 11:33:42AM +0200, Danilo Krummrich wrote:
>> +impl<'a> VmallocPageIter<'a> {
>> +    /// Creates a new [`VmallocPageIter`] instance.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `buf` must be a pointer to the beginning of a [`Vmalloc`] all=
ocation.
>
> It has to be the beginning of the vmalloc allocation?

Technically, it would probably be enough if the pointer is a PAGE_SIZE alig=
ned
pointer within a Vmalloc allocation and `size` is the remaining size, etc.

I can relax the requirement accordingly.
