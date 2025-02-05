Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAD922ACD6
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Feb 2025 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752013; cv=none; b=QyskAiVSUNLTIuP8b7IQHHZWiJfw++eDpQejrrEu58/GOq0txp2NIKWYLlB267eSTGuxyg2dIA4N4AoQuY6l7u6+cMpwzSclbNc0rdIjDNEbEK0Tl9rINtt9Unnuk/gCzrZ9slSl2aCTTcxpy36pf8dagneGUvDHSFxcMnezNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752013; c=relaxed/simple;
	bh=ok3L9NOrgiTrJ2G13cQv6YeWLMGqGxKCuRCJEVtHz3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqjE/9xVIcNrstHGEOGTzc85EMGm0dGGW3YFIpEAHLvcgbXJ32J2l2QVRl2t2lk8pD9f1liOWys5odPAvXA0mlZ7CvpqGWLsN/WUwXoXWmVOVf4tvCuq8LskFJUAO1Xe+BQ6oMjP53x2+qoS6649dubzSHNQAgnKGNhwt2YFTE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a8Ueok+s; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a8Ueok+s"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3460307f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Feb 2025 02:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738752010; x=1739356810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok3L9NOrgiTrJ2G13cQv6YeWLMGqGxKCuRCJEVtHz3s=;
        b=a8Ueok+slO50osBNGGMXOQ1YbSzUZpzHSE5bTKGy0bDE662nE3VdigffVE3g9EHgJm
         UTFLh5mzmI1ChJoYs2BmSEHv/3IURZH6aIgOV8lp3QkUbAn8tl1nU2B8t9udSIfvsuvC
         jWbxQQlFF1wTV1LEqeBRdqP9VXIzCurvtpoCPL8GAeJRR8y1XW+LaWu9OK+5du95LSb9
         i1NO2ItZ+THayqFJDfRWm3aN4TGrFc+LtikyGltHJDhW8UnnQiVHuSX9gmPn6cIIVry1
         kjH3FxAVm4wxu46qhLhCR+xC8Y3FHHoV/LfDN4nghoPIuST5Rht3fBIP1I/AO+HjO5dk
         E0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738752010; x=1739356810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok3L9NOrgiTrJ2G13cQv6YeWLMGqGxKCuRCJEVtHz3s=;
        b=LOhltjWr5FOiUl3fi1pLbGDLVU9NarH0kzSL0NZOhu5RShFWRKmZAmyMEXmsFb3Sc1
         wCgCY3ZiUypJhu83Wj9VyCDzX8MGqZiX+x3NjrKaiLDTbThp7Jokh8d5y48gV8fQQE7M
         j98GWGrA+4fHk9y/ckRvAqt7xerS/tar17QbOK0csMHOLL/dZbzO+c37RzkRMkH94qeF
         oqcxQu+13KYv49qw17pkJlKGA+8XMjCu5gDsFg7Hq0PniFU7eRibbKW5Df/sTkFNo328
         gwEfcROv0bBE4s1e37zuzTkc54IRowO9VBbgaRn6rqQAI/6kib8JoERjzHNdHmCdSfzP
         fbtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpJylDbKmmo93VM8y+KfmlgeTGhVqrKWI44MQYkZMtETTnFUuiO+Kel0BzPAJBfgW4dqGHRdNFR6Wss06UBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygFnkD8z3nQ0uUp4p9pAFIplt+3HRzbYJ53/vqN2dEqNW0jGTw
	EJpbNttRqjG99LkYEvd3zt8Pi4nfHIiW7NUwRYGCrkz08iX+iemou6yZ/nkdzN44kpqoJCVFs9I
	WsjyCbIFzsXjIZ3bsmF4FUx3ZqccAe2/TEBIC
X-Gm-Gg: ASbGncscEvV2+s0vrLN35ZNUKz2cNqlPqMaPif5J3QDpMLWiqFQe1+UPuBxIQVNa1Y+
	rsamRz56E2ikss2QW2Y51oEeIZnLj2atlPcT8MaKKSe0vpEEIWYFTdiNb+P8fz7jV5d5FL4PP0o
	E+3Zv4fT1VhVGSDSnSALA5jkmpSMM=
X-Google-Smtp-Source: AGHT+IFgCfsYB5W3VJfmXRjdXwgsawgadfjC0P2QF+7DhKkGytDdoyEZ1kYgYvSLSTerc4B9u7Zm9jyi++oT3By96fY=
X-Received: by 2002:a5d:64c3:0:b0:38d:b3c5:4a88 with SMTP id
 ffacd0b85a97d-38db492050amr1485678f8f.54.1738752010235; Wed, 05 Feb 2025
 02:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204232824.3819437-1-robh@kernel.org>
In-Reply-To: <20250204232824.3819437-1-robh@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 11:39:57 +0100
X-Gm-Features: AWEUYZnFbKuaN4rtly1lDrAUSflqt7pqmStwcS774dgD-QUDEKs-d5zWsQLWkUc
Message-ID: <CAH5fLgjrYNek77De6SgCGiLRhWWXNe+PKc1_ecPp9MbYDSj43w@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: Convert IOCTL defines to an enum
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Beata Michalska <beata.michalska@arm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 12:30=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Use an enum instead of #defines for panthor IOCTLs. This allows the
> header to be used with Rust code as bindgen can't handle complex
> defines.
>
> Cc: Beata Michalska <beata.michalska@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
