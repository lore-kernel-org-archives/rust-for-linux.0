Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793634688;
	b=KWaF5NO0FZOIG4v7dgXWfexG9fhWo177zFy7D8JLtigj2zte6Vo0mfjGSqSd65mDxbQT
	 gEp5NyJsLXU7BtrOCxq9AEY+QJY6kNM5os380pytAKNmt6ZoeWddT4BRXZy8PiGcL4VfV
	 AVlQuHxlQpTV66rITsc1+gszmipm13/pycKcqjT3nFovQKvN7SQscFvIbqCSU4I9Vfrfk
	 tAHi42QJLvCFkoNeg1u8tHghCT4vD4oSTVMJXwWczAPe8kU/csY9G7SZQ4/aMk+fwVYkz
	 Ayx3a17pWVu9h/41djfaOk/k0BN9pJ+QPdhkfqvV3sAdosKjRC+3TLeP8zoqlHpRUSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
	b=B5nahWn95ejUq3uJIDkejYtape6bhonr1xmEfPXpsRIcEJ1tb2f8nfiXzB8YT6qZNjPv
	 0JbxdkLRP3CWBPlASr408y6uk+uXNc0DTo///mYo7tkY4GAUKoDJaQ+fW4kHjD2vXrvcf
	 8ndLWE4B81i40qNcet6ni1XZToN9pcY32M7pCD6210P1hTd2LJwjeYl3+ealD4kKJfqLA
	 ffRrKaenP1yLtiMKhzgF0/DktuqCVSSf1yKH9Tuu8U4Dg1xGAMMYV7svFwUBUl5zyKtXR
	 97dMcpvjNRQjpzgVUNHwG/MjIZt2OF77/IGgpLiSF8juFHIpSSMQDtHnklAw3jR+1OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jx5hjpdj;
	arc=fail smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A04A607992D
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 15:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A04A607992D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jx5hjpdj
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3646e6de3e8so227093eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Nov 2026 07:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793634682; cv=none;
        d=google.com; s=arc-20260327;
        b=Vz9WzssPGgfF6TAnFyyHDafWBTDB3dMBXhtnt+XaOx2FW/qtz9HK2f9K8H+MypS0Mg
         V9PihXnxPtAMw992sjBD7wJsOQ1UXgfj4C9XNePjA+25Vpf5Oak+Xz0EK1Ix1+2VpxrJ
         WIeSPauIL0nvTlEhbG2IyqSt7CYashsdixKHJ0fItZJe3DvsK306fQRHx99JU41WKuRV
         OL3K+duEh1nxMVvhuFzPLSj9+vDyXz7qhLEfmq0gjeaqypKTsiteDqXHyBM9MFatA40U
         xwRcKNHCm2+o7jlT9jd5Oy9WpIOvx04R5zqZv5s62+XPyHI8W/OSE6OunrPPzrX+oEO3
         QyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
        fh=0v/AhSLtQu1IiSui4OUkJ0XAbz4E+Gk2AIuWJKIpIzc=;
        b=aJG/am3twI9Al7o0AHtsTBzeAKNXYUE14Hf/6M7ywzNCodf6Z53CAwdHSLL151fPzC
         WXAVLNn62bRAfFzwjrdrnR5F62ZVfkRub2tDyal/oKTsBPAadHbIjJyxkMIiA/frZ5H2
         11xhpQhKe9x/Cry48kjOPep1d96BlHWh7EvWCopN/5yE3Xkg07n8sOPJU+iKe39ym4kq
         g9tZf3N0NTFpYDtkIcwDvshAGI7EbQEYebvZj8uqdFQlQA4BhWOH5NZEvaAqKKvROdRP
         7CCCgV0Ls/V9+GlPmHyy+H4zJDTYtOkWvQzUR+znq9obeD1bjNOKjg3D5oGciSY1duxu
         1CYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634682; x=1794239482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
        b=Jx5hjpdjjlBsO+DGmDLrmel8TNZ68ZGcN+mrdu/XdnLZ3su7Qt+mo5I3Wn4KkNM0RG
         pEpZJirbWbDM2osWmn7EKh5faQSGmGgExI5B1X/4680rFZmaCbJKKxBmzl/T4N/69kYG
         iqs5LLBESRVpZObsQgILvEGVNjPjK35NtXFnUy60hwgDQTNUfkbqspJbsxeXWz9IvNC9
         OHix8ncaHVl/1Xk5w2THLiQ8UoC9ybR8pBsJynLjfB58/ROOImgsNoyOgaPa9aW1Jrar
         3UHkyfTuhfGgcLQDz/LQvCMeJT/xtikdtIUB2DvhmztgXDZ/Mbi1p8cvrIUuQGTutLX5
         ZztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634682; x=1794239482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9bLsEQRWNF4YGtfobNRSVu8qcWy7PwQIpehlaoR3VI=;
        b=2U3WA6sBXyXHSlNDhVZ4xd5tyqOkaNeKaM7mWjQ5ZSey529LJQCfud+zfeZj38nvxq
         +Rv9Jvi2PFXtgHeYkwsjNtDkNrV/zqPFN24+atHp28Fnd1zdTE+7NTj3OOZW2Lf5iCTl
         IwgBEreA8Mqo+XKSBq3QCQPx5caPNY1IJk/FoDDyzZun+b+gVqMWEy0y9XkYEbxHrDLs
         T1hkltKyH9zvm6E2DcTjk01P6+E2zpC7EXb03dkNV5PMTmWOpvqJ6Qm5BSQ+o38JAzMj
         tmu2zsQ5Cr8kMpQdFXp0nx/RQeMpBDILG9+U2xKKwjNOJg31dPFrXkROQk2KqVEDurB/
         he3g==
X-Forwarded-Encrypted: i=1; AKwUvByB6fg+rwm4vTSC5gWlBmSnd54RgPyw5ILUNVpOmDHJ0LP4nF+edeYTcLLEAeLtoNDMlbXJ6AC6ZA4VRmrcCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0uGqW6QyJY8a06S75lwTsRu/5HX8hQtng0R9xyunVG9V+bmLc
	pTWKR4I7/l4LcymAftG5VKAz62LTvBPLxK/dXoUDA0H1e3qzQaTLjAq9Hd17DOii7xsyh3p1jKX
	T6Vkq1vq6Ysow15f/+CmrLzt0JPGs1xw=
X-Gm-Gg: AYBFou1IsRyFTu5iH0kZPrEa0TGs0Fdf16MHga6wmRwQ8cT0R0vyg32zNZ5UMS1C6l1
	WgF7ZLP+zC9FenJMchXIImTDf2dwDjeA5CD7AkDa42gUJSdzBmvrKp6g4Jpw3Ws24tXw/m6q8MK
	ByNQyX2aPxazccUYdbbWiYFRfKFTSe+wdtct5TNiWkFsvWcMaWGkswBjBMZYAIKKsTCi9V+uWCd
	GEsuJd5B1xoZfctdWDz0aTwbt6SejNkdfv7R/efNnH1vAhxzAgixDzaR+JdfHN/EOStaBMzNkrt
	nr3ik/Azhd3pgaVWpq3nHCJMQwQ8Ua2zHxQWZ7BYP9eoGYVIKdD+nozbM3tnLwMzkO5fADcy5Ag
	afQb2OpjDGapy8DQrNPd5QFo+vMZ2exn3SxnTXexvw6MdfbSsBT/2A0MiL6F+Yp4BxH14uES4cn
	nPBTtP9LY0sCFa9FreHpWdWF50HcV8FbRvJF/EeIv7h0dAgj7X+e8+aJlOjK+fxF4D1TU2igd6q
	n/nJLMyMjDcs3lUyPjfTkLpxcePFdzgQfTNdWrai/I4cBI6gCnRRw4bHg==
X-Received: by 2002:a05:7301:144b:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-36a4220aab3mr23175401eec.1.1793634681766; Mon, 02 Nov 2026
 07:51:21 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com> <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
In-Reply-To: <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 16:51:07 +0100
X-Gm-Features: AclHuK-Fy3prM0NkytCqnZerg0IISmU7H9eN5VZP0wCcLTYRYHd1nA0RhfMUSSk
Message-ID: <CANiq72n3YfMpWndR06B0s1Mj_PjAR8MJ+0nP4XXPkaFh3zX7pA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:58=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> To solve this I created a new config "RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE"
> that depends on !UML && !PANIC_ON_OOPS && BUG. If the test is annotated
> with `#[should_panic]` and CONFIG_RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE=3Dn,
> the test won't run and won't show up in the summary.

I was wondering if we needed the flexibility, i.e. if we could just
simply disable them when the conditions are not satisfied, but I guess
given `CONFIG_KUNIT_FAULT_TEST`'s existing description, it may make
sense to have a new Kconfig symbol -- do the ones added here look
similar in the kernel log to those fault ones?

(And I was wondering because, in general, adding Kconfig symbols has a
price: users may get confused etc.).

Cheers,
Miguel
