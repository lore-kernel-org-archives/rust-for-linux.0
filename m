Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E8B1F94F
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jun 2026 11:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782298877; cv=pass; b=t+4m3+9u5kwVSX2cEBaa/0J3prIFK0lrpbkM1SYxCJesVRG/bcyDG0FTGd90lkD/KLYCeVFV4x0VHOPyA7sfA17ycFTE6xybsPvuSf/KMjkkCCkgtTsF0jxQATmzXQzQZSpxUphxtBLtiMVi4C9pViFJ8PePhXdEKc4nUAzVjPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782298877; c=relaxed/simple;
	bh=2KenPaAvYl8Nn9MzGIpXvX9NzSqRdo50A/oBcOoNgaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1HZfb8hsupEusnwXPfAXLh7Leihdxx7SSrfoASKKtKXH1z38n7QSgLwx9uINVMPihy/C0X2MkQZLvTSDkSIAJ+cxDrcTvyyuTfdekoiqePsEnPxkmfV0O43V/5QUuPawuWAORIvFcuuorvcuO8Kh+rTldNd3CAEuGwWHC04n1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kF9XNXZk; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kF9XNXZk"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bc5fa5a2aso91635eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jun 2026 04:01:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782298875; cv=none;
        d=google.com; s=arc-20240605;
        b=Ow0RwdRVcPiCBWbnfbgjiouWKmjFNLqeSVxUd2oYeh5FBXQ+zMqwzNr2x+vfZ/oY+r
         OZKWE0UdLzixVacRgkOU4WctBHhaWVi3myikfR78QnJEwQ2XAxHjtfMA4yIAYKap7PUs
         CoA1Et3QGAZ/zyb3VyUJb2ypGd3X/PNzwbGhRXgmctSj3XHZ+DLvWekE7cGRJmo7364p
         KS/2I0Xzb+tY2d2cKQZXmpxGUrmFi4qv7YAruXNQBRxeqRWFiWbCIYocRNflgzJwUtU0
         xC/tZ/PRaEKSj3izLp9yH/M2PF7T8fZfLnGfhXbEcaj6BWebXia1trrHEjP5bxLyqKHa
         KYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2KenPaAvYl8Nn9MzGIpXvX9NzSqRdo50A/oBcOoNgaA=;
        fh=VHAUqeUAPIQ9kDcuqEkEsAAWpmfD0whZ4er1mTQWc6E=;
        b=KbaEoucmmj4msNBuxjVTt1rggKKd0r8wUMtp6ECBpnMjCxsYiOnQ68Qx0ALp1VeRlN
         4ZCboyW49ouzXf3Ew/zDUOVXnOWn43RNSkRQ3TFCl9YtAv7SoR2BFVa8C3hoIR+kCVm9
         0FR6dbSC3k/5RnQ2uv8MnJGHWrdj4gi+l16ijkf8i8QndXN9eMgYVLWY2D1o6xwJEV9Q
         3iX/czE34F8OmSeQElz0lA6AQWSNM81K1SytPYk4bsuXFql834SWHGhLwNPN0OUkhjGs
         PskMcw6xQf46cqUoXFVqwztv43TOYif4KK+YNVLBcZ+sGkFHW5PaM9wc+Ccd7Abu1lIY
         REQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782298875; x=1782903675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KenPaAvYl8Nn9MzGIpXvX9NzSqRdo50A/oBcOoNgaA=;
        b=kF9XNXZkeHyn2OkifTRSDZoE6PUVyG/U3gSguW6JHTnoz2A8ZN0EDEGLgnwl60imO9
         IwrdIT+sCASBdDnfmvzadNgmJhgY36G4G5IDoA6ENzGfPJML/2kgg78WqayQ8Te5ycEN
         Rvrm3I3bY0Xb7kMs2oQvIZwNlP+5Kzry66t7bGHF3RN0aKTMrreQa7v5XgHEoIo+MLCe
         JtpGD9vUJ/4oLYEuDTT2JCXZ0bovJjlZwkhfmyL1s/ZWEuCBY7mRi9aVUvnQMWGpdk8Q
         nWxRd4Y4zNBphR6R+WIo9V6SWAUifhzvkdlbN543AOBRxIu/GBOx5y0oxKGsjZw8mOFA
         Rtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782298875; x=1782903675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KenPaAvYl8Nn9MzGIpXvX9NzSqRdo50A/oBcOoNgaA=;
        b=F2hTG0c4AEys7UD2akLTXAe8wWDkJj0c6hV5JWw3wPqTNIv1y2VfrIcIxHiaJ92Nmb
         4zFEunAGZf5+NdJfRfp/qJPGXxjcE2Bz3gwHTOydrwG53B31Rbs1QMNUJsUdJl45G96h
         aD2BY1E2TeRQHmQnJ6bT8daffsI0v1gtl/2piSjlFrz7MEut0oUSxEvuvWmrFIR5cIc8
         naU14ZE4aem57AwYjIsjvxZoOtnEOgm0U0axzLs5hJNBMl26HDjqaGT/MvaVcJJqYK3v
         4jR8pnJm706JANSGWcORs2/e+fYK31QDf6DBFNNFH5botIRT3DbWl5ODCgGWL1xMy9bD
         989w==
X-Gm-Message-State: AOJu0YxTmjuWt+QIa2UXW5TAjYAMe62fLeqK/Q773e46oXLqx1Ry663H
	1xnS2sgGM+7CLQMfCseqIgOlX+n2SlZQGV9kjWjjH4xI/mD2aRMiKJe1ZmVnqRQfjRKg2+y97cK
	CBAuxhwiI83tM8aZcikNTMo1MUplQh00=
X-Gm-Gg: AfdE7cmTXD1LP2QG9sxVH1y0E0SAyWDt36uKVCrJPsbBbvuC7duGG3gAxefCHTLGEah
	Rih3k8n9ehFC7/pLOvcrCfoui5pWnbzWNT425IwpJstUn/DRuET1FVuRyr8SJmY4KC4LShCVpoY
	tQZLWkZR/4XtKjbbD+NACMjAcLxYvQ5mfZrXi6yOM4uOU+OrGbDRCY+BJxmTrzx0A/kxTli223q
	msXbhd3Mm0mB+qEWUU3e5JkcrLCeQZzoxZ9hTokJQXWNJr0XAZHmx7HXVI15RN8RAIHvplinZXS
	UUPK3Y6uh10GuxEEHNiH8RB2EN+h1YvRIJ9TfLAanDIUOcPk8X3COoEIYV5UwA8Gha+VjDWX8Dl
	Px73AN4WTCe9WDfwT8wNWBWY=
X-Received: by 2002:a05:7300:1910:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-30c522fdc9fmr3277174eec.3.1782298874935; Wed, 24 Jun 2026
 04:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624091758.1678092-1-zhiw@nvidia.com>
In-Reply-To: <20260624091758.1678092-1-zhiw@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Jun 2026 13:01:02 +0200
X-Gm-Features: AVVi8CdSHVvEopfVbWrxpFAhmhJ-QUX79AKTrk-GJtV7k7SJg1j51mOAJYJl6Ac
Message-ID: <CANiq72koNNhYuY7uGM8rQy4Ga1g_DM8614hh-DiwY31PuHLnZA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] rust: introduce abstractions for fwctl
To: Zhi Wang <zhiw@nvidia.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, Jonathan Cameron <jic23@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dakr@kernel.org, gary@garyguo.net, joelagnelf@nvidia.com, 
	aliceryhl@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, cjia@nvidia.com, 
	smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, kjaju@nvidia.com, 
	alkumar@nvidia.com, acourbot@nvidia.com, jhubbard@nvidia.com, 
	zhiwang@kernel.org, daniel.almeida@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 11:20=E2=80=AFAM Zhi Wang <zhiw@nvidia.com> wrote:
>
> This series introduces a Rust abstraction over the fwctl subsystem,
> providing safe and idiomatic bindings.

Cc'ing FWCTL SUBSYSTEM (Jason is there, but not the rest from what I can se=
e).

The new files should likely be added to `MAINTAINERS` too.

Thanks!

Cheers,
Miguel
