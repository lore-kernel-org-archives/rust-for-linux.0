Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587CB422545
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506874; cv=pass; b=cQ+Ztq0ZgYf8GUirdaEfSjiDtteUmXSsAU0Y9kEkP19CEHQSL4PnOpIMYdqaDetktv5PsIj+OHsM0tiAaEZtn7XP7KhW256iTpTPC6ERaoIpeVNY4byPKoxakaqwRhYjlFEbVQsBIocXbyr1wnmqOcqds8ZzI4KgGa6vXjYlpPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506874; c=relaxed/simple;
	bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdFIQpIyLoC/7KPSuLFGvyYKKQlQ8N533yOucIYIky/9JFyC3T470+yjx1zUw1sJit0PeqwLfQyjpO4/oAvdSakICfc7k5bczH3ksF2PzV12k92pq7DnQLahJe1iAM7kYaWFWs99Ba35z7NHCkKWfceidm62AUimyXRUVdWqzmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0d04Hnb; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0d04Hnb"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso16475a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 03:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783506860; cv=none;
        d=google.com; s=arc-20260327;
        b=fiC0hL/chRv6sew4ylGjpAluOyyUsmrYSxFNjwnRdI2p3VN9KVb4pCnu7Aw8hthQCb
         5x2dTOtlg84OGgsr9Kjhriqtfs6JRHlwc7wqymN5J59nDRTCjcvtSLfcVpMIIG0Lvp38
         ZrLTvazFKkJy8FTc+QMp1nLUa0xMBHlH1wDrceJwVJlDdWc1a9A362NozuQyO8vaOx4K
         /wmFH1yDNbhGA7Qn0j17VVVRe2HPXbS6c2o4E4N4ipnZ2bzVXrgjkXXayXBVr+rrc1HP
         D8+VQXu4SLw0kKpUzLc8WNKO9NHc7Ye27eqOmo0hCqmEiqBjgF1ms4wlm+HYEfEqhBmY
         tqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
        fh=UElypd4X2kN+hC6suJ1sfYWJTb9fmS4i6Tq7+7xh6iU=;
        b=Uzvc8Wsn/3zRjbAo3bpov5SuO0TypnXiG7CJCNitu9a7xHH73LXPH7dQiXK5Y1DYEG
         u01VGCKs0E+qDOrcWksZhneLlwedTCyMCymzanS2zzjMfSw/l7xXnxh6IcqcvRUjpjU2
         wwNE2wuyttjlpqXsPJIrfFQFd7g9NtVKofyVeYdjAVgG34Y3iDRNlcWgAtQzPBgDF14n
         WI6xSzwgGbPHxK5uQjmQWLz9XbnMd4PlrnHZjAAP2jTa0DJpktkPKgDN2nrAO/PlD7WH
         3YwS5LncTk7JHw1pIK3lGBICJFk3We+1SpoMU95GIcEikH++Bl85HJvMHrrSEnDWFpuI
         +MOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506860; x=1784111660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
        b=E0d04Hnbd5JBCfkVVLlFLQCBGKGoe9pZsPHSWTt6VNJ0g5LRhsDq7W/Ymwg5sW67NW
         KI11RQLjO/5CmLcT3DjVJ9C/z0A01YaKz0aXxXLwdu6FZduvJhUFKp1zv6BLk8EpEAcK
         sf3EJDfHXBH8Ma84DRK1xo0HwzqHpxPPsjgPhwB9tPqSJoUheBnGo5Ii1WaLevaR2Jph
         TfpQcSiJxiT38J10Lh9fRhVi/p1E5adua3i7FHEoukRnkBXz0QMQaVxTJunKMfzKyOed
         1DG5v+x8HNSRTPqAQeGq/TnDGc/higgta9bj3ENqwpuJmfiA7b7gX4+geZ633yUuQc5m
         buFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506860; x=1784111660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1UpS+73rzKmbQDqdjKaD2WlfUfXQNd9Rp1m77QZLw4=;
        b=KfRpSitBTBxVgYyT0Kt8W80zcU+M9jBmtC2BwuERz1Y8b5uq7ALlkX5kJofCf50KXS
         2l7Cf4xxrle9YJ5Zaz6n5jO0PEH4DhPKJ7FI/fEZgfk4vTjAitkRuRzILlaKgQQgsofr
         slE1gZClUHyQlO4mA+wIzmnHmXkbrepQOIrmYwbsqK6yCXpBVEvFq8N16lkLSJXhwEXI
         r7u0q4t1SD/v/WsSKMyHafCoie7bdzNoUPI0OpML3O9NneRugO4uzAHGItgcZBbH1mVs
         wy7ShA6zmSqwdSItLrl3qcOSmI7UsY+rCojfF6RsuPq17VEAKKdZ4zLGm/sixN+M/s19
         sYdA==
X-Forwarded-Encrypted: i=1; AHgh+RpeU902pH3KEIQY+UC8Y2e3RboCFOZUGdg6sxwPtOKNSydaujITiScWkjrk0W6aUbq+Cvwfbdwdl9T+yWKrlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+XUd2JvMqUFeIpuDHPeb2YI2m57Pogqd80L5GnCWsdEfaGy78
	Yc7n477AgK4TAp5wZMXx9i6ckW2fVBUnos5lab4xT/IaVmUFYe6IbChQ9b3tx1wJymrt/EmCXZ1
	HTrY06xBVNUXw3O1irfibVvvy96bRfDI=
X-Gm-Gg: AfdE7cl3jIcTVQhgqDmL4NyocCwI1XBh833dBxiMyiUmNNsu2VikHrQ8PBTJIGDQ/S5
	NHMl2QEoF/e9/iSV2ZLnUXxx3u/C/org5xdA7XONq0I1g7RoSOSZBpZIY3NXbriGjVI684mFQK4
	diq/+1izAkAHKvTjba05VKKVLliLA1Vrew/9ueBeXwRZrMLU7otF9iA7tDBraSkHiSCS2U1B9y5
	HGiPV74l9Bj/2aVd9H5tqWepkmccUue2WXFUfUdDqVOm1wpZ/5GXlBHtgmG7NHnjdUvvvgnkJbe
	EBOhztP5SIuyb5R3k23uC8YRPFIDQu4jftbpMHuW1adfUMflT8VPfFCbR9jeJyC/QjiibqYzjyP
	kX2GyxR6iH5cM
X-Received: by 2002:a17:90b:57cd:b0:381:2d9a:447b with SMTP id
 98e67ed59e1d1-389417e436cmr1662657a91.4.1783506859636; Wed, 08 Jul 2026
 03:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-io_projection-v6-0-72cd5d055d54@garyguo.net>
 <20260706-io_projection-v6-1-72cd5d055d54@garyguo.net> <9AC77170-279D-4C0A-89F7-8D07F418AADF@collabora.com>
 <DJSLVGBW90CT.3W3FHC3J5NPMG@garyguo.net>
In-Reply-To: <DJSLVGBW90CT.3W3FHC3J5NPMG@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 12:34:06 +0200
X-Gm-Features: AVVi8CerPf3D12GiMfvLd9xxakdPl4vxt6Mk91TDYQmPEW-zWuPFQaL-PCqilw4
Message-ID: <CANiq72=8V967CuH92AJBAob6YaygXtCYY1GAr=qGuF8JzQfZ3A@mail.gmail.com>
Subject: Re: [PATCH v6 01/20] rust: io: add dynamically-sized `Region` type
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 10:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> It does, but if the alignment is 8 then it breaks a lot of platform devic=
es. 4
> is the most common alignment needed so it is chosen. Different base types=
 can be
> added subsequently when needs arise.

Maybe a two-line comment/doc would be worth it?

Cheers,
Miguel
