Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB411B4244
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626812; cv=none; b=IGIFmuZhPqcavHMequXxD5Btnb05V1Tl1t8xvcvYuzwzcgSntQ4UQxAZNk71xcUQRVCb9NlRLDFh4H7Cc5UMT5SOIkyQeRXUM1ccmUC7mlDKOkuA1niQNRSkEirSIHJ7KBjOjmCPZldaQmJYQdNIigm7yU86ocfMfOSbYKjMkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626812; c=relaxed/simple;
	bh=O9Md3w7lNMp3yThfL4xFtXu53Q1Q5xKPg+ZTtqtQvSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVdIBho66wl+4HWALO1OiyKQ5rIKXgP6HSvi2DLinzImeFR3qSV3UbrJSM0sx/I0rOC5VFE0kzynCSckXwlovWAiF4W4jtTzpZ/c4jUXP0M6TDR7yM55X1iY0CLL/Yixtuqq/OEVrs/GLF9elmMqL8HVi1cYY8pIzanrVVkmBPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=Jgg/0vDm; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="Jgg/0vDm"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-890228ed342so73544906d6.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 07:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1767626810; x=1768231610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECBBJ6POzfhfzDwCrm5/OLG6dFv+kKLqVuVdBNepvg4=;
        b=Jgg/0vDmYeOLvuAWS+1W30chAHl9LAy+Cr99UOgeOTqgAQQkzaFjRq8/4OjxoEbVeb
         tXT5iP+xbGjVtbbzmMxx16lQDcL0554mB1Lq4QwdAj2xN9c6eUpY0ZDeU4ccWtEX8hVZ
         KLpNf5OeP2cZr2NmGUSL+7LHAU6lhyvb1s6gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626810; x=1768231610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECBBJ6POzfhfzDwCrm5/OLG6dFv+kKLqVuVdBNepvg4=;
        b=UPiqR9x1MWkNj4iQcxfzQdotgj2U7KcwhV7Q7FvcFzKJ9k7HueqNuCBQxLhAx141TB
         zv7QDfbgcGbfkGLUOakhfzbNkud82seqhvkw+tw0qgD0Jp1mX16LwrqhiLzrLrbWXR4O
         SEEtBX11YFLxuJvutNyzKjNnhBLysF8FN72TrdLJkEyBCS65WvGn/+iMR2kjdagPZ+M2
         zcA9X4U41DOJxhVVBRTDWbXl8abShSiTK0ZTVuRCEa7OgXWW05vi7kplohClmr1awhHC
         bQlLFjFmEQX2KROscmAxUtCOLvMhC2201ZYDXGzVZU7Ipbz19QSm9pN3t40qRb30QEGp
         TRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtPEaVqRvhnBsJQfD/EF8SQeQkE6Nv2CFfWhy4hv7EA+06RraiBLwR2Jg1aJRP/qOOUPl1nII3PuenJwPeVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy08CnImqbc/o357N/5YEXZBL1gZLf7j7fNPByw4yXnqAGkXP9T
	z0/peU2sDTcoGwZA5Sn2o3+RxPhj9VB717V35H+kK2Y3W7ZtdW1FkFfT+Yb7r5yU98M=
X-Gm-Gg: AY/fxX5v2m+smLZHsosaLt2iQLx5+KcIS6c4VNBUoAbsdhEtUauRSyvZbTLpiogpmsV
	W57vgZw5Z0o1fHWlOf1/fhTCI9U55q5iiEA6TNW2+G/bvzVPIA7hjU9jGlMYyvEFMKoE1Y+CkgY
	x/UiC99H9omLjMS3KN0Lnudo3BiMaL1DtHKVZf52CcBh2VDzSMu/klr9eSzrFVEQsy+LwaFeZNv
	VvyUOENldFU2QDBp71fp4CwBpRrzGV2O52Ir+ZAukxDku/LyRg1YHrKA/wyR1ieO+6Wzjk38PMW
	Xok82DYLYfuSfG28cYZ5tcxph5z/GzQd/OuOaEZkoQK+DH22WbbqqRFnZnh01KAGDQftsD/+NhI
	eiPJr7MNH4tlHyqJmYWfv/oz5Rest66HETC3kovTJVvqbhwL1jH1Nt2Egj7/vVLYiBj12RiDsay
	s3CbPW9OisATm9XqOHmybNBXq2Gg==
X-Google-Smtp-Source: AGHT+IHyYqBQIngprr8F5e7p/iZ5wE4clnripTijwzPoRX5WNcQwXd9Vjk+PldWi+443V3CmWMgumA==
X-Received: by 2002:a05:6214:488f:b0:88f:ca98:b00a with SMTP id 6a1803df08f44-88fca98b1bcmr651727396d6.49.1767626810036;
        Mon, 05 Jan 2026 07:26:50 -0800 (PST)
Received: from [192.168.0.99] ([71.219.3.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa7088afesm462931cf.8.2026.01.05.07.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:26:49 -0800 (PST)
Message-ID: <db14215a-c545-4e99-a380-69cf24841a84@joelfernandes.org>
Date: Mon, 5 Jan 2026 10:26:48 -0500
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/27] rust: rcu: add __rust_helper to helpers
To: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, "Paul E. McKenney" <paulmck@kernel.org>,
 rcu@vger.kernel.org
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-16-51da5f454a67@google.com>
Content-Language: en-US
From: Joel Fernandes <joel@joelfernandes.org>
In-Reply-To: <20260105-define-rust-helper-v2-16-51da5f454a67@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/5/2026 7:42 AM, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Joel Fernandes (NVIDIA) <joel@joelfernandes.org>

Thanks.




> ---
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: rcu@vger.kernel.org
> ---
>  rust/helpers/rcu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/helpers/rcu.c b/rust/helpers/rcu.c
> index f1cec6583513497e996f74835ca2c6c3f4a8c954..481274c058577276e20093a1014fc49f4a40421b 100644
> --- a/rust/helpers/rcu.c
> +++ b/rust/helpers/rcu.c
> @@ -2,12 +2,12 @@
>  
>  #include <linux/rcupdate.h>
>  
> -void rust_helper_rcu_read_lock(void)
> +__rust_helper void rust_helper_rcu_read_lock(void)
>  {
>  	rcu_read_lock();
>  }
>  
> -void rust_helper_rcu_read_unlock(void)
> +__rust_helper void rust_helper_rcu_read_unlock(void)
>  {
>  	rcu_read_unlock();
>  }
> 

