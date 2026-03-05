Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53EB366546;
	Thu,  5 Mar 2026 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714219; cv=none; b=cO0v0XfHU4xfAhCjALDDkxwhZMM793ZaHzvA276WKOXWklvFes7mvIthd1eKwF0qBq/I+HWq/mn95qPp7aDFigWeqN+9ssiuatJhBdac/XfNXyQBk9/i6fwOynwg2vmKyacz5ViV+l1Gulb1haDW82GWRBGJGmyG21hYr9NJ+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714219; c=relaxed/simple;
	bh=IwDeOBSinEDPZcc6YZoBtnaprgrbyGBbIU/1YYB2on0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=FiRb1X6N10fN2IhbvOGjkzCsBAK6He5oCMYpwmhtLCX6/bP5GyKtbO67cD9p+3G+v2A6pGDvvi0nYvhELcNmFpcWY7QpCsnliLhPl1FVs3FFmbiw4W3jTXcjMlGhCkN1xpHGXWvh5HkrPks9RdkIDw00kGXLBwt8xH6q/BZKKag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrJxUYGJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrJxUYGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80950C116C6;
	Thu,  5 Mar 2026 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714219;
	bh=IwDeOBSinEDPZcc6YZoBtnaprgrbyGBbIU/1YYB2on0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=DrJxUYGJ1sLj2vgjyCHiHKafWP3wG6vaoXugGnGtnEjxDUh0IR0rQV6RDnKsGOL/4
	 +LGbzPwtePb/Zq/DBzZSKlUsvFkrJbZjiYpFYS0d2jskBYS7yJVeMUKNO90mELEPpi
	 nFBRkBKvxQ6XsLZadHS1FUKvBhm/CymnrhNn2RWbmJVWgyDnKLaySs8Y61vScmHbXV
	 +k2dzbbSJOUyOy5iroHQRdH66v7m/bW/d390z9hUxVT/+XaByssSjnmMrmIw6hMtTu
	 Lar0BGINulgRBTMq3HDmu9dPUv2J/oE2M1a1/+4qbNSj7pX2i4BTrV8Xb6e+ouBWjU
	 eKOFjXIpKh0qA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 13:36:54 +0100
Message-Id: <DGUUQRCUTQJF.15MR7PAFJQHNF@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
 <ba7aec533e083622be9055e77c30fee0@garyguo.net>
 <DGMEORS8PL1T.242O5BRE6ZSM6@kernel.org>
 <282c94d3-f32c-4851-969f-61fc968de6a7@nvidia.com>
 <DGTYFUCCECHS.T8EW6ZPL8NZS@garyguo.net>
 <2fe31d10-733c-414c-9936-2d892f2a4186@nvidia.com>
 <DGU8CN7OXXB4.1S5OOWY9GNRKJ@garyguo.net>
 <3ff4588c-1322-4723-bb30-9049d0b316d6@nvidia.com>
 <DGUGFGFA7FVJ.297YIFEBLO3SH@nvidia.com>
 <22041c9e-1eda-4273-b5be-6f277dec4a4c@nvidia.com>
 <DGUNQN0P5850.3E1UV2JK8WJEW@nvidia.com>
 <DGUUKFDDA1O7.29K9XVJRZV6BN@garyguo.net>
In-Reply-To: <DGUUKFDDA1O7.29K9XVJRZV6BN@garyguo.net>

On Thu Mar 5, 2026 at 1:28 PM CET, Gary Guo wrote:
> This is fine, too, although I think just returning an `Option` and ask us=
er to
> unwrap it in const eval is better.

Well, that was my initial proposal (except that it was Result and
const_expect()).

IIRC, you were against this in favor of build_assert!()?
