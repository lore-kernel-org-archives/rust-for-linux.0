Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E041A2555
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720085890; cv=none; b=RALf5WJ1DCMBlDHDPIuI1DRJzmDgPopuuYteimpxEg42QDka6kB9re3viSQmmTmcnYFH1zNCKovrjMAPzirKmT0hIpsB+7I+vpge40ZeUbrh5AAsb0MEKSNC2WxpWNxfQwmL055CjGCZl4XYJGiH/Uu2zTwZSTB4YZnRwZKyU+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720085890; c=relaxed/simple;
	bh=B61Ndz/Y+22Ue4UGWv4+nbcIEIQi+VpzgZKgjVAJvzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCO2Iafs/RphfvRIqShvP4BSLxloy/ijIgGokkL8tpfOaYOt6RbnY7xeDAizVM908qulYDW4+WkctGhf0/kKXc02SCGsJ79wRlEjSblj+IXcwLfsKoaRi0J970YajSbYAAG6R7i7m++ln9+QOqbpMDuoa4e0L8Y9hnP9jShn3sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eym81bar; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eym81bar"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4256742f67fso2776995e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720085887; x=1720690687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B61Ndz/Y+22Ue4UGWv4+nbcIEIQi+VpzgZKgjVAJvzU=;
        b=eym81bar6JP18wEX50i6iHsHNMEBhsQMlagQM1y6+zurejJkEbqzOniEP25w1SnWYv
         JRStVrnu253gDQCggvWRoYNs1b6O5DJg4MyW3e2oAPBiNpQdRfRAQWKA6F+VruKitVk7
         bLunWSgnI6nrw7IdwK9MzOfn6Yd5PYVKt+CXre/Ek738QRd4I1xPbXMJ5aKeYrjSIRTF
         PWkT277+MDhYD8h5P1LR7nBeCu3uWyMtzRpQRsHGrE1TLh0MQVJ7wPpZbvIAbMJ8/AQ6
         ZaRLWw2O6ADr6Lx8Ci4CvOCdNlNdQZw1xUplPencGaaWtv4AiAb+n7K9SGMLZVefMyn+
         fAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720085887; x=1720690687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B61Ndz/Y+22Ue4UGWv4+nbcIEIQi+VpzgZKgjVAJvzU=;
        b=M2TNaia1EK3Zhtzej8nl2jR2fMa21zIx0HDlPKrEt8GQuMkRl4TrE9vbeoLP+Tzhqa
         y85EC5zPQemE1PnsKUMzpzBDaEH6m+pkr9TeJuWpgfJ635ftFF6sxYLoGSsNk3eNzLCP
         lusHQ4OQ8/LOqxkFSzZrZsWBGbEtz6jpjn/5hDsnaElNaBkeTl+0qrpP9NAfpUvgvjba
         vqihTpPEXIjWJteUrxPc4hEfxCtWI7aePbKdVSWxZFHRg5n6MrNwRxoteyROcOVMHWOt
         9f4tDi+tdna2Tq92Hah8WP99bDTketDfosAMYsPQwKDOo24huoOWncF/otQeEeZI8dqN
         5hRw==
X-Forwarded-Encrypted: i=1; AJvYcCV1blMgBBdk7uMHpPoGCUbjW3IZJmI8eMRYczVlfQ5ROv3Xgz/xEJa2cg7FcCsiN2YS3Fe7tONnSEyHVvjeGEk8MvVV2q7rvkZCZllgOQw=
X-Gm-Message-State: AOJu0YyZxOergWCW5sJhT3KhYuFcOfVRdplJPfnVsrCT6G6+tn9UGpzC
	EGV45wgC86MbyqrnBfGgh1fw7XuuMZvQAEpHRhWzQcvm7qgjUiORdkG4jNh4MrvhiDyd6lsj7O5
	baGS1qVCuTjDIZe8Qyg+9uCTCZsk6Zel11QoH
X-Google-Smtp-Source: AGHT+IE3csL2P+Oa1bm2MMKxJf3sdfNwLRB7vTutviF9jHId7ofiRmfWJCeXK5ZIB/EESpULmX6hfWO8Mr00zUiietA=
X-Received: by 2002:a05:600c:887:b0:425:7784:56e8 with SMTP id
 5b1f17b1804b1-4264a4319f9mr7152035e9.28.1720085886954; Thu, 04 Jul 2024
 02:38:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703154309.426867-5-jfalempe@redhat.com> <20240704091109.1453809-1-aliceryhl@google.com>
 <2024070407-pregnancy-hazing-add9@gregkh>
In-Reply-To: <2024070407-pregnancy-hazing-add9@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 11:37:55 +0200
Message-ID: <CAH5fLghobuv39Pv5gUrieridzHg5ouAESCOdXGWcjAe=yx1U+A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/panic: Add a qr_code panic screen
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jfalempe@redhat.com, a.hindborg@samsung.com, airlied@gmail.com, 
	alex.gaynor@gmail.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@redhat.com, daniel@ffwll.ch, 
	dri-devel@lists.freedesktop.org, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	tzimmermann@suse.de, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 11:28=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jul 04, 2024 at 09:11:09AM +0000, Alice Ryhl wrote:
> > As long as the above requirements are satisfied, calling
> > `drm_panic_qr_generate` should never cause memory unsafety, so this is
> > an appropriate list of safety requirements.
> >
> > (You also require that `data_len <=3D data_size`, but if this is violat=
ed
> > you get a kernel panic which isn't a memory safety problem, so it does
> > not need to be listed in the safety requirements.)
>
> Panicing while trying to print out a panic message is not a good idea,
> so enforcing this would be nice :)

I guess it would make sense to have an if that verifies that `data_len
<=3D data_size` at the top of drm_panic_qr_generate.

Alice
