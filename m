Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A75466B70
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777399607; cv=none; b=phQErDXsnqikz1h1NYgxDBzAmayK8y1pxkHF5ZU8jmvHLdvi//HppRjSOA4TpgCBiyNx84HSJ0alamojoLQlJaZkNVzYr7nGU3hUHSxWdE8b7GA8hecbX7SJLmroNSvYSg/DQR0/wBYrtqlPNTC9ZAEWJ3CeVDA21wmhgU3cdQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777399607; c=relaxed/simple;
	bh=yqjIjtfKgVcLUYBAkjRAo0Q4mwh0fZg0tEEipx5Dfi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQtRS0HcIArfyEQ6HtznBzGbGVgjr0QIWbuGd7ilEwkKjr9MCs+XYXL65mBd5eBG86+blkgzd/MFyKwIuYJErgZ0CwE6ZbYZz2g9W59ANTgFFR3beK0MZOLGCPtEGQredpH8qXKs+j12VKp6HIVFobs1I3+peFpQdByfroBNcw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVsyUazC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVsyUazC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso122058565e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777399603; x=1778004403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yqjIjtfKgVcLUYBAkjRAo0Q4mwh0fZg0tEEipx5Dfi0=;
        b=mVsyUazCkUa+mD+UNyTbb5pBWokKIT9NSdS9Rfh592apXYqnod3e6NosRSLp5I3I3F
         Pd63tvd8u1pyHNpckS4El/PbgtjWE8wXr6XjgeYoCkvvFfdqB5q4eEfSpIqbyFP1zIt8
         /YLF097A4o68V1LOhD3KnAu5E1klszfD5dTl3cZJFsFiAFSqK3lxuk5DzE0R9hzTzsyg
         UDLsZYbMx+X0d/THmic2/+diCNjqjl5NrTaXreogoEHQWJFDKVOlBckdAzn64qvseHQI
         RdDRjn3Fms9bLCjykD4Rua/I5GWxHuy28rUKfDdZxHD6f4KZzjZ9uasai5meqM9K4qU5
         UVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777399603; x=1778004403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqjIjtfKgVcLUYBAkjRAo0Q4mwh0fZg0tEEipx5Dfi0=;
        b=hcmpM8a3L9l69RGmzRfewbf/2T2cFQQIQqjJ+rk3QBoDec3XPqxVmPu1obyMMGTd6H
         CuEQxpJo9BdB5UbW8tRpDjD/I9sqqn015183e2N1y26DBGGpXIgemZQ41c92pXNx6i/j
         bTl0GPyiO9yoJA4h1UOptj0HO4cx8m4N/2sndIWSB0sc2FmERNz/4jjW2rmy5IUaJvyW
         dpY15znxCqqafJZIuoycFfocTllJ8tmsG0RK75aWso2H2qWJBNpjEcMrHOPk/EDeTGHo
         0wDwsYBp5WOr33zNSV8JeQuA7MhAnixnSZpfaqWlE4BAamMpKXcLybT6JYmD7f15ashl
         CdBA==
X-Forwarded-Encrypted: i=1; AFNElJ80PF/ymrFkUs2J7ggt0qKz+dktW2IF04i/wHrHkwgIRLnF+uLjHvTd/3c5xGMx8TpkrqTN1PvPHbnwXQiF0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV6dl6pzUfzuJyUhl3+IMyFEfsBW0ocB3uHpNK5sXBL5NZSG60
	Qru6cmOYWlWj0TN2EereLipBuf2Hq7Armt0huvTMlDacVutDnIdTbXiA
X-Gm-Gg: AeBDiet0w8qKkJVxj3VmAKflQk2CjDoxBfi27uGT3WWYHJnsGUoGmurNyBKOnlv7cZW
	wSSDIDKGKKtZQ6QmTooxWrhA827coKGhDY+JT8TZDEDzqqtZjiiD3jAuud4GDzxsDXmh2qv9c+f
	PJEXM9bQCBAuaVTmrQjOKQcQgxaJd65gZk5oB8mpHLRsrGqur6XmsXSj1AGuqFJOumpr8KyekiY
	7017WJrEX79MnYOSxVDVvSOUFO+HH0jtYM5cGHqnekNDDXX66gZT0PPjRFN6rOuNrn877eyBF5w
	60R3QKICI4Wf5ztYO8g5kwAWeyXqxTSlgVkvwI6GnqTUbhz3cF0hmKRz1/xOOjaPXdx/QBc8CIm
	j3jyeMYXF3IK9gumYz9P9YEKFCIZGoyqiZqrAikTniNJmun/ATbV1lQzjOslKmd0+1/CaH03foO
	xaUvg5TwETW7+aVGYf84uz7fD4B0a+ldFpoob9VNnszBbdUZG+6BAEJYjaTWs4TDp9SG6ZFA==
X-Received: by 2002:a05:600c:859a:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-48a7b5125f3mr9228125e9.5.1777399603012;
        Tue, 28 Apr 2026 11:06:43 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8cf0fesm3192395e9.5.2026.04.28.11.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 11:06:42 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <b5918621-08d2-4ad6-850f-dda18a1e774d@gmail.com>
Date: Tue, 28 Apr 2026 19:06:40 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Jani Nikula <jani.nikula@linux.intel.com>, akpm@linux-foundation.org,
 ljs@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
 nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com>
 <dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 28 Apr 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Oh, I'd really like a check on this part from kconfig-language.rst:
>
> i.e. warn on selecting visible symbols or symbols with
> dependencies.

Hi Jani,

This is very doable in the general case of unconditional
visibility/non-visibility. Handling the more complex case of conditional
prompts will require finishing the SMT model, coming later.

I'll add this check, hopefully for kconfirm v0.8 / RFC 2 :)

Thanks for the inspiration, and let me know if you have any other ideas,
too.

- Julian Braha
