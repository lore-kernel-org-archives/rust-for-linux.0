Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D03737B00F;
	Wed,  4 Mar 2026 22:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662926; cv=none; b=tYAo5JLJSnwSOaBqPD5yDiAC1Zh/bK55H6WwhOWR51F2zfan5oT7iS0y5AsnIilI1LhqbDLayVV0l9fQO7Z0UTi7tAvvHUDqFgLMQ+HyvI7JXEflJyQjCo9SoJbhF7gKvl3Oa9mqVkL+N2dSsTi0+at/rm9FCPSwPAhwDFCQut0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662926; c=relaxed/simple;
	bh=dQaalXXA4uIu5doq8Hkb2eguS4UMBXh+fnkRPYEco0g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=elmLjknGP2YflQySpBsQuIAv/U5eArNT7ocfF5oCakQ3b1WdQy1qV+x1oRWUFRSOZf+PQHrrhW3D+kRJbA6u/shsdsbJElV+1bKK7lLT+Uu6P20ZKPo0VZT3aMCMydtW6uGeZ8Bzkx9YKUNg/eRYbnbkIC512fPY57eWKfMvTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GicBaNtX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GicBaNtX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466A6C19425;
	Wed,  4 Mar 2026 22:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772662926;
	bh=dQaalXXA4uIu5doq8Hkb2eguS4UMBXh+fnkRPYEco0g=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=GicBaNtX9eY4DKHSuoL319lv3CBri94h02GBRssdZ0xDtf1F9tJd9B+R4uxU+5PoG
	 vuSFd99Ogvn4XLCRyJ2tmnpMAovqD+ZH0Oce2a17lOGWrYVrSIZmHl+72auIzUzUTX
	 FEwU2kUGzZzD1qmknaOKr/mazqLkyX0DcbHdBlP7X6nD4aVTHBEtxOOd31jP7sZpZz
	 Vux0/VajmCTSqVXQ9B4iKsg4sVq45uUNIw6DOPJs4AS2NruGR0Uzm5T9XgLpim24N3
	 NFUnAPmelrs+eEtRUSONScl8KizAubD40ypiWcjj8CN+96NaS4LXa4TyRuUFSDaq5T
	 gjgQUYiByn0JA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 23:22:00 +0100
Message-Id: <DGUCK7HTLLBX.18NTDOH9F9QU5@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Boqun Feng" <boqun@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 "Steven Price" <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot" <acourbot@nvidia.com>
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
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
In-Reply-To: <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>

On Wed Mar 4, 2026 at 11:15 PM CET, Gary Guo wrote:
> On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
>> 	bar.write(regs::MyReg, regs::MyReg::foo())
>
> This specific case is indeed more cumbersome with the two argument approa=
ch,
> although given Alex's nova diff I think the occurance shouldn't be that
> frequent.
>
> It's also not that the two argument approach would preclude us from havin=
g a
> single argument option. In fact, with the two-argument design as the basi=
s, we
> can implement such a helper function cleaner than Alex's PATCH 10/10 (whi=
ch uses
> `Into<IoWrite>`:
>
>     /// Indicates that this type is always associated with a specific fix=
ed I/O
>     /// location.
>     ///
>     /// This allows use of `io.bikeshed_shorthand_name(value)` instead of=
 specifying
>     /// the register name explicitly `io.write(REG, value)`.
>     trait FixedIoLocation {
>         type IoLocType: IoLoc<Self>;
>         const IO_LOCATION: Self::IoLocType;
>     }
>
>     trait Io {
>         fn bikeshed_shorthand_name<T>(&self, value: T)

What about write()? :P

>             where T: FixedIoLocation +
>                   Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoType>,
>         {
>             self.write(T::IO_LOCATION, value)
>         }
>     }

Ok, please go ahead with this then.
