Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57187305698
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329466; cv=none; b=FrbavO3RXrAyvb4Otxc3ukCVx4ppSh85PgvJOnyvhtjOtMBV4ofKVDuzu4VE4tc2QYFNJPHsNyW+GHBcMoBMgHcpBb+knuZqx585aSRHFMAvF1ilacsqepgXiQXgbdBE7j3BNGIQ6OhcVYYurtb1EMV3q36xzipwWArRm0VKE98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329466; c=relaxed/simple;
	bh=15Vb9KdBP3fVDaEzjGo+0nkY11tyVAtY2SbnETseetQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTya1LtZh+CKfYGfwVxdjyXXSNpnbs8Jegi7zHEK8fqfnmbigcSaFRosVFo0lT/JMWQ1l7GVyqjW6JrPZdCzAlEsOqmYbZRAvS9Dymc9kc1oIL5cITaE1lVlgxn4TSpBk8/G12Ypg0vaZL4sfEwjRfo3kgplOAKyKx32oOD6V3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Aro5x5Ml; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Aro5x5Ml"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1381219f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783329456; x=1783934256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLNkro1xxZ0FVFkfbwOoV3dADIchfsZOcflVww3NZ6o=;
        b=Aro5x5MljYFjkHWFyWzMOoaQlQsoEQpRvmnOlZ9EJcDG3us0DT9SziajNnpFLG9rZx
         rZYRo8NTCUy11BCa7mdOc/yUMuKt5x0cW0DN93Arvs+dF5JX07bRyHXy5RHeApOoJETw
         A7P365CxLRVRdQHGVqqgNbEfXxCEagfG4a2umgWLm61Gh6R2067HEu2I6SXirT0s3jw5
         8Ks3qNdmqWvSgFZcpZNCk1atdPs6RCzUbFtB83eRTCwLVHHYKZUcEtdI0ROq76K2DQJL
         +/YI+WhcFVZU1WdkPCjRloN40KMu8snuIqBR9IEatZAGJ25WkrprlziGLT3/iVyyRWmg
         D15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329456; x=1783934256;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLNkro1xxZ0FVFkfbwOoV3dADIchfsZOcflVww3NZ6o=;
        b=aFieAK/qj97XR7u0WJQ4en/YvxfT/kPSdmBxym92BSzVU2w91f5rzR0Cg8A5vY04+V
         wUu+UzPkvgpU/s8BrXTM/9xbPISk5abbeo8WwzqYo28EdH3fNFxSfIdkpPF5eGNBnpXP
         +EDTXmkCslLBneYyucOX3+PWEdg2cJEen1p0JutJyQZU//jYKM3m5uipKzt+XUxXCWup
         cvS6oZ53FLydPrH+HjEsovx5TX6mT7g+g2thNq2rTO6St+At+1KudsAqYR2r7vghIfhQ
         KQoK5YvmzDiGKw8X3wuCtvdjraObJ3b9m4W57BFdoXq/FTPpD8XQwVBZbNrzoRedJ+HS
         /VfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/IJmHn2rMhmgISxIMUK2LVLPUvEMmOmbd2fcB+MeCK6GSARbJ9hMqdvsCnbpFP2VkzxA0YhT8upOm91fbCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykL1vns1t/2km7WBY6L0E3gr9kwDrAqjBkk9ehMuxKQtvJHE9i
	f8MEQ3neAR3lS5H+EYv9Ez9z4Y6R8ggIsPYXCWWZUtPGlsTgiyuRWod+/GQG7UPjDYQ=
X-Gm-Gg: AfdE7ckOpGWoPuS06AmUf2D7wSvZYa7uzrfpiOaMV8tIZRM2v9xW8erMFiO1b69/VfM
	AquQq4YKWibsFzpZrzhk5tBrbGTr5tXYzEcB8p9tdA5QUnJOzewE7XX++0gXHE3qRHkkWjTcHFq
	lmIPYI04ajQIX8saYhy9gsNd47WxgNHXkD92l5vv7HqyUoqoAp0tQAwCOXsgwFwc9VSoV3FxqOQ
	Z+hRgxvO0QNnBAa5DF0CESxHszCi+RSD0yTEB9Ggp9uE/3BEXSARFi/XPqxzq15N7lvmQ6Bywj6
	+ElYTUCnrMHIfx6zdm37fSneC4b6P9yJ1+qSLXpTaiGxGpbhGPgj4zfAiNYEG/MouVe8MNqBwYA
	+ARozUYkrRX7IlT0RTjgaddPinZnbUX1ksAiPR113rJOBCRs2JSWGR5jUQ9oBcai4v0KoMu5uKS
	3HON4KF4nWxqU/wY294FSgzppKme3rP6VM7oJZ1DWY3qKrHVxJRsF3zxm3E2ryHKFE1Q==
X-Received: by 2002:a05:6000:1846:b0:473:cf28:a23d with SMTP id ffacd0b85a97d-47aa9c6ebbemr10691746f8f.25.1783329456532;
        Mon, 06 Jul 2026 02:17:36 -0700 (PDT)
Received: from ?IPV6:2001:a61:136f:7201:4a82:7cef:c61f:a3f3? ([2001:a61:136f:7201:4a82:7cef:c61f:a3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm22257884f8f.28.2026.07.06.02.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:17:36 -0700 (PDT)
Message-ID: <b0d4f87f-4222-45ac-9605-46427ea52fc4@suse.com>
Date: Mon, 6 Jul 2026 11:17:34 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/11] rust: usb: add synchronous bulk transfer
 support
To: Mike Lothian <mike@fireburn.co.uk>, rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
 <20260703030020.2694-2-mike@fireburn.co.uk>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260703030020.2694-2-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.07.26 05:00, Mike Lothian wrote:

[..]
> +    /// [`usb_bulk_msg()`]: https://docs.kernel.org/driver-api/usb/usb.html#c.usb_bulk_msg
> +    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -> Result<usize> {
> +        let mut actual: kernel::ffi::c_int = 0;
> +
> +        // `usb_bulk_msg()` requires a DMA-capable buffer; `data` may live on the
> +        // stack or in `.rodata`, so copy it into a kmalloc'd bounce buffer.
> +        let mut buf = KVec::with_capacity(data.len(), GFP_KERNEL)?;
> +        buf.extend_from_slice(data, GFP_KERNEL)?;

And here is the GFP_KERNEL again. I am afraid I was not clear enough.
I am sorry for that. Let me explain again in great detail and clarity.

Let us assume that you have a device with two interfaces. One is storage
and the other one is driven by a driver written in Rust.

The storage driver experiences an error and runs the error handler.
Eventually the device will be reset. Now, after a reset the device state
will be gone. Both interfaces' drivers need to restore it to the state
the device had before the reset.

Presumably the driver written in Rust would like to use bulk_send()
to restore the device state. It is, however, running in post_reset()

Now you use GFP_KERNEL in post_reset().
Memory allocator wants to write out pages (after all we were already
writing out pages)
Memory allocator finds that an error handler is running. It needs to wait for it.
Error handler needs to wait for the reset (including post_reset() to be done)

We are deadlocked. You cannot just allocate memory in a USB driver. Ever.
You must export the gfp_t. Always. No exceptions.

	Regards
		Oliver

