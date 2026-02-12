Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A3EACD;
	Thu, 12 Feb 2026 12:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900000; cv=none; b=KLvVwP104Y25wqaTACzva/cMDqldXkbd7QfkdJ8e5p0C33iS4qzwNCkDWgyEB0NKO0gB5v2CsroxcSUe3SVvnoTQXQzo9Y95rY3o2mgzPULLHje4DeUdXZKszuKnOhTj5TEHBRnLXJJZQ8E32Fx7268eChEgS2mCPyzipORzUaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900000; c=relaxed/simple;
	bh=dOu2fzMdQIDJsFpWJwfm+4pUeYdoxKJwbpKLHpNm3RU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G4xiGTLEDffWRpTb80lPKUnJYzx4KL6tPhHIbhQVsQRBsTtW+EqesLpgtvOjSKLpamKF/lHxMldRtGjAt93FHOJjflbeEBzPH1XhH7KuxCDt0IyJTnYwWHkG2inkyJWgui+1KjbR5iRRM0dKCmqb+HV2n7m58ouKnuD9iUTrlEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uSzPhHwV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uSzPhHwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD41C4CEF7;
	Thu, 12 Feb 2026 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770899999;
	bh=dOu2fzMdQIDJsFpWJwfm+4pUeYdoxKJwbpKLHpNm3RU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uSzPhHwVgd6cPCSbgNh7HpLvqqJi+XtjTfdr9wo3/5LBhExD378orAWwFqhK+tlZ/
	 AM9eeHFy7Cg1k1WdhahQC+bQtvyAlaaRYQJCBXPvW+k+ftRv5B4i4VnVbEylBSzK+N
	 pa0BpNKky3jyzlgto1Z2KfZWfPjU9tcJGUr2r/RHREMyUk/a+6hXoCIgWBVwPg304P
	 07jim6HnX7nFlKecFTImwO3MpMkrzLJIoA5cDx80AWc+leaRwd/9q1dYmTAnJRvzKP
	 veQ7XtA/0zjl1uTHKzKPacmvrdbvzp5RjsCixbE6Y4maFhmC8zlaBXDhMh+ZrRnoYh
	 a+SwBnI0kFWVg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein
 <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, Daniel
 Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
In-Reply-To: <CAH5fLgjfSWfhUkmG6_ugue6Wp5LKtkEFJofWViJSNByq3sO2Sg@mail.gmail.com>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
 <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
 <87fr77viat.fsf@t14s.mail-host-address-is-not-set>
 <fU1FEYt6-SY0KlyJy4VClCr5j6P4d5-wukzc_9TkSDSBuQNlY26xyOIprMbHEVMv-H-nrAJ1iN_9tcfIXEI1iw==@protonmail.internalid>
 <gta2wjt4tkcvyu7g56gqyipiigbmbk2ca3biqzmxc2npch3rk7@ccwzwgnk7mcz>
 <87y0kytggx.fsf@kernel.org> <87v7g2tesf.fsf@kernel.org>
 <_ZaFqe4HzW4GSDQTrXKDgkSCr7L9bxUh-h5QPqVlMUHSvE0oRFuZJOPi0JItf3VJXHmaX4PA4QWAGBeG73cJYw==@protonmail.internalid>
 <CAH5fLgjfSWfhUkmG6_ugue6Wp5LKtkEFJofWViJSNByq3sO2Sg@mail.gmail.com>
Date: Thu, 12 Feb 2026 13:39:48 +0100
Message-ID: <87seb6t9t7.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Thu, Feb 12, 2026 at 11:52=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>
>> > As far as I understand, this is a borrow checker limitation. It is easy
>> > for us to look at this code and decide that the borrow on line 51 will
>> > never alias with the borrow on line 49.
>>
>> I did a bit of googling, and this seems to be a well known issue with
>> the current implementation of lifetime analysis in the rust compiler.
>> Apparently this kind of code used to be OK [1] but the Rust devs decided
>> to remove the code that allowed this, because it was causing excessive
>> compilation times [2]. The upside is that this is solved by the new
>> lifetime analysis implementation called "Polonius" and it is the
>> intention to replace the existing implementation with Polonius at some
>> point [3].
>
> I believe the standard fix for this issue is to provide an entry api
> similar to HashMap::entry(). See the rbtree for an example, as it
> already provides such API.

The example above [1] is using the BTreeMap entry API to produce the
issue. Are the BTreeMap and HashMap entry APIs significantly different,
or is there something else I missed?

Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/r/87y0kytggx.fsf@kernel.org

