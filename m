Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E42E093E;
	Sat,  4 Apr 2026 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775302192; cv=none; b=kJbAmwlwtnHiqNhsoYd7DmzkHyUQuPm1kCxtP/hJkO60I9+0vBPJ9+MsUVmN4koh4r2YsP/mUMyeVw1PePw9RAJJsQfsuJP99DJy6/Hnr+zUyBEhEGtkZHTr8oFnHfa1VVDPXYtbKnc77YaiPjpBxCEWpPry5QVl/ydZOZiYfro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775302192; c=relaxed/simple;
	bh=MLdTc3OxqkaLGnd7WCAmlac4axaKqx0nPw8gTmiM/58=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MZHEilYRtJp2BUf8h2Ny69dcox/Vq5nwnWabNepg8lmqH6xl2TQmb4vB0cwS3Y9iVvEvI2Aop2mMAagchR+zgDUHSzei7rmlZ/jIr2GXYncQFZCejxLOjScmYZLuIKRFi5SqHnmMs2o7cFIuHKQHj70m46KvkcbEV9khKMVYEVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qpq0SvUK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qpq0SvUK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9051DC19423;
	Sat,  4 Apr 2026 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775302192;
	bh=MLdTc3OxqkaLGnd7WCAmlac4axaKqx0nPw8gTmiM/58=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Qpq0SvUKbU5CQWgUd2Easmfy6BLKmkBkiPvQqQdGnEMmZiMIocITDHbSBr3zJved1
	 KRZk35smm6L5Vrkc4CfOhOG5ICNfqrmzynLoybCw6tBIE3VUAmXxUYYcIXJLH1pwsi
	 tf70mCPrTDOX+/ML+b7QDfgROZ369zo9vTgg0I8z1gOhlsSOBVTEnykEBlRjvosimB
	 JSZ2hmNyEwOyjVQY7Ip+ooHduMSBHVMA7drNWfCnIPSCHzRI2uYMZyKjfb8QYsoUes
	 zD/8yFSMpgpCZf9vaSXzK04efe9s5AY81HQ0ozI2HIzZvJm/hjp8A9FUAWee/42GVf
	 97MIuhnHp53MQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 13:29:45 +0200
Message-Id: <DHKC3P4FZHOB.1OCA9MC9ETDWG@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix three clippy::precedence warnings
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260404025821.386514-1-jhubbard@nvidia.com>
 <CANiq72n=7Gnq6=B+m3VMXMR7f365zkhBq5te34cRHWSAPrd8fg@mail.gmail.com>
In-Reply-To: <CANiq72n=7Gnq6=B+m3VMXMR7f365zkhBq5te34cRHWSAPrd8fg@mail.gmail.com>

On Sat Apr 4, 2026 at 1:13 PM CEST, Miguel Ojeda wrote:
> On Sat, Apr 4, 2026 at 4:58=E2=80=AFAM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>>
>> Clippy warns when shifts and bitwise-OR are mixed without parentheses,
>> because the relative precedence of << and | is easy to misread. This was
>> causing 3 warnings in drm-rust-next.
>>
>> For read_sysmem_flush_page_ga100(), add explicit parentheses.
>>
>> For the PCI ROM header parsing, replace the manual byte-shifting with
>> u32::from_le_bytes(), which both fixes the warning and is clearer about
>> the intended byte order.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> Please see:
>
>   https://lore.kernel.org/rust-for-linux/20260401114540.30108-34-ojeda@ke=
rnel.org/
>
> i.e. the plan was to allow it, since it may be a bit too annoying for
> some. It was also the reason it was split upstream into a new lint,
> which is why you only see it in Rust 1.85.0:
>
>   The Clippy `precedence` lint was extended in Rust 1.85.0 to include
>   bitmasking and shift operations [1]. However, because it generated
>   many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
>   lint which is not enabled by default [2].
>
>   In other words, only Rust 1.85 has a different behavior.
>
> Having said that, if people prefer to have the extra parenthesis in
> that case, then I don't mind to keep it enabled.

I don't mind having the extra parenthesis, but I think we should disable th=
e
lint regardless, as I think it is a bit too much.

I also think we should drop this patch, as it is not worth the churn, if we
disable the lint.

Thanks,
Danilo
