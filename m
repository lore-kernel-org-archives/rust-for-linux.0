Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CBC1362
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Jun 2025 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749291445; cv=none; b=TyvpaKEGRfGv3SX/lq1iQv5nRQok7C5+GTdyJFxm7TnznhOAbZjPjzoSrVQWkaY+IvI5Gs67cQIMytTlaCEEjJXKaU9XOPXODAQM4sa376t0NmnO6rYiX4y+xeT/gmjiAsWx6jvy4EI6paDkJ6AUdEMB/1jxsQGehI+23WCJP/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749291445; c=relaxed/simple;
	bh=wX71PJ8DANoRqqYNprxNaXYVwzH6hRJQZimd2sdDAJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVkRVjutc8SBtWjFUz06o5Gpv+awDrQwQR09tpMlhUzAc0a8wtmKo58d5NNF1VI/IB6EEKobe7n7uqJlYU3LzTjXqikQQmE+LjIeD7w8jFlRKmuAcvykLi9pWmpbXzH4UXy9FuNHL6OBPlL7gxiv7a9yTMk6ZC5IhXgV3FGFJw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1Iklpz2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1Iklpz2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311f6be42f1so487199a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Jun 2025 03:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749291443; x=1749896243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwG2LkuALRhKyfu82NgxSjdDng0PdRvNn4dzqxWU/uQ=;
        b=U1Iklpz2cBmex+kUXjkcWKxstAO6Q0mdXuJVUTFBeirUNhlLJHrDU61obKKhvQCw5n
         EIRSPOIA0JuEsuMR9i5pDKHGD0vr5uMZ0NWFmJx/mQyH2LLQBAWClJwbjyTa+4SlzB8y
         kAo+AGJtiN6DKXl3PTv3lGPb4spavgacWYwaK7+wtMqCQyuqqFL7EgbvBXFWE2LGY37y
         TV6mDkgOQ4Rm4nzsY1l9yrApEKVecCqdRF4HilURBZMMVFGO1Ognp17a5KFTZ+M7kytl
         7babtHTAS85nMpf9QvPio/w/RTISbTwN8ruKN0/92e0OyZVLUvwF0nbcA2q3UkwKkeLD
         WQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749291443; x=1749896243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwG2LkuALRhKyfu82NgxSjdDng0PdRvNn4dzqxWU/uQ=;
        b=vJet5TGwxVXqJnnmCTale7tRmCM6hnG6Elyk68sMd4J3vW/sbR9TE2uaZMJmXD/jhb
         AM5OrYzA0u6WCJigfSkQ9XUTb/pKo07co5kf6bce/VuAk7E0uc1+uApl+fn3XgkC6sQb
         Shxdvv4x/d6KQLlOhqd9a1bK/oZDgMzNwUNwJQ6lDsSDdIaQQemOqk0N6bGXN0y2CQCy
         imHla/QLFjR237jLYmMDZyqfEinBWTQofdpuWeskVsPm0WgK/ifNxapjxcqLdRRktHSK
         s7DwNRFnQCzwSYCrGvBvx1xtvN17ebs3A9pFfS+s0HOaTosLMllAyuMWqb1W/XODKwHv
         EmtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlII5mB/6et0em4bFssggmqtwAXBjkVzGybwBrWnisGdmofMLobvYtmSfXAGK8ADG4wPBmYt9m4ISIZ0sa1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15Alz/WmCd0Sg1MX8vm6UC04ABOC0e8ZyYqy1G5gf98MKhI3O
	m1AsAkotWD1/XCoMio0kVNNsC1ySqAZ3CET1p9B+ieTjhROHXMRYvQkPyIDLeHPDy2OwqVUvJBo
	Fyr4CH9gdbV2KkoYF1W0K23pz6Mxr70g=
X-Gm-Gg: ASbGnctAMwMK4PPgsv4AeZeJz2y8cVGwOu0Uk3wR2zzjzrVr7+7U1RG//5VKEEG5Fgz
	AjOxiyRVY1VPVyz2G/eS6C5/9Rpu2ETfdxLpvhEQX1vcqUBdbWFd+oySZI0GIx4Pbvt1fbGaRDX
	VrWBfuvVcjVSVQTnlWLhy5tb/V2NNbHLPq+G06zhjNtAw=
X-Google-Smtp-Source: AGHT+IHBOMIcL9CvqfLOJPhSVm7V94Y9yW9E29q/yh+FrR/OyZ4PRM/dDuPued6+/sjbr2FnQdSKkwbQnTHASx0VlTE=
X-Received: by 2002:a17:90b:4f4a:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-31347505422mr3600327a91.4.1749291443247; Sat, 07 Jun 2025
 03:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603195426.2360773-1-ttabi@nvidia.com> <CANiq72nGZusApAFztsZOoLhRWJYEMmRY6XfAC89e4-dW6snC8Q@mail.gmail.com>
 <ecc4bb6c582bb99c17b4795d80d2556e98e590f9.camel@nvidia.com>
In-Reply-To: <ecc4bb6c582bb99c17b4795d80d2556e98e590f9.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jun 2025 12:17:10 +0200
X-Gm-Features: AX0GCFs74tS74YRZ_K-68J9MR33DxWBnIQBhu3bBv88ATOV3NWSkZIVHjAWI8PE
Message-ID: <CANiq72mWq5x2zr8CKXw3mchPMhy0gxHAd8cmCwe0bfaRBW03Og@mail.gmail.com>
Subject: Re: [PATCH] [v2] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"lossin@kernel.org" <lossin@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 12:11=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> I don't understand why, when I use "&FILE[start..]", this compiles as inl=
ine:
>
>         pr_err!("{}:{}\n", sfile!(), line!());
>
> but this doesn't:
>
>         const SFILE: &'static str =3D sfile!();
>
> It seems to me that the second line is "more const" than the first line, =
if that makes any sense.

The second call is in a const context, the first is just a normal
line. So the second must be a constant expression, which is a big
restriction on what you can write there, but the first doesn't require
that.

Hmm... Perhaps you are thinking that the compiler (or optimizer)
should know that it all resolves to a constant, and thus it should
allow it anyway.

However, constant evaluation doesn't work like that, i.e. even if some
expressions may happen to be able to be evaluated at compile-time, it
doesn't make them constant expressions.

It is similar to how C++'s `constexpr` works, if you have done that.
The languages keep expanding what can be done within const contexts
over time, but it is not based on whether a given instance could be.

(One place where we do use "this particular case must be X" kind of
logic is `build_assert!`).

> You mean you don't like [PATCH][V2]?  I've been doing that for 20 years, =
and this is the first time
> anyone's complained.

Sorry, I should have said "ideally" there too, since I intended it
mostly as a suggestion like the one in parenthesis. Neither of those
are blockers, of course, and we regularly take different styles of
patches. The `--base` thing is more "important" (useful).

Cheers,
Miguel
