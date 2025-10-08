Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8E51EF09B
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759940433; cv=none; b=qswEEy9WTBprHc8bIFrD8qTwaMudAP9pLHbkgl/Is//h7TO84Lh99Vi2QdYaE6XfVps8Ky+Ieh0AP3uD4EGtudduDClghwvBp92dkQQqAIl2Y/hReGGY1a4Cqk3xk0qOkTtZk6VCohrmJuCca0pq3jpNcQIv+67llM6n5tzUYU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759940433; c=relaxed/simple;
	bh=T/2YcwWKmAY+B7hDOTvxmnfQNfKpAL8dEcLckN0qNB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZ1C/CZSjXOIrkfjEm0Bd58/RaSgPEaZfduKwPeDwWVExDtIzP+BvpFeveK+R9RQzNBdWTzdx97rcwlCrJtjaqWBVk+X5uJu4nH26r5+sD0yJ5M621xr9979EL+OTcDAoD79nKC32sRQpNya1rSephNtOhv13e519oIIGnZ/bcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bL4YBHAb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bL4YBHAb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2680ee37b21so5565ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759940432; x=1760545232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzZhXiLzKKt9ijicdsXyGaAREF+VLijn+mpS3QdbwuQ=;
        b=bL4YBHAbuXDSHsqKXvVVFAU+gYMqcXihCfTPcWRuP7BGBMD7VRn9AhQMuwabLU7coR
         BBxCpC6waaj73/8C3a1kkpluZLJRlLFq87jnN5lntzPCCs5gxsJImZ4MYC/DkgHx+03n
         MfUI4UsIBMejHG87decTdY/zZAFoCVRzmF4rR9gVDBaSn1RcHJu/e6cZDVvclyhzfXBo
         mb03C5J6BWz4IMlbQL+zDbvf8PRzkngaHRMUfY1YP0/dJRfLkRHhnvNng6klYiySDybK
         GDhI3YMI0N6yL+iG+eZQay2aeYM92dtIzHIghzMf+X1osUVonZ2Dz13lwZzTPHRQbgkv
         gj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759940432; x=1760545232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzZhXiLzKKt9ijicdsXyGaAREF+VLijn+mpS3QdbwuQ=;
        b=SIZZ6gHfXYUTYhDcNivcpj5H5arrGwT0PPprf65LVoIIXjbAL1pxAkGTxlUuuW/oHz
         o7uMKdqoDLOPjBAZsZYSwsqv8lzGj5ygK1vS53L0vG2LExojElLH7/S25zibDTgYSzWu
         rNhib05qDBw5La78pEYoujI7pV0GvSLl4ZbE78agfc5jyXTPXMn07QgJ1qNT1nG96CiL
         gd62wJ19t9jyeSrtOU2k777s978zN/vPilyeU9IonYZqvpDiF2lqEUO5NzHacMjpXV6Z
         MQLcavCq7DIWiJA5s9mdBmabyZtLx0B7B6zY2mTi0IbTcl6PM626arshncOh3W3AQudJ
         iGBA==
X-Forwarded-Encrypted: i=1; AJvYcCWHnKapwZo3UtBYK8WC4KFSaUQqQa25HZj6T7SbkaJsk6k0dGZ+P9n1+5pqx5IObGpRkqJR0D2iR3FEMo75zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97LElDDK6Ac+k4nt0qVrkmrHnflYMhyS6/3B+fP7LZuSEhfZ7
	cnCKqN8CxITR4tKHGY9OFxYGaq2LQEdDLcOFWGilSkcHyaxYSg8EuNx9gHdm6ZK3wO0hxITm5/e
	Cln57lzIQQpmlpQd/qm3zxBfQfxnBLSk=
X-Gm-Gg: ASbGncsiRCRsVcxcS+LSTZl8jjEy8i4C15muK63qOQjIUlDfEy+TqH5tcmL8EHtHJQf
	Du91+YuXxRwkxwsAEC1onL4MtKSoRYMUtwxMpPLfTGT4dNnPlDKqlq4KBQ6galLP5EZRnpOJbqr
	WbmD+IpAyKD1rQ5Pw+tgTCNh+pttCf5iCyJsGBS1C+bCSRql3tiUtXyfOv2LMw6KmjPZoH8p6le
	6FVTcvqJ2lQUumeIubKR51HGA5bKzvjfo4qk8WQpQ6ZuULAML/HGJykf61mhtEK8S8KBYQsvATn
	9vFYIASXN7K52t2x91wyuBVC5Cq10AZRFcPNBJvJ4qUoadDxug==
X-Google-Smtp-Source: AGHT+IFRtEpmUYO1NC+sl6QOX+ycPV+YRBQwmDD+/ZPRzUNkPTRekJQZRPUOeOECIkAwhtODxGST5I3Q/8aiX15xH4k=
X-Received: by 2002:a17:902:d483:b0:27e:f07c:8429 with SMTP id
 d9443c01a7336-29027215bd4mr28915515ad.1.1759940431715; Wed, 08 Oct 2025
 09:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008151554.340806-1-marco.crivellari@suse.com> <20251008151554.340806-3-marco.crivellari@suse.com>
In-Reply-To: <20251008151554.340806-3-marco.crivellari@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Oct 2025 18:20:19 +0200
X-Gm-Features: AS18NWAxIRHTDXe_UK4N5rbhlyy853rdCwdewKT2ZCEY4_Le0oNYYILFmF6Dh10
Message-ID: <CANiq72mt-RAH54KWmwh+R58OHsX31pQXc1cce7RgoBAgRpj0rg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 5:16=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> +/// Note: `system_percpu_wq` will replace ['system_wq`] in a future rela=
se cycle.

Please check your patch with `make ... rustdoc` (which would complain
here about an unescaped backtick) and others like `make ... CLIPPY=3D1`:

    https://rust-for-linux.com/contributing#submit-checklist-addendum

Also, in general, please use intra-doc links wherever possible.

Thanks!

Cheers,
Miguel
