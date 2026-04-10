Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AF18A93F
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823096; cv=none; b=ctZJ9weBr+kYivsJL1VnkiBL+DN4krt25L3zXKQFLkXtBmvHv+cl6mPp2xXpP9LhPSVDLdY/09y6gQxVZDK/eUJjDPAVwq6BwR6G0CR5gkh6YYWuEjUV4TPFZ+jIYz53y7GOtVDTnklmjX63GOeqUSJJCkHCPXeZrvZAslBbcq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823096; c=relaxed/simple;
	bh=FztPS0UQeubSwIKvX1X4/qNcd1K+zFW3IouJYfHQRog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jg4nWdSAbc73/aE5rKIf9sn8AeJwyp0P3/tBKcFNsJV37XlM/mPGQmhuCF4rlRnM/vePfI9W7ybOsJKndGMmlAGVNSAEd9b439oNVNkRxOELFLOI2F8DvVAK4D2zQe/v8wz/eaShZ7lDTQz/zRZY5vEjmGH4m7TUlBojwsJ+rrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r21uG3S8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r21uG3S8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-827270d50d4so1854409b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775823095; x=1776427895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3f2VGjlp0zrHnZkKgCfeyqB8lCSoeEC0x2mfrr6vdc=;
        b=r21uG3S8Yf7GKA6puyKNqqobrXby2ZuX6NemgfXzB/uiZneB8KZ/m4kHNZDcTClDn9
         x9LrVgxach9F3J0yyJXFwiAfBpgTF+iwEeylsYiUjKIpVKVXs7Aqw5ePjB8pxKuMwtmU
         I3qLozhvF1PJvIlb1xVCPWf+JcPCcKv7sm6rrCQcEm9J4RIY5LSlIUT41E2d8sisRLMF
         aB+kIk0kH8Vu3FrY5/RFCyqlo3GgQ/smcvENWsFCkop6oQCQexcuJlhdXOW6XL1ttXMP
         uopLmO4L4TcpyrhMYwx9FDKxfo1CYC5S3NDDgc6o7d5rEo0B5Nd5xJ1npAAP8W+5IJKr
         pqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823095; x=1776427895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3f2VGjlp0zrHnZkKgCfeyqB8lCSoeEC0x2mfrr6vdc=;
        b=MS09VtdkY025hQvZEyndqu2NVRunwzImtub2kS4BW4gSxpLwSshbTz1lPv/4PvbnJb
         hubyWm9MfPpGFcs+xcpVz9s+Ivh5upU3S8GJmgs4v4u4Fd5IhVE/nFjS5AuMwReM+O69
         Tl7euorRYr2SS5cXches0nL8oqOrotqhOKtMls+PBI8b8jGh6f+rzMjqu7YbrcY4juvk
         BDcI0EPP9c/6Ed4fam1FgpNnvGWn8wMpvG2oCH64Wg9YsAt+3Sw2b7QuHQSi+G0ZT8Vi
         yil5Sl5S2dWrYA1wEYDGtpYXVNtTdGkzSTWkG39YZ8HFtNNdiTzbpw/qr3WBBWmSryqp
         JEmw==
X-Forwarded-Encrypted: i=1; AJvYcCWmc8TiDfqZu3W8Pg8pe/hvZ3BtkPrkuv7R5e/h2hNOIFVoQqn/2dl3cMcAROHlbyq/qJnueznhC/OmGVV7IA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9eAtawKybaeqkg5C6CQ7BJ73BTjrh5BpR8jaZMa5nbq9j9ABc
	ilC8ikWWza81nr0PT3wqQmRTLeq5TeD2rr6QA/8U0z5N/wsaK3rlL1Zk
X-Gm-Gg: AeBDieu56aDQk89LuyI4VnIjK1TPtefjbeNRngPEOE/g4OPxaqmDvg2bkM7DxV3Yr6s
	gvDfwUSLK/6gAjermtp09JgSze7RhWrmvkD7RTChhKlYo6W/b/Hq+/xNaX6pyMXVBLNgUgAbIW0
	VNz0PgYyHdz80Ssiw5OY1++Q8PXJxRyVQ9KATFU++5ernd1IDxjiQGdE4F0xSXCFFsmR3Lp+gQx
	hZHZPDEv+YIay+i0XTyV5ri3yovdZ0LBCnPO7wPqrij5US7Gphal2RvZSIKiVmeIxa5Qe4cyGUB
	+5ojBBSvOPs38qGnQRKcNl+oK92l8T5I+uz0gvvBBAFCe4G67p4Np4dwhGSEDJZQDl9+EpENe85
	BrM1pL35K3eAC3+4RiT+8Ld/KVGn6/wAL6Hp1mVifSbszzzaZNIFFF7n5m3pRna76PPpfeOg+ku
	wPSYTMEfabdewjwvpjk5AZs46+KEwWoDLO1WUjlJxYFIXRwy7khH+YnKkeU0xODw==
X-Received: by 2002:a05:6a00:228c:b0:82a:7893:e14f with SMTP id d2e1a72fcca58-82f0c351427mr3915362b3a.41.1775823095134;
        Fri, 10 Apr 2026 05:11:35 -0700 (PDT)
Received: from ?IPV6:240e:38b:d99:bc01:ecae:8cfc:4adc:6bc? ([240e:38b:d99:bc01:ecae:8cfc:4adc:6bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30f5c3sm2714637b3a.3.2026.04.10.05.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 05:11:34 -0700 (PDT)
Message-ID: <d357e76d-87c3-4570-a8c3-10b1d8f478ff@gmail.com>
Date: Fri, 10 Apr 2026 20:11:28 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] docs/zh_CN: update rust/ subsystem translations
To: Ben Guo <ben.guo@openatom.club>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, hust-os-kernel-patches@googlegroups.com
References: <cover.1775786987.git.ben.guo@openatom.club>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <cover.1775786987.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Applied, Thanks!

On 2026/4/10 10:41, Ben Guo wrote:
> Update Chinese translations for the Rust subsystem documentation,
> syncing with the latest upstream changes.
> 
> - arch-support.rst: add ARM (ARMv7) support, update RISC-V and UM notes
> - coding-guidelines.rst: add imports formatting, private item docs,
>    C FFI types, and Lints sections
> - quick-start.rst: add distro-specific install instructions, update
>    rustc/bindgen sections, remove cargo section
> - index.rst: remove experimental notice and genindex
> 
> Changes in v2:
> - Add Reviewed-by from Gary Guo
> 
> Ben Guo (4):
>    docs/zh_CN: update rust/arch-support.rst translation
>    docs/zh_CN: update rust/coding-guidelines.rst translation
>    docs/zh_CN: update rust/quick-start.rst translation
>    docs/zh_CN: update rust/index.rst translation
> 
>   .../translations/zh_CN/rust/arch-support.rst  |   9 +-
>   .../zh_CN/rust/coding-guidelines.rst          | 262 +++++++++++++++++-
>   .../translations/zh_CN/rust/index.rst         |  17 --
>   .../translations/zh_CN/rust/quick-start.rst   | 190 ++++++++++---
>   4 files changed, 401 insertions(+), 77 deletions(-)
> 
> -- 2.53.0

