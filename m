Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B734A32860A;
	Tue, 16 Dec 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878216; cv=none; b=CQBd3t1Iy1ed1wyfK+oih8uaxEx/lLgBtfOqlqwwxrYJjIcltH6/2VnYlVMKkzaugAbBOE4lRa4GYqSAArOpLa7JVLIuoj43bws/IDe8PohHUYfyClVGc421hhdS8UnnjdiNY/tLk1kXs8wKvW035EJ460lrY8Lmn0K+ozaSEUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878216; c=relaxed/simple;
	bh=cfcdtetFkkWNBzeIYB5+LYKxMFXItsltsd0eP6JoMKI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HH/yNUziwhduzar8qGIkMpt7TI02C+jXqTgB6v0MUZcfWD3SFja50hoZAS0Cidv+ouQ5NmONqjaqzjmXve6ZoIYc45kpas3dWtcTDaO0rhVNooj3DEygCGYvZsgOCHylmF56K+69ZvQhMGOCmhVhFF//NlOyNG4qvip0M/1SvyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPfNSc/A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPfNSc/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FD4C4CEF1;
	Tue, 16 Dec 2025 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765878216;
	bh=cfcdtetFkkWNBzeIYB5+LYKxMFXItsltsd0eP6JoMKI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=KPfNSc/AAIy/tuFtUPsYj2ocTMFpUJNN6AF4OfkHX0Xz+WsrwF6OlLY3yspn/Mygv
	 IoSWxgOsVv4WyviRDSYjOcUDu1FHgrwVF9vj3SWrJi1+wJSj50gkDqh8VanaaFZD4P
	 6Pu92MOwnpBn4WTYOquAuyjN3+SI6qlqaqbqBgjYAjDdubttDwuoruK+IXZoMxIZOm
	 a5WfM9Z289S4KZTJiQepuTj+9g7NYTApxuZ5UIdeYy9/wKJL/cLsln/bclkLHvJFD6
	 kmawmSo7wnd7GBrzF/DzvjcLWJbuEpCed8ePYPmO6e7mI3I5SUvMn2TuSn4ihlCe/4
	 6wFj8S//UEl/g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 10:43:32 +0100
Message-Id: <DEZJKZF7787A.3SJOG26WXJ441@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@Kloenk.dev>, <rust-for-linux@vger.kernel.org>, "Tamir
 Duberstein" <tamird@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/11] rust: pin-init: internal: remove proc-macro[2]
 and quote workarounds
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>
X-Mailer: aerc 0.21.0
References: <20251211185805.2835633-1-gary@kernel.org>
 <20251211185805.2835633-2-gary@kernel.org>
 <f3699da2-288a-4743-895a-f54daa1a51e7@gmail.com>
 <20251215130156.23926cea.gary@garyguo.net>
In-Reply-To: <20251215130156.23926cea.gary@garyguo.net>

On Mon Dec 15, 2025 at 2:01 PM CET, Gary Guo wrote:
> On Thu, 11 Dec 2025 22:50:35 +0100
> Christian Schrefl <chrisi.schrefl@gmail.com> wrote:
>
>> Hi Gary,
>>=20
>> On 12/11/25 7:56 PM, Gary Guo wrote:
>> > From: Benno Lossin <lossin@kernel.org>
>> >=20
>> > The kernel only had the `proc-macro` library available, whereas the
>> > user-space version also used `proc-macro2` and `quote`. Now both are
>> > available to the kernel, making it possible to remove the workarounds.
>> >=20
>> > Signed-off-by: Benno Lossin <lossin@kernel.org>
>> > Co-developed-by: Gary Guo <gary@garyguo.net>
>> > Signed-off-by: Gary Guo <gary@garyguo.net>
>> > --- =20
>>=20
>> Its good to see some workarounds/hacks get removed!
>>=20
>> Overall seems fine, but maybe the imports should be changed to the
>> multiline kernel style?
>>=20
>> Anyways:
>>=20
>> Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
>
> `pin-init` is its own subproject as it's also intended for userspace (or
> other baremetal/embedded users). I'll let Benno to decide if he would lik=
e
> to use kernel multiline import for `pin-init`.

I haven't thought about this too much yet. In pin-init, I rarely get
merge conflicts (in fact I don't recall any time when I had one), since
I author most of the patches. Now if the kernel were to change the
rustfmt config, then I'd change it as well.

If I convert it, then I will do so in a separate series as well.

Cheers,
Benno

> The rest of this series convert files to use kernel import style when
> depednencies are changed.
>
> Best,
> Gary

