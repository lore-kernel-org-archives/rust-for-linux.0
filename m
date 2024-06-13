Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E2B149E1A
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718301607; cv=none; b=OAzmBtT7WMAJz8WDpEMYgYKKxu/RTeOos9CEzia5cw2/nJXwWLT3hZ2MDb05J2geiObw7f0XJtqrQ6ylRO604WSliSstqlHbMDs3U6KYT5t8IfObdduGDa1m8d3IurDgcLsBMIa2J/ytY0maYRFh+XksUV5tLh93u7/dWiEk2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718301607; c=relaxed/simple;
	bh=4wmDyuJN17eEwj6LqLgq8efIcqZ3ix0ThsXLYZ8bMBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ac1q+WoaPspYFzpzJ1vxnJeo/4HTuA/XXKdyftNW/Oqs+PmpBfiymynLI5z1OIXLFhi5KR7EII99DrV5ptTwo7Lb4S3j2d3IJjIyAW7lg3WwtNS3lmMFmZxoeVQjhO2d5WhXN6eIOgrEZqpPZzKxSgl5m+b0bje8SdNDo9uIOZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=FO/7iU0K; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="FO/7iU0K"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62ffc495935so15515527b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 11:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1718301604; x=1718906404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wmDyuJN17eEwj6LqLgq8efIcqZ3ix0ThsXLYZ8bMBA=;
        b=FO/7iU0KI1sMlbko9pzzjvyVdKzpXCdI/PgX+duVz17ALxgrlP10s4wS20fAt+65G9
         4InRAteUqf2k5S6WYiQxlMN2W1wTd7ZCbtlaZWE9tzm2ngxto4YyTkzqAzTHeuqVcqFk
         nr3b2Trwr1cFwxlRl3BAafNZVIMlaSf+hecyrdcCYG57/3llWq+80XGmm0oLtDi5+7Ii
         OOS68kAIN4DcypnH0Ka38nmxcp0yxn/3lApEr4K+uAxw8o5JKiZ8msYg3yii7ydEd2S7
         rsxUzm2FrNAGSDk12od6wL2FHWTkkMplgi7XGLyb9XCtZlxAtbXaReL9lpNNO9Q8G99Q
         r0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718301604; x=1718906404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wmDyuJN17eEwj6LqLgq8efIcqZ3ix0ThsXLYZ8bMBA=;
        b=h0sEvo0yxszacJ/z2q69J1L9Ij06QxE1ORCNwvb431AHzKOAPoAgxmJuJOb+3u6/0P
         5ja8Hu5p+UbvM9W6I3aBgu4G0aagV6weVU3Wu0T7mUwKMTJW2r37AyC6m7Kc53cMiB00
         DUPHztU0Xb4/UvnWZtQyHqsXayFo7WFed3pfMVhqa2qLWEuO6LYfzL1hgkNpz5A57pLJ
         kzyr+/dQVCMo1DF4eak22NqS2EwUJUDWRSZSumaiIjupQ0X62CCijjsnn0N+bnqXOGWE
         jKx7XITFEYO7JxfEL0+Km1pQP+P5RBm7zcyqwUPg1n44uqXBBsM2X5287G4s83Pvds6q
         ezwA==
X-Gm-Message-State: AOJu0YwLXTf1xkpp1MIggu0akNRlq00isx8uS0OW4yLwg2TxbwloXDM5
	Nd3qaojqWDXu8r8ncUosAzCqhLzQiJCacStQfuIh6pz8++vnFLky4XeYc1XgkQe30U+HlauwHK4
	KlH6zNsf/frsFEsHLMr2jM6V7Ze+zIzDh4N+f11omv64w5FpH
X-Google-Smtp-Source: AGHT+IELAVXcB5HlUWmKwqrWM+0XHZhMbAxjDOq/1bYNh+Lcm2gH+3ljUtdZW1MH/jBDwXkTClMZJ4RdhJM4py0ruu0=
X-Received: by 2002:a05:690c:6405:b0:614:719a:501c with SMTP id
 00721157ae682-63222a57283mr2404047b3.14.1718301603929; Thu, 13 Jun 2024
 11:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240607052113.69026-1-fujita.tomonori@gmail.com> <20240607052113.69026-2-fujita.tomonori@gmail.com>
In-Reply-To: <20240607052113.69026-2-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 13 Jun 2024 12:59:52 -0500
Message-ID: <CALNs47vVU-rD99zrGPT2DG9BsAEwQdjVwaBfFx-268TbsEc3rg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/2] rust: net::phy unified read/write API for C22
 and C45 registers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 12:22=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add the unified read/write API for C22 and C45 registers. The
> abstractions support access to only C22 registers now. Instead of
> adding read/write_c45 methods specifically for C45, a new reg module
> supports the unified API to access C22 and C45 registers with trait,
> by calling an appropriate phylib functions.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

This new API looks good to me:

Reviewed-by: Trevor Gross <tmgross@umich.edu>

It should probably also get Benno's review since he suggested the API.
