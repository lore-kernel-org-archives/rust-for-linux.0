Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541423E51C6
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835866; cv=pass; b=s7dOMPwaOhKZAAJITJGF+fI7/mPVra+APg533VU4/Tijzy/AFnu7xRsE07y6h+WEgu+F9Knmq0Kq55UAt8OlMFXumq2wi8uP0in4w4cTxxF4PNP+ISQeDSjVjbQuXVd3kqqqB5on3M6KsSlOOoL0nSq2CCDN2ITHvoI+8P1slbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835866; c=relaxed/simple;
	bh=vknyyVbgIXnt4i0FpUHU48h5wAnKScSuFas7HDAsAoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7xeF+Z07sjucm6oRCEEwG8iWvEa7go+Efoiiq58KMw+xLtfFgCnbmisA1XBIXd9jLa8R7VNozTTOCHlfrNWO/EJamwXJZATJb2EmHWd3fYGBm58XVEgshrL7orh64ZiXrN5/3z3Qhs1GR2cDrVW2vNDeFK9KPw/sV9slpidpTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YwQWyzqE; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YwQWyzqE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so365955f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 06:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787835852; cv=none;
        d=google.com; s=arc-20260327;
        b=fwRvn6v24mIEoLBABkhU66GRkz98vPQt4KPw5JB4l2O+6TJ9CC3n3Hs6pXqxzJDe4i
         BOB0KvrNmFeIEnYFj5DQ8ADRxlqGa1Ky/1zpcOBxNfbb2v4saO0poBuDsfyfiV7wLH9E
         E7Aeg789xetFognJTVpx2kEcH5ERMorVcxlLaw314f7C3vnt1u3rv/16jBlsVJPqjO0R
         hvWhH+4MATv5P+5X9iQruMFiiZoQOxakUYIsAOySrylHGKAJc5E5Q+Mpw0pgp0dmT3Nz
         x5V8zKMf+FZX3DR7w8q+8Gs0sNAyE93PImcQjivE8QUjTovG6898D8OaQwY8KcLyv8Wt
         PtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vknyyVbgIXnt4i0FpUHU48h5wAnKScSuFas7HDAsAoM=;
        fh=8gbGOCfRPIJIpxKJofJLUcyXQwd0X7M3rWu3K9efBpM=;
        b=UIptjjcorloz31wt2ntFXLxLXtFgT297SslJBD+3DAvlsWQJLGcn2hWHB3gyiqNmN9
         syGLP29gQCvthrnZGwDtYe9mwE70IHhRdX6aU8TpxYBxxDlcn3R5fozbFcQIWHcKtJls
         9z1vQ+NYUhWEXDwTFXMgaJ8ICmde5KR/n0guL6+bS4vaZVPPppUMTfzBFlnNRWGxMTxJ
         1qkyuaO3nhqQE6dTV0PnTAVkoEIGQESZTOZNGdvECbCRHKjLgqO3KMkgmmfH/4DTE4Ds
         YLNu7NCtlRzeiiUAsDWqaCxDRR9MPJ0C8jCZdhluu3gel71363ib2pfTLGMYhzf13dDR
         RmCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787835852; x=1788440652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vknyyVbgIXnt4i0FpUHU48h5wAnKScSuFas7HDAsAoM=;
        b=YwQWyzqEPbscGfC2UtHHRRoGnzpZgdNkQuxPVsBiPU8n8wmSoPO2hUdvDLJQY6vx/r
         61qAQGcGzBz8mnzOBMAEm1taHwgPW9S5/cd0I1dj9yYukEzXQ+qnijXVpKb/mwYVsAnY
         g6uT0OCVEj2wyz/bMGz5kkdZIw8NpAGcYDkb01qi9hLhJArO1ayXE/vh8aSF2eyKiZIZ
         /8+y7b6FagecIt4W80w36AijAcd94WhAs9ObGI97Eirsky20jkG6YWsspCUFwqw37ELn
         PQhSVj7u1Q1M3j/GxbuGdMG0ogx5yAPNGVm2BqdJI6mRyVtCX7j5s3I4FZemLYUYIUgk
         D7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835852; x=1788440652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vknyyVbgIXnt4i0FpUHU48h5wAnKScSuFas7HDAsAoM=;
        b=bSbPJ9IaSpSI5/S9gYD5xr+YUXeA74adZOXtkcuTZTb+4TTMYBWNHMHOXu8qKoLVTv
         WjdDt2VR2cXk4mCqewYaiYfX0czZSlvjwh0ZmIQqsdiOgG0tx35XULbNKsztsS5Z+ByZ
         JE4RAa5Cogez5UekPO/vKvqxyLPHC5P6+1Dc41vbtSu4qiWhdiFiOguMrs6JkY8qkCBA
         5/RY5FuARco+0G8Xu6hi8E78pbw9NTXfsuM3WRAv96b/8+xRX3MJ4i172MwXXlrH3u+o
         gd0jR7Jzq0WEQH80CKC34cfqCtDGxR9LXTyJ9lI1cxUYtni+nNSTrykmCU7oc25D1A4C
         1RZw==
X-Forwarded-Encrypted: i=1; AHgh+RqTj+wWkw2LeibXspNSBVixiPanMFi2n41dahSzMNHzaAHvwEJAQT4dXAVXyqSVMl+iducAznXKRUrTeLP4gw==@vger.kernel.org
X-Gm-Message-State: AFuF++nprcOOpCC+iwMj0rq3hcW4aRf+Alb39AWPcFkPUr+6uZ1Scw83
	qUmEbj73OAxHxUVTZbhcDwaTCK4zFOKJTpemRZd9LaHbdJKRSUSY3wJaxvB+z7YthxLUXp4mkRs
	mdneQ+k9gdeyGf9RDJBXO7U7PhRibQ5wYSPsNd27x
X-Gm-Gg: AR+sD11OPLgWhh4m7cWsRHqCy06DDEImpdF+A8OIsSbwp3Bdo7/odmGuvMdbx0lQnwf
	C0VZNLSb//HR0EM6xr3RM7KpQ1gr31up1dYcVUA225RVOJdoXHWPRcnRx8Tqa56s3GQ7UKQWFls
	JFCPNZY4JP2296jhgdzanQxLcNIp3H2u1xkegV1RdW8jrgEXZtuDuZF/vpE91MU1jFG12axv0iJ
	NapBPS1t/lho+Koz5wjhQG/CAjFgr2segVCESwl0ql/DRdVDwul9GLPb+Z/EwLVI+trP5TfJi9A
	CPEUVm+uvrqWPHkFdsVpS1x2TvCLMEQTKVp04MV42c42AI1UctEex6j6vP2yQuQOVHI/gIAOOZ+
	9E4a7el0fy8lOEbo8U4VfiVcdeRiFims=
X-Received: by 2002:a05:6000:382:b0:481:5167:abda with SMTP id
 ffacd0b85a97d-482e26c844fmr20467651f8f.9.1787835850895; Thu, 27 Aug 2026
 06:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826132729.3281308-1-dakr@kernel.org>
In-Reply-To: <20260826132729.3281308-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Aug 2026 15:03:58 +0200
X-Gm-Features: AcwNN1UcN2vg8RVpmOZyLR4-8awrlzpmXi8yWI9hVIjWmlnx2_hDjuyNvwryYNc
Message-ID: <CAH5fLgg9j8k8fsZWyT-_traR5YVSsLa2x2YcmmGK0vU1eqGKdg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]
To: Danilo Krummrich <dakr@kernel.org>
Cc: ljs@kernel.org, vbabka@kernel.org, liam@infradead.org, urezki@gmail.com, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 3:28=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Add Alice as co-maintainer for the Rust alloc module to share
> maintenance responsibility. This is also a natural fit, as some of the
> alloc code overlaps with the mm subsystem.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks Danilo!

Acked-by: Alice Ryhl <aliceryhl@google.com>
