Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21E309F09
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237754; cv=pass; b=Y2S/GS4ZfmU4qni60UNhhyCgRZVeLMgUUN7yrYYkH8nj2Zw1b+KURo+P72hvyxe8Md11RTavClFoxwT9/ub9lE9wlQIo+hhZrCHRcPVkWzIdVoAQmJjUOZy+mqL+G/wbo4cJHIbaBroUeQkq1brgeW/+6IZ+o/8mWP1MLsuyVsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237754; c=relaxed/simple;
	bh=drCbjRPhf/6CelocQsTKz5RWs/RGtOeSnCRiaw6qCig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEv1T5/oe1NgVbQFU5X/yx6WjkPZIF9Gz+k+KOVv+EuTIe2aBkpkUxAA1kiJpHm4iSNeqy2wcuDt+BGe8Nlp06pHPEtA7d4C9Lj47ZdYlnOIqaESQwxEg9NTtum/Tfm0Mg2pEVTNH4OQ/uKW53KlE1/E4igKIrL9jamlwiVLD9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYUcmuZl; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYUcmuZl"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128bae6a35aso58120c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 07:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773237752; cv=none;
        d=google.com; s=arc-20240605;
        b=b436OOvdZAar6MtPMA261pvFx/atMwtT0snbmofi43GVZ0Wxnbd0cwDNoDJhkMgbjJ
         eitflZGeQeZaELmRi124gGbuHUzbZ/PC/YGloNkjbwn+C1ILSLYTDinYCHeOPK6BN5u6
         +ONXjxZPYmE2xvwFoT4/E4khmFEleoNrgHO/6ShpQVEYeH8aQXS1wuD1MhF7P7qD29Zd
         SbY3bh4CeW0sz1OLhZBx4gyBPMUA/0JhRNcRTW+zIYxBHMTIP1yye4MYJT1LIMC7EXDz
         RR75VSYlfnWOun/xZt5FQOPSstU42t3rx9jitwp39IwHC8aWJ2HQs2Jy0Mo/JQmlSD5y
         qErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drCbjRPhf/6CelocQsTKz5RWs/RGtOeSnCRiaw6qCig=;
        fh=5GlgbMUaX8i2V5IGq7Ou5KjDZdJzyrx4hkhLJsrDuH0=;
        b=J7vlMrcARbO2PhpPfIegJ3qocjuNkBcRM6Z4V3iroFiWI8+XbNWVszQ6RQ/apZN+Cy
         b9KtczPM8aeWMOJxs3iAh1YmV26HyeOCUDhRmkSXflAmpoOBoz2Sl3gPyP7K0cx5Og3R
         i27tAeY6XZM+tCfnPP2z+KiKRtly1yzqCFspht+P00vdjnACNj3Yl566i3BCQnEXTIta
         z2L6jscR5ETMbbIXq7Tnwb1w3MnNkI1T0GqBAtOzsMxVEittJlJXufc+6ViE8nGNhwaU
         1NP2CVjN3WEH6+Y5ubTfZM+j452V8eAoLLBHK9SoMa3pd+JT3JnzLOAJGGCBAJmo9T3B
         10bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773237752; x=1773842552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drCbjRPhf/6CelocQsTKz5RWs/RGtOeSnCRiaw6qCig=;
        b=bYUcmuZlt/DNB3EWpS5Eh5l33r1yXvodAwc8r3BJYHH+3GsAIL+ATQwuNNymD6WPn3
         XDTeIC2XeS6uB66YcvA0DmF4rVO/llAct0jR9wZtRpsEeqWw6FHiTJSX5Cz4JrxAvoph
         fd5himp4vt8mQinkR/unNwDsTm4aWfJfM7YbUlw4Ly5+0B7LiUlxzE2WES9ux2UIwNEb
         l1Z9H87kQma7C9Ep32qOnOsz+evv4QAcsVq4veo53OqmRfWqEmUtbyia6tWvqF78IWpy
         nT1abff/AFz/QPHc3tj5UGWcIsv27tVXhuJmiZjkcvfHZ+OGKzjtnfdOM128cOZV5oZR
         Bcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773237752; x=1773842552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=drCbjRPhf/6CelocQsTKz5RWs/RGtOeSnCRiaw6qCig=;
        b=PuDvqB1qlg6CAmZ3u5meC6FkMwWKnrDM1UqBeM1ABNm7sJjIIzaZkzrML/z92gO6tS
         cN0tnzGhM1OxYpxas7vrWO1AEvEnGrqN4m5eknAys3CZgv6s9OtlsVumHjAf+U7DUZep
         CeM+UGPR8HWl1U1kVf4Xmlmg/kzlBN1EylpoL7nhX8aAWGTcqGliUZYog2X6JHuMsnNa
         MwzUmz7dW12x68sBYqkqzeoiu1qJiMDgmVScWhWleGkAq8Mt2pT2QtcDZcapkxg2K4D8
         e9YI6BnbH1Y5OJMmyygXbV72f2CAgUUp07IrHO4Ty/09NAbm5yiAESAIQUHXrvVK7i24
         Gvrw==
X-Forwarded-Encrypted: i=1; AJvYcCWeC2twEsaivCRyK3b0F1KsIbnvvMRZhpJ/YT6BtdpaiiGmXf+sBz01EcsHZQrWsqx6eL6w6Yqhy6PFuf3zQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTprA6wA11bXi/3iSylOFUb3MghpTuyIs5UqnAXOgDCfs5rgI
	PqBoqavk2/qUzwLMXRfNDn5J3lTdKB/a1yCk5ttKF/aLYWfXN3SmP5n8sxbLDgXbvOfK4bnJ4KB
	w9Q6Z7Zh7J6PTkC8sivT1ZOoalPQcE9OzfsASa2M=
X-Gm-Gg: ATEYQzyvD8/JpfU4kB1CayyBDYT5G+cQFdMSylORwd0iAuCMcKhe6lrf0GpOIBgrFhs
	R52vTEulzOSU4L2ePcMocc4vG1O9Z60ee/yS5PvZxLxgzRXk/BOXxXheHavN+88kFo0Xe/C1QgT
	9eNt8Ww5+B7sYKNVr7qNoA6VPnbe3bDjo5rbQBPIrE29lG4dmr2hXGFUZsrovN+kI+DnAoi814k
	dxPzk1R+q1WK5nQVrdc1qPCaAPkrmmaHSVTZXR3yhWpCS8sifXRtk81WCLSs27JDiX9+CXkdQdB
	qzH/jdolr3f3LzVJ5uSteCHjobxgdA8XH4UBnHfhbUViCtfJ8rpV8obyigqJezby7MxadP/x02o
	SzeH8Phw+PKuGzIzqBJMSD8Q=
X-Received: by 2002:a05:7300:ac83:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2be8a59452emr542075eec.7.1773237751873; Wed, 11 Mar 2026
 07:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225102819.16553-1-mo@sdhn.cc> <20260227132713.23106-1-mo@sdhn.cc>
 <CANiq72krbKir91s-sVLt4v9k9qV8PQTLrH2uhMdByb882CXZ8w@mail.gmail.com> <v6fyrivdraa2rgqhe2jqwmow4tgqczk5e2pzlarmcwjxhai6e7@knw7nv7jtbgi>
In-Reply-To: <v6fyrivdraa2rgqhe2jqwmow4tgqczk5e2pzlarmcwjxhai6e7@knw7nv7jtbgi>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Mar 2026 15:02:19 +0100
X-Gm-Features: AaiRm5213LFNhUR_ITAVrvQlRmSySXl1cxIRnu7jWXwa5ApQMRmklpGKJ3AbURQ
Message-ID: <CANiq72=rQ=X1hhT_NWP-W4r6Nb_Ko9ZfhkL-pbu=9cwxvN1zEg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: host: use single executable for rustc -C linker
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 10:35=E2=80=AFAM Mohamad Alsadhan <mo@sdhn.cc> wrot=
e:
>
> I was trying to take Gary's comments about unexpected/surprising behaviou=
r into
> account without adding too much complexity (e.g. new script file and mang=
ling
> commands as env vars) for such an edge case.
>
> Instead if the user wants to pass some complex command, they get a diagno=
stic
> to tell them what's going on and to pass their own script. I felt that wa=
s a
> decent compromise.
>
> However, If the logic is already too involved. Then might as well just go=
 with
> the full proper fix. I can go ahead and do that in V3.

I see what you mean. I guess it depends on how complex v3 would look like.

In other words, if the "full fix" is of similar complexity, then we
probably want to just go for it. If it turns out it is harder than it
sounds like, then the compromise solution may be better.

In any case, I am not sure how much of an edge case it is -- for
instance, `ccache` is mentioned in the Kbuild docs, and some people
likely use it for C and may want to use it with Rust enabled sooner or
later (we ourselves used it for some time a long time ago too). So a
full fix will be wanted sooner or later anyway.

Thanks for detailing why you did v2 the way you did! (by the way, it
is often a good idea to mention it in the changelog or to reply to the
feedback in the previous version if you took another approach to avoid
confusion).

Cheers,
Miguel
