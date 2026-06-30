Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD31B411687
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jun 2026 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823995; cv=none; b=KGHXjl6SWSlzmAEvY36BaHxOWlUWJRW1huEhQSqqgQC5zXboTswPqiO84+k+ryOIFh5IkcI+2rnAr33z3oS18uY9fADnwKqEmKMliGRBlujWYq3Jk4CjuiFqLQ1utDpCd9OG9v5nVkBkRmAnuyNSmaKH4HrjLSDrcLlAuwHB3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823995; c=relaxed/simple;
	bh=nJFgL7/w58SwOXb7PJ+qKjX0QmNN8uPY0KgK1f5rdFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d9lnk1Cv7ERLdsFPM7c3zDdZLdJxh3x68tIHpds0Q4euQQ+2XlnVv7Vm2a0S9JdhKe1V7/N8Qv57GpmuXN6lwlh7YW4hZ6xn0IAJBBcroV+Ag8X31Ewevj2p9OUbkxMOxsej2DhjkjWm1JFPMOT5CS2OV+cIUpcgRlKrlDvs5+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=o9BzB1U7; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="o9BzB1U7"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1782823656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=miV5jom9G5w8Lhp75VHQPkVklR8pe41iaRLZ+6yJ3Dk=;
	b=o9BzB1U7RrNZdYy9ovM2pSH3Ewmr3QOgp8mEQ6ZQ0cEaGwpJT+XX1Xqc0pxRFmCsIE5sc2
	eHi/gbpD+cUVe3DLw7Ee2aKdOOLb9axngRU0plwOnBtCA5x04SzCxiinsqkpa3k/VOPd5y
	MAhT5LeZlvhAT4mHK+hla4XkHrxUxEk=
To: Timur Tabi <ttabi@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun@kernel.org>,  Gary
 Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <lossin@kernel.org>,  "Andreas Hindborg"
 <a.hindborg@kernel.org>,  Alice Ryhl <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  Danilo Krummrich <dakr@kernel.org>,  Daniel
 Almeida <daniel.almeida@collabora.com>,  Tamir Duberstein
 <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>,  Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>,  <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: error: add remaining error codes
In-Reply-To: <20260629183022.2709524-1-ttabi@nvidia.com> (Timur Tabi's message
	of "Mon, 29 Jun 2026 13:30:22 -0500")
References: <20260629183022.2709524-1-ttabi@nvidia.com>
Date: Tue, 30 Jun 2026 12:47:35 +0000
Message-ID: <87a4scdwk8.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Timur Tabi <ttabi@nvidia.com> writes:

> Add all of the remaining error codes from include/uapi/asm-generic/errno.h.
>
> Previous updates to error.rs have been piecemeal -- adding single error
> codes as needed.  Instead, we can avoid future problems by adding all
> the remaining error code in one swoop.
>
> EDEADLOCK and EWOULDBLOCK are intentionally left out: they are just
> deprecated compatibility aliases of EDEADLK and EAGAIN, kept around for
> non-Linux/POSIX code, and have no use in new kernel code.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

