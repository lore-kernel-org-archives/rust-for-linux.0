Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E43F2D978B
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612630; cv=pass; b=iZW3ZGsExRIdWfgazLTWFjMYCGDZuWgYu06q3e7WOsqgWd5Trd+sniMlU0sJc4LjaZGI5LSmRC6z6RbV5tWvCkaAtuQpUG40GKdu/Hk74D1IrzErfHcMWoc7XYuE3kTubG/hqoRgCgOTtxLnhIjq0Cy2fu4m7LO2T8eous4REt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612630; c=relaxed/simple;
	bh=dvp03LIk8KimjVzgGdUxV34Koqzjh+GayMkBlRHCyBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5otPNK2uxpHh6KpdcaW2XejTb0EMWDSl3KQeLLE7aJb3uc+wYoTaO4wV42ST2XbrW7Nv4LXEYN4e6e4DGm4HTnNpl+0Bz4EybWk2WPMRV/6hZJMUl2+SwmDQbVDGMO4ztb15BHG7J826X8EWaDz3HHKAk1OXW+BHDFkYKhL/0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAzCBxQQ; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAzCBxQQ"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12711867ca1so142851c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 04:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774612628; cv=none;
        d=google.com; s=arc-20240605;
        b=LGC83IAO+A1PbWj/bslwB2XOHaM3F0CG9luhf3dHTyTqz8CJIaLi1jjWyN53jDnmHh
         VYXrCAfILI8VNMVVJJRXeMQ8tHCUjafSOFfizdwf13NIKZcykGF7QXADWhrvKrooOz2f
         rwZ0iE0hn1qdg54oIJ1+bG5lf3cHf+8MVJiSYO1MvqnjMVqUA2VZieQ7Ge+rG1fySMGP
         hn5ZiIZEGavIg8kMN36TWava0rCelO59OQDEwGgWjmd/AXCbNLBWrCeIy1/dPDBwLwxV
         jMs8vtWq6HhCefI3PqYpoOBM0Reuymp7baJbCRucfOfmagBHVJ3AEwj54FmIs4cUeHTB
         ZyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TmVrqNHzR1B/7ADmDVWz+gGu8+MgV4Kf3XI6cr8hSGk=;
        fh=1qboEr8IVardHxJSvboZmuHoAHiPkFtEfyZnGJnB+NU=;
        b=Omp0DgB+EYYYR1pMEDVYTRdOhw2+ua0s63Lp9NjbrbEQyrx5kEc2MJQoZlIS0Y2de0
         XYA17W9jb8Y86OcjnciWGOq7sPbwKcXCUjCC45mzYUPsDIKR69CIYZL0V5zsIGdWv8x2
         LZ0n2MtZnqnHLvRHcp4b8Rg8oFLRv5q7StSEvKdFtQo+OeqLFmutnMyk2rUrwRcV9vMq
         h7yhYITdaLlb0h9XeyfqBSb5DqSUir2jpjeeox8pxIx+qWIGlb5jr515HE/+Tk9cw4YJ
         /F1YSyL8La/MkGHvbFKGffADrBoi2YaNRmVXUKELXYvm//CXOavYOzwqqzBaXyDGJtKp
         J3OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612628; x=1775217428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmVrqNHzR1B/7ADmDVWz+gGu8+MgV4Kf3XI6cr8hSGk=;
        b=fAzCBxQQjmuTPlnuFc2ZRP5HvJ1SvkWylX9e29wM7/m9tom1psTBf2pIuZ/6lZ26oK
         d1bGEqihM2+UEmZkl48E31orO+uOPbYChHuy687aSOf6mvBwUANnUUH5JUu/tF+vXg1E
         fmrvom2Ip8kdv2oHMmb1quKfr2utIYeO+H0gb6dPswRfMHo5Z06qyhBDj4wGvKLBjobh
         7sswb+fwhvwOaBqzIqDCGkEGYbwFR4Iy5ZkVJW2MvbnmxAglNo7n3E42BbUemOiNHlR6
         e0+LmHvenTxU8OjfXguWUq6tlNFMtbFE2f/jlWTQ+I5OG6k2/1f2eXIO2m7o8CW3X0hf
         3IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612628; x=1775217428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TmVrqNHzR1B/7ADmDVWz+gGu8+MgV4Kf3XI6cr8hSGk=;
        b=XNogKCRzNWHi1lvWL8twqhzf0+Uy6f7rq32RFghpRLfp06QYtJnuOtP1iL0Xst3xAR
         HOAQnJGyRpJMrZcT6AwpkVzLFoapERsSCuk+RmgVoPBiKeXD0KgtZsCRjyD8KyVJyxAS
         K2PWMTnqI+A2Us/6QXsDKTht2CQmmRLp3SBAWumq5SqrXshvJk0IQPS1xaPBjbGLyct+
         HCWOWV6WZXzAZJlpUvjVuvqE023u+ZB3PLGlJaS9r/MA5l1vTmPu2G1MlVv3Scoebe8J
         uWyGmIHU7c3tFt2WZZVadz+P9IApP5wYuuZrdzZl/bUDPfozzhGZjzscnpnwq6r+SO/a
         gowg==
X-Forwarded-Encrypted: i=1; AJvYcCWfj0rfY7yekSsPApvbtn6kV3CMXw5WxL4Vk79qZi1taQr7n8t5lV9XblqEiv+UVn3r2OZqcrbte/rMk+p33g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya8JVJ73xyFSy56ozP1cN2IomM68sCdRzPFEZPrenRPbDE1LUH
	CMA8OY9DEN/S3DcPXfVWy1/KcRxYeZRU5FWkdZo/bZPiqNtaHTFDd229bjODivr7PQMOoBONcTH
	mzUzeR8drll7mAlCcPJ6+3ERIyEkjeSE=
X-Gm-Gg: ATEYQzz/8qF+sETAAXMhIu4yRg/hG2lXnhilEAlFp7VhzNQ++e3kDRQH4FDvmGTUmeO
	KiMaT0NfMZ7+PGgvV/UcstTdAAMWZCDnlsRn0JLWTEYguOZzYkcEfI/+mxkj5hWBLuZOyxdQSWT
	wteHy5X9Yu4ZwHpypFB+/dDw902TnMEnBsSxrzsazW0MQ42eCeN+x3d+bxXgb0vaJpz86WBwld/
	P+qASBahDI2mu1wG6WH+9KDSUkdZu4UjgqglndXFkcL4WQeRFoKVK9KIJWO932FEHwpFs7esdvb
	IAyDFb0+mIfPbMVQNxughhVZCFy0Gz+c22NRjkRrS90zSlMa0clWTvgI+sxD0aFDlxnoGM2X/yf
	VSSJALDti6g4MKu3kOELKt4g=
X-Received: by 2002:a05:7301:129b:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-2c185f3463bmr528028eec.8.1774612628036; Fri, 27 Mar 2026
 04:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326020406.1438210-1-alistair.francis@wdc.com>
In-Reply-To: <20260326020406.1438210-1-alistair.francis@wdc.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 12:56:54 +0100
X-Gm-Features: AQROBzD9fsbAvz394IA6Wx2hiIy-YAFpeqn1CqdSgzuMK4RG-2jXdnzee3WOE24
Message-ID: <CANiq72miOGSMzVUWaexCpV6xAD+WrWEXTRu_Bh-6CyLPv9TvyQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Mark all from() for Error functions inline
To: alistair23@gmail.com
Cc: dakr@kernel.org, ljs@kernel.org, vbabka@kernel.org, 
	Liam.Howlett@oracle.com, urezki@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 3:04=E2=80=AFAM <alistair23@gmail.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Mark all of the existing
>
> impl From<...> for Error {
>     fn from(err: ...) -> Self {
>         ...
>     }
> }
>
> functions as `#[inline]`
>
> There was a recent request [1] to inline the simple from() Error
> functions to avoid the function call overhead.
>
> This patch inlines all of the functions (except for the pin-initi and
> syn) and converts one existing `inline(always)` to `inline` to match
> the styles.
>
> Link: https://lore.kernel.org/all/CAH5fLggOnVguVErjySphX__vs3iYAo4O+J6hrX=
W546JrWSq5ZA@mail.gmail.com/ [1]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Dropped `projection.rs` since it is in another tree and already marke=
d
      as `inline(always)` and reworded accordingly. Changed Link tag to
      Gary's original message and added Suggested-by. - Miguel ]

Alistair: please take a look at the reword in case you disagree. Thanks!

Cheers,
Miguel
