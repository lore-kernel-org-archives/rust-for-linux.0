Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098B3CB2E7;
	Wed,  4 Mar 2026 19:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654026; cv=none; b=VM8PjKjufi/zNQhw1/xP/0ih+Kpp3hCrP2KIuo1K2ITqwU5MR5P/v0zHZbQpjHt32xCmbNAcS9XIByY4wKgvDIU0Oggwik33IT6xGmg/CUOli9a6ydZ9vlxkQC7qbJj3DWURQ3XRJYcg9k3QQBTzzVOxX22xMj+jben3Cxt38+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654026; c=relaxed/simple;
	bh=unAMf4w1rU+brhMhHNpiaUhgOyFJvG/kkicdFm5JL4g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Edw5H2TTgE6CBWXQLyeeuX4JGswlI9xfHK9HLV9tYsufSS5PwwY2v94rRnoN18cECFuzZBSBkH2+h7S3iQZDZCkzZUDqT+kbv2j65Ff45SX178U1nOkrMvUh5G3JbkWaz8qY4ebj9yKmOnJsf0y4lWSoqMcW7J433j/Z8SFy/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lF1bwvEx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lF1bwvEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F0FC4CEF7;
	Wed,  4 Mar 2026 19:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772654026;
	bh=unAMf4w1rU+brhMhHNpiaUhgOyFJvG/kkicdFm5JL4g=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=lF1bwvExwm1ZmXNGRMVDOiDCemk+HP+cgn5TLgN9QavT0CqgJJOU1DrtJZ59LWgzd
	 6Y6VCdmrRXMM2IUhaMAOfNGrrJ7Dcv8A3cxZPO3FuDSK59W8q19FRLyAyKV0b0xmjd
	 2XAZv1QddG/uGC4Gcokf/hV02/eN6oBJ4uqYN20CuV2sNpS9S7Rb4gyKf0CS3evPP8
	 Jk/Gwhq/9x+6aNK/wpPbM/Y1ttUOEgc4h8Ngt/I9QpUOQJoOFxL+tLaPT1npNn8mGq
	 jdwmG2fKnaBifmZZgZMrRTeWsLzpfILu7r/qmjNw4itEmfPER3vDynGVZ484eF5o/g
	 G0xYKhsQlRRqw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 20:53:40 +0100
Message-Id: <DGU9EMTDIHKZ.4L5JDE53Y76J@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Boqun Feng" <boqun@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <5e281d9c-20e0-47e1-8635-e062f18d47ff@nvidia.com>
In-Reply-To: <5e281d9c-20e0-47e1-8635-e062f18d47ff@nvidia.com>

On Wed Mar 4, 2026 at 8:19 PM CET, John Hubbard wrote:
> I also want to register (haha) a strong yet unexplainable concern about
> this. Registers as types is something I've never seen attempted, it feels
> strange and unnecessary, and just worries me.

Do you want to go back to lots of defines, manual masking and shifts rather=
 than
having a single obvious definition of a register that generates a type with
getters and setters? Needless to say that the former is much more error pro=
ne
and less readable. :)
