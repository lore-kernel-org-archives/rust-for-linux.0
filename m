Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5261E3806C1;
	Tue, 10 Mar 2026 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773160776; cv=none; b=oqkpbxyqUB/tltiONEQRqANnv8rhmEBmsgvKuFJ1BX1v8yZu9o7YDBiL3BCvwvO01DO2OsgOyo3Quvjbkjrrs9yDqc/L8ifRkRc+hi07BI3FFJwbd8RCre0umbwy+xq29MaxAHVBlX+hP6XRxCXxNmNdkwurqeM4uFmve1g49Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773160776; c=relaxed/simple;
	bh=q1t5VXnO3jDIo51X7Jjj9oh/AH3ZiOcq2F1N4pFZyMg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=WiGlXYRktXyc2rjfrtOkPVFkNO91o8r68XpGu1RoiVI6AH3CVxXwzd4356AgLzIVEL8LHOVVF2P5OHIQA1knDhhxjXal6f0qlihi57C5RmZ0emtYw9kvttuwTrATj7SkcJzosbMJXFbIejSn8Ej3/Q2Mez2WGoo2HjquVpXpu2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlsKklV+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlsKklV+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB953C19423;
	Tue, 10 Mar 2026 16:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773160775;
	bh=q1t5VXnO3jDIo51X7Jjj9oh/AH3ZiOcq2F1N4pFZyMg=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=rlsKklV+vmgpY6c2C8RoRwU4he48VBqWrMWx146x4v/UPZ4b0Aj4QUVbASG5o05IT
	 bvZ/z2JQ9wu86H5BvmOnWoB2nQtfgRjqjANN6lmYMhoq2L/e5xIo/KW7uhJbeECi5j
	 ZO75uyphlE8+nXzp87HssrVFyA4yrz9DNJwVq/QnIA8wooJBcYb0WbfV7fXNpevAnB
	 bbFH7oRKCF1sxqNkilJ0oV64jRtRWdD4x14C5INLy5tZMIfx8jEsNYQvEHc8ehdrUi
	 92GVZqPl18JhRrrhl+furKrzhAjilzHy5ZjPT31s2CHA64XdSL9ezlH1GYw5FNGaQ1
	 g0QofKJckF3Vw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 17:39:30 +0100
Message-Id: <DGZ918EWXSHI.2D14BNOSWFSGM@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8 08/10] rust: io: add `register!` macro
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
 <20260310-register-v8-8-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-8-424f80dd43bc@nvidia.com>

On Mon Mar 9, 2026 at 4:14 PM CET, Alexandre Courbot wrote:
> +#[macro_export]
> +macro_rules! register {

As discussed, maybe move some of the documentation to the module and keep t=
he
documentation on register!() itself a bit smaller focusing on how to use th=
e
macro itself.

Also, please add a pub use, re-export in rust/kernel/io.rs and refer to it =
as
kernel::io::register.
