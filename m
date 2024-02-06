Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEDF134CD5
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707235677; cv=none; b=Y9F3VPxCJwbVYOISuVEV++Scc4kHGKYEvvHHYw34bPdi5rmztkvtOPCM2HSE00NOsVdd7m1pihO2xuq7hSWs4MYUol2V2pEEuYcgUQzy/DxS6Bm4uaCao6NfrL5r8gtLbz2v7z6yufW1LgzPeUDPM0UyZzM2Ubk6hiLMtBbUhVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707235677; c=relaxed/simple;
	bh=ZxNXbF7e6hr0zDp9ZXx6bSYDr4mC6+5/OnJRAk1yw5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCNvZ1zapBiUMFP8q/FCcptRKitCSdADMx9O3JdfpPahJdX2IlClcnVlliW0ja45dJ+T0s/InjXbKzIehBje4YWoXu/U9LIU/VWDRMfhuRoNhGChcuSQ40cIcLTEECQDh62DzZmSS/sZIHHloxr4oHNiCxImZvGzkd7szHjeXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqNxT8wA; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqNxT8wA"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59a1896b45eso2535463eaf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 08:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707235672; x=1707840472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxNXbF7e6hr0zDp9ZXx6bSYDr4mC6+5/OnJRAk1yw5M=;
        b=lqNxT8wAYc/i9Rmn0OBwQRGAUxTIMi2YfwgGAHW3MgcK5hI9zcvDWJQJMF7D6VDhbP
         mtYeYRbLdqSs2j14ITmB9tDbuvZkMVieUOio766PNGujVvopEHkt+QwrL0G6grY6KG1s
         rTDj3m+Yi/ogDjQDQdO3MxYHnAjQSiyZNoEMO0ygXPjaqmADr1Uqa8V4omQd4zaRllIj
         FHV9KDI7nkd8e3LyGo7A3WcnExdXGz6n/sa6GN9GWQtxEZX09T6FZo54PTdovpp39md7
         /xUe52uItTbmLh/V1RBDRRPVJXtdxqEIKWfVzyINOckaNw+rOSasoeFL0/VhYA0uL+UO
         SygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707235672; x=1707840472;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxNXbF7e6hr0zDp9ZXx6bSYDr4mC6+5/OnJRAk1yw5M=;
        b=Gn1OWcVdtpqYR+4wBXeVV6h17GS+jnhQOjOIZrV9RMCpzU5mQrTz6djZdR2f5z4+a/
         R/YfhFD7fW/uphSg4Z5Cx2uytwYRwiShRAbBQKlZ1p/x8H1TQVSMJiDtAay+nX6E1fh6
         +cZh+mxJ3F6rub/bMdn5Tva/gUyPpuUZLpWsNhp5h8xzwxsjlCL6Mm5dmRoIfww3Bg75
         u2mwTVLODLXFdNpoa/EMppyXEtC38rNHguhKGMLtXVn5iyQoMa2oa9DdFyS7l8699CDy
         pfGF3va0uIE1q9zdMV/faKoKiqS2FTdDEWB0MD7npQ0V0sUY05V/wZ50WWrpjTjr0Q1o
         Q3hw==
X-Gm-Message-State: AOJu0Yz6vxuWOVHdG2qmWzVSnurg+AKS7ZybxIF/THRV4h91dOdTQOwD
	LpJFGTGA4sNca3SFf7MmTKWcl/rSLiIngThhk7NJ5RhSB2StfWf1
X-Google-Smtp-Source: AGHT+IEkeW9G9eaXFrlcw3l0Gb7JwZs1NbbgFXL85ZyyqPTlpF5/0xyyONjRjuBuipgIoYXgLlJ6IQ==
X-Received: by 2002:a05:6359:4c03:b0:178:8a53:87f with SMTP id kj3-20020a0563594c0300b001788a53087fmr2853407rwc.1.1707235672013;
        Tue, 06 Feb 2024 08:07:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWB7sjqCS8Yf8gR+pLqO+IGF2gid3jCo9GQcjc3g3k4tAwwqQfxezVVO/F8p61PNqMZsrBfI9OptiHEYGgdtpTS0VmQNnoNnCPVJ4UIxW8r26RE1PIPnSmzTdO+HXVsZJLadF5yd6cZU9Vz0831UDho9rrri9vzkp2bWzArNfBxHp5T+ldRv/VTi5DOWYXN26tjDNVFFyXbCzGIDuQgx+fJDkOzlZUBHpTeHc2il63Y/OGs2fw+/hEGT5vQBp2MPvmQZA==
Received: from [192.168.54.105] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id e4-20020a63e004000000b005dc1d18c0c6sm2289685pgh.11.2024.02.06.08.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 08:07:51 -0800 (PST)
Message-ID: <92bd88e8-c585-4046-b787-0e041bb3534e@gmail.com>
Date: Tue, 6 Feb 2024 13:07:48 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: place generated init_module() function in
 .init.text
Content-Language: en-US
To: Thomas Bertschinger <tahbertschinger@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <greg@kroah.com>, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <2024020646-browbeat-cozily-0bf2@gregkh>
 <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>
 <20240206144959.GE296718@fedora-laptop>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20240206144959.GE296718@fedora-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/24 11:49, Thomas Bertschinger wrote:
> [...]
> On that note, does anyone know any examples of modules that call their
> init function more than once? I might go searching myself later to see
> if I can find any, but in case anyone knows any off-hand. If there are
> real use cases for this, it could be good to consider those here.

Un/loading modules using `modprobe` to do troubleshooting per the
manpage on the `-r` flag, although that case is very rare by itself. I
don't know of any other case besides it.
