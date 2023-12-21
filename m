Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D3A5B
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Dec 2023 21:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0Yz3J/f"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dbdacafe012so1219349276.1
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Dec 2023 13:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703194915; x=1703799715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7B2vI59AwHh93W0uC8vrfYG7PjY3/m7FdPCXMD9mbg=;
        b=i0Yz3J/fMKULdAw+2bp77n245tM3KOcMBPY27/7RagDviVbgE/NNVT176xHXmqY9Pz
         yziCo+OdZWqnicOLT4wxKM326NzIvk7LFjRJZGdDDzm4Hrlfrg0taFUZfAfGsLyjHnjZ
         HQU3K8JJby+ImcaT33UYXatOunfnqqQntnoWDjwf3JHua7NscjWVdS71628nIrwfnhRW
         47HBopxIVXeIzLnrS+PQNNr8JBcs840fRf6Y9e0FQ1/PxCyfSTV2au/LTWHKuhkxjiKo
         e5k/Ly90YZXdFBKRUE5zMbJDUocZdROk86HwGcXDxrt2uADt3F/MjuN7O3GI/d+nXAmb
         V1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703194915; x=1703799715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7B2vI59AwHh93W0uC8vrfYG7PjY3/m7FdPCXMD9mbg=;
        b=s0zzSEf7MqqsrYQrBIcYSGmcYv4g4ekpsO6PMaxRUwOQJElrzrsbMY7rftJExb/WZE
         yyL3h1DJro5RjoKGc3bC/NEXYEgSFZFMpm8nPQss58L6UN+xdBLSOEKwDK5fEyp+Yd0m
         Nawddr0/9E3+QxlwyyuvTsJN2dpIaczL5zVesVJrlE9pYX4tC8gWDMhrPkEurnp7DgWh
         SkLT+MCgE3Q+vkjuOy6AD5EsgfJWILMG+UlcVZKnHJN77Wiby00/+e7X5J2MgnFIVkbJ
         J0I1obb88Vv8cQbt7DT1UyNviNBzT28dVHQF9QJoHEf0nB4caQEeM0vgh5ltW2LOw/gE
         H8Bw==
X-Gm-Message-State: AOJu0Yyr+VxwYuK7CGfycfHQ8dkiv029HahfRd+c0TgCHWiyvEH7AZLJ
	S7dMSTCeHYyUzQRsRClxCDnp7jn9xWTKUfeKSdg=
X-Google-Smtp-Source: AGHT+IHl2Ac1oxmhgmfWhbV97FRGgGvlHM10G0d57fQAoBLlZoHNObKw7UY3a1G8lyQITr7MQ/BEmXqXUJsuDZP57LU=
X-Received: by 2002:a25:dbc4:0:b0:dbd:b5c2:6ec5 with SMTP id
 g187-20020a25dbc4000000b00dbdb5c26ec5mr368490ybf.127.1703194915616; Thu, 21
 Dec 2023 13:41:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212081313.226120-1-dirk.behme@de.bosch.com>
In-Reply-To: <20231212081313.226120-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 21 Dec 2023 22:41:44 +0100
Message-ID: <CANiq72kEUyQ+Evjfv-c-t4UHi+SpAJ6dgrRAY_zdsBO=vHNm6w@mail.gmail.com>
Subject: Re: [PATCH v4] docs: rust: Add rusttest info
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 9:14=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Searching the Rust kernel documentation all existing Rust Make
> targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
> rust-analyzer) are explicitly documented with their Make commands.
> While the Make target rusttest is mentioned two times in the
> existing documentation, it's Make command is not explicitly
> documented, yet. Add a test section to document this.
>
> While at it, add some info about the more important KUnit testing
> too.
>
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied to `rust-next` with a few nits tweaked (added "the", newline
and quotes for `.config`; expanded "repos") -- thanks everyone!

David: your `Reviewed-by` was here but the change substantially
changed from v3 to v4 -- I have kept it, but if you want it out,
please shout :) For instance, perhaps we could simplify the paragraph
about KUnit to just:

    Alternatively, KUnit can run built-in KUnit tests on boot. Please see
    Documentation/dev-tools/kunit/index.rst for details.

since the KUnit docs explain in several places the boot option vs.
`kunit_tool`, and it is one less thing to maintain, but I have left it
as-is.

Cheers,
Miguel
