Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46712C1586;
	Tue, 10 Mar 2026 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155838; cv=none; b=OGr7ZxzoOiYxgz9UioiNmNbx1EePzVdL0TCDAHOa9xNtyNwe6KEKj7e9ZGsibPPfWBgvTuKqZrrroOoXqY27xMXfdykEHm9WjHrqQnkUgkTZNm3nf8fuLoQgdH3+M8G0ppVcxZ6XPS1KcFx6fXIFr0hgmjqcxZKMR7vud7pUEjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155838; c=relaxed/simple;
	bh=Pu74DJjxj+c2wwEPK8joh63di99Jqtn3Wr6JKH31fhk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=ThVw5CCiqk8pofpig0XVOAxgRE+9Z0/vnLre3/Td85IVBtivTUowis+yB0yEjiGH+0sVdxC0OZ+S5fHwCrkj2Qu0CLtYchzHF08iwpPXaS80vb/bSvLi+ICEnCEDRUs1zc3eRUWjdiSlPXxgkFPpUFzRb5u8a/cijT/vFtFEjF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnZUQYrj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnZUQYrj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB13C19423;
	Tue, 10 Mar 2026 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773155838;
	bh=Pu74DJjxj+c2wwEPK8joh63di99Jqtn3Wr6JKH31fhk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=JnZUQYrjux4C4fXStJ8ghNVKDu5p6M5C26BDNtGqcI8jvGf/Roj8INNaTe/HD29N/
	 yhcPD4cmLgd3Tfj2Boo6pkqYMGFoXUMuVc1oeUKXM15Wt2sqJtJWIoBpUn70iIiNlx
	 IStzg2CQHKZwuCZqmDsH3T6ocUSFIX62CkF0nOOqcXtiqsNHjowPPnuXtWVMO2cFTJ
	 hEr9YFwZvtsGU/I5OQTyc2Fe0VkWSo8Veat3mfy6cYPK9eVdQphlVkLQ/xvYv5d2iP
	 wlvwkfQgejWmM2bltPRcMzDZshWUzFmqyBXbGH4H+WbzZyYjTXtS+T6MPhWKqKytwM
	 ZQcxiZ1/KT45g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 16:17:12 +0100
Message-Id: <DGZ7A85M7Z0H.17846X6ECHBHD@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8 06/10] rust: io: use generic read/write accessors for
 primitive accesses
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-6-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-6-424f80dd43bc@nvidia.com>

On Mon Mar 9, 2026 at 4:14 PM CET, Alexandre Courbot wrote:
>      /// Generic fallible read with runtime bounds check.
> +    ///
> +    /// # Examples
> +    ///
> +    /// Read a primitive type from an I/O address:
> +    ///
> +    /// ```no_run
> +    /// use kernel::io::{Io, Mmio};

NIT: Please use kernel import style, here and in various other places (incl=
uding
other patches).

> @@ -514,6 +563,20 @@ fn write<T, L>(&self, location: L, value: T)
>      ///
>      /// Caution: this does not perform any synchronization. Race conditi=
ons can occur in case of
>      /// concurrent access.

Same as in the previous patch.
