Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793674800;
	b=byeYPNMkyQm/do5itRuVQS4S9RU2Klu4WKu9OpO9nXMzl3XbkatmJIXZw1EuRaYcGEPv
	 uaPA1InZo8jZK+miYU24SPKvF0vajYRbZWnU7nJU5ZM72k5F/4YqGYjDIO6SzV03beDrL
	 s6orKBe4gGElZkT3J2rYO413W/LWVMSzwACo8MA+9U/eG6GRJlrwiIlfBgF1pBCoP6Hiw
	 HKlLz9PBgpHVFv36c6d7MsT2pFmXJFxyaUCugktxv5wK620xDvRoBad68GanMOsQs33iX
	 SE6gJVn28oTyvi+/SKKVpoCWbNhu9X4TEzKs0Eq9P25WAkL5HpH1PSCMNpDw+C7ih0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
	b=p7V8jUltv+K8k3xP2om8DvrkAFBzhevwKSDnkXsmhIIN9YdbdwvFW4ihjuQFbubnJR9c
	 3IZVeS0CxsJf/Z9VaqMHo4zegrNQjY2bOEgWWJzUG20xnjdRWVp3TVLJgIvQbIzAc/feE
	 SW56xY0WMWtouHF3nVdbvk8l9wU9cWghDP5WIT7OUWfSmJWcfOsa7ji2ntBM/7OBrxPb1
	 zhegMyxcwdz3kxjRiLl9HqJRJfcpBTvMQD68kWB0ffVcEaTYs911OEzwIisXt9uAzBpKJ
	 jFwcUr6+/tIXSWTzcf71W6gmZ4zco5+TjudXbnw6JC0FDwTLmoObDRttt0I70omTaNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaMBHAtc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F29606A332
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 02:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F29606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xaMBHAtc
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so2612111fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Nov 2026 18:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793674798; cv=none;
        d=google.com; s=arc-20260327;
        b=snvOXv5hnDJ9Mkn/v8eOZLQE8woXWcK9smIB5LtEA99334TuRTbokz6kG/KSJXNc/5
         2wNb6Z6uPtyRsz8oKYS/lRRFsdFw8GZrfj91seoME6/ALyLjYlBdUtPCsFekcn4DlxAv
         AhVZVjPqtZnp5O6YyLr5i+ZpYqBhrRD+dFboF157UyU9r/yAvv2Vo9PHrxBu2mh5cHPz
         cKv7JnxzpZV1ubyuuoNS2vViE5f9WIg+i1rEdrfrfhD9SLLLU3lKwunj/W+g0CjxIQXy
         I7YZ9YRC0RkLKzxs63kx3xbg7Iz4AYjMIxG7IrePhjSK22C+dCPn5K/0SBaWgiNgYexd
         8/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
        fh=F6RgE2O24Durv8DsbGfyIHTX0LRkWX/HDDb5M/q1jrE=;
        b=VUYaOVY6BmhSSmuXEN4FDLWcN3/HVfGXjsOvdXUGSUzRKT16M/1fwvI2yb4IH69Qf7
         TfSQ57dOKm7c7KrqwR57TN68LqoCwucbOtpwiYbHqrHoIvmwMai17wePyfwhINQqSprr
         IW12FjUt7e4dcV5ZF1tJIXa96rImGGHr7mGsju/JHDr168aXEijd1kmcjgfDELfr/0rM
         92/umV1rgF7O3KqSxK/8LY9b6SuzGiKyXaTFZDtvKJ7d2FQp2O8Cz+VorMm98TIWqlEG
         4RMR/+KV5HpbdF4X/TIlSHjKtN8jEeAbgrr4bgfwJFdaQcKO9tfzZ4Hrg6fBfVsYPecQ
         cQZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674798; x=1794279598; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
        b=xaMBHAtcgObBuntoHugcBxOLoUrHT2YIGTntbFYY02LjeRx696VZdOCXQJc7RUlHGQ
         WicxPxCoIQt8eO2DyQwNKvexJveUUxNzN6gasKaLm0EtSkMWigSBdxDhZUKv6XcpUM5K
         Y93t+DNvYnLqzloo9M7jUJebky4EjyYaJXhv4OqDnNG4iEfmOQ0kRn0vjbFyiyMltRf+
         6qOEG63pEBR/Z1FVPqHbDteIytOeTLXaVm2Dy2gKHGjA04yf624+iCE8iz2WPzamhE48
         SqDztXrglog9gIw7p1baheGW9fXAcHTAnldQ73PMfzY7n+MUh/AOI6KnmoZrsqXryyWX
         PYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674798; x=1794279598;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ETqG1il4N8mKp1ES7UIxjJSG7R/8D8mHYo98MJ4c86E=;
        b=z+ByTh7dYQfz5IzSCbmFVxYlPbCw+baROSvxVbXKBerieucdNpyZ6chyQc25PXHoRr
         AqxlO2oxFVcPIBs0sbB5l4yS+Y3CKtRyhvdRaKXEVZNnKaYePdtsMCP85gbER2PMp8VN
         tsl1ujPYY6m3Nm9aCeXQ/kJJP0UDv6ctlTpobh1IJVK6CgBUEqvjLE1SaeXUGwc8Pk8s
         jIGLey5FCuiG5ypGW6WWE9L7L5wFtXh/NrSu4ZfCkPNKxH3jtV1+evMLXML9cmfin0gn
         PVrbv4uXRt3kYGYf1QE45SPV+3QLSNyutE2fECOOiPKwBvuRLan1ixqrQUlc+a0x4BE6
         FkZg==
X-Forwarded-Encrypted: i=1; AKwUvByif8Rhzru7UVNUV5IwgHLXTijFB2qPjmZm/3xhatb55roBw8P1u6ww7uc8OA2vii6oD4lEtbNzWLNQa7yCcA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wVtWs1s3hsf0dERqEOvmhQ7F2a92s61Gl2R/RE6UTMhhJv74a
	1F1Y8E68Q7gwPJr7bsluzUmMvKTVZ8D0GiJuXhyq9zLsggYPpYUBoNHKzAsE0e4BTr+0NISmcQ8
	clphTFdI3iHL3W/fCokyGgInvRoNnZak=
X-Gm-Gg: AYBFou0324GjthtOAmc4n+BfS5/jXW6s/bLVsi6c7vN19eIW0IKSsVZ40hVizNoqQ0L
	eEtKVI5ygsXs7PuJrIaoWLTgUBAZAlm9UyShCICyIn+dNklD9IuuvtQQbWuXqz4/+CNLsnVOr2Y
	6hbQa9VpX45fWzKxn49YjEk6YgvpUEzwyMlZbESDQ0zFokeEHK7vx/woKxdQZOyqVNjR4q4wZrI
	RyjYt6HXQMUOfPvpjcKHTZBBrEdqxBYb1/M4AB2lyU+EEkqrWSglrzu/PAVzNW/cmVvDUq6Zgas
	XmGSZqRIpPcsCypAt2pxcGPVBZKgKVuedx2y5GiXywuyuCK5Y+JGMXv7QYL2IGEllNqPa5PEoQa
	fINZG/1MU7tYjxZeEKIHPHkHg6ebWarM9QO7IGCU=
X-Received: by 2002:a05:651c:890:b0:3ac:4f4c:8da2 with SMTP id
 38308e7fff4ca-3aca5812ademr34312701fa.17.1793674797546; Mon, 02 Nov 2026
 18:59:57 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
 <179260197668.3127.18219777718091081046@linux.dev> <CAO26r3QK+Q5=JR5TeMzEX-WiLpgYWd8Zn0O1qx11LxTgN96BPg@mail.gmail.com>
 <179286358623.55649.5397316745104390556@linux.dev> <CAO26r3Qk3bEUwL1=MyHP6hu_YQNSN-uD_2-ceA0KtK=ejxLf2g@mail.gmail.com>
In-Reply-To: <CAO26r3Qk3bEUwL1=MyHP6hu_YQNSN-uD_2-ceA0KtK=ejxLf2g@mail.gmail.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Tue, 3 Nov 2026 09:59:46 +0700
X-Gm-Features: AclHuK89EtRkVz-OsObyYnxQUnt0Uu1dpICeA0ah4MC2QsH7LZxgTCAmcbRUiEw
Message-ID: <CAO26r3RofEz-YCnaUfTTb+7phdEzUqG5iwVObuho_EgW5Ep44Q@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Igor,

I've tested your changes on an AS5600 connected to a BeagleBone Black
over I2C2. Everything works. I'll put the details in the v7 cover
letter.

One thing I forgot to ask before, the registration rework in the IIO
abstraction and the driver is your code. Are you fine with me adding

  Co-developed-by: Igor Korotin <igor.korotin@linux.dev>
  Signed-off-by: Igor Korotin <igor.korotin@linux.dev>

to patches 3 and 4 in v7? I don't want to add your Signed-off-by without
asking.

I will send v7 shortly.

Thanks,
Coirul
