Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F35D2066DE;
	Mon, 16 Feb 2026 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252780; cv=none; b=Q6A1wCfbbs9GeNR5gUCn6bMoqYLkl3DVZoEzjXpDG4lEHYwxndvq9EGvuCvIDblsb3uVRmWu06wAwgTwFDjvQTQj4Xhj6tDSrHDuaPzIIr8jFGONgQrO3V1nmWByNFjWkjxjzabbEm19zyguGqyg4TNRNRsLIr/sfLRzh5quGR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252780; c=relaxed/simple;
	bh=rOgyYAeTORLfenW011LlMrhmGjQlFv/Q8Kq6e/gGxY8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JVECUlHkSozH/R0yqulCNJy1Y1oUjuy+E9P5d4/dnRQiKJY5EFwHHtgCUB2ouWj38mOJGEhM6Nt+Zh9+fbvpGQ9/NSHSWAXuO48HFxTvfXKuds5ILAtsLZJ/QatDZfTE68JwUciiOHACHBs8oLF//YahI3ZOPH3Z7l+DIBA7YDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Duewr5q+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Duewr5q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE5FC116C6;
	Mon, 16 Feb 2026 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771252779;
	bh=rOgyYAeTORLfenW011LlMrhmGjQlFv/Q8Kq6e/gGxY8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Duewr5q+/NVISN3mwVboX1XtxfIJF4mCnApmOZ77hgIat2qawkspq9ZwXeI92+AJw
	 HLpz/FTJtIVUa0kLGaVeJj/we5Ieoc74fs/Sh3jkWfKk1p3NDS7FOzg/hgpe0vKGVs
	 tdQKeVFWoawXfNuo7DH9KS/s/7qeuauS+pwliFKH4kvcbHfB3CUd/HN2xY+u7n9LdA
	 aeWKxebT+cP+1uYXHYD8ocKcxLlQ/YcQ7K4ZJM1vCFgeKa7PoT6JptnPdsTPlrxoKG
	 X+uBvm4LlsK/eA+ZmqLdGItzwYaFbqmqkuoTPY6gl+qJryhGmAAFNzY8NwMaZ2YLZz
	 dOgP740HtaQPg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 15:39:35 +0100
Message-Id: <DGGGPFU9E9VD.8TT3HZUWS100@kernel.org>
Subject: Re: [PATCH] rust: add a ring buffer implementation
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid> <aZMMyJofDKualqXw@google.com> <873430es2p.fsf@t14s.mail-host-address-is-not-set> <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com> <DGGFZX5JLZ22.3E1C8OVLNUDD6@kernel.org> <3D7C5FE8-CA15-418B-B2F7-D0EA4C37E1F0@collabora.com>
In-Reply-To: <3D7C5FE8-CA15-418B-B2F7-D0EA4C37E1F0@collabora.com>

On Mon Feb 16, 2026 at 3:21 PM CET, Daniel Almeida wrote:
>
>
>> On 16 Feb 2026, at 11:06, Danilo Krummrich <dakr@kernel.org> wrote:
>>=20
>> On Mon Feb 16, 2026 at 2:45 PM CET, Daniel Almeida wrote:
>>> With the allocation being handled by a separate component, I don=E2=80=
=99t think
>>> this is right. I think a better location is rust/kernel/io
>>=20
>> I'm not sure it is reasonable to ask people who just want a ringbuffer i=
n system
>> memory to take the indirection over an I/O ringbuffer implementation wit=
h
>> generic I/O backends choosing the system memory I/O backend.
>>=20
>> The proposed code is simple, without comments and tests, less than 100 l=
ines of
>> code. The I/O infrastructure to make this happen is still WIP. So, I thi=
nk it's
>> fine to land it as VecDeque for now.
>
>
> Well, this is a 100 line patch, but nothing was said of how much else was=
 going
> to be added on top in the future. In order to avoiding iterating on what =
I
> consider the wrong approach, I suggested that we start out in the right
> direction from the start, something that Andreas himself apparently agree=
d to.

I haven't seen any commitment to implement this in terms of generic I/O bac=
kends
from Andreas.

>> Once we have the I/O backend infrastructure, a system memory I/O backend=
 that
>> can deal with separate allocators *and* a ring buffer implementation tha=
t sits
>> on top of it, we can still revisit if it makes sense to take advantage o=
f
>> synergies.
>>=20
>> But for now this seems a bit premature in terms of delaying Andreas' wor=
k.
>
> IIUC, and feel free to correct me on this, the I/O backends are already i=
n the
> works. What is missing is a trivial system memory backend, and similarly =
a
> ringbuffer implementation, which is the subject of this patch. I don't se=
e this
> as a lot of work or an unreasonable ask.

I think you are highly underestimating the consequences of this design.

First of all, we're missing IoView (the generalization of IoSlice), which a=
lso
supports projection. Gary is working on this, but it is completely unclear =
when
it will land.

Second, the system memory backend would have to be implemented and needs to=
 be
generic over arbitrary allocators. Also note that I/O backends do *not*
implement growing and shrinking of the backing memory, which would be anoth=
er
limitation for a derived VecDeque type to swallow. Alternatively, it is yet
another thing we have to implement.

Then we have to implement the I/O ringbuffer type, which, due to being gene=
ric
over I/O backends, also has to consider the device lifecycle requirements f=
or
the corresponding I/O backend, which is additional complexity as well.

So, don't get me wrong, it is a good idea and exactly in the sense of my vi=
sion
of how powerful I want the I/O infrastructure to be, but for now, I think i=
t is
unreasonable to ask Andreas to wait for all this.

- Danilo
