Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EAE267B15
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Aug 2025 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754560019; cv=none; b=T6Ib6IFvKQLcpjVHRK18OnOitZzT5sSQ4xBlVImUb2n3KQFExDuniTKmXBmY5tZZBcZMZbiCfAhUwRT0QqFDjdB37+8OkUlYW7HKsNdnBkzbBVsQku9LMwGBfUAoxIyuBxunppr5kyg1pO61QoefZVPjhm+BC3oRgFp9oLvjFB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754560019; c=relaxed/simple;
	bh=iXflCmM23CqrdnYkNzB6/PCqdkHZpvXotL70cjNBTUU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bpcr10geLaHybi1z4vFfaTmSLeo5TmVBChF6HuOeTBzhMeQwLQK5bH3EKA36x/x6g7O7CWUQ9sFbUdC9mrdbU8M1OrAEcFyKNSxHhko9o1O6KXAiV7mhPw/qdSPkhO62bU7CG1SKM6CBBhwqIS+KHi+luX3nR4VI6pl7MBfI0i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WF/IL15L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WF/IL15L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27BDC4CEED;
	Thu,  7 Aug 2025 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754560019;
	bh=iXflCmM23CqrdnYkNzB6/PCqdkHZpvXotL70cjNBTUU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=WF/IL15L8b5TdvnKLs5tZu9US/iThoy/p2kMmYU9AGTTCocOPJ4/edVnEcqlc0vdE
	 U1a1n5Z8/jFpgq1LS+sqKutIDMuuffujsHuvU0RWjUpZOVjxEGacp4UAbUqN2uwOB8
	 AhU91iNoDvNx0xn82TH2d1AVT56WOeJbrDFSAKW49CvJEBeN+IW9n36AffeqpFxHL5
	 oalN8Xvkp/fC/Ll9DUVaIDjhbDAqG9k2ocUSm3vzH4tfwgUPvu9R8tv4w1p604ahNV
	 lxLJJg0crrmTsl6GYoXbb7PYmN2QluJ3m9THQDodPlELlhri8DsWkofMCMeDAjdxEW
	 RtUIy5nHZuuag==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 Aug 2025 11:46:54 +0200
Message-Id: <DBW3M71XZPRJ.3GFUMK0XFI7JG@kernel.org>
Subject: Re: [PATCH v2 0/6] BorrowedPage and PageOwner
Cc: <lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>,
 <urezki@gmail.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>, <acourbot@nvidia.com>,
 "Oscar Salvador" <osalvador@suse.de>, <rust-for-linux@vger.kernel.org>
To: "Vlastimil Babka" <vbabka@suse.cz>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250806205044.85085-1-dakr@kernel.org>
 <ff2a8dc7-f1f5-4aaf-9bc6-b095802dbe58@suse.cz>
In-Reply-To: <ff2a8dc7-f1f5-4aaf-9bc6-b095802dbe58@suse.cz>

On Thu Aug 7, 2025 at 11:12 AM CEST, Vlastimil Babka wrote:
> On 8/6/25 22:50, Danilo Krummrich wrote:
>> This patch series implements the BorrowedPage type and the PageOwner tra=
it.
>
> Note that we have mm/page_owner.c already so there might be a bit of a na=
me
> clash and confuse someone. But maybe it's sufficiently distinct.

Yeah, I'm aware of this debugging feature. But as you say, I also thought i=
t's
sufficiently distinct; and given that it's just the name of a trait I don't
think it will lead to confusion for people interacting with the API.
