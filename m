Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F2342CBB
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812012; cv=pass; b=sBXoEIY+6NU9X1AFvTRW5f83xwfESUlVLs40JN8glpAdou38zZ/0DpBeFOaSKygzREsm25BdlyJNaM9ccGi2f7nxn3SzW/wrmqGq2JlLKIHZ30jK7MzixGh9h9vl9VCIgXo++tOv/VsZ3hJQbCL2Ir0irtFOfYU0MbVOdB5+w5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812012; c=relaxed/simple;
	bh=RPjBHb/Yd+QoISvU1FyE13V2PUwqYRArrLaCNpO/QgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIYZ60HysZ4JHYlgLtGh+QGKApreq3A+OnVsxmDbifvd6nbTFQAUnfrK0jnuM1e6sB4oZRRceMQIaNOFRKDNf87nKJOnFm1KmDyEWBdzrX4oirnjkkTl7jItqWguPlbWAlwlqj7GxFnWRBejkKfhE+NGn06oqO22w2RTqI3HHXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNeR8rrb; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNeR8rrb"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b6c1ec0dd6so211233eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 00:40:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768812001; cv=none;
        d=google.com; s=arc-20240605;
        b=ZN7yeM8OQA/DVoTGkG/5zT2acUTUDVeuMMEZOc5NI2rWauC1efbfk+y26aXe3AewV2
         626I/pQj0lR5TcfCd6rEr6LVMrMsl+SMUEyKOu6gJ84SkWDYQKs/c8WHFJgCvNeoghbH
         SyfEmmXHC6LEvzpgz6aYxNCOk9/+goer6yez0xQ/jGX2Pp1cLEJl1V/jbEFPsU20ekVM
         8KTb0CpvCNCDRL6zCSHpI47HaDa1xxYENQKm5BhBm9oGq9/O+SgrQx5I8CLF4TTWQBxJ
         1Lw0mFHKNRLx6U55tbV7DjeACuZwHGh1tmah1HF3nO9qLF3sXCqmLSZU0zIKRCkbgGE9
         pekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RPjBHb/Yd+QoISvU1FyE13V2PUwqYRArrLaCNpO/QgA=;
        fh=FFjiEaTFZ7w9ORU1Uc+0gqd4F2iewakhxRd+gxLNehg=;
        b=Nry6fLpttDlU7aPY1d7Y/AC9VmK3rTFHevQNODjNVPkGWuabHZkJQHthrzD/hLjf8K
         EvbBc72eEOBwz61QtCoaEQdx5m5EUFyZzse+MJhyBwLFSnYWYbaWRY/DucELEN+Bt4gX
         Ej7b/VeMq5ASPdlm8RHFlUErpnOCqfNLaREeWS/NyL0aqGif6v9r5fcDFcQ3Zk0RBMeJ
         dvoqzJ3IDw2lPgwi3SV6crQS8pCVJNrLxgqQLDf8N2+xuT+aDXvHduJg6D8xZz8wF76n
         bgUJy47YtWw6LGGeF4mr2E078kRlb7Dx0SsvJS+emtRwbqvc9U9wvdIoEPkTjmF5hLuh
         kJJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768812001; x=1769416801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPjBHb/Yd+QoISvU1FyE13V2PUwqYRArrLaCNpO/QgA=;
        b=TNeR8rrbZj3l5Y4+TV7HOXeGKDIqm9hLVOCjJ+t3f2/C75ND/7jjOQU2WfKdXKBzPk
         hdF0qknHRZoziJ+3F/Nwlmh1Lg5ukl1LcGsWAzEpW8axuEnt4Six2lC8rFpwkmPfiU/B
         PmXh/ZrmKzarbMcDPdAEKnWuYId8GhT1XnoT+a021T+2gHDGuvNht3Sd1g2pGHsCp500
         vpR+pLPN05YpMb9YNHQczKvFcP9QlMCP8F89X5PEQvfqiygpi6S8VCgqf3MvZ3C5z3ie
         g1oG3MWIHrUNkQMV+zb1VJo2BesWNLLBgwlrPsShHod5cc56RqwtbtwvXQgNYsWWRGii
         A7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812001; x=1769416801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPjBHb/Yd+QoISvU1FyE13V2PUwqYRArrLaCNpO/QgA=;
        b=PqWrtfcxoDLvOEw7dc2FME6soukRVjvO3SHutyT/e1BYKZkIo+HBXpkffa2TgtuxRX
         foPir7GP00WXAoK9A+K4d/z04DoWnp7R4wc4QAmJPcJwKHVSVWIDedgNT7emAp9MSLtL
         q2bth+c7IZB9sEzHklaxTFMQqzM8Jq7nHFdgc3cNxfulCbJW+v3EgGBO7Ul7s0TRz3f5
         VNuiFXbQHJUeHvXUoJRZq7NVpoPtmVTT6er9fihTp2kmY4nVjbDodCH6EVw47BKlkk9Q
         c5QOFTa4j6MQDYbWB/RSaN76lV8y7n4DzvVhztdPlAZvK7S7U8UJ5VamLawuo/lAe0vb
         lusg==
X-Forwarded-Encrypted: i=1; AJvYcCUR4hwM+8Z2ypv8tqYLA0Gr+DWaGSIYCHPp77MAeD40brCt6xcddRPqZU68nNfPVUiPI5JC4bSumzo8sxIO9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVd5wTFN9w61x0DhwnuvSs1ye3ADxTKXwU2cWkymNLkN7Wkv2d
	+1jK2VZ0GCPdhUDo6g0X4njvDioCUNXaFwpG6dz2ifER+NnGaayYPxpPdO04CbLuueFPyMbWBZo
	FvTm2s0q7VOpFF0KTYtx9fJ+idM5rmhA=
X-Gm-Gg: AY/fxX5e+Y2FaViHf7Ig0n4oJGXAGTGkfBaeGI36DQFvVVUbSrs0WnbhvCw+yHnkGdH
	HCPPdaKfnQEP4iFzHozdAzwgF2j0PMZnGdYNMtKhs1dheXXgBFnyUYSCKXg3dc/Jh+rQ9zIKCWX
	ccETazSEudXD3vG5zXz+IkbjXnmDkNimjn32JuLBe7XdGVJ4NkEFLJ0CgJQ0PTmdXa70Flb6yAt
	wYTh2Qdw0eiJOXRnPA7GQ3TG8AkWlu9NeQ+8dwweicKjxtXbyGtjXf0yzoXstMj3gmMaPc02viP
	lzh8NO8e8VBivys/6SWIYo9QJVpuJMVYFHEKeanOUHvSQbM/GR3MtX9N9Nsl6fMljwhOlIEkRMv
	l6XRkRn6GfWeK
X-Received: by 2002:a05:7300:e207:b0:2ae:5b31:5dc with SMTP id
 5a478bee46e88-2b6b40e9e51mr4587824eec.7.1768812000268; Mon, 19 Jan 2026
 00:40:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113144547.502-1-work@onurozkan.dev> <m2jyzo26y1.fsf@posteo.net>
 <CANiq72mrJ8yF-LVuXbsz3z_Sf3d3AXk2J_NbGNeu9Nsfgg8Zbw@mail.gmail.com> <87a4yac82m.fsf@posteo.net>
In-Reply-To: <87a4yac82m.fsf@posteo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 09:39:46 +0100
X-Gm-Features: AZwV_QhZE4lWJ241DrTwog-xWbWJMgPJzaFXfSmaGEsO2ZXHK-ofMC2OWP_sLN0
Message-ID: <CANiq72mGbafLbUzV01=M3tJDDfA9JqPOwe6nXmYhb3Hb0xjUjQ@mail.gmail.com>
Subject: Re: [PATCH v1] rbtree: reduce unsafe blocks on pointer derefs
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, yutaro.ono.418@gmail.com, 
	borys.tyran@protonmail.com, daniel@sedlak.dev, tamird@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 9:36=E2=80=AFAM Charalampos Mitrodimas
<charmitro@posteo.net> wrote:
>
> I was not aware, thanks for the heads up! Assume it is a Reviewed-by or
> just discard since it's invalid.

Ah, great, thanks for the quick reply -- updated to Reviewed-by in the
commit then.

Cheers,
Miguel
