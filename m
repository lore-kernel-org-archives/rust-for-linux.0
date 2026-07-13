Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515474252D6;
	Mon, 13 Jul 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948952; cv=none; b=J5MhQlVsopJgwijn50qeuafL3jgMsDLjsi+hyMhOJDDtG5NijxFJTN+FdoZuM35Oh0zhHmgX8VEVyK2gweFWTYMNrmRhgBJIrQHxWNLYDrgvnCbqOrL+BNha4XXS5QYpt2BO9GcHk0NuD3tUsc81EAaRS5yibYlhlLYYcZSF21g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948952; c=relaxed/simple;
	bh=C5XLvguQLhVEcfSjW/+LL4p6dlUwKF/CRv5qqTfRXZM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=exzSknuzJSl1jw6UaedAbBgT8BYNiwQlHV6YinLqPOq8wyobRvnzYzlh+aHJONfNlfBwjx1w8GIJJdgHIgdwtN/cJvGqZKYQJ53qW6W2GlzoogHPXUUgqQPLInMVXP1TuWcaiYqF9Cea7MkRPDKdEeWjGsJID7qgGb+C0UOJyXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEp3SGnx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEp3SGnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055411F00A3A;
	Mon, 13 Jul 2026 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948951;
	bh=C5XLvguQLhVEcfSjW/+LL4p6dlUwKF/CRv5qqTfRXZM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=KEp3SGnxTenFsgqPyojBgtKn2/PyHFtTDC9UY7qqyDaooj84+rEpvk61MIgbVhSNF
	 GGpYQG6/AUfE0D9D4ZTJiFphay7OC6ARCcGXjeJYGTz20c3cIf3V2amsYthyqXPNU2
	 WwZSIcIQz/TVdOtTqA9VeaQAu4sCbRIaJfGFLa8UkH/FG99o44jMjxu+9W29KfhT/N
	 cnNY+dGUh/nRpH7P8Oi80yW9W0Y+y52TqNwveSjn6mvskYXqVcy1WtUgGPvKLyulEE
	 VUDcreQ0FiHZT3TGDNZb3ZRccNpm8WXxsmNaWzKKbchIx21pZXZ2G5q9RA7OvNvNtb
	 NNQTaaUW3LQzw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 15:22:25 +0200
Message-Id: <DJXH4FQ62VED.3T41DAVF0KRDQ@kernel.org>
Subject: Re: [RFC PATCH 0/4] rust: usb: add usb request block abstractions
 and a user
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Alan
 Stern" <stern@rowland.harvard.edu>, "Mathias Nyman"
 <mathias.nyman@intel.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-media@vger.kernel.org>, "Colin Braun" <colin.braun.cl@gmail.com>
To: "Colin Braun" <colinbrauncl@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
In-Reply-To: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>

On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
> This series introduces initial abstractions to allow for the
> implementation of USB drivers in Rust.

Note that there's also [1].

[1] https://lore.kernel.org/lkml/20260617145946.1894-1-mike@fireburn.co.uk/
