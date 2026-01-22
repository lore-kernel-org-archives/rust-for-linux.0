Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F81636BCE1
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079992; cv=none; b=kesO6Zpi/0VWSMlWqvF3l5cyzy3zWdBjP9G1ssFebV/f8C2EcyLd85S3CakTPwWaxatPCC7Xoy97z36xNN8M9m51khyQs9VbwL8vUuBOPqPQ+h46vg2Ifj5z1S96bMDOnGTp6b9l0iKi9C4wF58l2xqi+bx9pdkYx6cnhe0sJaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079992; c=relaxed/simple;
	bh=+BN3fu2KYuWm2waqZbfkCmHZJSZleUYQLM48P2u8J+E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SZMrFafjnz1Qz7ueTZunIXG+IBB5DwNSvOTdHkuocjWVl0hgmZ54ngdId8/zYBOrDg+16scbWrj3W2XfUcy+Czmlulq3DtNObvzca7/sASJ296l4Vljr5maZF1jj3ea+UM8sUUK9fg2LHLoCu5VUxPOq/zOVI4eTtiYW61FYnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEyVGh0r; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEyVGh0r"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c47ee987401so350340a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769079989; x=1769684789; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BN3fu2KYuWm2waqZbfkCmHZJSZleUYQLM48P2u8J+E=;
        b=QEyVGh0rA7oB9EYYucW4OzRGepOsueE9WPV89G7BkVBHkSepMq/ID0CfeJs00qNIQe
         WnPHRqgqUM53jg0zMDnE3nAgfqNWVFUGpC9bMKun5Y52ZDMdf0/O04h503YxFSnUMXJS
         Lq8KlTdp1o+aeXWxWFNLbVAUeQ8fF1YEWB+gW0pGjSUZ2iwfO1oooIePcGn+weVOAz+U
         cCFHX49GYLsqJTkIuZyffG+UZ4LgAVYIiFTLm8ySpPYPPg+duUslUpSd4pb9eEbkfuuq
         GDktMGH9C6lFj70CSuqcWA27vREdp2q6ltAsWr8jW6mD4Dc1hzFEG+NyjzXZD8IxDGL5
         9gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079989; x=1769684789;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BN3fu2KYuWm2waqZbfkCmHZJSZleUYQLM48P2u8J+E=;
        b=eLXGofC5x7lhuGy0erlDkEOt5e7FdHHtwxcP1fG1LtdCPBP1WPw3QShgceXNTuN1fx
         VokWEWnjWnGiYEgVXT00fgvRknYw2JNFsGovixGpy9/QLrqqan/rsUJ2FfHZe4TKF4O9
         Ch8ajzeWvZrWcH+YaOk2sIJT5+52R1rJ19NoPhKdg73j6UukXcuFn8WzlOIQ9wn/sDGL
         7zfq4iPfn7F2J2Sj8wIVxqopnKJ60KoT2RNG3P/T5XzhMBj2/+daFT2kb2RNhI690MDh
         zVjLkOkQQP8999e66XhH0esyzHaUycCzlYH2rLnKDoSLcASOv4+lhb5TPVJFRBVZt/8e
         JpNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ/P3aQVnsHugjlg15yu3h1aFSo+7Gsc0GmIOAy7wIv40lRh5TXsQ7IZGJF1ufuaP9ReL5bRDQZJu33/4TlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUI/qnkBjsabp7RxGsdPz6aCOAXxIPACkpCbjBByOAz/0XWClb
	fdidtMaH+vAyu2ui1NHAz1GVfYdlbh6+QfXotLDt+6buW/txdR1+yvcB
X-Gm-Gg: AZuq6aK5+/lEJlterHtSaY/ZeOJnpAKJ3LvX6biZcRmxpmv/ijgGlzC/iDrZrhFTlod
	N469FW9mWUW3pQlxZn9z0GZAKLMBX1vrpPWgYxYFBf0krDfvzSS6E5SUPP0T8ON7591P4YpMzf8
	f5ydMaKUIak0L20ctRAyjToLpxfVeZFkTldRPRnu5ayywHBdhRMJMmKJUhUtQXGOnfjtMIAaBEx
	eSIwNhsXAFDcSy/H21P+btMyVYizlPdRqiOmrIgQ9w1qroZ3XvgCq5VxaN+Vy7TAk87VJ1cEP/7
	AdTOEjqbeF2VKJWfKYL5dVH37aOsAuNCUzynIZMgVDjNQ4Ezwsnz9K/qWr1tTd9eOUOwnscmYdj
	+E1tzx4NNshkSo3gUZ/Xe9igLW9G3Pi7kO07wGHk0DZqAff9U7puIpg+c5l4/iItVlK4a8DfWgD
	ZCu4VDdCuflDv73laU
X-Received: by 2002:a17:90b:540b:b0:340:bfcd:6af9 with SMTP id 98e67ed59e1d1-3533537d73fmr1956414a91.3.1769079989292;
        Thu, 22 Jan 2026 03:06:29 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3533525a83esm2131542a91.16.2026.01.22.03.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:06:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 20:06:24 +0900
Message-Id: <DFV2IL7N8X9O.2DLY12HALP8AA@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot
 crates to sysroot_project
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Jesung Yang"
 <y.j3ms.n@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
 <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
 <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com>
 <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
In-Reply-To: <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>

On Thu Jan 22, 2026 at 6:23 PM KST, Eliot Courtney wrote:
> On Wed Jan 21, 2026 at 9:01 AM JST, Jesung Yang wrote:
>> I still think the versioning infrastructure is a prerequisite as we're
>> using the `sysroot_src` field here.
>>
>> If we specify `sysroot_src` without `crate_attrs =3D ["no_std"]`,
>> rust-analyzer treats `std` as a dependency for all local crates by
>> default. Consequently, any rust-analyzer version lacking `crate_attrs`
>> support (which silently ignores `crate_attrs =3D ["no_std"]`) would
>> incorrectly assume an implicit `std` dependency for all kernel modules.
>> Having the versioning infrastructure first allows us to handle this
>> transition without breaking the user experience for those on older
>> toolchains.
> Yeah, I agree that specifying sysroot_src by itself includes std and that
> is potentially an issue.
>
> But, currently due to issues like the relative #[path] include, the
> sysroot crates aren't really processable very well by rust-analyzer
> causing a lot of spurious errors and unresolved symbols, which make
> using the LSP experience pretty bad IMO. OTOH, while the sysroot_src
> approach does include std, it at least makes it usable. Personally I
> find it more useful this way, but I can see the argument for both sides.

So the problem here is that the versioning infrastructure effectively
restricts the use of `sysroot_src` for older rust-analyzer versions
that do not support `crate_attrs`, which leads to yet another bad
experience. Hmm... I would like to hear others' thoughts on this
trade-off, since I don't have a perfect solution at the moment.

> Tangential, but I'm not sure why the drivers don't specify no_std
> themselves - then we wouldn't have to worry about this IIUC.

Perhaps Miguel could chime in and give some details about this, but
you can find a bit of context here [1].

On a separate note: I actually have a previous effort covering
`sysroot_src` and `crate_attrs` [2] that I'd like to land first. It
covers almost the same ground as your 6th patch (minus the
`sysroot_project` use). Since I wrote the `crate-attrs` code in
rust-analyzer itself specifically to improve its usability in the
kernel, I'm hoping to finish the full story on the kernel side. Would
you be open to that?

Thanks!

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/561=
668361
[2] https://lore.kernel.org/rust-for-linux/20260101-ra-fix-primitive-v1-1-d=
ef809357b4e@gmail.com/

Best regards,
Jesung
