Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCBA44C661
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969665; cv=none; b=tb5gdraewKgfJHs2BzWjPaWLSFThddyZ85zn3Da6XkjIrm8a6rS+AJ8ng7VHtBj+hyNiDY8qxCPRkLUyDzX5nDC92v7H83iFenC5zzPoKLKeIidZxN5oQA2kHGB/FTA+vcxS+UF1t2O0WaqpDT3gx7bEk3vCB963HSWs5e/b3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969665; c=relaxed/simple;
	bh=Rpc3GO4+UP1CHtIfgBK47jOXKC7qTbuFu6HBwt4WZ3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNBoLn8mIRe1uTLUZaOuj7tpA5CxYxpU9LhTGXp668OZDF9fiVWGVu/xcJi0ZG5AkIxcD+xucLTnZOtKAXbKi1FnM7VZuAHFZbVGpYdFZ87eyT9Fl1PKdqR1TYO2b6VOv+B+XctQ3Papos3ftLfIWhCLRAohnvNmPezCF+XxoJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DT9Zx0IB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DT9Zx0IB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so9249435e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791969662; x=1792574462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyNMPvZIEMwn3spMNOwO+2v61MNWwL1mBLifJHjtoWY=;
        b=DT9Zx0IBufXfkL251NXbgBb5YlsSOGQwY+xRoHEFTf4ZEZ9qA9FzkYBXmALqwOzS4P
         Qy/6snrp/OjE6XmBT2T4A1EsGOmTqS0u75imTIirp7YeJax7EDQmahgKD0SojH5tWAMg
         vRtgdGL4L1k2o89mTK5GFxPIzZ26CgnxVJX8CteDAo46xZolXHPaMITBE5dnOgWXiOHS
         3/ClCvktlRsg7Zet15h9f9q+T0BONV4mJdzxkIUJOm/DqPknCV2oNrAQWLw+LUPgG/Ps
         VmQjTaWyM6aZNcPY67yhsacBgj/p1ouHCasS22c965ZxzxOW3pp6jplsvJbsAbh9RK2Q
         7Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969662; x=1792574462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyNMPvZIEMwn3spMNOwO+2v61MNWwL1mBLifJHjtoWY=;
        b=fcQ/kQABsOJTXx+gZd/WuUZuJpssbTLDRKpJ0edhMKBiHrF+G5BJ0P78eTaKgiXtfj
         afBPDbSBISLZh8vXVHSYbMSDU+ZdmqY9qWamSZ9FV6piUDveAGIBJG0asl0klTjPmeQB
         EYmgxjUOjtNIPu+edcNchjerEWo7K4nfcHyVBW8Tlo1xsFYqje8AXXIR7XPTdcoR8ZVA
         tkJDlALTZ3QFbKULn1l5X7IvFH6U+j/NdOFtKEb9YVfpblZUDu9FUfH8hbUCFS7WDnis
         3knZXFIV/8O85UK0MzmeDylMgy1kZHTKcvPM0DeIpjmtEagzWdy5Z4ajPWCsR9rGx8+M
         hbag==
X-Forwarded-Encrypted: i=1; AKwUvBzyKyvkec+cuFHdk1FPXiGvItvxh3vBegCvg8F1VZyLwA3+RtWCKV0klkXaH0MbMO9CiRN6pYO3aGVHeNmx5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOl7FtCF6Z58u7905QjaV+lG2PtFj+Z21Z1Kd+VXr4PrGL9C6g
	q7oGmRhBlmkWre6Lnhpin59VH1OfvgRcgTzQaw9fdGMbiBNj6iBkp1EATy6zvoOp5H4=
X-Gm-Gg: AYBFou3jdXhThxoFFlTdE/pnZVBuLMHuZxWt2Djsp5n0AfHYRuf+TOFcjhpV9siEawE
	507sdrhE6exZb6nEL6EpZOzIXdB1OfIaRYCQNAPs3MaVfeqO2n8k3HNAGiwxeC8O77mtfWs6d6G
	hbGue8uNbBjN5m01iZeA4GpXf5zFvxpUlDgOzh+Jp/EEwHv0X9JaZksl7CEE6HS3oG+u2cZ6UPO
	jGGle0e667XhdSm9CUcghQdLfCGLXyLYKshLscDCUZky/0jDZia349LWbSdXjZkwjihzphLvTy7
	NnmA5Tpq4Cf/qH+qCwoIRkxkxVOa/J0+jBnhjZTEr34iWNOleBUwlqNIbOnetuFUqJBOX1lAgO4
	bC04er6NX2TQTtxlUz7uXtbFx2wEtErnqymoXSdu+h4zngXGeQaCuLRz+xGD8Gtz0F4czmarj0L
	1oA/pdwwtDOPJAt3Tg8gRQ60PhuRcqBh5KoeGrgXsuDuZLMYFk47yH+/RXVcZ1pwq/UpnCo2ETs
	Y9sqI6qs55caqsKjHPDuqIRUW5V5tc5SNMtsJgad26PnYNO86mMJUn+Ea0mcuNxOiWtUSWCpDvQ
	Lu8NZ/cqzvBrJAJwij7GCOQ+nSProIbrZFHdJFNM
X-Received: by 2002:a05:600c:3b2a:b0:4a0:2540:b46 with SMTP id 5b1f17b1804b1-4a18e4aca94mr281842445e9.12.1791969661826;
        Wed, 14 Oct 2026 02:21:01 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm617261045e9.9.2026.10.14.02.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:21:01 -0700 (PDT)
Message-ID: <6ebcb36b-8d0a-43cc-a47a-5b4a8af02833@suse.com>
Date: Wed, 14 Oct 2026 11:20:59 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: module_param: Fix potentially incorrect access
 of `SetOnce<T>`
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: mcgrof@kernel.org, da.gomez@kernel.org, samitolvanen@google.com,
 ojeda@kernel.org, atomlin@atomlin.com, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org, ardalan@uci.edu,
 zhiyunq@cs.ucr.edu, dzueck@uci.edu
References: <cover.1789426258.git.pgovind2@uci.edu>
 <20260923203145.18714-1-pgovind2@uci.edu>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260923203145.18714-1-pgovind2@uci.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 10:31 PM, Priya Bala Govindasamy wrote:
> The `set_param` function casts `kernel_param.arg` to `*const SetOnce<T>`
> But the Rust module macro in rust/macros/module.rs initializes `arg` with
> `#param_name.as_void_ptr()`, and `#param_name` is a `ModuleParamAccess<T>`,
> not a `SetOnce<T>`.
> 
> ModuleParamAccess<T> has default Rust layout but `set_param` accesses its
> first field SetOnce<T> assuming it to be at offset 0. This is not
> guaranteed by Rust and could cause type confusion leading to data
> corruption.
> 
> Fix this by casting `kernel_param.arg` to `ModuleParamAccess<T>` and
> then accessing the `value: SetOnce<T>` field.
> 
> Fixes: 0b08fc292842 ("rust: introduce module_param module")
> Cc: stable@vger.kernel.org
> Reported-by: Dylan Zueck <dzueck@uci.edu>
> Assisted-by: LLM
> Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>

I've queued the patch (v2) on modules-next for v7.4-rc1.

-- 
Thanks,
Petr
