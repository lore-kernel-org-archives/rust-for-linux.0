Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB236F427;
	Wed, 11 Mar 2026 16:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246145; cv=none; b=oNadxvD4gIWqzGAGAoa657JUT16H/Ny9UZsdMTurXDnZwAj8iIZwQyMRzhCISy4y/TC2T0eG1wCGgTmR+LOBfNkBVkwy3qpIWRumLKaS49nYkSj5VzAv3l04D+BFizZTvEEZkDdGVhCk7qTDn+Kl04YtRy+pEAydu2tVnL5CqUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246145; c=relaxed/simple;
	bh=bTPQx9v3Vfcm4hHpfCdivd6IWzrN+GeXJcWN/Gb92PI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HxZvHlnsNF396MsSOhijFVECXSi5314/Mu8QbOEjYIqUmAae8qvyaTT9mtwg1zsCVYq+2n1Bo4zqyI7KHYbE3frNlvIuLj7NaTDeAAIEJy9ctAiV4ehzg4pbPqv1AMgDRugkEPlPuBp44B9N9y02OjUMeYTcbJ5DnpkPtnMDif4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjXzcjoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjXzcjoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA74C4CEF7;
	Wed, 11 Mar 2026 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773246144;
	bh=bTPQx9v3Vfcm4hHpfCdivd6IWzrN+GeXJcWN/Gb92PI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=FjXzcjoc0KwVd6vw4Z+imjNq6y1r1QWypH5vd352az+h3Edka6ol4MjJ3RkdCRFKM
	 8RRH4222AvdlbMrlMWYI+46vF61jlpqI/ArWCJGQ21POu0itGCNCgco6y1H+O/XCUw
	 Qk8rQ1Qdh4KuEonCoxepzzsCsnfFSp9n9yUCn78UMnBYh4QEMWHEcBI+++AbVtl9EY
	 gJ0CW1ZIQP7r4YBulDdqIKzgAZf0qC4B/UFS0+ZfKoUttKZqcgyDKsYDdTDi/ldpLt
	 66V/ozT6gA8WyMNdZz4IYiBFAz5x32N4WVdBExGkTtOcWNnSfKyi0mQfM1pj92PvQe
	 QvI9/sE4pIQHA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 17:22:19 +0100
Message-Id: <DH03AMF92KPJ.34AJPXRVWF2Q5@kernel.org>
Subject: Re: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
 <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
 <DGZZLNFLSJ4E.2P42FMI1XT47W@nvidia.com>
 <DH01GX7X7LSY.1N6WXIPLDCSTX@kernel.org>
 <DH02G8SWF726.6XKAQ0XLYE3D@garyguo.net>
In-Reply-To: <DH02G8SWF726.6XKAQ0XLYE3D@garyguo.net>

On Wed Mar 11, 2026 at 4:42 PM CET, Gary Guo wrote:
> On Wed Mar 11, 2026 at 2:56 PM GMT, Danilo Krummrich wrote:
>>
>> 	fn write<T, L>(&self, location: L, value: T)
>> 	where
>> 	    L: IoLoc<T>,
>> 	    Self: IoKnownSize + IoCapable<L::IoType>,
>>
>> Which is the reason why L: IoLoc<T>, i.e. the relative location is on T,=
 not on
>> L.
>
> The location has nothing to do with `value`, just the type `T`.

(Cutting all the above, since it all boils down to the same thing.)

So, that's what I mean, the relative location is on type T (the value type)=
, not
on L (the location type), hence T can't just be an arbitrary primitive, no?

>> So, what you could say is
>>
>>   - read() takes an absolute location and returns something that encodes=
 a value
>>     and relative location
>>
>>   - write() takes a base location (or absolute location) and something t=
hat
>>     encodes a value and relative location
>
> Only `location` gives you the location. Value has nothing to do with loca=
tions at all. Type
> inference does the trick.

The value does have something to do with the relative location, as it comes=
 from
the value type. You can't pass an "independent" value whose type does not c=
arry
location information, can you?
