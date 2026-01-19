Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCCA270552
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811752; cv=pass; b=cd5kdhRo4zKp+j58neE3M/kQ+GeiQeOLMOgVQCb59hHaixsnrAlhUcEaUJ+MurIEO3cuePuh6XSK9atFaV37Lm4Cu+hObdRLxPYbLViLND4nlypKrKk50VoL3wwEsFdmp9mL3ytABxYFMVol+TDzu/GSmJBa17r5ajt3EkPS+d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811752; c=relaxed/simple;
	bh=Mxtk6mXK0D0gOYRvwmaggbgDUpJlz+ofAlFd6tNyRZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLNX7sAGPEnntw/pexjrx10yO5YxcgMI9JRjaCaUK8N/J/me72c8UfFtqc2eLEEIGCXd/RZzIkKhK11MbOJ75ct8LyhR6pre2hKqX1Kxkgrae++xw35lPjpasR9L+nkYFQw57iaKf7rvlj46+vY5WUrsSKFB7R37oeYS+e2IcEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyF4Gpa1; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyF4Gpa1"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b6a868ad45so294086eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 00:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768811750; cv=none;
        d=google.com; s=arc-20240605;
        b=DpnGCgKIzAj0rntA2qfOtcTjPAo1gEjKqADj/eLXb6KFV4qSu7wH6OUmXzkiETyiS1
         C2DwM2rhSm4emS2PnoeRvhgxVXsayvqCLhPQKc5nWwsaFpELtiEr7wQZlmegd9F3ogd2
         tigTrAg781KmcGFKkGVQk32DAcWB0ARgtrMCEuzL9MVxkm/Q3HzlBU6adCrOsXb0/Unz
         zPrmpvysdYJYjaf4sMIzK/Yt/e7TfaRUR0FjDMe7AGHmMzzvYubgOa9xwiLh5yGz8bkm
         nTYNmccNsaJi6gwUbV+NV2QZv42IjEtpfeb9Pd36hHORBfPLb7DfBKNsCEIfbqoRW2A6
         HhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JZu4zlgijMIr0xu7Q650CgLa2HK7jgDKe2vdiNzn6ZA=;
        fh=IV4tZxQVEDO/fPshWJd8+CXWQB27Qg4arLYl16yb6eE=;
        b=Q0vi8gITXSkrasU2nr25lwOk0lgjmFTccJYd26KBZOj6uRp/hezvfBndtzPCpVHe99
         jO0ByEaO1Nmndlz6rP0dRK3eklW222jrESUvuRosqNrGM259WHwRiZI4L1jiWjddom6Y
         odegf8P7OsrH/lxK6gpS99rjczWAWe2ogkuLzx/i+p933yYxq9eefeZCG3bXtWIHzuCa
         C3J2azJiNNor1mQtL2wuVtJCnF+5oJv2FK3YZHLyH+kvwfc6Pvm5U4u6v433bCJ1iEmA
         1swxYeY4CYx9YcoRVFuDgyoI3YGmhOXp1GnqDJirHp4BR38LuUYVEjNSlbg4Z5SWogVP
         NwHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811750; x=1769416550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZu4zlgijMIr0xu7Q650CgLa2HK7jgDKe2vdiNzn6ZA=;
        b=RyF4Gpa1cEpnL+tBRgkOk+0rePeBlr2/CHd2UUKvoSpfMj/9QBZZ9x4ykA/Bf0Lg5k
         pm4Se5rDMkHXPwlm67YOrNR5w1ow+749A04Y3XO1OxIcGsIFf5RcTqZwFJa18bjkrN7/
         9KADq7KynA/HjCo/o2uAeKN0cCxIU9vgUhLvapKqIXciBgOHG4HqaZ2F4Pr3TinwqefG
         +XPEr9/SebK6UrUwv+R5PBQW7MjMZ1nUq+uRKYH/0io7xMF3FO1ecaCAP494LBw2iL/3
         2+YqIKfet6w3BT9YFgYVr/Uv/Mzt/3alN+1vUZNap3b1IwgHfKSD+hqzlDI2PUB7a+AY
         YZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811750; x=1769416550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZu4zlgijMIr0xu7Q650CgLa2HK7jgDKe2vdiNzn6ZA=;
        b=Yn9iZaBjEfE9Q7ZKLcs9RUpRXJXHU+/dwDpMYArQsOjIG3tCa/T7cKh08IIPm/jc9m
         LLycBY576DiQVTiPclEqmy6WKGko+jC1zaLrWzf0st/Yn5ZM/molWbCn1qvzyZnSmvtw
         H3JV7LQTBC+gzTl5vswekVy/W+RnT4RW6i0UL2z8PhSAH2R/gW7FydohZjJBuXW+4r2x
         Leiad24s2ez0+eG0ksWlGE4HgNX8LS43zjvplQ9pHDNqgf6GIQvWB4jquVTk6byM892d
         6LBUbd5UYPxifCnsrECvNaGkfLEm0YI7D5l3CTkvQn/qZ3kBBwDWNfTqJeofCuiYMz6x
         daaQ==
X-Gm-Message-State: AOJu0Yz9TglKYRxNOvzlgkitcFmsfFqo6om6hB4EdZYZUaHNeb6sJ/6z
	EX6DUsDPv+lJOFvK9FueyUr7DfsRF2RitbCaptwgW7Z3FMTkdz+OnQuSQpBRySA5xpB3ZTz4qrw
	DfHvU1RtkCLyVoIAVXfWRWu62HYrnXTE=
X-Gm-Gg: AY/fxX45lUDy1+W4TQqLAcxo/KYUHdC9ZbDalgBcvKQBpkphCDfm+HR7e9VLAVI816E
	yBW/K5MHXVIW/FMosA5hGurojMqRBQM0LbbtV8JO6qeAmTDRL3iG3Msw+sMg9CSWI9WqBgh/4Ws
	AFYqLfuq8im1tAjVnJfGmgffTPBO2mkldLaf/uNEnVWAFbGobvPoQamY3Qtg0b1vZs3M7GCIEdF
	pA0fqyJGTwqMIZwAvLnb/MOfoT+cdLAqXW7uPTcCGdf6UUxnTkG7aSE2NAPgbxLI8vhEwoOy0uK
	Yus11rKwyQUD0JPKfMXyituKslmKdYBedINUJl52EU3JFPG13O4Dr0KmQQww9ZVYB90gqgJmoad
	H3WpItwRKjgdL
X-Received: by 2002:a05:7300:8b9e:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b6b4104734mr3951028eec.8.1768811749597; Mon, 19 Jan 2026
 00:35:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
In-Reply-To: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 09:35:36 +0100
X-Gm-Features: AZwV_QgyiZUXm_4tJq2y9r1MMxX9bgXqf2tYGxcHOuGPmNx5-V9cx0mbWvbR63k
Message-ID: <CANiq72ncCdr7OL4u77VPM2GH7o9ES9nYmQ=EcMYxeZKn=sBJHA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: tyr: Fix register name in error print
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	aliceryhl@google.com, dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, a.hindborg@kernel.org, 
	dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 8:09=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GP=
Us")

Perhaps not worth backporting, but it could be, so before Greg's bot
replies I will add the tag for consideration here... :)

    Cc: stable@vger.kernel.org

Cheers,
Miguel
