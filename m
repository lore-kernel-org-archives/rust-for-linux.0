Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D513A44DB91
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 19:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220658; cv=none; b=RDsMEQCaK0PVEHgOu9mYG0rZz2BrQn5vO9jCeBmDVXsIOZKWZDiSsgLViijWH+fvl3BPV8KeZcuznYrPZ0JUmBGqZs9anUOwvXwIwopgOW6PWltg+vq+b6h6qzTuBBb/S0tE1tveQt7sWbqmclRuXvyiZN88LELNSwXx/NIYtgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220658; c=relaxed/simple;
	bh=tOEJKuqHHzaUF5iNtoYOWbJbmY9YayOUbISzMxzdUcY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OhICO17r3u6/B6Xw5DyAyy/VMye7/B/LS1nOcO8/BQJbwgZzlQu9gtgqXZyVSqhZ7IPxcQNfAK+LxDZ96CtMvkusOotjNZFGKvnbMwtl/mqa6EYM9WAYZpaGl/ACPvB7SYcymPDOj/V6YsMGkbj5yJGSIoKr8dPYHVhpg4cH8CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdGYFDdT; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdGYFDdT"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5069b3e0c66so48153211cf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 11:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772220656; x=1772825456; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMgCgfThj0uiQ/ajRpndQGU5RmdKGE2cIcjmdTi6q0U=;
        b=OdGYFDdTNNiIJoxZxlX3SL8k3fRV8cCkaOE1RIf89nnZowl6j+UJxekkP4jhvOoqzT
         czZRX19SuXT/hxm9TyBtWG8S00OubCrQTQEM06W4/DrUBv+hDTj7H0PQaPcc/eQwfM/y
         q0zfCUVZRzTZ5Bv73ytCNXmmtPBLMmAeLz/lAljpcfalZ/atgRqTfExCuvIXLD48PuBa
         YzfpQHMPSLlMEspMEodBfLkHR0qv2shZGI3M4OZeArEihbX4rw8ZRgsjSmPoZ+qvnpGK
         nN0j6GPmQ4fc/XH04S+e1Dofwv75naTF1Of9r92cFynoQODruRwD3XCxFFN/4umvIUyo
         O+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772220656; x=1772825456;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMgCgfThj0uiQ/ajRpndQGU5RmdKGE2cIcjmdTi6q0U=;
        b=mXsI9ryogyW4JGZpdyjoO09efbZTUfZOvD0DYomAjBb93hOFrcvPmdd03veYutNt9a
         pNJmcIk95iuoOIT9Ua7i1i0HfedNzthNug7bAYN6OsRVBzhQptnwqvgRDg4D3TJj5uJY
         3D28oZ7WcsDJaL/yGC4ye1yf1BqPEY705l5/lUUe/244uFiaF5ec1AyTZCisrrTWgbG1
         5rIFwQEfMRWsx7dJQH+FNg3vW46i5PBxeyLpiVAT6zHc6fioOVumgpPgjbHphI+0tW9r
         Bhf/xl5lAJBReoAnTc8mwsFOlfjmxd3y68IcbUuQRqNCMlYrnNt1M/8P2R3eytuk7/1m
         izRA==
X-Gm-Message-State: AOJu0Yx2aVN2c6Lf1Z5euJ/9YtMavvpz60zUp80H8V1Fuc2tEZcvm9Wb
	rg7kOIlnNTHXQ+90inNrwzSSQM2UOGbjdGjkWDdLXHju5nBwefuH1Fwa
X-Gm-Gg: ATEYQzyrrD1iv/CYxnRxsBVVXnUCK4+PoVojJLODT6IvS7KFBbHHxT6dqiLqqq/cMXq
	93juOQTBdio2nHZC2Mdy0O7Uvr3w5XLXaIpfOgYYm2isbF7Obd0geyC2zK5CSwQAnzWofrSaUgW
	/M/f2bCTiAT5InBPJDaCB2z39vdA4MwcWIepblEh+NwucHL3Kbwb5SykP/jbTTl1S5cP7sL8nTj
	rqWl8uG2p/QzZyDuGo3cEGfIaNthF4PjVpH8//9lbzt9D8S+ZhACmlKyNDgWh2QxpOXE6jFGlc1
	DX7DSdC23tgt9RyJBANhb22xDdsx5kjRkJGazgTmOgcWM6tuE+Ikro71d/LZXu48P0ubdHKUdAO
	DgoTIIVzU66P+BaZ6eKJYgwAEMjlSvuKqqG42HDs2hS1DZg39vpIJB2lWz3yrnwT57iICslH0iF
	Jr//IL8fM6qQS7cVfrhnvBtQQYCEZkhKBmPCiuL9SA4sEm
X-Received: by 2002:a05:622a:48:b0:4ff:a6b7:6c9d with SMTP id d75a77b69052e-5075248b828mr56391801cf.38.1772220655720;
        Fri, 27 Feb 2026 11:30:55 -0800 (PST)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744af0731sm60355271cf.31.2026.02.27.11.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 11:30:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 11:30:49 -0800
Message-Id: <DGPZSF0HMGPJ.2ZDZ6J28MFTQK@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Lyude Paul" <lyude@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
In-Reply-To: <20260123175854.176735-7-gary@kernel.org>

On Fri Jan 23, 2026 at 9:58 AM PST, Gary Guo wrote:
> +        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
Nit: Missing colon after MBOX1, should it be `MBOX1: {:#x}`.

Thanks!



