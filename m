Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCB537473F
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161087; cv=pass; b=N8cT3R73JmDJ1BZydT5iBKUjfw8CZcri6ETYtFuMJTND9xYWLAqq7bhyGOZ3Axi5LswdqyzsgjMR74gOHilZLNPIvHailgKxOpxYa8/aNxbskdZmk5JUfoxGPHu8DDsPFNnKFowz46tCLNozKsZh6Rf+I/qDvjUKh3+nFkMl5dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161087; c=relaxed/simple;
	bh=OKbiv5C1O+oTj4HZTm9MkPI8pY1Wh7MDgnYiN1gWUHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpZoQgIxX+EpTXzPir3I3mDqKeE9g+Mz1rK1yKrBGk3uZ+vjhp7EsN/kGIFaWAzFd0IaOja2RjW4DjvFmGWRaYMA1cp1munW+Ti9ZQvhmK6pZ/LOq4u2FyTPiunP143I4v81PY7O8tMWwzQ3pUJfc0YvPGy3FbkmvQO7vWY/0Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlwqODk9; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlwqODk9"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b7267ff06fso161486eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 01:37:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769161076; cv=none;
        d=google.com; s=arc-20240605;
        b=Iq19luwIlA/M8Fwk7jm4kmVpNw4MqoBwklZ4E6hEpTT/5ZnPi4wfLUoql9z5Oac9qn
         dZkfaWYfQGrl9WBMVF2yOv4vay0AK4/AmlgTR5o9n1MuaqDLseVT7wFZ9zvsqg8fKMoI
         vzuFRfbWA8hFcmE6REk3/MI4JhgAa/23R5acXBx7wzeV8vQbslzaSRjoVHD8cTjbMdlP
         rF/VeoZZSQNZZxwNR+gWaqmogc63tvuNlPVoy3HID9g/RbT75pAomxJ5B20fUCUB9tzj
         oFIqE76I9eY7WwJXHoBaq2xpegvx5Afi07P4oQLQDyABfahnNlu9jLNzq0JaVz+sh8gM
         BUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKbiv5C1O+oTj4HZTm9MkPI8pY1Wh7MDgnYiN1gWUHU=;
        fh=/1O26z+PCaty2pFpzqTcMwDU7kkwZtj/m+TCACJhoMQ=;
        b=RTFgLiOwqABDr1vwviDB2G4LxJvbwRcAxzTOWVwoRYNtZK5MHAJP/1AS6AfO3xC+TU
         /B7xY9bbDHMPPJQN3uE4eDxbLCst09TbTDmNEt/e1WHtXw5zbewDupuXas6OrtvuoTSr
         e3t2l1/VhbmABDKaez5jxc/l5jKtzfrnoANva6xXtzxl1InM/5KQiunAMEUrHGTficXR
         2YYEoZpfDHxQOmZqqQvhAxuJeHAsWzTfWn4UQI6qjnvUpX+420GhVHLpzsVcDHlje2RE
         rDD4wfoo502FlDamW69bGbUUbh5ingwTbLiEo2em3eBgt/hZVbsikvCDlbTG8FgIlBrR
         he6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769161076; x=1769765876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKbiv5C1O+oTj4HZTm9MkPI8pY1Wh7MDgnYiN1gWUHU=;
        b=hlwqODk9PTY799aUM39fTZDheQbErtCSP+hHGAyKCfl5yxcNnGtK14ntI9fuewJiCd
         7BplL+c8N6uORnRqIlKcX4R8w4bg/RzwJ1WzrR6WZG0sS4zNE2UpPXKkZ0AP4v7h/eGJ
         yQ1sFK7oB32vAmlZAwE37PoHInDBuJYrKdGtZhIakPYEKJtTVRlwFNJ/+NYbwEdfbcQx
         O6iLEncguXVnjY+KhFpFl73rKtsFD2NGgeTbU7jsNEk1ToqFymfFkUqONUQIkAeyHdgO
         +PuLA8ALD09e1DOrBBqmimcM2ElJ7hFG5Cf5ZwaEzbx/GF+/rZ9JTjpTS6M5o83DCt4i
         kSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161076; x=1769765876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OKbiv5C1O+oTj4HZTm9MkPI8pY1Wh7MDgnYiN1gWUHU=;
        b=CaxIhLp9JTpGM7jL/riK9ahBETu/tzT7sbiEoN/YBs5/2px6dtFFQ5csHePHIEPgex
         rUba0PN3UmkcmEr35ljgGvHHZECzAbycM/mIh4VJru/oyJo9ghtuJ5iOev22IU9U/YFw
         7nE79koIKbCzj7miLmIuI9+P4eq74HarfeYvV5FPXhTa5sE6QAsD3wro27jgyxo5TiXz
         MmCQDizpgoCTOgzRTnZUKRjXHRiFcaivUSEvFv7l51zb8baT2mqNT2V3NzP/rxJLnLk8
         yjimz7vfTHcHsXt7JkvOCD5w4YuA3sRiL6tF/lee4GEIDw7/pp5K4NBu6yWs9P7Hd9NQ
         y5Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVFYcfPA5OYiQ71vc3+Mc69ZAUDXG+mvn8ZRTmo0ED6ifGom7uEDvHHyuOd7mpL0iFwFAn8PjV4wPIsxZjchw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgabt4iXPdFFfndPElpO9kOz0hcdlD52PiqpwiGpqmsqGTD49E
	GEbTaPCGmCCy8jqr9kX7v5wAI6qxc/uO8EFwNmo8wqMu6b2pHCcTuEDNGiKJMK7IhiB4+AS5uVe
	OgXk75k+pHbYmjX3cSx60Z0RLH3HNHYk=
X-Gm-Gg: AZuq6aJ3EJECK/ijBYj2Ds1UptOrPXRafKH2n0HyeVr+aMlZT/1cvv7q50uVswxj4zb
	9ypmhNBergC8FwjWXUr7wGtJ9YDpLTJzLHTU65iZP4LSd1vV8WmqG4NicVzkVAaN/REcVlGBhKR
	FssiG5LASE7JdP7nerYSaG5pD1o96XCxrweNot/rYVOJYROm0vBUIjO5/fWPQE4KxKl0peQZPAc
	PXN04aHyfYqpeGw1x0Z6uNNROVRZ9V5zOtX5Vdf0RQkxiOXEd1lkMLz92uVTIvC4U296ZrxQRh6
	O8nFWg4eNM8NhcFLPmzjNFQY84Ue8nfMqnZQecrqT7B3Bmqk10mFU+W1mkOaCNr/3YYbRi4FuH5
	myys5ZuDL5AuT
X-Received: by 2002:a05:7300:f081:b0:2b7:24fc:f625 with SMTP id
 5a478bee46e88-2b7397b575dmr561451eec.0.1769161076214; Fri, 23 Jan 2026
 01:37:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122202804.3209265-1-lyude@redhat.com> <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
 <25d3c403781a88019340a47567ff85959b0c03bd.camel@redhat.com>
 <CANiq72k1b3DLEy_32ruWu1XBFK80oRDVzSer69ANL_232mmv-w@mail.gmail.com> <DFVHQBHQR2CW.2X27B7EP1WXTO@garyguo.net>
In-Reply-To: <DFVHQBHQR2CW.2X27B7EP1WXTO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 10:37:41 +0100
X-Gm-Features: AZwV_Qh72c8avqIB3lLn1gouNrn4jZK_rjGLxuQXGE3UwGch6Qniu9pnHjC3WXU
Message-ID: <CANiq72mxEt0dx+rDkCjvJ1X8H2G9CzVd5ZWAg3HSoWG=EsOCiw@mail.gmail.com>
Subject: Re: [PATCH] rust/drm: Fixup import styles
To: Gary Guo <gary@garyguo.net>
Cc: lyude@redhat.com, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Atharv Dubey <atharvd440@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 6:01=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> This is tracked in https://github.com/Rust-for-Linux/klint/issues/5.

Linked, thanks!

Cheers,
Miguel
