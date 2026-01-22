Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47272318EF4
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 00:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769043536; cv=pass; b=MBCoS56S37wXaLfpeoL/zVkEmNjnEr/C27uQr2KJ4ZBXApos0JqyvhbS/AlihdKfu8ttoIKLwwy04rBN2A8UyECYCn3EXVik0JGOv8ffnz2M8S9eTX29GE2+2E4Mi1uP54fjjPO5DSJJKzWyqSfWs3tFVNN6F3UjZdGfk30tUOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769043536; c=relaxed/simple;
	bh=ePOS+ru0GKPNPJ/oqMKjbYqjVjULTjEPxdStPXBVmqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/OKI9mHYifU8ByxHrF0DSSCOLP4bSDXfIqWFerjmtfap73L//yPXzHVGt5ZheIGUyejlW8nUN2uNN36V0Qin7PGJSRaiSpWFCZ5UoQxWpyYUjHOrUpAQNigWNJShID5FiXqZYRAe0+lz16uDJ5PWV6ODvhdb6sYZRz7zjqMcfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao82P/I2; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao82P/I2"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1233985e56aso26323c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 16:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769043534; cv=none;
        d=google.com; s=arc-20240605;
        b=MQsCECsAdbNa5hrDJZAMFXnDbZ8JA2HSd8jBkO5Zoxoq3Nh4d03ur1JplEAvfOZi/b
         ZbtAEmvLHvMXgjAj5Sj5ZaXi4Yo63V3f9qw8h1XklqO8BK+i0qOBNAYDZ+t9c53ttXzq
         wS0UTTRvb7Z/uwGVzXvkLEcj+AoAGjzjff7DY52l3SIdBMaqiBEODd2keKXooO8VkMtW
         ufonDx0X7LA6qV0nbasl3xynCf8gyigGhRBybnWe3yETwyzN9Qa00zXoVtCL63Ua9XjR
         bE/FdD1WKP8v18ejMX6NanzTtxmgILwikS/9r6UusfbufpcKiWQi4MjCdeBLzFEyDdJC
         zjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ePOS+ru0GKPNPJ/oqMKjbYqjVjULTjEPxdStPXBVmqw=;
        fh=lP1mbD+FVMCsbKrXbNHqTNlJD0DRoz1OAcP4wSrH1Vs=;
        b=UAkpGpT6Zh2lLAhIk+6FlTz78amNcbaGsfGE9/xP2tfR8OxSCinaNMVHzZoz7FrCDF
         Fd9rgJKq19WQh0k6zLbCdU/CAAZBXXzxMz8ov+FtO5qZnTenGw1Xm4QcFTqYXlZybi1N
         6zxyi+2hmjkO49JCOG+z84X+B2S4kmIqFtW/7U8h3sTVahjyrxW8cTUQW41f/BnJNvNv
         F/wkjGBUScnovSE/aRMAnYAAjKcqKcA3z/k5Vu7GhBRcSdDpCFniEJRGfjNad9uT7VQN
         t9XQLWYHWt89isNsRWmQBojiIQyd7pM/tFNaOlo+Rs2QmH3UPoedMj3e4n0KJjyAKLMF
         lftw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769043534; x=1769648334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePOS+ru0GKPNPJ/oqMKjbYqjVjULTjEPxdStPXBVmqw=;
        b=ao82P/I2oapZGipknOo90+PlMDYgLLwjkVJAMSACJq7CeNo6R3+ATo096tbwWJMVnN
         Fyj8xKB2aiEJ6fTfa1gR4Mc2idmilez/n3E9rwRT/pEgZr6jF0e4tTYyuKYW3PcFLqHT
         DuXEkN62gHKZkEcZHZLbDDas5GcmnTDtoEmYvPyvakb7IEQucCh2ClPC1DbFgA6WDhKD
         aiJ9pv4gD3a8l3bJ2w1QQZdofjbJIqqHIobUsWeAzBQpIEn03Ha+/MUNf5I/nh2Wh8XL
         yT9oxNaz3VkZZp6YPYzonsSeN8xMa352Hm9/zv4XRlaIU5s5KDj0H6NUJ1Ckh+FkL4ex
         k/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769043534; x=1769648334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePOS+ru0GKPNPJ/oqMKjbYqjVjULTjEPxdStPXBVmqw=;
        b=w4xj7qYxuFRH/i/flN2iNhK4CFFjg7ULO3vX3BLSIqK9xLcV16AytUR7Oj3nwp4aCW
         Ny56Lwl1WJJt1QQKZPcS649Iu3YEOZWX6XYC0pcESdTXaOHd3b2KgcC1HxNhdZUFqn20
         8xPLMcsd/pUDRwuMQjBZKILS/g3YzHuChzUqFDVH0tgMz0zy/dg/axR+dXldTkgPd2kc
         iUFs5lgX1uc6jTqkCGSGQXnVK7PhiA1DWSI29wPUznpOS8czvHSKd2mhx2mNn/27cSMD
         BfRJxC/qdUm6HVz8TW3tcU3L7UtMGsl+oxyZIv00LVOZUwSK/JMAqrJfMuXLtua7F86H
         YyaA==
X-Forwarded-Encrypted: i=1; AJvYcCXmiUEnAWOEuhjrNql9BOCmvjWRl4M3W3uQRU5zVkMijk19+5pC1ZCCNloUFERaVjnZ8pZs8zXqlHAITbDgww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXkSeIAuydA/QueMKqknmE6EtWaYgLsxgrkgul18DPpzPGcEI
	du09rEeBN8kerQI8ogGHPRC7WlChUVu5khoReDYKr2kX4mHK1/AjOvHe4Jg1iME85XZTwDqVVNJ
	AniiO53hAHibd9sUOx4D1BgzMKWIi0bw=
X-Gm-Gg: AZuq6aKF9kxnSVb2e6y5hA1vO+yOOctw216d06IuCrUe3TG2J7dNBrB6yy33mJJj/bk
	JdXx83EQF2kN4DoKqiHmhgYxK2hn7HmQQQqbyfrWu7oA08FhuxhyEP5/mna5vbhGtOWxRzGqCIJ
	tp3Pyf+429afZe+ZDrcDD7gJcWLBsFpriyDFK3c/xfTNMNHRXv4/nWjfvNHLnWadXe/Z0ixc/gn
	WEIqY3mTr6/LDcwmssrdjUp4z206ybUAJlpt1v9IB2BdMxkvaoeim8Dsyyl+YvTSO36yRviuqzb
	PJ9sP92gl9CikVsKlZZx038LLPHVbc/Oa7qJTwRfYQVf6/vuz6oDqGwHmcdXA+XbubcqmuYQwfq
	iqE0kAgkcf8s/
X-Received: by 2002:a05:693c:408a:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2b710089fb4mr1300915eec.7.1769043534133; Wed, 21 Jan 2026
 16:58:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260122003746.405370-1-deborah.brouwer@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 01:58:40 +0100
X-Gm-Features: AZwV_QjET6D4LLELM-SXyns7n53A43bBKl3-wihBiJ4nAUEgyGlB4PBhb8I0Qdk
Message-ID: <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, aliceryhl@google.com, 
	boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 1:38=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Currently these warnings, as errors, are preventing Tyr driver
> from building:

From what I understand, this is only reproducible with Rust 1.80.0
(unsupported upstream), and was fixed in Rust 1.80.1. Did you
reproduce it elsewhere? I asked Mark where his toolchain comes to see
what could be done there (e.g. in his distribution).

If it is just in Rust 1.80.0, and if a distribution still uses that
one, and for some reason they don't want to use/backport the fix in
1.80.1, then we could consider something more global, i.e. ignoring
that lint altogether for that version, since it also fails for another
trait in `bounded.rs` (that is why I knew about this).

(By the way, in any case, we would need a proper explanation of this
full context in the commit message.)

Thanks!

Cheers,
Miguel
