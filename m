Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434272;
	b=BQhMcPCJegtjb6vEcEhgiW9pF3D2rXVf0xHuN2NwhGEwcWlucl8XTvS4/YPULPVDg7Xd
	 rJv7ll6FEaoVvEaoElvaTBcv0FWwhxSULFyjXGZBj6nYwvDRmONVj4PMHcHz6RbC7m4vD
	 30B+6tkfj/IamNASnlktEX1buytqzyXAkxqHbz/eSAfySp3QlwN4KqVg/oj7YJfsJnhAg
	 A+xwYIKY2ImOdRCZMyPpqCm9Wf2817uNrUFr6ljCPKMLcbvrbHIrcmnSjb3RMe/8YHwLp
	 fe2jIaWOIAbx3pEBro2qTHKfw3TGmU/koW/eQJwnzN4HA4GkXkzz7ZENHty7rdkNXww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kVQzCHWMhDAXGaFSs/w45J/x4L4pGUMMFJgDsU1GON8=;
	b=rRznAkUFcfoRAE8zv87uAcMtQF+ac8tcT5d0Ck51csxloF1J9adw4rFCjwjo7k21Or+O
	 +WUYRA0GrwD1kOSk6mTJ5uImP5gO6EI2j17vC89SYdAmVEiK9LWy6UV8YRfrbKlm0G7QP
	 OhKuWZOaGhq0RfmFYtSE0iFt+oFrVS/z+XwY1wkBP1I9J/9QsUXA/JCsr7Chlcxof656+
	 dbDB9zXo0hVTamCqOoBfrIdy29LasJFoPHFOQso4X49suaZ8wGYTBLqXqIPT3kOxVLJ+F
	 JyvNzpqlsIK8qaiaJg/nuviM5HePRnsK3VGs3buyCp6/ka5oGZyuav/OKtkw+Udsk1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="mHr/B30u";
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A978606A31A
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 18:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A978606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mHr/B30u
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1690961241.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 11:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434270; x=1793039070; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kVQzCHWMhDAXGaFSs/w45J/x4L4pGUMMFJgDsU1GON8=;
        b=mHr/B30uJCg+9dz8ifw1Ei5OItcuSEN2zojt85n/IH88as3hIjQ6PGxkyo+lJp3HeE
         LRKJahdu0insr50PFyPMoz5QXci5S9pbZV31y6/KtW4nd2PfSltB1urFDw6ZPGGr/73u
         qmjDNT+oCaq9viasnov5gdvHummk2luG4MASYbGTgJe2RnVmA4KB+FtsU9nB1Z3jLv1X
         OcvpWv1hzah9CIEiMpFy2DhG2onQbZh/wOVk8EqhWdv8ByVVLjcVbl/OoMzePN7yfmNO
         at/YzyAvlHaTrxvvj54fFjKmyeYl7HyQKhCC3ShStXGePbZ/b/ZQxHSFGM6dB2j1BK9t
         1v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434270; x=1793039070;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVQzCHWMhDAXGaFSs/w45J/x4L4pGUMMFJgDsU1GON8=;
        b=zrYaNKQgXTmOsXt8F2AWETXt2M/uk1TTNlRIA132WM6yGUXFJur3o0SFF6ADo+s9HZ
         GZVEuPmWwUxgGKmUEqCr5Rjjb2hXTFigwdi7+54UIsPIQCsrcSWvsbt7fcNtJYru25sX
         zrTcZ6B5DXSYtgc0XOtbfIosRBj0eyWKHIzY/TfCmFpy4Itu4nXocOpHs9bWygndleD9
         OniAu+Qh5XVJF+CXueV4OKlMq3nGZziUdW94PD5AE3Sdc0H8vqArh2Q4tSfhp18VTqGG
         Xz37vx+wwdBffrRS4VPxmn8mlGqEYRYQO3drgmHf+VtIQFO/0mikqnCKosABbEDESlb8
         lGVA==
X-Forwarded-Encrypted: i=1; AKwUvBybSOyEMhtxsYImoq2mNEQipiZus5ue7LgkiZGk11F2ALTlE7TxiMGxhHxg4+JlHQK0YUwLEbN4k1u/lM8kGQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL3PZFWlAD+FsqPsMOovZQhlNmk06NKap6BGC8MvisL5/ZVd5Sn
	tiiR3OFpbH3v74MLxrK3lKwv88eBcMjLjfQSOP+SwQNdlOsyKeblBpo=
X-Gm-Gg: AYBFou1goVh7Z0KAxCvFnukcyc6JV0uEmiuaqoCOitvjahgKWI9MJNTeM+I5Vqd0GYz
	NC2xMOHy6USCJzORaMSX0Cd+H9MgqV6P/JTiNm1kMnq+kOFH8R4DqTeM/Gs19PDRiSSv4Fr252C
	PUwcrCR85dqdQ+Qtgk5Gmg90joHQLsAHH3+0Ivens38EeYdXKgcmZ8h1VUIxZKucLthKYWOuA4N
	zgmsnAVyDklk8B0JjeSUFlIv0ZGmzjgu9WEq9Fy5ID0Qe5hm00VsugzzyNk/leeYXTQv+cuY7uP
	FYUC6OyVUiiaWM/fBxxJdgxk0NudAj4LuFlYpqVa63ZP40oREFom1L0mtvo7D54yqa3/5AAyf5P
	dFmUfGVIIADUyvmK5SFxwZVl+YbOf4yO4KDpeuhQkZMTZw0LB9qrgRpUzL4Fk2KaWdtKgbDUK+T
	rIgXPzolaMjO2d30yww4kBO9BsE3S54kS3qf1Axu/rqy3Bvx7CPxoMSDjCVpWBVAGbibeCJnXe3
	hm7w9dW+OpftaJJAceXbExW1jCm+9ZD9g==
X-Received: by 2002:a05:6102:26d0:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7cc36905d1emr2860017137.12.1792434269987;
        Mon, 19 Oct 2026 11:24:29 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3642b1sm853242241.8.2026.10.19.11.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 11:24:29 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 15:24:22 -0300
Message-Id: <DM90X0PTA682.3UJMZH614WU9V@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Brigham
 Campbell" <me@brighamcampbell.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Gary Guo" <gary@garyguo.net>, "Jori
 Koolstra" <jkoolstra@xs4all.nl>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: pci: remove TryFrom<&Device> implementation
 for &pci::Device
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Georgios Androutsopoulos"
 <georgeandrout13@gmail.com>
X-Mailer: aerc 0.20.0
References: <cover.1792417858.git.nico.antinori.7@gmail.com>
 <d128d86b751a51fff46a1702b636de74a4807097.1792417858.git.nico.antinori.7@gmail.com>
In-Reply-To: <d128d86b751a51fff46a1702b636de74a4807097.1792417858.git.nico.antinori.7@gmail.com>

Hello,

On Mon Oct 19, 2026 at 1:13 PM -03, Nicol=C3=A1s Antinori wrote:
> Remove the `TryFrom<&device::Device<Ctx>>` implementation for
> `&Device<Ctx>` since it has no remaining users.
>
> Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE para=
meter")
> Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1264
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

I got two reviews from Sashiko [1]

> [Severity: Low]
> Does removing this TryFrom implementation break the build when
> CONFIG_DRM_NOVA is enabled?
>
> The commit message references commit 7edc491f6fca ("drm: nova: Use
> nova-core to read VRAM_BAR_SIZE parameter"), which is not present in
> this baseline branch. Without that commit applied first, File::get_param(=
)
> in drivers/gpu/drm/nova/file.rs still relies on this conversion:

This is true for the rust-next branch in the R4L tree, but the named
commit is present in linux-next [2] and drm-rust-next [3], and the patch
application and compilation were tested in those too.

I am pretty sure the patches were created based on the master branch of
linux-next tree (because of the discussion in [4]).

> [Severity: Low]
> Since TryFrom::try_from() was the only caller of bindings::dev_is_pci(),
> should rust_helper_dev_is_pci() in rust/helpers/pci.c also be removed
> along with it?

I didn't see this. I apologize for the oversight. I can send a separate
patch or a v2 of this patch alone, since the patches of the series are
related but can be applied independently.

Best regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/cover.1792417858.git.nico.antinori.7@gma=
il.com?part=3D1
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3D7edc491f6fca8e22f51e37a16d74914cd959274d
[3] https://gitlab.freedesktop.org/drm/rust/kernel/-/commit/7edc491f6fca8e2=
2f51e37a16d74914cd959274d
[4] https://github.com/Rust-for-Linux/linux/issues/1264#issuecomment-619469=
5910
