Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D88B3B71D2
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301132; cv=pass; b=Q1WyktW8nssHFAvCIMFz5Aic9ngwB7iwD0d71BCxL20FkMlakgKzdLJ8oSnzzKH9NtdSLBEwR3AdeDheJdnbN8HuS/CX6FEsATCFYVDYPVS4zvP+L53SzCxpTuMWNWXRZkeHHkTQLcIu7LkW0u0tnTtKfz/BCDhWP5Pxjkkv0ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301132; c=relaxed/simple;
	bh=VAJaZPrYdKpg7XFLHJhHHgjNPw07ISwWrW3nvc2Fo0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJWTxu9NtlMEpoDYDF8VXt+ody974aa5FIpLFYtYVjJn/pCuul0sqoN54Sstu8yeEtReO0IAgILGVkrGn+QGDICjuc0lF/CDBve7R1ZPBGKlQThI0+cGwec1csnDMQLD7IZ6PuwBP+PqWF04W+ZadYTQZR3h983/1gtvaugVjgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxW45D3J; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxW45D3J"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso96224a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 01:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787301130; cv=none;
        d=google.com; s=arc-20260327;
        b=GlDuW/c6PAyF4677IuqZashZIDoG/w0NpW7oQ8AYsa8dA3mXF30s9zWAA61E4xZES0
         4K0BNMTt55n/fkGJnOA1viJsdZHzX6WoOGdux29FDrl9GoJtlPRZ2KIpdFA5cWIaArUZ
         diqICK6d3Obha64moHBiXUCOXZ2OVx/HeZKnZjA5BkN2RuWnaxB/nueQsv6WGthxUjwY
         LOkQBZkW2ZRlzCTuLQbdCF1GKZ3/VjoAxynNh3nmFQbGEFmpy+/WY8x11mVMGqc5gjnA
         f4b8SPRvHi98psvxiU1arWk2TWPg2/wHd7XJh/+Vg7CQNYt9iLsn05SBDq0tfyJdczkF
         ygVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAJaZPrYdKpg7XFLHJhHHgjNPw07ISwWrW3nvc2Fo0U=;
        fh=jh4fczJBLHlveXrcqWhXqOd5k2ff+rQ4+mN6jAJjG7c=;
        b=BeqRQ9oj5zD+BcDPLSDRnTs3M3RbYt8n6HW4YAH+j+lQ0AsiMBJ52bOYFaQBrYeN0m
         uBD7BnkZIUFMnP9nrIgApxmFuQS+CMwH4+jnW6cd7KXSxV8xVnA+rX2YTS3Qo0BmX61x
         lYUUTkJnyHQsTZFm3UXjtD7AFFjnR/8zXJETg9xKdgiWwKrQ0x8lbDZZwBqOiADyVUYP
         3aLjAD83sJvjh6/J2091cc5fXVgKX56TZVhZwb5KB6QmqA1YS7v2vpzOCh7/txXxVXBQ
         PqaXvva5Zbd2DkXxi50A+oDuJYCIo2qgeVDWitWFdAWrbvG7mcq6p3KcFJMdu0Mv3lLU
         x9bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787301130; x=1787905930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VAJaZPrYdKpg7XFLHJhHHgjNPw07ISwWrW3nvc2Fo0U=;
        b=SxW45D3JbJDL1YIDk1ykxgKuNRGc9obxnW3bOlDh+jpvobwy69XbC3WwbOU+wpjGvp
         aeubf74U0vRdoL2e2X1bZ3iwTfo3Sr+ySBpcZgQ4QykVQgQRbDMFD54WohjNVXbOREfx
         GjoreXLl/3YcuiHUeeEAbJARuqeRgGKRhwj30LLmO++bIOM6cfSX3LxysRI0mFsAFGay
         hbS8liMPA5AKeAHh8QM4XQkIophfAHNfmqK3AXAtJ5jjj/vRcElFdXsjUvlfd60KDAMp
         nwXgF4qnVSFKMGeovlG9a1v0KDzTm+myG3ehCh4QXM+TanDDbz8QZ5jY75XOZzywr9vA
         hktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787301130; x=1787905930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAJaZPrYdKpg7XFLHJhHHgjNPw07ISwWrW3nvc2Fo0U=;
        b=ew0iDi0eN3aSkQD2Cm6/uPXBNm5c9WJqbQZj1FxxxNlwEy8ozgeXAzz2903NEsWYoX
         ttH2kjwApoYdMd0/yqChyTjnXPoXD3ksBPbGAcVfxRjr5PI8bxnkw5qktNMSOi5JOkSK
         0z61DlrrQ+mbVXjcp881FCDbCvAIl8SVl0F8c99zxeq5wL7tFNfpcaQKvsAINAoSb4Nc
         CaeG7cvWaaiu5SzBtO1uPdhGycbqZCXrvKQkKOk0EyN7i340/bAB8eS7Wuef8PtjlWJ8
         itmqvX7iMfl7IIIk2AXMFnpGoQ+O9ZOv32HCVNWuHLuWZ8o9F8jpwTtlUq8IyRAIZpdq
         MvFw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/lY9OU9S+vjTMSoldscwZfCZWEz2GH9W/d3aTGoBDrf8Q3eXf5wqaPZY4vfI/ZPIbLQDpXxsTHljybnc15Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mYhblLOz0P38tCRRLDRakEBRS21f0N/eXbSsuGNSAwLzfR7nBw
	MXnwIHz7K4dRPS1M6lAz100zZ6zGAU5nqR7inM7B0Emo6LPFHO0oSgebMcyFITW94LQu8zKkO3X
	NFLNksAL0QhE13ZPX0NoCUKRtPBGr4Bw=
X-Gm-Gg: AR+sD134lEvS4VomO+4hwQOBR24vJuvJn0dFMh4OqpLsYdZPFrYgma0QtfB/wpS4Esy
	tTs07i1tcbAecSK6sdDoSri4MxWfIwb4xezaYi1IoJ6BA+51twZNjYPcsh56AMDgUQ9NTV1FviL
	KyN/YAnLfxbOGFopUe/ucwptH87eejY12MlpopYInurl9o7WDGRBudhOqOZt/PIITvGf+tIQQiE
	1dQ086vY3P7XG4wVRoJ7Ogw0vkxNDO3xULpsR/eSW//bUV9VG82kaQkfCtFQU9ZGSFCOtUxeFFQ
	tVSQGvN9lYvWwxhRjl7Fwv5anbQ/AZFYjE/uVW1zMDLjni1YZ7T/rSwEfge39GH+rzZkYnoq52V
	RY9z7w+YEzhgFAmODQMUpBZhyrpF1oAFq2pCCp4LWzvcX36zZDuG382C8FO/H
X-Received: by 2002:a17:902:da89:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d64ad9ed06mr43504345ad.1.1787301130519; Fri, 21 Aug 2026
 01:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-5-a5872e64d8f4@nvidia.com>
 <DKUGXCFA0Q77.36Q64A1AN6FX5@nvidia.com>
In-Reply-To: <DKUGXCFA0Q77.36Q64A1AN6FX5@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 10:31:57 +0200
X-Gm-Features: AcwNN1WPzmGqvT3e2iXW87UG3n4hOQXFPsxJelyLou4Wnmg4iCK3mbz0zVXSqfc
Message-ID: <CANiq72=ot1SVQRxzX5NmyTspzf-eMKca7DQMdUMSHtThn+kfpg@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] rust: bitmap: add contiguous area operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 10:11=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Mutating methods should definitely keep that check, but for querying
> this looks like a legitimate way to use the API.

If there is a need to use the API in a certain way (and there is no
other intended/"better" way to do something), then yeah.

Otherwise, having `debug_assert!`s or similar are more than welcome.

Cheers,
Miguel
