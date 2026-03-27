Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026243D9045
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602112; cv=pass; b=LHq2ACk1kvrw0DK+VjC21UbsqUm7/BK/dN+znBs0rh6WrtmRVG955zrstyIc5w41m2Mkj7454nClM03tnXXm+swceCA1Q09rkaJyAnuSJnYzpWFshdttokQ9milyg+G4YQm2zr8fss9HT359SKqwEWL1dxtZNMTA5QiPvkkcNO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602112; c=relaxed/simple;
	bh=+vbbo24yKq0IDRd2PJ4Kwyke10Z22HzWjg+FVkRJMgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XsRfLCQ6gpH+VZLB6Bzi6ALvjbyWbSiYnbwikkngJprVLdVCTTILTUI4vBmd4DpxatMAyvp9jqhcZlUp/w6CD2miSjKaC8fc9DedCROSSPWGBg22EYJR8CngX/kwwJQz2v/pCk/KsWkDNkjn6twlzvjQNRFunWKZIrbmqvss8NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cD1WToTM; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cD1WToTM"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-128bae6a35aso39360c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 02:01:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774602110; cv=none;
        d=google.com; s=arc-20240605;
        b=ebhXvo6S8x6290doSCasqkbPw2JYP97oiBFkiCvMMsjXzorwFhX4xkhZIgtRbS7RYd
         qjGWuKx62DVrlDgIOY5QPZwgpgp7a7diuxYToH9svXsIJfZsqpJx+NfpAfAy4h3krhdj
         EOwpRcVnp4ENLAgGio8ujtka3eFJPxA0mjhiHskfajjnxGWGS23eT7HoQJYjti+6oo5F
         0eocZ3hL+LI/yfw5WOPZjFNUHeGaH37QL2MtP9DLabXnQmtv9tQjw4Px7DgdKJCYsv83
         bjGA6sbslz5Ib77jMKwqvqUdiB7Y7/ORP05n7D573WZgGHwag4Wn6NWjzjFbEtNxJzyX
         jQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FXbx06b5gGwUCi6E4bAqfsWHp7LT3go+/CbGA5Bn/zY=;
        fh=lRPVaFvjesWaRintId7PErXjd9KpCR8Dr6kwB4fz3Ps=;
        b=gIKWh0lm0HHkr1O8quDeWSiTaU/lIjeGOZ9+6Pi/oZqIleKePBOoWIt/6vPuGMDlWb
         wH9ZZBFGVhm3uyJ0Kk0szMgpugbalT0kRajct/WqZL3iO18FTAliqoJaSBG92qJksRU9
         AguGqpP7o/uW7qnQ44v5JXSubZRyliTksM6Z7OGx9VBbP2OXDynfFwokgARGwSczhsIF
         zJmolcCsYhn12b1i+dl/WDCGZ1sGfkNHkNiFnSKTayi1RTZS+Boaw3bBIAsbSyhSMGBF
         +S47l7x4mYYaopGX3SYapZjJoqdaIp/sDbdQgDBv+GRBisBZGSuzmQa8Dul9XBUsXZ5k
         0QhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602110; x=1775206910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXbx06b5gGwUCi6E4bAqfsWHp7LT3go+/CbGA5Bn/zY=;
        b=cD1WToTMq632dOQHQqXLtmFxgvlp6ZGLpXyYZOoRoWyqvrHdx3g3g48zw8HEruwB1Z
         V7hfh/iSzF0fl2Yyn+kKYP3fJyJAa7hMo/MTCPB3jB9o/v9nVU+7jmJDHarWg3TGMjav
         tQ0E7BvVgi6TVtua2GESboYjOIt+AF48qCaKenuz3m78buvh+HiCvUlqmUXa+pMAu9mQ
         Ecyi/S91F06LGibiFNMeclleoPQMtfWxHnI3r++BWL4M57/I57eeUhsmRF4v0iDWAKJv
         7ajv58hj8m+CZYQwOML/XYCS9Uc5+8eiVLsXVoeVPM7KcLVf5XnWxdNxehEdqlaCY4mD
         J5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602110; x=1775206910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FXbx06b5gGwUCi6E4bAqfsWHp7LT3go+/CbGA5Bn/zY=;
        b=p+P1TycGOg2vlTraD+QcQCUI/afv35o/iPLwf3iNJ+YGKfvx9gwLlAoLJXchE4sV77
         SChsDhj2a7gxjRx7HR8PuubXD5oljrWAwBgnrsjUOf9Gz5GcGqsYjox+t0NtQmcOgCgK
         bC4cv7IAJKRC4Eh9X4R7b6cv24KB63G2NA+jEvjuxlWxZVngZ9G4f7DlzybYL83dfpCH
         wCamGOaTzQJHjPsgWJkfOQFm3GgDgiqFXJWwp3P0D+w+0amuhpND3XNYV7cRzYA3mmV8
         ALB1/8T4Br6APvrpXA1AAGcmOaS8QyD6WEEmVMjiNA5It2M+8BQUHfHOHAm9GFPiaoG7
         4j7w==
X-Forwarded-Encrypted: i=1; AJvYcCXze8rQqpJpG4KBNR6UP2MX97TihkVcsAxbVwBU9kcbAWlmqRBu9zMMn7I4d2kYJKBjyuBBaD+hux9B2N+3NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDVif3ihREawAwnBDUWYNX/E9vPgj4bZHhrn5kVTt0727tvIRw
	Wq3zzwLqqvR2eb0/FSyMuIIelJIW1Cv0HuEHKvVG7xBVn57zBqiD7gj71g/dHj5q+6QAGI+BebC
	2w6mi5n6OS+f19iy9xF14xy4N06jdmJM=
X-Gm-Gg: ATEYQzxu54w2UpOP0a3KOXedIj6C9sniOfqJMlWfW9lXP78MvlqUpGk9r70xXqPY0zS
	gO4eOjm3pdmkrPn2y1eY0t+flc6E9EVkmQMXG0uTJqZajS+uFvK+j5JiRTqbqyMJP3V7LC/s62d
	LY38hhKgpzMD/EG3zrn5pHROmcBpDloZZMNKoLo4eRlI4jUmIOH4LHwmXdyGioMBpf7cMvL9RSp
	hqaoAD8KPrdnVic9UQ9gqG9x+OfgHxL5vMNXC5yOIcc2RvEblUGkizidCef7+/nvmvE7I1wOtZM
	60/sGHFOIsYzLirj2k395HHcIcLHnk2FGvcO0y1MHqlfLwXl9o8dnFoXIBoPgiuduAGNmW/60uj
	BJn718pdNLg2KwsZ3FzAWv8c=
X-Received: by 2002:a05:7022:4387:b0:128:d279:b8ea with SMTP id
 a92af1059eb24-12ab28f3a8amr456230c88.5.1774602110054; Fri, 27 Mar 2026
 02:01:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323195138.5541-1-iprintercanon@gmail.com>
In-Reply-To: <20260323195138.5541-1-iprintercanon@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 10:01:37 +0100
X-Gm-Features: AQROBzBqoog5a-kiwWEmvD5rpeosZ9vAQz8URag_Abuclk8cdHKqrhF2-U4TB6M
Message-ID: <CANiq72=TGv80K9Z=VhWkh392oCZjSVH=W5JsmYgKR1D7k8yf+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: watchdog: add watchdog device abstraction
To: Artem Lytkin <iprintercanon@gmail.com>, Gary Guo <gary@garyguo.net>
Cc: linux-watchdog@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, ojeda@kernel.org, dakr@kernel.org, 
	aliceryhl@google.com, a.hindborg@kernel.org, lossin@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 8:52=E2=80=AFPM Artem Lytkin <iprintercanon@gmail.c=
om> wrote:
>
> +bool rust_helper_watchdog_active(struct watchdog_device *wdd)
> +{
> +       return watchdog_active(wdd);
> +}

Without commenting on the rest and before I forget: these should
likely be marked with `__rust_helper`.

I added a comment in our initial PR for LLM prompts so that e.g.
Sashiko may notice this sort of thing too (Cc Gary).

Cheers,
Miguel
