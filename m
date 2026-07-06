Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732AC44BCAA
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331273; cv=none; b=PQpmYHtm9btXIL/5E9jgti1ZyB310QkzIeuRTAJGNriZ4nl7wWc6RV8BYkbnP16Q9UEsn8hjrK7c+9R5oJSieIc89pJCmB/1i88nRtcFf2STUM6QIye5yZxJFH7cB23kkMKT13Ex9by6iDyPExMSoeVUb1k55ofngaXi9iN1HK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331273; c=relaxed/simple;
	bh=D2BNJPxvq5thXA3AEMfHup29jkERlBHJxKYnRI3a8uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVk/pC2mo7teFXwRP5E9OnJ/8r8tc2s7qyeeaQvTnSaWq1ReLmRhZ7600h1NhvKN/X5PddWhg05imu5t2y6kk0LxryCKVOEgjfdrtPqsdbzGXahBC8kgP+HrG6yLvJAXViYciuxzA08NE9iEs9GtjC2Uus7YxZjeyhXs0vZXVZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FkzL7q9p; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FkzL7q9p"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b779003fso13716305e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783331266; x=1783936066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hhuJuMJe9nSKrMMzfJ8+GyPLHWWUVbJ5xDdEwOzMhg=;
        b=FkzL7q9pCclLkErL25OIB8+uIJOo85bbjUoGfDi7qYVf5D+Y5+CYK/8vWtxkkEJnIO
         0WgVNoNxWPNNaWTq09nIoyT7YuYrMu/PxMeRVoa2r1RTqpMigmcr/6HTyxKy/SFJUsXF
         Mc4hxGo90HwESHIPaf5fvs3g7gycwZ1BXYJMfdjLCAKy4p1zsRaMMV46oNFpwScujsJy
         K3xdcGM3XiaX/YLJkq8r8NNevb97GS+yYIddc9IoVaAZ7Wkln0YblyZwv2ntPfBO0Lpt
         tjNhbb3GofaQknRly6AdvZwAfeHv0W8DopcOPaP+tmuNAMi7A53cr7ius3vtjYhvyzVe
         eTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331266; x=1783936066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hhuJuMJe9nSKrMMzfJ8+GyPLHWWUVbJ5xDdEwOzMhg=;
        b=QNLB8Ik+VhZ37xSu51b8U5dbRP0rGPfntT970uLu6jsl/tHLyGTeQugp2592OeJfR8
         8DPfJYTAAdmkrBxVqxiH6HOrNRBJzkORHNwXl2/v3HN5+KOskqX3Ubm+ydKAoJIX9+bW
         uKiWV8wjJ/t4t4Cb/YM7QlZX0U7qQed04o5JH+yTRuAuWJ+XWOmH4z8+g5OiCO5Yk5dI
         k8w3AERGeqyjqJzvThA9XN/J/YtPOyAbDq7hpewpkA/ATeciPL0bh1RrEsNkDV+9Yepl
         uyHX58Iop+MNgsP1Abywaa+EoIEnoeGFGzpgsORBPihTzJKzJ304I0TI0Ief/clhFFj7
         kt7A==
X-Forwarded-Encrypted: i=1; AHgh+RrjAe9C9eDuQcwj4QNl5s14MR9erQq5ZpzMfF2P4W8aTrwM7LjLx+T85sXbUH/AgcuPrHU0BIrUvlNJGoG4KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqOO7vm/X5vkeCR0gP01MKpNeutARNqrTUok2ZEHgNybfiv/hv
	ToQq8KOB/iGAjUGaSOK7eOY6mf+RQDXsz+t5kjUJQfbTyQnvt/aChg85WWnTGQtWvOg=
X-Gm-Gg: AfdE7cnmik7DyJYvq7wrIlicSbmUQ4ku+VSyfflSMTmOaRw08LzErmLSflOu4Sn14Ae
	ADXFX7b+Sg/4Y2vHIDQ1Qzw5FsLK8EGg9e6cORm5b0G2hNoMP3OFOIjGLZxJCFT0rjXjGkbEby3
	SsyfvU/fQYsoOONVQ/Ly8MPXJJ+XP/rP0Sd/wdx1XzSk078YnBfvXgrSMYXbOPbaiux0PNmpidJ
	E+qeh2bIaabeHdCj5MIVGLmx397noaCzpHnS6MCd9ItIWJ+4kjdyxhRrzNvAwClFSL/nQHLmmF1
	pZI55tB8pYwUMb1MqYau0laS7QNujKww7BtkmIhyEd4YVIFON/k8jcrUimInPqArIj10VtIo9nZ
	JWJxRrrLbdtcau3vVVw0RnAp972CHwot5HJpoioL7sEjaJ1PzoSNDozar40vPaxHO+cKlpawj/e
	B7bQUF2fiorFjpPzko/U6NbOvVRZ+3OvngwLMMHVk27W/9iIpFMzRj5Qc=
X-Received: by 2002:a05:600c:8b6e:b0:492:66fb:5dc5 with SMTP id 5b1f17b1804b1-493d11f326fmr107259495e9.24.1783331266628;
        Mon, 06 Jul 2026 02:47:46 -0700 (PDT)
Received: from ?IPV6:2001:a61:136f:7201:4a82:7cef:c61f:a3f3? ([2001:a61:136f:7201:4a82:7cef:c61f:a3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm253380765e9.4.2026.07.06.02.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:47:46 -0700 (PDT)
Message-ID: <d53a6525-55bd-495d-91eb-4537f804a74c@suse.com>
Date: Mon, 6 Jul 2026 11:47:45 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 11/11] rust: usb: let drivers choose the transfer
 allocation flags
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
 <20260703030020.2694-12-mike@fireburn.co.uk>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260703030020.2694-12-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.07.26 05:00, Mike Lothian wrote:
> Oliver Neukum review of the synchronous transfer bindings: a USB driver must be able to
> specify GFP_KERNEL vs GFP_NOIO/GFP_NOFS (USB shares error handling and power management
> across a device's interfaces, so allocations on reset/resume/error paths must not recurse
> into I/O). Thread a `gfp: Flags` parameter through bulk_send/bulk_recv/interrupt_recv/
> control_send/control_recv (both the Interface wrappers and the Device impls) instead of
> hardcoding GFP_KERNEL.

Sorry,  I did not read this befor replying to teh first patch.

	REgards
		Oliver

