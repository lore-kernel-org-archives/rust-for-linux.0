Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5226B1757E
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Aug 2024 23:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723419354; cv=none; b=B1CUbVp0mzy3iAoSqiEKBZGvEu9vTzmlW6YRtKgYKM+8/yW8aOGdacLjFz8zgDv+0SY5gXC2KHz3S7ZJlQa0HrqzP5MlMhOGmvLG7dq0oMz0J8rO9dTCjyn7cuBIl7F7PpnoJfb/I5SWt4ADo6aqeza8auJa/bIEbCGGqNA/1vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723419354; c=relaxed/simple;
	bh=yb0ny0zY4VuXPLTCQZNYbnK3oc52429hwYQFgNULx1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VqjddOJwXz7/FyCaDUni9uLHcIOcstB/dxbVmkx33H0Ex6nFtXlQ3mJDsBppoGzcQLmfqgU0Wr9ynbmeN8RmiFZCpJ1dc0fTQoYBU/q6wEsM0KZ3jhJieZAtli1qbdQ1A4JKJxJTW+JlsbclUeeM3hHdpovzZKMmCcRX4JMhLnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VbR1ij9V; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VbR1ij9V"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70d39a836ccso164829b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Aug 2024 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723419352; x=1724024152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hO37jwTmuSgE1Z4eVGpKU3tnYdMedGjB31Oft97scek=;
        b=VbR1ij9VvJ5R1Xp+0Tf+tjuWY9r6cJUsaJ3mU+3cOGpyd/gO5p4JaUOZ2NkDEcINUX
         7XlXByUu6nyNtPM29yVEAIf3B3sXR0IakfKZxiwrmvaeg/9dcEo8QXjNGNtvWCJMS+We
         izk2mXgvfdJjgdt7neJkrQLvIllwO7guC3FH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723419352; x=1724024152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hO37jwTmuSgE1Z4eVGpKU3tnYdMedGjB31Oft97scek=;
        b=bdh3ILhfFG2MLMyWWhBCqND0hyZhzI35UIdu+hJTQGT8u4vvYAkmQKxEP6gTMAOL6P
         EK6sV/xJP1Y1zLHHZcGlr2PAckqFyvM+/bxcMsFfp2Nl9K5zlv/GKVAlbdXA56MN9wOL
         Bd7Eu+O74N93kwDANjz3Iawq/J4IseyOaSEQX8PIaPsnf6q3pcIdpHSfLrt1OIRFaPMn
         ESf85TH0No/cBDSWt4o5oVCrpnOof117DfteyVX4H6uhHb0v1XjFfQc3PQWo2pJ3Yf1D
         bpz6ZenmWZ4yu3v8FXnYnlODTEg5rFR6LhE7w7qM2SjY4fQ0JDcLeRVUzCrELW1tQYNy
         bz5w==
X-Forwarded-Encrypted: i=1; AJvYcCXLbmNwdQBGmrP5/TqAa9XfyxhUJmKpjZKiAx0z5BFujMd5Cwaic7BwF2hBgqq1Te6wPInSI/7U5S6SnFjYzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAY2/2EJCg8wlPIj3pY2ijZSIMJUu6pE5E/yWmDu9hErpuypR
	235nFLGQpCPp3wKFn9E9oN1PLx88XRtLxK/5Cg/DAO8Zbou7PoMpl5DTNw7Psx0=
X-Google-Smtp-Source: AGHT+IED5VVnpv8Jj/o2aNdwI2tSUckratzTwSCTsE+zxtRcpvo79CBOM3dI2QieB5Cx1UViO5mYtg==
X-Received: by 2002:a05:6a00:9149:b0:706:aadc:b0a7 with SMTP id d2e1a72fcca58-710dc687057mr5239855b3a.1.1723419352538;
        Sun, 11 Aug 2024 16:35:52 -0700 (PDT)
Received: from [172.31.140.29] (softbank126051159161.bbtec.net. [126.51.159.161])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a43948sm2840815b3a.122.2024.08.11.16.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Aug 2024 16:35:51 -0700 (PDT)
Message-ID: <de8abe69-3735-4ffc-9cc2-21a167aab44f@linuxfoundation.org>
Date: Sun, 11 Aug 2024 17:35:48 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests: rust: config: disable GCC_PLUGINS
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Anders Roxell <anders.roxell@linaro.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 shuah@kernel.org, rust-for-linux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240802124536.2905797-1-anders.roxell@linaro.org>
 <20240802124536.2905797-2-anders.roxell@linaro.org>
 <CANiq72kb9mDd0xndGFnMQXP4Hg-GE91eQ07yYiQW1HwWv75Qtw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CANiq72kb9mDd0xndGFnMQXP4Hg-GE91eQ07yYiQW1HwWv75Qtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/10/24 04:34, Miguel Ojeda wrote:
> On Fri, Aug 2, 2024 at 2:45 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>>
>> CONFIG_RUST depends on !CONFIG_GCC_PLUGINS. Disable CONFIG_GCC_PLUGINS
>> in rust/config file to make sure it doesn't get enabled.
>>
>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> When https://lore.kernel.org/rust-for-linux/20240731125615.3368813-1-neal@gompa.dev/
> goes in, this could also be relaxed.
> 
> Thanks!
> 
> Cheers,
> Miguel

Applied to linux-kselftest next for Linux 6.12-rc1.

thanks,
-- Shuah
