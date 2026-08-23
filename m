Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13460279DAD
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787515024; cv=pass; b=d1bkbipVcPPFW5daowUE9HGk05fa4zODWKO7BsQecndAPH//BYa9KF8paaGmjx38sLyE1D9k3TziGV5YSVruIVpcyc25UbEYm+8cKDAFXyL9EWoMTNnyYJSiRhX3k2OPMS084QGptJsd63c1vdzwXJTEt1hG3cG29idf6mERv3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787515024; c=relaxed/simple;
	bh=e2YoJilRz/kvEUdFVBsJmCEXRlY5jUYdOLcC6Jc4EhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBYdd34HL4z9Tyfe1964hWWZkwri3/NDUSUptYxksSVXQk3RRewYxYFisqBckmK8k7YbMsezzY/mLEJK2k66PAhNIQOfM9z4pjBrcZUmQXGWD9FQFSRWlMpA2hhvBB6oYtItELV3F3Ybs61u6zREqn0nsXhZdxr2bUN9MsyN7zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=busaXdU1; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="busaXdU1"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so286437a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 12:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787515022; cv=none;
        d=google.com; s=arc-20260327;
        b=XT7uBTZZkFC9jfH8ZzGbflo1/dL1ADaR6vlsOiVjOs3v/wVToX3Tz5M496NPow8LOa
         7bj8wFvQVuXpngard9RD0RqFHatL4L7KcwIKgoOuqb0cKLKCM8L2Hx7NuZJMGQ6BAHye
         HMd5qkmP5NN1udLqS7tHCX9lm7MklbN+jMztasgyZfICqcn+ns1fSmmaQkIP/Ig+d8LW
         O8dGi3M6Kx8ivRtkRbjn2C7dwBYauucFQe6r6f8qnVVIImHI+a5C6734MMQXkGVem4HX
         lP9Hc0+zpaSKCv3TiuXJm3VlqSoN6Pik7qy087oU2gNlg+QfzI0EddUoD8Tv4kMVw7o8
         gLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ii9pPTvyH4snmu+QWWQwVRnHwnpxENjOJQSzf5Bngrs=;
        fh=AAId4GDuBGey+eba/4WgGa5xcQGNSZZ4IHxsO89149w=;
        b=mFLnKnPLDcjEqVIgiGD8xzAGFcqkziLb1n1KzRL3KyTzyDFUZPPhtEDL3sKtRJJaXi
         n7S+1eVJVMoGkAOr9aXV2H+pzqWIWTAbZOkfZmJpDpMQoOIHhWQ9Rp9JWg/3s6qk3WXz
         rRBt5OWf3fs3tE8yR7RdWepePbvi+gaxAMIYgUDsLP4QpAEoux/QYiqzuqMtJYK9zVi2
         kwwoTBcdno8WqDdVkoItdJrIEnO9eEjzquxNVBW3PtfA9crx+aBNEKF08rBcl4l6hvzL
         kD8fEbki4Z+hX0VRa0HSCZpB9UaLOjNLuaCYugf7P82Ifje6yUT17rdO6sjiM5+z251Z
         WnLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787515022; x=1788119822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ii9pPTvyH4snmu+QWWQwVRnHwnpxENjOJQSzf5Bngrs=;
        b=busaXdU12amokEa1z7GPjwEqrrGJg3WCxP2rmsrTsQcvYwLDWvOWXXoLGldLwnXkbu
         tztqr2z06nhpXzhKgYWiGi/hqWJGtLcoRDssp9hnqzpkMht78DrGrPqd2k5IB7BSOVG7
         Xu8J8KlFGg5/Pj0x1Ti7Pd58vhxrqNavEhUhETD1wx2fqqHPOdKOiMvKjUSH3XLthcf6
         xSRIhAa/pr8MZ0LZGSkqiB/z3DGvp8slLEjkEXpxel5a1Qt0nLXDslXdWXF/IF/9rVdM
         stYrg8+4xsmdZwJaAIeHYj5VtHpnTb345bS7XJVKZX2ccN20lM/JVwNhxiSARtuzO47l
         HwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515022; x=1788119822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ii9pPTvyH4snmu+QWWQwVRnHwnpxENjOJQSzf5Bngrs=;
        b=TwnY5K1ZmTfSUA3mdh09SZuhKbdRL6ywYvBofWEb+wguX3gEntb4A31NB3Ap9t+i2y
         O776j5li5wm1cZAuIWjmp35gls3jM5boDqENPVge7QQO/Y1PAMXffLpFFSzYcfhPrQDq
         4Dcw9X0A1amBos2fc4mui7L80I/FkfT+lG+PxGQXspPMAefqZxD51lHnt+Ak+EjNEV4m
         GRdYX77wbs3SlVhajS80IY5267+lNCiqtQ5AxRElo6fnw19MQTx07n0E0cwgUUzb7M8u
         4AlhV1TrGzPtnrqQul2LS/T2YnRCITWHegjLIfe7zsg5I2CaxRs8DzMI6Tw6KF4wsq2I
         jQrA==
X-Forwarded-Encrypted: i=1; AHgh+RopQYPo4976s8rNbVDFtUhCFOxqPh+slIWHsBOh1IMq9vO5S3wEmmSIZDsk/ASFASOvjxrHggOZ9t8uj3e9TA==@vger.kernel.org
X-Gm-Message-State: AFuF++lGgvgalW4H8BMBYZxIcHcUqLaeNjmM2bECe831eEa1lHB8hEqc
	iiPd91qM0WY4TBZmKzKK/5N7VhIS2j6bEIVyRk1hLn4MCJEvK7yUmaF5RYrRTMt8iChwBPvhTN1
	EXgNTt8uJGSnXmqu/k8VGE8CTzQeuXl8=
X-Gm-Gg: AR+sD11q/aL5nO0iimJwvexPqATl9BLglAoCSbT96FAPJUiZuEyPScj9Cpgy85zivj5
	tGVXMhuDPw7v7uYMdAr1pFaZEokXxaEqEwGWd77k3v9YdYaQRwf8nbgFvHwqiS7JQrCK/7lemRp
	qWymfHbvrm2lVC4WVLbdv3HF4uc25Ti3d8nmGX1BR+VRWLPP0ivF4Xh02nw31zEscKPhyTozQZ2
	1jYiPo0qnoZRGQ1E24nAglnuF2aT1Xt7HFqZqCEZLg3TorlAU4uB81OtbLSs7KTyZpoUQT6ViCf
	cx+O7UzQxfefdm822Xhb9h8aRIgnfPSsYZKKKgjvMuf3uoqEdqInQajvFXD6z7dQ7ypvYoahtSU
	6DbG7wNBKISlAwmx59mULCzKVqTgWUU+mYuA6SDhImiPco5i0qmFeRHBJIy3/8IecrLVGdK/X
X-Received: by 2002:a17:90b:4a08:b0:38f:57f0:1f51 with SMTP id
 98e67ed59e1d1-395c2f26693mr17048624a91.0.1787515022455; Sun, 23 Aug 2026
 12:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823193529.156066-1-ojeda@kernel.org>
In-Reply-To: <20260823193529.156066-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Aug 2026 21:56:49 +0200
X-Gm-Features: AcwNN1V-x1COeybQxjem4PQWjBSL_WsHxSqMe08yuK5ZTBwEtWVtjAsz2JYB8h4
Message-ID: <CANiq72mj854XkMk_urvfcJtuiktMTHMU4kYiE=suF3YKM94_gg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: disambiguate `zerocopy_derive` for `rusttest`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Antoni Boucher <bouanto@zoho.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 9:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> +    --extern zerocopy_derive=3D$(objtree)/$(obj)/test/libzerocopy_derive=
.so

This should be:

    ... test/$(libzerocopy_derive_name)

as Sashiko mentions, for the macOS support, of course.

Cheers,
Miguel
