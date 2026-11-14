Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794655175;
	b=p2ctzocnrfo9groz6kkLx+aZVSph8arz07wvbECnaYfU1BLMUX6K+0IGroN4/S9VxeWQ
	 jR7gJSGDOPOZFLPOIu6GqiGzxsBaTdk+Fkwon37hiZixXKvysj/kaPxmXl1l3+MzaPxnB
	 KCKHwSjkuTgqa1iGf0wKJk36zdoPC5LInFLcSdsGPh5H5C85Ts4iULgOXgowBo13EYQRk
	 UqTNcCCzwz3cWI8DWxOQRaqOj2foXg/hMg+Tv7ZJGaSf71an8SI7w9VK2FDxeWWTTX7ZI
	 ICC3fKrRJ47iq+fcx3m67bsaEUUgcZOU5WSxRx90LK9O+EN6rtiIXVjGDtga68J6aHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0Z5JD+mSTk7fL2vKpKccwS3nlZFZlVqY7nVXFAi5UXE=;
	b=s3iiM00ww1A02zFgJs7ZHp3BcVI2JdIuGH8EUKeX7pRuQG7DWFPF9tjAy2W4S6XwFB2y
	 gD3I+C3r40A3pg5rf+4Hx3HU7D4Ajye2OMfu3gslwwP+i0WU6cZm+GyMya6bsqZrTIMJI
	 8bOBzwWJzMpkdkdOP7pKsd128PL0UXujIjMSoJwLpg8mupt9e8Kor6TP6iI14WMmqMFG/
	 /IqVo7v5K40QtOYpP6hRGqaGOj2yNQIt88ordgHzx1rCYOoBnF9TJNeiF/mh/r1MmEJ0q
	 sEPthV7Td8edvS9GmK4uW0Dvd1Ey303ktmdJsyb4iOytjH/X/o4He5Lk4eedz9Dcl2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDyqq8w+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BEF606A32E
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 11:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BEF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDyqq8w+
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36d1b3b9974so156952eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 03:19:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794655174; cv=none;
        d=google.com; s=arc-20260327;
        b=lYJTWug6NOczuQMHezZthNmO2f5W52m64u/h0lUJxxSpRZ6rsyCmPAe0ezC2Mu6tzx
         WWOF6VqAI+cpe8nmA9t47hFq4jFuMeSbBUYJpGEuUiGcyR9h0qeYlpslw4W8One5rvkU
         RvWVrW+8zEQOg4RRh4e7veTaRavWv46bSwx8JIWvd7gwmNXmyJ4c+d+qzfrg94IRwnGN
         Mkc+g+T4Dxdz14JrbnqMa4mLXRHRE2jzkljSfVkgft6lIUeJIH7rkhu7U8tQc9L+8iMj
         nHMOXenJDkMju9GDPZmy8BtTu6PusFmJDWkihfv/VEIQcPsaZt+JprGEOm5P1DinkW5B
         8+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Z5JD+mSTk7fL2vKpKccwS3nlZFZlVqY7nVXFAi5UXE=;
        fh=CnpVUCTbCqXK3DceRlm3Sx8stYJ9KCHl2jUhjMLD6SQ=;
        b=oDYZxqtB2v5NfCsr5t3qd/BUbYOQjASRuIppS+1B9opSje6Ijx9JPFnYsvIFVZsEuM
         i3XV6P+Laar0TIjbNq0X9JXHEKN+oeYvuQ/tdgls0/oDF1P5tyncH+Gux/z1zc58dSGH
         73uvwLPxESfX/Sf55ZRXRgrwY6eJOHz3+2/H9JLc4ZYJDPiF7Wwyzn4rKPrkBoc363vL
         55kjKqPQYv0LM35foZ2zjfm6Qvm677ay4TRdHHDFFNIB1b1p/edDEw/K0eTd75kyzmG9
         Zp7XaRmD+4wtTxzswYfWrlzzbv0Vb3cWZplNTNd1snhFxKwododXtFgthnLx7cVVfse5
         W+Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794655174; x=1795259974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Z5JD+mSTk7fL2vKpKccwS3nlZFZlVqY7nVXFAi5UXE=;
        b=YDyqq8w+qGAgC+SMwmW6ynm9wNLeSfpV8KZTdvS+BZyswTje9buIfCYxflNvLpQD2A
         aquMfZAcuQv7mfikovnbWwLUFAQR6ndmyTgYCBgoj5oOQwYyYX2S+Lw2K8wMH8sapVtu
         Ql5rgCIFVATueyG32bUPo0IQyQHViw9F2kcWa8R5APVHc3HjGPBAcx5ASgsDPoB8l1n3
         ax1acDazxb7WO1QZEGHf90B6a90oQVVtsyJ3nbhQt3meWlX+OyAvRtsnbUmWtq+cNsSI
         LhZjlzJdZUFD+h/H75c2H6Ynzjqk3G0AF8xm4xLPiipTWF2C8CYK5bwkWL+0w/d9p+6m
         9tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655174; x=1795259974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Z5JD+mSTk7fL2vKpKccwS3nlZFZlVqY7nVXFAi5UXE=;
        b=oEUED/rYDXDSqlDklhpRpN0hZCPQ87iPyCJNWP5kQ+ruUcWKCr5UsxDQtuWThMwekG
         N7ySWH4w43jr0h90Pua5Xr9ueHqLq4Av1dtgvOE9CRd581SkqUo5vFzzRN1nx8zHDGkm
         RUWv19tW1VMkTZ3XwnBB1hsaV0VNqKmSgthuSaoi85+T8cA+8Z0N4mJt5tuMOemnngIN
         +kbG0yARGRVYOWFA/W7clamF6iS7h7mRompqZa8AaxwjcB0/tpaH+z8vanTAoeqfa4ud
         ndfSe+6IUC+u+3iO0a/w2r9VEPnmjb1CIQvy2b8zkGhrm/dZAzZ/mJAILkUE9RoY+1xx
         23OQ==
X-Forwarded-Encrypted: i=1; AL+hErHZflxHH/QLpFEqcLR2iMdyYxI62Wxv05/bauiFS3CqY/e/1NEfgRinUwJRWWCoKvZQGQcT/pSZVFfBjb0Ldw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+qp2VYhEZ1eodWY4PxhlNjBXp9a2XRbGt5e5nFQDGXJqcHQBsN
	K5U37w/KQmgvAnANnhqqpAGUyKyBWaSOdQ8QA4Pya6rZAvs2g598MceNFcgAD1vZ8p1EpNlPGsx
	tlK6H86O2vOK9cYcgmmrk036vQSH0hSo=
X-Gm-Gg: AYBFou3b2nPqB/56kr96TT1kAtdeyoeqHEFaS/A3E9UX03nhBqd6VHwprMbvg3Y2GAt
	9oyCNYg3Kdd5bJnIllfd89htPJ4Pr3xIzptVfmqBUcADe2Jf9QAGygJjRFGSwbK0sg7s9A8t8gF
	TlU4iZeZg4K0WafMdJF4GrNNlKX378ZG3qMq+SELssRATD4s0eqLkV0Cq1mGUiKWkdhMwt+yDlP
	lNeuU4cTI6f8gZRHKyFBgrtrPskZlRe4JaXR5Y+ens+oN7MVwZkyajH4qw1j25cAro0RibV8NIU
	ZY/XSg8aS6U7calg8x4yNPX3aMvllOnBKRC+CVOongWdhxWl9pDutTtbKa9GAZnEdQSc2dd0Iw3
	WCCdhuioM6oSpr4bM5jPUEsPsmGnIhYtls2tUo3TpkdJ67Y/hGdSzA9cqmDR5Ulv5X8cx5hgKRy
	SvzD26iCI9WlUUmmpWI+XRL05fqrJGP3mKAzV9EKhwcHB06jNEal7fj1af9wsSfooFBa0P/nOs6
	5B4G9Ra/1akVlAgTyWijuoZgzGQUB+wCmnylymE7RUFeUR8sFAhx3JXwDou819IbU8nqjfdh935
	FTdi/YbkMyK98DbEGg==
X-Received: by 2002:a05:7301:a0a:b0:375:f846:5b3f with SMTP id
 5a478bee46e88-3796057e734mr6645905eec.0.1794655174058; Sat, 14 Nov 2026
 03:19:34 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114024515.1000882-1-marawanzein222@gmail.com> <CANiq72ntx7OypsqD3QmeMiYOJpqRBgzDJv17grZQA-M5J_r8mA@mail.gmail.com>
In-Reply-To: <CANiq72ntx7OypsqD3QmeMiYOJpqRBgzDJv17grZQA-M5J_r8mA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Nov 2026 12:19:19 +0100
X-Gm-Features: AclHuK_0MvsnItj1pJwqNHFtVxjXYjavsbTC3ITqF5Wwivku2HdK4fwZxJBltrk
Message-ID: <CANiq72mnB8cMmaMWaC-7pJj29JqqumBOSygnM9zA+8eHikm1Kg@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: fix lifetime of copy_from_iter_raw
To: Marwan Mohamed Zein <marawanzein222@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, work@onurozkan.dev, 
	spidermana <xuyiwen14@gmail.com>, Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 12:16=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks for the patch!
>
> On top of what Alexandre said, for fixes, please try to find which
> commit introduced the issue and then add a Fixes tag to it. Then,
> please consider if it is something that may need to be backported:
>
>   https://docs.kernel.org/process/submitting-patches.html#describe-your-c=
hanges
>   https://docs.kernel.org/process/stable-kernel-rules.html
>
> So we would have written:
>
> Cc: stable@vger.kernel.org
> Fixes: 06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURC=
E")

By the way, Tamir's email address in the Cc list has a typo --
correcting it here in case it helps.

Cheers,
Miguel
